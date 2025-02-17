Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBE6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ln01XI0tK6pmIxYPhbqHwdO4KVLsmthtDZxQafGRnoY=; b=LrS2INfjCoaLKjve280hda5/Fw
	OIpnwAa3j/H0MtGaRe2GyZR6PV1GNLY+z7Ugy9iM3VMCINqLVfWcjlgFfSnX/DvgBsJ3a24fSwLSg
	J17lz6H/OFsidLJR3yd/13swYTXo+JJi4zMIYmMH4ojNdvJ6SG/MysEuoV2LpXKHLYAntX5bBxymm
	NMrJChssrJcm009Xz/eRrTQaTnFH8PSbrOtNbDJ1WfrYYAW1aljMTXpNXbq9c3ls+7VWVwiYE0UaK
	GEaW3Ki/2JVGNlcDzyQ2fRK0LN7q0v1iiuFz+xATDNwrJQNU1BD5/5uJ3At3iy/UKAsa1BqDZ6Pzl
	bTnKUpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3tx-00000005FL9-46XD;
	Mon, 17 Feb 2025 16:23:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3N3-000000057xx-3Uui;
	Mon, 17 Feb 2025 15:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739807359;
	bh=uaAALFJVjaAfoYWZ5VhGUqcok73clxTF6XnEep9JE7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ReeUPJBYcNPj37eRgYWz8gh+mjSo31filW7RUpL3DOHPrtyOawmBvv14B86KAPLzq
	 4xzNeMB+zASitMFxGKvFykrtM5eTn66Bg+JsNQuy58kSm/18w1a5YvgqFp7Nxbp+jj
	 DwLV74lC0y6ZSZ2362K+endZViwUvOapZg7KNwdfSENmY9v/DYpdMvKfTNSDxv2AEj
	 Z1PwjMTEeS0H90GWe/lwvhZhWu1748WogOZVYGV0L7SgFX4NR9t0ztVoDjCYcJJ7b0
	 z69g3Cwx0yAwb9yL1qEr4itnGcqf1wybOzGtBth1RuDfg5JkLF6ZFi4qW6Q3lsjcOE
	 /8L4tlfKUy2Vw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 46EF317E14E7;
	Mon, 17 Feb 2025 16:49:18 +0100 (CET)
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
Subject: [PATCH v7 02/43] drm/mediatek: mtk_dpi: Add support for Pattern Generator in debugfs
Date: Mon, 17 Feb 2025 16:47:55 +0100
Message-ID: <20250217154836.108895-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074922_045391_5CAFB0C4 
X-CRM114-Status: GOOD (  18.64  )
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

This IP includes a Pattern Generator which is useful for debugging
and testing purposes: add the relevant register and bits to the
mtk_dpi_regs.h header, and implement support for it in mtk_dpi.

Adding this required to introduce a .debugfs_init() callback for
the DPI bridge, which creates a "dpi_test_pattern" file in the
directory of the appropriate connector.

The pattern generator can generate various internal patterns and
this submission includes support for:
 - 256 or 1024 shades of gray in a Vertical or Horizontal Pattern
 - Vertical Color Bars
 - Frame border
 - Dot Moire

This generator also supports filling the entire screen with one
custom color, but support for that is not included in this commit.

Enabling and disabling this generator can be done by sending a
string to the dpi_test_pattern debugfs file; the pattern is
expected to be formatted as follows:

         <enable (1) or disable (0)> <pattern number>

where the pattern number can be a number from 0 to 7, excluding 5.

Of course 5 is excluded because that activates custom color fill
which, again, is not supported in this commit.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 108 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   4 +
 2 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 1864eb02dbf5..fc937490feda 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -4,8 +4,10 @@
  * Author: Jie Qiu <jie.qiu@mediatek.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/media-bus-format.h>
@@ -166,6 +168,18 @@ static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
 	writel(tmp, dpi->regs + offset);
 }
 
