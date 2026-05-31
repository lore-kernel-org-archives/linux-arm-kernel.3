Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0385CCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 23:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yw1fhfSYYqzCwDV1bdu9APNnKhaP1vTsxLW0x4AdDkE=; b=pYE1KmqDpV+l4tOJ6j6zsWSSYJ
	cTIplx4B1THd/bMUES1CLCa92GMkyAscL9Jar0bKjDys/GWs6JtpnrI+EhA+ecnfCs3LqI/9rCLjl
	zM1r3qJWCEyqBV/n8+vKE3zYNAN4FJJWXD5GimWTSsiak62N7wgmeWhs/qvP3ES4hYTKZqmHlPAwA
	AjolzC4WnWDinZ24ri2fWrRrrIY8Xt0U6a+JtO2tciXJfEoU02wzERUxnwWcpQgLZmoVHe7Uc4ohQ
	PCpsv3X5v6OOQgZ2M4aaZu1A+QMt1UyZRBAwjTxPd8NIwBK2PFVKkga98/IYmaEMFn+Nfmgcg4/tv
	LmeKzTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpPw-00000009wmt-2IcR;
	Sun, 31 May 2026 23:18:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpPq-00000009wj1-3UOG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 23:18:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4906238c62eso74786725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 16:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1780269477; x=1780874277; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yw1fhfSYYqzCwDV1bdu9APNnKhaP1vTsxLW0x4AdDkE=;
        b=vXCDTP0E193HnTyoj/xWmXN9PSYRm3gQEheAuOnZ9ywXE36nEen7zjFCpMgU+cAzb3
         0Vw8+1zHbPLvyL99/gGRygIl4ALtBRx6wh11MNUqNeuqaN8cTGL45ZOVQbAnR5sP+pUc
         qfaLuGHZ3f80MTDVhGGjUqywZHhh1SKfGrnr7nLUEKxnz40l14060oYLNTIgkpJ2ogpB
         mt4ND1ublJdn0GcgOtzVE8CxuDWDIwRjOYp0TTJg5i2CI48cyz8DSuWb7sQk3JPytcAe
         T4VS0iLzFynfp0x+YYa1HjqfjUYW9A9a4rAFGFXytmaTeDpP8w+1rZh96VqC3PJwCjDL
         Cf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269477; x=1780874277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yw1fhfSYYqzCwDV1bdu9APNnKhaP1vTsxLW0x4AdDkE=;
        b=UkbaaXJduiHStqeYEMlckg661rWhfivQDL3fhV5TvzF3DvC00RbMkxN2+PAEzTiwJi
         5vT7/u+tBtaRcBah1X83un2Yb88rGMKAj47+5+FNhIFvVWUpYvm3/7Uef0eOGGlYJQnf
         alisMfwD57itSkPIeTf1G81oJ8cffvv0he6cNHPzMfT4+ZEHbUc0robwc6G9dzAmBn6I
         9eT8aQDff2ObxlsC8AfBxJBNKgJAuKCT8aIdnEZ3wiAALxMiaFoEefgwf0qHSuDFAnvA
         ZyetaferLzYXnmGZfXzAGukBE+TmLP379jCIopyeCNbl34VrIBbMhroDOX2BCRuvyAai
         G6/g==
X-Forwarded-Encrypted: i=1; AFNElJ+C34Q6u9dZr4XPD6fZTk95gEmJtGXnAr/08KTsJpZeZWl/wFTZUUSioU1m1Bx4oueDgMH709P/CAA7/GoNGIDB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0D5+NQZhjnfqQYGaEjQ0g0cFICTlBhbEH47NIe2UgK6Eapw/b
	g+4ilZ2jVEs3g4Vmdv2sU4NkIXt/feepEJqlBCQwo9FzlvuwsaLMv2XgCFpYjQCctCI=
X-Gm-Gg: Acq92OEtirYehLlpwWHypYS5Amg835FKYDPETw64W0J87VaU8cLXIcvWM2yajnDVFIo
	BJ/dxT+RU/z+homHYKIo9TITzoBoAL4Omk427j0Yq+rEH9MVeUge2OtBc2zZcKZCQ/PQCntNM4E
	QAARtfDycdeumI0R5bY1w8W8S+T36Yx9ArvaBn5OKAsG/5kdVeiml5OPiJq4F4Zcvs5nw9rL9co
	xm277MVRb5omXRiKyqFaZfM0VFM+wAz3FsVA+wFFc5FC40CPh0K0cPuhbGCSOz/0Z6asPP/HYK4
	G12hnJvtKR+/JhWpFqXBS1HW5uRcGaNUwnxPZo53L6M17xNxL+fVr/MbxpFUj3NT7N2/cOxsEmW
	kksjmYBbDzcIrUkX+v3z77rE/D5h3fSL6j8nKbdcqf/lgAwQboHYauiTWoWbYOci0k4sT54iq7v
	GZ9D/r9u4HGwcM1ARl0AqCXMUoxjH23uc6XBwv1PtshNmFJd9NQEx4qAcfCfh/PJF3XkXS6d4Td
	qvZip50kCKlmEADbxVzX1pe2sb2N9iY9dtiEzo+mdUBfVzPMg==
