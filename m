Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F3FCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=; b=yAIP67z4BvnmvJWYohBYw0NIyd
	HXpAEdte0jExj8kZs5jcR9cJJPe3Nt4t6J47qGlAZHBy3q0pbe/tGPeyBM4NyZLGLONIBQvwAl98d
	noZEDsJH4p64F3WEZDFdeNhG6jidksrVTBzcrc9UuAcwqvWDf+ywenWLXhoGDQsijDIz4KcVcqZ6D
	+jKT9wGD+GEfvOJL1CBp+qfzT6EIs4sa/ZGG2KY5HkWKbdCtycPYWif3MSMkeGXN7jICOwc/OM2D2
	EzWi4ug748/DyYI9RseSGXEUBSRySo+F3dZsU9Km7kFzWmNqaaMZ3bCoMIqA9bZIRbinlW6EYcO1o
	Pvx7b8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waw0l-00000003OIZ-1YNg;
	Sat, 20 Jun 2026 13:45:27 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waw0g-00000003OHj-2C8z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 13:45:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c07fcdd75d3so316788566b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 06:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781963120; cv=none;
        d=google.com; s=arc-20240605;
        b=FqdQeoVrZWXECmPkUtN+rI0LPj3tD1q4BWkTvHB1jFRF1g3lyYTob/c1tmvBSuWew1
         b55lLFo97YDRqzTOi6lBnP/0ZMmshnpCXUg+1QfxfRBNiTJyF4nXqy3vCP+SL6qYNQ1p
         vLWr1l8+NZKXpL+kGvC89qxPMSgonHiapQwFpybKrZZjBjr8lKTfK556Wln+0rchGytQ
         fXjN3WKAPPCssDlw7hM7xHKqOZPnZg+fBA3X5mTv15iYv3jQL+Y359uWCB9UwUYHQp83
         GPelIDeNI2FEEd1q2IANuJ1FEQ2KTNcBXnshIXPejpJL8kc+zZtBhhMNukyyxe2q4NRJ
         1wyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        fh=my3qIkBDIcovH5FbRh9+KseqqFQZU99P9nka4pBxc/U=;
        b=KeXt2wlUQX1mr1Gdh5Io7R4sHMl0ZDZL4D1sicITTJIgRxzKeYe9gTFB4fctsbymVR
         sbHOUDHka7Ezrp7ojQQRFEzo5qMaRpj8JHQMNKXQ2qiGM8AajLg0syv1f60VEW51YHcB
         MCe66JqKwgUupE2tzNnAVs+ujyG31yNaJc3XbWi65V6EEo95J18n3NedWNiAEdaZIoNF
         70aokkVcVNofWv5vmH56h0DRjQb49jf6YZlcp079m5s8CSbhN0Lk6NkbR1Ji4B32oc3j
         rx4MEzpH66V+2HN1Sa7s2iipV3NJOyegnvDM3gOeC5dzBGUAL6ngzldOc0DTlq390qaP
         pX8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781963120; x=1782567920; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        b=jHK0Ce/vVALLoZot8VP16WarT6184I9ojjQeRMGGU3v3odpTtClPxc0peJ+aGN6BGK
         N+Dtcm0BwC0yorFFLCAwz7XRegC+lQQ0XCyv8QU/7ANEBLDBomIOmUVGQQu71lLrpdQm
         1jvnAHlJTFiuEhErYAXdbIKQYigCM3jgae+TZV8yXQhsPOwuzlnVECgDuI2OF5TgaG2g
         lJjDsL+/hEYxgNjBqp2xO4kp/KsnOEp0SZPp2Mpuz97Wh2Twz+2xPKqcAC/LqiejSUTN
         dLCvO9ZQyuNy5jtU580Nlh2KLub7Y7m1Ya4L/69JV1UrdIwpSoM58mzNDJ4q10KGCH6c
         nXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781963120; x=1782567920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        b=HzVOUnG7oX2QNrI06j01xDwt9jdFyhDNCr3TVnB+DcbwZY4bxZsHtPl7zTjBOcPTHL
         U+pBBdPy9W195zeS2RL18HzxolNt6V3IBwHLrxe8pzF6lRTwFXdQXLVhcUTRn+t189ui
         n3cMTn3PKoIrtBT1GrWEl3X39P7O0/W0AnzEqF7T4srRTWGkDd3LWWoFbPqqHUCZD7UG
         pp5pdXKMtTGe9whxToaQTQ5HQ1dHxwURRbUza+0/SOgXWl/SInOUbxrrY9sovm1Z+cWf
         /8BncS4P00iLEhl/gJ4eFPcgZuCk2kqvkG1n6Hh4AcEWPOE03HrpRfDIt6MP0qo379Wy
         Xj0w==
X-Forwarded-Encrypted: i=1; AFNElJ9xEz7YmbCjZC+o0Bw/kGIS0aJ9N7CgaD84xBt2x1WMCNwiWUjvyqzi58krn+j0s3CWE4takWtAm9903JdLJPJr@lists.infradead.org
X-Gm-Message-State: AOJu0YztGpIMGJ8J+81e+zdUqIPEbcpAhS0ey0oqq6vUmyUfvb2qMAgz
	D7Jy0v0kO/dSlRMK8we35Ij6XDd/+OUbaAL6u7FKEBCyW9s3U1qqmZVSa6L+wbYi6Ghw7UMqJZa
	PAmby0883wJrTs8fwhF+hRil9HCojTe0=
