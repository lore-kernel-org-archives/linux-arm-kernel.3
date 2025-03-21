Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEC7C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vi2vNWjuYRfF1e/p/+MxGIJNckIJ26owXRiC37d32Z0=; b=Tlqou9V0oenAEHcb5MFu++FsMY
	j2re5gKA8fxo6jlqaqUSfMgjaKZxYHzctcYfHMH+ZtkRWE3iKUO5KTtoJE3fluEfs3+RNFJPj7aYh
	SYsGmiDGwH9QZe60bRfEMcFC21h7p12AwUQcxmFWgTEi3hydUfID9xHfeYYyeL66+CiTuIHwKUF3s
	G3KXHBHJNomowwDQK0Aeuzhyk97odRV2qvVGPScP0sgC4nctCwbuprANR5SdJRkxYtqjU5Ua1LE9s
	B5FUjG1TtWcl8aYsi3Gc7EhWY3/2iudtYLZlcvc9pIAeteSCM4hvg9vaIwrDYH0c4bC11pZj3qdkT
	Jg5dkkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZE1-0000000ETCW-1eYM;
	Fri, 21 Mar 2025 10:03:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYmy-0000000ENkD-1qbR;
	Fri, 21 Mar 2025 09:35:41 +0000
X-UUID: d7da10e0063711f0a1e849db4cc18d44-20250321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vi2vNWjuYRfF1e/p/+MxGIJNckIJ26owXRiC37d32Z0=;
	b=KaCRxaUVCpWGxh0nY9NHHSa5wtYmYE/UQG85P2zQ47yG50UnDNXgBQxo2X2Zww/nSDmLwhD1swKqpkNq6XXbTMWt1W7Si/syP1A7JMDpE7T29bBoIL1AkHA9USTYs4ReaUgv2WY2GBSA95rhn4pLSaa6J0Byy6kUegqn5h9Vkd0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ec6c012f-01fc-4808-8df6-364eb0658515,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:1813aa8c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d7da10e0063711f0a1e849db4cc18d44-20250321
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 223260371; Fri, 21 Mar 2025 02:35:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 21 Mar 2025 17:35:33 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 21 Mar 2025 17:35:33 +0800
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
Subject: [PATCH v2 08/15] soc: mediatek: mutex: add mutex support for MT8196
Date: Fri, 21 Mar 2025 17:33:37 +0800
Message-ID: <20250321093435.94835-9-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_023540_501010_C30FC3DF 
X-CRM114-Status: GOOD (  17.68  )
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

From: Nancy Lin <nancy.lin@mediatek.com>

Add mutex support for the main and external displays in MT8196:
- Introduce a new DVO0 output component for the new mutex
  settings of MT8196.
- Add a need_sof_mof flag to configure both SOF and MOD settings
  for the output component.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 140 ++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index c026ac0e6969..f51d1cb5ad1e 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -19,6 +19,7 @@
 #define MT2701_MUTEX0_SOF0			0x30
 #define MT8183_MUTEX0_MOD0			0x30
 #define MT8183_MUTEX0_SOF0			0x2c
+#define MT8196_MUTEX0_MOD0			0x34
 
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
@@ -237,6 +238,47 @@
 #define MT8195_MUTEX_MOD_MDP_WROT2             32
 #define MT8195_MUTEX_MOD_MDP_WROT3             33
 
+/* OVLSYS */
+#define MT8196_MUTEX_MOD0_OVL_EXDMA2		2
+#define MT8196_MUTEX_MOD0_OVL_EXDMA3		3
+#define MT8196_MUTEX_MOD0_OVL_EXDMA4		4
+#define MT8196_MUTEX_MOD0_OVL_EXDMA5		5
+#define MT8196_MUTEX_MOD0_OVL_EXDMA6		6
+#define MT8196_MUTEX_MOD0_OVL_EXDMA7		7
+#define MT8196_MUTEX_MOD0_OVL_EXDMA8		8
+#define MT8196_MUTEX_MOD0_OVL_EXDMA9		9
+#define MT8196_MUTEX_MOD0_OVL_BLENDER1		11
+#define MT8196_MUTEX_MOD0_OVL_BLENDER2		12
+#define MT8196_MUTEX_MOD0_OVL_BLENDER3		13
+#define MT8196_MUTEX_MOD0_OVL_BLENDER4		14
+#define MT8196_MUTEX_MOD0_OVL_BLENDER5		15
+#define MT8196_MUTEX_MOD0_OVL_BLENDER6		16
+#define MT8196_MUTEX_MOD0_OVL_BLENDER7		17
+#define MT8196_MUTEX_MOD0_OVL_BLENDER8		18
+#define MT8196_MUTEX_MOD0_OVL_BLENDER9		19
+#define MT8196_MUTEX_MOD0_OVL_OUTPROC0		20
+#define MT8196_MUTEX_MOD0_OVL_OUTPROC1		21
+#define MT8196_MUTEX_MOD0_OVL_OUTPROC2		22
+#define MT8196_MUTEX_MOD1_OVL_DLO_ASYNC5	(32 + 16)
+#define MT8196_MUTEX_MOD1_OVL_DLO_ASYNC6	(32 + 17)
+
+/* DISP0 */
+#define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC0	16
+#define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC1	17
+#define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC8	24
+#define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC1	(32 + 1)
+#define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC2	(32 + 2)
+#define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC3	(32 + 3)
+
+/* DISP1 */
+#define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC21	1
+#define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC22	2
+#define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC23	3
+#define MT8196_MUTEX_MOD0_DISP1_DP_INTF0	13
+#define MT8196_MUTEX_MOD0_DISP1_DP_INTF1	14
+#define MT8196_MUTEX_MOD0_DISP1_DSI0		23
+#define MT8196_MUTEX_MOD0_DISP1_DVO		29
+
 #define MT8365_MUTEX_MOD_DISP_OVL0		7
 #define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
 #define MT8365_MUTEX_MOD_DISP_RDMA0		9
