Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B150C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZAiOfc2JOunMCujfZnRnkKwHePXdukW9hmcpoppgHk=; b=t5byQWOLgdP9Qoh3prmedH0du7
	lvJoumOyOrJpJcR6/8KCb+A2jX4kntcj0cEVMKz0PZ1mTQuZXvnySMqRIKzxAfWl3WyZ7MsiJSDn+
	gMxwq78T1fU/SBBAL7l8O2YX9bWNo2iqO60bbLSM93cclYBnbiuQrKEuLro2FFxdNyRWfzEFbpITd
	pt+5SAF78USSrzdiS+S7aaaLZOeEg99DcA7nBWNthZWKOtBc6CvVBp+c4d0UEkIR+2AT2+hZKBWGt
	r9CGlFeH5QSD6+DIn2CZHbfesozHZxaJfYc7kYeEQizEKaEsG59xW/ayFCli3Fushfk4GtRCswPIt
	UDSJ8a3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPWv-0000000D8xC-0hc9;
	Fri, 07 Mar 2025 04:41:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOeB-0000000D28K-0Li1;
	Fri, 07 Mar 2025 03:45:16 +0000
X-UUID: 91dab3bafb0611efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rZAiOfc2JOunMCujfZnRnkKwHePXdukW9hmcpoppgHk=;
	b=X/0CNDC81H1djH6+0jFxgyQBUlbkwhZ19RTBU7l6wz5XcxIxGLTTBt98sylwt06I8esn7VOYqlTLqcvFARCy28AJPDFzOjsQnYMJSeqyUCK4H3yATNDsrf/pVPXLPcER8hBa/TcQSm/npzDi1GRO4rO7SHfsFdtLQfomRKCzy4Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:bad275e5-31e0-43c2-ae66-86ae26d3e71a,IP:0,UR
	L:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:9c0d08c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 91dab3bafb0611efa1e849db4cc18d44-20250306
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1792825745; Thu, 06 Mar 2025 20:45:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:45:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:45:07 +0800
From: Guangjie Song <guangjie.song@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, Guangjie Song <guangjie.song@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 13/13] pmdomain: mediatek: Add MT8196 power domain support
Date: Fri, 7 Mar 2025 11:44:37 +0800
Message-ID: <20250307034454.12243-14-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307034454.12243-1-guangjie.song@mediatek.com>
References: <20250307034454.12243-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_194515_142340_CE7E43E6 
X-CRM114-Status: GOOD (  16.13  )
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

Add power domain support for MT8196.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/pmdomain/mediatek/mt8196-scpsys.h | 114 ++++
 drivers/pmdomain/mediatek/mtk-scpsys.c    | 629 ++++++++++++++++++++++
 2 files changed, 743 insertions(+)
 create mode 100644 drivers/pmdomain/mediatek/mt8196-scpsys.h

