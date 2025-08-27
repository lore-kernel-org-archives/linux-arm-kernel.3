Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A18CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrA3luYhH+iNo5cADqIaqx3+EWgohzWPIamCNjQp0DE=; b=xzvGETuLOdCrCtZ1E7xc032tUM
	Qcs9MRZQ3Gc9sN1AHFU/cyI8AsdmfBfvkO9v0wMWvBIr8ypDUZr7dJq7bUAnY/SjRglnisculeCA0
	thgtS5g9MPkA/KOCHwJU/hrBqoRHwAix0r9WpYGB0dbYPk+1Mq4bqua37X/Hoog79B2jlzTbXbNWi
	g9qaFbrbImIXewdIcN/2oAnGw+Ts+Fjt32gHpgsL+QdNuWhvWCe3evVLOI9PgGBW7kHBO7R0Aslav
	WhPdzye888xGRYPKuZTQrMoVTvClefolUFWNccCKOjwn/7vv7jCR94Iv/GJz1iFqmjciEooYoeAku
	XsPsRSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOx-0000000Fymr-0ZXe;
	Wed, 27 Aug 2025 15:49:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEVl-0000000FInY-3yer;
	Wed, 27 Aug 2025 11:40:20 +0000
X-UUID: 98272782833a11f09f706fa2197c6ceb-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RrA3luYhH+iNo5cADqIaqx3+EWgohzWPIamCNjQp0DE=;
	b=VXhp37CC8C4+wT9DuuezSxarfrZDShlzJb3389POHh8wFzMEat4zTYPhipmVTYW9NJRHfcpg7Z+ke4EA52aS7EPnN5agyqMnvqfM6kV8CmR+QhTQd8iSR/a9JCv1+szNjfb6tk0bGh46jPu26vG5Aulyj9N1SoPHkdN2hTywNFA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:6c82277b-6bb3-40a2-9fe6-f4219e1d3c24,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:2c2fab6d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 98272782833a11f09f706fa2197c6ceb-20250827
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1282394072; Wed, 27 Aug 2025 04:40:13 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 19:40:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 19:40:08 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v7 07/20] mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
Date: Wed, 27 Aug 2025 19:37:39 +0800
Message-ID: <20250827114006.3310175-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_044018_030382_8DFD5931 
X-CRM114-Status: GOOD (  19.29  )
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

The GCE in MT8196 is placed in MMINFRA and requires all addresses
in GCE instructions for DRAM transactions to be IOVA.

Due to MMIO, if the GCE needs to access a hardware register at
0x1000_0000, but the SMMU is also mapping a DRAM block at 0x1000_0000,
the MMINFRA will not know whether to write to the hardware register or
the DRAM.
To solve this, MMINFRA treats addresses greater than 2G as data paths
and those less than 2G as config paths because the DRAM start address
is currently at 2G (0x8000_0000). On the data path, MMINFRA remaps
DRAM addresses by subtracting 2G, allowing SMMU to map DRAM addresses
less than 2G.
For example, if the DRAM start address 0x8000_0000 is mapped to
IOVA=0x0, when GCE accesses IOVA=0x0, it must add a 2G offset to
the address in the GCE instruction. MMINFRA will then see it as a
data path (IOVA >= 2G) and subtract 2G, allowing GCE to access IOVA=0x0.

Since the MMINFRA remap subtracting 2G is done in hardware and cannot
be configured by software, the address of DRAM in GCE instruction must
always add 2G to ensure proper access. After that, the shift functions
do more than just shift addresses, so the APIs were renamed to
cmdq_convert_gce_addr() and cmdq_revert_gce_addr().

This 2G adjustment is referred to as mminfra_offset in the CMDQ driver.
CMDQ helper can get the mminfra_offset from the cmdq_mbox_priv of
cmdq_pkt and add the mminfra_offset to the DRAM address in GCE
instructions.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 22 ++++++++++++----------
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index a9e8895d14df..373effbcfa40 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -94,20 +94,21 @@ struct cmdq {
 struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
+	dma_addr_t mminfra_offset;
 	bool control_by_sw;
 	bool sw_ddr_en;
 	bool gce_vm;
 	u32 gce_num;
 };
 
-static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const struct gce_plat *pdata)
+static inline u32 cmdq_convert_gce_addr(dma_addr_t addr, const struct gce_plat *pdata)
 {
-	return (addr >> pdata->shift);
+	return ((addr + pdata->mminfra_offset) >> pdata->shift);
 }
 
-static inline dma_addr_t cmdq_reg_revert_addr(u32 addr, const struct gce_plat *pdata)
+static inline dma_addr_t cmdq_revert_gce_addr(u32 addr, const struct gce_plat *pdata)
 {
-	return ((dma_addr_t)addr << pdata->shift);
+	return (((dma_addr_t)addr << pdata->shift) - pdata->mminfra_offset);
 }
 
 void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
@@ -115,6 +116,7 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
 
 	priv->shift_pa = cmdq->pdata->shift;
+	priv->mminfra_offset = cmdq->pdata->mminfra_offset;
 }
 EXPORT_SYMBOL(cmdq_get_mbox_priv);
 
@@ -254,7 +256,7 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
 	struct cmdq_task *prev_task = list_last_entry(
 			&thread->task_busy_list, typeof(*task), list_entry);
 	u64 *prev_task_base = prev_task->pkt->va_base;
-	u32 shift_addr = cmdq_reg_shift_addr(task->pa_base, task->cmdq->pdata);
+	u32 shift_addr = cmdq_convert_gce_addr(task->pa_base, task->cmdq->pdata);
 
 	/* let previous task jump to this task */
 	dma_sync_single_for_cpu(dev, prev_task->pa_base,
@@ -326,7 +328,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 		return;
 
 	shift_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
-	curr_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
+	curr_pa = cmdq_revert_gce_addr(shift_addr, cmdq->pdata);
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
@@ -477,9 +479,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		 */
 		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
 
-		shift_addr = cmdq_reg_shift_addr(task->pa_base, cmdq->pdata);
+		shift_addr = cmdq_convert_gce_addr(task->pa_base, cmdq->pdata);
 		writel(shift_addr, thread->base + CMDQ_THR_CURR_ADDR);
-		shift_addr = cmdq_reg_shift_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata);
+		shift_addr = cmdq_convert_gce_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata);
 		writel(shift_addr, thread->base + CMDQ_THR_END_ADDR);
 
 		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
@@ -488,9 +490,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	} else {
 		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
 		shift_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
-		curr_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
+		curr_pa = cmdq_revert_gce_addr(shift_addr, cmdq->pdata);
 		shift_addr = readl(thread->base + CMDQ_THR_END_ADDR);
-		end_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
+		end_pa = cmdq_revert_gce_addr(shift_addr, cmdq->pdata);
 		/* check boundary */
 		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
 		    curr_pa == end_pa) {
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 73b70be4a8a7..07c1bfbdb8c4 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -72,6 +72,7 @@ struct cmdq_cb_data {
 
 struct cmdq_mbox_priv {
 	u8 shift_pa;
+	dma_addr_t mminfra_offset;
 };
 
 struct cmdq_pkt {
-- 
2.43.0


