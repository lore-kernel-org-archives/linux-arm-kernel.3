Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0D1EB5967
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 05:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KL+qaj8pnmbhjg1wnd2RxNqlC8N0xbIZdiIsvG+R0XE=; b=Okxgrv+mrTsdbUiyKZx285+5B8
	mk/kWWRplspnbYyUSggtllNh5QGZwww0L1WHvvLKCSWnkwRikb4Hh+bWEATLksommF8D6qO6+WiId
	EqtSRvlfAcm/FMq7sEXZEyR+lSI52D6fLW9Gq4FRUDAB81KJXZ1+FlQeQZ3IOpCkczWEsELC3GmAV
	Zjlz69WdvhxQMwQdktg6j89wocCFBxaajfaIVVVmaBQHt6w4qIgGmE+p7UqnJpj6ThaCEJRw6TyzI
	cCkKmhwD6gLrMLtaTBjfPeCqT0R6OS7hs4MVgps2H0J8K4qV2Li9ew3pXpJPklVzuUuzyPNi8iuU6
	vwWH2sgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2zD-00000000ElH-36Oj;
	Wed, 11 Feb 2026 05:42:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2zB-00000000Eko-22AW;
	Wed, 11 Feb 2026 05:42:02 +0000
X-UUID: 5f60821c070c11f1a16f0188aa809bee-20260210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KL+qaj8pnmbhjg1wnd2RxNqlC8N0xbIZdiIsvG+R0XE=;
	b=eAhu7tC3nXy8Jx6HwAYU+86/H3FRZrgEQWh76BQxxVv7wywPP/fdxC8QzoWh0hC2YFcobjF21iYiA9ITq3okZrIykZKS0L7h+c5M14fXMGVUOp3bwzD1IX8Wsy/IjyIY05oZUamoutPT+QW1Bq85aoRq0HROQvRZ9VZglAdkz4g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:494141a1-163b-4a95-8c65-1b83c5a61345,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:b4cc91f0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5f60821c070c11f1a16f0188aa809bee-20260210
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1688446426; Tue, 10 Feb 2026 22:41:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Feb 2026 13:41:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Feb 2026 13:41:51 +0800
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
Subject: [PATCH v3 00/14] media: mediatek: vcodec: support video decoder in mt8196
Date: Wed, 11 Feb 2026 13:41:27 +0800
Message-ID: <20260211054149.27249-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_214201_538066_CB2E5115 
X-CRM114-Status: GOOD (  16.16  )
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

This patch set adds support for the video decoder on the MediaTek MT8196
platform, leveraging the VCP microprocessor for enhanced performance. It
introduces new firmware interfaces for kernel-side communication with VCP,
adds MT8196 compatible, codec levels/profiles, and private data. Rewrites
the AV1 driver to support extended VSI structures, then change irq table
and cdf table size.

This patch set depends on "Add VCP support for mt8196"[1]

[1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20250402092134.12293-2-xiangzhi.tang@mediatek.com/

Compliance Test Result:
- v4l2-compliance: 48/49 tests passed, 1 failed (known issue)
- fail: v4l2-test-controls.cpp(981): ret (got 13)
-        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Fluster Test Result:
- H264：
- Ran 95/135 tests successfully   in 73.540 secs
- H265：
- Ran 142/147 tests successfully  in 100.168 secs
- VP9：
- Ran 276/305 tests successfully  in 106.804 secs
- AV1：
- Ran 240/242 tests successfully  in 23.991 secs
---
Changed in v3:
- Depends on change no update
- Add Compliance and Fluster test result
- Re-write the commit message for patch 12
- Change the patches according to review suggestion for patch: 3/4/5/6/14

Changed in v2:
- re-write the commit message for patch 1
---
Yunfei Dong (14):
  dt-bindings: media: mediatek: vcodec: add decoder dt-bindings for
    mt8196
  media: mediatek: vcodec: add decoder compatible to support mt8196
  media: mediatek: vcodec: add driver to support vcp
  media: mediatek: vcodec: add driver to support vcp encoder
  media: mediatek: vcodec: get different firmware ipi id
  media: mediatek: vcodec: get share memory address
  media: mediatek: vcodec: define MT8196 vcodec levels.
  media: mediatek: vcodec: support vcp architecture
  media: mediatek: vcodec: support 36bit iova address
  media: mediatek: vcodec: clean xpc status
  media: mediatek: vcodec: add debug information
  media: mediatek: vcodec: send share memory address to vcp
  media: mediatek: decoder: fill av1 buffer size with picinfo
  media: mediatek: decoder: support av1 extend vsi

 .../media/mediatek,vcodec-subdev-decoder.yaml |   1 +
 .../media/platform/mediatek/vcodec/Kconfig    |   4 +
 .../platform/mediatek/vcodec/common/Makefile  |   4 +
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  21 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  16 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   2 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  12 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 561 ++++++++++++++++++
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 153 +++++
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  16 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  28 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        |  13 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |   6 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 113 +++-
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  11 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  12 +-
 .../vcodec/decoder/vdec/vdec_vp8_req_if.c     |   5 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  29 +-
 .../mediatek/vcodec/decoder/vdec_ipi_msg.h    |   2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |  12 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |   2 +
 23 files changed, 987 insertions(+), 38 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

-- 
2.45.2