diff --git a/drivers/pmdomain/mediatek/mt8196-scpsys.h b/drivers/pmdomain/mediatek/mt8196-scpsys.h
new file mode 100644
index 000000000000..07cb08eaa920
--- /dev/null
+++ b/drivers/pmdomain/mediatek/mt8196-scpsys.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ * Author: Guangjie Song <guangjie.song@mediatek.com>
+ */
+#ifndef __PMDOMAIN_MEDIATEK_MT8196_SCPSYS_H
+#define __PMDOMAIN_MEDIATEK_MT8196_SCPSYS_H
+
+#define MT8196_SPM_CONN_PWR_CON			0xe04
+#define MT8196_SPM_SSUSB_DP_PHY_P0_PWR_CON	0xe18
+#define MT8196_SPM_SSUSB_P0_PWR_CON		0xe1c
+#define MT8196_SPM_SSUSB_P1_PWR_CON		0xe20
+#define MT8196_SPM_SSUSB_P23_PWR_CON		0xe24
+#define MT8196_SPM_SSUSB_PHY_P2_PWR_CON		0xe28
+#define MT8196_SPM_PEXTP_MAC0_PWR_CON		0xe34
+#define MT8196_SPM_PEXTP_MAC1_PWR_CON		0xe38
+#define MT8196_SPM_PEXTP_MAC2_PWR_CON		0xe3c
+#define MT8196_SPM_PEXTP_PHY0_PWR_CON		0xe40
+#define MT8196_SPM_PEXTP_PHY1_PWR_CON		0xe44
+#define MT8196_SPM_PEXTP_PHY2_PWR_CON		0xe48
+#define MT8196_SPM_AUDIO_PWR_CON		0xe4c
+#define MT8196_SPM_ADSP_TOP_PWR_CON		0xe54
+#define MT8196_SPM_ADSP_INFRA_PWR_CON		0xe58
+#define MT8196_SPM_ADSP_AO_PWR_CON		0xe5c
+#define MT8196_SPM_PWR_STATUS			0xf14
+#define MT8196_SPM_PWR_STATUS_2ND		0xf18
+
+#define MT8196_SPM_BUS_PROTECT_EN		0xd8
+#define MT8196_SPM_BUS_PROTECT_EN_SET		0xdc
+#define MT8196_SPM_BUS_PROTECT_EN_CLR		0xe0
+#define MT8196_SPM_BUS_PROTECT_RDY		0x208
+
+#define MT8196_MM_PWR_STATUS			0x100
+#define MT8196_MM_PWR_STATUS_2ND		0x104
+
+#define MT8196_VOTE_MTCMOS_SET0			0x218
+#define MT8196_VOTE_MTCMOS_CLR0			0x21c
+#define MT8196_VOTE_MTCMOS_ENABLE0		0x1410
+#define MT8196_VOTE_MTCMOS_DONE0		0x141c
+#define MT8196_VOTE_MTCMOS_SET_STATUS0		0x146c
+#define MT8196_VOTE_MTCMOS_CLR_STATUS0		0x1470
+
+#define MT8196_MM_VOTE_MTCMOS_SET0		0x218
+#define MT8196_MM_VOTE_MTCMOS_CLR0		0x21c
+#define MT8196_MM_VOTE_MTCMOS_SET1		0x220
+#define MT8196_MM_VOTE_MTCMOS_CLR1		0x224
+#define MT8196_MM_VOTE_MTCMOS_ENABLE0		0x1410
+#define MT8196_MM_VOTE_MTCMOS_DONE0		0x141c
+#define MT8196_MM_VOTE_MTCMOS_ENABLE1		0x1420
+#define MT8196_MM_VOTE_MTCMOS_DONE1		0x142c
+#define MT8196_MM_VOTE_MTCMOS_SET_STATUS0	0x146c
+#define MT8196_MM_VOTE_MTCMOS_CLR_STATUS0	0x1470
+#define MT8196_MM_VOTE_MTCMOS_SET_STATUS1	0x1474
+#define MT8196_MM_VOTE_MTCMOS_CLR_STATUS1	0x1478
+#define MT8196_MM_VOTE_MTCMOS_PM_ACK0		0x5514
+#define MT8196_MM_VOTE_MTCMOS_PM_ACK1		0x5518
+
+#define MT8196_SPM_PROT_EN_BUS_CONN		BIT(1)
+#define MT8196_SPM_PROT_EN_BUS_SSUSB_DP_PHY_P0	BIT(6)
+#define MT8196_SPM_PROT_EN_BUS_SSUSB_P0		BIT(7)
+#define MT8196_SPM_PROT_EN_BUS_SSUSB_P1		BIT(8)
+#define MT8196_SPM_PROT_EN_BUS_SSUSB_P23	BIT(9)
+#define MT8196_SPM_PROT_EN_BUS_SSUSB_PHY_P2	BIT(10)
+#define MT8196_SPM_PROT_EN_BUS_PEXTP_MAC0	BIT(13)
+#define MT8196_SPM_PROT_EN_BUS_PEXTP_MAC1	BIT(14)
+#define MT8196_SPM_PROT_EN_BUS_PEXTP_MAC2	BIT(15)
+#define MT8196_SPM_PROT_EN_BUS_PEXTP_PHY0	BIT(16)
+#define MT8196_SPM_PROT_EN_BUS_PEXTP_PHY1	BIT(17)
+#define MT8196_SPM_PROT_EN_BUS_PEXTP_PHY2	BIT(18)
+#define MT8196_SPM_PROT_EN_BUS_AUDIO		BIT(19)
+#define MT8196_SPM_PROT_EN_BUS_ADSP_TOP		BIT(21)
+#define MT8196_SPM_PROT_EN_BUS_ADSP_INFRA	BIT(22)
+#define MT8196_SPM_PROT_EN_BUS_ADSP_AO		BIT(23)
+
+#define MT8196_VOTE_MM_PROC_SHIFT		0
+#define MT8196_VOTE_SSR_SHIFT			1
+
+#define MT8196_MM_VOTE_VDE0_SHIFT		7
+#define MT8196_MM_VOTE_VDE1_SHIFT		8
+#define MT8196_MM_VOTE_VDE_VCORE0_SHIFT		9
+#define MT8196_MM_VOTE_VEN0_SHIFT		10
+#define MT8196_MM_VOTE_VEN1_SHIFT		11
+#define MT8196_MM_VOTE_VEN2_SHIFT		12
+#define MT8196_MM_VOTE_DISP_VCORE_SHIFT		24
+#define MT8196_MM_VOTE_DIS0_SHIFT		25
+#define MT8196_MM_VOTE_DIS1_SHIFT		26
+#define MT8196_MM_VOTE_OVL0_SHIFT		27
+#define MT8196_MM_VOTE_OVL1_SHIFT		28
+#define MT8196_MM_VOTE_DISP_EDPTX_SHIFT		29
+#define MT8196_MM_VOTE_DISP_DPTX_SHIFT		30
+#define MT8196_MM_VOTE_MML0_SHIFT		31
+#define MT8196_MM_VOTE_MML1_SHIFT		0
+#define MT8196_MM_VOTE_MM_INFRA0_SHIFT		1
+#define MT8196_MM_VOTE_MM_INFRA1_SHIFT		2
+#define MT8196_MM_VOTE_MM_INFRA_AO_SHIFT	3
+#define MT8196_MM_VOTE_CSI_BS_RX_SHIFT		5
+#define MT8196_MM_VOTE_CSI_LS_RX_SHIFT		6
+#define MT8196_MM_VOTE_DSI_PHY0_SHIFT		7
+#define MT8196_MM_VOTE_DSI_PHY1_SHIFT		8
+#define MT8196_MM_VOTE_DSI_PHY2_SHIFT		9
+
+enum {
+	MT8196_SPM_BP_INVALID = 0,
+	MT8196_SPM_BP_SPM,
+	MT8196_SPM_BP_NR
+};
+
+enum {
+	MT8196_MMPC_BP_INVALID = 0,
+	MT8196_MMPC_BP_MMPC,
+	MT8196_MMPC_BP_NR,
+};
+
+#endif /* __PMDOMAIN_MEDIATEK_MT8196_SCPSYS_H */
diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index 7bfe36c1a1ae..667e69ada125 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -20,6 +20,9 @@
 #include <dt-bindings/power/mt7622-power.h>
 #include <dt-bindings/power/mt7623a-power.h>
 #include <dt-bindings/power/mt8173-power.h>
