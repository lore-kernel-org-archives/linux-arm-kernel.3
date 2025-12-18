Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABA6D6ACFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDjU2wePJnzp8vyzpzfk9DFxr3PsTDkFcbdJVt7wnaQ=; b=mnqpkbxs+e6AdGLGEpGDv+Huo5
	NEG3RSkzMRpMveZ1Rn9cOmk7e6quYAKicD+30EezOe+Ew3twrHrGDuzxH0OQup0ufndFFE6iKYWyq
	gDkGoTzhRx6fLLcHeDsy2/9++8nea/RadMuagsGeBg6zJbpAX4PrUF2S7Mn6WG+hluzxECaHC0RrM
	QKqsO3nX/VMtfFTf8WQ/SeEd3Y2SVJ0dL2frclCQBGTYjd6Lk2uhZZUW0G7Nu2XQlwccQGq5/B4NW
	rQJNY585SEhdIjWnoHa7sJmXRRl6BxhZ7+OuPXyQLaRn4lH9BY4VORRtLrqW3rSeHGgxAAN5U+YhA
	ij8/bB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDYs-00000008SUR-0hGi;
	Thu, 18 Dec 2025 12:56:54 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDYj-00000008SKi-3dwH;
	Thu, 18 Dec 2025 12:56:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766062596; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V1HiIBAJK9fFFcasnXHSMCxOTHNFItehKI1o+x4YApuVF2AfaRmR7ZUR9JmlVcox8tvW1UVqdeZj11dQ7VvCoOr10g5RwIx8aIZwt1aTIKWWf4KoFT8W0n39FmUVYX9Ff8NEXwnRhLDTLNsJOB+zTGoaqxXa6IwNH6ZkmE+roic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766062596; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WDjU2wePJnzp8vyzpzfk9DFxr3PsTDkFcbdJVt7wnaQ=; 
	b=n4kTLDNZ/q1UOuxj9OYyGkyd6BRtXm1R1sHfqP2JnwllTv195qkYqQSeYgP/ehT/cmiqMaNyR8XP7RErF8Lfad2so2NIwjyRc5g/74qXLupeAvWRraatzcCLdGQTLilNvOJgIzfsTmJ713ejyrABOwFOmkIiIDqVbijqcnnqftI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766062596;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=WDjU2wePJnzp8vyzpzfk9DFxr3PsTDkFcbdJVt7wnaQ=;
	b=ajVb0+fjfA9EMF0HWEzD0sCrvWVGaCA3kkHKfKujhtcqvsa1dFAOITB5HLxIYsyT
	JeKh/ELeTCl+aYKSQTG0gncVLRdGAbfdrP7NXomo76bWZMCSjoSJedWTj42d2KrcXUN
	2vqoqfPivz2q7B/Yg0Ue6eStbAsmdGMnyBGYjgh0=
Received: by mx.zohomail.com with SMTPS id 1766062594906868.1953715550579;
	Thu, 18 Dec 2025 04:56:34 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 18 Dec 2025 13:55:00 +0100
Subject: [PATCH v4 10/25] scsi: ufs: mediatek: Handle misc host voltage
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-mt8196-ufs-v4-10-ddec7a369dd2@collabora.com>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
In-Reply-To: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_045645_997585_37FC5634 
X-CRM114-Status: GOOD (  16.64  )
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

MediaTek SoCs handled by this driver contain a per-SoC specific set of
miscellaneous supplies. These feed parts of the UFS controller silicon
inside the SoC, as opposed to the UFS card.

Add the necessary driver code to acquire these supplies using the
regulator bulk API, and disable/enable them during suspend/resume.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 61 ++++++++++++++++++++++++++++++++++++++---
 drivers/ufs/host/ufs-mediatek.h |  2 ++
 2 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 9c0ac72d6e43..10d6b69e91a5 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -40,6 +40,8 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up);
 
 struct ufs_mtk_soc_data {
 	bool has_avdd09;
+	u8 num_reg_names;
+	const char *const *reg_names;
 };
 
 static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
