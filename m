Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455CEC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2uctqsBOVfw44286a8eWc49jMtIazpf2BUO8MAhx3po=; b=ZrgQDWHK/viURQpoMRhHRYA1mW
	gj2Vsr7+hDJNNyfp1gl/PtwIkDUTl5Ila63/R/oXkRq1xA3XFuTbi74JkjUr6eiMnSAka+R7gf/u/
	W1IuVoLzQKlPgbKNH4djHjxCbIH2ytIxBQ5Ssun1d9x+ot4V4EJkqW2XTF+nKI35rc3Ze0CIRxFG4
	d+a2eUwjoph/WQ9a4CIdBLJUsutfxpR8ixtpLlVWMX/bldFk+XpCGqU123m3DYMPLdLD3N9YbkQOd
	6tyiqh6nsgqAfaPbsz66u8ZPKsiSYvDyFi20eyOmNxmiNTgR+wB61kNuUlaBzmkRNI/vGPq5RtKGI
	Q0Cncs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uInd2-00000005pTZ-2nxS;
	Sat, 24 May 2025 12:05:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uInPz-00000005oGg-0DGe;
	Sat, 24 May 2025 11:52:03 +0000
X-UUID: 7b30337a389511f0bed96b30c12bc3d6-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2uctqsBOVfw44286a8eWc49jMtIazpf2BUO8MAhx3po=;
	b=IiOX/wh+PWxF4m1N9XLBhDPnR2iySx25re6hWJ/9uOMoM4EL1pD/jVB4pXXw9t4kTVvsPpScSE+r2fJAoYkV37Bee7XFUoPaYiS8qYECEoma4rAWcBeIxI4Rp3/lVcoJnztd0ykgSJrLg2ug2eV5iMRmpXhziXo1vgrtPK6gsM0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:46320e99-68b5-436f-9fd4-73db1675a355,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:6e8ded57-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b30337a389511f0bed96b30c12bc3d6-20250524
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1160916342; Sat, 24 May 2025 04:51:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 24 May 2025 19:51:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 24 May 2025 19:51:47 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Olivia Wen <olivia.wen@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>
Subject: [PATCH v1 00/10] Add MediaTek ISP7 Image Syatem driver
Date: Sat, 24 May 2025 19:49:52 +0800
Message-ID: <20250524115144.3832748-1-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_045159_093651_7AC7A3FF 
X-CRM114-Status: GOOD (  13.77  )
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

Dear Maintainers,

I am pleased to submit this patch series that introduces the MediaTek
ISP7 Image System driver. This series consists of ten patches that
collectively add support for various components and functionalities of
the ISP7 architecture. The patches include device tree bindings, user
API definitions, V4L2 flow support, LARB device integration, CMDQ
support, SCP support, and image processing flows.

MediaTek's Image System (ImgSys), also known as ISP Pass2, is a
memory-to-memory hardware device designed for advanced image processing
tasks. ImgSys includes multiple hardware components such as TRAW, DIP,
PQDIP, ME, and WPE.

- **TRAW (Tile RAW)**:
  Provides multiple downscaled resizers for multi-scale noise reduction
  and supports RAW/RGB format conversion.

- **DIP (Digital Image Processing) and PQDIP (Picture Quality DIP)**:
  Supports temporal and spatial noise reduction (TNR/SNR), edge
  enhancement (EE), sharpness (SHP), image scaling, and rotation.

- **ME (Motion Estimation)**:
  Supports motion estimation between consecutive frames.

- **WPE (Warping Engine)**:
  Handles image warping and de-warping processes.

ImgSys utilizes Multi-Frame Combined Noise Reduction (MCNR) technology to
enhance image quality.

Below is a simplified architecture of the ImgSys driver:
User -> V4L2 Framework -> ImgSys Driver
     -> SCP (It packages the hardware settings into commands)
     -> ImgSys Driver
     -> CMDQ (The packaged commands are sent to the hardware via GCE)
     -> Hardware

Thease patches are base on linux-next/master, tag: next-20250523
Thank you for reviewing these patches.

