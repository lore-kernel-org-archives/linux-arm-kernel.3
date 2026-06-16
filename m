Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EE7CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tvO6+MpilClcYNX4EokLZGsJsErKgA+iDUMEt0HQsM4=; b=s60zvuQAvtvmOlKop2KCLD4QA9
	j5P/wXtP8E9yT1idsJbVYEL5I1YyIAzJdYEXHrkL4OziN91eK3enWrBUgbW64P4Zk/AIIsTrQL3vG
	/yauhp8Z0raeWTZ5gLzrtqEXYmlPkZ/JKEEDQJ7lIxcyjRJa/h1JLysr3pb8ijA4gc4s0AIKhRKwx
	j5UYHIYQO8x9GpShPAONv8c/nGAf1YUO1MJ43rZLINxvRRtgqQEOJ9jUmOYDECecz/CLJKcs9BEH8
	EM528Yy3ZEnHORviUQ3K5A9wYGNewTc19qJKgOCCS2DVIv/yiBjNoVCvlW4ZY4lZJZAyldNfMa9/I
	tHOwArkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOfP-0000000FPM6-1POE;
	Tue, 16 Jun 2026 07:57:03 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOfM-0000000FPKm-1Wl2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 07:57:02 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45fd45e596cso2358336f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781596618; x=1782201418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvO6+MpilClcYNX4EokLZGsJsErKgA+iDUMEt0HQsM4=;
        b=IMBNnOmL+agRLt6TZya6Gru45zuB0P/bvgP1QVH5ctbK6WnX8mKZ3WvsG0lQegg76J
         Cyp75obuH8e7kUu4URjI4kKwsGxkeadiw4nPUAMMk0eA1c0CT+yvluQZ+/6mac4XC9fO
         0+k5lWb5+vZ87T0gGUYyXH8K8bBnIJUQJhn+jSSC9Ip9ROLmjbyO0Eyg03eQsPVoTNBa
         2wxv7+Jb4TjL3Sd0iLViI2qPDY3IHfOw0LVxgPvfjFH/PRRJk7XgJatbzXEyW/OA5laF
         d35GBKHx6hfpO3nUJcq7VcHKeHkXB4bA0F7IVeSFWteVPJ5Gd/UVxx3INqE0Xj4RFdx6
         En4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781596618; x=1782201418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvO6+MpilClcYNX4EokLZGsJsErKgA+iDUMEt0HQsM4=;
        b=rV5Tz23AAUwCK2QaNlmiWdm/FKJnGFT5J8BWBAHSlS1iV93pFBfTAJdny/TTr0juIx
         5vZGRDy7vHFk8XYPySRk0POXnkF0KvmRWNIKySwzi5Og039+iZDchHsWw3fbla8FtGeX
         W1amAFj41RVDEYLzcdiXu2nzbUEngPJZWDmBmrLK8McUQ9+qaNlQmPRVle1nszv3viRm
         X+XIAbF4Cmsaswl7sgGtVcnkS89O0UMsDlV3IQVF8oUP+UJUx8wqffYWaDKbhRgPo10X
         5xRbWR/pCKdffj9+Rle3x07Zt61l7MIxdzCEFf+u8H3m9ZS/IELUtPR7+9a8l1Gxe0r7
         c8Bw==
X-Forwarded-Encrypted: i=1; AFNElJ/73v2P0jHdlj33rgURjqlue6ZM5w7xTRDm96O4Rb+0d+nGSbw4a6FzndvyVslkTwtgPPDmrMCRtGAak1tAvRRq@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ2bttXLT8sDnpuv81scs5FX59VDc8DutaRudzp1M7qhYhW4pT
	wwBKeb2DqJNOJy27e83GBepuajcOlZTkuvH/3s1uz6VmfBq6Dmv++MNYvYzn8cyWaodr
