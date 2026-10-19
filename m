Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD12CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 06:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhnH2Fl7Ngxx8M1a91ckV8yYy0vtR+vF5EQHpmiM6YM=; b=ul3KAwwL6Ttw52y26fAjMGFRVS
	LRHZr8soyDbd6AnlFuy8Ly9IxjoG5TIZzqhwJm5pN1Z6EIV01mNXXbrAZXJE6qCZSJesYzbT9fRaL
	lckG7EE/qLW9dgNdUU3xj168D6E3SVU0nqZBuVTM8vZfrx3tZnlUlz0W+yPl0PdzABcpM31EXiccZ
	Y9hb75BKZmWdnoG2BvKaYc2Mt4j2e/psLGRLC+LSvFGrBJLvMnBW4xYtwgLL36BVeJ//DcLK57vsd
	AwXAi0yiByPkPaNWxB/svkOaKG1A/TsONxpyqO7ZNR+608g3NsZvXsd2bASPEzyy3tM3mKHrdZcnE
	q2B/PdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYR-00000006fx8-3iXL;
	Mon, 19 Oct 2026 06:09:03 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYK-00000006fsW-1RfE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 06:09:00 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-15943c9c005so999750c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 23:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792390135; x=1792994935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhnH2Fl7Ngxx8M1a91ckV8yYy0vtR+vF5EQHpmiM6YM=;
        b=O+276bPyF9AFSlpgAGEbOuH+hs6B1g5hc0obyECs2nNlU6Fze6tjrnoeFpc1dPvrVX
         S9kOuGiFmB62VptF8doSdhz8PC6tQepY1dPCktYEfju6YG7M8nBg3zs6vLoAKfLMGJPt
         psLuw/VttnSn4eAdZCRIZS0DXlt2fkVkEN3Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390135; x=1792994935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KhnH2Fl7Ngxx8M1a91ckV8yYy0vtR+vF5EQHpmiM6YM=;
        b=whhsBgb5rWg8z6nGE5jnt86aealfycKILo7QuCiL2ZyxOepRVaDZ2sOqpIia6stdLU
         DaKaDxdCtEkYYi/oneboqF6/Xy4brgSRJVu4rvEoOu3rN/JQ0wv9A+pZM1heqPU2nfJk
         bkQ5bnFnZKcUMMMtXjXuIYeUSjP7spbjGmyyce7xOJ7w5gaSkXu69v8kWmNmUfoYVzo7
         EPqYS7zw/kf1+X6r8dWxG2MTERqzqzU/PL8wuuTdGqqHE+dvhfyN0njHyMgSItuSfHWo
         UKU9EB8EwMj/WMBNdLA+dqLv9o7I3jTZlsnkOLvBfd4/HF1qFGRgLM9GVo/R93Uh+fzo
         PGBw==
X-Forwarded-Encrypted: i=1; AKwUvBxWZMUo5puFmuaHkVLlbipstwvWWTR+qBJ9Mf5h27/r8tRfDc92bCR/Ty1YOXSx0BoutwcZHH9Sah8y+y/yb704@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+I9uuQk7cSg8g5OTtxtrdBQsB1WvUOItBAuFbJ05mz33Co624
	sL0Z3kB8IM+Jqi3ee1ZdYzlbBVZtxZUt+FUDV/iuSFe1WjR0/rQ/p1nOQwq2tQTYAQ==
X-Gm-Gg: AYBFou3/wS37UMlNlzDD4YqRMG1+cQt418WCsKrgVG2vTE7wLh3oXusWAzWyuRkkd2K
	qUl8apj4dyfdq/F6kX0ZySdT+VVEMrfO7bqy8PHpiPQKYjggH/1gCkmsn3YzhaRUxCE83LyH5Fd
	P4kS59CuhWUetoDMzwKTNJdo7kYHz1KgzQ7jfa+kJr7mwB6QFolFndbGeZOj7bP/tyQk+xxwoL8
	ZUfvsnl+hBDwR2x8p7A69eJcehg/YhTeUxAnXqx0akA6LREI1TDBpgEnDbGkGhtU7XIsRUnwPJN
	2DWcjeaHbzTnwdNNkzgb2PmqQjihh+2VB3iVumNQ+JVexv5GcMJj29a0jqYngVSgw4gcmwOxkXv
	u3Er/Af37R4IqwGDVYG0jYxQrHCBZf5RoBdZnuRn1dRQx73Gz6IdtX8T2Zv4gqyVmHIutcp19fg
	UchXDFgj05mgNniIaN3E/4wQWwOJ57hYJv5ZruPWudJWyC1RZwyX6xQOU7iSTmriERnO9X2ni7r
	k5SxudpOyR/6TKc8NBB9LzF7/WRfLkS4pWJ5zdh5XK8JVDMJvkusAbqNQ==
X-Received: by 2002:a05:7022:28a:b0:150:6c0e:2ce2 with SMTP id a92af1059eb24-185139aa4d9mr10544613c88.31.1792390135205;
        Sun, 18 Oct 2026 23:08:55 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:b024:9aa2:76e6:57d4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm23281190c88.8.2026.10.18.23.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:08:54 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] media: mediatek: vcodec: Complete request on NULL va in stateless decoder
Date: Mon, 19 Oct 2026 14:06:20 +0800
Message-ID: <20261019060825.4163770-3-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019060825.4163770-1-fshao@chromium.org>
References: <20261019060825.4163770-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_230856_423859_6E238B73 
X-CRM114-Status: GOOD (  17.00  )
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

If vb2_plane_vaddr() returns NULL for the source buffer because it has
no kernel mapping, mtk_vdec_worker() finishes the m2m job without
returning any buffer or completing the media request, so userspace
waiting on the request never gets a result. The source buffer was only
peeked and stays at the head of the ready list, so
v4l2_m2m_job_finish() also schedules the same job again, which fails
the same way.

Handle it like a decode error, which takes three steps:

- Complete the request controls. The request cannot complete while its
  control object is still pending.
- Remove the source buffer from the ready list and return it with an
  error, so that the job is not scheduled again.
- Call mtk_vdec_stateless_cap_to_disp(). It returns the capture buffer
  and drops the driver's reference to the request, which completes the
  request under manual completion.

The media request is now looked up before the address check because
this path needs it, and the error is printed first because the buffer
must not be touched once it is returned.

Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba0d9..c97835f50ca1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -342,23 +342,29 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
+
+	mreq = vb2_src->req_obj.req;
+	if (WARN_ON(!mreq)) {
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+		return;
+	}
+
+	if (!bs_src->va) {
 		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
 				  vb2_src->index);
+		v4l2_ctrl_request_complete(mreq, &ctx->ctrl_hdl);
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(vb2_v4l2_src, VB2_BUF_STATE_ERROR);
+		mtk_vdec_stateless_cap_to_disp(ctx, -EFAULT, mreq);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
 
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
-	/* Apply request controls. */
-	mreq = vb2_src->req_obj.req;
-	if (WARN_ON(!mreq)) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
-		return;
-	}
 
+	/* Apply request controls. */
 	v4l2_ctrl_request_setup(mreq, &ctx->ctrl_hdl);
 
 	/* Keep a reference so that if the processing completes before this function
-- 
2.56.0.176.g3575e65682-goog


