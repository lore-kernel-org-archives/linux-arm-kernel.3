Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BB3D172DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JA3zsA6uTdixau3C/Ey4v+cmJg9kmvBqBUDsMlEtrzg=; b=p65wq1Y4rkgmUpyWUKEUnEvDmB
	du0DQ085kSydpc8vNElkZ6dKmGDPaaDElKhbTGnYkVZgveBgrouPD2ote82lafpXyLtLWHrDEI1Nz
	YdkFAZrMIU2RCGSy2Xu7O1FiX4OtISgrMHruVIFpI3rRIhpA4+dtPbXQkJ6gQc4PbcNCEwArsZwNY
	2Qe8jqqHzyyh74MVeMXpJ1Jm4uoCz5XSmN+laQSlmMJ5L1QgFpwy3hGXWOjhnbe3jnWZcPMWBZeFt
	W9d/IiTmYSyI4uafoY8yjmCZ8YTXlp6YdVYtTN39KgcYe4b508WcqgJXRPc7iL9Kh6EaNk5EHcYrP
	wShigNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnjf-00000004Yat-2uSb;
	Mon, 02 Feb 2026 06:48:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnjb-00000004YXm-0gOC;
	Mon, 02 Feb 2026 06:48:33 +0000
X-UUID: 2c5c1486000311f1ad39f32c34db0b1c-20260201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JA3zsA6uTdixau3C/Ey4v+cmJg9kmvBqBUDsMlEtrzg=;
	b=Ii+NqL11eKTqAjzGQPuA/orkLk/AVyfD6ifJCLCJYzvE9jYmnAAhOBHMThKUsQwBMdqBAg3Kx00WhQfAAGcO1G/yYeua1Jhb3Wa5yAGBNdRFhER2Rd+mCbnBUPKwZuIn7HsuNX+MuwkiZdg8cM71XWKLTbS7kHcNhtjFtXZENUM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:8e1d65b6-5c41-4d3c-a878-96483810e00d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:89c9d04,CLOUDID:a10939f0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2c5c1486000311f1ad39f32c34db0b1c-20260201
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 639271742; Sun, 01 Feb 2026 23:48:25 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 14:48:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 14:48:21 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <mbrugger@suse.com>, <devicetree@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Qiqi Wang
	<qiqi.wang@mediatek.com>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>,
	<irving-ch.lin@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: power: Add MediaTek MT8189 power domain
Date: Mon, 2 Feb 2026 14:48:13 +0800
Message-ID: <20260202064820.347550-2-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
References: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_224831_345112_B26D7483 
X-CRM114-Status: GOOD (  13.26  )
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

Add dt schema and IDs for the power domain of MediaTek MT8189 SoC.
The MT8189 power domain IP provide power domains control function
for subsys (eg. MFG, audio, venc/vdec ...).

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 .../power/mediatek,power-controller.yaml      |  1 +
 .../dt-bindings/power/mediatek,mt8189-power.h | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 9507b342a7ee..07f046277f8a 100644
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


