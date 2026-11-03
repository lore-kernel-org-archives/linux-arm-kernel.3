Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE24606C5AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mCz31lIy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wQSfiK91Fsk7qULgyQvRfhlINcQSjFPu59hso23LCk0=; b=mCz31lIyrLkoOoDonJBS1LDpn6
	D/KXQxBC5nwj7de1dus2Py+rJojIym6J3Tul/u7uoN5FSvaMRHsfyrLj06G5Xwj7N3/Saj5HAYtV5
	cW1mu9hsa5wtCkUEPKZBfPftiHDJIAM6HSi9QyMNikhuuLlTCMWQTVgeHLI2/YhXz5JN1RZIzQC1x
	2MJkR8Fq8njwFELV1KO2DpbpFInOWEABSrhCEgBhomFn6MhU4UYUheJ5LDEGIcjCpqvBX156qIVDX
	cShJcHIPOEzHsuSBaaF8Yk97SHz4ITXZog5l7DCpHvfCqebuqjEXq3t2fOcpEVXPXPn8c0+VEQ/Vf
	sOh5Lunw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1s-000000024Zb-1dWv;
	Tue, 03 Nov 2026 10:46:12 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1j-000000024Qn-0Wpw;
	Tue, 03 Nov 2026 10:46:10 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC1c-0000000032v-1Srt;
	Tue, 03 Nov 2026 10:45:56 +0000
Date: Tue, 3 Nov 2026 10:45:53 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] media: synopsys: csi2rx: handle the error interrupts
Message-ID: <cc10d5865e0685d07305490e25bd425eadd43582.1793702189.git.daniel@makrotopia.org>
References: <cover.1793702189.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793702189.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_024603_328981_6A2BD550 
X-CRM114-Status: GOOD (  21.95  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The receiver reports lost synchronisation, frame boundary and sequence
errors, CRC and ECC results and unknown data types in two clear-on-read
registers with an interrupt line each. The driver masks all of them, so
a link that drops packets, and with them image lines, leaves no trace.

Request the err1 and err2 interrupts where the firmware names them,
unmask the sources while the receiver runs, count each class in debugfs
and warn with the raw registers under a rate limit. The unrecognised
data type source stays masked as in the vendor driver. The masks are
written again in the runtime resume, which resets the block.

Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../media/platform/synopsys/dw-mipi-csi2rx.c  | 125 +++++++++++++++++-
 1 file changed, 120 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 41e48365167e5..ae895a18f7966 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -9,7 +9,9 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -54,6 +56,18 @@
 
 #define IPI_MEM_FLUSH_AUTO		BIT(8)
 
+#define ERR1_PHY_SOT_SYNC GENMASK(3, 0)
+#define ERR1_FRAME_BOUNDARY GENMASK(7, 4)
+#define ERR1_FRAME_SEQUENCE GENMASK(11, 8)
+#define ERR1_FRAME_DATA GENMASK(15, 12)
+#define ERR1_CRC GENMASK(28, 24)
+
+#define ERR2_PHY_ESCAPE GENMASK(3, 0)
+#define ERR2_PHY_SOT GENMASK(7, 4)
+#define ERR2_ECC_CORRECTED GENMASK(11, 8)
+#define ERR2_DATA_TYPE GENMASK(15, 12)
+#define ERR2_PHY_CODE BIT(24)
+
 enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_N_LANES,
 	DW_MIPI_CSI2RX_RESETN,
@@ -100,6 +114,25 @@ struct dw_mipi_csi2rx_format {
 	u8 csi_dt;
 };
 
+struct dw_mipi_csi2rx_error {
+	enum dw_mipi_csi2rx_regs_index reg;
+	u32 mask;
+	const char *name;
+};
+
+static const struct dw_mipi_csi2rx_error dw_mipi_csi2rx_errors[] = {
+	{ DW_MIPI_CSI2RX_ERR1, ERR1_PHY_SOT_SYNC, "phy_sot_sync" },
+	{ DW_MIPI_CSI2RX_ERR1, ERR1_FRAME_BOUNDARY, "frame_boundary" },
+	{ DW_MIPI_CSI2RX_ERR1, ERR1_FRAME_SEQUENCE, "frame_sequence" },
+	{ DW_MIPI_CSI2RX_ERR1, ERR1_FRAME_DATA, "frame_data" },
+	{ DW_MIPI_CSI2RX_ERR1, ERR1_CRC, "crc" },
+	{ DW_MIPI_CSI2RX_ERR2, ERR2_PHY_ESCAPE, "phy_escape" },
+	{ DW_MIPI_CSI2RX_ERR2, ERR2_PHY_SOT, "phy_sot" },
+	{ DW_MIPI_CSI2RX_ERR2, ERR2_ECC_CORRECTED, "ecc_corrected" },
+	{ DW_MIPI_CSI2RX_ERR2, ERR2_DATA_TYPE, "data_type" },
+	{ DW_MIPI_CSI2RX_ERR2, ERR2_PHY_CODE, "phy_code" },
+};
+
 struct dw_mipi_csi2rx_device {
 	struct device *dev;
 
@@ -108,6 +141,9 @@ struct dw_mipi_csi2rx_device {
 	unsigned int clks_num;
 	struct phy *phy;
 	struct reset_control *reset;
+	bool err_irqs;
+	struct dentry *debugfs_dir;
+	unsigned long error_count[ARRAY_SIZE(dw_mipi_csi2rx_errors)];
 
 	const struct dw_mipi_csi2rx_format *formats;
 	unsigned int formats_num;
@@ -343,6 +379,76 @@ static inline u32 dw_mipi_csi2rx_read(struct dw_mipi_csi2rx_device *csi2,
 	return readl(dw_mipi_csi2rx_get_regaddr(csi2, index));
 }
 
+static void dw_mipi_csi2rx_mask_errors(struct dw_mipi_csi2rx_device *csi2,
+				       u32 msk1, u32 msk2)
+{
+	if (dw_mipi_csi2rx_has_reg(csi2, DW_MIPI_CSI2RX_MSK1))
+		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, msk1);
+
+	if (dw_mipi_csi2rx_has_reg(csi2, DW_MIPI_CSI2RX_MSK2))
+		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, msk2);
+}
+
+static irqreturn_t dw_mipi_csi2rx_err_isr(int irq, void *ctx)
+{
+	struct dw_mipi_csi2rx_device *csi2 = ctx;
+	const struct dw_mipi_csi2rx_error *error;
+	unsigned int i;
+	u32 err[2];
+
+	err[0] = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_ERR1);
+	err[1] = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_ERR2);
+	if (!err[0] && !err[1])
+		return IRQ_NONE;
+
+	for (i = 0; i < ARRAY_SIZE(dw_mipi_csi2rx_errors); i++) {
+		error = &dw_mipi_csi2rx_errors[i];
+		if (err[error->reg - DW_MIPI_CSI2RX_ERR1] & error->mask)
+			csi2->error_count[i]++;
+	}
+
+	dev_warn_ratelimited(csi2->dev, "link errors %#x %#x\n", err[0],
+			     err[1]);
+
+	return IRQ_HANDLED;
+}
+
+static int dw_mipi_csi2rx_request_irqs(struct dw_mipi_csi2rx_device *csi2,
+				       struct platform_device *pdev)
+{
+	static const char *const names[] = { "err1", "err2" };
+	unsigned int i;
+	int irq, ret;
+
+	for (i = 0; i < ARRAY_SIZE(names); i++) {
+		irq = platform_get_irq_byname_optional(pdev, names[i]);
+		if (irq == -ENXIO)
+			continue;
+		if (irq < 0)
+			return irq;
+
+		ret = devm_request_irq(&pdev->dev, irq, dw_mipi_csi2rx_err_isr,
+				       0, dev_name(&pdev->dev), csi2);
+		if (ret)
+			return ret;
+
+		csi2->err_irqs = true;
+	}
+
+	return 0;
+}
+
+static void dw_mipi_csi2rx_debugfs_init(struct dw_mipi_csi2rx_device *csi2)
+{
+	unsigned int i;
+
+	csi2->debugfs_dir = debugfs_create_dir(dev_name(csi2->dev), NULL);
+
+	for (i = 0; i < ARRAY_SIZE(dw_mipi_csi2rx_errors); i++)
+		debugfs_create_ulong(dw_mipi_csi2rx_errors[i].name, 0444,
+				     csi2->debugfs_dir, &csi2->error_count[i]);
+}
+
 static const struct dw_mipi_csi2rx_format *
 dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
 {
@@ -425,6 +531,9 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 	if (csi2->drvdata->dphy_deassert_reset)
 		csi2->drvdata->dphy_deassert_reset(csi2);
 
+	if (csi2->err_irqs)
+		dw_mipi_csi2rx_mask_errors(csi2, 0, ERR2_DATA_TYPE);
+
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
 
 	if (csi2->drvdata->ipi_enable)
@@ -439,11 +548,7 @@ static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
 
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
 
-	if (dw_mipi_csi2rx_has_reg(csi2, DW_MIPI_CSI2RX_MSK1))
-		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
-
-	if (dw_mipi_csi2rx_has_reg(csi2, DW_MIPI_CSI2RX_MSK2))
-		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
+	dw_mipi_csi2rx_mask_errors(csi2, ~0, ~0);
 }
 
 static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
