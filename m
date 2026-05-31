Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D841CD6E5E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 23:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIFmAzxejQrp6RSd8J5lsgupOjIxf+PM9ArBTVLQHLA=; b=xx+R9ORzxQt3JYsORhhGGJO7aN
	PsGlO1Nbt1Zyaca0ru/tQjIuqhqrWRJwLt15f9WxfdTidzxnS2z+Gxx34f+NZDXXOhVgWk6Q29Xqa
	CLSEkJIJ35t9bXpxPF3b8TEcCzrjV9F18UPyPhCVFVu0Gux3TqjK7y43KJ/dlJ9I9hwfilMEbQ+Lk
	sEe7G1MD3zPaF97T0aqY+dJF6jkJ2VRMB8y+RvzgvNKQXOx6w1mZxfr/T26WG/7bjpRV2sAzAA0rT
	mvMkfg395IjIXTGQTFzIYA1VAqRNIuTCjeSKknIfMCO03rIgqtqUpA83ONjawv58GkX2uKHmla67O
	FkDHdN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpPw-00000009wnP-3e2X;
	Sun, 31 May 2026 23:18:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpPs-00000009wk3-2D1p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 23:18:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45eee266c6cso2326600f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 16:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1780269479; x=1780874279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIFmAzxejQrp6RSd8J5lsgupOjIxf+PM9ArBTVLQHLA=;
        b=bq5mH5mK+dyi6l5hfZEw3459eRGnwF42mIiXrZdCGj+DIgA5uRaqpTjSOL6bwYVODQ
         tpm5Nj0ON5ELPVuNHHtSSlOYwNcWMzXSsVDc51shnliTgQSYMdYjxRxFwzuOip9je/7s
         IZDDdyy0gf5HWpkyxgJ9qrRy6saZGb6RuiMJMPqFiINMwXFrTHSLemeTlWSaGYK0LOai
         vYLd1Z0Qt/cGFQ6zd1nIdwmRn3XZ1qpUnaDuJMp9mu0N/I0ghGH7vFKdSsQaRD0mpXi2
         oSc9HGzv9cP4fHDj4VNtFkp7meBKicObz7Zqyq6+mTNNMEpXCpAHfHnA+6gZ2mN3FeaK
         wMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269479; x=1780874279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OIFmAzxejQrp6RSd8J5lsgupOjIxf+PM9ArBTVLQHLA=;
        b=M566WIJTzMjE6Jrw8FRmt3ieqplhhBuDIRTR8deYiYvTb7oA94wuoDt/GlByKv/ODK
         5zyPelVR/yygM3oD3GUeHvlwxOdvC/7YYhGXIBDgsEkb5/WDN4133ZjAHkUQxZmKgC0Q
         kA7fA712ZbsEs5fAx7FoS1oEpys5ADTMF+nnMfAAkcVAdwQYho7XBFD21L4Y2k3fSIWd
         ocyqaT+F9fZJ91H6Ct4K+VvYiP1M1BlAYeYDR7cYQV+epOVD8mfJ4JoOTsqrp2+E9g2s
         AEtfCSAlNOvuo58IWjMTazK0PQxUWCM8zDWCVvSqZM+1nRgG6jRk3Wey4xBqdueeXCNF
         H+DA==
X-Forwarded-Encrypted: i=1; AFNElJ/Nd+yYf+UcIek8CVjZS8K2paen+sUES/uN6pa7pzgsQcrcpPJEnK35uFjLI1uLU0V+eLh8yE4T/QOo/ZDGe4+p@lists.infradead.org
X-Gm-Message-State: AOJu0YwRQxloN7pzwnrHXfctrMTDettDxrOkXx1VMof3RE+YVe2rxnOn
	gzCjxkhfaqhn0BuK/watY2d03Oi1URkg1Uz+eW3p+9/swtpo19lI/AUlQXw4URqCKRc=
X-Gm-Gg: Acq92OGbbqZbHJTV/9uQO7090AsjUxji9emNujqat91nX3bB4p7Ugi5csx0JNLYJFR+
	81Wl5V+ebqkyCH7iwToyoo1dWlNGGWALUw79ZgSUqAV6gnhfjycdc7ON2IMwvnNj1g4XuYKBQkL
	wc3kPWFFHHplqE/97xIZr9aXEXe3Pp7/8A4fspLRcbvlL6O/0mZMus0d09BiIeGXwPVrY3JoR/M
	o729G8CmCsscd7Nbm4YsvLV4Mrec6LZi4dfx8/tcQL5bUiCNaxkeBucpLVaKYeiTE4DruBbLwRz
	jC+FG4ww63Zk8hj9+dlkGdkxpJus6eK8DkSKDbqEayKtoYW3OgsuO/0haHD5++TQBtEo3TVJxVR
	hvqbz+P5effq2nYMfQoNHLRKiTc7MefkCBEjHVKaLOvbU5h+eB+Ls8fypmltuRkWu/Mb4gGiJRh
	g5gWhZ6V6A/Bzvrv9dFUbPkbgrsdQAoNf6N4fAlz056+WJfRQUScqHiw1wj3kHuruQ+ke1pvr/6
	Cqrbx+awOZJ6PQbP4qqX3mkydRA+MJoEqhRwa0Ym+fKCfXWxjF8DU4jcnn7
X-Received: by 2002:a5d:50ce:0:b0:45e:ec18:f207 with SMTP id ffacd0b85a97d-45ef6b58394mr13286575f8f.25.1780269478978;
        Sun, 31 May 2026 16:17:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm20496544f8f.11.2026.05.31.16.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:17:58 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 01 Jun 2026 00:17:39 +0100