X-Gm-Gg: AfdE7clPVIz8i1I4q2V/W87omuN9si1tXRcpElWEtbdzvy0DcAUse+MGpthS+ZgIB1C
	Z5AHW1bxwy5K2Czr4GWKv2zTCXg/weRZHAxBAjMzS3UR9u2mLZ75x97FLxdgB1+8idc7KudVLPe
	InZ6roPVuHWxPQuovYfTbyDylWOuDHo5h4P0UkobdiTue0jWsLm45rt00maW0a+DLeSlNQxqLyO
	fngT0L/g/Kb5eGwNGMCaIFw4xWPW15cYhGePSw8cNDb4AM3JSrGShvSUxR7d871EJD+zgnng/eC
	AF8acQ==
X-Received: by 2002:a17:907:e110:b0:c0c:63bb:f422 with SMTP id
 a640c23a62f3a-c0c63bbf546mr86176966b.43.1781963119757; Sat, 20 Jun 2026
 06:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260616074952.93076-1-doruk@0sec.ai> <20260617074123.32464-1-doruk@0sec.ai>
In-Reply-To: <20260617074123.32464-1-doruk@0sec.ai>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 20 Jun 2026 19:15:04 +0530
X-Gm-Features: AVVi8Ceek5KHZhoQI3N5eXAU25nCx3k1CHygVioQTDscbsZIHW26iKArybAPhdM
Message-ID: <CANAwSgQ0FdonxfZ8V=tPB8rBiyFj3fV-1tqJA0-RN9=AYvoBpQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work
 in stop/close path
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	hverkuil@kernel.org, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_064522_612804_4A1AE063 
X-CRM114-Status: GOOD (  26.32  )
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

Hi Doruk,

On Wed, 17 Jun 2026 at 13:11, Doruk Tan Ozturk <doruk@0sec.ai> wrote:
>
> Please drop v1 and v2 -- both are wrong, and the sashiko review was right
> about the deadlock.
>
> The underlying bug is real: vdec_close() does kfree(sess) (and
> v4l2_m2m_ctx_release() frees sess->m2m_ctx) without cancelling
> sess->esparser_queue_work, whose worker dereferences sess->lock and
> sess->m2m_ctx -> UAF if it is pending/running at teardown.
>
> But cancelling on the streamoff/poweroff path can't work:
>
> 1) Deadlock. The worker takes sess->lock. For an m2m fh the ioctl core
>    takes m2m_ctx->q_lock (== sess->lock) for VIDIOC_STREAMOFF and holds it
>    across the handler, so vdec_stop_streaming() -> vdec_poweroff() already
>    runs under sess->lock; cancel_work_sync() there waits on a worker blocked
>    on that same lock.
>
> 2) Use-after-power-down. v2 also cancelled after vdec_ops->stop(), which
>    power-gates VDEC1 (__vdec_1_stop()), while the worker still reads a VDEC1
>    register (vdec_1_vififo_level() -> VLD_MEM_VIFIFO_LEVEL).
>
> The only deadlock-free point I see is vdec_close() (the ->release fop, not
> under sess->lock), cancelling before v4l2_m2m_ctx_release() -- but that
> still leaves the threaded VDEC ISR (amvdec_dst_buf_done() ->
> schedule_work()) able to re-arm the worker, and there are adjacent teardown
> issues (esparser_isr() vs the dos_parser_clk disable;
> vdec_decoder_cmd()/esparser_queue_eos() without sess->lock).
>
> I don't have Meson hardware to validate a corrected fix. Is a
> vdec_close()-only cancel (plus quiescing the VDEC IRQ outside sess->lock)
> the direction you'd want, or would you rather take it given the HW testing
> and the surrounding teardown concerns?
>
Actually, I've been working on this issue for a while and have made a few
changes. I really like your approach, so I'd like to integrate
it alongside my cleanup changes. It should solve this issue.

diff --git a/drivers/staging/media/meson/vdec/esparser.c
b/drivers/staging/media/meson/vdec/esparser.c
index 4632346f04a9..c5b909c6a2b7 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -375,6 +375,9 @@ void esparser_queue_all_src(struct work_struct *work)
        struct amvdec_session *sess =
                container_of(work, struct amvdec_session, esparser_queue_work);

+       if (READ_ONCE(sess->should_stop))
+               return;
+
        mutex_lock(&sess->lock);
        v4l2_m2m_for_each_src_buf_safe(sess->m2m_ctx, buf, n) {
                if (sess->should_stop)
diff --git a/drivers/staging/media/meson/vdec/vdec.c
b/drivers/staging/media/meson/vdec/vdec.c
index 51ea7beef811..de3a660d22b1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -448,6 +448,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
        enum amvdec_status old_status;
        bool full_cleanup = false;

+       sess->should_stop = 1;
+       cancel_work_sync(&sess->esparser_queue_work);
+
        /*
         * Secure the hardware lock for the ENTIRE state evaluation
         * sequence to block concurrent start_streaming() callers.
@@ -1000,6 +1003,9 @@ static int vdec_close(struct file *file)
 {
        struct amvdec_session *sess = file_to_amvdec_session(file);

+       sess->should_stop = 1;
+       cancel_work_sync(&sess->esparser_queue_work);
+
        if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
                kthread_stop(sess->recycle_thread);
                sess->recycle_thread = NULL;

> Doruk
>
Thanks
-Anand
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

