Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F66AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNNHid8j2GdrLvuRYI0k/s+SHLBpZEc/9VGmb37itS0=; b=EDLywuhjTENiroe0Msr+30MA0s
	v/wuIPY/RhUda7wmyrNbzIDFE4s6V+2dGtY39X4nXaIJFhhpAFrAgSsqL3ZLP2Er243suCy+GGlXM
	kqW/Vl4mMiGt9hFcODg9PH91OJenya8XuyeL4M9u+RSIc0A4WDOGLlO5etpKs7ccTaOFgngJo2cMZ
	xAjF3X0JgJSoUzt4O5X4VFYlG6ugXCbYOZeu3HVkDDtYg4l5Yjzoc/arYykeqPqzqy+KpIfqUQzca
	0Y3+3xVgEg7H14C+toQjakQpg//lMjruWAKvQXx6GkzKCUVS7T0gHBfBu/Av1flF2PPjuKgX8N02V
	ujvBl+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkFJ-00000002JKF-0Tov;
	Mon, 07 Jul 2025 11:42:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjWL-00000002DD1-2IR5;
	Mon, 07 Jul 2025 10:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751885784;
	bh=Gx0tYKHJvbBGjCZROtqlvQEVaSwbcZeD5/atD+M4MbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ql+uhMcXxFMCo1EpW2eOLnrCPBgHtw2fXALRxJCQ1FF82jmk2NgR/pkakrR/+IaiI
	 Bz/nhGzgAPy1wlOIZVHfDGrS0uPVzdYwzHG9vrFZIuEQcfOQcAEjLoGi8mOXWsEGUW
	 y0lvwCjn+KlGzUO3049gMaBQYRiSJDSPyWAN7VdEkh3LDZpYf4LF9B3tIGsoricPVj
	 rbiKHTC83v7ppRNDQGaxAZdpXyow+CWf8XcUpcbDxjrTIp+zbtWmGJ54Y+eBWlL9UI
	 q4YEAcrPN+Kanb8Utguj91X14pC6+JAWF7uRzJooR9Sj1zOc51/PkItKEHZsGzNu/1
	 xD0d34aJvq7CA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 407D617E11F5;
	Mon,  7 Jul 2025 12:56:23 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	y.oudjana@protonmail.com,
	fshao@chromium.org,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 08/10] pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991
Date: Mon,  7 Jul 2025 12:56:03 +0200
Message-ID: <20250707105605.98248-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
References: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_035625_729426_8298A0FD 
X-CRM114-Status: GOOD (  19.09  )
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

New generation SoCs use a new RTFF Hardware to save power during
operation of various IPs, other than managing isolation of the
internal buck converters during powerup/down of power domains.

Since some of the power domains need different RTFF handling, add
a new scpys_rtff_type enumeration and hold the value for each
power domain in struct scpsys_domain_data.

If RTFF HW is available, the RTFF additional power sequences are
handled in scpsys_ctl_pwrseq_{on,off}().

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 94 +++++++++++++++++++++-
 drivers/pmdomain/mediatek/mtk-pm-domains.h | 18 +++++
 2 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index e3a332bda70e..86fc77dc6d4c 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -39,6 +39,12 @@
 #define PWR_SRAM_CLKISO_BIT		BIT(5)
 #define PWR_SRAM_ISOINT_B_BIT		BIT(6)
 
