Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07F7CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m8b7ww2HModMWqJw4ufn2iUaA5FiOaPyS039PaHKMDw=; b=axcc+OUGpIk/GjTgFRIDsBpsW8
	wiHnZSh2o2/FF4v2t+TP3K27mORSMixYZWP0NPIpP+qhCf1NgY2cSDiF/cHbX8jrPBV6vLjlkoBOI
	xDpH0b7PjQkr9AZb7CDm//5cHXyiG22ZsMtxfGmQMDqSwK1x3P1WaadKF5KTJ1LsEsoDnw+Mzdtdx
	kvwRWnKEZOIlo0+E9suYyAdYS42TFW2HHJFUniOTOJ7fpDXmPAZDC2Puk2fj9wi4a8q5S0irGU24G
	mv/5S8SerTt7tIuI6g/Q1OD7H0NzstkyiADRJExT58FjRYwXztme1/jgjOyUArkrdcCRNtbLaciU8
	Coii99Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqej-000000022rL-1VlD;
	Fri, 15 Aug 2025 09:23:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqBA-00000001uyu-322U;
	Fri, 15 Aug 2025 08:52:54 +0000
X-UUID: 382c87ac79b511f09f706fa2197c6ceb-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=m8b7ww2HModMWqJw4ufn2iUaA5FiOaPyS039PaHKMDw=;
	b=ofoG9OwtQq0eNthDpfkW5zIv/HCsJ+TAZ83ZGCCkXk45sn5qfHebWekNkFKQTFhNbX+WVx7jV8nCGoPCOiCWniz2PvSabrmH01HjYNOpsOj6FSV+8E7y1WezHiuH//FZutKTTvsKvLpfu3KwZQl/M8bFYVHOBrltWCzMU/S7YpU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:c048263e-8544-4b57-816c-e564360be395,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:c7168344-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 382c87ac79b511f09f706fa2197c6ceb-20250815
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1743288973; Fri, 15 Aug 2025 01:52:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 15 Aug 2025 16:52:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 15 Aug 2025 16:52:44 +0800
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
Subject: [PATCH v2 00/14] media: mediatek: vcodec: support video decoder in mt8196
Date: Fri, 15 Aug 2025 16:52:13 +0800
Message-ID: <20250815085232.30240-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_015252_770375_FBEA8C16 
X-CRM114-Status: GOOD (  13.07  )
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

Using vcp micro processor to support video decoder in mt8196 platform,
need to add new firmware interface to communicate with vcp in kernel
side. Then add mt8196 compatible, codec levels/profiles and private data.
Re-write av1 driver to support extend vsi struct, then change irq table
and cdf table size.

This patch set depends on "Add VCP support for mt8196"[1]

[1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20250402092134.12293-2-xiangzhi.tang@mediatek.com/
---
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
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 493 ++++++++++++++++++
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 151 ++++++
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  16 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  28 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        |  13 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |   6 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c |  85 ++-
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  10 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  11 +-
 .../vcodec/decoder/vdec/vdec_vp8_req_if.c     |   4 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  20 +-
 .../mediatek/vcodec/decoder/vdec_ipi_msg.h    |   2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |   9 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |   2 +
 include/linux/remoteproc/mtk_vcp_public.h     |   2 +-
 24 files changed, 871 insertions(+), 43 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

-- 
2.45.2


