Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A76C624D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aoAslgFdEEBVBEgSlFq2sgj095HiNiySCjpAxzUFG0=; b=qYww9G79WHJtH6TQ2SIeRwz2eb
	AcEt3lVPqRjh1wTcE9K235LcvQfrRKmU3TZRb79lSUtshH1R4XtXZKGGTNLSjWnY7mIIjCehfWx6y
	VADIKwkXgK+I3vl3pzuDYAlB2f+EEtdkYpjR+IeL+3MRfOzMQ4DeKtXbaAoRr8B5v9CUm7T+wqmMg
	9tyoUDcrgXOe4/f75kdOiKcgDoFJyQDGD/2Ad/c3KB5ydQzIukTg3dCSBY6qYWN6MS3uW2XgPNpwA
	r9Ti/nILW8W5hQkMKeznfXvHHwRI+y7K5L358o9D3vbZs1wLKdik7PDiuqOTKJkuFgi6dSSQ4G68G
	oqlQYbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QaK-0000000CX7s-0WBZ;
	Tue, 01 Sep 2026 15:39:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QaF-0000000CWtN-3a43;
	Tue, 01 Sep 2026 15:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788277173;
	bh=wUODXgYhZacnFHj80Cy6e4njwRnHoQfQUin2/Xenhl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I9gHkJVooFhhRlGHxHprAxn85LfjZB86pMdY40LnwxpUngoV8cMKvHcoFLCmwFaPi
	 +6bfRO8eYbaVRbOLWbFwAG3L7cqFrkj+8JPzfPPcCatwSmTaY5cpMmCQ3Df2X3Pe46
	 mTvMkAS9huvuIsVyprer/miRE8A9/MjGJ+d+hh/4bwho+yC4JcJMCAcANm6UtOijOK
	 5fWrciB25RNRB54+g/mjX7uyaL+aGGlI+I+63sSSC4O6V0Sc86BaL1PrhcVtCgx7Jx
	 x86NTR4oTb7iXsy2CJRycNSblDlocOJKzRhvGuJujjS8mjugvOxvKihKvP1gGfxbsP
	 iHg3tISkTmtTw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E725E17E11E0;
	Tue, 01 Sep 2026 17:39:32 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 01 Sep 2026 17:38:56 +0200
Subject: [PATCH v11 08/24] scsi: ufs: mediatek: Add dual 0.9V supply
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mt8196-ufs-v11-8-dbd007704490@collabora.com>
References: <20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com>
In-Reply-To: <20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com>
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
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788277163; l=4642;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=wUODXgYhZacnFHj80Cy6e4njwRnHoQfQUin2/Xenhl4=;
 b=LkQ2BI9PhNqIdGMz/ljL6TTkqjgX7TXWJJfr3tZebgM8EUA6d3VuzRxThLNfzQdpf4TRWMfmM
 nqUxImIAbnfAC6NjkMy9XjAx7tuOT2DG2+arFngAFErSXcdkAE9hINq
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_083936_105556_13E46EAB 
X-CRM114-Status: GOOD (  18.36  )
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

The MT8196 SoC has an additional pin in comparison of the MT8183 SoC,
that is used to feed the host controller with a 0.9V supply.

In preparation of this SoC support, add in platform data and
driver the management a second optional 0.9V regulator named
"avdd09-1".

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 82 ++++++++++++++++++++++++++++++-----------
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 61 insertions(+), 22 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index eb7a0cc464f4..f298ea6f6ecb 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -41,6 +41,7 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up);
 
 struct ufs_mtk_soc_data {
 	bool has_avdd09;
+	bool has_avdd09_1;
 };
 
 static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
@@ -515,16 +516,29 @@ static int ufs_mtk_09v_off(struct ufs_mtk_host *host)
 	struct arm_smccc_res res;
 	int ret;
 
-	if (!host->reg_avdd09)
+	if (!host->reg_avdd09 && !host->reg_avdd09_1)
 		return 0;
 
 	ufs_mtk_va09_pwr_ctrl(res, 0);
