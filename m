Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FABD116F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 07:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rni7uJ0z5ZtWF2fAtSRscntxIpbbXoVq66CSOcHTro=; b=qjlKijer+RlT5tafVZrmyqAapm
	l0n3H8u7QJJqWN2v2JV35l5R95Gy0g07HS3uTXYF5sJIT+eEzQ1SMVNv/IYF10jqg/FQIuU+GRNbB
	18K7AmoGeF/pOhBUXm+NYLRoxG0QStAmCty53wMZgs42sylfOVG8SuqCUuVe6iIAjR90UvyYFwLPu
	jYfTHK3NEJhVf3yvu97EuJf8xaYd4frfwpwkhVgidztaNK2VHd+dWfqQ5GuCYduA3cWMmVWugxHI0
	Mqv4Rd591CRZFEKds0T61bwRUsMG0Ng5Ad6vIZ3ezo6su4Wv50EXmxEQoCItEk6MDkoIZwpBt8whq
	Jt3rv9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL0P-00000004y69-3a1Z;
	Tue, 02 Dec 2025 07:41:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL0K-00000004xzT-2Qpq;
	Tue, 02 Dec 2025 07:40:57 +0000
X-UUID: 39449de4cf5211f0a52f393f94899d25-20251202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6rni7uJ0z5ZtWF2fAtSRscntxIpbbXoVq66CSOcHTro=;
	b=axDTze66VN7+LKHrwMCm7P5Ts2FO9yF0iFSy/b0Tuynb6xMakDl+aS1bn0aUWvzkC60PdT9UcpjhqkOLFpvCouQ9pPC0eAzWG3WrGPSwUvSTbBwlUnJ0g5eBOzEfEqK+jbIfIiYVRRq9m+v1vF744x6gZBU/oeJQoVU3XV9mGdg=;
X-CID-CACHE: Type:Local,Time:202512020040-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:29f8187f-db8b-492b-8769-a5f877c95a48,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:ccd30e28-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 39449de4cf5211f0a52f393f94899d25-20251202
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 125565146; Tue, 02 Dec 2025 00:40:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 2 Dec 2025 15:40:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 2 Dec 2025 15:40:46 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v6 05/10] media: mediatek: vcodec: refactor setup dst buffer metadata interface for VP9 decoder
Date: Tue, 2 Dec 2025 15:40:32 +0800
Message-ID: <20251202074038.3173-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251202074038.3173-1-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_234056_627993_B8C92B9B 
X-CRM114-Status: GOOD (  13.10  )
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

Previously, calling vdec_vp9_slice_setup_single_from_src_to_dst
with v4l2_m2m_next_src_buf to obtain both buffers resulted in -EINVAL,
interrupting the decoding process. To resolve this,
the interface should be updated to set both src and dst buffers
for metadata configuration.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index fa0f406f7726..9513ddde7c7c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -696,21 +696,22 @@ static int vdec_vp9_slice_tile_offset(int idx, int mi_num, int tile_log2)
 	return min(offset, mi_num);
 }
 
-static
-int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *instance)
+static int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *instance,
+						       struct mtk_vcodec_mem *bs,
+						       struct vdec_fb *fb)
 {
-	struct vb2_v4l2_buffer *src;
-	struct vb2_v4l2_buffer *dst;
+	struct mtk_video_dec_buf *src_buf_info;
+	struct mtk_video_dec_buf *dst_buf_info;
 
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	if (!src_buf_info)
 		return -EINVAL;
 
-	dst = v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
-	if (!dst)
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+	if (!dst_buf_info)
 		return -EINVAL;
 
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &dst_buf_info->m2m_buf.vb, true);
 
 	return 0;
 }
@@ -1800,7 +1801,7 @@ static int vdec_vp9_slice_setup_single(struct vdec_vp9_slice_instance *instance,
 	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_vp9_slice_setup_single_from_src_to_dst(instance);
+	ret = vdec_vp9_slice_setup_single_from_src_to_dst(instance, bs, fb);
 	if (ret)
 		goto err;
 
-- 
2.45.2


