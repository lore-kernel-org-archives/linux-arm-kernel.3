Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E9FCCFA1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ky1zZSMuLCXdFrRW4pfETufvBbUtfeJ1wcUYAYF3cTY=; b=D0hRM0jKJfpCZKNnvGw/xjEC/U
	cDFQeEHMzS64RPOxVLXf0El3LIw0/kdZ9NahE3EykcdTjxTOsUgiidVf2Gm6Qk2rboUBY66DCPFcO
	XMa3zIFwIO6xaeXoTdxetwR+7yeWbI3ZMA5NdZIBBcW/bY37Ohsv6RpeuQbs1c05No1cgNvPDp8iN
	Zy+dYSuGY8rqFY+26jemb5wyO461NDCytkJTwZXwM/Y1RRh3HDkfvhdjGbajF9I4ARmo4HEOxremF
	CNdoWYAvtMqMRZEZxCoHh8dLaoMz25iSTXOaDo50mlf3an/vo3+rl55rD6GuUjwK0e3pMYCiyG/sL
	wsxV786A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzLF-0000000FTZu-2Qcg;
	Thu, 06 Nov 2025 12:43:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzL9-0000000FTQc-2Ciy;
	Thu, 06 Nov 2025 12:43:49 +0000
X-UUID: 386e3810bb0e11f09f706fa2197c6ceb-20251106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ky1zZSMuLCXdFrRW4pfETufvBbUtfeJ1wcUYAYF3cTY=;
	b=jBv2lEFCKrL71l5kdwOPd+volH+MU1XR5haNrXyEtCqr/5SvzSANCNFww2+xEIQwwKGQONGzWxYsVEha9om8roAsUj+AYNe2E+FigO8gVUvCHwScPwxb8TenBgnAyMQ+by8uWFgOpgJQ87lrnMoFk9maZeD/XHh8ZbD4qsHmtHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:1c6b118f-5e66-4fc7-88ce-271e21a5a61a,IP:0,UR
	L:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:a9d874c,CLOUDID:bb351d6b-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 386e3810bb0e11f09f706fa2197c6ceb-20251106
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 629308736; Thu, 06 Nov 2025 05:43:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 6 Nov 2025 20:43:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 6 Nov 2025 20:43:36 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Richard Cochran <richardcochran@gmail.com>
CC: Qiqi Wang <qiqi.wang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <irving-ch.lin@mediatek.com>
Subject: [PATCH v3 02/21] dt-bindings: power: mediatek: Add MT8189 power domain definitions
Date: Thu, 6 Nov 2025 20:41:47 +0800
Message-ID: <20251106124330.1145600-3-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_044347_569280_E3FCE159 
X-CRM114-Status: GOOD (  12.75  )
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

From: Irving-CH Lin <irving-ch.lin@mediatek.com>

Add device tree bindings for the power domains of MediaTek MT8189 SoC.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 .../power/mediatek,power-controller.yaml      |  1 +
 .../dt-bindings/power/mediatek,mt8189-power.h | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index f8a13928f615..443c227c0e51 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -31,6 +31,7 @@ properties:
       - mediatek,mt8183-power-controller
       - mediatek,mt8186-power-controller
       - mediatek,mt8188-power-controller
+      - mediatek,mt8189-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
       - mediatek,mt8196-hwv-hfrp-power-controller
diff --git a/include/dt-bindings/power/mediatek,mt8189-power.h b/include/dt-bindings/power/mediatek,mt8189-power.h
new file mode 100644
index 000000000000..70a8c2113457
--- /dev/null
+++ b/include/dt-bindings/power/mediatek,mt8189-power.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Qiqi Wang <qiqi.wang@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8189_POWER_H
+#define _DT_BINDINGS_POWER_MT8189_POWER_H
+
+/* SPM */
+#define MT8189_POWER_DOMAIN_CONN			0
+#define MT8189_POWER_DOMAIN_AUDIO			1
+#define MT8189_POWER_DOMAIN_ADSP_TOP_DORMANT		2
+#define MT8189_POWER_DOMAIN_ADSP_INFRA			3
+#define MT8189_POWER_DOMAIN_ADSP_AO			4
+#define MT8189_POWER_DOMAIN_MM_INFRA			5
+#define MT8189_POWER_DOMAIN_ISP_IMG1			6
+#define MT8189_POWER_DOMAIN_ISP_IMG2			7
+#define MT8189_POWER_DOMAIN_ISP_IPE			8
+#define MT8189_POWER_DOMAIN_VDE0			9
+#define MT8189_POWER_DOMAIN_VEN0			10
+#define MT8189_POWER_DOMAIN_CAM_MAIN			11
+#define MT8189_POWER_DOMAIN_CAM_SUBA			12
+#define MT8189_POWER_DOMAIN_CAM_SUBB			13
+#define MT8189_POWER_DOMAIN_MDP0			14
+#define MT8189_POWER_DOMAIN_DISP			15
+#define MT8189_POWER_DOMAIN_DP_TX			16
+#define MT8189_POWER_DOMAIN_CSI_RX			17
+#define MT8189_POWER_DOMAIN_SSUSB			18
+#define MT8189_POWER_DOMAIN_MFG0			19
+#define MT8189_POWER_DOMAIN_MFG1			20
+#define MT8189_POWER_DOMAIN_MFG2			21
+#define MT8189_POWER_DOMAIN_MFG3			22
+#define MT8189_POWER_DOMAIN_EDP_TX_DORMANT		23
+#define MT8189_POWER_DOMAIN_PCIE			24
+#define MT8189_POWER_DOMAIN_PCIE_PHY			25
+
+#endif /* _DT_BINDINGS_POWER_MT8189_POWER_H */
-- 
2.45.2