+#define PWR_RTFF_SAVE			BIT(24)
+#define PWR_RTFF_NRESTORE		BIT(25)
+#define PWR_RTFF_CLK_DIS		BIT(26)
+#define PWR_RTFF_SAVE_FLAG		BIT(27)
+#define PWR_RTFF_UFS_CLK_DIS		BIT(28)
+
 struct scpsys_domain {
 	struct generic_pm_domain genpd;
 	const struct scpsys_domain_data *data;
@@ -247,7 +253,7 @@ static int scpsys_regulator_disable(struct regulator *supply)
 static int scpsys_ctl_pwrseq_on(struct scpsys_domain *pd)
 {
 	struct scpsys *scpsys = pd->scpsys;
-	bool tmp;
+	bool do_rtff_nrestore, tmp;
 	int ret;
 
 	/* subsys power on */
@@ -260,10 +266,72 @@ static int scpsys_ctl_pwrseq_on(struct scpsys_domain *pd)
 	if (ret < 0)
 		return ret;
 
+	if (pd->data->rtff_type == SCPSYS_RTFF_TYPE_PCIE_PHY)
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_CLK_DIS);
+
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
+
+	/* Wait for RTFF HW to sync buck isolation state if this is PCIe PHY RTFF */
+	if (pd->data->rtff_type == SCPSYS_RTFF_TYPE_PCIE_PHY)
+		udelay(5);
+
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
 
+	/*
+	 * RTFF HW state may be modified by secure world or remote processors.
+	 *
+	 * With the only exception of STOR_UFS, which always needs save/restore,
+	 * check if this power domain's RTFF is already on before trying to do
+	 * the NRESTORE procedure, otherwise the system will lock up.
+	 */
+	switch (pd->data->rtff_type) {
+	case SCPSYS_RTFF_TYPE_GENERIC:
+	case SCPSYS_RTFF_TYPE_PCIE_PHY:
+	{
+		u32 ctl_status;
+
+		regmap_read(scpsys->base, pd->data->ctl_offs, &ctl_status);
+		do_rtff_nrestore = ctl_status & PWR_RTFF_SAVE_FLAG;
+		break;
+	}
+	case SCPSYS_RTFF_TYPE_STOR_UFS:
+		/* STOR_UFS always needs NRESTORE */
+		do_rtff_nrestore = true;
+		break;
+	default:
+		do_rtff_nrestore = false;
+		break;
+	}
+
+	/* Return early if RTFF NRESTORE shall not be done */
+	if (!do_rtff_nrestore)
+		return 0;
+
+	switch (pd->data->rtff_type) {
+	case SCPSYS_RTFF_TYPE_GENERIC:
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_SAVE_FLAG);
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_CLK_DIS);
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_NRESTORE);
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_NRESTORE);
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_CLK_DIS);
+		break;
+	case SCPSYS_RTFF_TYPE_PCIE_PHY:
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_SAVE_FLAG);
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_NRESTORE);
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_NRESTORE);
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_CLK_DIS);
+		break;
+	case SCPSYS_RTFF_TYPE_STOR_UFS:
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_UFS_CLK_DIS);
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_NRESTORE);
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_NRESTORE);
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_UFS_CLK_DIS);
+		break;
+	default:
+		break;
+	}
+
 	return 0;
 }
 
@@ -271,8 +339,32 @@ static void scpsys_ctl_pwrseq_off(struct scpsys_domain *pd)
 {
 	struct scpsys *scpsys = pd->scpsys;
 
+	switch (pd->data->rtff_type) {
+	case SCPSYS_RTFF_TYPE_GENERIC:
+	case SCPSYS_RTFF_TYPE_PCIE_PHY:
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_CLK_DIS);
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_SAVE);
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_SAVE);
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_CLK_DIS);
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_SAVE_FLAG);
+		break;
+	case SCPSYS_RTFF_TYPE_STOR_UFS:
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_UFS_CLK_DIS);
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_SAVE);
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_SAVE);
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_UFS_CLK_DIS);
+		break;
+	default:
+		break;
+	}
+
 	/* subsys power off */
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
+
+	/* Wait for RTFF HW to sync buck isolation state if this is PCIe PHY RTFF */
+	if (pd->data->rtff_type == SCPSYS_RTFF_TYPE_PCIE_PHY)
+		udelay(1);
+
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index 931a54f1c5ca..b2e3dee03831 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -108,6 +108,22 @@ struct scpsys_bus_prot_data {
 	u8 flags;
 };
 
+/**
+ * enum scpsys_rtff_type - Type of RTFF Hardware for power domain
+ * @SCPSYS_RTFF_NONE:          RTFF HW not present or domain not RTFF managed
+ * @SCPSYS_RTFF_TYPE_GENERIC:  Non-CPU, peripheral-generic RTFF HW
+ * @SCPSYS_RTFF_TYPE_PCIE_PHY: PCI-Express PHY specific RTFF HW
+ * @SCPSYS_RTFF_TYPE_STOR_UFS: Storage (UFS) specific RTFF HW
+ * @SCPSYS_RTFF_TYPE_MAX:      Number of supported RTFF HW Types
+ */
+enum scpsys_rtff_type {
+	SCPSYS_RTFF_NONE = 0,
+	SCPSYS_RTFF_TYPE_GENERIC,
+	SCPSYS_RTFF_TYPE_PCIE_PHY,
+	SCPSYS_RTFF_TYPE_STOR_UFS,
+	SCPSYS_RTFF_TYPE_MAX
+};
+
 /**
  * struct scpsys_domain_data - scp domain data for power on/off flow
  * @name: The name of the power domain.
@@ -118,6 +134,7 @@ struct scpsys_bus_prot_data {
  * @ext_buck_iso_offs: The offset for external buck isolation
  * @ext_buck_iso_mask: The mask for external buck isolation
  * @caps: The flag for active wake-up action.
+ * @rtff_type: The power domain RTFF HW type
  * @bp_cfg: bus protection configuration for any subsystem
  */
 struct scpsys_domain_data {
@@ -129,6 +146,7 @@ struct scpsys_domain_data {
 	int ext_buck_iso_offs;
 	u32 ext_buck_iso_mask;
 	u16 caps;
+	enum scpsys_rtff_type rtff_type;
 	const struct scpsys_bus_prot_data bp_cfg[SPM_MAX_BUS_PROT_DATA];
 	int pwr_sta_offs;
 	int pwr_sta2nd_offs;
-- 
2.49.0


