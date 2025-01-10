Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76512E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 01:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPZbZFoVYr5AdVXq5AU7LQF+gQLbPxfojCSUJtlrKEo=; b=S6j5sucY+1ts9rTFfTQJcj9dTi
	KQbCsKIYsTjAE7jc+bhDeVIfcBQscra+elkjN5qQQZj8pKEevVjwAglaxj0jPL7iCEmH4KP5+f8rs
	sDnFQBk1TbKqKSZeJ1wqCMu1KUvho6ADb27/ZK+lIXCplizAodCFxDzBbPzZAUdXJstdfv6rFr5OU
	gGnn7nmHp7Ro0OWRQsxFnfzMFv63rMZPjrosRZQzbBBLLU0/Jb4jaIeAlGpUHgzA1swaqQUyXWsGy
	rjHOyWhYMpa6UJnO/QXFdgSt6vjYml5uJBfMOW9SzXwTRGqMlYQG4gIDpA9kGaXq7OVRQHOCenvgH
	0G9bx+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3un-0000000Dljm-21Ox;
	Fri, 10 Jan 2025 01:34:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3oh-0000000DkIm-2d9n;
	Fri, 10 Jan 2025 01:28:06 +0000
X-UUID: 20287968cef211ef9048ed6ed365623b-20250109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TPZbZFoVYr5AdVXq5AU7LQF+gQLbPxfojCSUJtlrKEo=;
	b=WtnkTY1a/LCXx4LDMmx413cUaW29FqjCWBtXVL5qSR34bly85AJgLn0vF+tfGJLDu4InrCWJE8xzD4gX1M6TGFqLkS+FXBAwY67dNobDNvuB9p3kZZpyjrL3KOgsEkc6VBhFAylyTupEx4LVPO7U1zbBAGsd7vMl57QFbFOvhW8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:7973e17f-5480-4e7b-8af6-9d4e3f4d4b8c,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:aed3a80e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 20287968cef211ef9048ed6ed365623b-20250109
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1507942942; Thu, 09 Jan 2025 18:27:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 09:27:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 09:27:55 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	kyrie.wu <kyrie.wu@mediatek.com>
Subject: [RESEND,V1,04/12] media: mediatek: jpeg: add jpeg smmu sid setting
Date: Fri, 10 Jan 2025 09:27:41 +0800
Message-ID: <20250110012749.30072-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110012749.30072-1-kyrie.wu@mediatek.com>
References: <20250110012749.30072-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_172803_709506_E9A8E21B 
X-CRM114-Status: GOOD (  14.85  )
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

Add a configuration to set jpeg dec & enc smmu sid

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  6 ++++
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 11 +++++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 30 +++++++++++++++++--
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  4 +++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 26 ++++++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  4 +++
 6 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index c3ccc525d9fd..77b3bd6c4d3f 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1655,6 +1655,9 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
+#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
+	mtk_jpeg_enc_set_smmu_sid(hw_id);
+#endif
 	mtk_jpeg_set_enc_dst(ctx,
 			     comp_jpeg[hw_id]->reg_base,
 			     &dst_buf->vb2_buf);
@@ -1771,6 +1774,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
+#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
+	mtk_jpeg_dec_set_smmu_sid(hw_id);
+#endif
 	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
 				jpeg->variant->support_34bit,
 				&jpeg_src_buf->dec_param,
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 8fddc133c46c..d3aba1e6cae8 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -36,6 +36,17 @@
 
 #define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
 
