Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5244CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 15:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS9mQB9wGCuINpJ601WfaUT2MzMWcUqPg7bv+4jlKOo=; b=h+54Co6Kex+qM3WZ6f9Y4+PUOZ
	ABZpWV6wZYJJ3dmuPwoO4/98s2pau/4BcVUuJpw1nL8xK+KClLwLfNfyNyavFkOh5BLZG5O15hsgX
	UWaOx8TIk8TNkULfXwTvFkVy3qGLqJEhWS0hvaGsnAPJ93O1XjJyZki0odW3PYAwtupANUtIs93mj
	BZOyLPGkzWeEDRWRB6qBNW/j+Dc8MVq5b9fnWM2qIRP3+qz+puqBU3h0n9fNewpntKtE6viCE2vgg
	RotDuezEiOeDEBlW4fVsWWG43IAaLRtVXAqQrKjIMPHZ7nfitnyKJmFtSj1DoF+o36Jw3JWg0dDYe
	MZ+Dj+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyB1O-00000004smE-2VY8;
	Mon, 15 Sep 2025 15:21:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyB1F-00000004sbv-2luw;
	Mon, 15 Sep 2025 15:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757949687;
	bh=XfcmfGHRmWdOlEuhQ9p5peLB10CoGZdkoIDy+k+bKXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ik46wrf9By+ENaD3+nlLA2NBJNrnjBB04j442V+i0B2mRK2SNuU5XmCI33WJfgl1t
	 nwB1W/CLjWZMuWmk5ZSMOq2GBDwySSlWpsLEkpPDt5nJMaSB5xNPVRnmbvS4UwtPcn
	 21Yu07FEO9zMTuUvKykSSFl1yaQ8W1nTz/GQHh87PWAHSej3cGX48Pn4ct1M/0fp1Z
	 LzUZubt/tR2JaTj10QsL83rRNDwOw+v85RbwqpS7gDE4Smxz7EATsb2HLnr5qLiP1l
	 eThj81982O0Lgrf7OIemfwnn1JfGs13nNzSt1eCspTi13U5VnGzSm0AjmMvlUGZRIK
	 uuSb3nXn4kiZg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:1c8d:f5ba:823d:730b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A43B117E1340;
	Mon, 15 Sep 2025 17:21:26 +0200 (CEST)
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
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v6 03/27] clk: mediatek: clk-mux: Add ops for mux gates with set/clr/upd and FENC
Date: Mon, 15 Sep 2025 17:19:23 +0200
Message-Id: <20250915151947.277983-4-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250915151947.277983-1-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_082129_853367_32F7343C 
X-CRM114-Status: GOOD (  14.34  )
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

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-mux.c | 49 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mux.h | 45 +++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 60990296450b..3931d157b262 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -17,6 +17,8 @@
 
 #include "clk-mux.h"
 
+#define MTK_WAIT_FENC_DONE_US	30
+
 struct mtk_clk_mux {
 	struct clk_hw hw;
 	struct regmap *regmap;
@@ -30,6 +32,33 @@ static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
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
@@ -70,6 +99,16 @@ static void mtk_clk_mux_disable_setclr(struct clk_hw *hw)
 			BIT(mux->data->gate_shift));
 }
 
+static int mtk_clk_mux_fenc_is_enabled(struct clk_hw *hw)
+{
+	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
+	u32 val;
+
+	regmap_read(mux->regmap, mux->data->fenc_sta_mon_ofs, &val);
+
+	return !!(val & BIT(mux->data->fenc_shift));
+}
+
 static int mtk_clk_mux_is_enabled(struct clk_hw *hw)
 {
 	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
@@ -168,6 +207,16 @@ const struct clk_ops mtk_mux_gate_clr_set_upd_ops  = {
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
index 943ad1d7ce4b..a4fd17a18532 100644
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
@@ -118,6 +121,48 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 			0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,		\
 			mtk_mux_clr_set_upd_ops)
 
+#define MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,		\
+			_num_parents, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,	\
+			_shift, _width, _gate, _upd_ofs, _upd,			\
+			_fenc_sta_mon_ofs, _fenc, _flags) {			\
+		.id = _id,							\
+		.name = _name,							\
+		.mux_ofs = _mux_ofs,						\
+		.set_ofs = _mux_set_ofs,					\
+		.clr_ofs = _mux_clr_ofs,					\
+		.upd_ofs = _upd_ofs,						\
+		.fenc_sta_mon_ofs = _fenc_sta_mon_ofs,				\
+		.mux_shift = _shift,						\
+		.mux_width = _width,						\
+		.gate_shift = _gate,						\
+		.upd_shift = _upd,						\
+		.fenc_shift = _fenc,						\
+		.parent_names = _parents,					\
+		.parent_index = _paridx,					\
+		.num_parents = _num_parents,					\
+		.flags = _flags,						\
+		.ops = &mtk_mux_gate_fenc_clr_set_upd_ops,			\
+	}
+
+#define MUX_GATE_FENC_CLR_SET_UPD(_id, _name, _parents,			\
+			_mux_ofs, _mux_set_ofs, _mux_clr_ofs,		\
+			_shift, _width, _gate, _upd_ofs, _upd,		\
+			_fenc_sta_mon_ofs, _fenc)			\
+		MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,	\
+			NULL, ARRAY_SIZE(_parents), _mux_ofs,		\
+			_mux_set_ofs, _mux_clr_ofs, _shift,		\
+			_width, _gate, _upd_ofs, _upd,			\
+			_fenc_sta_mon_ofs, _fenc, 0)
+
+#define MUX_GATE_FENC_CLR_SET_UPD_INDEXED(_id, _name, _parents, _paridx,	\
+			_mux_ofs, _mux_set_ofs, _mux_clr_ofs,			\
+			_shift, _width, _gate, _upd_ofs, _upd,			\
+			_fenc_sta_mon_ofs, _fenc)				\
+		MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,	\
+			ARRAY_SIZE(_paridx), _mux_ofs, _mux_set_ofs,		\
+			_mux_clr_ofs, _shift, _width, _gate, _upd_ofs, _upd,	\
+			_fenc_sta_mon_ofs, _fenc, 0)
+
 int mtk_clk_register_muxes(struct device *dev,
 			   const struct mtk_mux *muxes,
 			   int num, struct device_node *node,
-- 
2.39.5


