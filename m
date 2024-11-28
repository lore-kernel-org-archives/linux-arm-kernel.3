Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83247D6D258
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 03:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AOBziDuT5YTUhpLHkhqSfJSif72YhhrKJJn81tVZRIs=; b=tKF6dzPACp9it7+3R035Ahh4eP
	dGQsHtJJa056BwAe2GvJ7sBDCNsobmdOcJ6GF6Ogjv/SGLbOu03dszQ/twBF7FY6XSvj4aJkQt65s
	hc6iCqqkdbFj55dodcww2oLrC0Ze6xE6xe/zZBPdTXPb5VRY0cdUrE6uZzDxrpXx1mamfXb+a500b
	1Ecicp8lrh6X/Xf3eBzp866wCR29OHl6hM9fUuHOpjhbgzbSwmdQpvYIXYCWJIhQMgSpY2OPYtPzx
	liURwnJyjf00UGqLY0Hd7T+306rLf1f5dvqgMKXPjF6Ur3wBrpx0q3m+rzIuZsny2e4yUzcmRhtrL
	cacL3EQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGUvb-0000000Eak8-1Sa2;
	Thu, 28 Nov 2024 03:10:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGUub-0000000EaYu-09Xb;
	Thu, 28 Nov 2024 03:09:50 +0000
X-UUID: 387a88f4ad3611ef9048ed6ed365623b-20241127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AOBziDuT5YTUhpLHkhqSfJSif72YhhrKJJn81tVZRIs=;
	b=pIcHdo6LwbbOQcYdfdw4V+y4Pe3znAEA+7+mnTN+2mOjrP2i6MgG6LpMTTp7SU9Fa9Iwlj9yrKVxJdnMDm8Tjw+j3S+IwKEJmE5PrtoKY1LtGVjC9ms6HdRqz/wc7iKNjmKXOxeEzpuWBq797WxA20i64jkMuIhg4wIfHtY86SM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:9f1e6710-7a5d-4032-bbe6-49e6ec61dda0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:29099f23-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 387a88f4ad3611ef9048ed6ed365623b-20241127
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 452076117; Wed, 27 Nov 2024 20:09:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Nov 2024 11:09:42 +0800
Received: from mszsdclx1211.gcn.mediatek.inc (10.16.7.31) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Nov 2024 11:09:42 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <ck.hu@mediatek.com>,
	<granquet@baylibre.com>, <dmitry.osipenko@collabora.com>,
	<rex-bc.chen@mediatek.com>, <jitao.shi@mediatek.com>,
	<mac.shen@mediatek.com>, <peng.liu@mediatek.com>,
	<liankun.yang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/1] drm/mediatek: Add return value check when reading DPCD
Date: Thu, 28 Nov 2024 11:08:16 +0800
Message-ID: <20241128030940.25657-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_190949_075651_8D70F23D 
X-CRM114-Status: GOOD (  13.45  )
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

Returns the number of bytes transferred (1) on success.
Check the return value to confirm that AUX communication is successful.

Fixes: d9e6ea02fc3f ("drm/mediatek: dp: Add MT8195 External DisplayPort support")

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
Changes in V2:
- Modify Fixes in Commit Message.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240930092000.5385-1-liankun.yang@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1cc916b16471..9dc68ec2ff43 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2101,6 +2101,7 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	enum drm_connector_status ret = connector_status_disconnected;
 	bool enabled = mtk_dp->enabled;
 	u8 sink_count = 0;
+	size_t value;
 
 	if (!mtk_dp->train_info.cable_plugged_in)
 		return ret;
@@ -2115,7 +2116,12 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	 * function, we just need to check the HPD connection to check
 	 * whether we connect to a sink device.
 	 */
-	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+	value = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+	if (value < 0) {
+		drm_err(mtk_dp->drm_dev, "Failed to read DP Sink Count: %zd\n", value);
+		return ret;
+	}
+
 	if (DP_GET_SINK_COUNT(sink_count))
 		ret = connector_status_connected;
 
-- 
2.45.2


