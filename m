Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843F4C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 07:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z7nRriuV9vS+4k4680rkW86JxjvMbZ7a06K/lzDLNBo=; b=jKvTKVqv7h0+iKLx12mxiizL5E
	KReLDiCoqLxZINNgvpNMHiYv89KVDIV/6F902n+7Kdd+Ca7Qe0LknFqKdooNK6rE6emFwBV20TKvH
	ROGmWRKz3ohWFzAfaCBMdwyzCJUYRC0j7CDDhMFTPZUn/T+ylDM8NEpPvYvepLrGLkjzCf9Tdeayd
	DCgHOEuAYWNO3EshqQ25IDSTsou4Js90BnwQA8Kz7oCmQPVnR3flnS+2/CN6MeBbonYZ8d7wDWgqV
	Bt8IPEqqGGRhXJ3WsYzfEB7wsULB6L4QCRST6PhzmN1+n3NhuTeGCelm4v+RVoJTNAiCZpmK7Wa5R
	xa4LCwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGv6u-00000008FOV-3l2i;
	Mon, 19 May 2025 07:40:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGv4s-00000008FCS-2On4;
	Mon, 19 May 2025 07:38:27 +0000
X-UUID: 3cd2b7de348411f0bed96b30c12bc3d6-20250519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Z7nRriuV9vS+4k4680rkW86JxjvMbZ7a06K/lzDLNBo=;
	b=a3wFtYUmcH5zYvLJAPaUVjKH0MWg2JQRmpLx4yRd7jJU/KmUxK/T2YPPuDE/DJERAZgR1a9gDKvCzGSOw81kr4GZUsYCEVzi21yTAHmMlyCuLPQ6ena91pLaGnMafoE0ZdDw/Q6wjTZU4tXFY7WDcMDOVF8LlxZe42w2CDb81C0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:718dadc2-a4d5-4c65-80a8-038e892bbb94,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:94a8e197-7410-4084-8094-24619d975b02,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3cd2b7de348411f0bed96b30c12bc3d6-20250519
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1879578343; Mon, 19 May 2025 00:38:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 19 May 2025 15:38:17 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 19 May 2025 15:38:16 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <xiujuan.tan@mediatek.com>, Qilin Tan <qilin.tan@mediatek.com>, Bosser Ye
	<bo.ye@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] scsi: ufs: preventing bus hang crash during emergency power off
Date: Mon, 19 May 2025 15:38:13 +0800
Message-ID: <20250519073814.167264-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_003826_614730_DDDBAF71 
X-CRM114-Status: GOOD (  14.27  )
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

From: Qilin Tan <qilin.tan@mediatek.com>

When kernel_power_off is called directly without freezing userspace,
it may cause UFS crashes:

Callback:
    ...... 0xBFFFFFC080C6156C()
    vmlinux readl() + 52
    vmlinux ufshcd_add_command_trace() + 552
    vmlinux ufshcd_send_command() + 84

When kernel_power_off is executed, ufshcd_wl_shutdown is also called
to turn off the UFS reference clock, VCC, and VCCQ. If I/O requests
are still being sent to the UFS host and accessing the interrupt
status register at this time, AP read timeouts may occur, causing bus
hang crashes.

The root cause is that scsi_device_quiesce and blk_mq_freeze_queue
only drain the requests in the request queue but don't guarantee that
all requests have been dispatched to the UFS host and completed.
Requests may remain pending in the hardware dispatch queue and be
rescheduled later. If the UFS reference clock has already been turned
off at this point, a bus hang crash will occur.

Example of the race condition:
Thread 1                                                   Thread 2
kernel_power_off
-> ufshcd_wl_shutdown
 -> scsi_device_quiesce(sdev)
  -> blk_mq_freeze_queue(q)
   -> blk_mq_run_hw_queue(htx, false)
    -> blk_mq_delay_run_hw_queue(hctx, 0)                blk_mq_run_work_fn
 -> ufshcd_suspend(hba) // disable ref clk                -> blk_mq_dispatch_rq_list
                                                           -> blk_mq_run_hw_queue()
                                                            -> ufshcd_send_command()
                                                             -> ufshcd_add_command_trace()
                                                              -> ufshcd_readl(hba, REG_INTERRUPT_STATUS)

When Thread-2's dispatch request is delayed due to heavy CPU load,
the interrupt status register may be read after the reference clock
is disabled, resulting in a bus hang crash.

To avoid this issue, call ufshcd_wait_for_doorbell_clr to wait until
all requests are processed before disabling the reference clock.

Signed-off-by: Qilin Tan <qilin.tan@mediatek.com>
Signed-off-by: Bosser Ye <bo.ye@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 7735421e3991..a1013aea8e90 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10262,6 +10262,7 @@ static void ufshcd_wl_shutdown(struct device *dev)
 		scsi_device_set_state(sdev, SDEV_OFFLINE);
 		mutex_unlock(&sdev->state_mutex);
 	}
+	ufshcd_wait_for_doorbell_clr(hba, 5 * USEC_PER_SEC);
 	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
 
 	/*
-- 
2.17.0


