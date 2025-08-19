Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E311BCA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 02:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTwFQbiahKuVur4FiMdEux7IBBiZSXrfDzUUPEN8Sro=; b=L+RynuOxGDVvITxjcTNSU7QRi0
	u6oLToSQqfGiE9alI0LksZy2f2jaiKvyctCiXBZ3nFtQnsl2R1KCdil5vAAk4MNz5GVXfitnrTz1T
	9yyLDW7X7DZ8R6e0/zCC/rEFh2SK+Ptywoxz+j7x542IRMxDAa4qfza8sMzNH+D4MoC5vW3U9kggB
	rAzofVPL2t/vSIV+iVmo1L8/qeUns5G/wlWJopgmA+modRJ4sJOGCkp+G+r9ZWx1jrgJk/bwEwo4C
	oN0Jht1bQZ7ydGa4yzPhjCvlvB+A2rftJIzx2N0JYGF6T7F2guSHCygvDTDZ4mcYSHyK8Vc4xcDBE
	qvNWSN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBlS-00000009Afi-3Mk2;
	Tue, 19 Aug 2025 02:07:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBdu-000000099d4-0pxS;
	Tue, 19 Aug 2025 02:00:07 +0000
X-UUID: 3946ed887ca011f09eb0dd999d3936bf-20250818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zTwFQbiahKuVur4FiMdEux7IBBiZSXrfDzUUPEN8Sro=;
	b=pUxVzD41SrRgfeAC77jFbuH2uDDsyjtVxG+pJ5WTxAaufpUxIfarXnd2IsVz4t6Jb7sin/YvOAtKqN9KBYOPPImPFJBZd2njl1/73Y3BACY3ZzZWEtk6xgq5PWLUx+D0wC44ct7gCme+ATud7Zn7jcbcqjmXHqz5xNiozYuKCw8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:cbb593ac-7554-415b-b873-9709a0bbb89b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:bd3211f4-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3946ed887ca011f09eb0dd999d3936bf-20250818
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <xiandong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2134014652; Mon, 18 Aug 2025 19:00:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 19 Aug 2025 10:00:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 19 Aug 2025 10:00:00 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Houlong Wei
	<houlong.wei@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: [PATCH v2 4/4] mailbox: mtk-cmdq: modify clk api for suspend/resume
Date: Tue, 19 Aug 2025 09:59:41 +0800
Message-ID: <20250819015948.15450-5-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250819015948.15450-1-xiandong.wang@mediatek.com>
References: <20250819015948.15450-1-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_190006_243524_A54543E9 
X-CRM114-Status: GOOD (  14.22  )
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

Since it is necessary to use clk_bulk_prepare_enable
and clk_bulk_disable_unprepare instead of clk_bulk
enable and clk_bulk_disable because, on 8189, the
gce clk is mounted on the mminfra clk. When disabling
and enabling, the parent clk must be enabled and
disabled first to correctly switch the clk for gce usage.
Modify the clk api for suspend and resume, modify the api for
suspend and resume to disable/enable clk, so it can disable/enable
module clk and parent clk successfully.

Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 543cd86b5bb0..590f0f6e51b0 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -161,14 +161,14 @@ static void cmdq_init(struct cmdq *cmdq)
 {
 	int i;
 
-	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
+	WARN_ON(clk_bulk_prepare_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
 	cmdq_gctl_value_toggle(cmdq, true);
 
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
 		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
-	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
+	clk_bulk_disable_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
 }
 
 static int cmdq_thread_reset(struct cmdq *cmdq, struct cmdq_thread *thread)
@@ -332,7 +332,7 @@ static int cmdq_runtime_resume(struct device *dev)
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
+	ret = clk_bulk_prepare_enable(cmdq->pdata->gce_num, cmdq->clocks);
 	if (ret)
 		return ret;
 
@@ -345,7 +345,7 @@ static int cmdq_runtime_suspend(struct device *dev)
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
 	cmdq_gctl_value_toggle(cmdq, false);
-	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
+	clk_bulk_disable_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
 	return 0;
 }
 
@@ -384,12 +384,8 @@ static int cmdq_resume(struct device *dev)
 
 static void cmdq_remove(struct platform_device *pdev)
 {
-	struct cmdq *cmdq = platform_get_drvdata(pdev);
-
 	if (!IS_ENABLED(CONFIG_PM))
 		cmdq_runtime_suspend(&pdev->dev);
-
-	clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
 }
 
 static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -708,8 +704,6 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, cmdq);
 
-	WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
-
 	cmdq_init(cmdq);
 
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
-- 
2.46.0


