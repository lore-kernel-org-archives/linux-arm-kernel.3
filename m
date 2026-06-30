Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03652C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUr0KGUBOGHUMcB7KRl2iY6u1RQhl1nD/YRpGEGvCLE=; b=UKjFbcLkPQ2nkTR8CkPCubcxh5
	Y8/6wIRYFtW8BPTOdWnmBah7ckXyv4pECi/tAhIsFb6NcsLx7abNQfQ3uGU45AjyuLfUXYwyF1Jwt
	eq9U9OMX7OHPg/HN8LjQtRziiTz1/M+vbABhmJuynHujdCIbGuceL3htiHojqWqVX6hZ0rAS4WUrX
	yrlpI60BYPddxX3uLHnrN5MS74KNxtVE1A68qV4iI9pqvpo6IDDBTkBIJrxl4zQ2BowbF7n5jCwek
	cRd4nnetGIask/6/1my+MmRVAwv3QuxMhPS1YpN12REF+/HFC0F7YgWRUJvsD0TRFxibWG5B/WVhP
	NwnUCrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webRo-0000000HTzS-0aUC;
	Tue, 30 Jun 2026 16:36:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webRT-0000000HToE-2J09
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:36:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4939a809b24so31411415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1782837370; x=1783442170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUr0KGUBOGHUMcB7KRl2iY6u1RQhl1nD/YRpGEGvCLE=;
        b=AzSy6QaBs5XAN5Xk+wtD8w035H/tjL7W3ayyWwF8ABr62RoNWtRvepE3Yd7SPyhGuW
         rgH98BIPpJd7O7Ruv/SBcwg/MgNrT2fKXL94MMoq0eAsW+QwtbVOwzsvtC68rbZHIwML
         XlaptkVIjGN1sPE0FyLrVldnh4dcf0U1oDHFz4ZfUl6Lwt/GYfOc/ZWp64iWk0yXuWBe
         0MuMKMbG8wqDtcKI6mimLwYxp4M7/m1HuJlY3Z62ZzrQamgcc6H+JRr8Qjr5S9nSihxA
         GoR6gaLXC19JgoL96rua9+NnXyjlQCYZRNdr4FR/8xIVop6KmfzRHsPSIAfYmAloKNk/
         hrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837370; x=1783442170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NUr0KGUBOGHUMcB7KRl2iY6u1RQhl1nD/YRpGEGvCLE=;
        b=Vdi8VwoGFiIGo+DXpCVA9TiDVKmEvORAzxC5/nAk0Gb0Xr+57NF1ndXMGSWgDVIi1V
         qLJjou8O/NZjJAcva+C1RjafCfAvz/1M08FZ2pECIrZZ3gLfCTKw3I/HvlDn0rOdFv4V
         ZvddukxRZ7ZfaeCzkKzBP1ojVD1jW/+CA3jR12t2K7n03b5g2ZDqRSQkm5unAN97lAOg
         1jTQ2XSKqTN/thALc1XyRIFsg0ml6J0+xKokSiNj3NsNLCXVX+6El+jQM3LDf7hvY3yh
         YPKcvkFDGaV2HCa7o2SZk9p6ZnOGNQrOTd441HPHkyKL/EnF0k7mVBC5T5jRKnBumeUN
         BvaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IkniCP6A/6hSEBWm4sH7P3pblmSUqohQWIx3BXoujJ5CPKUkGyxM9Y3uSoqr5x8b2xOTQ7g2cTf0wuW4l9/TP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfx2ibNBmRDsi+ztXJedWTkifFE7zrnYyRfgs2Mcl/HrkhtYp5
	tqFCfN7ns9k2+4Y8VMpSjsiligudXTRswC7fhhA1YGcOMAqgtnhPP08Q0Ow0ZB8UXrE=
X-Gm-Gg: AfdE7ckelG39aCXphUBwEAwVt8Vi+d2QCsKleRxAz0AZ3ejngIG0UHMGOUC4X+Tl24a
	7Bps9RzmfR9QFauKZOfE7bKsstPy9WEGQ9NG55VnGjmZtI04og2WafecYOoau9AR6ePJlm0vnc0
	MsY2nw8Ev+cnOdnek0bZatRJo7f8bNnKCeq+lXUa1Qu5Yl8KXFeyCPEdT6CYRMlbfK6mfvDOZaW
	bgw2Tit57Wc4RrYZZi+yZsnYlJs0QALgtzhwmRMGoBQ4/oO9Gvzc6yI1eXW73HNfsXkdwDB9wsl
	QujIOx42XNSEUM9NXpHb3mi2S2h7TzjT1M1ltmzh4XpT4B95eeMGxlgyFDq2oPsSsNOHsSHQ6in
	RiCs4qT/oMgkMa+cPKWXgjgYXHNHDcVqlc0Lnb1QhwX0J52kkWVdVZZVhdM71dCSzVdOEwUznKI
	yLBSCc7uouqJU90RKCaIfVLqyt+R7oz2RiL/eFMzvC5XEZDfAXsqhzpNlHBIh02d05ocKUkSPgX
	4f0XEfJ4NUG7duR9gca3OIKbsmqK2xlxYy2KTc=
X-Received: by 2002:a05:600c:4f89:b0:492:3763:aeb9 with SMTP id 5b1f17b1804b1-493bda9e892mr21136745e9.21.1782837369591;
        Tue, 30 Jun 2026 09:36:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be486f52sm8452225e9.0.2026.06.30.09.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:36:08 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 30 Jun 2026 17:35:58 +0100
Subject: [PATCH v2 2/4] printk: deprecate boot_delay in favour of
 printk_delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782837365; l=4687;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=fa53dM+rpvCnSCIlkhyVqKxgkdTEtZE5kFS5Pn17HPI=;
 b=v0okkg//jb9/3sAuGQFKqBJJ4+Du6WkipeM3urzg6uNKJCrYjcqHh/QH/cIXSY1AZK/39kLw3
 eOYek5wOwMcDwMv12lHqWZwJNz+jNhR5AmRDZRbehAYwJeZ47v11Nnv
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_093613_278033_C11F1263 
X-CRM114-Status: GOOD (  21.75  )
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
additionally configured via an early kernel parameter.

Behavior change:

The delay enabled by both "boot_delay" and "printk_delay" continues
working even in SYSTEM_RUNNING state. It must be explicitly stopped
by setting printk_delay=0 via sysctl.

The delay is skipped when the message is suppressed in all system
states. It used to skipped only for the boot_delay.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 kernel/printk/printk.c | 77 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 28 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 77f53eaed13216c6c3946adabc0c8fdba6401d91..cc203327247aa4f81f55b907c66ac88f30ce6da8 100644
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
+	pr_warn("boot_delay will soon be deprecated, please use printk_delay instead\n");
+	return printk_delay_setup(str);
+}
+early_param("boot_delay", boot_delay_setup);
+
 static bool printk_time = IS_ENABLED(CONFIG_PRINTK_TIME);
 module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);
 
@@ -2117,20 +2128,30 @@ static u8 *__printk_recursion_counter(void)
 		local_irq_restore(flags);		\
 	} while (0)
 
-int printk_delay_msec __read_mostly;
+unsigned int printk_delay_msec __read_mostly;
+
+static inline void late_boot_delay_msec(void)
+{
+	unsigned int m = printk_delay_msec;
+
+	while (m--) {
+		mdelay(1);
+		touch_nmi_watchdog();
+	}
+}
 
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


