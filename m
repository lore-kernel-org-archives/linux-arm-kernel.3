Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062D0CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cWcO4px56bciI2pw+C/GD4p6lsmnspj/GXwm9bAVCbo=; b=lM5peqwwuDKzcPRYzXl5UplG3Y
	aS+M+w2+3SNasEFXh+NIMslfOz1+j1BZ4K0EElAM4eUQt4hP6qmX9xHprnA8EDLLuM1x2TDN9Yjv3
	StwpJ6UXWnC+Qznx2xrFaurJk0vPt9hFRclzK5jejSPp/NMZGwDUfAutxDhG+8e47hpWXKWhAsRvI
	SYVzTV2HlUcASIO5B0tu+XrAIGVBDql4+tpBlhbyneew2v79rp7NaoEnAfgMkWa4HcQZwWdSScVwi
	+lMPp7lL9EQJ4W1JFIPwQ1MOVeTUY+UGLoCux2i80lCr5X0X6BqBFd/Wizh/Q2vgq5CiFdCpCosVZ
	DgDcDzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7wU-0000000EMDW-3j9K;
	Mon, 15 Jun 2026 14:05:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7wS-0000000EMC8-1HiG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 14:05:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so26677555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781532330; x=1782137130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cWcO4px56bciI2pw+C/GD4p6lsmnspj/GXwm9bAVCbo=;
        b=qIczR1kMhSkk4jxqXNmv2tpuMChq0JD8rkNVpAeet7r1qrDf9BrBrw91cTlFlLBv3N
         edoRxX5h92LNhJYWiZHmnXW/b50hK0IfLwQdeslxW3vtYF1zGPg5yIaXMbjmTT8Y+sWR
         D3GN8T6mZHlClLoDFPZ9ymziqHaGK5td75EGWP0Yail/hZzG6Vp4AqsFyyfh/vfNvT9T
         LNq3EFppKAR3gkTNF0GxbCoRzzDR87S5kBs2uCusY+OvYvttRv6hom2l1e/juatafHpT
         Zuyz6zmBz5TdONnQylJW5KJrHRyCIOLF3tJrhEQrr14XBcNKHsJ6hh928y9psdwrS+Gs
         AeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532330; x=1782137130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWcO4px56bciI2pw+C/GD4p6lsmnspj/GXwm9bAVCbo=;
        b=THIDMgIZqwd+okZ6KYKb16bnwUAY07fwo5GfunLUqybpdZE9qHj19CEa8SFDzKuBPN
         KGL32Z9caFMZ16hMFsS9LOTCW8hd1prXWKimtVLe+GsA7WnC19n/Ud9FQ5Y5ZrihSx93
         0hzSELszbbDstHR24gEH9D0NiVsN1drIzC7BkiXvrvoYa8iS30Mh8KWcACpHgkKC6o4C
         E789Slkene4/7eToKD9ZAbbWDeZDQ9an5f/lYuihYwJ5OSpAc53ZcwYPx7b7W13ZuvGB
         kCoSCoynLsjceR+hJk0iPwPK0Xf8OE2n+eIIiPrnLgKVfUVwi7/UIIg98CCMG1u3AXdC
         0D3A==
X-Forwarded-Encrypted: i=1; AFNElJ/dZDmyYiE0Qtd9esKpyK0/yoUf4Ct6u8kM2bymt+wIomVZ2MamsnqDhVY1Tw09wJsOonqqrG1F/I4sOOZLsut9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1yY05a+9WvWTLZTWTK2zY54C45bq0pTRRxixwLQroTUOx28yu
	skj7K9RXvvMvIbGascjxWN4nlypw/7sAy9tAzID9WwLbepQ8R7oSP5agO4u/YglNV8em
X-Gm-Gg: Acq92OHVs3XgxmiB+vpDh2h2yUfkAsuzOTB5o2NgmsTtmy2zyLrJKJOZ3HiPBTi+1Dy
	6QV0bigYdiKvH3459twLUcNsQMLFO+0O/i+cEYaghNgEa5UXEWTavqQvN9TNi2sAdt6zT8qg27z
	MRpdJYITihbzydXJU1SWpsdY7rHhmPhPp0OG4iMpa44HQuhVIfvM+9IHDO262CDXWn6D2F7Tlkl
	h9Ccvmc3KfiDv67fF+nu57837agI9bhpNDdCqQTFrQiVH9wAVoxfU73CgnYtO+oKIf1DpmAMkxw
	GIj+nYdBEPpQX1x/5LNRMZWZw1W4BMkpjzSjePRx+I+2V9WEP35UuL2wTlycONNiwRYXZayH5IK
	TF198D+WkKKqaoT1LZ0S9j/s3wpt0dlX+UrQAZsCFnYVA8YGZRfe1mJfRIWRBQSiNd29pJ2Ee68
	URcLMxA4pTQBODiIDadPCcbSo9/Zyk4XmHrgky1iFMhMsENYQhiZjMTMGsHJYl6BOyr+ybIQBcz
	fm52NCCjmuQp6vlOnQrsqBSVWyUEhCRor/XA0Q5ejEyPA==
X-Received: by 2002:a05:600c:6b69:b0:490:b642:ce2c with SMTP id 5b1f17b1804b1-490ec4df221mr128435735e9.14.1781532329599;
        Mon, 15 Jun 2026 07:05:29 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d05d1sm350721705e9.12.2026.06.15.07.05.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 07:05:29 -0700 (PDT)
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
Date: Mon, 15 Jun 2026 16:05:26 +0200
Message-ID: <20260615140526.52617-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_070532_368653_BD63F2CA 
X-CRM114-Status: GOOD (  10.51  )
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
commit 76e35091ffc7 ("media: mediatek: vcodec: fix use-after-free in encoder release path").

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