@@ -1190,8 +1192,37 @@ static int ufs_mtk_get_supplies(struct ufs_mtk_host *host)
 {
 	struct device *dev = host->hba->dev;
 	const struct ufs_mtk_soc_data *data = of_device_get_match_data(dev);
+	int ret;
 
-	if (!data || !data->has_avdd09)
+	if (!data)
+		return 0;
+
+	if (data->num_reg_names) {
+		host->reg_misc = devm_kcalloc(dev, data->num_reg_names,
+					      sizeof(*host->reg_misc), GFP_KERNEL);
+		if (!host->reg_misc)
+			return -ENOMEM;
+
+		regulator_bulk_set_supply_names(host->reg_misc, data->reg_names,
+						data->num_reg_names);
+
+		ret = devm_regulator_bulk_get(dev, data->num_reg_names, host->reg_misc);
+		if (ret) {
+			dev_err(dev, "Failed to get misc regulators: %pe\n", ERR_PTR(ret));
+			return ret;
+		}
+
+		host->num_reg_misc = data->num_reg_names;
+
+		ret = regulator_bulk_enable(host->num_reg_misc, host->reg_misc);
+		if (ret) {
+			dev_err(dev, "Failed to turn on misc regulators: %pe\n",
+				ERR_PTR(ret));
+			return ret;
+		}
+	}
+
+	if (!data->has_avdd09)
 		return 0;
 
 	host->reg_avdd09 = devm_regulator_get_optional(dev, "avdd09");
@@ -1833,7 +1864,9 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 		_ufs_mtk_clk_scale(hba, false);
 	}
 
-	return 0;
+	err = regulator_bulk_disable(host->num_reg_misc, host->reg_misc);
+
+	return err;
 fail:
 	/*
 	 * Set link as off state enforcedly to trigger
@@ -1850,6 +1883,10 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	struct arm_smccc_res res;
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
+	err = regulator_bulk_enable(host->num_reg_misc, host->reg_misc);
+	if (err)
+		return err;
+
 	if (hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL)
 		ufs_mtk_dev_vreg_set_lpm(hba, false);
 
@@ -2333,14 +2370,30 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.config_scsi_dev     = ufs_mtk_config_scsi_dev,
 };
 
+static const char *const ufs_mtk_regs_avdd12_avdd18[] = {
+	"avdd12", "avdd18"
+};
+
+static const char *const ufs_mtk_regs_avdd12_ckbuf_avdd18[] = {
+	"avdd12", "avdd12-ckbuf", "avdd18"
+};
+
 static const struct ufs_mtk_soc_data mt8183_data = {
 	.has_avdd09 = true,
+	.reg_names = ufs_mtk_regs_avdd12_avdd18,
+	.num_reg_names = ARRAY_SIZE(ufs_mtk_regs_avdd12_avdd18),
+};
+
+static const struct ufs_mtk_soc_data mt8192_8195_data = {
+	.has_avdd09 = false,
+	.reg_names = ufs_mtk_regs_avdd12_ckbuf_avdd18,
+	.num_reg_names = ARRAY_SIZE(ufs_mtk_regs_avdd12_ckbuf_avdd18),
 };
 
 static const struct of_device_id ufs_mtk_of_match[] = {
 	{ .compatible = "mediatek,mt8183-ufshci", .data = &mt8183_data },
-	{ .compatible = "mediatek,mt8192-ufshci" },
-	{ .compatible = "mediatek,mt8195-ufshci" },
+	{ .compatible = "mediatek,mt8192-ufshci", .data = &mt8192_8195_data },
+	{ .compatible = "mediatek,mt8195-ufshci", .data = &mt8192_8195_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 24c8941f6b86..cb32fc987864 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -176,6 +176,8 @@ struct ufs_mtk_mcq_intr_info {
 struct ufs_mtk_host {
 	struct phy *mphy;
 	struct regulator *reg_avdd09;
+	struct regulator_bulk_data *reg_misc;
+	u8 num_reg_misc;
 	struct reset_control_bulk_data resets[MTK_UFS_NUM_RESETS];
 	struct ufs_hba *hba;
 	struct ufs_mtk_crypt_cfg *crypt;

-- 
2.52.0


