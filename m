Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C71BCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INWXxLCTOEEgIkmqQIiAfdlYe0QOm5Zo0esRtafJx04=; b=VGR9XjS/KYmsiRQPayvzBgrmcG
	KYrFbfZUHcwNVVT9KFz7J4+Kkp/vp+nwwDCA7IorH+jZG3h+KdoDA4Z8f8Fo0Ub6D0aY6o/a3G1HJ
	73LVkWkMKmeNhkLvafa5AtGoOo8c8dQkoqOu83RAKuyiNhp/Y8+WDLtu44s+oU1J0c31CLxegzIsN
	rL7r8wcwy/CZERdZ16Ed5UpRiZaUUs5ZhsQqAmyntV4cvFdA1GdvUArNtKbdhxcFmZf6DbBnN7Htg
	6G58pIbwmvHpXgnPMPud6+/cX2TDmYOtJamOTbtPwAnqeNUqbAparFTREB+NjiRKgJ9wBzh4FzuRq
	/cORAFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHh8A-00000002tGa-03bH;
	Fri, 16 Oct 2026 12:33:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHh7z-00000002t5I-2huS;
	Fri, 16 Oct 2026 12:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792154017;
	bh=tHkxgoeGmFLf5fvdHv6jIQH7FrSUP2b2Q4iZ0NBdCp4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TM3AxajCDnVOdJmN2E2Ppm7AlkVde1QHcgyqAs9gZbP0GJBGcLdj8X2y5i0ZnDjhk
	 VFAOJs5tHWIXTeZ1DntWns6dWRCf6BtgTnWSh1QSX99IevIII7eTtIw79Np5H8SY5y
	 6OQTGy3cD6FtPL4n2Q7h5g8B3UyAX8n775YjzlI62v++jBdNTLvLMRRApvUlGPpRhl
	 FhBO/Cfik7ImjxDCKm01jzuK8LqIbzE9GMGME+xrwJxgCmrDKss1scxA4N0tnimIZ3
	 UQTLdHARbf4kkOpJd3xCEeSt1eQxyBhUpqHpwJ+ni1KyYHwPuLhVEFKhkvFUVt4pXb
	 QjPk5QZli4FNw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75DD217E153E;
	Fri, 16 Oct 2026 14:33:36 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 16 Oct 2026 14:32:58 +0200
