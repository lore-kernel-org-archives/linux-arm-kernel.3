Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EC7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/g3zYl79jgjqjNI27fNzLhdq4bY9YgKy83ASVS+p8JI=; b=YkTDpus+WIZ11bYQHtGk1VeVme
	/WfA5DNHKYj4hdNqyilG7Be+LG3Q2Vc4Vm+iR+vwZ24OxpAMvj0KNnwkcAiyN0UObHTN2+tEHVjjs
	hAVbfTrnVeLoQgiIttCYhqwCpc0qcZ9TvTLgSqU0WJHMBNs9fUSUitoQB8CBboN55kwkrf96wAlO9
	UKKq8/+MawhHlTehp1Pi+LGs7YjJXV7ka2DApRHtH9V17PwVcHITKSwdHA6zU7I4wMT07kekcnMAl
	1Dr5zb/+ZT3YwD7vu52WVjpef0FfFPABdwpjwSWFjhaIOYtqwT7EQA/sG8mwn0R0sIjSJLhqJY7yf
	5MRQF+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirJ4-00000007LB9-3mNE;
	Sun, 12 Jul 2026 10:21:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirIu-00000007L42-2v9F
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:20:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1271605f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851655; x=1784456455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/g3zYl79jgjqjNI27fNzLhdq4bY9YgKy83ASVS+p8JI=;
        b=g/qk2/CIl87BMyZ6oN7csKJUQ6E25e3uYcn+bYFVUee0y46y7Hdnk1Vl9W//5N4cz4
         kjyW3HJVNmo8QAkG5tCAAdjyYSfOheHzyb0psg6ua98BsZYgS6wC8ESOxi53YFTADDTd
         XiZQLghZtUaPaLMCxCEP6Xr9yBDxYqU9RnAkdX5LWR0hRY0iM5t74WV8lSKXoU1H3a/Z
         +8e3No0ur78RIlU8vSK1g8uioEd+rVKKiiwi8wmsDPvnQHHHhbjRSOWMWlMJmy24OXI9
         no2s4TTpaqjXPfyCDin4B/HtRzVxAk4iBbz9u8R8FWl3cnlxAc0UUjklqSVsVYZVgIl1
         koOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851655; x=1784456455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/g3zYl79jgjqjNI27fNzLhdq4bY9YgKy83ASVS+p8JI=;
        b=c9NeRDZ4n3xmZXugBqKN27OvrZiQeigxpwPLTTJZhFeotnelDJKUWU+990+Sc+CCZ/
         3mEFiz+mN3bTDMMXe+NGIldAuWWFoZErGZWWz8iIGOvF9J842XtZSHNF9CHtz3jT+yNV
         L7yTUumYcZGEgRmCuVj1xSecGsU6BGMBzMP8+qM7aUVDqZy74JBF/P3PFSd/FAJhEmR6
         rpJQJFzxmwlLvEX1L703P0rVUSxuxoF/ZT6nwRxEv3Vmk0E8xhKlU0mnEXHInUxJoj3H
         cN10ZX8ycAwJZPL0ap+OuYm2/l2hiIxwk0ANdmANYbRRM4iGrdBhvE5/dZ0OneNl3sge
         CXxg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6EmsGhhogNeGjd99PVx/QLhByx90xn2jLehjx7zyGqbfZ7Y2ElHkqrgj5BbTyzXE/LKZZmVaCLFLHB61lLUk0@lists.infradead.org
X-Gm-Message-State: AOJu0YzHoRtE3KFDZkoQsBFRmt+XPRbZWM+e1AfLY/qUFlraRaR1UZo5
	ko8xuQlYyQajTazgBDRvNqbK+Q2/CkHIah9ReY5l7YfmslXn5jwQs1vTFJSG/ukQ7zI=