@@ -297,6 +339,12 @@
 #define MT8195_MUTEX_SOF_DP_INTF1		4
 #define MT8195_MUTEX_SOF_DPI0			6 /* for HDMI_TX */
 #define MT8195_MUTEX_SOF_DPI1			5 /* for digital video out */
+#define MT8196_MUTEX_SOF_DSI0			1
+#define MT8196_MUTEX_SOF_DSI1			2
+#define MT8196_MUTEX_SOF_DSI2			4
+#define MT8196_MUTEX_SOF_DPI0			5
+#define MT8196_MUTEX_SOF_DPI1			6
+#define MT8196_MUTEX_SOF_DVO0			7
 
 #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
@@ -310,6 +358,12 @@
 #define MT8195_MUTEX_EOF_DP_INTF1		(MT8195_MUTEX_SOF_DP_INTF1 << 7)
 #define MT8195_MUTEX_EOF_DPI0			(MT8195_MUTEX_SOF_DPI0 << 7)
 #define MT8195_MUTEX_EOF_DPI1			(MT8195_MUTEX_SOF_DPI1 << 7)
+#define MT8196_MUTEX_EOF_DSI0			(MT8196_MUTEX_SOF_DSI0 << 7)
+#define MT8196_MUTEX_EOF_DSI1			(MT8196_MUTEX_SOF_DSI1 << 7)
+#define MT8196_MUTEX_EOF_DSI2			(MT8196_MUTEX_SOF_DSI2 << 7)
+#define MT8196_MUTEX_EOF_DPI0			(MT8196_MUTEX_SOF_DPI0 << 7)
+#define MT8196_MUTEX_EOF_DPI1			(MT8196_MUTEX_SOF_DPI1 << 7)
+#define MT8196_MUTEX_EOF_DVO0			(MT8196_MUTEX_SOF_DVO0 << 7)
 
 struct mtk_mutex {
 	u8 id;
@@ -326,6 +380,7 @@ enum mtk_mutex_sof_id {
 	MUTEX_SOF_DSI3,
 	MUTEX_SOF_DP_INTF0,
 	MUTEX_SOF_DP_INTF1,
+	MUTEX_SOF_DVO0,
 	DDP_MUTEX_SOF_MAX,
 };
 
@@ -336,6 +391,7 @@ struct mtk_mutex_data {
 	const u16 mutex_mod_reg;
 	const u16 mutex_sof_reg;
 	const bool no_clk;
+	const bool need_sof_mod;
 };
 
 struct mtk_mutex_ctx {
@@ -625,6 +681,64 @@ static const u8 mt8195_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
 	[MUTEX_MOD_IDX_MDP_WROT3] = MT8195_MUTEX_MOD_MDP_WROT3,
 };
 
+static const u8 mt8196_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_OVL0_EXDMA2] = MT8196_MUTEX_MOD0_OVL_EXDMA2,
+	[DDP_COMPONENT_OVL0_EXDMA3] = MT8196_MUTEX_MOD0_OVL_EXDMA3,
+	[DDP_COMPONENT_OVL0_EXDMA4] = MT8196_MUTEX_MOD0_OVL_EXDMA4,
+	[DDP_COMPONENT_OVL0_EXDMA5] = MT8196_MUTEX_MOD0_OVL_EXDMA5,
+	[DDP_COMPONENT_OVL0_EXDMA6] = MT8196_MUTEX_MOD0_OVL_EXDMA6,
+	[DDP_COMPONENT_OVL0_EXDMA7] = MT8196_MUTEX_MOD0_OVL_EXDMA7,
+	[DDP_COMPONENT_OVL0_EXDMA8] = MT8196_MUTEX_MOD0_OVL_EXDMA8,
+	[DDP_COMPONENT_OVL0_EXDMA9] = MT8196_MUTEX_MOD0_OVL_EXDMA9,
+	[DDP_COMPONENT_OVL0_BLENDER1] = MT8196_MUTEX_MOD0_OVL_BLENDER1,
+	[DDP_COMPONENT_OVL0_BLENDER2] = MT8196_MUTEX_MOD0_OVL_BLENDER2,
+	[DDP_COMPONENT_OVL0_BLENDER3] = MT8196_MUTEX_MOD0_OVL_BLENDER3,
+	[DDP_COMPONENT_OVL0_BLENDER4] = MT8196_MUTEX_MOD0_OVL_BLENDER4,
+	[DDP_COMPONENT_OVL0_BLENDER5] = MT8196_MUTEX_MOD0_OVL_BLENDER5,
+	[DDP_COMPONENT_OVL0_BLENDER6] = MT8196_MUTEX_MOD0_OVL_BLENDER6,
+	[DDP_COMPONENT_OVL0_BLENDER7] = MT8196_MUTEX_MOD0_OVL_BLENDER7,
+	[DDP_COMPONENT_OVL0_BLENDER8] = MT8196_MUTEX_MOD0_OVL_BLENDER8,
+	[DDP_COMPONENT_OVL0_BLENDER9] = MT8196_MUTEX_MOD0_OVL_BLENDER9,
+	[DDP_COMPONENT_OVL0_OUTPROC0] = MT8196_MUTEX_MOD0_OVL_OUTPROC0,
+	[DDP_COMPONENT_OVL0_OUTPROC1] = MT8196_MUTEX_MOD0_OVL_OUTPROC1,
+	[DDP_COMPONENT_OVL0_DLO_ASYNC5] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC5,
+	[DDP_COMPONENT_OVL0_DLO_ASYNC6] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC6,
+	[DDP_COMPONENT_OVL1_EXDMA2] = MT8196_MUTEX_MOD0_OVL_EXDMA2,
+	[DDP_COMPONENT_OVL1_EXDMA3] = MT8196_MUTEX_MOD0_OVL_EXDMA3,
+	[DDP_COMPONENT_OVL1_EXDMA4] = MT8196_MUTEX_MOD0_OVL_EXDMA4,
+	[DDP_COMPONENT_OVL1_EXDMA5] = MT8196_MUTEX_MOD0_OVL_EXDMA5,
+	[DDP_COMPONENT_OVL1_EXDMA6] = MT8196_MUTEX_MOD0_OVL_EXDMA6,
+	[DDP_COMPONENT_OVL1_EXDMA7] = MT8196_MUTEX_MOD0_OVL_EXDMA7,
+	[DDP_COMPONENT_OVL1_EXDMA8] = MT8196_MUTEX_MOD0_OVL_EXDMA8,
+	[DDP_COMPONENT_OVL1_EXDMA9] = MT8196_MUTEX_MOD0_OVL_EXDMA9,
+	[DDP_COMPONENT_OVL1_BLENDER1] = MT8196_MUTEX_MOD0_OVL_BLENDER1,
+	[DDP_COMPONENT_OVL1_BLENDER2] = MT8196_MUTEX_MOD0_OVL_BLENDER2,
+	[DDP_COMPONENT_OVL1_BLENDER3] = MT8196_MUTEX_MOD0_OVL_BLENDER3,
+	[DDP_COMPONENT_OVL1_BLENDER4] = MT8196_MUTEX_MOD0_OVL_BLENDER4,
+	[DDP_COMPONENT_OVL1_BLENDER5] = MT8196_MUTEX_MOD0_OVL_BLENDER5,
+	[DDP_COMPONENT_OVL1_BLENDER6] = MT8196_MUTEX_MOD0_OVL_BLENDER6,
+	[DDP_COMPONENT_OVL1_BLENDER7] = MT8196_MUTEX_MOD0_OVL_BLENDER7,
+	[DDP_COMPONENT_OVL1_BLENDER8] = MT8196_MUTEX_MOD0_OVL_BLENDER8,
+	[DDP_COMPONENT_OVL1_BLENDER9] = MT8196_MUTEX_MOD0_OVL_BLENDER9,
+	[DDP_COMPONENT_OVL1_OUTPROC0] = MT8196_MUTEX_MOD0_OVL_OUTPROC0,
+	[DDP_COMPONENT_OVL1_OUTPROC1] = MT8196_MUTEX_MOD0_OVL_OUTPROC1,
+	[DDP_COMPONENT_OVL1_DLO_ASYNC5] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC5,
+	[DDP_COMPONENT_OVL1_DLO_ASYNC6] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC6,
+	[DDP_COMPONENT_DLI_ASYNC0] = MT8196_MUTEX_MOD0_DISP_DLI_ASYNC0,
+	[DDP_COMPONENT_DLI_ASYNC1] = MT8196_MUTEX_MOD0_DISP_DLI_ASYNC1,
+	[DDP_COMPONENT_DLI_ASYNC8] = MT8196_MUTEX_MOD0_DISP_DLI_ASYNC8,
+	[DDP_COMPONENT_DLO_ASYNC1] = MT8196_MUTEX_MOD1_DISP_DLO_ASYNC1,
+	[DDP_COMPONENT_DLO_ASYNC2] = MT8196_MUTEX_MOD1_DISP_DLO_ASYNC2,
+	[DDP_COMPONENT_DLO_ASYNC3] = MT8196_MUTEX_MOD1_DISP_DLO_ASYNC3,
+	[DDP_COMPONENT_DLI_ASYNC21] = MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC21,
+	[DDP_COMPONENT_DLI_ASYNC22] = MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC22,
+	[DDP_COMPONENT_DLI_ASYNC23] = MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC23,
+	[DDP_COMPONENT_DVO0] = MT8196_MUTEX_MOD0_DISP1_DVO,
+	[DDP_COMPONENT_DP_INTF0] = MT8196_MUTEX_MOD0_DISP1_DP_INTF0,
+	[DDP_COMPONENT_DP_INTF1] = MT8196_MUTEX_MOD0_DISP1_DP_INTF1,
+	[DDP_COMPONENT_DSI0] = MT8196_MUTEX_MOD0_DISP1_DSI0,
+};
+
 static const u8 mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
