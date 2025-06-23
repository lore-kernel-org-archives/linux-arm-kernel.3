Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED19AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDJvnnP1g6HzFSsr/nXffuaKpElPDYcfUn/pYE/gpJM=; b=Ee+gbs7FiZFxqcDGp89XMB16Ku
	KmS6x/9x47DygTAdmXBjNEzXa+QjdbmG0AAWEWqHGPH783hchiT0vs6VxIrVoVnek/ItQhxoBAOyG
	JCsUsyy4g9yJqgyuwM4aVWTZ3PYwrou/FEQQqCY9TqLN5rmzf/T3nuaHfSRl3FayORY1s0lxXf8L+
	1eGtCUPJJDa3F0QqDHE65tWVgCbYIJXxJB6FDPVHDFKGAThfXQizhERWV/UwGca9A7ywq2iXFH47Z
	dvZ+2h6tx+y5cGKCxgVmbRdVIeTR8F9VJL/Wf6yv9ucALoHyOX5Hu1fPbGLU4PBuuQaKj3y0vwSSe
	8rguJ0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnJY-00000003tBJ-1GDA;
	Mon, 23 Jun 2025 19:58:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeRb-00000002M1R-2eoe;
	Mon, 23 Jun 2025 10:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750674630;
	bh=/QFxXe01PFFnCtLqP1DFxluzDGDSgJm4wedQNERGaTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VLH4pBzS/Pz+mliv6tH0ryJV3+7WRO/fbyBBcu0kswDysQchF61NAkMGtf30tGiXU
	 zqUCC0Um+JFiWufcIlZ+kUafI6Ym5TcQw80aeYKLyMIHHvy+ZdvCvyALHN99MCHuRj
	 KE7mnUfoXccwOhLnj+QaFUxg86LkTcuWZGUrXtIiKxTaY7BYr56lb4e06Zh7/H3U9d
	 ExiRwLomgo9U18Yn3HTny+hqghLW4l9GarUH9ibPYyO++gZRGaK92pxcZKTcyx/Ami
	 D8KrUyJwNZKO5BiTiIvMe3ZlcdCE9lE/R5CE7C6Ttz5ZnErLdnPa0rfjVT516gbyNM
	 jyoFkox+87t4Q==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:e046:b666:1d47:e832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C4DB17E156D;
	Mon, 23 Jun 2025 12:30:29 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 03/30] clk: mediatek: clk-mux: Add ops for mux gates with set/clr/upd and FENC
Date: Mon, 23 Jun 2025 12:29:13 +0200
Message-Id: <20250623102940.214269-4-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623102940.214269-1-laura.nao@collabora.com>
References: <20250623102940.214269-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_033031_817604_C866A525 
X-CRM114-Status: GOOD (  14.39  )
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

MT8196 uses set/clr/upd registers for mux gate enable/disable control,
along with a FENC bit to check the status. Add new set of mux gate
clock operations with support for set/clr/upd and FENC status logic.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 drivers/clk/mediatek/clk-mux.c | 48 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mux.h | 34 ++++++++++++++++++++++++
 3 files changed, 84 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index c17fe1c2d732..136a4bc6dbe6 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -20,6 +20,8 @@
 
 #define MHZ (1000 * 1000)
 
