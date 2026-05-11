Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0738CCD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSIxIJUh3eL2dSuA1xrUNZiqoyBIDeeVRxEk9r/yyRo=; b=5A9Wz9CB4GJT2kkGKZy5smLHPD
	gDRNqitomze7oUBTSDQoa/z/Pbx6aikJdV0qSz86cS2bn+UvQ6jXJiUJyh+ZgWEI2IUdEuYlaQfay
	nqKfHNl44m241xySTeNyS92LpAsbnwvIHYv5yOqOfqUGcMxMWXrz7W4gVgRy7D5diHkUvB4Qz5P5N
	qDao0Pg1Fq09Qnz71pr2N1u6DSMNc4Yt+uRajlwg3KItvH2zUfpEKQ9zsF6upbpH6Ix2/9CMFdjft
	UlTSYpUlfYp7hde+xV2BZKf77nCN8xMC6SNqSM3Ad4vxL27WCP8j7E7CS2D3a3emJSEy8mj0QCfkq
	WoD5hGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUB3-0000000EJuH-4AtU;
	Mon, 11 May 2026 17:12:21 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUB1-0000000EJsH-1GH2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:12:20 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so1585574e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519537; x=1779124337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSIxIJUh3eL2dSuA1xrUNZiqoyBIDeeVRxEk9r/yyRo=;
        b=YTyxXcUPEKeId1i+pBoJiLgeAoQ27zxLmQ9W+Le81aHAGkIK7kVEhRBR3T3H3iAYT5
         olGzYXCsv+rXn355yTSZsRs/zbnsKkxuKShi2sPcclHUcrtoWKFRb4e7v6ma3DbFgDUq
         kfN+G4GIBmlIKpI2TG1NH0TUfpIOb6V5pPeCA3cPJpTGpBEhUY+n7bK32D8Jo4HJyHxf
         RLUSgqrjKFecWE0R1YQz+EpOd3e64JgSxoxVJBZ2S2BqJB7fd6uRd/2rqdG37c2TgVZl
         LxXlwut+4ObdThE2RSx5zu6MhUKk/tL+zpl7o0iVLUiF78gIlBvjJcJE9b36G7AEtMSM
         2RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519537; x=1779124337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSIxIJUh3eL2dSuA1xrUNZiqoyBIDeeVRxEk9r/yyRo=;
        b=FWHYOg2JFfwo8qTMhukzQjA6wfjMIgT06WGSrKvF4n9N7H51GPkCX4gLjBgSORhDxF
         i9P/mYvzzjkRnqqc8FEhcz0WeBxyyzc/+lXxtJxipIhc9PH7xpsKgX/mROTvOCkQ5yyz
         qYw3OwxP5bkytyiKbADarsXyhJpvbYUYLk72hX5cIdZ+zLo6Ze2Cwrk7U9YI6ncks0VE
         e097E/0ikhbnZX+4c7+iHGwx9I9lI6eVi2eQiqYWnNiuKnPNK5njTxgLk8TUcWWv47aJ
         G0qzym65MeAEKnJuk7tYSkrydZFRV9P1tKTJNeD5Ub87TCCTUcrM/PJKWIZ/CHosTdLq
         MKbg==
X-Forwarded-Encrypted: i=1; AFNElJ9FCxUpEklZyYxWGhU0dwD4WWxWbJ72OqJMUMmvDOtmWfGPh/31vDtWaCOvV/TqSGTHCQFQoLas445MuoP5fTlU@lists.infradead.org
X-Gm-Message-State: AOJu0YwAiyk6REu9UXKauH3nsundcXiYqsFjZh84KHPGSydpyBTxsT/e
	KMXpkQ2eQMFaCBKt8iYE+ByddcTtFzp1sqiHEzazMVMGKsPq4qds0U1p
X-Gm-Gg: Acq92OEOBCm5k5AGrFC/1RM6Zj7+CXxG8p8lBpYCI9az0Ocwg0XudmQ37LPKaziq49U
	aSGJRoy3BmXXpcU5kZjeOEEmGvvKbxB3UyUjO6fYeM0kQpSJZ6FzMJaiXEckKGLcUuglLsxgRTF
	04Vqz2vzvyqfGhF7P1PqsGUk0Ohw/GgCMx19YZjt4gpA4UMgetaVMoBlaRMHlJ2jM+KPkEsnxr2
	JXamIN4U/TzXpJ3gozIRAuG2y8GsCA6Io98i4CyROvmIRSF/pDd966e301BU3ns4oplUSyCmlk5
	0AD2RFhHgpc/+4eJwMohuGeizxXgs9m7bAOyQagG+3RDOU8sCc5SzhDdbVC6LnUAzS+aLFMxVIu
	BC9RctNVd3LIayQYJoBII9u78rSD1R6tbIk0RzdJDJlANcX0gPg9DSqwalgBIxgU9C+VDuM3QDZ
	RmsFGE7IUG2eRD1xK3oIzwWOTyIArfiOoG8a2I1h9caOQ+WSpM2wc54bTB1K8c