+#include <dt-bindings/power/mt8196-power.h>
+
+#include "mt8196-scpsys.h"
 
 #define MTK_POLL_DELAY_US   10
 #define MTK_POLL_TIMEOUT    USEC_PER_SEC
@@ -137,6 +140,8 @@ enum clk_id {
 	CLK_HIFSEL,
 	CLK_JPGDEC,
 	CLK_AUDIO,
+	CLK_DISP_AO_CONFIG,
+	CLK_DISP_DPC,
 	CLK_MAX,
 };
 
@@ -151,6 +156,8 @@ static const char * const clk_names[] = {
 	"hif_sel",
 	"jpgdec",
 	"audio",
+	"disp_ao_config",
+	"disp_dpc",
 	NULL,
 };
 
@@ -1575,6 +1582,594 @@ static const struct scp_subdomain scp_subdomain_mt8173[] = {
 	{MT8173_POWER_DOMAIN_MFG_2D, MT8173_POWER_DOMAIN_MFG},
 };
 
+/*
+ * MT8196 power domain support
+ */
+static const char *mt8196_spm_bp_list[MT8196_SPM_BP_NR] = {
+	[MT8196_SPM_BP_SPM] = "spm",
+};
+
+static const struct scp_domain_data scp_domain_mt8196_spm_vote_data[] = {
+	[MT8196_POWER_DOMAIN_CONN] = {
+		.name = "conn",
+		.ctl_offs = MT8196_SPM_CONN_PWR_CON,
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_CONN),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_NON_CPU_RTFF | MTK_SCPD_BYPASS_INIT_ON,
+	},
+	[MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0] = {
+		.name = "ssusb-dp-phy-p0",
+		.ctl_offs = MT8196_SPM_SSUSB_DP_PHY_P0_PWR_CON,
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY,
+				     MT8196_SPM_PROT_EN_BUS_SSUSB_DP_PHY_P0),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_NON_CPU_RTFF | MTK_SCPD_ALWAYS_ON,
+	},
+	[MT8196_POWER_DOMAIN_SSUSB_P0] = {
+		.name = "ssusb-p0",
+		.ctl_offs = MT8196_SPM_SSUSB_P0_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_SSUSB_P0),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_NON_CPU_RTFF | MTK_SCPD_ALWAYS_ON,
+	},
+	[MT8196_POWER_DOMAIN_SSUSB_P1] = {
+		.name = "ssusb-p1",
+		.ctl_offs = MT8196_SPM_SSUSB_P1_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_SSUSB_P1),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_NON_CPU_RTFF | MTK_SCPD_ALWAYS_ON,
+	},
+	[MT8196_POWER_DOMAIN_SSUSB_P23] = {
+		.name = "ssusb-p23",
+		.ctl_offs = MT8196_SPM_SSUSB_P23_PWR_CON,
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_SSUSB_P23),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_NON_CPU_RTFF | MTK_SCPD_BYPASS_INIT_ON,
+	},
+	[MT8196_POWER_DOMAIN_SSUSB_PHY_P2] = {
+		.name = "ssusb-phy-p2",
+		.ctl_offs = MT8196_SPM_SSUSB_PHY_P2_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY,
+				     MT8196_SPM_PROT_EN_BUS_SSUSB_PHY_P2),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_NON_CPU_RTFF | MTK_SCPD_BYPASS_INIT_ON,
+	},
+	[MT8196_POWER_DOMAIN_PEXTP_MAC0] = {
+		.name = "pextp-mac0",
+		.ctl_offs = MT8196_SPM_PEXTP_MAC0_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_PEXTP_MAC0),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_PEXTP_PHY_RTFF | MTK_SCPD_RTFF_DELAY,
+	},
+	[MT8196_POWER_DOMAIN_PEXTP_MAC1] = {
+		.name = "pextp-mac1",
+		.ctl_offs = MT8196_SPM_PEXTP_MAC1_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_PEXTP_MAC1),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_PEXTP_PHY_RTFF | MTK_SCPD_RTFF_DELAY,
+	},
+	[MT8196_POWER_DOMAIN_PEXTP_MAC2] = {
+		.name = "pextp-mac2",
+		.ctl_offs = MT8196_SPM_PEXTP_MAC2_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_PEXTP_MAC2),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_PEXTP_PHY_RTFF | MTK_SCPD_RTFF_DELAY,
+	},
+	[MT8196_POWER_DOMAIN_PEXTP_PHY0] = {
+		.name = "pextp-phy0",
+		.ctl_offs = MT8196_SPM_PEXTP_PHY0_PWR_CON,
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_PEXTP_PHY0),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_PEXTP_PHY_RTFF | MTK_SCPD_RTFF_DELAY,
+	},
+	[MT8196_POWER_DOMAIN_PEXTP_PHY1] = {
+		.name = "pextp-phy1",
+		.ctl_offs = MT8196_SPM_PEXTP_PHY1_PWR_CON,
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_PEXTP_PHY1),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_PEXTP_PHY_RTFF | MTK_SCPD_RTFF_DELAY,
+	},
+	[MT8196_POWER_DOMAIN_PEXTP_PHY2] = {
+		.name = "pextp-phy2",
+		.ctl_offs = MT8196_SPM_PEXTP_PHY2_PWR_CON,
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_PEXTP_PHY2),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_PEXTP_PHY_RTFF | MTK_SCPD_RTFF_DELAY,
+	},
+	[MT8196_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
+		.ctl_offs = MT8196_SPM_AUDIO_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_AUDIO),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_NON_CPU_RTFF,
+	},
+	[MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT] = {
+		.name = "adsp-top-dormant",
+		.ctl_offs = MT8196_SPM_ADSP_TOP_PWR_CON,
+		.sram_slp_bits = GENMASK(9, 9),
+		.sram_slp_ack_bits = GENMASK(13, 13),
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_ADSP_TOP),
+		},
+		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_SRAM_SLP | MTK_SCPD_IS_PWR_CON_ON,
+	},
+	[MT8196_POWER_DOMAIN_ADSP_INFRA] = {
+		.name = "adsp-infra",
+		.ctl_offs = MT8196_SPM_ADSP_INFRA_PWR_CON,
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_ADSP_INFRA),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_NON_CPU_RTFF | MTK_SCPD_ALWAYS_ON,
+	},
+	[MT8196_POWER_DOMAIN_ADSP_AO] = {
+		.name = "adsp-ao",
+		.ctl_offs = MT8196_SPM_ADSP_AO_PWR_CON,
+		.bp_table = {
+			BUS_PROT_IGN(MT8196_SPM_BP_SPM, MT8196_SPM_BUS_PROTECT_EN_SET,
+				     MT8196_SPM_BUS_PROTECT_EN_CLR, MT8196_SPM_BUS_PROTECT_EN,
+				     MT8196_SPM_BUS_PROTECT_RDY, MT8196_SPM_PROT_EN_BUS_ADSP_AO),
+		},
+		.caps = MTK_SCPD_IS_PWR_CON_ON | MTK_SCPD_NON_CPU_RTFF | MTK_SCPD_ALWAYS_ON,
+	},
+	[MT8196_POWER_DOMAIN_MM_PROC_DORMANT] = {
+		.name = "mm-proc-dormant",
+		.vote_comp = "vote-regmap",
+		.vote_set_ofs = MT8196_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_VOTE_MTCMOS_ENABLE0,
+		.vote_set_sta_ofs = MT8196_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_shift = MT8196_VOTE_MM_PROC_SHIFT,
+		/* TODO: drop MTK_SCPD_ALWAYS_ON after fixing suspend issue. */
+		.caps = MTK_SCPD_VOTE_OPS |  MTK_SCPD_IRQ_SAFE | MTK_SCPD_ALWAYS_ON,
+	},
+	[MT8196_POWER_DOMAIN_SSR] = {
+		.name = "ssrsys",
+		.vote_comp = "vote-regmap",
+		.vote_set_ofs = MT8196_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_VOTE_MTCMOS_ENABLE0,
+		.vote_set_sta_ofs = MT8196_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_shift = MT8196_VOTE_SSR_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+};
+
+static const struct scp_subdomain scp_subdomain_mt8196_spm[] = {
+	{MT8196_POWER_DOMAIN_SSUSB_P0, MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0},
+	{MT8196_POWER_DOMAIN_SSUSB_P23, MT8196_POWER_DOMAIN_SSUSB_PHY_P2},
+	{MT8196_POWER_DOMAIN_PEXTP_MAC0, MT8196_POWER_DOMAIN_PEXTP_PHY0},
+	{MT8196_POWER_DOMAIN_PEXTP_MAC1, MT8196_POWER_DOMAIN_PEXTP_PHY1},
+	{MT8196_POWER_DOMAIN_PEXTP_MAC2, MT8196_POWER_DOMAIN_PEXTP_PHY2},
+	{MT8196_POWER_DOMAIN_ADSP_INFRA, MT8196_POWER_DOMAIN_AUDIO},
+	{MT8196_POWER_DOMAIN_ADSP_INFRA, MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT},
+	{MT8196_POWER_DOMAIN_ADSP_AO, MT8196_POWER_DOMAIN_ADSP_INFRA},
+};
+
+static struct generic_pm_domain *mt8196_mm_proc_domain;
+
+static int mt8196_spm_post_probe(struct platform_device *pdev, struct scp *scp)
+{
+	mt8196_mm_proc_domain = scp->pd_data.domains[MT8196_POWER_DOMAIN_MM_PROC_DORMANT];
+
+	return 0;
+}
+
+static const char *mt8196_mmpc_bp_list[MT8196_MMPC_BP_NR] = {
+	[MT8196_MMPC_BP_MMPC] = "mmpc",
+};
+
+static const struct scp_domain_data scp_domain_mt8196_mmpc_vote_data[] = {
+	[MT8196_POWER_DOMAIN_VDE0] = {
+		.name = "vde0",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_VDE0_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_VDE1] = {
+		.name = "vde1",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_VDE1_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_VDE_VCORE0] = {
+		.name = "vde-vcore0",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_VDE_VCORE0_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_VEN0] = {
+		.name = "ven0",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_VEN0_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_VEN1] = {
+		.name = "ven1",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_VEN1_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_VEN2] = {
+		.name = "ven2",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_VEN2_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_DISP_VCORE] = {
+		.name = "disp-vcore",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_DISP_VCORE_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_DIS0_DORMANT] = {
+		.name = "dis0-dormant",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_DIS0_SHIFT,
+		.clk_id = {CLK_DISP_AO_CONFIG, CLK_DISP_DPC},
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_DIS1_DORMANT] = {
+		.name = "dis1-dormant",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_DIS1_SHIFT,
+		.clk_id = {CLK_DISP_AO_CONFIG, CLK_DISP_DPC},
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_OVL0_DORMANT] = {
+		.name = "ovl0-dormant",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_OVL0_SHIFT,
+		.clk_id = {CLK_DISP_AO_CONFIG, CLK_DISP_DPC},
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_OVL1_DORMANT] = {
+		.name = "ovl1-dormant",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_OVL1_SHIFT,
+		.clk_id = {CLK_DISP_AO_CONFIG, CLK_DISP_DPC},
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT] = {
+		.name = "disp-edptx-dormant",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_DISP_EDPTX_SHIFT,
+		.clk_id = {CLK_DISP_AO_CONFIG, CLK_DISP_DPC},
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT] = {
+		.name = "disp-dptx-dormant",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_DISP_DPTX_SHIFT,
+		.clk_id = {CLK_DISP_AO_CONFIG, CLK_DISP_DPC},
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_MML0_SHUTDOWN] = {
+		.name = "mml0-shutdown",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET0,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE0,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_CLR0,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS0,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS0,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK0,
+		.vote_shift = MT8196_MM_VOTE_MML0_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_MML1_SHUTDOWN] = {
+		.name = "mml1-shutdown",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET1,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR1,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE1,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_ENABLE1,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS1,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS1,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK1,
+		.vote_shift = MT8196_MM_VOTE_MML0_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_MM_INFRA0] = {
+		.name = "mm-infra0",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET1,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR1,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE1,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_ENABLE1,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS1,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS1,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK1,
+		.vote_shift = MT8196_MM_VOTE_MM_INFRA0_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS |  MTK_SCPD_IRQ_SAFE,
+	},
+	[MT8196_POWER_DOMAIN_MM_INFRA1] = {
+		.name = "mm-infra1",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET1,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR1,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE1,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_ENABLE1,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS1,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS1,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK1,
+		.vote_shift = MT8196_MM_VOTE_MM_INFRA1_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS |  MTK_SCPD_IRQ_SAFE,
+	},
+	[MT8196_POWER_DOMAIN_MM_INFRA_AO] = {
+		.name = "mm-infra-ao",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET1,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR1,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE1,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_ENABLE1,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS1,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS1,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK1,
+		.vote_shift = MT8196_MM_VOTE_MM_INFRA_AO_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS |  MTK_SCPD_IRQ_SAFE,
+	},
+	[MT8196_POWER_DOMAIN_CSI_BS_RX] = {
+		.name = "csi-bs-rx",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET1,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR1,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE1,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_ENABLE1,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS1,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS1,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK1,
+		.vote_shift = MT8196_MM_VOTE_CSI_BS_RX_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_CSI_LS_RX] = {
+		.name = "csi-ls-rx",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET1,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR1,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE1,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_ENABLE1,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS1,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS1,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK1,
+		.vote_shift = MT8196_MM_VOTE_CSI_LS_RX_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_DSI_PHY0] = {
+		.name = "dsi-phy0",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET1,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR1,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE1,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_ENABLE1,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS1,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS1,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK1,
+		.vote_shift = MT8196_MM_VOTE_DSI_PHY0_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_DSI_PHY1] = {
+		.name = "dsi-phy1",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET1,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR1,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE1,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_ENABLE1,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS1,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS1,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK1,
+		.vote_shift = MT8196_MM_VOTE_DSI_PHY1_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+	[MT8196_POWER_DOMAIN_DSI_PHY2] = {
+		.name = "dsi-phy2",
+		.vote_comp = "mm-vote-regmap",
+		.vote_set_ofs = MT8196_MM_VOTE_MTCMOS_SET1,
+		.vote_clr_ofs = MT8196_MM_VOTE_MTCMOS_CLR1,
+		.vote_done_ofs = MT8196_MM_VOTE_MTCMOS_DONE1,
+		.vote_en_ofs = MT8196_MM_VOTE_MTCMOS_ENABLE1,
+		.vote_set_sta_ofs = MT8196_MM_VOTE_MTCMOS_SET_STATUS1,
+		.vote_clr_sta_ofs = MT8196_MM_VOTE_MTCMOS_CLR_STATUS1,
+		.vote_ack_ofs = MT8196_MM_VOTE_MTCMOS_PM_ACK1,
+		.vote_shift = MT8196_MM_VOTE_DSI_PHY2_SHIFT,
+		.caps = MTK_SCPD_VOTE_OPS,
+	},
+};
+
+static const struct scp_subdomain scp_subdomain_mt8196_mmpc[] = {
+	{MT8196_POWER_DOMAIN_VDE_VCORE0, MT8196_POWER_DOMAIN_VDE0},
+	{MT8196_POWER_DOMAIN_VDE_VCORE0, MT8196_POWER_DOMAIN_VDE1},
+	{MT8196_POWER_DOMAIN_VEN0, MT8196_POWER_DOMAIN_VEN1},
+	{MT8196_POWER_DOMAIN_VEN1, MT8196_POWER_DOMAIN_VEN2},
+	{MT8196_POWER_DOMAIN_DISP_VCORE, MT8196_POWER_DOMAIN_DIS0_DORMANT},
+	{MT8196_POWER_DOMAIN_DISP_VCORE, MT8196_POWER_DOMAIN_DIS1_DORMANT},
+	{MT8196_POWER_DOMAIN_DISP_VCORE, MT8196_POWER_DOMAIN_OVL0_DORMANT},
+	{MT8196_POWER_DOMAIN_DISP_VCORE, MT8196_POWER_DOMAIN_OVL1_DORMANT},
+	{MT8196_POWER_DOMAIN_DISP_VCORE, MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT},
+	{MT8196_POWER_DOMAIN_DISP_VCORE, MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT},
+	{MT8196_POWER_DOMAIN_DISP_VCORE, MT8196_POWER_DOMAIN_MML0_SHUTDOWN},
+	{MT8196_POWER_DOMAIN_DISP_VCORE, MT8196_POWER_DOMAIN_MML1_SHUTDOWN},
+	{MT8196_POWER_DOMAIN_MM_INFRA1, MT8196_POWER_DOMAIN_DISP_VCORE},
+	{MT8196_POWER_DOMAIN_MM_INFRA1, MT8196_POWER_DOMAIN_VDE_VCORE0},
+	{MT8196_POWER_DOMAIN_MM_INFRA1, MT8196_POWER_DOMAIN_VEN0},
+	{MT8196_POWER_DOMAIN_MM_INFRA0, MT8196_POWER_DOMAIN_MM_INFRA1},
+	{MT8196_POWER_DOMAIN_MM_INFRA_AO, MT8196_POWER_DOMAIN_MM_INFRA0},
+};
+
+static int mt8196_mmpc_post_probe(struct platform_device *pdev, struct scp *scp)
+{
+	int ret, i;
+	int subdomain[] = {
+		MT8196_POWER_DOMAIN_MM_INFRA_AO,
+		MT8196_POWER_DOMAIN_CSI_BS_RX,
+		MT8196_POWER_DOMAIN_CSI_LS_RX,
+		MT8196_POWER_DOMAIN_DSI_PHY0,
+		MT8196_POWER_DOMAIN_DSI_PHY1,
+		MT8196_POWER_DOMAIN_DSI_PHY2
+	};
+
+	for (i = 0; i < ARRAY_SIZE(subdomain); i++) {
+		ret = pm_genpd_add_subdomain(mt8196_mm_proc_domain, scp->pd_data.domains[subdomain[i]]);
+		if (ret && IS_ENABLED(CONFIG_PM)) {
+			dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static const struct scp_soc_data mt2701_data = {
 	.domains = scp_domain_data_mt2701,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt2701),
@@ -1641,6 +2236,34 @@ static const struct scp_soc_data mt8173_data = {
 	.bus_prot_reg_update = true,
 };
 
+static const struct scp_soc_data mt8196_spm_vote_data = {
+	.domains = scp_domain_mt8196_spm_vote_data,
+	.num_domains = MT8196_SPM_POWER_DOMAIN_NR,
+	.subdomains = scp_subdomain_mt8196_spm,
+	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt8196_spm),
+	.regs = {
+		.pwr_sta_offs = MT8196_SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8196_SPM_PWR_STATUS_2ND,
+	},
+	.bp_list = mt8196_spm_bp_list,
+	.num_bp = MT8196_SPM_BP_NR,
+	.post_probe = mt8196_spm_post_probe,
+};
+
+static const struct scp_soc_data mt8196_mmpc_vote_data = {
+	.domains = scp_domain_mt8196_mmpc_vote_data,
+	.num_domains = MT8196_MMPC_POWER_DOMAIN_NR,
+	.subdomains = scp_subdomain_mt8196_mmpc,
+	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt8196_mmpc),
+	.regs = {
+		.pwr_sta_offs = MT8196_MM_PWR_STATUS,
+		.pwr_sta2nd_offs = MT8196_MM_PWR_STATUS_2ND,
+	},
+	.bp_list = mt8196_mmpc_bp_list,
+	.num_bp = MT8196_MMPC_BP_NR,
+	.post_probe = mt8196_mmpc_post_probe,
+};
+
 /*
  * scpsys driver init
  */
@@ -1664,6 +2287,12 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt8173-scpsys",
 		.data = &mt8173_data,
+	}, {
+		.compatible = "mediatek,mt8196-scpsys",
+		.data = &mt8196_spm_vote_data,
+	}, {
+		.compatible = "mediatek,mt8196-hfrpsys",
+		.data = &mt8196_mmpc_vote_data,
 	}, {
 		/* sentinel */
 	}
-- 
2.45.2


