Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA80CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MrujfuRgv2BkE0UC6YnsNJizBYJH3r4XVo1YyTPivw8=; b=Wazncsw5aTjJZpdD8hmincfFSJ
	ysS6GPf20fG3WN+gyL9Tk+NNp3mYuz5mJyHh9Qr4T7+48FUvWj/8FNFDst1jGCUVe5a6UUUJUNKkW
	U9xY2jkJVlJF83SadWwuv/eJaqh081fjK9/YdKYQcg5HswtKJO/g2/bETRuBGCQ/TN2Ozi7ew/g3c
	8y8HERTdeZhBvs3D7/86D/u/bYC3WenyrxzCcVP2QCht7kYTkGt5N58yVSEdFCHpjtLJz/HkbfFQd
	rU8OYIc2KkiWhJNEWgBTYt/EUzSa63y4y3nOT3AOEKz/Ij+CQxy7NAJ9bixzXzyoYk+iwfVyrxU4m
	mtulSt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPwP-00000000Joo-2VHR;
	Fri, 05 Jun 2026 08:30:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPwM-00000000Jo1-3baV;
	Fri, 05 Jun 2026 08:30:08 +0000
X-UUID: becb576260b811f1acbe4559397dec65-20260605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MrujfuRgv2BkE0UC6YnsNJizBYJH3r4XVo1YyTPivw8=;
	b=I37dTbOzPUdX4fmgZ/C8Rxd+DraWMgBKfhgEH0vKfdTRkXkOK1kjnzudoLOC0w7T03NorKvU7ttLUA5lYRjFXdxUy7ib/KeDGAqEriqkZsvlz7+LPSsjo0JD4dBkuNV001axzIxGFluNY0edtwv55h71zIJGxUDRHG53JkHyQtI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:124d7938-efca-413d-8240-e737f9f53de7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:19a45737-f46c-458c-9a64-0117b9a7c6af,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: becb576260b811f1acbe4559397dec65-20260605
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <sarang.chaudhari@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 662287028; Fri, 05 Jun 2026 01:30:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 16:29:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 16:29:59 +0800
From: Sarang Chaudhari <sarang.chaudhari@mediatek.com>
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <zhaoyuan.chen@mediatek.com>, <Teddy.Chen@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Sarang Chaudhari
	<sarang.chaudhari@mediatek.com>
Subject: [PATCH v6 3/4] media: uapi: mediatek: Add MT8188 AIE control definitions
Date: Fri, 5 Jun 2026 16:29:53 +0800
Message-ID: <20260605082956.2590511-1-sarang.chaudhari@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_013007_033925_C5F56234 
X-CRM114-Status: GOOD (  16.56  )
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

Add AIE (AI Engine) UAPI control definitions and register the
V4L2_META_FMT_MTFD_RESULT metadata format for the MediaTek face
detection hardware accelerator.

This patch adds:
- include/uapi/linux/mtk_aie_v4l2_controls.h: Custom V4L2 control IDs
  for AIE initialization and per-frame parameters.
- V4L2_META_FMT_MTFD_RESULT format in videodev2.h for face detection
  result metadata output.
- Format description in v4l2-ioctl.c.

Signed-off-by: Sarang Chaudhari <sarang.chaudhari@mediatek.com>
---
Changes in v6:
- Simplify UAPI header to contain only control ID definitions. Full
  structures kept in kernel-internal header for now, pending UAPI
  structure redesign per CK Hu's feedback.
- Drop V4L2_CTRL_TYPE_AIE_INIT and V4L2_CTRL_TYPE_AIE_PARAM from
  v4l2_ctrl_type enum (use V4L2_CTRL_TYPE_U32 compound control instead).
- Address CK Hu's review feedback: remove freq_level, improve
  feature_threshold docs, clarify pyramid multi-scale detection, clarify
  FLD mode uses FD results via Binary Tree Traversal.

Changes in v5:
- Add an introduction for feature_threshold.
- Rename v4l2_aie_roi to aie_roi_coordinate.
- Rename v4l2_aie_padding to aie_padding_size.
- Explain en_padding and the three modes of fd_mode.
- Move structures from mtk_aie.h to the uapi directory.

Changes in v4:
- Document the detail of V4L2_META_FMT_MTFD_RESULT.
- Add the introduction of related variables.

Changes in v3: None

Changes in v2:
- Fix coding style.

 drivers/media/v4l2-core/v4l2-ioctl.c       |  1 +
 include/uapi/linux/mtk_aie_v4l2_controls.h | 23 ++++++++++++++++++++++
 include/uapi/linux/videodev2.h             |  1 +
 3 files changed, 25 insertions(+)
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index e50e517..8754098 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -11,6 +11,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
+	case V4L2_META_FMT_MTFD_RESULT:	descr = "Mediatek Face Detect Result"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/mtk_aie_v4l2_controls.h b/include/uapi/linux/mtk_aie_v4l2_controls.h
new file mode 100644
index 0000000..a8b2927
--- /dev/null
+++ b/include/uapi/linux/mtk_aie_v4l2_controls.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * MediaTek AI Engine (AIE) V4L2 control definitions
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Fish Wu <fish.wu@mediatek.com>
+ */
+
+#ifndef __UAPI_MTK_AIE_V4L2_CONTROLS_H__
+#define __UAPI_MTK_AIE_V4L2_CONTROLS_H__
+
+#include <linux/videodev2.h>
+
+/*
+ * The base for the MediaTek AIE driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_MTK_FD_BASE	(V4L2_CID_USER_BASE + 0x1fd0)
+
+#define V4L2_CID_MTK_AIE_INIT		(V4L2_CID_USER_MTK_FD_BASE + 1)
+#define V4L2_CID_MTK_AIE_PARAM		(V4L2_CID_USER_MTK_FD_BASE + 2)
+
+#endif /* __UAPI_MTK_AIE_V4L2_CONTROLS_H__ */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 7668201..6d6866d 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -10,6 +10,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_MTFD_RESULT	v4l2_fourcc('M', 'T', 'f', 'd') /* Mediatek face detection result */
 #endif
 
 /* priv field value to indicates that subsequent fields are valid. */
-- 
2.45.2