+#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
+#define JPG_REG_CORE0_GUSER_ID                          0x380d0000
+#define JPG_REG_CORE1_GUSER_ID                          0x388d0000
+#define JPG_REG_GUSER_ID_MASK                           0x7
+#define JPG_REG_GUSER_ID_DEC_SID                        0x4
+#define JPG_REG_GUSER_ID_ENC_SID                        0x5
+#define JPG_REG_DEC_GUSER_ID_SHIFT                      8
+#define JPG_REG_ENC_GUSER_ID_SHIFT                      4
+#define GUSER_ID_MAPRANGE                               4
+#endif
+
 /**
  * enum mtk_jpeg_ctx_state - states of the context state machine
  * @MTK_JPEG_INIT:		current state is initialized
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index d868e46aaf37..3adbdb8e2d96 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -274,6 +274,32 @@ void mtk_jpeg_dec_reset(void __iomem *base)
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_dec_reset);
 
+#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
+void mtk_jpeg_dec_set_smmu_sid(int hwid)
+{
+	void __iomem *dec_reg_base;
+	u32 val, mask;
+
+	if (hwid)
+		dec_reg_base = ioremap(JPG_REG_CORE1_GUSER_ID, GUSER_ID_MAPRANGE);
+	else
+		dec_reg_base = ioremap(JPG_REG_CORE0_GUSER_ID, GUSER_ID_MAPRANGE);
+	if (!dec_reg_base) {
+		pr_err("Failed to map jpgdec JPG_REG_GUSER_ID\n");
+		return;
+	}
+
+	val = ioread32(dec_reg_base);
+	mask = ~(JPG_REG_GUSER_ID_MASK << JPG_REG_DEC_GUSER_ID_SHIFT);
+	val &= mask;
+	val |= (JPG_REG_GUSER_ID_DEC_SID << JPG_REG_DEC_GUSER_ID_SHIFT);
+
+	iowrite32(val, dec_reg_base);
+	iounmap(dec_reg_base);
+}
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_set_smmu_sid);
+#endif
+
 static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
 				u8 yscale_h, u8 uvscale_w, u8 uvscale_h)
 {
@@ -552,7 +578,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct mtk_jpeg_src_buf *jpeg_src_buf;
 	enum vb2_buffer_state buf_state;
-	struct mtk_jpeg_ctx *ctx;
 	u32 dec_irq_ret;
 	u32 irq_status;
 	int i;
@@ -562,7 +587,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 
 	cancel_delayed_work(&jpeg->job_timeout_work);
 
-	ctx = jpeg->hw_param.curr_ctx;
 	src_buf = jpeg->hw_param.src_buffer;
 	dst_buf = jpeg->hw_param.dst_buffer;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
@@ -585,7 +609,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(jpeg);
-	pm_runtime_put(ctx->jpeg->dev);
+	pm_runtime_put(jpeg->dev);
 	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
index 2948c9c300a4..2a5680f52ccb 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
@@ -79,4 +79,8 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
 void mtk_jpeg_dec_reset(void __iomem *dec_reg_base);
 void mtk_jpeg_dec_start(void __iomem *dec_reg_base);
 
+#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
+void mtk_jpeg_dec_set_smmu_sid(int hwid);
+#endif
+
 #endif /* _MTK_JPEG_HW_H */
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index ca06d4f435cd..d8ebb4d34a86 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -67,6 +67,32 @@ void mtk_jpeg_enc_reset(void __iomem *base)
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_enc_reset);
 
+#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
+void mtk_jpeg_enc_set_smmu_sid(int hwid)
+{
+	void __iomem *enc_reg_base;
+	u32 val, mask;
+
+	if (hwid)
+		enc_reg_base = ioremap(JPG_REG_CORE1_GUSER_ID, GUSER_ID_MAPRANGE);
+	else
+		enc_reg_base = ioremap(JPG_REG_CORE0_GUSER_ID, GUSER_ID_MAPRANGE);
+	if (!enc_reg_base) {
+		pr_err("Failed to map jpgenc JPG_REG_GUSER_ID\n");
+		return;
+	}
+
+	val = ioread32(enc_reg_base);
+	mask = ~(JPG_REG_GUSER_ID_MASK << JPG_REG_ENC_GUSER_ID_SHIFT);
+	val &= mask;
+	val |= (JPG_REG_GUSER_ID_ENC_SID << JPG_REG_ENC_GUSER_ID_SHIFT);
+
+	iowrite32(val, enc_reg_base);
+	iounmap(enc_reg_base);
+}
+EXPORT_SYMBOL_GPL(mtk_jpeg_enc_set_smmu_sid);
+#endif
+
 u32 mtk_jpeg_enc_get_file_size(void __iomem *base, bool support_34bit)
 {
 	/*
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
index 31ec9030ae88..723391aba639 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
@@ -93,4 +93,8 @@ void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
 			  struct vb2_buffer *dst_buf);
 void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base);
 
+#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
+void mtk_jpeg_enc_set_smmu_sid(int hwid);
+#endif
+
 #endif /* _MTK_JPEG_ENC_HW_H */
-- 
2.46.0