@@ -985,6 +1090,10 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(csi2->reset),
 				     "failed to get reset\n");
 
+	ret = dw_mipi_csi2rx_request_irqs(csi2, pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irqs\n");
+
 	csi2->formats = formats;
 	csi2->formats_num = ARRAY_SIZE(formats);
 
@@ -997,6 +1106,8 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to initialize MIPI CSI-2 PHY\n");
 
+	dw_mipi_csi2rx_debugfs_init(csi2);
+
 	ret = dw_mipi_csi2rx_register(csi2);
 	if (ret)
 		goto err_phy_exit;
@@ -1004,6 +1115,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 	return 0;
 
 err_phy_exit:
+	debugfs_remove_recursive(csi2->debugfs_dir);
 	phy_exit(csi2->phy);
 
 	return ret;
@@ -1014,6 +1126,7 @@ static void dw_mipi_csi2rx_remove(struct platform_device *pdev)
 	struct dw_mipi_csi2rx_device *csi2 = platform_get_drvdata(pdev);
 
 	dw_mipi_csi2rx_unregister(csi2);
+	debugfs_remove_recursive(csi2->debugfs_dir);
 	phy_exit(csi2->phy);
 }
 
@@ -1041,6 +1154,8 @@ static int dw_mipi_csi2rx_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	dw_mipi_csi2rx_mask_errors(csi2, ~0, ~0);
+
 	return 0;
 }
 
-- 
2.56.0