X-Gm-Gg: AfdE7cn9gro5K3vYwZiPwKy68FfhWYJsgGeDXj2A9chYo245SHWoz4eRZ46fJR+44uH
	8dp7zXJkSsdxxvRFpC6NHLSFR+Q6IE0VzS47DM+spqY6E2VxYamruKyB+G2x6ZnhEOQZFf643tg
	Af2pCHjADsG2uWwDHVYHs0EOOqyvqNbrV9fUybmmoTQIzPnG6kSArjFNA7/dYhIYrTCxzZdpxAE
	8KmYZV7KZPhM+GSo6yMIOYnLIJdoji+aGNUvpJRkHqkhhneRfv8pmscmv0TLIB9pDTrYWm4Dw+C
	QWW4FNqyyHFx/to3tptHSPGa1jDMbHzvD076WwVF/e2fwcxAwB9MUK4D5xVYMAbE8+1hk3JhkvS
	dWLqBPitQMIcAiCZOyWhheRoz7dgqmPIU2VYtK/WYUR1Oe8MPRDgNJ0Kdfm1Nw1nXP57IrdbBIx
	6IfUDAKdTPAuRQIG5Yla6KxxxC+G0B5HORCVqguCPZC2cDuWYgbYZYOkwjGK+Xv6vgJZbfgz0SY
	fiER0AI5P3TLi8WTYsFut6B5GzQ
X-Received: by 2002:adf:f3c7:0:b0:47f:2de3:b34d with SMTP id ffacd0b85a97d-47f2de3b435mr3662291f8f.46.1783851654747;
        Sun, 12 Jul 2026 03:20:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:53 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:35 +0100
Subject: [PATCH v3 4/6] printk: deprecate boot_delay in favour of
 printk_delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-4-574547b8f71b@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851647; l=4810;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=LbQuTQZ0Pr0m3R7vmjHIVUKClw/nFOcuwqEj3p3Hj4Y=;
 b=R41m4NO6PR52KYXcKNaMGQef3mF4qMXlCyOa+etGfe9PI3pHfH2n12uQ921q9TEyV5MQ7i1Ck
 /UOSQgcFAYlAbGVI6lYGPv+gPu/l+5sphbueqDTDmrG+ar9Raust9yH
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_032056_775624_048F7847 
X-CRM114-Status: GOOD (  22.04  )
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
 kernel/printk/printk.c | 81 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 30 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 28e6dff2faa7d4294c1b2ebe2844ce5d4dc0e05a..4517266e9ca112e0dcb0163a99dd0e8d50931848 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1291,43 +1291,28 @@ static bool suppress_message_printing(int level)
 
 #ifdef CONFIG_GENERIC_CALIBRATE_DELAY
 
-static unsigned int boot_delay; /* msecs delay after each printk during bootup */
 static unsigned long long loops_per_msec;	/* based on boot_delay */
 
-static int __init boot_delay_setup(char *str)
+static void __init printk_delay_calculate(void)
 {
 	unsigned long lpj;
-	int boot_delay_val;
 
 	lpj = preset_lpj ? preset_lpj : 1000000;	/* some guess */
 	loops_per_msec = (unsigned long long)lpj / 1000 * HZ;
 
-	get_option(&str, &boot_delay_val);
-	if (boot_delay_val < 0 || boot_delay_val > 10 * 1000)
-		return 0;
-
-	boot_delay = (unsigned int)boot_delay_val;
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
@@ -1342,11 +1327,37 @@ static void boot_delay_msec(int level)
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
+	int printk_delay_val = 0;
+
+	get_option(&str, &printk_delay_val);
+	if (printk_delay_val < 0 || printk_delay_val > 10 * 1000)
+		return 0;
+
+	printk_delay_msec = (unsigned int)printk_delay_val;
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
 
@@ -2122,18 +2133,28 @@ static u8 *__printk_recursion_counter(void)
 
 unsigned int printk_delay_msec __read_mostly;
 
+static inline void late_boot_delay_msec(void)
+{
+	unsigned int m = printk_delay_msec;
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
-		unsigned int m = printk_delay_msec;
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