Subject: [PATCH RFC 3/4] printk: nbcon: move printk_delay to console
 emiting code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-deprecate_boot_delay-v1-3-c34c187142a6@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780269471; l=4826;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=iIdrzIpbtLvWz4MDbsc58aNL3F6fTnbJs47tQmnDnOs=;
 b=CxvG+4JeIkfc9bjfcipdZnVZu7SXaVegXQCnK10t1RHUldU1+VRTlLNyK3ajoLsSgkqu8OUZe
 rJ5HYDCjexuDZ2X4RQnZDoGf2ca1dMBWG5Bdu9Baj3Go2bX8E9BqZbu
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_161800_616753_2308050A 
X-CRM114-Status: GOOD (  22.06  )
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

The printk_delay and boot_delay features are helpful for debugging
as kernel output can be slowed down during boot allowing messages to
be seen before scrolling off the screen, or to correlate timing between
some physical event and console output.

However, since the introduction of nbcon and the legacy printer thread
for PREEMPT_RT kernels, printk records are now emited to the console
asynchronously to the caller of printk. Thus, any printk delay added by
boot_delay/printk_delay continues to slow down the calling process but
may not have any impact to the rate in which records are emited to the
console.

Let's address this by moving the printk delay from the calling code
to the console emiting code instead. Whilst this ensures that delays
are still observed (especially for slower consoles), it doesn't improve
the use-case of using boot_delay/printk_delay to correlate timings
between physical events and console output.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 include/linux/printk.h |  4 ++++
 kernel/printk/nbcon.c  | 13 ++++++++++++-
 kernel/printk/printk.c | 15 +++++++--------
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd411f2238b45374e8a71222f0407c..8ea3ac8201ad541912547305e241e3661f4d8e05 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -209,6 +209,7 @@ extern bool nbcon_device_try_acquire(struct console *con);
 extern void nbcon_device_release(struct console *con);
 void nbcon_atomic_flush_unsafe(void);
 bool pr_flush(int timeout_ms, bool reset_on_progress);
+void printk_delay(bool use_atomic);
 #else
 static inline __printf(1, 0)
 int vprintk(const char *s, va_list args)
@@ -326,6 +327,9 @@ static inline bool pr_flush(int timeout_ms, bool reset_on_progress)
 {
 	return true;
 }
+static inline void printk_delay(bool use_atomic)
+{
+}
 
 #endif
 
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index d7044a7a214bdd4537a5e20d876d99bc3ffe8b3a..a507a2fed5bf4366e24330f763b842a698ecf6f7 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1267,11 +1267,16 @@ static int nbcon_kthread_func(void *__console)
 
 		con_flags = console_srcu_read_flags(con);
 
+		wctxt.len = 0;
+
 		if (console_is_usable(con, con_flags, false))
 			backlog = nbcon_emit_one(&wctxt, false);
 
 		console_srcu_read_unlock(cookie);
 
+		if (backlog && wctxt.len > 0)
+			printk_delay(false);
+
 		cond_resched();
 
 	} while (backlog);
@@ -1525,6 +1530,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
 	}
 
 	progress = nbcon_emit_one(&wctxt, use_atomic);
+	if (progress && wctxt.len > 0)
+		printk_delay(use_atomic);
 
 	if (use_atomic) {
 		start_critical_timings();
@@ -1584,6 +1591,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 			if (!nbcon_context_try_acquire(ctxt, false))
 				return -EPERM;
 
+			wctxt.len = 0;
+
 			/*
 			 * nbcon_emit_next_record() returns false when
 			 * the console was handed over or taken over.
@@ -1595,7 +1604,9 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 			nbcon_context_release(ctxt);
 		}
 
-		if (!ctxt->backlog) {
+		if (ctxt->backlog && wctxt.len > 0) {
+			printk_delay(true);
+		} else {
 			/* Are there reserved but not yet finalized records? */
 			if (nbcon_seq_read(con) < stop_seq)
 				err = -ENOENT;
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index ca510b9c76458f5c1e059200060d9d6be4c859b3..5154da85537438905231f829ed8f2ea2550daf77 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2140,18 +2140,17 @@ static inline void late_boot_delay_msec(void)
 	}
 }
 
-static inline void printk_delay(int level)
+void printk_delay(bool use_atomic)
 {
-	bool suppress = !is_printk_force_console() &&
-			suppress_message_printing(level);
-
-	if (likely(!printk_delay_msec) || suppress)
+	if (likely(!printk_delay_msec))
 		return;
 
 	if (system_state < SYSTEM_RUNNING)
 		early_boot_delay_msec();
-	else
+	else if (use_atomic)
 		late_boot_delay_msec();
+	else
+		msleep(printk_delay_msec);
 }
 
 #define CALLER_ID_MASK 0x80000000
@@ -2471,8 +2470,6 @@ asmlinkage int vprintk_emit(int facility, int level,
 		ft.legacy_direct = false;
 	}
 
-	printk_delay(level);
-
 	printed_len = vprintk_store(facility, level, dev_info, fmt, args);
 
 	if (ft.nbcon_atomic)
@@ -3171,6 +3168,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 		con->dropped = 0;
 	}
 
+	printk_delay(true);
+
 	/* Write everything out to the hardware. */
 
 	if (force_legacy_kthread() && !panic_in_progress()) {

-- 
2.34.1


