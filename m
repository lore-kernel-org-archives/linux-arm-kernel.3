Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC84CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH+u+xhzUiMSlilufXXl7nt5EV8IiDoOquYIB5049q8=; b=ahkU19dLkrYvw39N0iP4bZyWbS
	xMnuZaOtztmOzzaM1BxpbBzeyh6GU32YMdokEUyPduGg+rUw0Vq2VNTsxBd0N/DjBb04l70+eIUXR
	TaBKFqNxNgLd6L0FNmlgod5XHUzd/nxzwd0GMlKcsDoEGUnbktN1qCpUitURv6wR/11TFPmMu6OWO
	FsPrC5DTpXc8SnyEelwW8cm31JjzEkCPmzAqzcEZCR7RlambXNGf0xVnz9SActSHurbTkLqciSfjy
	qTI4pcQpzx3i/4tnlNfodWrKzKr3jXsd4xJL0GcYQMmtEItYWOFNFbWFfdAZmd6bsK398U3gtiPcK
	pyRiT5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUB9-0000000EJxs-1LAZ;
	Mon, 11 May 2026 17:12:27 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUB3-0000000EJtP-2adK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:12:22 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a887ebb416so4275853e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519540; x=1779124340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JH+u+xhzUiMSlilufXXl7nt5EV8IiDoOquYIB5049q8=;
        b=hGCLXhK1fQASGvsgDv8lZ+hfPcNPNGScpq9s62hqgVPYrspMIeYnb+fTt8K4KBQFbt
         Te18R84NCPwE6fCUmqF0dVPrHubSRExZ0hq7NeQ5ysfSmAWn0eLDH5yft/jkH1X9/Gfg
         +kZffG9gBEopiQ7iLMZ6ETF+aB3TB3E0dLB8QA733JjMWZ8X8NFbH1AmPRn5JOGt7Y8G
         /nq7plvq+zLw4Kf7UQ1/0g1G8iZl/Sns+bxFUSAvvz3FCJ8IOA0598pfSVj+6nBXSd+8
         QKOvxyaH2yC3ZzejfBgjmUiZ+NBgJmSJg6Rrdi2B+O4A/Nxv2d3kx92shkWo4DTn+FUY
         oqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519540; x=1779124340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JH+u+xhzUiMSlilufXXl7nt5EV8IiDoOquYIB5049q8=;
        b=p8lUVoHHKxSaVGLi0UBkKXJJgtnDOsFQGWHMMFecxnzXv974GKbkeAny17VR+4rmZF
         ZWp2nklGhmtMQ+HakrC3O+BWTx8QBH5zytbWOSVwRlcWI2gQkYPPniMwBw3v3c7UfwX8
         nEwkaxLubD9ZOgWQQojUw5/mRACCt9ogK7gZ1TdsW5tBHUcfOkRfZQbD7Lnn2ef+fMsC
         tWQuLshhlCQ36SppIqpNWyuYpwkavoOK14vgwdyAtCKgwtQI9qvNKQKpL1LqEl0Eruwx
         q+u4xbZMEnCDmWx6SmoBU1S0czPE8B6SMDtANnWzlBciLkpbiJJxNeLTY633/RIXjXec
         KwOw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZA6X+daKpPz/+K6XzTb5+Iwqc4PTEGsxNZw75h1dfT+8IXbKXWcht1AfirNqPK/5Jxrz2tx20TTquIdzaDpf8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx0hgqKkSinzn07Bn0erMqTGgD8G0ZbLxU+AtN4h3mFkXdg60i
	B4DHyQRYAtmzExxOj84IThcpFCtf8m88j5IffnD1fW7jrJ/oj6hR73HP
X-Gm-Gg: Acq92OERE8NAiUoYwOX57HGtdk+tubPHYBQKHq9XnZlOdp0ZU0BMIvH2pe4mX1cDXBs
	okN527icB+9aHCzqK8rnhYMH4heUcOohauve7OSDWxc59nQ10BZY/6VMG1aIsniHD2HfBWglzJz
	bJkBvRlXminSNsHw23dPIE7Dpy5hLKJKC9S+z4k4To5LWCEVleHGsGmPy2gosjudGJjiJleMhDN
	sknvEaiKai2YTHHCxkWCdBDXFzqiZxs3JC+VYcPtCx9FDxD+t3C3sa9lwdWtpgbtNOD9XhJwets
	8iiV6JylB9ptPnVCM9EvslesMTwNFl+4B4JOsEjWouM+Fxng222Q9UhR6Le4c2fS6pCShI5HLVX
	J37GlMJx+HEgKELA5BO5IPbt9IuBo18aBtcH2Vwex5umyaaSGbPVMEkTS4kHW1iorDWe+JV0FQK
	NI1dwNaLUwkT7z1ZptDeFoR88x4Ua2qFC3nKVK8kcW0i9UC4pb7KJJlmNB0rIAsB7MfRNCp3o=
X-Received: by 2002:a05:6512:3e16:b0:5a3:ff5a:d83 with SMTP id 2adb3069b0e04-5a887ae3618mr10520299e87.16.1778519539315;
        Mon, 11 May 2026 10:12:19 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:18 -0700 (PDT)
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
Subject: [PATCH 3/6] media: pwc: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:08 +0300
Message-ID: <d0fdfb94b56871e757812bfb7aa58e83f7215903.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_101221_679344_D8335405 
X-CRM114-Status: GOOD (  12.24  )
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

pwc's start_streaming() had two early returns that hit this trap:
-ENODEV when the USB device was already disconnected, and -ERESTARTSYS
when mutex_lock_interruptible() was interrupted by a signal.  Call the
existing pwc_cleanup_queued_bufs() helper with VB2_BUF_STATE_QUEUED
before returning (matching the state already used by the
pwc_isoc_init() error path in the same function).

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: ceede9fa8939 ("[media] pwc: Fix locking")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/pwc/pwc-if.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index c416e2fc5754..59b99ac8fcb6 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -710,11 +710,15 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct pwc_device *pdev = vb2_get_drv_priv(vq);
 	int r;
 
-	if (!pdev->udev)
+	if (!pdev->udev) {
+		pwc_cleanup_queued_bufs(pdev, VB2_BUF_STATE_QUEUED);
 		return -ENODEV;
+	}
 
-	if (mutex_lock_interruptible(&pdev->v4l2_lock))
+	if (mutex_lock_interruptible(&pdev->v4l2_lock)) {
+		pwc_cleanup_queued_bufs(pdev, VB2_BUF_STATE_QUEUED);
 		return -ERESTARTSYS;
+	}
 	/* Turn on camera and set LEDS on */
 	pwc_camera_power(pdev, 1);
 	pwc_set_leds(pdev, leds[0], leds[1]);
-- 
2.51.0


