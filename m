Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01369C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bj+p5Xe9b4pgmGeFJIUoTwkyssUTNsuSHbYegk9Xjrw=; b=flfLSg1nzl3AxjYW3g0zvYqy9B
	F+C+Z15maWa0hlBkgXJNc0Km2kqGnsp7XTjZ2Xj/3xADquBTT/Ut6PwVmhGuq7fqFrwDHG+nKQ0Oy
	5snUFlS7MN261GggmaZOLwR1ckqBMQF+87Bt8zxlTO1bNW/QK46L9z786+5CJnZcfPX1GAffY2Gm7
	h23qd+tNlqY6UjlvPIZo0fYrKXAHpUNJH7vyxvK7Bs2hgbkWtAoEVLbQmc/b6dvg6aPoY6hc+xcbV
	ZC82PAPTETxwSCrT7Xl6+4kQqKgn1iNFYWQrhPaxUeKAcZ2C+HTjOY5K61JhoPe654vpuutV/s2Nn
	8FYHT1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61D8-00000002aUW-3YBm;
	Mon, 14 Sep 2026 07:34:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61D2-00000002aPZ-2ant;
	Mon, 14 Sep 2026 07:34:38 +0000
X-UUID: b8e86b46b00e11f1afed4741b24580c9-20260914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Bj+p5Xe9b4pgmGeFJIUoTwkyssUTNsuSHbYegk9Xjrw=;
	b=ZFV8yspgU1VgGR6tUJWNf7u1AoMM7HcELO1vAqj6Gc0nFzYfwY5c/3bdsPfCkGQCkKPzjmv7IDRgG9dImRHLZ15ddfuxTVurox6JwqZiPHc9G7JY7P96UurSLNp8y2vElil1jn0a+R8bKbs7YivDxbhJp2jAc81hZkEkj5Oz6os=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c04ec210-44ae-4cf8-add0-0d82d71267eb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:1dc2cee2-72a5-4ba1-af40-18bbd6ea8ffd,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8e86b46b00e11f1afed4741b24580c9-20260914
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 509748549; Mon, 14 Sep 2026 00:34:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 14 Sep 2026 15:34:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 14 Sep 2026 15:34:26 +0800
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
Subject: [PATCH v8 0/6] Add support for MT8196 video encoder
Date: Mon, 14 Sep 2026 15:34:15 +0800
Message-ID: <20260914073423.16131-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_003436_677711_29C5B48C 
X-CRM114-Status: GOOD (  17.38  )
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

This series adds support for the MT8196 video encoder.

Patch 1 adds the device-tree binding changes.
Patch 2 adds the new encoder platform data.
Patches 3 through 5 add a new encoder driver interface for VCP firmware.
Patch 6 adds the MT8196 compatible data.

The v4l2-compliance result for the encoder is:

  Total for mtk-vcodec-enc device /dev/video3: 47, Succeeded: 46,
  Failed: 1, Warnings: 0

The one failed test is not caused by this series:

  fail: v4l2-test-controls.cpp(1171):
        node->codec_mask & STATEFUL_ENCODER
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

This series depends on the MT8196 video decoder v6 series [1]. The decoder
series retains the "Add MediaTek VCP remoteproc driver support" v4
prerequisite [2].

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=28000
[2] https://patchwork.kernel.org/series/1086068/

Changes in v8:
 - Rebase the encoder series on the MT8196 decoder v6 series.
 - Adapt patch 2 to the decoder v6 firmware-selection flow, retaining its
   generic selector and validation while supplying the encoder platform
   firmware initialization callback.
 - Adapt patch 5 to the decoder v6 VCP teardown flow, retaining the complete
   teardown before adding the encoder firmware-device callback.
 - Link to v7:
   https://patchwork.linuxtv.org/project/linux-media/list/?series=26089

Changes in v7:
 - Patch 2: Add new pdata members to remove device-tree parsing branches.
 - Rebase the series on the decoder patch set.
 - Link to v6:
   https://patchwork.linuxtv.org/project/linux-media/cover/20260423073345.27402-1-irui.wang@mediatek.com/

Changes in v6:
 - Move the device-tree binding changes to patch 1.
 - Rebase the series on the decoder patch set.
 - Link to v5:
   https://patchwork.linuxtv.org/project/linux-media/cover/20260302035244.8994-1-irui.wang@mediatek.com/

Changes in v5:
 - Rewrite the patch 5 commit subject.
 - Add the else branch in patch 5.
 - Link to v4:
   https://patchwork.linuxtv.org/project/linux-media/list/?series=21757

Changes in v4:
 - Rework the patch 3 commit message.
 - Rework patch 5 with more details.
 - Rebase the series on the decoder patch set.
 - Link to v3:
   https://patchwork.linuxtv.org/project/linux-media/cover/20250814085642.17343-1-kyrie.wu@mediatek.com/

Changes in v3:
 - Add encoder rate-control buffer allocation failure handling.
 - Add the mediatek,vcp property definition to the device-tree binding.

Changes in v2:
 - Add support for the VCP encode process.
 - Add the MT8196 encoder platform data.
 - Rebase the encoder series on the decoder patch set.
 - Address review comments from v1.

Irui Wang (6):
  media: dt-bindings: mediatek,vcodec-encoder: Add MT8196
  media: mediatek: encoder: Add new platform data members
  media: mediatek: encoder: Add a new encoder driver interface
  media: mediatek: encoder: Add support for common firmware interface
  media: mediatek: encoder: Add support for VCP encode process
  media: mediatek: encoder: Add MT8196 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |  22 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |   6 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   1 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |   1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         |   6 +
 .../platform/mediatek/vcodec/encoder/Makefile |   1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  24 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  63 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  15 +-
 .../vcodec/encoder/venc/venc_common_if.c      | 684 ++++++++++++++++++
 .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
 .../mediatek/vcodec/encoder/venc_drv_if.h     |   3 +
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
 .../mediatek/vcodec/encoder/venc_vpu_if.c     |  47 +-
 14 files changed, 850 insertions(+), 52 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c


base-commit: bf115aeef8fc70bc46b05733d0d3b77bd9e8af50
-- 
2.55.0.windows.3

