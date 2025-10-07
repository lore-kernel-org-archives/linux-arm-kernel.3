Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C1ACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQDseboPoN7tnrpn/frcsPgqqEsYL+e4oPXMaYNhgu8=; b=nHvrmGqAV9auUqbZ0lgHRHkC4l
	B27VXRQt5D41YPUd+Z5J9vjbnIsupB3DRtw73IL6GiaZLF1Bejodrpz8i/qPMXJhDZKom786QRzYm
	lH4hNVrjdTihuUoyK6ofdMT+c792kwaHQvn07FeiaJ6D73NezFh9loGjKJjoN2PP9DUqLrzN9G253
	hgDO8PQ81ivZ6i3g16zIzvoh1YmoxhVOpUjVDzvpHZrgvl2oRxgrvNYY+cULDr+VPQpEBOarEmr6t
	NoGXXZnkdc0jo1mFzIEDxA7G+74FOV4vQcSYrU9ntDqSvXzoO0pYTmMMvMpFcghudbS1YTtHj+PHL
	/dUcwY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68Jh-000000028Jt-13Qm;
	Tue, 07 Oct 2025 14:05:25 +0000
Received: from mail-pf1-x463.google.com ([2607:f8b0:4864:20::463])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68Je-000000028Hn-3drg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 14:05:24 +0000
Received: by mail-pf1-x463.google.com with SMTP id d2e1a72fcca58-781db5068b8so5258830b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845922; x=1760450722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQDseboPoN7tnrpn/frcsPgqqEsYL+e4oPXMaYNhgu8=;
        b=mhRTlifg5z74eCgN0VMScsEinlyBgPsNLFFL8OT8EIfhCLMi8RaVa1WiyGbFxx3lBn
         ytdbP+vPE6pYbUGV5ItPoBmrAwl4s36TgEwzsNqoS99VRpbpkfRcX0vAsGtyDYtwMwrE
         /g/vvxrnggHuU5fDrwYpWmEPBDaBisJViQnnJTuG2JL2OuN4noGn7BhH+Dm5ojwy/rv9
         zfYIFHiPWD21TLaiZ9pqfI0ObB6ibrsHFMVpQB10IH4rmBDitNrAF5e43Fd2OKlB5ir5
         e5u02ZaU4R6YL8MsYXAFH8jTEjoS0i8y44PLzL8/u2BpdQE7TmClCxidetcyWIHqPz7V
         3B+w==
X-Forwarded-Encrypted: i=1; AJvYcCXaeIQFKCWVjCsJcJTtOFSVTuzOgQ95ZOSIaWobvbEdAisXzr+nN1WVa4yvMX9RDKWFNRDrGROBf268L887FyPL@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzv17uCMjARd7D4XnC2YhIlfX4ymekv1V9PJrqhPq38FZpYpac
	caawV4Re+iHVXEtWAj5uX6EkXQDkph44aNw7QHUZSfQrK45oNjvtxnh7NyD8cXBF7AONOocKGH9
	BbOE/6Ubky69VFokMBm8CLkwZ6GiQoGkD31bhVP4Tc0qDxWvH+3Rt7T7Sj9UhcjgDZZkeyh9F7e
	FhnSioIqquzMnwdP7zmdLwHe5FrMsmmscuk++r5QCvDPAXeOPiJq4MEXBY1J6YPrbgzTo2CpArU
	5zA574q1d3I/O1MZw0EsEKU9Ig=
X-Gm-Gg: ASbGncuVtMXxhWyOhVC9vzP8BrJrCLxC7FY/L+7eXb0Uk+wfAQ3M2myY+6UdpXBwmi8
	+3e5I9fwNFwkTh5GAVb20tpkpG35o7hQ2l7i51SJHgGasWlj0JYoAIjTbdBaA4kblefXPu0sIl3
	7s6LhKN9G6qFEj9lUB/WYEzOXQqCrn+qY5JSOb7zLEU3BHf+NOGeMY8ahiBUNtAcSvw1hzGt17X
	wRxLNuQOI/T02GBUKNXIpjxciZ2zd8uXGa23Yo5mMv1dRFtdyjVTkiOHMIPSGu996jyLZhda4Dy
	TtEfE78RxRDdxuli2D03k+m7K3IHlf9TzQIa5CgXl7qzKcAjJAWl65o+HrKz1X5yQs3OErLQk2K
	L/jRVzTEtJs7DqPl4tuzkOTX1nBJl/sDvkB78FlFcxuPK7C1LN0xedUpPXFaG506nmzMALP+O+A
	gGh5eS
