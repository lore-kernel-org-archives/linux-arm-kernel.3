Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9691D68BE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 03:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUUtronK2tOKVzyDfxFKwurj9xQ03TFrWa6ZOex8Ssg=; b=0VRmqY63kg1abjy/+0Td52yiwn
	/qO8Go4L4I5FUJ6BvIFC21Hu7XbMVXV8TRKOH7tzbLP+U+JOTtX7n4P19XF4/9DduFL9mwMhebFLk
	lfoEEHtd5Fb++ImKDhF4WrFenzhxz/TUWJ6NReCprUiljDMOF0TnssYnW5oLuI4i4XDMC16zo/zvA
	enBD/EB93DnZpUvlRunVW5PkLmp3OEutZTAJvEQm49jnBeLp6eTePc5eaCNoxYHF3/z5iMXVNNT4p
	5WeB4CG/ryGbH4bc7fgwDylI42VlYGxDF7mOv65SU17mrmyC9QEq3FPI6QHnMt+MY0NffCMoo+ffK
	LWuJaMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC9M2-00000004rsl-1zth;
	Sat, 16 Nov 2024 03:20:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC9IS-00000004qsu-06EV;
	Sat, 16 Nov 2024 03:16:29 +0000
X-UUID: 28fe339ca3c911ef82ff63e91e7eb18c-20241115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nUUtronK2tOKVzyDfxFKwurj9xQ03TFrWa6ZOex8Ssg=;
	b=DKZNTauj2qtMGWlrxPVzNo/4tVn28XV4Vh2zJecALY6dxleelDM/IEcMUCGDPIzBj8/Xbm9f9phSd2KDYc1n9/pvGNGmotLpS2wVaMfvKwrk5tYOXWyQ4FTb616hMp3P11ZjFXRJ86h0uEmmuj//yProyDGhLMpQvf6gF1OZA4Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:50627e55-3cbc-4f24-9449-8d92509999e4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:ce19b8a,CLOUDID:8913234f-a2ae-4b53-acd4-c3dc8f449198,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 28fe339ca3c911ef82ff63e91e7eb18c-20241115
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 196838727; Fri, 15 Nov 2024 20:16:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Nov 2024 11:16:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:16:20 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 3/3] media: mediatek: vcodec: add description for vsi struct
Date: Sat, 16 Nov 2024 11:16:12 +0800
Message-ID: <20241116031616.15656-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241116031616.15656-1-yunfei.dong@mediatek.com>
References: <20241116031616.15656-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.545300-8.000000
X-TMASE-MatchedRID: QzgX5l08Brj4Q348LKfXODTV/B1Uu+XCIfZjRfGTydh30F1387KCPeFC
	6BP4FUP+sHCh+gSvrNHxHXxxAO/d2TAo/rUTivG7ntCoZKs0mGVWOQQSa4vbHYrop5D7tDibo8W
	MkQWv6iUoTQl7wNH8Po2j49Ftap9EOwBXM346/+xg/+avkj9YHpxolbzzbs7jxv3fBrcyQljxpG
	XdoEJuf4ArO0ccm6/s
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.545300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2AED127212B07905FEECADE221F0410C89323E36A5ECA0D45753A2C32047CE352000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_191628_065018_A4732587 
X-CRM114-Status: GOOD (  10.90  )
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

If the video shared information (vsi) is changed accidentally,
will leading to play h264 bitstream fail if the firmware won't
be changed at the same time. Marking the shared struct with
"shared interface with firmware".

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index a7de95b9a7c0..5a202691e209 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -30,6 +30,7 @@ enum vdec_h264_core_dec_err_type {
 
 /**
  * struct vdec_h264_slice_lat_dec_param  - parameters for decode current frame
+ *        (shared interface with firmware)
  *
  * @sps:		h264 sps syntax parameters
  * @pps:		h264 pps syntax parameters
@@ -48,7 +49,7 @@ struct vdec_h264_slice_lat_dec_param {
 };
 
 /**
- * struct vdec_h264_slice_info - decode information
+ * struct vdec_h264_slice_info - decode information (shared interface with firmware)
  *
  * @nal_info:		nal info of current picture
  * @timeout:		Decode timeout: 1 timeout, 0 no timeout
@@ -72,7 +73,7 @@ struct vdec_h264_slice_info {
 
 /**
  * struct vdec_h264_slice_vsi - shared memory for decode information exchange
- *        between SCP and Host.
+ *        between SCP and Host (shared interface with firmware).
  *
  * @wdma_err_addr:		wdma error dma address
  * @wdma_start_addr:		wdma start dma address
-- 
2.46.0


