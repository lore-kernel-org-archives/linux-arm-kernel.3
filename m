Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B050CC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZlwpIBPu1P89TNsqQjaQwwNOwTKaGY+iAnuCror2mA=; b=0JOw779BTIaJ+woYHJAFUEfqB4
	1ktJwvyu5lxOiDZ+Pm1WZOoSp2P8kEdx49TqRm1NYDT113x3p7zPCx9CbQJEZwLmaxff41+UnhjoQ
	SHk4XKu5VEXoFKdM4RgH+1Vgx5ualPMwj38K+/U+OOy4eQZOibAbL5WrZNg9ZAW2kiFRmoRvTXhoG
	ftv+4kMheGvd7V8w1Gwl1TztxKbbfr2CYo6lrhpPU7IbFaOQkNE8A1fvL3NEgKR1KN131FvU1WmfO
	F4LMIijUCa7QARIXFRj+fX/hdvEFlRiLEz4ADHsN04oSzNechYUeFrABdNQ71muGZhEAPzTMXP60O
	fIa5ArkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7ZS-0000000DiM2-3C77;
	Fri, 25 Sep 2026 15:10:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7ZN-0000000DiKT-3GtG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:10:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B4D59C653F5;
	Fri, 25 Sep 2026 15:11:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA9F96073B;
	Fri, 25 Sep 2026 15:10:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1C87102F1E15;
	Fri, 25 Sep 2026 17:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790349029; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aZlwpIBPu1P89TNsqQjaQwwNOwTKaGY+iAnuCror2mA=;
	b=ZeXKhXgT6iOJMKyTbB/Gdhbj2bC1yZUF3sMS1UmMyMFCcA2Svf4Xp6MAfYz607XF4Lo4SK
	gNNPzXcZf+QfCix0xBTnnG7985J5ETNuWkbJoc9w6OUvS/i1jA/sxvacA6UcgeOA0bHosI
	eCjwKi7wbBDaNT9hKcdir837qfslDfTPAwlmlExK6i5mJ+UniPbYcv6KuZrhj5wb/YqXIw
	4n3U+vy9csXO1o3N7oMYRnAEGSpxgrSUQFQ9CUCb78qbCDMHdfOSVXDqL93qXXgvy2i1oi
	MJIV76JJRGrBlyssINbnp35UySUE0xlHtXPkdmA/DIx7FQPh/cWGw2W+pfBCZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 25 Sep 2026 17:10:11 +0200
Subject: [PATCH v4 1/6] clk: nuvoton: ma35d1: Keep the clock count in the
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-perso-ma35d1-upstream-clk-v4-1-f3697553391f@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081037_986274_8149279C 
X-CRM114-Status: GOOD (  13.44  )
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

The number of clocks is not a binding since this is a value that can
change. As such, in order to support the missing watchdog clocks and
allow the deprecation and removal of CLK_MAX_IDX from the bindings, we
need to switch to a local definition first.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 9f65d0623517..6aa42a3e1be3 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -17,6 +17,7 @@
 static DEFINE_SPINLOCK(ma35d1_lock);
 
 #define PLL_MAX_NUM		5
+#define	MA35D1_CLK_COUNT	236
 
 /* Clock Control Registers Offset */
 #define REG_CLK_PWRCTL		0x00
@@ -467,12 +468,12 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	int ret;
 
 	ma35d1_hw_data = devm_kzalloc(dev,
-				      struct_size(ma35d1_hw_data, hws, CLK_MAX_IDX),
+				      struct_size(ma35d1_hw_data, hws, MA35D1_CLK_COUNT),
 				      GFP_KERNEL);
 	if (!ma35d1_hw_data)
 		return -ENOMEM;
 
-	ma35d1_hw_data->num = CLK_MAX_IDX;
+	ma35d1_hw_data->num = MA35D1_CLK_COUNT;
 	hws = ma35d1_hw_data->hws;
 
 	clk_base = devm_platform_ioremap_resource(pdev, 0);

-- 
2.55.0