Olivia Wen (10):
  dt-bindings: media: Add MediaTek mt8188 ImgSys components
  dt-bindings: media: Add MT8188 ImgSys's LARB
  uapi: linux: Add MediaTek Imgsys user API
  media: mediatek: isp: Add V4L2 flow support for ImgSys driver
  media: mediatek: isp: Add the Imgsys LARBs device
  media: mediatek: isp: Add module operations structure for ImgSys
  media: mediatek: isp: Add CMDQ support for ImgSys driver
  media: mediatek: isp: Add SCP support for ImgSys driver
  media: mediatek: isp: Add image processing flow
  media: mediatek: isp: Add normal data dump flow

 .../bindings/media/mediatek,imgsys-larbs.yaml |   75 +
 .../bindings/media/mediatek,imgsys.yaml       |  180 ++
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/isp/Kconfig   |   23 +
 .../platform/mediatek/isp/isp_7x/Makefile     |    6 +
 .../mediatek/isp/isp_7x/imgsys/Makefile       |   25 +
 .../imgsys/modules/mtk_dip_v4l2_vnode.h       |  594 +++++
 .../isp_7x/imgsys/modules/mtk_imgsys-dip.c    |  162 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-dip.h    |   21 +
 .../isp/isp_7x/imgsys/modules/mtk_imgsys-me.c |   65 +
 .../isp/isp_7x/imgsys/modules/mtk_imgsys-me.h |   30 +
 .../isp_7x/imgsys/modules/mtk_imgsys-pqdip.c  |  165 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-pqdip.h  |   20 +
 .../isp_7x/imgsys/modules/mtk_imgsys-traw.c   |  120 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-traw.h   |   20 +
 .../isp_7x/imgsys/modules/mtk_imgsys-wpe.c    |  176 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-wpe.h    |   20 +
 .../isp_7x/imgsys/modules/mtk_me_v4l2_vnode.h |  386 ++++
 .../imgsys/modules/mtk_pqdip_v4l2_vnode.h     |  149 ++
 .../imgsys/modules/mtk_traw_v4l2_vnode.h      |  371 ++++
 .../imgsys/modules/mtk_wpe_v4l2_vnode.h       |  317 +++
 .../mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h  |  151 ++
 .../isp/isp_7x/imgsys/mtk_header_desc.h       |  129 ++
 .../isp/isp_7x/imgsys/mtk_imgsys-cmdq-plat.h  |  502 +++++
 .../isp/isp_7x/imgsys/mtk_imgsys-cmdq.c       |  690 ++++++
 .../isp/isp_7x/imgsys/mtk_imgsys-cmdq.h       |   29 +
 .../isp/isp_7x/imgsys/mtk_imgsys-dev.c        |  299 +++
 .../isp/isp_7x/imgsys/mtk_imgsys-dev.h        |  570 +++++
 .../isp/isp_7x/imgsys/mtk_imgsys-formats.c    |  139 ++
 .../isp/isp_7x/imgsys/mtk_imgsys-formats.h    |   72 +
 .../isp/isp_7x/imgsys/mtk_imgsys-gce_work.c   |   86 +
 .../isp/isp_7x/imgsys/mtk_imgsys-gce_work.h   |   37 +
 .../isp_7x/imgsys/mtk_imgsys-module_common.h  |  102 +
 .../isp_7x/imgsys/mtk_imgsys-module_main.c    |  187 ++
 .../isp_7x/imgsys/mtk_imgsys-module_main.h    |   17 +
 .../isp/isp_7x/imgsys/mtk_imgsys-module_ops.h |   64 +
 .../isp_7x/imgsys/mtk_imgsys-ndd_debugfs.c    |  342 +++
 .../isp_7x/imgsys/mtk_imgsys-ndd_debugfs.h    |   64 +
 .../isp/isp_7x/imgsys/mtk_imgsys-of.c         |   39 +
 .../isp/isp_7x/imgsys/mtk_imgsys-of.h         |   58 +
 .../isp/isp_7x/imgsys/mtk_imgsys-scp.c        |  349 +++
 .../isp/isp_7x/imgsys/mtk_imgsys-scp.h        |  194 ++
 .../isp/isp_7x/imgsys/mtk_imgsys-sys.c        |  556 +++++
 .../isp/isp_7x/imgsys/mtk_imgsys-sys.h        |   50 +
 .../isp/isp_7x/imgsys/mtk_imgsys-v4l2.c       | 1919 +++++++++++++++++
 .../isp/isp_7x/imgsys/mtk_imgsys-vnode_id.h   |  100 +
 .../isp/isp_7x/imgsys/mtk_imgsys-work_buf.c   |  113 +
 .../isp/isp_7x/imgsys/mtk_imgsys-work_buf.h   |   55 +
 .../isp/isp_7x/imgsys/mtk_imgsys_v4l2_vnode.h |  135 ++
 include/uapi/linux/mtkisp_imgsys.h            |  215 ++
 51 files changed, 10190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys.yaml
 create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_dip_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_me_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_pqdip_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_traw_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_wpe_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_header_desc.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq-plat.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_common.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-vnode_id.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys_v4l2_vnode.h
 create mode 100644 include/uapi/linux/mtkisp_imgsys.h

-- 
2.45.2


