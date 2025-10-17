Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90485CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjtTsBhlL1a14AmF8ayll54zuSMx8Y+7Dd32KSfIiVU=; b=kuZvF3KzOF4yAoqFK5cA2jWbeM
	qRCNkqxtv3QfGm31keMNJ/e+U3bb3XavWZtLgsIgck9byJRCo4PuB+HN+l6yYlhpaLUHXOoheOUp/
	v9Tt4xWeehxDojmbU3uOzRgOoeJRlkyOFyQJJ6xOb0WEvATSDhM2+gTeZCo5WxetjHxP0V+qKqPEx
	T9KNFKEYK0jOtcmEb0jBg5LWXyfdyIDNKrVgShsM55bmYOjUEcOqe84ogzndJ3JGV4YNQ0jlRqsYI
	NzGW+yFYNgYycSz9Br5qVvgL/1Z67rFimLUv/7TGUXdkcgFgqQrTsb0JQjHEXdFDP/P9WJEphLZRF
	ecHHpsbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIc-00000006qSF-3ogx;
	Fri, 17 Oct 2025 06:50:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIS-00000006qAe-0HoT;
	Fri, 17 Oct 2025 06:50:42 +0000
X-UUID: 94543de4ab2511f0a52f393f94899d25-20251016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xjtTsBhlL1a14AmF8ayll54zuSMx8Y+7Dd32KSfIiVU=;
	b=HUlrzaeEA09vuFDuIlzyaIwouH0+s6v7XQbkHs3qlFRPk4u4DkdJ7YRXfls4M20jQYVXf6c+AZN23eC736GuPxsQ/0kKuDUjBxQP6I7a7RGLZj0Ko4R1OT5F0FoHjrbvC+aj/e1QG8Dyxyxw2KpjFGQNiqpP5GhNWQoKo4sxC4k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:376a660e-aeca-4d7e-bba8-57bb97477e08,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1b3b2951-c509-4cf3-8dc0-fcdaad49a6d3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 94543de4ab2511f0a52f393f94899d25-20251016
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 589129908; Thu, 16 Oct 2025 23:50:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 17 Oct 2025 14:50:29 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 17 Oct 2025 14:50:29 +0800
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
Subject: [PATCH v8 02/20] mailbox: mtk-cmdq: Refine DMA address handling for the command buffer
Date: Fri, 17 Oct 2025 14:44:27 +0800
Message-ID: <20251017065028.1676930-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_235040_125224_D22611BA 
X-CRM114-Status: GOOD (  20.75  )
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

GCE can only fetch the command buffer address from a 32-bit register.
Some SoCs support a 35-bit command buffer address for GCE, which
requires a right shift of 3 bits before setting the address into
the 32-bit register. A comment has been added to the header of
cmdq_get_shift_pa() to explain this requirement.

To prevent the GCE command buffer address from being DMA mapped beyond
its supported bit range, the DMA bit mask for the device is set during
initialization.

Additionally, to ensure the correct shift is applied when setting or
reading the register that stores the GCE command buffer address,
new APIs, cmdq_convert_gce_addr() and cmdq_revert_gce_addr(), have
been introduced for consistent operations on this register.

The variable type for the command buffer address has been standardized
to dma_addr_t to prevent handling issues caused by type mismatches.

Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 45 ++++++++++++++++--------
 include/linux/mailbox/mtk-cmdq-mailbox.h | 10 ++++++
 2 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 654a60f63756..5791f80f995a 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -92,6 +92,18 @@ struct gce_plat {
 	u32 gce_num;
 };
 
+static inline u32 cmdq_convert_gce_addr(dma_addr_t addr, const struct gce_plat *pdata)
+{
+	/* Convert DMA addr (PA or IOVA) to GCE readable addr */
+	return addr >> pdata->shift;
+}
+
+static inline dma_addr_t cmdq_revert_gce_addr(u32 addr, const struct gce_plat *pdata)
+{
+	/* Revert GCE readable addr to DMA addr (PA or IOVA) */
+	return (dma_addr_t)addr << pdata->shift;
+}
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
@@ -188,13 +200,12 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
 	struct cmdq_task *prev_task = list_last_entry(
 			&thread->task_busy_list, typeof(*task), list_entry);
 	u64 *prev_task_base = prev_task->pkt->va_base;
