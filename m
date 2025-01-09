Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEE9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kjY+GFJy9JBLB6ZEF1Tt6lwyGESPUP28uF4eCatAoFA=; b=SN0wW2Z+hAaplO8qozHuBX9Exp
	jaBTC/p1Q8C0t4CXaCElVJ38KXAqxt6HQsPV6ONfIOuUkOngN4yAyr6qspxSq8WCEFIq8ed8rUU/f
	ZQH8meNiDT9zRP7OSGi2fgxykaOQxbV8Xftr1P7bwnBDP1OV9qcAflj2gAaiSnv6p52XCMfvXWzR+
	IkcdXZmMHqrmSSFB4n58SvffsBSxy8tLjCt7VBJrgbuE7+WP4oV8q3BZMFCx8njIBTL92gke8hlhD
	6Vp82RorxoDBz11OisVDLl12sdz1zfYxI+pFaAA/I5f3fRB/vw3IHjFiIBGDYcOj9kTkc+Ax82zPE
	fOKvRmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVusl-0000000CZ3k-0lpp;
	Thu, 09 Jan 2025 15:55:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuqI-0000000CYUh-2njc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64A86A420B8;
	Thu,  9 Jan 2025 15:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636D8C4CED6;
	Thu,  9 Jan 2025 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736437985;
	bh=Gr2UZqhGaCcBNCEFnPWcGvmfKjnT3yqrVaJPosur4RM=;
	h=From:To:Cc:Subject:Date:From;
	b=ZKig11aMgs7dsX0OWshpoo/MsIIELNzaQGd8dcn4nX374inTFKyBUe0W6WG9T3MtJ
	 agtZZSTzZ12moIqTepiuq0tjDdF18w4qfXP7DVl/ro+Tq7y/XEdfI9sPLEEArz+UU6
	 Avx+57p8zuKqXas7oQvNe8AM4gJHnqrtTfPNwkjIlLO/KbR2r0zs6dkqyNuWr0q6f0
	 sKmfP1+UXEWCN0zWUWmWD40fzCoskDiXT8QKGNsBzKACZIsmR1s8xK8mkYIBcAuMWW
	 UVhE3LbZFhUTCLqYhZqKbmEHbNYmD+Wk4eJw50pTGj6zHc9TImWeAgXn+tD61t4Gss
	 vk1AMVvq8Ik9A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Dragan Simic <dsimic@manjaro.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] mmc: Use of_property_present() for non-boolean properties
Date: Thu,  9 Jan 2025 09:52:54 -0600
Message-ID: <20250109155255.3438450-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_075306_767666_7727C07A 
X-CRM114-Status: GOOD (  13.28  )
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

Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Drop initialization of dat3_card_detect
 - Rebase on next-20250109
---
 drivers/mmc/host/mxcmmc.c          | 8 ++++----
 drivers/mmc/host/sdhci-esdhc-imx.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index e7a286c3216f..0a9affd12532 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -995,7 +995,7 @@ static int mxcmci_probe(struct platform_device *pdev)
 	struct mxcmci_host *host;
 	struct resource *res;
 	int ret = 0, irq;
-	bool dat3_card_detect = false;
+	bool dat3_card_detect;
 	dma_cap_mask_t mask;
 	struct imxmmc_platform_data *pdata = pdev->dev.platform_data;
 
@@ -1048,9 +1048,9 @@ static int mxcmci_probe(struct platform_device *pdev)
 
 	if (pdata)
 		dat3_card_detect = pdata->dat3_card_detect;
-	else if (mmc_card_is_removable(mmc)
-			&& !of_property_read_bool(pdev->dev.of_node, "cd-gpios"))
-		dat3_card_detect = true;
+	else
+		dat3_card_detect = mmc_card_is_removable(mmc) &&
+				   !of_property_present(pdev->dev.of_node, "cd-gpios");
 
 	ret = mmc_regulator_get_supply(mmc);
 	if (ret)
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index e23177ea9d91..ff78a7c6a04c 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1648,7 +1648,7 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
 	 * Retrieving and requesting the actual WP GPIO will happen
 	 * in the call to mmc_of_parse().
 	 */
-	if (of_property_read_bool(np, "wp-gpios"))
+	if (of_property_present(np, "wp-gpios"))
 		boarddata->wp_type = ESDHC_WP_GPIO;
 
 	of_property_read_u32(np, "fsl,tuning-step", &boarddata->tuning_step);
-- 
2.45.2


