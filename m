Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7534CCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TypizH+0naDcsiSshXyXpAX6OorxUGA4/sCVC58lq0U=; b=E9KqT2xHYqfw8rQ0MQksTyK7O2
	CRKn7JvRR/WHQLXx/ddRZJYyl7qgEjNdJdGk3swIUQ7OzNcRMtKXjxw+xWCcWHTe7e3HT3IaIJCQC
	baB3H1IPD3RxOhNnk/M1J9dvk97i17/oeFAmj8zzcwgMyQXAi5b/8COdQ/RPSV8GI3Ro5Yk+SdjgD
	/GLgY60e/fhpnQordWjaD/xIMQ1Bgnp5qO5h7GlpZl7ej4rMnp8v5NStiHAYpSeB9h9jJmqnnGxwk
	RPry5SzVNi45fV6elxZKZR5Wq0RPvHZ8OjbhV769RI7NwGDHrz4Qj0fIj3g/QpYQj8mp3Zez/az6U
	V/cUcJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUB9-0000000EJy8-1tzh;
	Mon, 11 May 2026 17:12:27 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUB5-0000000EJuu-1sAl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:12:24 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a860667fabso4136234e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519542; x=1779124342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TypizH+0naDcsiSshXyXpAX6OorxUGA4/sCVC58lq0U=;
        b=HZZAdTdP7gbjKqsIv2wRtpGmMukqMLOotVWsX7lvmpBCHiEKum8nXNY+xd+Fw8xLkX
         j5cr+J94WIaL0WvaRdHnljH33HhOksoLytgL4A6zJEZY3Xgec42H/NAikayCg9B6sdgD
         XOAi24vTN99Tfd8OpyDYPftdJmGNA7mVl2KJ7DODeMrER489FyBKrgUv/D+9rPPlPH45
         9sM0ig71zC9P3oU1bPPItBDpJFmEa2DhpPy7KNwXLa7YyeuqSUHIZPh08/OcNiOi2b2Z
         k/E5+eOIrAeJtrOBAu2nejldy9TY6UKuu96uBv/kcQ9miMOKNrZTtYR5BVbTy6G4Nozo
         k5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519542; x=1779124342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TypizH+0naDcsiSshXyXpAX6OorxUGA4/sCVC58lq0U=;
        b=mnTZ0rL7Etb9/NPQMFLdXnlilkPmalplMc+AuX/XSlFq0c8Dqa6jlMD8OHABr2WSbM
         V8LxetUWZP3SgIcx/JaAf2P3PnY/PK/xf/0gCpMWRW9qtOrmax8aWA7V6LUZSweYlYAJ
         M83QLXevd/bWwDvdG4KK78Twt/8ZheKC7AaxrJUFZaqSxtreStaoPlS5aR6uJSjqNyc5
         yzmSQgNLBgiW6t02h49dYavOqjaQQq/scDe5PLWoHQh3B+fStbttK10qfurZ4O9H+GvM
         xADnFqfc3u+DTxmpR8LjbLGYt1PkokLjeWsF6rpEkhvF2VAErNUYpxoHxDyP+33T3ZRo
         n37g==
X-Forwarded-Encrypted: i=1; AFNElJ+SsVltT01aM4r+LpS8CLN6P6CPSrSmOoLRQNpQKjLgKcQVYUY3PyRviWp5DJUjWobXkjVgP8EFOO5GLIxaV9ml@lists.infradead.org
X-Gm-Message-State: AOJu0YxrcaNf1X5x2uirdixohw+gIaewoZmzB4hgaa21q7jhBeuiFI/a
	F7naaXl/wGuAs//0/HO5LqIrX+5+PNHk4TKCoXqtrdMQtB+JQu9k7/qx
X-Gm-Gg: Acq92OH5MtIy8xSmX/GRDPBrn4yBlTEWyR3fjZLy1PPOOSCdiAjqWDm8Fyt6xYkKAST
	6s2GV9c/36VRNSv/47mGe1d33R5AyJcNPSTD+dJLYMngY5NMeNiyTYtuSJRfZQb2EfjfxVx46oZ
	gSCaTItFMHJlVX/T0f8K5oJ+dVofPq/6AODhu29zeX+OvQPT/4zIHlltpW6q5Ea3ua5m6rTOPCJ
	u0LnowRhtXT1NNdt4gFQxTTchvyqrbg9RWe7OxWfJJR8BOGZSvNFl/R1OEA+sKihVCxkyo8HQHo
	5wUROXyUAzfMI/F0Czy2g8pnK9yMum4LqoKlCkJDN/jiD4rq6kA/aBysB/hBrwXo005s+MOZVcd
	LfiKkPxYXJ/UYGRQerZGADSh2mZsnH3jhA6BWiR2HmOcNdnkdxaP0p/GScNOEPC9LZHn2bi2tVF
	XNlqJrdR8OKy6C3hTYYmeq3owX7CrPkq+LhoJSBoc4zOAoUZpqyBFCUDlt8MKjmqct1JNfJa8=