+	u32 gce_addr = cmdq_convert_gce_addr(task->pa_base, task->cmdq->pdata);
 
 	/* let previous task jump to this task */
 	dma_sync_single_for_cpu(dev, prev_task->pa_base,
 				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
-	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
-		(u64)CMDQ_JUMP_BY_PA << 32 |
-		(task->pa_base >> task->cmdq->pdata->shift);
+	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] = (u64)CMDQ_JUMP_BY_PA << 32 | gce_addr;
 	dma_sync_single_for_device(dev, prev_task->pa_base,
 				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
 
@@ -237,7 +248,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 				    struct cmdq_thread *thread)
 {
 	struct cmdq_task *task, *tmp, *curr_task = NULL;
-	u32 curr_pa, irq_flag, task_end_pa;
+	u32 irq_flag, gce_addr;
+	dma_addr_t curr_pa, task_end_pa;
 	bool err;
 
 	irq_flag = readl(thread->base + CMDQ_THR_IRQ_STATUS);
@@ -259,7 +271,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 	else
 		return;
 
-	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->pdata->shift;
+	gce_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
+	curr_pa = cmdq_revert_gce_addr(gce_addr, cmdq->pdata);
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
@@ -378,7 +391,8 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
 	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
 	struct cmdq_task *task;
-	unsigned long curr_pa, end_pa;
+	u32 gce_addr;
+	dma_addr_t curr_pa, end_pa;
 
 	/* Client should not flush new tasks if suspended. */
 	WARN_ON(cmdq->suspended);
@@ -402,20 +416,20 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		 */
 		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
 
-		writel(task->pa_base >> cmdq->pdata->shift,
-		       thread->base + CMDQ_THR_CURR_ADDR);
-		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata->shift,
-		       thread->base + CMDQ_THR_END_ADDR);
+		gce_addr = cmdq_convert_gce_addr(task->pa_base, cmdq->pdata);
+		writel(gce_addr, thread->base + CMDQ_THR_CURR_ADDR);
+		gce_addr = cmdq_convert_gce_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata);
+		writel(gce_addr, thread->base + CMDQ_THR_END_ADDR);
 
 		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
 		writel(CMDQ_THR_IRQ_EN, thread->base + CMDQ_THR_IRQ_ENABLE);
 		writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_TASK);
 	} else {
 		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
-		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) <<
-			cmdq->pdata->shift;
-		end_pa = readl(thread->base + CMDQ_THR_END_ADDR) <<
-			cmdq->pdata->shift;
+		gce_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
+		curr_pa = cmdq_revert_gce_addr(gce_addr, cmdq->pdata);
+		gce_addr = readl(thread->base + CMDQ_THR_END_ADDR);
+		end_pa = cmdq_revert_gce_addr(gce_addr, cmdq->pdata);
 		/* check boundary */
 		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
 		    curr_pa == end_pa) {
@@ -646,6 +660,9 @@ static int cmdq_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	dma_set_coherent_mask(dev,
+			      DMA_BIT_MASK(sizeof(u32) * BITS_PER_BYTE + cmdq->pdata->shift));
+
 	cmdq->mbox.dev = dev;
 	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->pdata->thread_nr,
 					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 4c1a91b07de3..e1555e06e7e5 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -77,6 +77,16 @@ struct cmdq_pkt {
 	size_t			buf_size; /* real buffer size */
 };
 
+/**
+ * cmdq_get_shift_pa() - get the shift bits of physical address
+ * @chan: mailbox channel
+ *
+ * GCE can only fetch the command buffer address from a 32-bit register.
+ * Some SOCs support more than 32-bit command buffer address for GCE, which
+ * requires some shift bits to make the address fit into the 32-bit register.
+ *
+ * Return: the shift bits of physical address
+ */
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
 
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.43.0


