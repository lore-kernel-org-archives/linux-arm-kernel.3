Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5E4D0C5EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHwbRt4IaPUH08ICdMZ+woEqrGocbpoaS9nGp6F57ps=; b=d+v90agsZn4gIj8SyI8a099D4o
	n3fm8IMAuQx/wl7PbaKQCoHuldXv82AdelXvHy/KkO0Ttjm9bXUSYu1NFxVxGFte4lUKcGHlXx8v4
	yLheIGS/ZGhMV9qKpJLFajE5Wh5a78fQePm6Qf6V2w2BpvEJehdZ1qxNSFCmwGGDK7vhDEGF/Y4au
	TFfQ56Jgn4bVog0UdZnur7m8ESLYTH22QZlA6sr0/sWk7sL9A/2bTNAA8ypAVbvGa9s9ZTVRyaUzb
	ClNsuIf1qpzdY94jQV8xvcl1+nGU+omVlIRWhNwgWID+ZiRoosLKTq7EnR8ypeK371mhyY9I0O/1J
	inbQJPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FsM-000000030ji-3OLh;
	Fri, 25 Oct 2024 08:40:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Fjg-00000002zEx-0hjz;
	Fri, 25 Oct 2024 08:31:57 +0000
X-UUID: 93ada5e492ab11ef82ff63e91e7eb18c-20241025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gHwbRt4IaPUH08ICdMZ+woEqrGocbpoaS9nGp6F57ps=;
	b=cSwwoTeD+7Cz0LJB3Z9idLKBvi9Hla4Ew1hGqJBB1+ahyOe8CMNGOR8YS0cEaT4vU6Dr5scFXKyM0wDfC9HrFn4hY7hXYFKWmaUdyitgTI8GeyO6EpvbFK2tjUeOmSFIhKT0qqjBKGSYp4DtMIin+Nlp+TU/HDZuh/l5vdPz+jA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:ebd9857d-1e8c-498e-baf2-80668ff1876a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:6e60dacc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 93ada5e492ab11ef82ff63e91e7eb18c-20241025
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2080409535; Fri, 25 Oct 2024 01:31:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Oct 2024 16:31:45 +0800
Received: from mszsdclx1211.gcn.mediatek.inc (10.16.7.31) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Oct 2024 16:31:44 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <ck.hu@mediatek.com>,
	<dmitry.osipenko@collabora.com>, <msp@baylibre.com>,
	<rex-bc.chen@mediatek.com>, <granquet@baylibre.com>, <peng.liu@mediatek.com>,
	<jitao.shi@mediatek.com>, <mac.shen@mediatek.com>,
	<liankun.yang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/3] drm/mediatek: Fix mode valid issue for dp
Date: Fri, 25 Oct 2024 16:28:28 +0800
Message-ID: <20241025083036.8829-3-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241025083036.8829-1-liankun.yang@mediatek.com>
References: <20241025083036.8829-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_013156_256942_4505A0AF 
X-CRM114-Status: GOOD (  13.40  )
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

Fix dp mode valid issue to avoid abnormal display of limit state.

After DP passes link training, it can express the lane count of the
current link status is good. Calculate the maximum bandwidth supported
by DP using the current lane count.

The color format will select the best one based on the bandwidth
requirements of the current timing mode. If the current timing mode
uses RGB and meets the DP link bandwidth requirements, RGB will be used.

If the timing mode uses RGB but does not meet the DP link bandwidthi
requirements, it will continue to check whether YUV422 meetsi
the DP link bandwidth.

FEC overhead is approximately 2.4% from DP 1.4a spec 2.2.1.4.2.
The down-spread amplitude shall either be disabled (0.0%) or up
to 0.5% from 1.4a 3.5.2.6. Add up to approximately 3% total overhead.

Because rate is already divided by 10,
mode->clock does not need to be multiplied by 10.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
Change in V2:
- Adjust the writing style.
- Add instructions.
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 613e1c842478..ae4807823a5c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2328,12 +2328,19 @@ mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	u32 bpp = info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16 : 24;
-	u32 rate = min_t(u32, drm_dp_max_link_rate(mtk_dp->rx_cap) *
-			      drm_dp_max_lane_count(mtk_dp->rx_cap),
-			 drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate) *
-			 mtk_dp->max_lanes);
+	u32 lane_count_min = mtk_dp->train_info.lane_count;
+	u32 rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate) *
+			 lane_count_min;
 
-	if (rate < mode->clock * bpp / 8)
+	/*
+	 *FEC overhead is approximately 2.4% from DP 1.4a spec 2.2.1.4.2.
+	 *The down-spread amplitude shall either be disabled (0.0%) or up
+	 *to 0.5% from 1.4a 3.5.2.6. Add up to approximately 3% total overhead.
+	 *
+	 *Because rate is already divided by 10,
+	 *mode->clock does not need to be multiplied by 10
+	 */
+	if ((rate * 97 / 100) < (mode->clock * bpp / 8))
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -2374,10 +2381,9 @@ static u32 *mtk_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct drm_display_info *display_info =
 		&conn_state->connector->display_info;
-	u32 rate = min_t(u32, drm_dp_max_link_rate(mtk_dp->rx_cap) *
-			      drm_dp_max_lane_count(mtk_dp->rx_cap),
-			 drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate) *
-			 mtk_dp->max_lanes);
+	u32 lane_count_min = mtk_dp->train_info.lane_count;
+	u32 rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate) *
+			 lane_count_min;
 
 	*num_input_fmts = 0;
 
@@ -2386,8 +2392,8 @@ static u32 *mtk_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	 * datarate of YUV422 and sink device supports YUV422, we output YUV422
 	 * format. Use this condition, we can support more resolution.
 	 */
-	if ((rate < (mode->clock * 24 / 8)) &&
-	    (rate > (mode->clock * 16 / 8)) &&
+	if (((rate * 97 / 100) < (mode->clock * 24 / 8)) &&
+	    ((rate * 97 / 100) > (mode->clock * 16 / 8)) &&
 	    (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
 		input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
 		if (!input_fmts)
-- 
2.45.2


