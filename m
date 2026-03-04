Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFB1EB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ctgTE9+DXOgMxpJSHAYKtJ2WsWYUb1iCLsiuJHYoxZw=; b=1cmA1U8Fw6VWYCewekBAPchzCP
	s1hiJRpAfp6t2yHO/5ok+gs5FZgKliQg5asCPJP2AqSixuZEBkTswKvYhdvj6hRFtkKmj4GdjDXmy
	lLs9cs335FTlBiHUCDjpoKgSoejn3Gd07H0iv3JiAq+XeLXECaIMJ4qq+7VwHijwIfwJr604i/QBw
	WrUuvpRgfsEXNzAUSV2UsmCuDKtvgcYKfhyfX3CosQl1CpOyzvx0YfjTtxEDO3ZwBSFfKRQxO2BSB
	C5t2mpoIY8Q666ZLc/dGU7eOfF0zkCpDo/j4oF9Llegnri9XRMXvJsOhbPtyfnASK1Ly0KNAbld15
	i/7pEXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxif5-0000000GtXW-08KO;
	Wed, 04 Mar 2026 09:36:59 +0000
Received: from azure-sdnproxy.icoremail.net ([13.76.78.106])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxif0-0000000GtVX-3Lqh;
	Wed, 04 Mar 2026 09:36:57 +0000
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wC3Nh0Q_adpkTIFAQ--.16844S3;
	Wed, 04 Mar 2026 17:36:17 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app4 (Coremail) with SMTP id zi_KCgDnfYMG_adp2KCYBQ--.53298S2;
	Wed, 04 Mar 2026 17:36:06 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: tiffany.lin@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] media: mediatek: vcodec: fix use-after-free in encoder release path
Date: Wed,  4 Mar 2026 09:35:06 +0000
Message-Id: <20260304093506.236277-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zi_KCgDnfYMG_adp2KCYBQ--.53298S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?eygmewXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVF/U4hEbTTFSw5kpxcvjRb6mQGmGX2Lq9AG8clAwRux2D2Ta4eYv/3f2xyhLs0q0Axz
	y3xBfAYJQz1E2yiHyG6p9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoWxZFyxtr13Jr1kXr1xKFWUKFX_yoWrXF17pF
	WfKrW2kayUJr4vyF1xta18Za4ruryagr47Gw40vw1fA3sxAr4qqr42kr109FWktrZ7tF4U
	ZrsFg3y3Gr4jyFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85l1PUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_013655_009240_8397BF5F 
X-CRM114-Status: GOOD (  10.86  )
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

The fops_vcodec_release() function frees the context structure (ctx)
without first cancelling any pending or running work in ctx->encode_work.
This creates a race window where the workqueue handler (mtk_venc_worker)
may still be accessing the context memory after it has been freed.

Race condition:

    CPU 0 (release path)               CPU 1 (workqueue)
    ---------------------               ------------------
    fops_vcodec_release()
      v4l2_m2m_ctx_release()
        v4l2_m2m_cancel_job()
        // waits for m2m job "done"
                                        mtk_venc_worker()
                                          v4l2_m2m_job_finish()
                                          // m2m job "done"
                                          // BUT worker still running!
                                          // post-job_finish access:
                                        other ctx dereferences
                                          // UAF if ctx already freed
        // returns (job "done")
      kfree(ctx)  // ctx freed

Root cause: The v4l2_m2m_ctx_release() only waits for the m2m job
lifecycle (via TRANS_RUNNING flag), not the workqueue lifecycle.
After v4l2_m2m_job_finish() is called, the m2m framework considers
the job complete and v4l2_m2m_ctx_release() returns, but the worker
function continues executing and may still access ctx.

The work is queued during encode operations via:
  queue_work(ctx->dev->encode_workqueue, &ctx->encode_work)
The worker function accesses ctx->m2m_ctx, ctx->dev, and other ctx
fields even after calling v4l2_m2m_job_finish().

This vulnerability was confirmed with KASAN by running an instrumented
test module that widens the post-job_finish race window. KASAN detected:

  BUG: KASAN: slab-use-after-free in mtk_venc_worker+0x159/0x180
  Read of size 4 at addr ffff88800326e000 by task kworker/u8:0/12

  Workqueue: mtk_vcodec_enc_wq mtk_venc_worker

  Allocated by task 47:
    __kasan_kmalloc+0x7f/0x90
    fops_vcodec_open+0x85/0x1a0

  Freed by task 47:
    __kasan_slab_free+0x43/0x70
    kfree+0xee/0x3a0
    fops_vcodec_release+0xb7/0x190

Fix this by calling cancel_work_sync(&ctx->encode_work) before kfree(ctx).
This ensures the workqueue handler is both cancelled (if pending) and
synchronized (waits for any running handler to complete) before the
context is freed.

Placement rationale: The fix is placed after v4l2_ctrl_handler_free()
and before list_del_init(&ctx->list). At this point, all m2m operations
are done (v4l2_m2m_ctx_release() has returned), and we need to ensure
the workqueue is synchronized before removing ctx from the list and
freeing it.

Note: The open error path does NOT need cancel_work_sync() because
INIT_WORK() only initializes the work structure - it does not schedule
it. Work is only scheduled later during device_run() operations.

Fixes: 0934d3759615 ("media: mediatek: vcodec: separate decoder and encoder")
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index c977ed0c09b6..4e4541b2fc8e 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -215,6 +215,15 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
+	/*
+	 * Cancel any pending encode work before freeing the context.
+	 * Although v4l2_m2m_ctx_release() waits for m2m job completion,
+	 * the workqueue handler (mtk_venc_worker) may still be accessing
+	 * the context after v4l2_m2m_job_finish() returns. Without this,
+	 * a use-after-free occurs when the worker accesses ctx after kfree.
+	 */
+	cancel_work_sync(&ctx->encode_work);
+
 	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_del_init(&ctx->list);
 	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
-- 
2.34.1