X-Google-Smtp-Source: AGHT+IE64T6rXuE57XimBN1k6j686XbfD6lZ+lEMrBjkoJZHs+kBn+YaIFhot9mOP9H5jeGwIBkH1TdwcjeC
X-Received: by 2002:a05:6a00:4650:b0:781:1d38:d571 with SMTP id d2e1a72fcca58-78c98dc19femr23531246b3a.17.1759845921431;
        Tue, 07 Oct 2025 07:05:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-78b01f90272sm1047656b3a.1.2025.10.07.07.05.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:05:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-803339f345bso92134276d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759845919; x=1760450719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQDseboPoN7tnrpn/frcsPgqqEsYL+e4oPXMaYNhgu8=;
        b=gsM8ovrQJM/RgXhJIRAxRRfkSSFfsTluw8VDWICaO5p/i0K3zm0QJVib8TMNNcmwXk
         JZio5c+WPPzk9osoTB4JJuwVVrp9ROQpirFAy2i2ndYFOjwGdTk2we8BQzK/TNgDRNl1
         Afq4jo7PPhRcmxy4zpLzWbmU7PdWclXdE8/EE=
X-Forwarded-Encrypted: i=1; AJvYcCW/+SwZobnkfoa6KYHFH94s9DsvNODsqmrenG+idwWtULW6pTCAJ+aBSl9b/BpsnwIxYauKIRG6k/AXWyd/3Sq/@lists.infradead.org
X-Received: by 2002:a05:6214:2682:b0:874:3018:f958 with SMTP id 6a1803df08f44-879dc77b8e8mr209784536d6.5.1759845918814;
        Tue, 07 Oct 2025 07:05:18 -0700 (PDT)
X-Received: by 2002:a05:6214:2682:b0:874:3018:f958 with SMTP id 6a1803df08f44-879dc77b8e8mr209783356d6.5.1759845917674;
        Tue, 07 Oct 2025 07:05:17 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bae60b67sm142718956d6.9.2025.10.07.07.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:05:17 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v2 5/5] mmc: sdhci-brcmstb: save and restore registers during PM
Date: Tue,  7 Oct 2025 10:04:34 -0400
Message-Id: <20251007140434.606051-7-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007140434.606051-1-kamal.dasu@broadcom.com>
References: <20251007140434.606051-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_070522_918173_07640180 
X-CRM114-Status: GOOD (  19.91  )
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

Added support to save and restore registers that are critical
during PM.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/host/sdhci-brcmstb.c | 112 +++++++++++++++++++++++++++++--
 1 file changed, 107 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index 42709ca8111d..7de395c86f2f 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -38,28 +38,109 @@
 #define SDIO_CFG_OP_DLY_DEFAULT			0x80000003
 #define SDIO_CFG_CQ_CAPABILITY			0x4c
 #define SDIO_CFG_CQ_CAPABILITY_FMUL		GENMASK(13, 12)
+#define SDIO_CFG_SD_PIN_SEL			0x44
+#define SDIO_CFG_V1_SD_PIN_SEL			0x54
+#define SDIO_CFG_PHY_SW_MODE_0_RX_CTRL		0x7C
 #define SDIO_CFG_MAX_50MHZ_MODE			0x1ac
 #define SDIO_CFG_MAX_50MHZ_MODE_STRAP_OVERRIDE	BIT(31)
 #define SDIO_CFG_MAX_50MHZ_MODE_ENABLE		BIT(0)
 
