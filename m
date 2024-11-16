Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779ABD68BE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 03:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9ZnJdqr79k+Y/T3mTs8BQS5odlDph9aBEoH/UgRHOg=; b=LM69dXizoLFppeN2Ii1uPJLvQz
	RyqVFxA04yvRLXEoZu+8jKujkP7jDV5K5sdVHmk03O78G02h3jmphChk0lAHpAPr6i8b7rY4zU2rd
	n786UOhSlpujGWq+uUFEdg3usxKUFNGDmve701n9mn/kQpImfIUv6mIOvdJT6S6LT9nKptRPwzS8M
	lZi5yh1SbFgHBWB8Riuhi4id0dyt0XX8VpeyJ40MCmIjIFNfsTOQPn4kPxX+qTZzU+Vohdzb2/D/W
	BwyWjhZW+4CregQiufDrwGvrr8HKyfQImrWY/mBXajcdQIHr5coYjVdGONLCtoahQyfSy87jhCvOz
	TlvGmAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC9Mw-00000004s17-1h9W;
	Sat, 16 Nov 2024 03:21:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC9JT-00000004r7d-3bFn;
	Sat, 16 Nov 2024 03:17:33 +0000
X-UUID: 4efeca2aa3c911ef9048ed6ed365623b-20241115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+9ZnJdqr79k+Y/T3mTs8BQS5odlDph9aBEoH/UgRHOg=;
	b=OfdQrJwxrQWPLraRh3CvJ7CJtqTfJkH1fuSSlEZiIVyY2RkeonPFI0fVBDtYOTwmzjWwcq0nJEEtc/wjeFEBAFlYOyxwaO6orCrmnGFtuzM9mhbUP/dmMD/iFC11abUjp9C/kYsXt0RQcbQBSXWsay7jnU5gWgAX8NjEWiYJxRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:78e0dedf-58fa-4ebc-b881-f3c662b0ce2f,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:ce19b8a,CLOUDID:3015234f-a2ae-4b53-acd4-c3dc8f449198,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4efeca2aa3c911ef9048ed6ed365623b-20241115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1684321586; Fri, 15 Nov 2024 20:17:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Nov 2024 11:17:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:17:24 +0800
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
Subject: [PATCH v7 0/5] media: mediatek: vcodec: fix v4l2_ctrl_request_complete fail
Date: Sat, 16 Nov 2024 11:17:14 +0800
Message-ID: <20241116031724.15694-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_191731_907592_84F5F10E 
X-CRM114-Status: GOOD (  10.67  )
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
request is not allowed. Using manual request completion to handle the
request complete event.
---
depends on manual request completion patch:
[1] https://patchwork.linuxtv.org/project/linux-media/cover/cover.1724928939.git.hverkuil-cisco@xs4all.nl/
---
compared with v6:
- Using manual request completion for patch 1
- rebase on latest driver for patches 2/3/4/5

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
  media: mediatek: vcodec: support manual request completion
  media: mediatek: vcodec: change flush decode order when stream off
  media: mediatek: vcodec: remove media request checking
  media: mediatek: vcodec: Get SRC buffer from bitstream instead of M2M
  media: mediatek: vcodec: store current vb2 buffer to decode again

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 43 ++++++++--------
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 51 ++++++++++++-------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 14 ++---
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 15 +++---
 5 files changed, 72 insertions(+), 53 deletions(-)

-- 
2.46.0


