Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B3EC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIkoYusGaJp+Gbv97Cy0nDUAbB4OZulul9qcJAaOWQI=; b=aPV3AHw1ZjbVSRvAa76IKoGyQR
	47AczKfCGB7vHcwjgxx+W+kGf94fQly4iWL8hoGKu/90dwiNatOIReg4E/0UILpFmpr+eR3WTUJR4
	lq8Ghp4aFbbmW4B4jpirxNHa0dnb9EF1C4rISpwcTE86vdZmrcDvTdJH3KRUpsmvjV/Tc593pyIE1
	NkXbskXzLWnlAHZdOanMQe96FGK1P+omsUEs2zolTfIskrh0aR5wllJwkQCrdPYiMcIaR8a4p0QhN
	PWjwqNo/rJ78F4J07mJKKgU+eNjWGg6y7Ttfw/Sg4U+EbT40C9j1ldUuT/dUVGK8QlhJcJoGabBpM
	KOya3n8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC89K-00000009mlE-0B9n;
	Tue, 06 May 2025 02:35:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4mO-00000008vKj-25FJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1679A629CA;
	Mon,  5 May 2025 22:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819C1C4CEE4;
	Mon,  5 May 2025 22:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485959;
	bh=snIzbJ+SkDklwk5xX4vjbVVtP5TDGkJskoq+YwM/AIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KikEt+bXimPIlffz1n/loYvdgVhI+qohvCjV0pCmh7HhRigLAp8RbhBosbqo3Nvy5
	 JmXKtfKZbAy4Ylwh4IuZJMdJ5xAYZlCp6Q9kv0uo+71Aisc92yP8sI+jm4emFsT1Wq
	 LzwoOIt9hvqc/uhjdl7OaEqSjienqPIQe/6dX52dz1RHgKNs9MFmVxT1QBAUEiZyCI
	 4M3ZSq1D7cuIITqIvxyw9E9qbTw2LEePVA7/Gn4ZV+SNOLaneygqCG8WZMsIElto9a
	 dthFzBoXq3ou6HWp4cuUCO6C0SFADK5OPZTCfnxL9oEIrYzPP1qmO4tCTX1e4ms2Zr
	 KCvyKmFpyzG4w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	jh80.chung@samsung.com,
	krzk@kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 086/294] mmc: dw_mmc: add exynos7870 DW MMC support
Date: Mon,  5 May 2025 18:53:06 -0400
Message-Id: <20250505225634.2688578-86-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
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

From: Kaustabh Chakraborty <kauschluss@disroot.org>

[ Upstream commit 7cbe799ac10fd8be85af5e0615c4337f81e575f3 ]

Add support for Exynos7870 DW MMC controllers, for both SMU and non-SMU
variants. These controllers require a quirk to access 64-bit FIFO in 32-bit
accesses (DW_MMC_QUIRK_FIFO64_32).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Link: https://lore.kernel.org/r/20250219-exynos7870-mmc-v2-3-b4255a3e39ed@disroot.org
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mmc/host/dw_mmc-exynos.c | 41 +++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
index 698408e8bad03..381a61adf06ee 100644
--- a/drivers/mmc/host/dw_mmc-exynos.c
+++ b/drivers/mmc/host/dw_mmc-exynos.c
@@ -28,6 +28,8 @@ enum dw_mci_exynos_type {
 	DW_MCI_TYPE_EXYNOS5420_SMU,
 	DW_MCI_TYPE_EXYNOS7,
 	DW_MCI_TYPE_EXYNOS7_SMU,
+	DW_MCI_TYPE_EXYNOS7870,
+	DW_MCI_TYPE_EXYNOS7870_SMU,
 	DW_MCI_TYPE_ARTPEC8,
 };
 
