Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE2BCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUM7KVMsr4BAMTAuuXRLDklY5hm0+wWJ4qmOeDP69Qc=; b=kmWwf5NDEqsOXVlhtIpvK1xpQ0
	5K0fMOD4gUYXPrQBLUq2xnPe19+nds3aXBRM4vI2WjBhZaR40/fomIt8iPOmFtZNrRsKQUN9lUuw4
	ebu+5Y07J8gCdCq4i9Svz5ZEq++8zXRUtQGCyf+eDwqLtabDFiY39bGqlVr9cY2TOpJ2kS3zqOyEK
	/1YJQE7Tjz8yV8ZGSKQK9Kmqi3isSMHzbIYJEh8maV1MrgS6HSwq/lsFeuIwmr2Yk1BzxK71a7Mwq
	7Ht88SRIDhwxKu11F5JTcSWDdbt+EKrdjLqIM3yzWg1VBKJGTVHY2Su07H3MLwRlRE5Oxg9qkcMzT
	L3iUicsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uup4F-00000007Jhc-3oTH;
	Sat, 06 Sep 2025 09:18:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuovr-00000007HQf-43ip
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 09:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A5FF43C58;
	Sat,  6 Sep 2025 09:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31934C4CEE7;
	Sat,  6 Sep 2025 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757149803;
	bh=pSNaD3syxyAkp0oDtLOoghbbuLA05KsJaZn/Ggv/oP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sIqnrFE+V5sSoLhGvf63EJsJQ4sFaV9HrAMbCzZufeFudIhg8FpopUUV55yCPxnAa
	 XI10q7gDIf2BmXGLaPlH5fy0nwBf8g540IgDQC5diMOh9TsGDhOwsvTt9df1vBr3kt
	 ZbJHelzGBH+P8zr0uVXeaj/ym+ZNk15TOb5EGLHv9H+wVC6W+zT6ZsvgyqDe6+kLLw
	 SUjJ291vQRNqTgGrN9QKKK2yNjTAO0QaHvlhXe2xDVdcxnO1pKWL6rXJMEfuWBHeGa
	 PIeRKooJITwMWhvZu1R+lZKzYobCrLXYon1OPNA1QEd8962N39wzvRxjik3wtLzBj2
	 7zOFxa+3w/Irw==
From: Andreas Kemnade <akemnade@kernel.org>
Date: Sat, 06 Sep 2025 11:09:13 +0200
Subject: [PATCH 2/4] regulator: sy7636a: fix lifecycle of power good gpio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-sy7636-rsrc-v1-2-e2886a9763a7@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
In-Reply-To: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=pSNaD3syxyAkp0oDtLOoghbbuLA05KsJaZn/Ggv/oP4=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBm7fwWK56ua/g/9yiC7ZtoOJ/YFupcWsWl0fAz7sNnj5
 7QrOpNOdJSyMIhxMMiKKbL8slZw+6TyLDd4aoQ9zBxWJpAhDFycAjCR/eKMDH0tLwL0hcxZD6gy
 FfxW2rXypqL61DIBh4jYY1skLjD8tWT4H8e/5VKNO3P1myMFlqvyw4SSGmbdb42OnLJrUtXzg7y
 ZzAA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_021004_035801_DDB1D492 
X-CRM114-Status: GOOD (  12.03  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Attach the power good gpio to the regulator device devres instead of the
parent device to fix problems if probe is run multiple times
(rmmod/insmod or some deferral).

Fixes: 8c485bedfb785 ("regulator: sy7636a: Initial commit")
Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
 drivers/regulator/sy7636a-regulator.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index d1e7ba1fb3e1a..27e3d939b7bb9 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -83,9 +83,11 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -EPROBE_DEFER;
 
-	gdp = devm_gpiod_get(pdev->dev.parent, "epd-pwr-good", GPIOD_IN);
+	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
+
+	gdp = devm_gpiod_get(&pdev->dev, "epd-pwr-good", GPIOD_IN);
 	if (IS_ERR(gdp)) {
-		dev_err(pdev->dev.parent, "Power good GPIO fault %ld\n", PTR_ERR(gdp));
+		dev_err(&pdev->dev, "Power good GPIO fault %ld\n", PTR_ERR(gdp));
 		return PTR_ERR(gdp);
 	}
 
@@ -105,7 +107,6 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 	}
 
 	config.dev = &pdev->dev;
-	config.dev->of_node = pdev->dev.parent->of_node;
 	config.regmap = regmap;
 
 	rdev = devm_regulator_register(&pdev->dev, &desc, &config);

-- 
2.39.5


