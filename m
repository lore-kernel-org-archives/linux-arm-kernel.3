Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A5510F3DCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 05:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rth3eEYX1mJeBa3vsqLYmJh6OVUcxBZs54IkCDDT1lw=; b=oKbzLC9pCzASFDr/toov6lJmfc
	14bSzqYR3PkyodXcv7bYkzQYY0G7uxVRh7j55qotq3NsWkIWejybYiz+MbtMrerrFQ16EJR8e7sYM
	XHG+vYM1ocsNbBFQPRZxPYHXQtxnUI2MQyeGPnkLO3cZ8DfXPnOO2T87JjGJXs0g0OTqhKCs9rbbO
	GO3tQqdUrvsFUnZjE4dREw69Ncf5n/3B9X79hqBE0BoDAVWVIxetCRgZzVw/s2fdWw8ZLiHrrAWFQ
	PX0dv+qzM7fean95GmnLQFPIP1Unv5p07ArIgb9nTIdNws07SGqQFkhx85rv8eL7AvlsxSDOBlMfd
	NeJoJv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6M33-00000008ZKq-1LTZ;
	Sat, 28 Mar 2026 05:17:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6M2U-00000008YtS-0xsY;
	Sat, 28 Mar 2026 05:16:52 +0000
X-UUID: 500c79ca2a6511f1a6de359d7043e138-20260327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rth3eEYX1mJeBa3vsqLYmJh6OVUcxBZs54IkCDDT1lw=;
	b=KyN5BHFH2PsBjVU/8Xp1n1FqVPSKrBb/MjcO9lsc19zt+9l5JaesFJI5azWHQH9jDHGONm1SqbFKUH/IrmX2ld9BDzKT3JqJ+SswXCAZaeZCaY1docmQkyZxh1BwKG+IpQ+HPJdPlbml2gG1K9/ye0iXvJeM26Ncw5IouesnGBs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5507db12-a46e-488d-8dd0-9d411800062a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:dcc039d5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 500c79ca2a6511f1a6de359d7043e138-20260327
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 112103977; Fri, 27 Mar 2026 22:16:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 28 Mar 2026 13:16:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 28 Mar 2026 13:16:41 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 08/14] media: mediatek: vcodec: clean xpc status
Date: Sat, 28 Mar 2026 13:16:18 +0800
Message-ID: <20260328051630.7937-9-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260328051630.7937-1-yunfei.dong@mediatek.com>
References: <20260328051630.7937-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_221650_358070_599B7AE6 
X-CRM114-Status: GOOD (  14.32  )
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

The driver need to clean xpc status when receive decoder hardware
interrupt for mt8196 platform.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        | 28 +++++++++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        | 13 +++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
index 881d5de41e05..e4e527fe54dc 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
@@ -61,6 +61,31 @@ static int mtk_vdec_hw_prob_done(struct mtk_vcodec_dec_dev *vdec_dev)
 	return 0;
 }
 
+static void mtk_vdec_hw_write_reg_mask(void __iomem *reg_base, u32 reg_offset, u32 val, u32 mask)
+{
+	void __iomem *reg_addr = reg_base + reg_offset;
+	u32 reg_val;
+
+	reg_val =  readl(reg_addr);
+	reg_val &= ~mask;
+	reg_val |= (val & mask);
+	writel(reg_val, reg_addr);
+}
+
+static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_dev *dev)
+{
+	u32 val, mask, addr = VDEC_XPC_CLEAN_ADDR;
+
+	if (dev->main_dev->chip_name != MTK_VDEC_MT8196)
+		return;
+
+	val = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL : VDEC_XPC_CORE_VAL;
+	mask = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_MASK : VDEC_XPC_CORE_MASK;
+
+	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, val, mask);
+	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, 0, mask);
+}
+
 static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 {
 	struct mtk_vdec_hw_dev *dev = priv;
@@ -88,6 +113,8 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
 	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
 
+	mtk_vdec_hw_clean_xpc(dev);
+
 	wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
 
 	mtk_v4l2_vdec_dbg(3, ctx, "wake up ctx %d, dec_done_status=%x",
@@ -166,6 +193,7 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	subdev_dev->hw_idx = hw_idx;
 	subdev_dev->main_dev = main_dev;
 	subdev_dev->reg_base[VDEC_HW_SYS] = main_dev->reg_base[VDEC_HW_SYS];
+	subdev_dev->reg_base[VDEC_HW_XPC] = main_dev->reg_base[VDEC_HW_MISC];
 	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
 
 	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
index 83fe8b9428e6..5c906143c9af 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
@@ -18,17 +18,26 @@
 #define VDEC_IRQ_CLR 0x10
 #define VDEC_IRQ_CFG_REG 0xa4
 
+#define VDEC_XPC_CLEAN_ADDR 0xc
+#define VDEC_XPC_LAT_VAL BIT(0)
+#define VDEC_XPC_LAT_MASK BIT(0)
+
+#define VDEC_XPC_CORE_VAL BIT(4)
+#define VDEC_XPC_CORE_MASK BIT(4)
+
 #define IS_SUPPORT_VDEC_HW_IRQ(hw_idx) ((hw_idx) != MTK_VDEC_LAT_SOC)
 
 /**
  * enum mtk_vdec_hw_reg_idx - subdev hardware register base index
- * @VDEC_HW_SYS : vdec soc register index
+ * @VDEC_HW_SYS:  vdec soc register index
  * @VDEC_HW_MISC: vdec misc register index
- * @VDEC_HW_MAX : vdec supported max register index
+ * @VDEC_HW_XPC:  vdec xpc register index
+ * @VDEC_HW_MAX:  vdec supported max register index
  */
 enum mtk_vdec_hw_reg_idx {
 	VDEC_HW_SYS,
 	VDEC_HW_MISC,
+	VDEC_HW_XPC,
 	VDEC_HW_MAX
 };
 
-- 
2.45.2