@@ -70,6 +72,12 @@ static struct dw_mci_exynos_compatible {
 	}, {
 		.compatible	= "samsung,exynos7-dw-mshc-smu",
 		.ctrl_type	= DW_MCI_TYPE_EXYNOS7_SMU,
+	}, {
+		.compatible	= "samsung,exynos7870-dw-mshc",
+		.ctrl_type	= DW_MCI_TYPE_EXYNOS7870,
+	}, {
+		.compatible	= "samsung,exynos7870-dw-mshc-smu",
+		.ctrl_type	= DW_MCI_TYPE_EXYNOS7870_SMU,
 	}, {
 		.compatible	= "axis,artpec8-dw-mshc",
 		.ctrl_type	= DW_MCI_TYPE_ARTPEC8,
@@ -86,6 +94,8 @@ static inline u8 dw_mci_exynos_get_ciu_div(struct dw_mci *host)
 		return EXYNOS4210_FIXED_CIU_CLK_DIV;
 	else if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU ||
 			priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		return SDMMC_CLKSEL_GET_DIV(mci_readl(host, CLKSEL64)) + 1;
 	else
@@ -101,7 +111,8 @@ static void dw_mci_exynos_config_smu(struct dw_mci *host)
 	 * set for non-ecryption mode at this time.
 	 */
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS5420_SMU ||
-		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU) {
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU) {
 		mci_writel(host, MPSBEGIN0, 0);
 		mci_writel(host, MPSEND0, SDMMC_ENDING_SEC_NR_MAX);
 		mci_writel(host, MPSCTRL0, SDMMC_MPSCTRL_SECURE_WRITE_BIT |
@@ -127,6 +138,12 @@ static int dw_mci_exynos_priv_init(struct dw_mci *host)
 				DQS_CTRL_GET_RD_DELAY(priv->saved_strobe_ctrl);
 	}
 
+	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU) {
+		/* Quirk needed for certain Exynos SoCs */
+		host->quirks |= DW_MMC_QUIRK_FIFO64_32;
+	}
+
 	if (priv->ctrl_type == DW_MCI_TYPE_ARTPEC8) {
 		/* Quirk needed for the ARTPEC-8 SoC */
 		host->quirks |= DW_MMC_QUIRK_EXTENDED_TMOUT;
@@ -144,6 +161,8 @@ static void dw_mci_exynos_set_clksel_timing(struct dw_mci *host, u32 timing)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
@@ -153,6 +172,8 @@ static void dw_mci_exynos_set_clksel_timing(struct dw_mci *host, u32 timing)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		mci_writel(host, CLKSEL64, clksel);
 	else
@@ -223,6 +244,8 @@ static int dw_mci_exynos_resume_noirq(struct device *dev)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
@@ -231,6 +254,8 @@ static int dw_mci_exynos_resume_noirq(struct device *dev)
 	if (clksel & SDMMC_CLKSEL_WAKEUP_INT) {
 		if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU ||
 			priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 			mci_writel(host, CLKSEL64, clksel);
 		else
@@ -410,6 +435,8 @@ static inline u8 dw_mci_exynos_get_clksmpl(struct dw_mci *host)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		return SDMMC_CLKSEL_CCLK_SAMPLE(mci_readl(host, CLKSEL64));
 	else
@@ -423,6 +450,8 @@ static inline void dw_mci_exynos_set_clksmpl(struct dw_mci *host, u8 sample)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
@@ -430,6 +459,8 @@ static inline void dw_mci_exynos_set_clksmpl(struct dw_mci *host, u8 sample)
 	clksel = SDMMC_CLKSEL_UP_SAMPLE(clksel, sample);
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		mci_writel(host, CLKSEL64, clksel);
 	else
@@ -444,6 +475,8 @@ static inline u8 dw_mci_exynos_move_next_clksmpl(struct dw_mci *host)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
@@ -454,6 +487,8 @@ static inline u8 dw_mci_exynos_move_next_clksmpl(struct dw_mci *host)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870 ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		mci_writel(host, CLKSEL64, clksel);
 	else
@@ -633,6 +668,10 @@ static const struct of_device_id dw_mci_exynos_match[] = {
 			.data = &exynos_drv_data, },
 	{ .compatible = "samsung,exynos7-dw-mshc-smu",
 			.data = &exynos_drv_data, },
+	{ .compatible = "samsung,exynos7870-dw-mshc",
+			.data = &exynos_drv_data, },
+	{ .compatible = "samsung,exynos7870-dw-mshc-smu",
+			.data = &exynos_drv_data, },
 	{ .compatible = "axis,artpec8-dw-mshc",
 			.data = &artpec_drv_data, },
 	{},
-- 
2.39.5


