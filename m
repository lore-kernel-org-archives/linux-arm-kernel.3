Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C6FC624D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uF8jk8anKZ1lPLlcy5TBHMdHUwDjPI3Ql0xkBxbz0p8=; b=POptB6SvctaJhvcZ84Yi2Kr7Ct
	r4bQ/ylNKsk37TMoVvuqMoUhbQEXri4WUY/j8yPVMlJIiGzzGRY3Nz+bSU48Or3+xYFKZbe5viVJO
	KSFeE6tdGMiukEf2V0w7GlHz7Qrr5yeoVyDHPKhFbpevMe1ILuO9zWaEXcwlg8s9ofsHjvad6dqvv
	2B8O9+lpEjYhITeQQk8AXh99KjbPnNBFtkX0C5iPzJqDe3pieRAciTXWbe3d+pTm1tcij/NdZ6Mar
	CYL9/bYsf4m9N7/TH3kFuqEi8fgT2kA6A1rjQWPwiPjZSPHHtQgHiSYta6vBzVkDhJWaoWf5S/Ynp
	esrJGd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QaO-0000000CXKN-2PjB;
	Tue, 01 Sep 2026 15:39:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QaJ-0000000CX0L-0Wbi;
	Tue, 01 Sep 2026 15:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788277177;
	bh=bgEio5+zXaqy0iDoSD7PfRXIKiUuVMddvQUOAh7dUSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NVkREtplLVE46sSE5QT1T4TOXGG5aRx8+1sbYDe5+5JUVEMFmjy5UxWfmNVX5EGFb
	 VrbXHL4lnJj9/ssHc8uK38otm0au54y9cwqKdVGvgymdpEzOL7bfv8AgZWj+vnprnL
	 Q4iSxXXjnV+YaGdg+VDzQtL6IMi9QjNrZZxg9g49gXp82gY0ZaEhSN0sCeEf0Z4XY6
	 lvtzTBlbu5vjQ3mw8fEdcGlINBi3kCF/mfFWB0+Y3e6BF0MEA7MC8bJDcJWQXB0FM4
	 ExraFsrbcduGSFSIoUeTDg/cg5g0wbBdStK2PRWwjqCu5r88/wtTj+FryYk4zWZ6o6
	 /v28vIDBm5NEw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3142717E14D2;
	Tue, 01 Sep 2026 17:39:36 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 01 Sep 2026 17:38:59 +0200
Subject: [PATCH v11 11/24] scsi: ufs: mediatek: Handle misc host voltage
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mt8196-ufs-v11-11-dbd007704490@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788277163; l=3045;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=cHcU+ny9NUcLJyJ5b8J+NWxcAsqR37xItQ9MVLKBm+s=;
 b=CldqY492HQb9nw0NgFR3I/zZxQhlzGM0Gn+uriUe1a5wHeG4hVQqHBOY+J7g1sgYa0tnbO14g
 TbiqLygV7BjCBHFFA+Evx3gJJN5Blvb3leoY4KSq1tKmpEN9ZoOaoHm
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_083939_381611_2318D647 
X-CRM114-Status: GOOD (  15.07  )
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

MediaTek SoCs handled by this driver contain a per-SoC specific set of
miscellaneous supplies. These feed parts of the UFS controller silicon
inside the SoC, as opposed to the UFS card.

Add the necessary driver code to acquire these supplies using the
regulator bulk API. They should be kept on during suspend, so enable
them when acquiring.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 6bbf53b658f2..f61727879c3c 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -42,6 +42,8 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up);
 struct ufs_mtk_soc_data {
 	bool has_avdd09;
 	bool has_avdd09_1;
+	u8 num_reg_names;
+	const char *const *reg_names;
 };
 
 static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
@@ -1217,10 +1219,20 @@ static int ufs_mtk_get_supplies(struct ufs_mtk_host *host)
 {
 	struct device *dev = host->hba->dev;
 	const struct ufs_mtk_soc_data *data = of_device_get_match_data(dev);
+	int ret;
 
 	if (!data)
 		return 0;
 
+	if (data->num_reg_names) {
+		ret = devm_regulator_bulk_get_enable(dev, data->num_reg_names,
+						     data->reg_names);
+		if (ret) {
+			dev_err(dev, "Failed to get misc regulators: %pe\n", ERR_PTR(ret));
+			return ret;
+		}
+	}
+
 	if (data->has_avdd09) {
 		host->reg_avdd09 = devm_regulator_get_optional(dev, "avdd09");
 		if (IS_ERR(host->reg_avdd09)) {
@@ -2393,14 +2405,30 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
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

-- 
2.55.0


