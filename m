Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D6FCD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 23:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlnkV007FI48mXpf+dStqCmocIvL2i8BzMwzQ0j9H8A=; b=CRzJCwcbgpr6dKxc5stogFOLBF
	ZxGPusPig7jY1vyTuPlVoxfX9uv4FhfeISjnISPPWqgoGuawsKSJPttu0KcaoeCFe7E0uzhB1JVh5
	3oY0lK/5WPxkApTdfVF9gDmkDT0mCQh+UWCYvcjn5kqSGSRHtMqWYtu2m1iurlbJeMWkFd64sUTwe
	RxbXG4eP5zjE8k9So8rPCRWvaQydHaGy6CwYs0b7hNUsci/eFWClezqZRDvLtqIPtetlncaQgBAAN
	ZXNAgQs5pe3ZbVT/PXDW2n3TMm9fWwk8CKNPPWT/PQhdb9Ln4ZP5fx6XfS8TU4hvi/WIOiA2SgoA9
	j/t2lfIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpPw-00000009wmd-1tak;
	Sun, 31 May 2026 23:18:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpPp-00000009wic-1t9i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 23:17:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490a765d410so8695715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 16:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1780269475; x=1780874275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlnkV007FI48mXpf+dStqCmocIvL2i8BzMwzQ0j9H8A=;
        b=zVrRt5MzAOIsue5nEqt5zYkdfkRXtG5qwGWlRNrMEbZD/zUJEVVBIYYuwvqdxmfJ98
         aoRqZLn/EKQrmuSGqvVf0kZYNusUxYQdf3VC3u2jz4YcQY+vFcgWEHZNJBEHw4oVnNj1
         ebWLOO0Cv2nttcSJmZTiBWC/mgTS/l9eP+V5gQAQDmz38LGhLgsaqADHXOasq0o2n29n
         YGDnPbhFiNEba/9qGOFwf5RJcsPOuImADw2nhlc3G8mb2yS1Q+peBRfJWWVuEKtKWsIV
         zsrmLCICDD8fwuGTwQ4QwxRdDY9KbMkYP4i8X4uhT3hDmurHLOpi/7f5w4OcDuNPpdrQ
         Fw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269475; x=1780874275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BlnkV007FI48mXpf+dStqCmocIvL2i8BzMwzQ0j9H8A=;
        b=p3aUnbrYybXPZ3tSygUD0azwF8CydTbPKFrgbT4Hs2wCSnXqcIyaUKOpxa/XrfURx0
         OmXtVwtIs3EzyJgO/ewvk1C60av+nAGQnPq6i5xx0YWJGb+40+jDdr4yQ8UE/Mjhc5nG
         qOq9fwqqESOyypGWCEUlUaG8HTaQIX7F6qQcHqznYnlBXgOH1fT0+Hn46pL6pYxvZ8W8
         ErXLK46C7tew1foKS35nlow6S09/ExoFmpPcH+D/mzpcvXuZ3BAcWvbjhJqXap0kOBdw
         xo9C42hQSKeG5+/Bxrp2DtmoeneUaIWlXMFCfddBAjYnPovTFfYzjUrwFJAT7XvQmOjH
         eHvg==
X-Forwarded-Encrypted: i=1; AFNElJ90r1j96gpX+8MZYsN27o6RbC8Rcv/9m4F1oJGfuqN6bJqYYVQ2JkoL0KsTVPYBAFKlbrfA6sFONzwa2FsqZVqD@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ3GOazKE644PF0vK5aCKzLB6tvSho2/fayNR2/CAP/zNp7YiH
	eObcYX8/vBpxF6UlrbDSYahcCH6fVeAzqEFxMPUmaFR0ioTrkcmDxgwEq8gD4WrrkoY=
X-Gm-Gg: Acq92OFU9CbiDIFSIsGmzXZJfysT5+GHB30AXJJHWYi1b6jPDIMfhA7ez4r5qHCp10s
	v3A5ZAO5asuFZul22B54IaTPbyNEHsdK85BKFkuEAfeecyC8/8fRiDtk4JZxAQB3cR0PI3Fihiu
	Ebtpt8LdU2FJWmRB7guQaQnylduKnzQe/EjIaKvwKQgB3l2s/4jRyQxBI+oGWn309vHsfBDQ7Bo
	jHbcbf+Yw+RKSzGdMgVkRWmdoM0/vxGQufAAxi3ROwaPK/6QwbLQtG76CrQwOb2Eqa31qy9hFBb
	R/BTNtSevIzHMstnY4WHeraKHMB2hf4yA5XLX88Cm9hcmg4+K31hgGzKJhJoeQABGRrHn9jVUmD
	EdeFGAxlt/nU2cqgIy69S+jDV4F8lyU/xCJ94k9BY2F/jLnSQwmR8eFLMBeap/wLdMJwgXe+3f7
	rA/GtjrDY+XEPptYc7vnhA/VQ33be50agtOrZQngRmEgCZSC2ZACDUaVg0yKMDwW6YSkG4+0j5K
	s2tkBNguqQoPNwIn7wR5Ja4vOD+dUocKGDRNszFsJJ4MOCTEA==
X-Received: by 2002:a5d:534c:0:b0:45e:73a5:e1ed with SMTP id ffacd0b85a97d-45ef6b5b858mr11489190f8f.27.1780269475497;
        Sun, 31 May 2026 16:17:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm20496544f8f.11.2026.05.31.16.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:17:53 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 01 Jun 2026 00:17:37 +0100
Subject: [PATCH RFC 1/4] printk: remove BOOT_PRINTK_DELAY config option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-deprecate_boot_delay-v1-1-c34c187142a6@thegoodpenguin.co.uk>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
In-Reply-To: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
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
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780269471; l=3823;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=5TSr29LSwGDXLwLvDWzxI5WHv1bELD/GcXyz7uzulhE=;
 b=RpHQjnwPlCMM2VtepAdORdFkPWqzLeIfyeSmjtS5aPXoHK3GX0Pi3LUQVR56kW6L6eodrkBg2
 zCSx9+ttsm9BHv7/kQjLkxfOiOnRPICyMwRxfmblDJUyamhDHIP9DWi
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_161757_508526_82D5E8C8 
X-CRM114-Status: GOOD (  20.26  )
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

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/arm/configs/bcm2835_defconfig              |  1 -
 kernel/printk/printk.c                          |  2 +-
 lib/Kconfig.debug                               | 18 ------------------
 4 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 97007f4f69d4e8f19acaff81c9af8421a09822bf..37b618d176f1c499f457f0d8b5679c29ee7ab177 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -656,7 +656,7 @@ Kernel parameters
 
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
index 0323149548f6a4dbcdd80029478b809d44de9b62..822fcdff7b21ac00cfa655c3d9b4de2698fcb7d8 100644
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
index 8ff5adcfe1e0a2f13893c92c3b95498fedb83855..fa82d76e7de45e05e5c0d578eaa2e5807bca39d1 100644
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