X-Received: by 2002:a05:6512:3ca1:b0:5a8:7be1:24c8 with SMTP id 2adb3069b0e04-5a887ceaa65mr9581194e87.37.1778519537055;
        Mon, 11 May 2026 10:12:17 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:16 -0700 (PDT)
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
Subject: [PATCH 2/6] media: msi2500: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:07 +0300
Message-ID: <e3052e648c898900582b7bebb6890ff4042100c0.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_101219_369614_D153DA8E 
X-CRM114-Status: GOOD (  16.85  )
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

msi2500_start_streaming() had five error paths that all hit this trap
and were further tangled by ret-overwriting between calls:

  - -ENODEV when the USB device was already disconnected
  - -ERESTARTSYS when mutex_lock_interruptible() was interrupted
  - msi2500_set_usb_adc() failure: ret was silently overwritten by
    the next call (msi2500_isoc_init), so the error was lost entirely
  - msi2500_isoc_init() failure: cleanup_queued_bufs was called, but
    the function then fell through to msi2500_ctrl_msg() and again
    masked the original error by overwriting ret
  - msi2500_ctrl_msg(CMD_START_STREAMING) failure: no cleanup at all,
    leaving isoc URBs submitted with no way for the driver to consume
    them

Consolidate the error paths into a small goto chain.  Every failure
now stops the function, drains the queued-buffer list, and returns
the real error code.  The ctrl_msg failure path also rolls back the
preceding msi2500_isoc_init() via msi2500_isoc_cleanup() before
unlocking and draining.

The cleanup helper takes a vb2_buffer_state argument so that the
start_streaming error paths can pass VB2_BUF_STATE_QUEUED (as
expected by userspace on start_streaming failure) while stop_streaming
keeps its existing VB2_BUF_STATE_ERROR semantics.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 977e444f59ad ("[media] Mirics MSi3101 SDR Dongle driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/msi2500/msi2500.c | 32 +++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 1ff98956b680..0614087c3c3c 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -541,7 +541,8 @@ static int msi2500_isoc_init(struct msi2500_dev *dev)
 }
 
 /* Must be called with vb_queue_lock hold */
-static void msi2500_cleanup_queued_bufs(struct msi2500_dev *dev)
+static void msi2500_cleanup_queued_bufs(struct msi2500_dev *dev,
+					enum vb2_buffer_state state)
 {
 	unsigned long flags;
 
@@ -554,7 +555,7 @@ static void msi2500_cleanup_queued_bufs(struct msi2500_dev *dev)
 		buf = list_entry(dev->queued_bufs.next,
 				 struct msi2500_frame_buf, list);
 		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
 	spin_unlock_irqrestore(&dev->queued_bufs_lock, flags);
 }
@@ -830,25 +831,40 @@ static int msi2500_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(dev->dev, "\n");
 
-	if (!dev->udev)
-		return -ENODEV;
+	if (!dev->udev) {
+		ret = -ENODEV;
+		goto err_cleanup;
+	}
 
-	if (mutex_lock_interruptible(&dev->v4l2_lock))
-		return -ERESTARTSYS;
+	if (mutex_lock_interruptible(&dev->v4l2_lock)) {
+		ret = -ERESTARTSYS;
+		goto err_cleanup;
+	}
 
 	/* wake-up tuner */
 	v4l2_subdev_call(dev->v4l2_subdev, core, s_power, 1);
 
 	ret = msi2500_set_usb_adc(dev);
+	if (ret)
+		goto err_unlock_cleanup;
 
 	ret = msi2500_isoc_init(dev);
 	if (ret)
-		msi2500_cleanup_queued_bufs(dev);
+		goto err_unlock_cleanup;
 
 	ret = msi2500_ctrl_msg(dev, CMD_START_STREAMING, 0);
+	if (ret)
+		goto err_isoc_cleanup;
 
 	mutex_unlock(&dev->v4l2_lock);
+	return 0;
 
+err_isoc_cleanup:
+	msi2500_isoc_cleanup(dev);
+err_unlock_cleanup:
+	mutex_unlock(&dev->v4l2_lock);
+err_cleanup:
+	msi2500_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 	return ret;
 }
 
@@ -863,7 +879,7 @@ static void msi2500_stop_streaming(struct vb2_queue *vq)
 	if (dev->udev)
 		msi2500_isoc_cleanup(dev);
 
-	msi2500_cleanup_queued_bufs(dev);
+	msi2500_cleanup_queued_bufs(dev, VB2_BUF_STATE_ERROR);
 
 	/* according to tests, at least 700us delay is required  */
 	msleep(20);
-- 
2.51.0


