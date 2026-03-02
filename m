Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB0BD58E4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 03:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iTjjNoLU424kMgi53DPTTHLjLn86CgIRcN6erquCGlM=; b=2YjdK9dhVjnlN0pen+7qpMdt3O
	D+k1lA3sKIHrZbkDUtgjJu3vRo05Xld6iAbiWNUQ/qJuRjZhWKhAnNA/TbbkcvfmrSNnY0GFWsu3S
	nw6OV1p74dzYb1EicBptVJpmtHrdQjf6OYGicJaA3dsIy8haIOnPFWn272DT6OXKmlzdpa4P/I0cz
	8R6GtpU+a7dlpGFhXBu4cw6ko/2IrBy1Khnb/Z57IAOg+0W7xEXodHuPqsZkXSq0NoBzTJQvXw8My
	rTmoFs2kvlEn3mrPS9NK6qGcmdTPkrdjTAgmbTb4q1vgh02oF25dSfgD2un3PuowewL3ohhN42CzL
	D2R4V3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuL3-0000000CCfC-3E0d;
	Mon, 02 Mar 2026 03:52:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuL0-0000000CCdn-2oI4;
	Mon, 02 Mar 2026 03:52:55 +0000
X-UUID: 482def9c15eb11f1a16f0188aa809bee-20260301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iTjjNoLU424kMgi53DPTTHLjLn86CgIRcN6erquCGlM=;
	b=YBimzRrmRW+IwYcUUvJF1G9ztnIijiwkq4KDZmXpLpPkgOB8Jf5xWi/atK3uBUXrub/tJyVvDgzUclNbbUz1we/UFd5oU+rNPOO90ErLrWJH9u8js27EhQzZfrwRfxvH08XZ7MTVyZENYuGJ0fW5h7lzYNUEpuc4w3VOpfeFZ7c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:b6ff7265-4f09-4573-9157-a0c1eb6d7181,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:89c9d04,CLOUDID:a22825f1-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:1|19,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 482def9c15eb11f1a16f0188aa809bee-20260301
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1227674129; Sun, 01 Mar 2026 20:52:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Mar 2026 11:52:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Mar 2026 11:52:46 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 0/6] Add support for MT8196 video encoder
Date: Mon, 2 Mar 2026 11:52:37 +0800
Message-ID: <20260302035244.8994-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_195254_745599_05D8EE62 
X-CRM114-Status: GOOD (  14.38  )
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

This patch series add support for MT8196 video encoder.
patch 1~3: Add a new encoder driver interface for new VCP firmware.
patch 4: Add new encoder driver platform data.
patch 5: Add dt-bindings.
patch 6: Add compatible data.

About adding new driver support, the v4l2-compliance report shows:
"Total for mtk-vcodec-enc device /dev/video3: 47, Succeeded: 46, Failed: 1, Warnings: 0"
The 1 Failed case is not caused by current patch set:
                fail: v4l2-test-controls.cpp(1171): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

This patch set depends on "media: mediatek: vcodec: support video decoder in mt8196"[1]

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=21718

Change in v5:
 - Rewrite patch5 commit subject.
 - Add else statement in patch5.
 - Link to v4: https://patchwork.linuxtv.org/project/linux-media/list/?series=21757

Change in v4:
 - Rework patch3 commit message.
 - Rework patch5 commit with more details.
 - Rebase patch onto decoder's patch set.
 - Link to v3: https://patchwork.linuxtv.org/project/linux-media/cover/20250814085642.17343-1-kyrie.wu@mediatek.com/

Change in v3:
 - Add venc rc buffer alloc failure error handling.
 - Add mediatek,vcp property definition in dt-bindning.

Change in v2:
 - Add support for VCP encode process.
 - Add MT8196 encoder driver platform data.
 - Rebase encoder patch onto decoder's patch set.
 - Fix some review comments in v1.

Irui Wang (6):
  media: mediatek: encoder: Add a new encoder driver interface
  media: mediatek: encoder: Add support for common firmware interface
  media: mediatek: encoder: Add support for VCP encode process
  media: mediatek: encoder: Add a new platform data member
  media: dt-bindings: mediatek,vcodec-encoder: Add MT8196
  media: mediatek: encoder: Add MT8196 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |  22 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  19 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   2 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |   1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         |   6 +
 .../platform/mediatek/vcodec/encoder/Makefile |   1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  36 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  28 +
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  15 +-
 .../vcodec/encoder/venc/venc_common_if.c      | 683 ++++++++++++++++++
 .../vcodec/encoder/venc/venc_h264_if.c        |   8 +-
 .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
 .../mediatek/vcodec/encoder/venc_drv_if.h     |  11 +-
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
 .../mediatek/vcodec/encoder/venc_vpu_if.c     |  47 +-
 15 files changed, 856 insertions(+), 52 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c

-- 
2.45.2


