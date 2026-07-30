Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38273C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwOAnzoA+WoSLZLEuYRFdFPXS5TnY6KGANhY/kFFW2Q=; b=2h/+I16SNu1nZZlh4T91TDMM1v
	bPSGx0hKn0ME1KH7OVvMLWwo0duI9wddPmd6oUqeff1tSisyTWZQ8q//amW/Kl3RnZOqUiGM3nUc3
	zSZCCxF/nVDP9AZ25aV9jWLR0jNhWkCxhEHQKZLVw3DgvCpQSMy9+EI4RUTB+k8g1O05aV/6m4zgN
	N3aRyz+C15tH2hg8/XnuJL9mFeDemsYFKyFOv4X43NgPP/NKayqpo468LiWyRfsdqRI5c+Kexd1GH
	k4MkusJMr6xYuLP9YQfvQhqcLQcyTPW7B2g55yP1TAXvuYcvqgBWLV+U51sYmM8Q7win8WmOu4ALu
	9uHpNxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNR2-0000000A4wh-0TEG;
	Thu, 30 Jul 2026 09:52:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNP7-0000000A3Zh-0Asq;
	Thu, 30 Jul 2026 09:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785405015;
	bh=iV7YAUVX/6s3zSSq6cvyTdGh6YvtXTTsVNyW0ZaDaNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZDQQzTo+H+X5jBFCI9uveTKX69supngGGWbrXrBUmsu39Y35lMP6oahddH6KDeNGf
	 EmGNdiMNQ3Mcg8DSq6nGQ7eolav7Gw6alBAak5GfiUUu0yzdrKRWpdcwXVtfoUvcQm
	 E5yGDaf+Et+iBs6jHtCu4fF7VFNdYBjXDhG9MNbxcFbKp6GRrewk902n2f9JtWXzCC
	 xZzlLdKPAnF5+qRw2gSjjUBHyUrleTFVikTuYbymLpz5gEI139ZRMlbgg+E2R3E5F0
	 XOEIbgKBMpXre4f3Z+1wNE6+5Y/7SqDADSN3Itd069qEDnSvvP4YKqIdqTbPkqC+rQ
	 ipU8GSm69V5CQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACF2A17E0946;
	Thu, 30 Jul 2026 11:50:13 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Jul 2026 11:49:09 +0200
Subject: [PATCH v10 13/26] scsi: ufs: mediatek: Use the common PHY
 framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-mt8196-ufs-v10-13-bc5ecef202dc@collabora.com>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
In-Reply-To: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785404993; l=7476;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=kSUj9lu5ZjXfPDYje0Y7JQxMHSzsUP4XMjIFrE0gytk=;
 b=krDj/iVdlnkqw5/M/qvWFPkvi42k3X0n9NdTyjxGK2aaA6ItJpKX6uarFbnX+xiUjbCkKRe/+
 zqOgQ2HEkZEDc36yYa45qLanoRrVtS7/1oK8TWELMpbwZ3PePHEvpxb
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_025017_250506_7F5334AC 
X-CRM114-Status: GOOD (  24.08  )
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

There is no need to reinvent the PHY framework, especially not its OF
parsing.

Change the code to simply use the PHY framework to acquire the device's
PHY in the ufshcd init, so that it's device linked to the right device.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 134 +++++++++++++---------------------------
 drivers/ufs/host/ufs-mediatek.h |   1 -
 2 files changed, 42 insertions(+), 93 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index e5527969a5e6..385f0180b230 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -293,44 +293,6 @@ static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 	return 0;
 }
 
-static int ufs_mtk_bind_mphy(struct ufs_hba *hba)
-{
-	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-	struct device *dev = hba->dev;
-	struct device_node *np = dev->of_node;
-	int err = 0;
-
-	host->mphy = devm_of_phy_get_by_index(dev, np, 0);
-
-	if (host->mphy == ERR_PTR(-EPROBE_DEFER)) {
-		/*
-		 * UFS driver might be probed before the phy driver does.
-		 * In that case we would like to return EPROBE_DEFER code.
-		 */
-		err = -EPROBE_DEFER;
-		dev_info(dev,
-			 "%s: required phy hasn't probed yet. err = %d\n",
-			__func__, err);
-	} else if (IS_ERR(host->mphy)) {
-		err = PTR_ERR(host->mphy);
-		if (err != -ENODEV) {
-			dev_info(dev, "%s: PHY get failed %d\n", __func__,
-				 err);
-		}
-	}
-
-	if (err)
-		host->mphy = NULL;
-	/*
-	 * Allow unbound mphy because not every platform needs specific
-	 * mphy control.
-	 */
-	if (err == -ENODEV)
-		err = 0;
-
-	return err;
-}
-
 static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -1185,13 +1147,21 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	ufs_mtk_init_mcq_irq(hba);
 
-	err = ufs_mtk_bind_mphy(hba);
-	if (err)
+	host->mphy = devm_phy_get(dev, NULL);
+	if (IS_ERR(host->mphy)) {
+		err = dev_err_probe(dev, PTR_ERR(host->mphy), "Failed to get PHY\n");
+		goto out_variant_clear;
+	}
+
+	err = phy_init(host->mphy);
+	if (err) {
+		dev_err_probe(dev, err, "Failed to initialize PHY\n");
 		goto out_variant_clear;
+	}
 
 	err = ufs_mtk_init_reset(hba);
 	if (err)
-		goto out_variant_clear;
+		goto out_phy_exit;
 
 	/* Enable runtime autosuspend */
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
@@ -1230,7 +1200,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	err = ufs_mtk_get_supplies(host);
 	if (err)
