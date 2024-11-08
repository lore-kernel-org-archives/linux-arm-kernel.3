Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364FBD5E120
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 03:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qHyhtnTmpzhLmiRq7vfF+OJbaKeoQyoAn074kNyuWBw=; b=AVMepTjyWp6viJlHRzZc9MYXjT
	7on9nXTvLSwnlPY3XlKCGjpjn1ZcSh+TsJyXrFj6bm7CCpHrIwHK/Hzl/N05zQY3LnR8g6P/5roTm
	R/QQSyZseB6n1dYbGcafTZAkEVSnBJxqt9WgRwPKdDYvQHjQf4iiSLRwqJDH3tww+S6gllkSMYzW2
	XtUUYVmLx8BkKIZrrPG6OfnCk2Mvc9swIId41d5NT3/iceXP70OWqk0DEQuZzb2uwZSrLT549Z1Vs
	3gHzS+EubaWxXjyjEhnL0UXAipQNtDhC7XOgsJtIlg9V+5o0jfo99B2WQiEEwp8dLFyuK6VOrzMJ6
	0DG5xpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9FlM-000000099Cr-1S52;
	Fri, 08 Nov 2024 03:34:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9FjZ-000000098ly-3vqq;
	Fri, 08 Nov 2024 03:32:31 +0000
X-UUID: 126500409d8211ef82ff63e91e7eb18c-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qHyhtnTmpzhLmiRq7vfF+OJbaKeoQyoAn074kNyuWBw=;
	b=jXeOdRD0Bizy5m7EQH782VYku94YSuGPRtjlKgD/geXEEyorwLHZwBScB1d8NaLfsLikGoIPWYg7NeCm/m1/vWZZltdg8fsKlo3k7CbI9YGEHUyoJUfliWIEV/SPyn4Vld2zzspxwZ4RYTbeLjAifNN+EPB9lnSteiA17ZvhTww=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:19c73746-9628-45df-9e6d-db7e55a72469,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:7458b6ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 126500409d8211ef82ff63e91e7eb18c-20241107
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 756729325; Thu, 07 Nov 2024 20:32:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 11:32:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 11:32:20 +0800
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
Subject: [PATCH v6 0/5] media: mediatek: vcodec: fix v4l2_ctrl_request_complete fail
Date: Fri, 8 Nov 2024 11:32:09 +0800
Message-ID: <20241108033219.19804-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.532500-8.000000
X-TMASE-MatchedRID: FCK742qayD3fr/48DfD8ikKcYi5Qw/RV7yWPaQc4INTNAKQEz5hQBcbd
	nXrRbZelzEn2dr2GydgnP0+8BL2Zy/7yFV5x5lOPl1zsjZ1/6ay7nrAU9KQxUVvo8FSqar5S4Hw
	516InYmpV0K7Q26gMAtwQxExvMxeXGexLvU6j8fC+dJWHbg4ITjFcf92WG8u/J8Fns6jhn6Rm+j
	6YVbX2YOMJ4Tm/iUfkgDLqnrRlXrZ8nn9tnqel2MprJP8FBOIaD3ujOwMRm9S9tOVjL8prCBFor
	y621ptAexu2PGiWNuiJOiuqEW0sbw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.532500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 306DCF8989F9A0BE84FF8E4FB28D4A23BB4E40BD846288059C3D0E830EC48DAA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_193230_026377_2289EE80 
X-CRM114-Status: GOOD (  10.29  )
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

User space attach the syntaxes and bit-stream buffer to a same media
request for stateless decode, and the syntax controls are the only
v4l2 control request. The request will be marked to complete status
when the buffer is set to done, then request object will be cleaned
form media request.

When v4l2_ctrl_request_complete() is later called, the control request
detect that there is no controls in the request object. It then creates
an empty control request object, but attaching an object to a completed
request is not allowed.
---
compared with v5:
- fix comments for patch 3
- fix smatch error for patch 1

compared with v4:
- re-write the commit message for cover-letter
- change patch 2/3/4/5 commit message

compared with v3:
- fix flush decoder issue when userspace stream off capture queue firstly
- fluster test result same with v3

compared with v2:
- add patch 5/6/7 to fix decode again issue
- add fluster test result with mt8195 platform(same with no changed):
  1> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0 -j1 -t 90
     VP8-TEST-VECTORS 59/61
  2> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0 -j1 -t 90
     VP9-TEST-VECTORS 276/305
  3> ./fluster.py run -d GStreamer-AV1-V4L2SL-Gst1.0 -j1 -t 90
     AV1-TEST-VECTORS 237/239
  4> ./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j1 -t 90
     JVT-AVC_V1       95/135
  5> ./fluster.py run -d GStreamer-H.265-V4L2SL-Gst1.0 -j1 -t 90
     JCT-VC-HEVC_V1   142/147

compared with v1:
- add patch 2/3/4 to fix timing issue.
---
Yunfei Dong (5):
  media: mediatek: vcodec: setting request complete before buffer done
  media: mediatek: vcodec: change flush decode order when stream off
  media: mediatek: vcodec: Get SRC buffer from bitstream instead of M2M
  media: mediatek: vcodec: store current vb2 buffer to decode again
  media: mediatek: vcodec: remove media request checking

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 44 +++++++--------
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  4 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 53 ++++++++++++++-----
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 28 ++++------
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  4 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  4 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 28 ++++------
 .../mediatek/vcodec/decoder/vdec_msg_queue.h  |  4 +-
 8 files changed, 92 insertions(+), 77 deletions(-)

-- 
2.46.0


