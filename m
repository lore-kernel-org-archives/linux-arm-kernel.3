Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D8FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXudV9Gg3kSdcIdzsisUUkPsE1uNKk24eiCajEsGRHQ=; b=Q9IqGQQoRd7pO9conDToHxv/pW
	p4ElEXfOwf5Qt/lDo7oeko/t/J20A5HyCSAaoSDipAh3j8gz2UUZYXNQqUOSJH4q3IpYaLAm2FiNN
	U68ZMCFKJ5td730ArLmmxYW88inNt0aYfkeqp/y0R8FwjJOV72ZnxIsUnpuOx5F1VR+OlYnsHiyQn
	lHuC1i+p5eWWPxNe4cS2JGLnmnoGiho44I2yn153CyXC1UPGjEzsf+9A+tmKErd2zF9EoPer69aCL
	c1GxwL8Q+4lJDs7epR287Bf7OipaQRIQ99jJLhey16vLNWXkMt43w5EmS+iIRNzjoxr2QUcU4nndZ
	oc28GdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webRX-0000000HTs1-1io2;
	Tue, 30 Jun 2026 16:36:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webRS-0000000HTo8-1OWJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:36:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493be364394so1116995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1782837368; x=1783442168; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXudV9Gg3kSdcIdzsisUUkPsE1uNKk24eiCajEsGRHQ=;
        b=VD8j7v9TPZs0/5qU2+z1eDLniUTMQLN7BmlTTnb/rJbFB62ixXhkL/RQPoQ96n/0e8
         qPnGenV81nQKK2ij1pKF6XXtHG27NBJHWyLnAPwDhYap23lAL1spKHNxRxGB6JjZSGy9
         Eyx6apz6svS2+yqx1Hgq4t1VpFClKu67FQI32dnkWOeDleswMXeZF15AWRcMubNjeS8Y
         uNph7svu9l7TIX3r0QpLO1Xo3RzoR9yBWwZGd76KxIJkzxbxNyetfHD9y2sF1gHFTTgm
         7gnBw0eESZ/QyWAjWBM9Y73EzcUVEwJH05C5xVYylAbDs+A5pd26AwciTSVWswu6hRO9
         kc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837368; x=1783442168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZXudV9Gg3kSdcIdzsisUUkPsE1uNKk24eiCajEsGRHQ=;
        b=YiS47dqEQ3uQpiujJ4DJ3Sm4aSkVzFyV+nnwPC4UIPJWPGT5hCOD1O4Y9s0t5AaPUX
         oO9PlJpbPcPetzfOWcZx8D0cvfgcFtA2neVhDLW5Gi8orIQRQdDHf5QN7sBuwpA/Eawl
         BkeLLeK4Ib9y3EJ7hAf9mfRa0CO6M/1J4i8HCunAOuoIhyqJMfE33YqlhWCaWjAASJjz
         qOtBZL+FBORcPtX/vRGPwY1tYyCKQQyjfry9ily5Sa8f2twuhoYrmF/rQ2C6Q6tsQn/U
         uOBTboL+gYrEHxfpQ1T2Mx41pzaIAKl+z8aCcIb1/04d+GKrh17Pq4kW4t10z2LMcgYN
         eI+w==
X-Forwarded-Encrypted: i=1; AFNElJ9PBtexo4M3EAamXSW2k0UOUOGUDZzykL3Q//T++a/HKjylUqoj7hy+jJJd5nsDnGG4bmiy/3Eu9IQpLsVvIytJ@lists.infradead.org
X-Gm-Message-State: AOJu0YysHfoRDCD9plvVRYfNQzBtFFnVa7KsFA3pVJdoIqKs6EilNc98
	DAp/OCuo9AfYULCqaPUJdhLAVCGk9bcboi8EB8PQBf49NIiqhFQBFQo57fnnuTp0m9E=
X-Gm-Gg: AfdE7cmW0Xep38Nm/yeAGhW6Al8pKdo39BMsafQWBhlNnqrcilcWjEVWONzsEfNf0rq
	cOt5ejw3JGSIQ++3YQ2gpFW5EH8HI35G0Dd8TS+IovjSqm+8nvdjDT1LO0H9uE4voYUOiAEZsVz
	MMAVUsZZw7jdGGpJkKTca0zHkPKeUwP4Jxzz9bVDOt5Roo2Jta4E77ZtJF186PcZer5t44RHxWh
	kWog5bIcvyPbaAexVrNZm9uN5XXkvgGZ/VFsv3t/1fLHvs/P9LIQJFvIMjLAEldiqtgADgljzd5
	LxCUP7b33JlJFmrh9FNIoxEk9dDrnL/qfNQjsXEiPjV0ZTdfcTfnqZFBpqhQuYkljCs4alV/oSm
	96l1oWUgXmeLEqfQUKGSTpcYS2BQcJPAlJMtxnc7Ms32BLGKT3um0TlwkL1EwAjSK/io8dk2D+6
	PD4Vn2YtZfn/9G3I3keiYKc6xq4A9bGE4eepGWrkL2bQvDaIDl1LHQ+Afbhk1dFMW617E3CRr+C
	hZTssYv6B5JA1bYRcz2ZF/1NnFa
