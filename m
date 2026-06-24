Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F98CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 00:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zhe/bJuWNQFZCQRQ2U29gnWogyLVcmbEkUk0S/YP6HE=; b=0cfG6vrNqsijmP7GZacNz0jb8O
	J+C5G7ygMoaWYOkLsfOEJ94jV1DUTZPHt9JSYsqAY4G9Yc81gruRhBEXd3diBAuGiivzNShrQ3m3u
	Itfa1U+u0KPzlFrtbuUmm1v2VoSZoM3R3xKhBQKwMxzzNDaY4o1c+nsd5rHKmcbTBmdqkLXQeL0rR
	6aHdwBljSbT6uNh7L0Ab/SF0nVWFVTKqQMdXvROc4HY6BlU7+e9bJc/1ZvsAJhb12HFmTt8/ZAYqR
	PfsB7IgMCGj7x3AgGRNGTWf6x4vy6ofFB1CyFvwAev6/eGhXCbVGBVCSEHCWcgtRpfNP8Bk8K1OIg
	tLcfJhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcBYR-000000070Rf-07Wq;
	Wed, 24 Jun 2026 00:33:23 +0000
Received: from azure-sdnproxy.icoremail.net ([52.229.168.213])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcBYM-000000070RE-0yd6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 00:33:21 +0000
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wDnVtC_JTtqNNIEAw--.19900S3;
	Wed, 24 Jun 2026 08:33:04 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app1 (Coremail) with SMTP id yy_KCgBHl5+_JTtqlq47Ag--.46757S2;
	Wed, 24 Jun 2026 08:33:03 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: mirela.rabulea@nxp.com,
	mchehab@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] media: imx-jpeg: finish the job on device_run() error paths
Date: Wed, 24 Jun 2026 00:32:08 +0000
Message-Id: <20260624003208.12400-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: yy_KCgBHl5+_JTtqlq47Ag--.46757S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?xwzJ2QXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVCjTgEH9dVomQuWcozCBBFB48mKC5DDzTCdDpjvUvjuGCGVJYTzvwsltdPDHA6IOBJZ
	R1Ezv3MDA86MpxTOsUDN5RPxYw6l01w8CbPzC/8w
X-Coremail-Antispam: 1Uk129KBj93XoWxuF13trWDuFWUZF43JFWxXwc_yoW5ury5pr
	ZIgryqkFyFqrs7tF4xtr4UAF1Yyrn3uF42ga18Ww1ku34agF4DtF40k3WUtF17tas29F1F
	qw4qvwsrurWDCFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8w
	AqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8I
	cVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjc
	xG0xvY0x0EwIxGrwACjcxG0xvY0x0EwIxGrVCF72vEw4AK0wACI402YVCY1x02628vn2kI
	c2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jbo7NUUU
	UU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_173318_586515_D561FE80 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

mxc_jpeg_device_run() returns early through a shared "end" label on several
error paths (no free slot, mxc_jpeg_alloc_slot_data() failure, or missing
buffers or queue data), and none of them calls v4l2_m2m_job_finish().
Since the delayed work is queued only after the hardware is started, those
paths neither finish the job directly nor queue timeout work that could
finish it later. The job is left with TRANS_RUNNING set, so the
wait_event() in v4l2_m2m_cancel_job() (reached from v4l2_m2m_ctx_release()
at close) waits indefinitely and the close hangs.

mxc_jpeg_alloc_slot_data() uses dma_alloc_coherent(), so the failure path
is reachable under memory pressure.

Return the src/dst buffers with VB2_BUF_STATE_ERROR and call
v4l2_m2m_job_finish() on those paths: paths that have buffers use a
"buf_finish" label; the no-buffer path uses "job_finish" directly. This
mirrors the existing jpeg_parse_error path.

This bug was found by static analysis.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 9e4a813489c0..6b224a19f40e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1525,15 +1525,15 @@ static void mxc_jpeg_device_run(void *priv)
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 	if (!src_buf || !dst_buf) {
 		dev_err(dev, "Null src or dst buf\n");
-		goto end;
+		goto job_finish;
 	}
 
 	q_data_cap = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 	if (!q_data_cap)
-		goto end;
+		goto buf_finish;
 	q_data_out = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
 	if (!q_data_out)
-		goto end;
+		goto buf_finish;
 	src_buf->sequence = q_data_out->sequence++;
 	dst_buf->sequence = q_data_cap->sequence++;
 
@@ -1571,11 +1571,11 @@ static void mxc_jpeg_device_run(void *priv)
 	ctx->slot = mxc_get_free_slot(&jpeg->slot_data);
 	if (ctx->slot < 0) {
 		dev_err(dev, "No more free slots\n");
-		goto end;
+		goto buf_finish;
 	}
 	if (!mxc_jpeg_alloc_slot_data(jpeg)) {
 		dev_err(dev, "Cannot allocate slot data\n");
-		goto end;
+		goto buf_finish;
 	}
 
 	mxc_jpeg_enable_slot(reg, ctx->slot);
@@ -1597,8 +1597,17 @@ static void mxc_jpeg_device_run(void *priv)
 		mxc_jpeg_dec_mode_go(dev, reg);
 	}
 	schedule_delayed_work(&ctx->task_timer, msecs_to_jiffies(hw_timeout));
-end:
+
 	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
+	return;
+buf_finish:
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+job_finish:
+	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
+	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
 
 static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
-- 
2.34.1


