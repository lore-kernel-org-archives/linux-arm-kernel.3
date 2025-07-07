Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23055C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 01:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cdlc04E1tdFEfjkZqRxpFdxS/bmtRAytjILJEuUfeNc=; b=R9tNanllEF3xU5RbwZF9AMievc
	UvDSVJV0OLbLGD1ULcDhLNMwfQv9925lj9eatm+NERr87ipvyddEdH6S0Iscszygaq+UeEbsLc2eX
	gyaCodZWuH+wLX8SYeY0eSheLXL+nisWODzqw1BOfgl6EbFmA0BJyJds98Grn+YuwAWlTmtAUrrU4
	wx26cVctKCK30QNek3xIMnDgbKB5f2A9AWZ8f04vEUkKVYKZTx1QlfKXI9GXOnh63WrTdVmNddbcL
	q0hVJabHjiS3OkeXa/lkDmUUrcgVmrR4OhTqm9ktLT9f6aCyhvr7F1xXdcxOhz9DA5QIRuY/nB0iH
	2U971T6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYb0j-000000019Xm-3Unt;
	Mon, 07 Jul 2025 01:51:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYajF-000000016RG-3ZWG;
	Mon, 07 Jul 2025 01:33:10 +0000
X-UUID: 5448ef045ad211f09f706fa2197c6ceb-20250706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Cdlc04E1tdFEfjkZqRxpFdxS/bmtRAytjILJEuUfeNc=;
	b=I+r22k0VMrbplWmrygNVhJfRQwUshIn+tA1gP9K6PtSsDGWhA+ZsO0+Q7W6s4iJ04vQXZk+wzgoqOVbXsSbo1F6QXFns+gcWte5/k0veKRg4Gjirx3YGpEm1GTu2SBy22YQues3vjTcSEtSG3f9HcEPHCWEJ/e0e2uo+Qz1eQ3A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:46777318-c356-4633-8553-6da9ddeffdff,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:daddf073-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5448ef045ad211f09f706fa2197c6ceb-20250706
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shangyao.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 328546648; Sun, 06 Jul 2025 18:33:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:33:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:33:02 +0800
From: shangyao lin <shangyao.lin@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Shangyao Lin <shangyao.lin@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 11/13] media: platform: mediatek: add isp_7x build config
Date: Mon, 7 Jul 2025 09:31:52 +0800
Message-ID: <20250707013154.4055874-12-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_183309_892662_56867C13 
X-CRM114-Status: GOOD (  16.38  )
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

From: "shangyao.lin" <shangyao.lin@mediatek.com>

Add Kconfig and Makefile to include MTK ISP CAMSYS, integrating the driver into
the kernel build and configuration process.

Question for CK:

Hi CK,

Thank you for your review and comments.

Just to confirm, do you mean that when I add mtk_cam-seninf-route.c and
mtk_cam-seninf-drv.c in patch [3/10], I should also create or update the
corresponding Makefile to ensure these two .c files are compiled as part of the
driver? Is my understanding correct?

Thank you for your clarification.

Best regards,
Shangyao

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 drivers/media/platform/mediatek/Kconfig       |  1 +
 drivers/media/platform/mediatek/Makefile      |  2 ++
 drivers/media/platform/mediatek/isp/Kconfig   | 21 +++++++++++++++++++
 .../platform/mediatek/isp/isp_7x/Makefile     |  7 +++++++
 .../mediatek/isp/isp_7x/camsys/Makefile       | 14 +++++++++++++
 5 files changed, 45 insertions(+)
 mode change 100644 => 100755 drivers/media/platform/mediatek/Kconfig
 mode change 100644 => 100755 drivers/media/platform/mediatek/Makefile
 create mode 100755 drivers/media/platform/mediatek/isp/Kconfig
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/Makefile
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile

diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
old mode 100644
new mode 100755
index 84104e2cd024..a405d5701329
--- a/drivers/media/platform/mediatek/Kconfig
+++ b/drivers/media/platform/mediatek/Kconfig
@@ -2,6 +2,7 @@
 
 comment "Mediatek media platform drivers"
 
+source "drivers/media/platform/mediatek/isp/Kconfig"
 source "drivers/media/platform/mediatek/jpeg/Kconfig"
 source "drivers/media/platform/mediatek/mdp/Kconfig"
 source "drivers/media/platform/mediatek/vcodec/Kconfig"
diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
old mode 100644
new mode 100755
index 38e6ba917fe5..74164df8c68d
--- a/drivers/media/platform/mediatek/Makefile
+++ b/drivers/media/platform/mediatek/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
 obj-y += jpeg/
 obj-y += mdp/
 obj-y += vcodec/
 obj-y += vpu/
 obj-y += mdp3/
+obj-y += isp/isp_7x/
diff --git a/drivers/media/platform/mediatek/isp/Kconfig b/drivers/media/platform/mediatek/isp/Kconfig
new file mode 100755
index 000000000000..ce4dd21e3e79
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_MTK_ISP_71_CAMSYS
+	tristate "MediaTek ISP 7.1 camsys driver"
+	depends on ARCH_MEDIATEK
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select RPMSG_MTK_CCD
+	select MTKCCD_REMOTEPROC
+	select MTK_SCP
+
+	default n
+	help
+		Camsys driver controls 3A (auto-focus, exposure,
+		and white balance) with tuning feature and outputs
+		the captured image buffers in MediaTek's ISP7 system.
+
+		Choose y if you want to use MediaTek SoCs to create image
+		captured application such as video recording and still image
+		capturing.
\ No newline at end of file
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/Makefile
new file mode 100755
index 000000000000..be70346d224b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+subdir-ccflags-y += -Werror
+
+subdir-ccflags-$(CONFIG_VIDEO_MTK_ISP_71_CAMSYS) += -DISP7_1
+
+obj-$(CONFIG_VIDEO_MTK_ISP_71_CAMSYS) += camsys/
\ No newline at end of file
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
new file mode 100755
index 000000000000..700ac2a85ac4
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2022 MediaTek Inc.
+
+mtk-cam-isp-objs := mtk_cam.o mtk_cam-raw.o mtk_cam-pool.o \
+		    mtk_cam-video.o mtk_cam-ctrl.o \
+		    mtk_cam-seninf-route.o mtk_cam-seninf-drv.o \
+		    mtk_cam-timesync.o
+
+mtk-cam-plat-util-objs :=  mtk_cam-plat-util.o
+
+include $(src)/mtk_csi_phy_2_0/Makefile
+
+obj-$(CONFIG_VIDEO_MTK_ISP_71_CAMSYS) += mtk-cam-plat-util.o
+obj-$(CONFIG_VIDEO_MTK_ISP_71_CAMSYS) += mtk-cam-isp.o
-- 
2.18.0