+#define SDIO_BOOT_MAIN_CTL			0x0
+
 #define MMC_CAP_HSE_MASK	(MMC_CAP2_HSX00_1_2V | MMC_CAP2_HSX00_1_8V)
 /* Select all SD UHS type I SDR speed above 50MB/s */
 #define MMC_CAP_UHS_I_SDR_MASK	(MMC_CAP_UHS_SDR50 | MMC_CAP_UHS_SDR104)
 
-struct sdhci_brcmstb_priv {
-	void __iomem *cfg_regs;
-	unsigned int flags;
-	struct clk *base_clk;
-	u32 base_freq_hz;
+enum cfg_core_ver {
+	SDIO_CFG_CORE_V1 = 1,
+	SDIO_CFG_CORE_V2,
+};
+
+struct sdhci_brcmstb_saved_regs {
+	u32 sd_pin_sel;
+	u32 phy_sw_mode0_rxctrl;
+	u32 max_50mhz_mode;
+	u32 boot_main_ctl;
 };
 
 struct brcmstb_match_priv {
 	void (*cfginit)(struct sdhci_host *host);
 	void (*hs400es)(struct mmc_host *mmc, struct mmc_ios *ios);
+	void (*save_restore_regs)(struct mmc_host *mmc, int save);
 	struct sdhci_ops *ops;
 	const unsigned int flags;
 };
 
+struct sdhci_brcmstb_priv {
+	void __iomem *cfg_regs;
+	void __iomem *boot_regs;
+	struct sdhci_brcmstb_saved_regs saved_regs;
+	unsigned int flags;
+	struct clk *base_clk;
+	u32 base_freq_hz;
+	const struct brcmstb_match_priv *match_priv;
+};
+
+static void sdhci_brcmstb_save_regs(struct mmc_host *mmc, enum cfg_core_ver ver)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	struct sdhci_brcmstb_saved_regs *sr = &priv->saved_regs;
+	void __iomem *cr = priv->cfg_regs;
+	bool is_emmc = mmc->caps & MMC_CAP_NONREMOVABLE;
+
+	if (is_emmc && priv->boot_regs)
+		sr->boot_main_ctl = readl(priv->boot_regs + SDIO_BOOT_MAIN_CTL);
+
+	if (ver == SDIO_CFG_CORE_V1) {
+		sr->sd_pin_sel = readl(cr + SDIO_CFG_V1_SD_PIN_SEL);
+		return;
+	}
+
+	sr->sd_pin_sel = readl(cr + SDIO_CFG_SD_PIN_SEL);
+	sr->phy_sw_mode0_rxctrl = readl(cr + SDIO_CFG_PHY_SW_MODE_0_RX_CTRL);
+	sr->max_50mhz_mode = readl(cr + SDIO_CFG_MAX_50MHZ_MODE);
+}
+
+static void sdhci_brcmstb_restore_regs(struct mmc_host *mmc, enum cfg_core_ver ver)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	struct sdhci_brcmstb_saved_regs *sr = &priv->saved_regs;
+	void __iomem *cr = priv->cfg_regs;
+	bool is_emmc = mmc->caps & MMC_CAP_NONREMOVABLE;
+
+	if (is_emmc && priv->boot_regs)
+		writel(sr->boot_main_ctl, priv->boot_regs + SDIO_BOOT_MAIN_CTL);
+
+	if (ver == SDIO_CFG_CORE_V1) {
+		writel(sr->sd_pin_sel, cr + SDIO_CFG_SD_PIN_SEL);
+		return;
+	}
+
+	writel(sr->sd_pin_sel, cr + SDIO_CFG_SD_PIN_SEL);
+	writel(sr->phy_sw_mode0_rxctrl, cr + SDIO_CFG_PHY_SW_MODE_0_RX_CTRL);
+	writel(sr->max_50mhz_mode, cr + SDIO_CFG_MAX_50MHZ_MODE);
+}
+
+static void sdhci_brcmstb_save_restore_regs_v1(struct mmc_host *mmc, int save)
+{
+	if (save)
+		sdhci_brcmstb_save_regs(mmc, SDIO_CFG_CORE_V1);
+	else
+		sdhci_brcmstb_restore_regs(mmc, SDIO_CFG_CORE_V1);
+}
+
+static void sdhci_brcmstb_save_restore_regs_v2(struct mmc_host *mmc, int save)
+{
+	if (save)
+		sdhci_brcmstb_save_regs(mmc, SDIO_CFG_CORE_V2);
+	else
+		sdhci_brcmstb_restore_regs(mmc, SDIO_CFG_CORE_V2);
+}
+
 static inline void enable_clock_gating(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -306,22 +387,26 @@ static struct brcmstb_match_priv match_priv_74371 = {
 
 static struct brcmstb_match_priv match_priv_7445 = {
 	.flags = BRCMSTB_MATCH_FLAGS_BROKEN_TIMEOUT,
+	.save_restore_regs = sdhci_brcmstb_save_restore_regs_v1,
 	.ops = &sdhci_brcmstb_ops,
 };
 
 static struct brcmstb_match_priv match_priv_72116 = {
 	.flags = BRCMSTB_MATCH_FLAGS_BROKEN_TIMEOUT,
+	.save_restore_regs = sdhci_brcmstb_save_restore_regs_v1,
 	.ops = &sdhci_brcmstb_ops_72116,
 };
 
 static const struct brcmstb_match_priv match_priv_7216 = {
 	.flags = BRCMSTB_MATCH_FLAGS_HAS_CLOCK_GATE,
+	.save_restore_regs = sdhci_brcmstb_save_restore_regs_v2,
 	.hs400es = sdhci_brcmstb_hs400es,
 	.ops = &sdhci_brcmstb_ops_7216,
 };
 
 static struct brcmstb_match_priv match_priv_74165b0 = {
 	.flags = BRCMSTB_MATCH_FLAGS_HAS_CLOCK_GATE,
+	.save_restore_regs = sdhci_brcmstb_save_restore_regs_v2,
 	.hs400es = sdhci_brcmstb_hs400es,
 	.ops = &sdhci_brcmstb_ops_74165b0,
 };
@@ -429,6 +514,7 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
 
 	pltfm_host = sdhci_priv(host);
 	priv = sdhci_pltfm_priv(pltfm_host);
+	priv->match_priv = match->data;
 	if (device_property_read_bool(&pdev->dev, "supports-cqe")) {
 		priv->flags |= BRCMSTB_PRIV_FLAGS_HAS_CQE;
 		match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;
@@ -446,6 +532,13 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
 	if (res)
 		goto err;
 
+	/* map non-standard BOOT registers if present */
+	if (host->mmc->caps & MMC_CAP_NONREMOVABLE) {
+		priv->boot_regs = devm_platform_get_and_ioremap_resource(pdev, 2, NULL);
+		if (IS_ERR(priv->boot_regs))
+			priv->boot_regs = NULL;
+	}
+
 	/*
 	 * Automatic clock gating does not work for SD cards that may
 	 * voltage switch so only enable it for non-removable devices.
@@ -536,8 +629,13 @@ static int sdhci_brcmstb_suspend(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	const struct brcmstb_match_priv *match_priv = priv->match_priv;
+
 	int ret;
 
+	if (match_priv->save_restore_regs)
+		match_priv->save_restore_regs(host->mmc, 1);
+
 	clk_disable_unprepare(priv->base_clk);
 	if (host->mmc->caps2 & MMC_CAP2_CQE) {
 		ret = cqhci_suspend(host->mmc);
@@ -553,6 +651,7 @@ static int sdhci_brcmstb_resume(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	const struct brcmstb_match_priv *match_priv = priv->match_priv;
 	int ret;
 
 	ret = sdhci_pltfm_resume(dev);
@@ -569,6 +668,9 @@ static int sdhci_brcmstb_resume(struct device *dev)
 			ret = clk_set_rate(priv->base_clk, priv->base_freq_hz);
 	}
 
+	if (match_priv->save_restore_regs)
+		match_priv->save_restore_regs(host->mmc, 0);
+
 	if (host->mmc->caps2 & MMC_CAP2_CQE)
 		ret = cqhci_resume(host->mmc);
 
-- 
2.34.1