+#define MTK_WAIT_FENC_DONE_US	30
+
 struct platform_device;
 
 /*
diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 60990296450b..b1b8eeb0b501 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -15,6 +15,7 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 
+#include "clk-mtk.h"
 #include "clk-mux.h"
 
 struct mtk_clk_mux {
@@ -30,6 +31,33 @@ static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
 	return container_of(hw, struct mtk_clk_mux, hw);
 }
 
+static int mtk_clk_mux_fenc_enable_setclr(struct clk_hw *hw)
+{
+	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
+	unsigned long flags;
+	u32 val;
+	int ret;
+
+	if (mux->lock)
+		spin_lock_irqsave(mux->lock, flags);
+	else
+		__acquire(mux->lock);
+
+	regmap_write(mux->regmap, mux->data->clr_ofs,
+		     BIT(mux->data->gate_shift));
+
+	ret = regmap_read_poll_timeout_atomic(mux->regmap, mux->data->fenc_sta_mon_ofs,
+					      val, val & BIT(mux->data->fenc_shift), 1,
+					      MTK_WAIT_FENC_DONE_US);
+
+	if (mux->lock)
+		spin_unlock_irqrestore(mux->lock, flags);
+	else
+		__release(mux->lock);
+
+	return ret;
+}
+
 static int mtk_clk_mux_enable_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
@@ -70,6 +98,16 @@ static void mtk_clk_mux_disable_setclr(struct clk_hw *hw)
 			BIT(mux->data->gate_shift));
 }
 
+static int mtk_clk_mux_fenc_is_enabled(struct clk_hw *hw)
+{
+	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
+	u32 val;
+
+	regmap_read(mux->regmap, mux->data->fenc_sta_mon_ofs, &val);
+
+	return val & BIT(mux->data->fenc_shift);
+}
+
 static int mtk_clk_mux_is_enabled(struct clk_hw *hw)
 {
 	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
@@ -168,6 +206,16 @@ const struct clk_ops mtk_mux_gate_clr_set_upd_ops  = {
 };
 EXPORT_SYMBOL_GPL(mtk_mux_gate_clr_set_upd_ops);
 
+const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_ops = {
+	.enable = mtk_clk_mux_fenc_enable_setclr,
+	.disable = mtk_clk_mux_disable_setclr,
+	.is_enabled = mtk_clk_mux_fenc_is_enabled,
+	.get_parent = mtk_clk_mux_get_parent,
+	.set_parent = mtk_clk_mux_set_parent_setclr_lock,
+	.determine_rate = mtk_clk_mux_determine_rate,
+};
+EXPORT_SYMBOL_GPL(mtk_mux_gate_fenc_clr_set_upd_ops);
+
 static struct clk_hw *mtk_clk_register_mux(struct device *dev,
 					   const struct mtk_mux *mux,
 					   struct regmap *regmap,
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 943ad1d7ce4b..ba390b579e6c 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -28,11 +28,13 @@ struct mtk_mux {
 	u32 set_ofs;
 	u32 clr_ofs;
 	u32 upd_ofs;
+	u32 fenc_sta_mon_ofs;
 
 	u8 mux_shift;
 	u8 mux_width;
 	u8 gate_shift;
 	s8 upd_shift;
+	u8 fenc_shift;
 
 	const struct clk_ops *ops;
 	signed char num_parents;
@@ -77,6 +79,7 @@ struct mtk_mux {
 
 extern const struct clk_ops mtk_mux_clr_set_upd_ops;
 extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
+extern const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_ops;
 
 #define MUX_GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
@@ -118,6 +121,37 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 			0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,		\
 			mtk_mux_clr_set_upd_ops)
 
+#define MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,		\
+			_mux_ofs, _mux_set_ofs, _mux_clr_ofs,		\
+			_shift, _width, _gate, _upd_ofs, _upd,		\
+			_fenc_sta_mon_ofs, _fenc, _flags) {		\
+		.id = _id,						\
+		.name = _name,						\
+		.mux_ofs = _mux_ofs,					\
+		.set_ofs = _mux_set_ofs,				\
+		.clr_ofs = _mux_clr_ofs,				\
+		.upd_ofs = _upd_ofs,					\
+		.fenc_sta_mon_ofs = _fenc_sta_mon_ofs,			\
+		.mux_shift = _shift,					\
+		.mux_width = _width,					\
+		.gate_shift = _gate,					\
+		.upd_shift = _upd,					\
+		.fenc_shift = _fenc,					\
+		.parent_names = _parents,				\
+		.num_parents = ARRAY_SIZE(_parents),			\
+		.flags = _flags,					\
+		.ops = &mtk_mux_gate_fenc_clr_set_upd_ops,		\
+	}
+
+#define MUX_GATE_FENC_CLR_SET_UPD(_id, _name, _parents,			\
+			_mux_ofs, _mux_set_ofs, _mux_clr_ofs,		\
+			_shift, _width, _gate, _upd_ofs, _upd,		\
+			_fenc_sta_mon_ofs, _fenc)			\
+		MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,	\
+			_mux_ofs, _mux_set_ofs, _mux_clr_ofs,		\
+			_shift, _width, _gate, _upd_ofs, _upd,		\
+			_fenc_sta_mon_ofs, _fenc, 0)
+
 int mtk_clk_register_muxes(struct device *dev,
 			   const struct mtk_mux *muxes,
 			   int num, struct device_node *node,
-- 
2.39.5


