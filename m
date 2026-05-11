Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C8DCD484C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s42sCXaEIYI2iT8o/2WjdzJavucMWxgVZFV2JYX3rF8=; b=UFHzIXGfrDWls3G5GBMYgicqJk
	gwJBr6Sj2IcNVPRJPjiikUZW2GdMOyyXSEOMj/EW8GdNgXrIaY81uYt4CJU/3y/tHe0ePtVqVV+zP
	fBD9z0d3tB3Sv6T7BpKT+eeHu86kUaRRfekH5s6botxWhjedK61D3Jyc3xG2Pp1IWMAOuZa4vPOfq
	OSdgXOIOkGoPr104QmOmOTmOrRO2GJgSWVvSTGh83O4A0ZqLBUZbXeqV95MUU8FbE0ATwO3MiMbxZ
	CO4j6gwEgiREZNB5BI1GOy2Y0gijuJVWNr152JN8We9zGOjYgkrFz9S7LTAC9oCkvMiJI+i8riPdM
	SrruOG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUB3-0000000EJtw-2uuK;
	Mon, 11 May 2026 17:12:21 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUB0-0000000EJrx-0FYS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:12:19 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3942e9977a5so7128951fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519536; x=1779124336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s42sCXaEIYI2iT8o/2WjdzJavucMWxgVZFV2JYX3rF8=;
        b=F8y1WD+O+ptCv7gMJECpSAwmx67OP9Hhoud0+8WehKmW0hYC8pO9KK7RsW/80mJEyw
         8FQcm/5AA4p8pYGYs82jxs47R+ZQCFgHhkMtuX96jIjcavhFJH7A/M6Wv8ONyuUhshpX
         wHM8Pif8tT//UxkGgicovhFDCzb+MrbkAso//wDNbL+oHsJ59GNIERzkh0pB1H9YRt4/
         oCdY1BpZ5v+HD8JqBR4FYEFuqUwub2Ct10M7Zdk51N2YqW3zRzZMzZ7pnHICjthB4neX
         mnSoC7E0fngxV8Pv5yqqZV6CwKhqHCsNy3OH0Ke+NPcfExt9ZPvPE0Lior0G1NEok9Dz
         T2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519536; x=1779124336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s42sCXaEIYI2iT8o/2WjdzJavucMWxgVZFV2JYX3rF8=;
        b=QmJmsJYHOSbuHF4cG2dh80+w98RHlFooB5frNOvGd/yARsF6wFdtAt+bQgxF7oAEcD
         2sxCRxhcp1AEJbw+h5N6yUL3N2TSAUE7GbJ6ohCL3JnN+XGgyJG1LU1tpmGfjtj+5pmt
         fYQ5TSzxriCLXqB+EqlatjxqcwfV9/hAfRgLZBAkcderg6Rbj16wrrMcC9P7rGYnc6ya
         SlWs+0ALGX03h7Miwz5MWonZvHQkrq5fZDf9yqGB7/FdqZyCDOePVtKgqfjnuX+rISRD
         fWiS2W5py/U9tHrZ0ST0YuVep0uqVXrdlsYe2eUAJxTuWXCM0Cx2TTWOvzIGHvAzHecM
         xdKw==
X-Forwarded-Encrypted: i=1; AFNElJ8AlQvu3WYbIfjtgZfQ65D6VeQDUS/KEA30U5PNqSE1kka5ZpQa1Sg/fo2tSfR911FUsObHl4ive5eLsdJ51fQA@lists.infradead.org
X-Gm-Message-State: AOJu0YzAgWuQnlJ+p+qIb/Z1bOA4iUqHKpUUbRgc3H6ARbsRjmbgusTQ
	c4McWfDLXgOuYZpulPl2QQi3GGm/6YWI052j586NTWR46O59P9/jIw+EFV1j6Wa0oJ8oCbx9Y6Y
	=
X-Gm-Gg: Acq92OFwDV/j92bGzulJ4AiRNaoyjN3viEoF+Zs7l9IgRHr9d73OWqA1uGX7ZTZMDRC
	r9UGQJzU+uJcLq7C8Wu15G9GZz6+l8n/ATedDVXBUQtLu20n7XcPP1pzLN5/IFZt79K1rhQ47px
	hP5N2k0oVLtXqHVLu8nzvdJsSy/dcf575GbUEG9VVUubObgz422ebktnq2IGEcMNEpkrBt9PN6z
	Dq9iX2vXA9GLneQWbM4isErSwk0ix5v3FOZiWV/bgA6QLYKNiYpVMBC7ebUCA56MLZj6cAngQsm
	IIlxlhD1S3z5B8aUA+HHwgJODlWrVI/hY6wYXEq4iGeBa7pN+4u1weNXVKEx74r/vuVTWgEVbjb
	JxyQhuzzYDl/hdqtGtMKScX2VBbFNZkrOXUMxhofrUqRUIswfV5RtmFumOL6wHvzwUUzAL/ULt3
	YDuSUZwnhsCfe7ngYMAw18U9T9gyUGb0UO89CjCsnmAEG6iShZ9tHyL+3HMubs6M8L7s0B708=
X-Received: by 2002:a05:6512:a8c:b0:5a8:99dd:1648 with SMTP id 2adb3069b0e04-5a8e0c8c320mr110927e87.0.1778519535453;
        Mon, 11 May 2026 10:12:15 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:15 -0700 (PDT)
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
Subject: [PATCH 1/6] media: airspy: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:06 +0300
Message-ID: <649601988189f031670215cb35add5e80439559d.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_101218_220698_2A02A54D 
X-CRM114-Status: GOOD (  11.52  )
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

airspy_start_streaming() returned -ENODEV early when the USB device had
been disconnected (s->udev == NULL) without returning any buffers that
buf_queue() had already accepted.  Take v4l2_lock first and jump to the
existing err_clear_bit label, which already drains s->queued_bufs via
vb2_buffer_done(..., VB2_BUF_STATE_QUEUED) before unlocking.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 634fe5033951 ("[media] airspy: AirSpy SDR driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/airspy/airspy.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 8f6b721ba107..57edb42463e8 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -522,11 +522,13 @@ static int airspy_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(s->dev, "\n");
 
-	if (!s->udev)
-		return -ENODEV;
-
 	mutex_lock(&s->v4l2_lock);
 
+	if (!s->udev) {
+		ret = -ENODEV;
+		goto err_clear_bit;
+	}
+
 	s->sequence = 0;
 
 	set_bit(POWER_ON, &s->flags);
-- 
2.51.0


