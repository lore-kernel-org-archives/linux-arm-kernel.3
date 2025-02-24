Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E88C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 05:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BDIl4d2oYLCth691SnpOglTDGFjNLfuXxv8ji8Rlnto=; b=ie9oL79mOagwUhY6yYwAPpVZhk
	UJ4fLKeqF+32t9CThJCtMEXmswyfEre+TonzqnBTtdVP05FWXhA3e8114n32O0T2N5U5P8AFxPiwk
	t/HJ8nDGWndAebX9zSBEnCJqSU1ZKBC0a0QZw99r1oMNPvU8mpU09dyoTXm7XzMxMCZ7xTtG5sMpA
	DpDSjPFcVvcl+36k8VPFVsOyKdNNJOaemsBiT+tvy1yPE4yHqP37ol01iormtlXYVkuZQDRULDXA4
	NSvuLNd86bspvLhSv6LbQtJncoS/CoTsPlaSa0W3DlI/YBn4b+6XQGN8GSJ6BLarZgq84E92qD89s
	37+O2Z6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmQj7-0000000CLKf-1a1e;
	Mon, 24 Feb 2025 05:09:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmQhZ-0000000CLFz-3yt3;
	Mon, 24 Feb 2025 05:08:23 +0000
X-UUID: 5b1bad4ef26d11ef83f2a1c9db70dae0-20250223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BDIl4d2oYLCth691SnpOglTDGFjNLfuXxv8ji8Rlnto=;
	b=Qs9Mn6/W37xIA24nrjyg7NYI6R5fw5pXzIR6A3D3AvHxTbk/NVbNUQmhwshwX50tHmKMxF68Vwx3SqFLw/AD0QcB8vyBl/zerzxXBEicx1d6jcdZjfU9WnSUuP6fYOQV0X0WfZvdfkJRoovKMAJA8dHqVLkNrKgtLqnvHwdVtm4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f2397a51-8c3b-4ebd-bdb5-12108c36099c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:8bed3fdc-d480-4873-806f-0f365159227b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5b1bad4ef26d11ef83f2a1c9db70dae0-20250223
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1320820933; Sun, 23 Feb 2025 22:08:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 24 Feb 2025 13:08:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 24 Feb 2025 13:08:13 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Yongqiang
 Niu" <yongqiang.niu@mediatek.com>, Xiandong Wang
	<xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, Xavier
 Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu
 Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
Date: Mon, 24 Feb 2025 13:01:07 +0800
Message-ID: <20250224050812.3537569-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_210822_010643_F3F6A913 
X-CRM114-Status: GOOD (  14.20  )
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

Add cmdq_gctl_value_toggle() to configure GCE_CTRL_BY_SW and GCE_DDR_EN
together in same the GCE_GCTL_VALUE register.

Move this function into cmdq_runtime_resume() and cmdq_runtime_suspend()
to ensure it can be called when the GCE clock is enabled.

Fixes: 7abd037aa581 ("mailbox: mtk-cmdq: add gce ddr enable support flow")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 41 +++++++++++++-----------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index d186865b8dce..be17697d7785 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -92,16 +92,17 @@ struct gce_plat {
 	u32 gce_num;
 };
 
-static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
+static void cmdq_gctl_value_toggle(struct cmdq *cmdq, bool ddr_enable)
 {
-	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
+	u32 val = (cmdq->pdata->control_by_sw) ? GCE_CTRL_BY_SW : 0;
 
-	if (enable)
-		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
-	else
-		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
+	if (!cmdq->pdata->control_by_sw && !cmdq->pdata->sw_ddr_en)
+		return;
 
-	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
+	if (cmdq->pdata->sw_ddr_en && ddr_enable)
+		val |= GCE_DDR_EN;
+
+	writel(val, cmdq->base + GCE_GCTL_VALUE);
 }
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
@@ -140,16 +141,10 @@ static void cmdq_thread_resume(struct cmdq_thread *thread)
 static void cmdq_init(struct cmdq *cmdq)
 {
 	int i;
-	u32 gctl_regval = 0;
 
 	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
-	if (cmdq->pdata->control_by_sw)
-		gctl_regval = GCE_CTRL_BY_SW;
-	if (cmdq->pdata->sw_ddr_en)
-		gctl_regval |= GCE_DDR_EN;
 
-	if (gctl_regval)
-		writel(gctl_regval, cmdq->base + GCE_GCTL_VALUE);
+	cmdq_gctl_value_toggle(cmdq, true);
 
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
@@ -315,14 +310,21 @@ static irqreturn_t cmdq_irq_handler(int irq, void *dev)
 static int cmdq_runtime_resume(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
+	int ret;
 
-	return clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
+	ret = clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
+	if (ret)
+		return ret;
+
+	cmdq_gctl_value_toggle(cmdq, true);
+	return 0;
 }
 
 static int cmdq_runtime_suspend(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
+	cmdq_gctl_value_toggle(cmdq, false);
 	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 	return 0;
 }
@@ -347,9 +349,6 @@ static int cmdq_suspend(struct device *dev)
 	if (task_running)
 		dev_warn(dev, "exist running task(s) in suspend\n");
 
-	if (cmdq->pdata->sw_ddr_en)
-		cmdq_sw_ddr_enable(cmdq, false);
-
 	return pm_runtime_force_suspend(dev);
 }
 
@@ -360,9 +359,6 @@ static int cmdq_resume(struct device *dev)
 	WARN_ON(pm_runtime_force_resume(dev));
 	cmdq->suspended = false;
 
-	if (cmdq->pdata->sw_ddr_en)
-		cmdq_sw_ddr_enable(cmdq, true);
-
 	return 0;
 }
 
@@ -370,9 +366,6 @@ static void cmdq_remove(struct platform_device *pdev)
 {
 	struct cmdq *cmdq = platform_get_drvdata(pdev);
 
-	if (cmdq->pdata->sw_ddr_en)
-		cmdq_sw_ddr_enable(cmdq, false);
-
 	if (!IS_ENABLED(CONFIG_PM))
 		cmdq_runtime_suspend(&pdev->dev);
 
-- 
2.43.0


