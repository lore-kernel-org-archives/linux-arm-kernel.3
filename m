Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061E2CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 05:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QX86LULi1lNCUxDv79hdC2i0nPDCwie71771w9KqkA0=; b=IDVO+zfCOsS9RwJdjCdnolkSh9
	lNp/CtVJql+YSgg66UTxiJgKoho/6EN+5eKaoe89ai+5dQY0PvJmJ+MKmlg2K5u+8t4h6NN0Jl7tT
	PsLmAWiqt90tpj6g3F7OH7oICnwQPTFOlfzpmOqLTTLGES4EWfsRCnyfIBqLmlgJVl1eFWCzYI5Ht
	A0m3Exh+FEXCUE/fphjxPxV6xWrca6GDOOS17+IeIFK4yzjRdTenBNONOQfdCoP6zlZfNQHH/mygX
	e1qz3G5GPMIK3y5b5wZYhnTVbZju+kxu2oBmRV1hTie23fKySIZatTRnzQjItdAuEePQ77/ZXyOwR
	SLX0Ecyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0D2U-00000006jPW-0uLi;
	Sun, 21 Sep 2025 05:55:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0D2R-00000006jN8-02Io;
	Sun, 21 Sep 2025 05:55:08 +0000
X-UUID: 849e62e296af11f0a52f393f94899d25-20250920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QX86LULi1lNCUxDv79hdC2i0nPDCwie71771w9KqkA0=;
	b=LC3s9qsucNtxIkjLiP5W9fujUiDdmEfUaoiQAuSTjcxSGz4ewRj7EZbLQySqDB9Ox1seQRcqsB1E/WMp+IEALJ5UzBB91qzeoBwnCUW9TnqYX7M04kKOzGk+PSdsqHqWkBq6nvvMVv0aMJEhRQymQF1pfll5Wq+t43AaBB4Wu7E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:fcb75f14-e855-4e63-a31f-493bb507ac50,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:1ca6b93,CLOUDID:4d9cc66c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 849e62e296af11f0a52f393f94899d25-20250920
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1505249025; Sat, 20 Sep 2025 22:55:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 21 Sep 2025 13:55:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Sun, 21 Sep 2025 13:55:00 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Jay
 Liu <jay.liu@mediatek.com>
Subject: [PATCH v1 1/1] drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n function issue
Date: Sun, 21 Sep 2025 13:53:05 +0800
Message-ID: <20250921055416.25588-2-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250921055416.25588-1-jay.liu@mediatek.com>
References: <20250921055416.25588-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_225507_056521_E8C09802 
X-CRM114-Status: GOOD (  13.43  )
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

if matrixbit is 11,
The range of color matrix is from 0 to (BIT(12) - 1).
Values from 0 to (BIT(11) - 1) represent positive numbers,
values from BIT(11) to (BIT(12) - 1) represent negative numbers.
For example, -1 need converted to 8191.
so convert S31.32 to HW Q2.11 format by drm_color_ctm_s31_32_to_qm_n,
and set int_bits to 2.

Fixes: 738ed4156fba ("drm/mediatek: Add matrix_bits private data for ccorr")
Change-Id: Icb2aae1dee21d9ea34f263a54850fee26d97d455
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 26 +++--------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 10d60d2c2a56..634b31346921 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -80,28 +80,7 @@ void mtk_ccorr_stop(struct device *dev)
 	writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
 }
 
-/* Converts a DRM S31.32 value to the HW S1.n format. */
-static u16 mtk_ctm_s31_32_to_s1_n(u64 in, u32 n)
-{
-	u16 r;
-
-	/* Sign bit. */
-	r = in & BIT_ULL(63) ? BIT(n + 1) : 0;
-
-	if ((in & GENMASK_ULL(62, 33)) > 0) {
-		/* identity value 0x100000000 -> 0x400(mt8183), */
-		/* identity value 0x100000000 -> 0x800(mt8192), */
-		/* if bigger this, set it to max 0x7ff. */
-		r |= GENMASK(n, 0);
-	} else {
-		/* take the n+1 most important bits. */
-		r |= (in >> (32 - n)) & GENMASK(n, 0);
-	}
-
-	return r;
-}
-
-void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
+bool mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
 	struct drm_property_blob *blob = state->ctm;
@@ -109,6 +88,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	const u64 *input;
 	uint16_t coeffs[9] = { 0 };
 	int i;
+	int int_bits = 2;
 	struct cmdq_pkt *cmdq_pkt = NULL;
 	u32 matrix_bits = ccorr->data->matrix_bits;
 
@@ -119,7 +99,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	input = ctm->matrix;
 
 	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
-		coeffs[i] = mtk_ctm_s31_32_to_s1_n(input[i], matrix_bits);
+		coeffs[i] = drm_color_ctm_s31_32_to_qm_n(input[i], int_bits, matrix_bits);
 
 	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
-- 
2.46.0