X-Received: by 2002:a05:600c:6558:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490a294b864mr118910765e9.28.1780269476864;
        Sun, 31 May 2026 16:17:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm20496544f8f.11.2026.05.31.16.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:17:56 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 01 Jun 2026 00:17:38 +0100
Subject: [PATCH RFC 2/4] printk: deprecate boot_delay in favour of
 printk_delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-deprecate_boot_delay-v1-2-c34c187142a6@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780269471; l=4252;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=NzyYbeRmipVDUcVFnXEzhSA5L8Fjv+M/rg5sEJLce8g=;
 b=i+GDn9CndzdObBjnvYG9EQGVKMlZ7e6Fy6BNLVupTvtxPnVqFEb/bVi2JyX2zv2+YUvaYE0j4
 OueQHamNr33BR1S1U4QUwBadcLGdUbhjHwzvBhiP9fMeOsqdMoVpSvg
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_161758_913910_DFF55670 
X-CRM114-Status: GOOD (  18.98  )
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

boot_delay provides a kernel parameter for delaying printk output from
kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
configurable only via sysctl and thus is only used post boot.

Let's deprecate the boot_delay feature in favour of printk_delay. In order
to preserve functionality, we'll also extend printk_delay such that it can
additionally configured via a kernel parameter.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 kernel/printk/printk.c | 75 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 822fcdff7b21ac00cfa655c3d9b4de2698fcb7d8..ca510b9c76458f5c1e059200060d9d6be4c859b3 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1291,40 +1291,28 @@ static bool suppress_message_printing(int level)
 
 #ifdef CONFIG_GENERIC_CALIBRATE_DELAY
 
-static int boot_delay; /* msecs delay after each printk during bootup */
 static unsigned long long loops_per_msec;	/* based on boot_delay */
 
-static int __init boot_delay_setup(char *str)
+static void __init printk_delay_calculate(void)
 {
 	unsigned long lpj;
 
 	lpj = preset_lpj ? preset_lpj : 1000000;	/* some guess */
 	loops_per_msec = (unsigned long long)lpj / 1000 * HZ;
 
-	get_option(&str, &boot_delay);
-	if (boot_delay > 10 * 1000)
-		boot_delay = 0;
-
-	pr_debug("boot_delay: %u, preset_lpj: %ld, lpj: %lu, "
+	pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
 		"HZ: %d, loops_per_msec: %llu\n",
-		boot_delay, preset_lpj, lpj, HZ, loops_per_msec);
-	return 0;
+		printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);
 }
-early_param("boot_delay", boot_delay_setup);
 
-static void boot_delay_msec(int level)
+static void early_boot_delay_msec(void)
 {
 	unsigned long long k;
 	unsigned long timeout;
-	bool suppress = !is_printk_force_console() &&
-			suppress_message_printing(level);
-
-	if ((boot_delay == 0 || system_state >= SYSTEM_RUNNING) || suppress)
-		return;
 
-	k = (unsigned long long)loops_per_msec * boot_delay;
+	k = (unsigned long long)loops_per_msec * printk_delay_msec;
 
-	timeout = jiffies + msecs_to_jiffies(boot_delay);
+	timeout = jiffies + msecs_to_jiffies(printk_delay_msec);
 	while (k) {
 		k--;
 		cpu_relax();
@@ -1339,11 +1327,34 @@ static void boot_delay_msec(int level)
 	}
 }
 #else
-static inline void boot_delay_msec(int level)
+static inline void __init printk_delay_calculate(void)
+{
+}
+
+static inline void early_boot_delay_msec(void)
 {
 }
 #endif
 
+static int __init printk_delay_setup(char *str)
+{
+	get_option(&str, &printk_delay_msec);
+	if (printk_delay_msec > 10 * 1000)
+		printk_delay_msec = 0;
+
+	printk_delay_calculate();
+
+	return 0;
+}
+early_param("printk_delay", printk_delay_setup);
+
+static int __init boot_delay_setup(char *str)
+{
+	pr_warn("boot_delay will soon be deprecated, please use printk_delay instead");
+	return printk_delay_setup(str);
+}
+early_param("boot_delay", boot_delay_setup);
+
 static bool printk_time = IS_ENABLED(CONFIG_PRINTK_TIME);
 module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);
 
@@ -2119,18 +2130,28 @@ static u8 *__printk_recursion_counter(void)
 
 int printk_delay_msec __read_mostly;
 
+static inline void late_boot_delay_msec(void)
+{
+	int m = printk_delay_msec;
+
+	while (m--) {
+		mdelay(1);
+		touch_nmi_watchdog();
+	}
+}
+
 static inline void printk_delay(int level)
 {
-	boot_delay_msec(level);
+	bool suppress = !is_printk_force_console() &&
+			suppress_message_printing(level);
 
-	if (unlikely(printk_delay_msec)) {
-		int m = printk_delay_msec;
+	if (likely(!printk_delay_msec) || suppress)
+		return;
 
-		while (m--) {
-			mdelay(1);
-			touch_nmi_watchdog();
-		}
-	}
+	if (system_state < SYSTEM_RUNNING)
+		early_boot_delay_msec();
+	else
+		late_boot_delay_msec();
 }
 
 #define CALLER_ID_MASK 0x80000000

-- 
2.34.1