-	ret = regulator_disable(host->reg_avdd09);
-	if (ret) {
-		dev_err(host->hba->dev, "Failed to disable avdd09-supply: %pe\n",
-			ERR_PTR(ret));
-		ufs_mtk_va09_pwr_ctrl(res, 1);
-		return ret;
+
+	if (host->reg_avdd09) {
+		ret = regulator_disable(host->reg_avdd09);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to disable avdd09-supply: %pe\n",
+				ERR_PTR(ret));
+			ufs_mtk_va09_pwr_ctrl(res, 1);
+			return ret;
+		}
+	}
+
+	if (host->reg_avdd09_1) {
+		ret = regulator_disable(host->reg_avdd09_1);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to disable avdd09-1-supply: %pe\n",
+				ERR_PTR(ret));
+			ufs_mtk_va09_pwr_ctrl(res, 1);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -535,14 +549,25 @@ static int ufs_mtk_09v_on(struct ufs_mtk_host *host)
 	struct arm_smccc_res res;
 	int ret;
 
-	if (!host->reg_avdd09)
+	if (!host->reg_avdd09 && !host->reg_avdd09_1)
 		return 0;
 
-	ret = regulator_enable(host->reg_avdd09);
-	if (ret) {
-		dev_err(host->hba->dev, "Failed to enable avdd09-supply: %pe\n",
-			ERR_PTR(ret));
-		return ret;
+	if (host->reg_avdd09) {
+		ret = regulator_enable(host->reg_avdd09);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to enable avdd09-supply: %pe\n",
+				ERR_PTR(ret));
+			return ret;
+		}
+	}
+
+	if (host->reg_avdd09_1) {
+		ret = regulator_enable(host->reg_avdd09_1);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to enable avdd09-1-supply: %pe\n",
+				ERR_PTR(ret));
+			return ret;
+		}
 	}
 
 	ufs_mtk_va09_pwr_ctrl(res, 1);
@@ -1232,20 +1257,33 @@ static int ufs_mtk_get_supplies(struct ufs_mtk_host *host)
 	struct device *dev = host->hba->dev;
 	const struct ufs_mtk_soc_data *data = of_device_get_match_data(dev);
 
-	if (!data || !data->has_avdd09)
+	if (!data)
 		return 0;
 
-	host->reg_avdd09 = devm_regulator_get_optional(dev, "avdd09");
-	if (IS_ERR(host->reg_avdd09)) {
-		if (PTR_ERR(host->reg_avdd09) == -ENODEV) {
+	if (data->has_avdd09) {
+		host->reg_avdd09 = devm_regulator_get_optional(dev, "avdd09");
+		if (IS_ERR(host->reg_avdd09)) {
+			if (PTR_ERR(host->reg_avdd09) != -ENODEV) {
+				return dev_err_probe(dev,
+						     PTR_ERR(host->reg_avdd09),
+						     "Failed to get avdd09 regulator: %pe\n",
+						     host->reg_avdd09);
+			}
 			host->reg_avdd09 = NULL;
-			return 0;
 		}
+	}
 
-		return dev_err_probe(dev,
-				     PTR_ERR(host->reg_avdd09),
-				     "Failed to get avdd09 regulator: %pe\n",
-				     host->reg_avdd09);
+	if (data->has_avdd09_1) {
+		host->reg_avdd09_1 = devm_regulator_get_optional(dev, "avdd09-1");
+		if (IS_ERR(host->reg_avdd09_1)) {
+			if (PTR_ERR(host->reg_avdd09_1) != -ENODEV) {
+				return dev_err_probe(dev,
+						     PTR_ERR(host->reg_avdd09_1),
+						     "Failed to get avdd09-1 regulator: %pe\n",
+						     host->reg_avdd09);
+			}
+			host->reg_avdd09_1 = NULL;
+		}
 	}
 
 	return 0;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index c63740b98e85..477fb9e36555 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -176,6 +176,7 @@ struct ufs_mtk_mcq_intr_info {
 struct ufs_mtk_host {
 	struct phy *mphy;
 	struct regulator *reg_avdd09;
+	struct regulator *reg_avdd09_1;
 	struct reset_control_bulk_data resets[MTK_UFS_NUM_RESETS];
 	struct ufs_hba *hba;
 	struct ufs_mtk_crypt_cfg *crypt;

-- 
2.55.0


