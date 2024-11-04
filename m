Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BD6D1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sUHugU/OxZQzs/Mf/lOjRaV3OXwZH7B48EUtuFR2e4o=; b=JeL6pt1lDl2+3M67Q+UcZD8BV0
	MQH8zV56tohYAZPqeT0DqKUzjg289Ciayc/TPDKNktNRFLLYEvyNpw+HMXmC5/eS7bpjTdYs1OOz4
	Gkss6Bp/3Sfl6OLzfSCaN2tqzlUkME3SAV0rIP68iGS5A4Kp41buL0V9jcYYB+T2SFI1biCLG1tHI
	rUO9Mmz2EuCQWCB0P8OENUdqg2PAp9zg16feGh1VYwJ8G77Rj/NzOrLFrz2snEEaZMgRr+1MoL2I8
	0UmbqLNLOh/04HWVmRBJH45YfGlJjhQhRMYGlESkhB1nRg5xtY1Mt3NfE787E6UVjy9+OUlX6wNhi
	0008zh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82ZW-0000000EsGr-3pkT;
	Mon, 04 Nov 2024 19:17:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Pw-0000000EquV-46s8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:07:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9C105C5489;
	Mon,  4 Nov 2024 19:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1DCC4CECE;
	Mon,  4 Nov 2024 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747232;
	bh=GpppFndmxOiMWcsj4cKxdFdIF2ODqAfHC96A/9l0Ga4=;
	h=From:To:Cc:Subject:Date:From;
	b=OEHxkBXJGNeLH3YX6LKaxeQhDMJ+EUjYKIR+lrLbq5gmRMES/xm+GJXWrhF1MaT7C
	 KIcs18j1Uq8G/xp8uSsf13UWuxmHhtFxoDmcXl8xNexu/2U5zSTgSqKkEimTEKR8XD
	 F3AIWCCB1fPS690o2sHYPFB0/1G6yEXuY/TY+OOkQWV9uOm9GjyKpU6ABgXB7vsIA+
	 pZjoYEkJksasKivOPSnMU2m1+0VwSLDOrSBOYHcudIDMnS7vKjJCBEDFTkSlLqd9xO
	 FrRItjUDWlaic/7GAL0EmnW8sU2pbnOTDAIhbGjVzFZTvmuOJp+MEjvf7SkAJwq7c/
	 CJW1cvlwhDT1Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mmc: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:07:06 -0600
Message-ID: <20241104190707.275758-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110713_079114_35D1DBD9 
X-CRM114-Status: GOOD (  12.12  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/mmc/host/mxcmmc.c          | 6 +++---
 drivers/mmc/host/sdhci-esdhc-imx.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index 1edf65291354..dcb1a7336029 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -1048,9 +1048,9 @@ static int mxcmci_probe(struct platform_device *pdev)
 
 	if (pdata)
 		dat3_card_detect = pdata->dat3_card_detect;
-	else if (mmc_card_is_removable(mmc)
-			&& !of_property_read_bool(pdev->dev.of_node, "cd-gpios"))
-		dat3_card_detect = true;
+	else
+		dat3_card_detect = mmc_card_is_removable(mmc) &&
+			!of_property_present(pdev->dev.of_node, "cd-gpios");
 
 	ret = mmc_regulator_get_supply(mmc);
 	if (ret)
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 8f0bc6dca2b0..cda1872769e0 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1629,7 +1629,7 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
 	 * Retrieveing and requesting the actual WP GPIO will happen
 	 * in the call to mmc_of_parse().
 	 */
-	if (of_property_read_bool(np, "wp-gpios"))
+	if (of_property_present(np, "wp-gpios"))
 		boarddata->wp_type = ESDHC_WP_GPIO;
 
 	of_property_read_u32(np, "fsl,tuning-step", &boarddata->tuning_step);
-- 
2.45.2


