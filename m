Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5670D5AE6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 07:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ij/Pkc68/tMvKFouIIkQzd6NRGM3PpJwsMpduvSrW6c=; b=dMaAFFPW8GrQuXWTnbIz7j9aCH
	mw1hR4PeUBrzEyD7cwXQVzNzJoK8waN7cP0PEj/8EYfWgdTKgk8PwNhnL04v/PRCd93JUGbqcI4I5
	k4w1a4Wnhz2SMo9Ex2MfegQkMFTej9eExSEzaAHinl5oXyNRA4zHZ7ioNj8xiC5Ljpyb4AU9qPKGM
	SRRidx0sPw/TQwAZsDCL7JXMDF/iXspMrsZxOwkBbEGFk/hMezI0h/CtKCjS6AtJQd3KSrutmeEog
	7b3Bj+fukhi9kiVuVaMKH2tR1WkL0q4EiAdivSiTDp5uRKJbktGzKjTdvMxZwPi8QSvyF4VEvRQnM
	+8IxQleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8xGz-000000062JL-1x5o;
	Thu, 07 Nov 2024 07:49:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8xDa-000000061mz-0oM4;
	Thu, 07 Nov 2024 07:46:15 +0000
X-UUID: 5a80ceaa9cdc11ef9048ed6ed365623b-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ij/Pkc68/tMvKFouIIkQzd6NRGM3PpJwsMpduvSrW6c=;
	b=IruzngkeGkEaiwPhu8PKxFmoWr8q+ndImzLzRTAutGWW6aHgEQ5akzkykRl9kIlASOH+1mN+hM1T+8wivsSSXiV5wAwJvJfZR4JQ/wcuED3qhFzYuQEpf4Hft7yHCwFqL2P3ryf7y6MX0IevojcOtOSSwg5NXcurv/xxP1yQCmY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:f2823831-3167-4f25-9575-95be6c3bd3a7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:78aac41b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5a80ceaa9cdc11ef9048ed6ed365623b-20241107
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 536070109; Thu, 07 Nov 2024 00:46:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Nov 2024 15:46:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Nov 2024 15:46:06 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, "Steve
 Cho" <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 3/3] media: mediatek: vcodec: add description for vsi struct
Date: Thu, 7 Nov 2024 15:45:57 +0800
Message-ID: <20241107074603.31998-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241107074603.31998-1-yunfei.dong@mediatek.com>
References: <20241107074603.31998-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.830300-8.000000
X-TMASE-MatchedRID: qT9V7Qri98/4Q348LKfXODTV/B1Uu+XCVF5mUd6sIMbfUZT83lbkEFYL
	5En8iw1cYK2MeoqGYrsTf/L7yykBhRgHZ8655DOPFEUknJ/kEl7dB/CxWTRRu3aDLLDbFMGF0UT
	/dQxOY20mHAOqHmr56RRj6h8FWziDnwc2O+AmjnI5/p3swc1Qyd8iVj83f8BmXC985TxzPD5yCf
	lkZIkD29G2RxJZVcZ6hJVRlkc0uv5GBXoeyrLHXVBo425nomviD2TeXwRpghwOIqZ2uUSDWA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.830300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4012359CA539B8B849F8ECBF0882470F25AB36637C77F575576BC230D5F7D4F42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_234614_261947_5643FB5A 
X-CRM114-Status: GOOD (  11.95  )
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
---
 .../mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index d0aecd9621d9..661ea84b6621 100644
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


