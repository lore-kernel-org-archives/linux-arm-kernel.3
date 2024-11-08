Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E040D5E124
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 03:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ftcH+N9F+aEUhbxneOfSb5rYHmfkO21YWF7Mbk1RLs=; b=nyeidlL5yRwAjQLbsjwFz7KQlW
	wqb025rQRXTqde7qG52L7CoyXCyCEu86wElbKrp1gXOWgJ+GLJmorecBeQgu5CIg7LxygHFQIZcsN
	3P9iTzjTb0c9y4bq8ximVd7vNubp5fbaOijyVMLg2Ccp/As6F3HeHAT49VF/3Yy4odztGF+Z4NOrU
	4AJkL6hQ6bavN5dSyOwI6PLSnOE1T68O3yz/9lo0hMgwPMpSSRmGAsg5rd9/k57PI5N3kDoQphOpz
	2Y2GvC8QuQAH9C/xh/LdTuKGyefDVLKo/g+U68OtiUtC3aN3pCM61OyafEPiwQswr1x8VFP+CJOAu
	g6WjfTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9G0m-00000009B9m-3353;
	Fri, 08 Nov 2024 03:50:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9FrO-000000099pU-3E1F;
	Fri, 08 Nov 2024 03:40:36 +0000
X-UUID: 32bf1f8c9d8311ef9048ed6ed365623b-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1ftcH+N9F+aEUhbxneOfSb5rYHmfkO21YWF7Mbk1RLs=;
	b=hI0+FeSo4S3ExhwyC0W5hsUBL0X9t707aIt1HNvWn0iAHCXpqqce/iTDtlW8LXJ0PqtT4UpSN0U03Tf2iOlsUo2gqi/2R33MU7JnQA3fNqZ8cJ4COwL61INgL6c56b8Y1b2elQTckxe/yMQ5JWV0vQySJFGJeLoXapanfD+a+SE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:5cc35c15-b5ed-4be6-9aea-d85e3b9f99f8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:b77db6ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 32bf1f8c9d8311ef9048ed6ed365623b-20241107
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1941558834; Thu, 07 Nov 2024 20:40:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 11:40:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 11:40:23 +0800
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
Subject: [PATCH v4 3/3] media: mediatek: vcodec: add description for vsi struct
Date: Fri, 8 Nov 2024 11:40:12 +0800
Message-ID: <20241108034019.20064-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108034019.20064-1-yunfei.dong@mediatek.com>
References: <20241108034019.20064-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.519500-8.000000
X-TMASE-MatchedRID: +ngMWxkROpD4Q348LKfXODTV/B1Uu+XCIfZjRfGTydh30F1387KCPeFC
	6BP4FUP+tPz1mNVqu0woX6fjWPUAloJiDh6eUBMR4RtSDjG+z7ACnYfpEgyUOJsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNZd/mwLf2BVUtX6FTdeBEpDL97e0jrsKJNgI91Ytj1EagfpknKz4xIGUTG
	VAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.519500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F4778ECA64CBFF029DEE0544CE99F8F850A81C507F4D2D16539D5C45192053932000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_194034_840754_490CA53A 
X-CRM114-Status: GOOD (  11.71  )
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
---
 .../mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 238639a07703..eef6dd548625 100644
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


