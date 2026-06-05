Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933FECD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 08:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Sji47os0jTa4cBm8CX1o4kyY/7vJZ/hciUD/d1L5kY=; b=TgwavaGpAk65pGTYcmJHqIwMH4
	PruMM1hgYNk/enclEILNMoAQIgXP9rvUiUPb/dZx85svDKyLVdpttTuGMozq70QxQoHVslFZO9FzR
	B15h7BpzXeNhr1GYyYjW6bOFX9DrDIz87sX6tfUs9jLSJgbLiOM2DBe/gZIfUbgXqgEVwknzkxyIF
	2jQa6Eo1MMFe5hBgPMGlCbz2UIrHgSwPQ5DBbgvt5eaWLdkx4oYne0otVqb+KqiCuwCfgQyTOwroL
	6/yr6WsgpaYUJDdqgrznodc+o/OxWHn6fHE+1zL+QhAIBL3a9+NuZpLI2pDEgHCLnA6RgAGgpLRMR
	DmAqD6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPtb-00000000JOs-3ETr;
	Fri, 05 Jun 2026 08:27:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPtY-00000000JNh-3i9A;
	Fri, 05 Jun 2026 08:27:14 +0000
X-UUID: 5493677260b811f1acbe4559397dec65-20260605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9Sji47os0jTa4cBm8CX1o4kyY/7vJZ/hciUD/d1L5kY=;
	b=G3OdyITJXDH39dNWi5F+Dzwc8HL89e84ZljtcDwiR5P+xrMtTcekqPQtcPJ85egJiSofiQYm+z6NLHXz4xdRhHnoZx+sMOZCdoDl8HNRfMW8UA6iq1uDC2XE2iF/XN6N88hHsqBmI54XZ1FRoNdwj4xP4IMRWcpnq22KGKBApW4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:19fe6472-7941-446b-bd50-e81eafd30c3c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:e274eeef-fd54-480d-9f18-ad647162bc62,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5493677260b811f1acbe4559397dec65-20260605
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <sarang.chaudhari@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1458926356; Fri, 05 Jun 2026 01:27:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 16:27:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 16:27:00 +0800
From: Sarang Chaudhari <sarang.chaudhari@mediatek.com>
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <zhaoyuan.chen@mediatek.com>, <Teddy.Chen@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Sarang Chaudhari
	<sarang.chaudhari@mediatek.com>
Subject: [PATCH v6 0/4] Add MT8188 AIE driver
Date: Fri, 5 Jun 2026 16:20:08 +0800
Message-ID: <20260605082629.2585874-1-sarang.chaudhari@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_012712_946462_01C9A9FA 
X-CRM114-Status: GOOD (  10.70  )
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

AIE (AI Engine) is one of the units in MT8188 ISP which provides
hardware-accelerated face detection function. It can detect different
sizes of faces in a raw image using pyramid-based multi-scale detection.

The AIE supports three operation modes:
- Face Detection (FD): Multi-scale face detection using 3-level pyramid
  (640x480 base, 2x downscale per level).
- Attribute Analysis: Age, gender, and race classification.
- Facial Landmark Detection (FLD): 11-point landmark localization using
  Binary Tree Traversal on FD results.

Changes in v6:
- DT binding: Add ipe-smi-larb12 clock, remove iommus from required
  properties, add mediatek,larb as optional, improve description.
- DTS: Remove iommus and mediatek,larb properties, fix IRQ number.
- UAPI: Simplify header to control ID definitions only, drop custom
  V4L2_CTRL_TYPE (use V4L2_CTRL_TYPE_U32 compound controls instead).
- Driver: Fix NULL pointer check inversion, fix resource leaks on error
  path, remove debugfs return value checks, update clock names to hyphen
  convention, remove freq_level per CK Hu's feedback.

Changes in v5:
- DT binding: Use hyphens in clock names, remove mediatek,larb.
- UAPI: Add feature_threshold docs, rename structures, move structures
  from mtk_aie.h to uapi header.
- Driver: Update clock names, improve error handling in probe.

Changes in v4:
- DT binding: Remove address-cells/size-cells, remove larb12 content.
- UAPI: Add V4L2_META_FMT_MTFD_RESULT documentation.
- Driver: Remove larb12 related content.

Changes in v3:
- DTS: Remove non-MMIO nodes.

Changes in v2:
- Fix coding style issues throughout.

Sarang Chaudhari (4):
  media: dt-bindings: mediatek: Add AIE face detection support for
    MT8188
  arm64: dts: mediatek: mt8188: Add AIE face detection node
  media: uapi: mediatek: Add MT8188 AIE control definitions
  media: platform: mediatek: Add MT8188 AIE driver

 .../bindings/media/mediatek,mt8188-aie.yaml   |   85 +
 MAINTAINERS                                   |   10 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |   13 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/aie/Kconfig   |   20 +
 drivers/media/platform/mediatek/aie/Makefile  |    5 +
 drivers/media/platform/mediatek/aie/mtk_aie.h | 1045 +++++++++++
 .../platform/mediatek/aie/mtk_aie_drv.c       | 3667 +++++++++++++++++
 .../platform/mediatek/aie/mtk_aie_v4l2.c      | 1907 +++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/mtk_aie_v4l2_controls.h    |   23 +
 include/uapi/linux/videodev2.h                |    1 +
 13 files changed, 6779 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
 create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
 create mode 100644 drivers/media/platform/mediatek/aie/Makefile
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_v4l2.c
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

-- 
2.45.2


