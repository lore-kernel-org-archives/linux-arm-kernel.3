Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01B2106FD80
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 05:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tj1vQp/OZqFigt0p+7kevEE400SH3+d2YJ4SVBK5lwo=; b=XDMI8sPJJqTWTMW1Eh9Ny7peqb
	66CWqE+7tyrdbf8GbFrMGmtC5l6NTuxmgXUuhsu+RASD2YqvPpQASXfj6QG4x3LBbChHsZhMkbKEL
	gk+Gor3uPPg5J/Tv/syK5XiFjs6Xi6B3cWCj+9aC1elMiI9GLipyhWhowA5zQsEcdDRCebRQd3/PX
	SEtWtjbAkhT9N+UqbKkiIVQBzD0CgcEhcndZ3oyROOP+5Frye9NgWAcRSKFX7u57f02SkOqXX2rCq
	asOz8xujytduUJ4k8OqPEcyx7MAtqMa3Ktb0dr36MHhdCpZIkweIb4Ik+QvRY8g+Vi3tWr1F/mJjd
	61tdZQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0v4I-0000000GeHw-2ttd;
	Fri, 13 Mar 2026 05:28:14 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0v4G-0000000GeEs-1If9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 05:28:13 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Mar
 2026 13:27:57 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 13:27:57 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Fri, 13 Mar 2026 13:27:57 +0800
Subject: [PATCH 2/2] mmc: sdhci-of-aspeed: Add ast2700 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
References: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
In-Reply-To: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Andrew Jeffery <andrew@aj.id.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773379677; l=1605;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=hRhcm7i6Ipu+U8ypFOSg4nwRS0+xKrmtHEwCMOzK03U=;
 b=+CWnn9LIycIPd3L9+5pOLuYnU8iouEreNTfMj0wiRQr+N0l2JHaHUTeKm+G/aSNdNmiUtEa/o
 T8y8ZEVTBEqD8KG2ovwz7ONlHR17cotJYowKSXpJxzY+ZQwvUj2CbSq
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222812_349910_45786E6A 
X-CRM114-Status: GOOD (  11.24  )
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

Add support for the AST2700 SOC in the sd controller driver. AST2700 sd
controller requires an reset line, so hook up the optional reset control
and deassert it during probe.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index ca97b01996b1..91c36245e506 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -520,6 +520,7 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 
 {
 	struct device_node *parent, *child;
+	struct reset_control *reset;
 	struct aspeed_sdc *sdc;
 	int ret;
 
@@ -529,6 +530,15 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&sdc->lock);
 
+	reset = reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+				     "unable to acquire reset\n");
+	ret = reset_control_deassert(sdc->rst);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "reset deassert failed\n");
+
 	sdc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(sdc->clk))
 		return PTR_ERR(sdc->clk);
@@ -577,6 +587,7 @@ static const struct of_device_id aspeed_sdc_of_match[] = {
 	{ .compatible = "aspeed,ast2400-sd-controller", },
 	{ .compatible = "aspeed,ast2500-sd-controller", },
 	{ .compatible = "aspeed,ast2600-sd-controller", },
+	{ .compatible = "aspeed,ast2700-sd-controller", },
 	{ }
 };
 

-- 
2.34.1


