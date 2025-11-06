Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4896CCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDCdJGKnSyOajO/4HDmDuNh29qGX4TUIZSTFaIz1pIU=; b=0oRe2EfmDeeG61YhM/a6BOZQY+
	rVI4LTCpohPLJDS797HUtHCC0szG/rCkqn0hlMRiDEAA+oMgeohEkqKBvkvHtW+s4c3AWL7TAYdn6
	ByRDNvb2la+byv60YcsWQXRVUoT37w2SX9mMyN0N5eH7QePpdFS1Yg7QECGCdM5poeA4e23KVPw0/
	DDiIfRH1tMwkft2NSqB1EyreQzd5KxGzlPD6vJnuw3gZhElyfPszKqY4j9P+gvKPk8Y/4U6RVf7J3
	N7rUtqulFHBtrWvJC7+2Sbc578At2FsCFIM2aG/Gt/DP8mwjN/451b+RwIADVQcxsIFupqSmjroSR
	KtMTXbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzLN-0000000FTl1-0L2H;
	Thu, 06 Nov 2025 12:44:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzLA-0000000FTQX-3Zf8;
	Thu, 06 Nov 2025 12:43:52 +0000
X-UUID: 39b10298bb0e11f0a52f393f94899d25-20251106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nDCdJGKnSyOajO/4HDmDuNh29qGX4TUIZSTFaIz1pIU=;
	b=U0yk/F0sFeinTVbbphlqys80gDRrYFPxxVNSMkCMs5LyrXkIs5anbisRUuTC6Vji35SRP5KLRzem0PIeIaHou8xVdkvMESBMapnzsuF31uljopQM3QG/Z4ZgZLCCwipwslWkrYBDFhHfSk8NgLURXpEnMWeuZTrRMWtHQdzlWz8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:dd4992a5-79c0-43d0-a5db-ca62b0122757,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:b869fe18-3399-4579-97ab-008f994989ea,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 39b10298bb0e11f0a52f393f94899d25-20251106
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 953908441; Thu, 06 Nov 2025 05:43:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 6 Nov 2025 20:43:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 6 Nov 2025 20:43:40 +0800
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
Subject: [PATCH v3 21/21] pmdomain: mediatek: Add power domain driver for MT8189 SoC
Date: Thu, 6 Nov 2025 20:42:06 +0800
Message-ID: <20251106124330.1145600-22-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_044348_969056_43EC3ED0 
X-CRM114-Status: GOOD (  15.04  )
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

Introduce a new power domain (pmd) driver for the MediaTek mt8189 SoC.
This driver ports and refines the power domain framework, dividing
hardware blocks (CPU, GPU, peripherals, etc.) into independent power
domains for precise and energy-efficient power management.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/pmdomain/mediatek/mt8189-pm-domains.h | 485 ++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    |   5 +
 2 files changed, 490 insertions(+)
 create mode 100644 drivers/pmdomain/mediatek/mt8189-pm-domains.h

