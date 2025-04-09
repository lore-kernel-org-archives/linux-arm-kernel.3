Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95071C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnxw45w8kpgpC8qumn8+vS8fP2Yxm3uaX+F6k/XjVXg=; b=ndBhLCPJ8lZnPxpoHIkR5T8CCe
	f0ChDmAk9fiFEjn2LbAzQYqYY/1ToxIxHvjp2sCq1g3UjZfC8Ww+ZyMzqn0v/0/JC/31fXjjAvw+r
	DM7xwijY0aahvBliaIpc7A8JvSrkrC9x/U1csgFvQ0e/sByTQGNdnfO8QecmdGa70biWd+HY0C2T6
	pISxIaexoMQO2cIQuy2zzKgbRytezGbv7YDiKw4PWVvB11Wd6TH1Lmj7b4sofDoKg2woiL/pD/Hz6
	SwPDRPh5YQvWmzaTLLK52klRag3fKY499F/D5YptGKm2Y/H+FY2h409uF0XeO0uktdUH9Asv0XWha
	f5Qg5JFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W2C-00000007Nuo-3vRB;
	Wed, 09 Apr 2025 14:04:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VFg-00000007FXF-2aze;
	Wed, 09 Apr 2025 13:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204439;
	bh=zZr6yH3bzNUKYQNohuflsUGVkNO30lMv+25F4v2pwNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j+M84xEX3H+WhAi9791YXn4QztJqDrjB0RJVzsQ0sZRZ/zUKemx6p11BLYzevVHT4
	 4n0MzXNs0DfHilQ7+zVsaWBuHLhOHwgdEsTbaNJyC5D4E4CTtJUzKZxZq1Q14oNfBN
	 i2dPNBL46bMQULMouGlSMNUU3pR7tkfhJblEfvh52JJ5KG+0zbrna1Dkoi5Qf4y+V0
	 s9ThNOgNaSohuxPRc/HP7A+9Aw00oAJeGluti8A7NgtS07oFllwez1U5YFR2hkwRt7
	 aL+8FhbuS1svUR/mOWLjpJWpE6HAV5t3CMsXoUQl1lyW9YLq3zqsYGmkJAyLcmotXp
	 NEfh6HSwIaHRw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 97A7317E0F85;
	Wed,  9 Apr 2025 15:13:57 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v8 22/23] drm/mediatek: mtk_hdmi_v2: Add debugfs ops and implement ABIST
Date: Wed,  9 Apr 2025 15:13:17 +0200
Message-ID: <20250409131318.108690-23-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061400_833142_CE7D4D9A 
X-CRM114-Status: GOOD (  15.90  )
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

Implement the Automated Built-In Self-Test ABIST functionality
provided by the HDMIv2 IP and expose it through the "hdmi_abist"
debugfs file.

Write "1" to this file to activate ABIST, or "0" to deactivate.

The ABIST functionality can be used to validate that the HDMI
Transmitter itself works and that can output a valid image to
the HDMI Display that is connected.

This is especially useful when trying to rule out any possible
issue that is related to the display pipeline, as the HDMI Tx
is always the last component; this means that HDMI ABIST can be
used even without prior display controller pipeline configuration.

The expected output is a 100% color bar (rainbow) test pattern.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 123 +++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index dd10f272eabd..284d5cc0cffd 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1188,6 +1188,128 @@ static int mtk_hdmi_v2_hdmi_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int mtk_hdmi_v2_set_abist(struct mtk_hdmi *hdmi, bool enable)
+{
+	struct drm_display_mode *mode = &hdmi->mode;
+	int abist_format = -EINVAL;
+	bool interlaced;
+
+	if (!enable) {
+		regmap_clear_bits(hdmi->regs, TOP_CFG00, HDMI_ABIST_ENABLE);
+		return 0;
+	}
+
+	if (!mode->hdisplay || !mode->vdisplay)
+		return -EINVAL;
+
+	interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
+
+	switch (mode->hdisplay) {
+	case 720:
+		if (mode->vdisplay == 480)
+			abist_format = 2;
+		else if (mode->vdisplay == 576)
+			abist_format = 11;
+		break;
+	case 1280:
+		if (mode->vdisplay == 720)
+			abist_format = 3;
+		break;
+	case 1440:
+		if (mode->vdisplay == 480)
+			abist_format = interlaced ? 5 : 9;
+		else if (mode->vdisplay == 576)
+			abist_format = interlaced ? 14 : 18;
+		break;
+	case 1920:
+		if (mode->vdisplay == 1080)
+			abist_format = interlaced ? 4 : 10;
+		break;
+	case 3840:
+		if (mode->vdisplay == 2160)
+			abist_format = 25;
+		break;
+	case 4096:
+		if (mode->vdisplay == 2160)
+			abist_format = 26;
+		break;
+	default:
+		break;
+	}
+	if (abist_format < 0)
+		return abist_format;
+
+	regmap_update_bits(hdmi->regs, TOP_CFG00, HDMI_ABIST_VIDEO_FORMAT,
+			   FIELD_PREP(HDMI_ABIST_VIDEO_FORMAT, abist_format));
+	regmap_set_bits(hdmi->regs, TOP_CFG00, HDMI_ABIST_ENABLE);
+	return 0;
+}
+
+static int mtk_hdmi_v2_debug_abist_show(struct seq_file *m, void *arg)
+{
+	struct mtk_hdmi *hdmi = m->private;
+	bool en;
+	u32 val;
+	int ret;
+
+	if (!hdmi)
+		return -EINVAL;
+
+	ret = regmap_read(hdmi->regs, TOP_CFG00, &val);
+	if (ret)
+		return ret;
+
+	en = FIELD_GET(HDMI_ABIST_ENABLE, val);
+
+	seq_printf(m, "HDMI Automated Built-In Self Test: %s\n",
+		   en ? "Enabled" : "Disabled");
+
+	return 0;
+}
+
+static ssize_t mtk_hdmi_v2_debug_abist_write(struct file *file,
+					     const char __user *ubuf,
+					     size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	int ret;
+	u32 en;
+
+	if (!m || !m->private || *offp)
+		return -EINVAL;
+
+	ret = kstrtouint_from_user(ubuf, len, 0, &en);
+	if (ret)
+		return ret;
+
+	if (en < 0 || en > 1)
+		return -EINVAL;
+
+	mtk_hdmi_v2_set_abist((struct mtk_hdmi *)m->private, en);
+	return len;
+}
+
+static int mtk_hdmi_v2_debug_abist_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, mtk_hdmi_v2_debug_abist_show, inode->i_private);
+}
+
+static const struct file_operations mtk_hdmi_debug_abist_fops = {
+	.owner = THIS_MODULE,
+	.open = mtk_hdmi_v2_debug_abist_open,
+	.read = seq_read,
+	.write = mtk_hdmi_v2_debug_abist_write,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void mtk_hdmi_v2_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+{
+	struct mtk_hdmi *dpi = hdmi_ctx_from_bridge(bridge);
+
+	debugfs_create_file("hdmi_abist", 0640, root, dpi, &mtk_hdmi_debug_abist_fops);
+}
+
 static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
 	.attach = mtk_hdmi_v2_bridge_attach,
 	.detach = mtk_hdmi_v2_bridge_detach,
@@ -1207,6 +1329,7 @@ static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = mtk_hdmi_v2_hdmi_clear_infoframe,
 	.hdmi_write_infoframe = mtk_hdmi_v2_hdmi_write_infoframe,
+	.debugfs_init = mtk_hdmi_v2_debugfs_init,
 };
 
 /*
-- 
2.49.0


