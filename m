Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A028BC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 06:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pi6jBiS4l/lbcJz+jihJBHjaEwGKqWTJS4hBHOWOmzE=; b=NKgG5wNP5xbojsTkG2hE9jYzWE
	d8DrQV/xGRYe7F50c54qwNlLCJao9lYlXBkJufdTGBL2pkLEB03NOUlUxtKPafyOTFfIMb3496Xux
	h3Nv0eGgzBo9oDW5fg90qwBB1fSPqZAhYJ9Flf3htGz1UXM3dzIKBEz92u1qwKiGzv1+82j+ebZBt
	6Ia4jiGN7SPfR8y3hhA+G0YiM3eXYjZ4K4mp3nsD5LdHEm/8JoXkY7XzQfe1bCHqn5RegvWTXSfRU
	uNxJDwo0wlM4osjGJ3U+zBm8uLLTzavNf54EppvvLdkcAnT6GLTNxIC1B9LJMcaev+A3KKZ1yoITc
	uqD3KB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKATS-0000000CJxD-2eZ8;
	Wed, 28 May 2025 06:41:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAPC-0000000CJ9I-48y8;
	Wed, 28 May 2025 06:36:52 +0000
X-UUID: 1eb147d23b8e11f0bed96b30c12bc3d6-20250527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Pi6jBiS4l/lbcJz+jihJBHjaEwGKqWTJS4hBHOWOmzE=;
	b=gaBhY6vhO2Zpd1fLRGX912RgYwzij61FwOshvSuCNv2Ep6zrOYe4yQ6rc8cQ7b27nbwZdv9VS5yLT28wxuoUVYddWdG+Y2om6HVyrgAc+sqHe5rgPqVeMDA+HP7ypAUVXq+7vpV4AO64EZNe2+w5a3P27IT3gPHZ6yA6/o0ShhM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:156edf64-5e44-4de8-af59-f87945ab4504,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:33675df1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1eb147d23b8e11f0bed96b30c12bc3d6-20250527
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1108790980; Tue, 27 May 2025 23:36:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 14:36:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 14:36:39 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH v2 0/6] Add support for MT8196 video encoder
Date: Wed, 28 May 2025 14:36:26 +0800
Message-ID: <20250528063633.14054-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_233651_030158_1032F329 
X-CRM114-Status: GOOD (  14.75  )
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
patch 4~6: Add MT8196 encoder driver platform data.

About adding new driver support, the v4l2-compliance report shows:
"Total for mtk-vcodec-enc device /dev/video3: 47, Succeeded: 46, Failed: 1, Warnings: 0"
The 1 Failed case is not caused by current patch set.

This patch set depends on "media: mediatek: vcodec: support video decoder in mt8196"[1]

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=15232

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
  dt-bindings: media: mediatek: encoder: Add encoder dt-bindings for
    MT8196
  media: mediatek: encoder: Add MT8196 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |  12 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  19 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   2 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |   1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         |   6 +
 .../platform/mediatek/vcodec/encoder/Makefile |   1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  37 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  28 +
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  15 +-
 .../vcodec/encoder/venc/venc_common_if.c      | 678 ++++++++++++++++++
 .../vcodec/encoder/venc/venc_h264_if.c        |   8 +-
 .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
 .../mediatek/vcodec/encoder/venc_drv_if.h     |  11 +-
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
 .../mediatek/vcodec/encoder/venc_vpu_if.c     |  51 +-
 15 files changed, 843 insertions(+), 55 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c

-- 
2.45.2