diff --git a/drivers/pmdomain/mediatek/mt8189-pm-domains.h b/drivers/pmdomain/mediatek/mt8189-pm-domains.h
new file mode 100644
index 000000000000..c28b9460c074
--- /dev/null
+++ b/drivers/pmdomain/mediatek/mt8189-pm-domains.h
@@ -0,0 +1,485 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Qiqi Wang <qiqi.wang@mediatek.com>
+ */
+
+#ifndef __SOC_MEDIATEK_MT8189_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT8189_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mediatek,mt8189-power.h>
+
+/*
+ * MT8189 power domain support
+ */
+
+#define MT8189_SPM_PWR_STATUS				0x0f40
+#define MT8189_SPM_PWR_STATUS_2ND			0x0f44
+#define MT8189_SPM_PWR_STATUS_MSB			0x0f48
+#define MT8189_SPM_PWR_STATUS_MSB_2ND			0x0f4c
+#define MT8189_SPM_XPU_PWR_STATUS			0x0f50
+#define MT8189_SPM_XPU_PWR_STATUS_2ND			0x0f54
+
+#define MT8189_PROT_EN_EMICFG_GALS_SLP_SET		0x0084
+#define MT8189_PROT_EN_EMICFG_GALS_SLP_CLR		0x0088
+#define MT8189_PROT_EN_EMICFG_GALS_SLP_RDY		0x008c
+#define MT8189_PROT_EN_MMSYS_STA_0_SET			0x0c14
+#define MT8189_PROT_EN_MMSYS_STA_0_CLR			0x0c18
+#define MT8189_PROT_EN_MMSYS_STA_0_RDY			0x0c1c
+#define MT8189_PROT_EN_MMSYS_STA_1_SET			0x0c24
+#define MT8189_PROT_EN_MMSYS_STA_1_CLR			0x0c28
+#define MT8189_PROT_EN_MMSYS_STA_1_RDY			0x0c2c
+#define MT8189_PROT_EN_INFRASYS_STA_0_SET		0x0c44
+#define MT8189_PROT_EN_INFRASYS_STA_0_CLR		0x0c48
+#define MT8189_PROT_EN_INFRASYS_STA_0_RDY		0x0c4c
+#define MT8189_PROT_EN_INFRASYS_STA_1_SET		0x0c54
+#define MT8189_PROT_EN_INFRASYS_STA_1_CLR		0x0c58
+#define MT8189_PROT_EN_INFRASYS_STA_1_RDY		0x0c5c
+#define MT8189_PROT_EN_PERISYS_STA_0_SET		0x0c84
+#define MT8189_PROT_EN_PERISYS_STA_0_CLR		0x0c88
+#define MT8189_PROT_EN_PERISYS_STA_0_RDY		0x0c8c
+#define MT8189_PROT_EN_MCU_STA_0_SET			0x0c94
+#define MT8189_PROT_EN_MCU_STA_0_CLR			0x0c98
+#define MT8189_PROT_EN_MCU_STA_0_RDY			0x0c9c
+#define MT8189_PROT_EN_MD_STA_0_SET			0x0ca4
+#define MT8189_PROT_EN_MD_STA_0_CLR			0x0ca8
+#define MT8189_PROT_EN_MD_STA_0_RDY			0x0cac
+
+#define MT8189_PROT_EN_EMISYS_STA_0_MM_INFRA		(GENMASK(21, 20))
+#define MT8189_PROT_EN_INFRASYS_STA_0_CONN		(BIT(8))
+#define MT8189_PROT_EN_INFRASYS_STA_1_CONN		(BIT(12))
+#define MT8189_PROT_EN_INFRASYS_STA_0_MM_INFRA		(BIT(16))
+#define MT8189_PROT_EN_INFRASYS_STA_1_MM_INFRA		(BIT(11))
+#define MT8189_PROT_EN_INFRASYS_STA_1_MFG1		(BIT(20))
+#define MT8189_PROT_EN_MCU_STA_0_CONN			(BIT(1))
+#define MT8189_PROT_EN_MCU_STA_0_CONN_2ND		(BIT(0))
+#define MT8189_PROT_EN_MD_STA_0_MFG1			(BIT(0) | BIT(2))
+#define MT8189_PROT_EN_MD_STA_0_MFG1_2ND		(BIT(4))
+#define MT8189_PROT_EN_MM_INFRA_IGN			(BIT(1))
+#define MT8189_PROT_EN_MM_INFRA_2_IGN			(BIT(0))
+#define MT8189_PROT_EN_MMSYS_STA_0_CAM_MAIN		(GENMASK(31, 30))
+#define MT8189_PROT_EN_MMSYS_STA_1_CAM_MAIN		(GENMASK(10, 9))
+#define MT8189_PROT_EN_MMSYS_STA_0_DISP			(GENMASK(1, 0))
+#define MT8189_PROT_EN_MMSYS_STA_0_ISP_IMG1		(BIT(3))
+#define MT8189_PROT_EN_MMSYS_STA_1_ISP_IMG1		(BIT(7))
+#define MT8189_PROT_EN_MMSYS_STA_0_ISP_IPE		(BIT(2))
+#define MT8189_PROT_EN_MMSYS_STA_1_ISP_IPE		(BIT(8))
+#define MT8189_PROT_EN_MMSYS_STA_0_MDP0			(BIT(18))
+#define MT8189_PROT_EN_MMSYS_STA_1_MM_INFRA		(GENMASK(3, 2))
+#define MT8189_PROT_EN_MMSYS_STA_1_MM_INFRA_2ND		(GENMASK(15, 7))
+#define MT8189_PROT_EN_MMSYS_STA_0_VDE0			(BIT(20))
+#define MT8189_PROT_EN_MMSYS_STA_1_VDE0			(BIT(13))
+#define MT8189_PROT_EN_MMSYS_STA_0_VEN0			(BIT(12))
+#define MT8189_PROT_EN_MMSYS_STA_1_VEN0			(BIT(12))
+#define MT8189_PROT_EN_PERISYS_STA_0_AUDIO		(BIT(6))
+#define MT8189_PROT_EN_PERISYS_STA_0_SSUSB		(BIT(7))
+#define MT8189_PROT_EN_EMICFG_GALS_SLP_MFG1		(GENMASK(5, 4))
+
+static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8189[] = {
+	BUS_PROT_BLOCK_INFRA, BUS_PROT_BLOCK_SMI
+};
+
+static const struct scpsys_domain_data scpsys_domain_data_mt8189[] = {
+	[MT8189_POWER_DOMAIN_CONN] = {
+		.name = "conn",
+		.sta_mask = BIT(1),
+		.ctl_offs = 0xe04,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MCU_STA_0_CONN,
+					MT8189_PROT_EN_MCU_STA_0_SET,
+					MT8189_PROT_EN_MCU_STA_0_CLR,
+					MT8189_PROT_EN_MCU_STA_0_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_INFRASYS_STA_1_CONN,
+					MT8189_PROT_EN_INFRASYS_STA_1_SET,
+					MT8189_PROT_EN_INFRASYS_STA_1_CLR,
+					MT8189_PROT_EN_INFRASYS_STA_1_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MCU_STA_0_CONN_2ND,
+					MT8189_PROT_EN_MCU_STA_0_SET,
+					MT8189_PROT_EN_MCU_STA_0_CLR,
+					MT8189_PROT_EN_MCU_STA_0_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_INFRASYS_STA_0_CONN,
+					MT8189_PROT_EN_INFRASYS_STA_0_SET,
+					MT8189_PROT_EN_INFRASYS_STA_0_CLR,
+					MT8189_PROT_EN_INFRASYS_STA_0_RDY),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8189_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
+		.sta_mask = BIT(6),
+		.ctl_offs = 0xe18,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_PERISYS_STA_0_AUDIO,
+					MT8189_PROT_EN_PERISYS_STA_0_SET,
+					MT8189_PROT_EN_PERISYS_STA_0_CLR,
+					MT8189_PROT_EN_PERISYS_STA_0_RDY),
+		},
+	},
+	[MT8189_POWER_DOMAIN_ADSP_TOP_DORMANT] = {
+		.name = "adsp-top-dormant",
+		.sta_mask = BIT(7),
+		.ctl_offs = 0xe1c,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(9),
+		.sram_pdn_ack_bits = BIT(13),
+		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_SRAM_PDN_INVERTED |
+			MTK_SCPD_ACTIVE_WAKEUP | MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8189_POWER_DOMAIN_ADSP_INFRA] = {
+		.name = "adsp-infra",
+		.sta_mask = BIT(8),
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.ctl_offs = 0xe20,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8189_POWER_DOMAIN_ADSP_AO] = {
+		.name = "adsp-ao",
+		.sta_mask = BIT(9),
+		.ctl_offs = 0xe24,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+	},
+	[MT8189_POWER_DOMAIN_ISP_IMG1] = {
+		.name = "isp-img1",
+		.sta_mask = BIT(10),
+		.ctl_offs = 0xe28,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_0_ISP_IMG1,
+					MT8189_PROT_EN_MMSYS_STA_0_SET,
+					MT8189_PROT_EN_MMSYS_STA_0_CLR,
+					MT8189_PROT_EN_MMSYS_STA_0_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_1_ISP_IMG1,
+					MT8189_PROT_EN_MMSYS_STA_1_SET,
+					MT8189_PROT_EN_MMSYS_STA_1_CLR,
+					MT8189_PROT_EN_MMSYS_STA_1_RDY),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8189_POWER_DOMAIN_ISP_IMG2] = {
+		.name = "isp-img2",
+		.sta_mask = BIT(11),
+		.ctl_offs = 0xe2c,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8189_POWER_DOMAIN_ISP_IPE] = {
+		.name = "isp-ipe",
+		.sta_mask = BIT(12),
+		.ctl_offs = 0xe30,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_0_ISP_IPE,
+					MT8189_PROT_EN_MMSYS_STA_0_SET,
+					MT8189_PROT_EN_MMSYS_STA_0_CLR,
+					MT8189_PROT_EN_MMSYS_STA_0_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_1_ISP_IPE,
+					MT8189_PROT_EN_MMSYS_STA_1_SET,
+					MT8189_PROT_EN_MMSYS_STA_1_CLR,
+					MT8189_PROT_EN_MMSYS_STA_1_RDY),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8189_POWER_DOMAIN_VDE0] = {
+		.name = "vde0",
+		.sta_mask = BIT(14),
+		.ctl_offs = 0xe38,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_0_VDE0,
+					MT8189_PROT_EN_MMSYS_STA_0_SET,
+					MT8189_PROT_EN_MMSYS_STA_0_CLR,
+					MT8189_PROT_EN_MMSYS_STA_0_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_1_VDE0,
+					MT8189_PROT_EN_MMSYS_STA_1_SET,
+					MT8189_PROT_EN_MMSYS_STA_1_CLR,
+					MT8189_PROT_EN_MMSYS_STA_1_RDY),
+		},
+	},
+	[MT8189_POWER_DOMAIN_VEN0] = {
+		.name = "ven0",
+		.sta_mask = BIT(16),
+		.ctl_offs = 0xe40,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_0_VEN0,
+					MT8189_PROT_EN_MMSYS_STA_0_SET,
+					MT8189_PROT_EN_MMSYS_STA_0_CLR,
+					MT8189_PROT_EN_MMSYS_STA_0_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_1_VEN0,
+					MT8189_PROT_EN_MMSYS_STA_1_SET,
+					MT8189_PROT_EN_MMSYS_STA_1_CLR,
+					MT8189_PROT_EN_MMSYS_STA_1_RDY),
+		},
+	},
+	[MT8189_POWER_DOMAIN_CAM_MAIN] = {
+		.name = "cam-main",
+		.sta_mask = BIT(18),
+		.ctl_offs = 0xe48,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_0_CAM_MAIN,
+					MT8189_PROT_EN_MMSYS_STA_0_SET,
+					MT8189_PROT_EN_MMSYS_STA_0_CLR,
+					MT8189_PROT_EN_MMSYS_STA_0_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_1_CAM_MAIN,
+					MT8189_PROT_EN_MMSYS_STA_1_SET,
+					MT8189_PROT_EN_MMSYS_STA_1_CLR,
+					MT8189_PROT_EN_MMSYS_STA_1_RDY),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8189_POWER_DOMAIN_CAM_SUBA] = {
+		.name = "cam-suba",
+		.sta_mask = BIT(20),
+		.ctl_offs = 0xe50,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8189_POWER_DOMAIN_CAM_SUBB] = {
+		.name = "cam-subb",
+		.sta_mask = BIT(21),
+		.ctl_offs = 0xe54,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8189_POWER_DOMAIN_MDP0] = {
+		.name = "mdp0",
+		.sta_mask = BIT(26),
+		.ctl_offs = 0xe68,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_0_MDP0,
+					MT8189_PROT_EN_MMSYS_STA_0_SET,
+					MT8189_PROT_EN_MMSYS_STA_0_CLR,
+					MT8189_PROT_EN_MMSYS_STA_0_RDY),
+		},
+	},
+	[MT8189_POWER_DOMAIN_DISP] = {
+		.name = "disp",
+		.sta_mask = BIT(28),
+		.ctl_offs = 0xe70,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_0_DISP,
+					MT8189_PROT_EN_MMSYS_STA_0_SET,
+					MT8189_PROT_EN_MMSYS_STA_0_CLR,
+					MT8189_PROT_EN_MMSYS_STA_0_RDY),
+		},
+	},
+	[MT8189_POWER_DOMAIN_MM_INFRA] = {
+		.name = "mm-infra",
+		.sta_mask = BIT(30),
+		.ctl_offs = 0xe78,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_1_MM_INFRA,
+					MT8189_PROT_EN_MMSYS_STA_1_SET,
+					MT8189_PROT_EN_MMSYS_STA_1_CLR,
+					MT8189_PROT_EN_MMSYS_STA_1_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MMSYS_STA_1_MM_INFRA_2ND,
+					MT8189_PROT_EN_MMSYS_STA_1_SET,
+					MT8189_PROT_EN_MMSYS_STA_1_CLR,
+					MT8189_PROT_EN_MMSYS_STA_1_RDY),
+			BUS_PROT_WR_IGN_SUBCLK(INFRA,
+					       MT8189_PROT_EN_MM_INFRA_IGN,
+					       MT8189_PROT_EN_MMSYS_STA_1_SET,
+					       MT8189_PROT_EN_MMSYS_STA_1_CLR,
+					       MT8189_PROT_EN_MMSYS_STA_1_RDY),
+			BUS_PROT_WR_IGN_SUBCLK(INFRA,
+					       MT8189_PROT_EN_MM_INFRA_2_IGN,
+					       MT8189_PROT_EN_MMSYS_STA_1_SET,
+					       MT8189_PROT_EN_MMSYS_STA_1_CLR,
+					       MT8189_PROT_EN_MMSYS_STA_1_RDY),
+		},
+	},
+	[MT8189_POWER_DOMAIN_DP_TX] = {
+		.name = "dp-tx",
+		.sta_mask = BIT(0),
+		.ctl_offs = 0xe80,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+	},
+	[MT8189_POWER_DOMAIN_CSI_RX] = {
+		.name = "csi-rx",
+		.sta_mask = BIT(7),
+		.ctl_offs = 0xe9c,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8189_POWER_DOMAIN_SSUSB] = {
+		.name = "ssusb",
+		.sta_mask = BIT(10),
+		.ctl_offs = 0xea8,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_PERISYS_STA_0_SSUSB,
+					MT8189_PROT_EN_PERISYS_STA_0_SET,
+					MT8189_PROT_EN_PERISYS_STA_0_CLR,
+					MT8189_PROT_EN_PERISYS_STA_0_RDY),
+		},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8189_POWER_DOMAIN_MFG0] = {
+		.name = "mfg0",
+		.sta_mask = BIT(1),
+		.ctl_offs = 0xeb4,
+		.pwr_sta_offs = MT8189_SPM_XPU_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_XPU_PWR_STATUS_2ND,
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
+	},
+	[MT8189_POWER_DOMAIN_MFG1] = {
+		.name = "mfg1",
+		.sta_mask = BIT(2),
+		.ctl_offs = 0xeb8,
+		.pwr_sta_offs = MT8189_SPM_XPU_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_XPU_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_cfg = {
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_INFRASYS_STA_1_MFG1,
+					MT8189_PROT_EN_INFRASYS_STA_1_SET,
+					MT8189_PROT_EN_INFRASYS_STA_1_CLR,
+					MT8189_PROT_EN_INFRASYS_STA_1_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MD_STA_0_MFG1,
+					MT8189_PROT_EN_MD_STA_0_SET,
+					MT8189_PROT_EN_MD_STA_0_CLR,
+					MT8189_PROT_EN_MD_STA_0_RDY),
+			BUS_PROT_WR_IGN(INFRA,
+					MT8189_PROT_EN_MD_STA_0_MFG1_2ND,
+					MT8189_PROT_EN_MD_STA_0_SET,
+					MT8189_PROT_EN_MD_STA_0_CLR,
+					MT8189_PROT_EN_MD_STA_0_RDY),
+			BUS_PROT_WR_IGN(SMI,
+					MT8189_PROT_EN_EMICFG_GALS_SLP_MFG1,
+					MT8189_PROT_EN_EMICFG_GALS_SLP_SET,
+					MT8189_PROT_EN_EMICFG_GALS_SLP_CLR,
+					MT8189_PROT_EN_EMICFG_GALS_SLP_RDY),
+		},
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
+	},
+	[MT8189_POWER_DOMAIN_MFG2] = {
+		.name = "mfg2",
+		.sta_mask = BIT(3),
+		.ctl_offs = 0xebc,
+		.pwr_sta_offs = MT8189_SPM_XPU_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_XPU_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+	},
+	[MT8189_POWER_DOMAIN_MFG3] = {
+		.name = "mfg3",
+		.sta_mask = BIT(4),
+		.ctl_offs = 0xec0,
+		.pwr_sta_offs = MT8189_SPM_XPU_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8189_SPM_XPU_PWR_STATUS_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+	},
+	[MT8189_POWER_DOMAIN_EDP_TX_DORMANT] = {
+		.name = "edp-tx-dormant",
+		.sta_mask = BIT(12),
+		.ctl_offs = 0xf70,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
+		.sram_pdn_bits = BIT(9),
+		.sram_pdn_ack_bits = 0,
+		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_SRAM_PDN_INVERTED,
+	},
+	[MT8189_POWER_DOMAIN_PCIE] = {
+		.name = "pcie",
+		.sta_mask = BIT(13),
+		.ctl_offs = 0xf74,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8189_POWER_DOMAIN_PCIE_PHY] = {
+		.name = "pcie-phy",
+		.sta_mask = BIT(14),
+		.ctl_offs = 0xf78,
+		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
+		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
+	},
+};
+
+static const struct scpsys_soc_data mt8189_scpsys_data = {
+	.domains_data = scpsys_domain_data_mt8189,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8189),
+	.bus_prot_blocks = scpsys_bus_prot_blocks_mt8189,
+	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt8189),
+};
+
+#endif /* __SOC_MEDIATEK_MT8189_PM_DOMAINS_H */
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 222846e52daf..407b4a7aba10 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -26,6 +26,7 @@
 #include "mt8183-pm-domains.h"
 #include "mt8186-pm-domains.h"
 #include "mt8188-pm-domains.h"
+#include "mt8189-pm-domains.h"
 #include "mt8192-pm-domains.h"
 #include "mt8195-pm-domains.h"
 #include "mt8196-pm-domains.h"
@@ -1168,6 +1169,10 @@ static const struct of_device_id scpsys_of_match[] = {
 		.compatible = "mediatek,mt8188-power-controller",
 		.data = &mt8188_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8189-power-controller",
+		.data = &mt8189_scpsys_data,
+	},
 	{
 		.compatible = "mediatek,mt8192-power-controller",
 		.data = &mt8192_scpsys_data,
-- 
2.45.2


