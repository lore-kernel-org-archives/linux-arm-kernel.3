Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B14C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cmEd88xf+2l2ruWrORJ5dbUfpxyjcxhWXUHf6Cknms=; b=XpEJ7oEVmdcMyvv9hMgsBMPE2z
	soE2uBDN1T2LIUuPwKxi7Uqud+BFvwprKlf4WM5mcOOoh4MQnRJC90pLxptneoqRpB7GYAvcZJJNQ
	7fpoIdSjLrXBEFmX/xd8HkRXXci3/MG4TnGdfG+K0Ig7n2OyA/uuqr8o+qMnlXTBlEPz8iYcpw/il
	JzKTIKsGIZEQbFaXsJjnyfCJ4UcnHcLSHsGewhUw0EStc7uksKH/hLVejuQ73/5AP6aqPELArVgAg
	C/EaRRa9886lhPeX9ZacJ1piMTomiiYXRdUOEO2FjZMinuFcH7Dfy6/5Ya4ygwtfHeCOHcLJNIIPb
	a8s21NsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirIz-00000007L81-29oI;
	Sun, 12 Jul 2026 10:21:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirIs-00000007L34-3oMn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:20:56 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so1454890f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851653; x=1784456453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cmEd88xf+2l2ruWrORJ5dbUfpxyjcxhWXUHf6Cknms=;
        b=uzSrJhzafzfBAhxtpPwl0Obz8iACv0MS9m/NbCicI2gZwYtn2zP2Fa9zGBEdbX778b
         gQSLop5ElkdIq9ZxZasJIryFtiwxFZfBhfIhk6qygmPzOepkK5Oz84kbGv7os1sIL2an
         IGKYYIuuYzyQQJhaHJSGfiKuuSVm7wDjRemZVQhpYWFHtac6sQ9Zn9AIRi+ZVhqN1gwI
         6TQ254ziG15Q+JZ5LafFycG3jR0LjXqiekSwJ/RHic0R1pSPCqzwJ5fHq25MD2l3Vvws
         XBFK+BX+A+yR2lGUt+qMe19SfYdok9NYrRQOgS3fOZl3BgY7mmlFQ9b5gTjy8LAL26ZP
         A+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851653; x=1784456453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cmEd88xf+2l2ruWrORJ5dbUfpxyjcxhWXUHf6Cknms=;
        b=DmoetRsI87qKEE7MkQe+BFAaTfPOxk8Tz3XzvLUOXudtBIZUaPfmuy8S2nYu4KrSGe
         XpNDRz+x/ArLfgTn7QWvcTe9VCMT81bWdOCADxVmd4vaX84Vfthx3VVYij36dEKwt3zW
         Y8nhqHJeYW5fMY7pT3kUeoVlVmBksodOeKN5jEkKK2YA7D/vNO2mXmc+LUoDKc/Ae+YU
         GpiMt2f8y8oAG2FKU9l3sUGr6uCd8fAUZsv0wPYXWime78p9c4P7k+9rHnJIzAWsBcy6
         10ABcYnVckGEaHiADzIzC4WCDBXxC9UC9y5OBhculMuPXExD3gsn0+99d6dJyVzYVecQ
         zYUA==
X-Forwarded-Encrypted: i=1; AHgh+RphkwagBnmURWd3vfDCytadY/gLDfs6M+OFJhFZ5nUuvFjtA4HPBDQcLQCTpfZcJFHNjl7oTJaYdBE7FOnJ7OPW@lists.infradead.org
X-Gm-Message-State: AOJu0YxISIf0QvttcWuivppHT04+WwvkqCSNsSHSTL7EeJOcfgKR0y/h
	z0a/nbXMsc4/qaUyIl1eYwLqnz0ase5wRboxIujHQtLV0TDpNGeE1Ay1tXDXXpX3nm8=
X-Gm-Gg: AfdE7ck2g3FpWfgGAYt/U86SlQBJP8yx4Hkh3cyXjh6EsYMmjyBUrknKTtTyKonNf9s
	e5qLPANmFgclWxy2Y4ZgIUcZRtgxB6E1IK8Lc4pU8Iyge9YjHDnmJlYAJGNzw1UrbMbv3KUnLkP
	VARcJeEYJhVUSieCTAcTy4Ma1NWPVx9ZyTsbYVQIv4xbcX02rvBehqu+APXHqDixmxrrNdInvLh
	HP1C2FEWUWyrFeCj0EswdZiXo+M90jCCAzNn/goNJq578z4COhnbpkwyTZ/VQzOhLxTJHHIeKLP
	keS8N9tR+t09HufaJyE9xylxbsw0c0Tx0NNj/3NUCWu/E+3j8vfCC8x7iyUADYeUGasxuXc+LYK
	5MV045x0Pytn5JMqci0x70TExhkZBJDwu8VXsNW6A6zREkCcJCKBJrjy/cG+FZghyDQRtER3JHu
	q96hLDAIG0hYJBpyNjHfDN72QHTCfnpg7Mmf5Lw0eHbD69Hc5RxUNCkuA8eITahKMoPMnJVPQax
	iLSN7lCUTbECWUPHvD+CiWN7vCS
X-Received: by 2002:a05:6000:26c7:b0:47f:250f:7210 with SMTP id ffacd0b85a97d-47f2dce6d0bmr5100042f8f.49.1783851652901;
        Sun, 12 Jul 2026 03:20:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:52 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:34 +0100
Subject: [PATCH v3 3/6] printk: remove BOOT_PRINTK_DELAY config option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-3-574547b8f71b@thegoodpenguin.co.uk>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
In-Reply-To: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851647; l=3877;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=sFOAnCZDwHdC19ns4aSgMCtOItVvq2/+tYcVxQatFt0=;
 b=JKb1iOGr9kGtjxMDMvrvtANAc8vp0NlTGXG0rX2XOwciPJR5PpOP2CekRiXUGIAQ8Y8GlldxR
 Dq43rpx2y6RBA5c1bioF14CFC9NgxihKT+Osu3Zk9ZrVt16Z7X8I6Ch
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_032054_979914_2A3C47AE 
X-CRM114-Status: GOOD (  20.82  )
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
index 8be562c9be277670ba3209ed1f810fc87175848a..28e6dff2faa7d4294c1b2ebe2844ce5d4dc0e05a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1289,7 +1289,7 @@ static bool suppress_message_printing(int level)
 	return (level >= console_loglevel && !ignore_loglevel);
 }
 
-#ifdef CONFIG_BOOT_PRINTK_DELAY
+#ifdef CONFIG_GENERIC_CALIBRATE_DELAY
 
 static unsigned int boot_delay; /* msecs delay after each printk during bootup */
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