@@ -710,6 +824,17 @@ static const u16 mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
 };
 
+static const u16 mt8196_mutex_sof[DDP_MUTEX_SOF_MAX] = {
+	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[MUTEX_SOF_DSI0] = MT8196_MUTEX_SOF_DSI0 | MT8196_MUTEX_EOF_DSI0,
+	[MUTEX_SOF_DSI1] = MT8196_MUTEX_SOF_DSI1 | MT8196_MUTEX_EOF_DSI1,
+	[MUTEX_SOF_DP_INTF0] =
+		MT8196_MUTEX_SOF_DPI0 | MT8196_MUTEX_EOF_DPI0,
+	[MUTEX_SOF_DP_INTF1] =
+		MT8196_MUTEX_SOF_DPI1 | MT8196_MUTEX_EOF_DPI1,
+	[MUTEX_SOF_DVO0] = MT8196_MUTEX_SOF_DVO0 | MT8196_MUTEX_EOF_DVO0,
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -803,6 +928,14 @@ static const struct mtk_mutex_data mt8195_vpp_mutex_driver_data = {
 	.mutex_table_mod = mt8195_mutex_table_mod,
 };
 
+static const struct mtk_mutex_data mt8196_mutex_driver_data = {
+	.mutex_mod = mt8196_mutex_mod,
+	.mutex_sof = mt8196_mutex_sof,
+	.mutex_mod_reg = MT8196_MUTEX0_MOD0,
+	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
+	.need_sof_mod = true,
+};
+
 static const struct mtk_mutex_data mt8365_mutex_driver_data = {
 	.mutex_mod = mt8365_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
@@ -872,6 +1005,8 @@ static int mtk_mutex_get_output_comp_sof(enum mtk_ddp_comp_id id)
 		return MUTEX_SOF_DP_INTF0;
 	case DDP_COMPONENT_DP_INTF1:
 		return MUTEX_SOF_DP_INTF1;
+	case DDP_COMPONENT_DVO0:
+		return MUTEX_SOF_DVO0;
 	default:
 		break;
 	}
@@ -930,7 +1065,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	if (!is_output_comp) {
+	if (!is_output_comp || mtx->data->need_sof_mod) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -961,7 +1096,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	if (!is_output_comp) {
+	if (!is_output_comp || mtx->data->need_sof_mod) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -1169,6 +1304,7 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt8192-disp-mutex", .data = &mt8192_mutex_driver_data },
 	{ .compatible = "mediatek,mt8195-disp-mutex", .data = &mt8195_mutex_driver_data },
 	{ .compatible = "mediatek,mt8195-vpp-mutex",  .data = &mt8195_vpp_mutex_driver_data },
+	{ .compatible = "mediatek,mt8196-disp-mutex", .data = &mt8196_mutex_driver_data },
 	{ .compatible = "mediatek,mt8365-disp-mutex", .data = &mt8365_mutex_driver_data },
 	{ /* sentinel */ },
 };
-- 
2.45.2