X-Received: by 2002:a05:6512:b20:b0:5a3:fe60:471c with SMTP id 2adb3069b0e04-5a8a94a8fcfmr4465968e87.16.1778519541397;
        Mon, 11 May 2026 10:12:21 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:20 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	hansg@kernel.org,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	sakari.ailus@linux.intel.com,
	mripard@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/6] media: rtl2832_sdr: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:09 +0300
Message-ID: <d10ab7f1bb6b4ee1760967f1957191a341b08354.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_101223_561291_9CB3BEB3 
X-CRM114-Status: GOOD (  14.75  )
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

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming().  If start_streaming() returns an error
without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count) and the queued
buffers leak.

rtl2832_sdr_start_streaming() had multiple error paths that hit this
trap: two direct early returns (-ENODEV, -ERESTARTSYS), plus six
`goto err` paths covering subdev s_power, tuner setup, ADC setup,
stream-buffer allocation, urb allocation, and urb submission failures.
None of them returned the queued buffers.

The original function had no distinct success exit and fell straight
through into the err label, which previously only did mutex_unlock and
"return ret".  Adding queued-buffer cleanup at err must therefore be
paired with an explicit success return; otherwise every successful
start would also drain the buffer queue and kill streaming.  Add that
success return, then add rtl2832_sdr_cleanup_queued_bufs() at the err
label and before each early return.

The cleanup helper takes a vb2_buffer_state argument so that the
start_streaming error paths can pass VB2_BUF_STATE_QUEUED (as
expected by userspace on start_streaming failure) while stop_streaming
keeps its existing VB2_BUF_STATE_ERROR semantics.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

The err label still does not roll back power_ctrl(), frontend_ctrl(),
the POWER_ON flag, or stream/URB allocations that may have happened
before the failing step.  Those are pre-existing leaks of a different
class and are not addressed here.

Fixes: 771138920eaf ("[media] rtl2832_sdr: Realtek RTL2832 SDR driver module")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 422d1a7b5456..c564485e3bbb 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -399,7 +399,8 @@ static int rtl2832_sdr_alloc_urbs(struct rtl2832_sdr_dev *dev)
 }
 
 /* Must be called with vb_queue_lock hold */
-static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev)
+static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev,
+					    enum vb2_buffer_state state)
 {
 	struct platform_device *pdev = dev->pdev;
 	unsigned long flags;
@@ -413,7 +414,7 @@ static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev)
 		buf = list_entry(dev->queued_bufs.next,
 				struct rtl2832_sdr_frame_buf, list);
 		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
 	spin_unlock_irqrestore(&dev->queued_bufs_lock, flags);
 }
@@ -855,11 +856,15 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(&pdev->dev, "\n");
 
-	if (!dev->udev)
+	if (!dev->udev) {
+		rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 		return -ENODEV;
+	}
 
-	if (mutex_lock_interruptible(&dev->v4l2_lock))
+	if (mutex_lock_interruptible(&dev->v4l2_lock)) {
+		rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 		return -ERESTARTSYS;
+	}
 
 	if (d->props->power_ctrl)
 		d->props->power_ctrl(d, 1);
@@ -900,7 +905,11 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	mutex_unlock(&dev->v4l2_lock);
+	return 0;
+
 err:
+	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 	mutex_unlock(&dev->v4l2_lock);
 
 	return ret;
@@ -920,7 +929,7 @@ static void rtl2832_sdr_stop_streaming(struct vb2_queue *vq)
 	rtl2832_sdr_kill_urbs(dev);
 	rtl2832_sdr_free_urbs(dev);
 	rtl2832_sdr_free_stream_bufs(dev);
-	rtl2832_sdr_cleanup_queued_bufs(dev);
+	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_ERROR);
 	rtl2832_sdr_unset_adc(dev);
 
 	/* sleep tuner */
-- 
2.51.0