X-Received: by 2002:a05:600c:c491:b0:493:a43d:6a2e with SMTP id 5b1f17b1804b1-493bc53486emr32913265e9.8.1782837368312;
        Tue, 30 Jun 2026 09:36:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be486f52sm8452225e9.0.2026.06.30.09.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:36:07 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 30 Jun 2026 17:35:57 +0100
Subject: [PATCH v2 1/4] printk: remove BOOT_PRINTK_DELAY config option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-deprecate_boot_delay-v2-1-f9883d36aa4b@thegoodpenguin.co.uk>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
In-Reply-To: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782837365; l=3868;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=yYoOA2lmEA/zlY9ztKWvlJHJjmdn+UKneaZgldiSEqY=;
 b=tIVy2D7qSph+SB/d2oZUbUbYo/M9aCbYpqRMKAajQJAv9Y4kMRiblxvshg3oHIsoMle9n8UXV
 3syb16Mbz+VC5jBPoJ59uagKLXQ8CWPlIC1wu/1BuvVQKicQDOc3t8k
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_093610_756080_AF3B5F3F 
X-CRM114-Status: GOOD (  20.35  )
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

The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
are two distinct mechanisms for providing similar functionality which add a
delay prior to each printed printk message.

In preparation of combining them into a single configurable feature, let's
first remove the kconfig option BOOT_PRINTK_DELAY.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/arm/configs/bcm2835_defconfig              |  1 -
 kernel/printk/printk.c                          |  2 +-
 lib/Kconfig.debug                               | 18 ------------------
 4 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22812833308b22f2cc35b0a42e55b2..2884103b93bca7b76cd3a93946276074cf62d0a1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -651,7 +651,7 @@ Kernel parameters
 
 	boot_delay=	[KNL,EARLY]
 			Milliseconds to delay each printk during boot.
-			Only works if CONFIG_BOOT_PRINTK_DELAY is enabled,
+			Only works if GENERIC_CALIBRATE_DELAY is enabled,
 			and you may also have to specify "lpj=".  Boot_delay
 			values larger than 10 seconds (10000) are assumed
 			erroneous and ignored.
diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index 4a8ac09843d73280cc42dbbf63fe3cc9f31dacd2..51a1e94d5aa6c22202778082b877a202a6b9c04d 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -174,7 +174,6 @@ CONFIG_NLS_UTF8=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
-CONFIG_BOOT_PRINTK_DELAY=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_ENABLE_MUST_CHECK is not set
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2fe9a963c823a41e7df10c29939a2abb55462859..77f53eaed13216c6c3946adabc0c8fdba6401d91 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1289,7 +1289,7 @@ static bool suppress_message_printing(int level)
 	return (level >= console_loglevel && !ignore_loglevel);
 }
 
-#ifdef CONFIG_BOOT_PRINTK_DELAY
+#ifdef CONFIG_GENERIC_CALIBRATE_DELAY
 
 static int boot_delay; /* msecs delay after each printk during bootup */
 static unsigned long long loops_per_msec;	/* based on boot_delay */
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1244dcac2294ad99fda37fa6767c9e76f16a4d14..b552ea51cd53b79cf5d58b8c4deff409b1982862 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -99,24 +99,6 @@ config MESSAGE_LOGLEVEL_DEFAULT
 	  by default. To change that, use loglevel=<x> in the kernel bootargs,
 	  or pick a different CONSOLE_LOGLEVEL_DEFAULT configuration value.
 
-config BOOT_PRINTK_DELAY
-	bool "Delay each boot printk message by N milliseconds"
-	depends on DEBUG_KERNEL && PRINTK && GENERIC_CALIBRATE_DELAY
-	help
-	  This build option allows you to read kernel boot messages
-	  by inserting a short delay after each one.  The delay is
-	  specified in milliseconds on the kernel command line,
-	  using "boot_delay=N".
-
-	  It is likely that you would also need to use "lpj=M" to preset
-	  the "loops per jiffy" value.
-	  See a previous boot log for the "lpj" value to use for your
-	  system, and then set "lpj=M" before setting "boot_delay=N".
-	  NOTE:  Using this option may adversely affect SMP systems.
-	  I.e., processors other than the first one may not boot up.
-	  BOOT_PRINTK_DELAY also may cause LOCKUP_DETECTOR to detect
-	  what it believes to be lockup conditions.
-
 config DYNAMIC_DEBUG
 	bool "Enable dynamic printk() support"
 	default n

-- 
2.34.1


