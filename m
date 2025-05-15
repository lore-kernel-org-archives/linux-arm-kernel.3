Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98C6C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nDOj/MDr5bhf2pOGQc4uKu3LALz2SIDwKqvmkIbeuSk=; b=KBpkoFU/IizD3jUp2Tc/rHbgct
	U8cFeUjKc7SKP/DDRw0Nt/iZmTjCmiONiMAKO0fWs5I/F4GISNP5/gy2kFGJuAsybDqHlVztgsFYz
	tM9vXHeLfRGL4PCvUXzQCvEthFXEYz3mD+puNENWKjUjMQe8wyIeTesgXnUnb1LazxbB46T7i4sOT
	aW+4/ui17i2lykpep/YDirIbNufRx/tDKc0kGsJFs8dJrTadSsWtbbuKPsR5UhswfnRVWoEv7syls
	L2xmFQgOH4YTBRWOQ9PjC2288fTng1MR3Q3/ymNZHZoPPXtAs/+pyACTIyK+6k8V7zYPbjtsdRb85
	97YjU3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVFQ-00000000DkD-0obS;
	Thu, 15 May 2025 09:51:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUzX-00000000Aoa-2Alp;
	Thu, 15 May 2025 09:35:04 +0000
X-UUID: dd77cc78316f11f0bed96b30c12bc3d6-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nDOj/MDr5bhf2pOGQc4uKu3LALz2SIDwKqvmkIbeuSk=;
	b=OVRp1OgE6Qdo0l6kC+Xikquam26OY8Wt+f+bRIVcVyo+enclx4ESdSP+qcWFNOzzgT5ZYlrZ3Hw+1L2I/ecp8SpidxIetdPriQpFe6za9LqgCf6jsltiRTpAll3l+vU10GDraxlz/y3U8HzrcYRZZbDbil3JmfwZSlh+bCcBArg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ddf229ff-f6b4-4422-a7f9-faa868edcd8f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fcd5093e-da74-431d-a7be-5e6761de3b64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dd77cc78316f11f0bed96b30c12bc3d6-20250515
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1931996830; Thu, 15 May 2025 02:34:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:34:54 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:34:54 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 00/17] Add MediaTek SoC DRM support for MT8196
Date: Thu, 15 May 2025 17:34:12 +0800
Message-ID: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_023503_567870_3A514729 
X-CRM114-Status: GOOD (  14.27  )
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

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

This patch series adds support for the MediaTek MT8196 SoC's display
subsystem in the DRM driver.

Changes in v3:

- [PATCH v3 06/17] 
  Refine runtime PM, top clocks and async controls for MMSYS 
- [PATCH v3 08/17]
  Refactor SOF settings by adding mtk_mutex_get_output_comp_sof() and
  extracting SOF logic from mtk_mutex_add_comp() 
  and mtk_mutex_remove_comp()
- [PATCH v3 10/17]
  Export OVL format definitions and format 
  conversion API
- [PATCH v3 11/17]
  Export OVL ignore pixel alpha logic
- [PATCH v3 12/17] 
  Refactor exdma_config setup to reduce complexity 
  and consolidate duplicate settings in exdma_layer_config()
- [PATCH v3 13/17]
  Refine blender's layer_config driver for improved efficiency
- [PATCH v3 14/17] Refine outproc driver: use readl() and writel() to 
  replace mtk_ddp_write_mask() for normal mode settings
- [PATCH v3 15/17]
  Refine ovlsys_adaptor driver:Use path instead of ovl_adaptor_comp for 
  searching component type. Improve efficiency of config, start, stop, 
  and layer_config functions
- [PATCH v3 16/17] 
  Refine mtk_find_possible_crtcs() function

Changes in v2:
- add support for MT8196's new hardware components (EXDMA, BLENDER, 
  OUTPROC) following the previous MTK OVL software architecture.
- reuse mtk_ovl drivers in MediaTek DRM display to support the new 
  MT8196 SoC.
- implement support for multiple mmsys instances within a single 
  mediatek-drm driver, improving flexibility and scalability.
- refactor existing components (mutex, OVL) to accommodate the new 
  architecture and improve code reusability.
- update component matching, binding logic, and data structures to 
  support the new multi-mmsys design.
Nancy Lin (10):
  dt-bindings: soc: mediatek: add mutex yaml for MT8196
  soc: mediatek: Add runtime PM and top clocks and async controls for
    MMSYS
  soc: mediatek: add mmsys support for MT8196
  soc: mediatek: mutex: add mutex support for MT8196
  drm/mediatek: Export OVL formats definitions and format conversion API
  drm/mediatek: drm/mediatek: Export OVL ignore pixel alpha function
  drm/mediatek: add EXDMA support for MT8196
  drm/mediatek: add OUTPROC support for MT8196
  drm/mediatek: add ovlsys_adaptor support for MT8196
  drm/mediatek: Add support for MT8196 multiple mmsys

Paul-pl Chen (7):
  dt-bindings: display: mediatek: add EXDMA yaml for MT8196
  dt-bindings: display: mediatek: add BLENDER yaml for MT8196
  dt-bindings: display: mediatek: add OUTPROC yaml for MT8196
  soc: mediatek: mutex: Reused the switch case for SOF ID
  soc: mediatek: mutex: refactor SOF settings for output components
  drm/mediatek: add BLENDER support for MT8196
  drm/mediatek: Add support for multiple mmsys in the one mediatek-drm
    driver

 .../display/mediatek/mediatek,blender.yaml    |  47 ++
 .../display/mediatek/mediatek,outproc.yaml    |  54 ++
 .../bindings/dma/mediatek,exdma.yaml          |  68 ++
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   2 +
 drivers/gpu/drm/mediatek/Makefile             |   4 +
 drivers/gpu/drm/mediatek/mtk_crtc.c           | 342 ++++++--
 drivers/gpu/drm/mediatek/mtk_crtc.h           |   6 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 136 +++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_blender.c   | 264 +++++++
 drivers/gpu/drm/mediatek/mtk_disp_blender.h   |  10 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  67 ++
 drivers/gpu/drm/mediatek/mtk_disp_exdma.c     | 349 +++++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c   | 240 ++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.h   |  22 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 238 +++---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.h       |  29 +
 .../drm/mediatek/mtk_disp_ovlsys_adaptor.c    | 729 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 277 +++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  27 +-
 drivers/soc/mediatek/mt8196-mmsys.h           | 396 ++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              | 206 ++++-
 drivers/soc/mediatek/mtk-mmsys.h              |  18 +
 drivers/soc/mediatek/mtk-mutex.c              | 257 ++++--
 include/linux/soc/mediatek/mtk-mmsys.h        |  60 ++
 include/linux/soc/mediatek/mtk-mutex.h        |   4 +
 26 files changed, 3555 insertions(+), 303 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_exdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovlsys_adaptor.c
 create mode 100644 drivers/soc/mediatek/mt8196-mmsys.h

-- 
2.45.2