Subject: [PATCH v14 06/23] scsi: ufs: mediatek: Rework resets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mt8196-ufs-v14-6-e8d565e0cd45@collabora.com>
References: <20261016-mt8196-ufs-v14-0-e8d565e0cd45@collabora.com>
In-Reply-To: <20261016-mt8196-ufs-v14-0-e8d565e0cd45@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792154009; l=6225;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=E+fe+uSlqDcN4d9IJBGNLtUcTRsEZ5Yfc3xFc1tusFA=;
 b=vpvNmLc5xMUe34I78OOk9rDhXueRGHGeyKtFVgQWh0uY9mCWLKSVkExkMTeupbmweNek1NXNE
 tKL9R1N8hOuA5anl6k1FVwnmYTZYWNQkVOdvBtqYZ7MJcQ/vKGKKGCT
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_053339_856382_7846A5CA 
X-CRM114-Status: GOOD (  19.92  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Rework the reset control getting in the driver's probe function to use
the bulk reset APIs. Use the optional variant instead of defaulting to
NULL if the resets fail, so that absent resets can be distinguished from
erroneous resets.

Also remove all remnants of the MPHY reset ever having lived in this
driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek-sip.h |  8 ----
 drivers/ufs/host/ufs-mediatek.c     | 79 +++++++++++++++++++------------------
 drivers/ufs/host/ufs-mediatek.h     |  7 ++--
 3 files changed, 43 insertions(+), 51 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek-sip.h b/drivers/ufs/host/ufs-mediatek-sip.h
index d627dfb4a766..256598cc3b5b 100644
--- a/drivers/ufs/host/ufs-mediatek-sip.h
+++ b/drivers/ufs/host/ufs-mediatek-sip.h
@@ -31,11 +31,6 @@ enum ufs_mtk_vcc_num {
 	UFS_VCC_MAX
 };
 
-enum ufs_mtk_mphy_op {
-	UFS_MPHY_BACKUP = 0,
-	UFS_MPHY_RESTORE
-};
-
 /*
  * SMC call wrapper function
  */
@@ -84,9 +79,6 @@ static inline void _ufs_mtk_smc(struct ufs_mtk_smc_arg s)
 #define ufs_mtk_device_pwr_ctrl(on, ufs_version, res) \
 	ufs_mtk_smc(UFS_MTK_SIP_DEVICE_PWR_CTRL, &(res), on, ufs_version)
 
-#define ufs_mtk_mphy_ctrl(op, res) \
-	ufs_mtk_smc(UFS_MTK_SIP_MPHY_CTRL, &(res), op)
-
 #define ufs_mtk_mtcmos_ctrl(op, res) \
 	ufs_mtk_smc(UFS_MTK_SIP_MTCMOS_CTRL, &(res), op)
 
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index ef416c6ae098..2aa13b595480 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -94,6 +94,12 @@ static const char *const ufs_uic_dl_err_str[] = {
 	"PA_INIT"
 };
 
+static const char *const ufs_reset_names[] = {
+	"hci",
+	"crypto",
+	"unipro",
+};
+
 static bool ufs_mtk_is_boost_crypt_enabled(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -204,49 +210,46 @@ static void ufs_mtk_crypto_enable(struct ufs_hba *hba)
 static void ufs_mtk_host_reset(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-	struct arm_smccc_res res;
-
-	reset_control_assert(host->hci_reset);
-	reset_control_assert(host->crypto_reset);
-	reset_control_assert(host->unipro_reset);
-	reset_control_assert(host->mphy_reset);
-
-	usleep_range(100, 110);
+	int ret;
 
-	reset_control_deassert(host->unipro_reset);
-	reset_control_deassert(host->crypto_reset);
-	reset_control_deassert(host->hci_reset);
-	reset_control_deassert(host->mphy_reset);
+	ret = reset_control_bulk_assert(MTK_UFS_NUM_RESETS, host->resets);
+	if (ret)
+		dev_warn(hba->dev, "Host reset assert failed: %pe\n", ERR_PTR(ret));
 
-	/* restore mphy setting aftre mphy reset */
-	if (host->mphy_reset)
-		ufs_mtk_mphy_ctrl(UFS_MPHY_RESTORE, res);
-}
+	ret = phy_reset(host->mphy);
 
-static void ufs_mtk_init_reset_control(struct ufs_hba *hba,
-				       struct reset_control **rc,
-				       char *str)
-{
-	*rc = devm_reset_control_get(hba->dev, str);
-	if (IS_ERR(*rc)) {
-		dev_info(hba->dev, "Failed to get reset control %s: %ld\n",
-			 str, PTR_ERR(*rc));
-		*rc = NULL;
+	/*
+	 * Only sleep if there is no MPHY or MPHY doesn't have a reset
+	 * implemented (which already sleeps) or the PHY reset function failed
+	 * somehow, just to be safe
+	 */
+	if (!host->mphy || ret) {
+		usleep_range(100, 110);
+		if (ret && (ret != -EOPNOTSUPP))
+			dev_warn(hba->dev, "PHY reset failed: %pe\n", ERR_PTR(ret));
 	}
+
+	ret = reset_control_bulk_deassert(MTK_UFS_NUM_RESETS, host->resets);
+	if (ret)
+		dev_warn(hba->dev, "Host reset deassert failed: %pe\n", ERR_PTR(ret));
 }
 
-static void ufs_mtk_init_reset(struct ufs_hba *hba)
+static int ufs_mtk_init_reset(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	int ret, i;
+
+	for (i = 0; i < MTK_UFS_NUM_RESETS; i++)
+		host->resets[i].id = ufs_reset_names[i];
 
-	ufs_mtk_init_reset_control(hba, &host->hci_reset,
-				   "hci_rst");
-	ufs_mtk_init_reset_control(hba, &host->unipro_reset,
-				   "unipro_rst");
-	ufs_mtk_init_reset_control(hba, &host->crypto_reset,
-				   "crypto_rst");
-	ufs_mtk_init_reset_control(hba, &host->mphy_reset,
-				   "mphy_rst");
+	ret = devm_reset_control_bulk_get_optional_exclusive(hba->dev, MTK_UFS_NUM_RESETS,
+							     host->resets);
+	if (ret) {
+		dev_err(hba->dev, "Failed to get resets: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
 }
 
 static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
@@ -1260,11 +1263,9 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	if (err)
 		goto out_variant_clear;
 
-	ufs_mtk_init_reset(hba);
-
-	/* backup mphy setting if mphy can reset */
-	if (host->mphy_reset)
-		ufs_mtk_mphy_ctrl(UFS_MPHY_BACKUP, res);
+	err = ufs_mtk_init_reset(hba);
+	if (err)
+		goto out_variant_clear;
 
 	/* Enable runtime autosuspend */
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 73cdc726f290..f95f12eb9926 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -7,12 +7,14 @@
 #define _UFS_MEDIATEK_H
 
 #include <linux/bitops.h>
+#include <linux/reset.h>
 
 /*
  * MCQ define and struct
  */
 #define UFSHCD_MAX_Q_NR 8
 #define MTK_MCQ_INVALID_IRQ	0xFFFF
+#define MTK_UFS_NUM_RESETS 3
 
 /* REG_UFS_MMIO_OPT_CTRL_0 160h */
 #define EHS_EN                  BIT(0)
@@ -175,10 +177,7 @@ struct ufs_mtk_mcq_intr_info {
 struct ufs_mtk_host {
 	struct phy *mphy;
 	struct regulator *reg_va09;
-	struct reset_control *hci_reset;
-	struct reset_control *unipro_reset;
-	struct reset_control *crypto_reset;
-	struct reset_control *mphy_reset;
+	struct reset_control_bulk_data resets[MTK_UFS_NUM_RESETS];
 	struct ufs_hba *hba;
 	struct ufs_mtk_crypt_cfg *crypt;
 	struct ufs_mtk_clk mclk;

-- 
2.56.0


