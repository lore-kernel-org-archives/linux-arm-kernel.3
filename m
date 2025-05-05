Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1ACC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szY1qPR0mAMQS+/vIbCOlpL8qVb4nZJRPF+TkS3U+Is=; b=PwvYAiSSrdxCpquGVDRDs805+a
	qoBfzAc1q0IPllrnefCKw5l+wXSL+vAmmPI4PRn5ci5OvIWeAyUghdmACPX44GKxf7/ZaYx6ta/To
	8MITZwz3bZNKHLPZgxQBd294+T7C2nquiDNUU9W7dyyimAQrXv59mEMftRWNics/VuwPYNS6ZGqpJ
	rB6Hw8aLfJaX6F6KBcSJ+0rToZLE62ou+eD3hze0CN5TO9H5SEcBfTuBLqmHhRlXj0q9xfpf2AISY
	K9DRF04bEiw9WJLF+rVORYh+dIjCGXSFpvTAGOKp6vqswgyvaExuEizgoujRRHI0RvdeGObcZjyUw
	iSZ5KnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8oE-00000009wir-2xem;
	Tue, 06 May 2025 03:17:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4pv-00000008wJx-1sGw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:03:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A2F9A4D2CF;
	Mon,  5 May 2025 22:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E69C4CEE4;
	Mon,  5 May 2025 23:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486178;
	bh=YF4sqYUsi/wUGYdPp1hwG53Z8+TWL3CmgslUzgxjWwc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h5EumBaVcd3F2WTnvQQ4G1OkjH3isWLmfXhAXk6rh1NE8UTxpifDY8D9EpFfdrv5o
	 QZ1JuLgyKC5RbS6xeaxL+rDna2UZGhVMZFphryNc0uukLycmFxSy32Pidxa8TlWlZ7
	 r4OnjJtR0DBWtlsvn+sBV3C+rL5mg8rY2EoXo4yGL70y4AJc7pYcD+0RjQ1H8pqXiO
	 P9cMxktrpOpbnMurEVRKhk4DZKKaYvyCZ08R4Op69QVEdhg5ysLaupMSdg1nj9Jou6
	 XyOSBG8xZ0DWOaeBYTUzBypmLzChdYAszDfYRTXcDa2+1HN+Df/BXMmOU+j2zWTNpY
	 1c3w971Fthmrg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	shengjiu.wang@nxp.com,
	dario.binacchi@amarulasolutions.com,
	peng.fan@nxp.com,
	michael@amarulasolutions.com,
	krzysztof.kozlowski@linaro.org,
	joe@pf.is.s.u-tokyo.ac.jp,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 188/294] pmdomain: imx: gpcv2: use proper helper for property detection
Date: Mon,  5 May 2025 18:54:48 -0400
Message-Id: <20250505225634.2688578-188-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_160259_560497_5F387F5A 
X-CRM114-Status: GOOD (  11.99  )
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

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

[ Upstream commit 6568cb40e73163fa25e2779f7234b169b2e1a32e ]

Starting with commit c141ecc3cecd7 ("of: Warn when of_property_read_bool()
is used on non-boolean properties"), probing the gpcv2 device on i.MX8M
SoCs leads to warnings when LOCKDEP is enabled.

Fix this by checking property presence with of_property_present as
intended.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Link: https://lore.kernel.org/r/20250218-gpcv2-of-property-present-v1-1-3bb1a9789654@pengutronix.de
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pmdomain/imx/gpcv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 13fce2b134f60..84d68c805cac8 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1350,7 +1350,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 	}
 
 	if (IS_ENABLED(CONFIG_LOCKDEP) &&
-	    of_property_read_bool(domain->dev->of_node, "power-domains"))
+	    of_property_present(domain->dev->of_node, "power-domains"))
 		lockdep_set_subclass(&domain->genpd.mlock, 1);
 
 	ret = of_genpd_add_provider_simple(domain->dev->of_node,
-- 
2.39.5