X-Gm-Gg: Acq92OF5bwaNkWxI2Qyb14NHMCb4CN3HeWhKQeevJ7hK9r7I16ZLJJWAmtbwtfgR5lj
	GihUR9ieBlieoLWl0I5WTI5LFr6mWlTwlLdBr4liweSE5pw0IC7ffp49MV0D+oQHgVO4YNvwEoB
	QVyf4EY5oOP+ThHhKqz3hBDmsdQjeep79gK1ipvB8WGub/DW7HHCh91NM8L8W142zn1fW1v/jiJ
	4OgkBcmkOIrq9esJNAX5jzI0igneEODc6S9LGfqZCfTVAfLbk5CN0oEc0LpDXK7f3KHD4pzq2Jn
	ySCcbpo7k38f+3lhMNEXQHzyOCkVFiQiI0foS1VLMch/3vCpp0SxxSeX281EkFKc8a2voRg/O2c
	2P+zXFc2PxcIpyqjwwTKk5WiR+Z4E2mKM0ZFMtjLVfNLOO4sDBgPsG4fvaisin7IeqA7nqmJhpk
	OEdgZvOfqbLWyPusygye5H9ZkgXWq3vvxgjfe+duMpRKh69XvYZ3LwArceaKo56GoyW2gMrP2YV
	XlFpcmvYEiIhx2/Xm2h8SEmm7acfPdJgXqwVww1gQoJ4A==
X-Received: by 2002:a05:6000:1862:b0:461:b44c:a7a6 with SMTP id ffacd0b85a97d-461b44ca88dmr403954f8f.34.1781596618356;
        Tue, 16 Jun 2026 00:56:58 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm43503294f8f.22.2026.06.16.00.56.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 00:56:57 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: fix use-after-free in decoder release path
Date: Tue, 16 Jun 2026 09:56:55 +0200
Message-ID: <20260616075655.95711-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_005700_426962_61209E71 
X-CRM114-Status: GOOD (  10.63  )
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

fops_vcodec_release() frees the decoder context with kfree(ctx) but
never cancels the per-context decode_work worker first. Although
v4l2_m2m_ctx_release() waits for any in-flight m2m job to finish, the
workqueue handler (mtk_vdec_worker) may still be running and accessing
the context after v4l2_m2m_job_finish() returns. Once kfree(ctx) runs,
that worker dereferences freed memory, resulting in a use-after-free.

Cancel the pending decode work with cancel_work_sync(&ctx->decode_work)
after the controls and m2m context are torn down and before kfree(ctx),
mirroring the fix already applied to the encoder release path in
commit 76e35091ffc7 ("media: mediatek: vcodec: fix use-after-free in
encoder release path").

decode_work is always initialised before release can run:
fops_vcodec_open() calls mtk_vcodec_dec_set_default_params() (its only
caller) unconditionally after a successful v4l2_m2m_ctx_init(), and that
function runs INIT_WORK(&ctx->decode_work, ...). A context can only reach
fops_vcodec_release() via an open() that returned 0, i.e. one that passed
that INIT_WORK. cancel_work_sync() on a properly initialised work_struct
is therefore always safe, even if the work was never queued. This is
unlike the 2023 msg_queue->core_work regression, where the work item
could be uninitialised at cancel time.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: reword the commit message to stay within 75 columns (no functional
    change; checkpatch).
v1: https://lore.kernel.org/linux-media/20260615140526.52617-1-doruk@0sec.ai/

 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index e936ed8dffbaf..30906b24c608a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -313,6 +313,15 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
+	/*
+	 * Cancel any pending decode work before freeing the context.
+	 * Although v4l2_m2m_ctx_release() waits for m2m job completion,
+	 * the workqueue handler (mtk_vdec_worker) may still be accessing
+	 * the context after v4l2_m2m_job_finish() returns. Without this,
+	 * a use-after-free occurs when the worker accesses ctx after kfree.
+	 */
+	cancel_work_sync(&ctx->decode_work);
+
 	mtk_vcodec_dbgfs_remove(dev, ctx->id);
 	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_del_init(&ctx->list);
-- 
2.43.0