+static void mtk_dpi_test_pattern_en(struct mtk_dpi *dpi, u8 type, bool enable)
+{
+	u32 val;
+
+	if (enable)
+		val = FIELD_PREP(DPI_PAT_SEL, type) | DPI_PAT_EN;
+	else
+		val = 0;
+
+	mtk_dpi_mask(dpi, DPI_PATTERN0, val, DPI_PAT_SEL | DPI_PAT_EN);
+}
+
 static void mtk_dpi_sw_reset(struct mtk_dpi *dpi, bool reset)
 {
 	mtk_dpi_mask(dpi, DPI_RET, reset ? RST : 0, RST);
@@ -767,6 +781,99 @@ mtk_dpi_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static int mtk_dpi_debug_tp_show(struct seq_file *m, void *arg)
+{
+	struct mtk_dpi *dpi = m->private;
+	bool en;
+	u32 val;
+
+	if (!dpi)
+		return -EINVAL;
+
+	val = readl(dpi->regs + DPI_PATTERN0);
+	en = val & DPI_PAT_EN;
+	val = FIELD_GET(DPI_PAT_SEL, val);
+
+	seq_printf(m, "DPI Test Pattern: %s\n", en ? "Enabled" : "Disabled");
+
+	if (en) {
+		seq_printf(m, "Internal pattern %d: ", val);
+		switch (val) {
+		case 0:
+			seq_puts(m, "256 Vertical Gray\n");
+			break;
+		case 1:
+			seq_puts(m, "1024 Vertical Gray\n");
+			break;
+		case 2:
+			seq_puts(m, "256 Horizontal Gray\n");
+			break;
+		case 3:
+			seq_puts(m, "1024 Horizontal Gray\n");
+			break;
+		case 4:
+			seq_puts(m, "Vertical Color bars\n");
+			break;
+		case 6:
+			seq_puts(m, "Frame border\n");
+			break;
+		case 7:
+			seq_puts(m, "Dot moire\n");
+			break;
+		default:
+			seq_puts(m, "Invalid selection\n");
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static ssize_t mtk_dpi_debug_tp_write(struct file *file, const char __user *ubuf,
+				      size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	u32 en, type;
+	char buf[6];
+
+	if (!m || !m->private || *offp || len > sizeof(buf) - 1)
+		return -EINVAL;
+
+	memset(buf, 0, sizeof(buf));
+	if (copy_from_user(buf, ubuf, len))
+		return -EFAULT;
+
+	if (sscanf(buf, "%u %u", &en, &type) != 2)
+		return -EINVAL;
+
+	if (en < 0 || en > 1 || type < 0 || type > 7)
+		return -EINVAL;
+
+	mtk_dpi_test_pattern_en((struct mtk_dpi *)m->private, type, en);
+	return len;
+}
+
+static int mtk_dpi_debug_tp_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, mtk_dpi_debug_tp_show, inode->i_private);
+}
+
+static const struct file_operations mtk_dpi_debug_tp_fops = {
+	.owner = THIS_MODULE,
+	.open = mtk_dpi_debug_tp_open,
+	.read = seq_read,
+	.write = mtk_dpi_debug_tp_write,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void mtk_dpi_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+{
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
+
+	debugfs_create_file("dpi_test_pattern", 0640, root, dpi, &mtk_dpi_debug_tp_fops);
+}
+
 static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.attach = mtk_dpi_bridge_attach,
 	.mode_set = mtk_dpi_bridge_mode_set,
@@ -779,6 +886,7 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.debugfs_init = mtk_dpi_debugfs_init,
 };
 
 void mtk_dpi_start(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index 62bd4931b344..a0b1d18bbbf7 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -235,4 +235,8 @@
 #define MATRIX_SEL_RGB_TO_JPEG		0
 #define MATRIX_SEL_RGB_TO_BT601		2
 
+#define DPI_PATTERN0		0xf00
+#define DPI_PAT_EN			BIT(0)
+#define DPI_PAT_SEL			GENMASK(6, 4)
+
 #endif /* __MTK_DPI_REGS_H */
-- 
2.48.1