-		goto out_variant_clear;
+		goto out_phy_exit;
 
 	/*
 	 * ufshcd_vops_init() is invoked after
@@ -1255,11 +1225,22 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	return 0;
 
+out_phy_exit:
+	phy_exit(host->mphy);
 out_variant_clear:
 	ufshcd_set_variant(hba, NULL);
 	return err;
 }
 
+static void ufs_mtk_exit(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	ufs_mtk_mphy_power_on(hba, false);
+
+	phy_exit(host->mphy);
+}
+
 static int ufs_mtk_negotiate_pwr_mode(struct ufs_hba *hba,
 				      const struct ufs_pa_layer_attr *dev_max_params,
 				      struct ufs_pa_layer_attr *dev_req_params)
@@ -2272,6 +2253,7 @@ static void ufs_mtk_config_scsi_dev(struct scsi_device *sdev)
 static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.name                = "mediatek.ufshci",
 	.init                = ufs_mtk_init,
+	.exit                = ufs_mtk_exit,
 	.get_ufs_hci_version = ufs_mtk_get_ufs_hci_version,
 	.setup_clocks        = ufs_mtk_setup_clocks,
 	.hce_enable_notify   = ufs_mtk_hce_enable_notify,
@@ -2332,48 +2314,15 @@ MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
  */
 static int ufs_mtk_probe(struct platform_device *pdev)
 {
-	int err;
+	struct device *dev = &pdev->dev;
 	struct ufs_hba *hba;
-	struct platform_device *phy_pdev = NULL;
-	struct device *dev = &pdev->dev, *phy_dev = NULL;
-	struct device_node *phy_node = NULL;
-	struct ufs_mtk_host *host;
-
-	/* find phy node */
-	phy_node = of_parse_phandle(dev->of_node, "phys", 0);
-
-	if (phy_node) {
-		phy_pdev = of_find_device_by_node(phy_node);
-		if (!phy_pdev)
-			goto skip_phy;
-		phy_dev = &phy_pdev->dev;
-
-		pm_runtime_set_active(phy_dev);
-		pm_runtime_enable(phy_dev);
-		pm_runtime_get_sync(phy_dev);
-
-		put_device(phy_dev);
-		dev_info(dev, "phys node found\n");
-	} else {
-		dev_notice(dev, "phys node not found\n");
-	}
+	int ret;
 
-skip_phy:
-	/* perform generic probe */
-	err = ufshcd_pltfrm_init(pdev, &ufs_hba_mtk_vops);
-	if (err) {
-		dev_err(dev, "probe failed %d\n", err);
-		goto out;
-	}
+	ret = ufshcd_pltfrm_init(pdev, &ufs_hba_mtk_vops);
+	if (ret)
+		return dev_err_probe(dev, ret, "Generic platform probe failed\n");
 
 	hba = platform_get_drvdata(pdev);
-	if (!hba)
-		goto out;
-
-	if (phy_node && phy_dev) {
-		host = ufshcd_get_variant(hba);
-		host->phy_dev = phy_dev;
-	}
 
 	/*
 	 * Because the default power setting of VSx (the upper layer of
@@ -2382,16 +2331,12 @@ static int ufs_mtk_probe(struct platform_device *pdev)
 	 */
 	ufs_mtk_dev_vreg_set_lpm(hba, false);
 
-out:
-	of_node_put(phy_node);
-	return err;
+	return 0;
 }
 
 /**
  * ufs_mtk_remove - set driver_data of the device to NULL
  * @pdev: pointer to platform device handle
- *
- * Always return 0
  */
 static void ufs_mtk_remove(struct platform_device *pdev)
 {
@@ -2448,9 +2393,8 @@ static int ufs_mtk_system_resume(struct device *dev)
 static int ufs_mtk_runtime_suspend(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
-	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct arm_smccc_res res;
-	int ret = 0;
+	int ret;
 
 	ret = ufshcd_runtime_suspend(dev);
 	if (ret)
@@ -2461,8 +2405,11 @@ static int ufs_mtk_runtime_suspend(struct device *dev)
 	if (ufs_mtk_is_rtff_mtcmos(hba))
 		ufs_mtk_mtcmos_ctrl(false, res);
 
-	if (host->phy_dev)
-		pm_runtime_put_sync(host->phy_dev);
+	ret = ufs_mtk_mphy_power_on(hba, false);
+	if (ret) {
+		dev_err(dev, "Failed to power off PHY: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
 
 	return 0;
 }
@@ -2470,14 +2417,17 @@ static int ufs_mtk_runtime_suspend(struct device *dev)
 static int ufs_mtk_runtime_resume(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
-	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct arm_smccc_res res;
+	int ret;
 
 	if (ufs_mtk_is_rtff_mtcmos(hba))
 		ufs_mtk_mtcmos_ctrl(true, res);
 
-	if (host->phy_dev)
-		pm_runtime_get_sync(host->phy_dev);
+	ret = ufs_mtk_mphy_power_on(hba, true);
+	if (ret) {
+		dev_err(dev, "Failed to power on PHY: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
 
 	ufs_mtk_dev_vreg_set_lpm(hba, false);
 
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index c63740b98e85..8b3cd17e6227 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -195,7 +195,6 @@ struct ufs_mtk_host {
 	bool is_mcq_intr_enabled;
 	int mcq_nr_intr;
 	struct ufs_mtk_mcq_intr_info mcq_intr_info[UFSHCD_MAX_Q_NR];
-	struct device *phy_dev;
 };
 
 /* MTK delay of autosuspend: 500 ms */

-- 
2.55.0


