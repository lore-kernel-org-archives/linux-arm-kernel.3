Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEEFC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw+In47VNqyZ6M3jtrWopK6tPDTD0rxTpVkixtQCLIg=; b=Jf/Z1jBFqVVJficm4M5kNgV4f2
	dJj0Xmars3PFlxhJNDPh2RhFhbjxY6n2H4Cc2WSLd93U+ewsxIvGwo8JeEj1ubb++9H8lpvcpgUf9
	vYVFkWISrolDnAeOVNg6uT08e1+fSjEPky1yQayvXQVDr21tMu5vfx/gYpxmfn7r/YsDT4CC4vwC0
	KaEmSpbUO/LsP6Baj/1GNXQ0uv93eIZ4uZdBa66rIMB7BFJkoiJhbYjO87K07k2WUBDSywuv2aPSS
	1SYczd+Lza1tyltWs+/kRT8vrO0i8CXLHyZe3yGc7A46zUtmLbkEgx6n35ve7UwlFygOQGAQn+wv9
	zuCKvpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnNaC-0000000HGRv-1wrE;
	Fri, 24 Jul 2026 21:37:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnNa6-0000000HGQu-3WFP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 21:37:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49553515a8bso10308795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 14:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784929041; x=1785533841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zw+In47VNqyZ6M3jtrWopK6tPDTD0rxTpVkixtQCLIg=;
        b=agaba+t2Kki8EMg3LbMSkU5Td9oA/Y3EchEp2tg3oJZUfiq6D68ZfKllqE8KNqn0JC
         Rxc5KNoYjElmYt14dQjeMX4LQENVOYbKxyqXw4upaNIAwpn7kBHky3gLS2kBxrKPjREb
         nK2ANfd5I0flWnPg8Nq5AY3iv+5rQjjsgdK1rtwqFN3MESP4aYqXoDp1VWGncfibIQKf
         gTc3OwzQ0bh58zA6wQ7d7XxkqPzQNIhLJYfciq9Omd+CfuS/lnj4sYVac/LOTRrIm6bi
         JfRz08yhxvVlcnJ8T3oUE7dEpkia+x43U25xgl57Y3WCug8txlye1wjD09aqendZ4E6t
         Ibvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784929041; x=1785533841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zw+In47VNqyZ6M3jtrWopK6tPDTD0rxTpVkixtQCLIg=;
        b=tCZao+D9/tDjkcxDoy9lsM0i2IjRvyvqopLJKa2d9v5NCakXV3rewTBhiU3Ylwgyl3
         LhxUlSGb7zy1CvOvLKSFmaPpA2RoSS48dki82KP8OaCk23qahaZfpUbZC5RGsq5Uq531
         8nFrs6ddaOn/b4fKMgQw0Mz+XzUrO8Dag3vmDuA3oNuNA+6VVVJkAflPPj76HoXMH0lF
         ehY8oHzbu8Hpd/HLqLpP1+GkNk1zEsMh8fLxls+XW1srPKwJ753w67xewnLNfSjT+hXZ
         2tKJk35bSBJ3YORz9EPEF+KL13vRIh/VWusx/u9cK+veoVd3S3ujyuCnoS3/n6HVsJta
         ILeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrpuwc9l1MxbBp7kHI5m6EVPMrOYFc0Y9gDrgbZjT73wfoXP8ruOZJ1dFm+rk07t4qv9ve233zQLDIr5g/gKd+0@lists.infradead.org
X-Gm-Message-State: AOJu0YxaeNMVqddVMGuE6vsfKl2APz/RbXyhJhrTh2WdRkb+kUyYMXLu
	k7l3lyWfTA2Ln3vXOiTrJi2YkaO11PUyJ59Jagwc7AGA73zxYEYqkDfb
X-Gm-Gg: AR+sD11rc37dWo6H6cWnFhu8XipHr8yyE1OMKsXFgMwl4HstOBVp8Yem1o1kj1gu3M1
	Gnec+T61tSwbM0AqPMM21UyriyuFF8U4f2rmg5e2NGVTtMvmHWIPv7qIsgvf68Wje04SmVSzMEI
	7UKkyOfc+Cobx4suG4eSeYiNgaeBRid94XDpFk6MexJEMSn2NkREnwKiURgIeW874wPgqSPedTU
	Qf2ikLwDQBAhT56MEP1jp8k/XaeyeacPJjldNf9Fm1ijvL4uyMuL5GGY0o7GjHlNZ6AVEisKpwY
	nd19DCYz2M92FeAiVPx5R1zZ6hFoG8gMVfHj8Z6dVXfXg6QwUaZq6KS9FhJRQYkvuXxs5UA85BE
	5uta/wT+59QLSU79ek/XdRp/DQ9+1K6w3EEADtYiBPqOz1Z9/qa/a79StL8pw3gwP3ARA4CTdoL
	7hK6Wo2Ish5l0VG7lHgjKATqrZbdwWe4InrSuryosgAcS2WGcHDRDpaIXQ5DtpMkStvxTeZRURK
	l+8MwIvqN378Xn1INexeEp2DQV0e6R5QK6vu0XfYpp7STRNmckkvsRnTayAPPHCzWTXszFNML/a
	8Z0QnenORG/m1g==
X-Received: by 2002:a05:600c:4f94:b0:493:eb71:5cc6 with SMTP id 5b1f17b1804b1-496b5720ac4mr429335e9.27.1784929040710;
        Fri, 24 Jul 2026 14:37:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae93-f301-cdd9-d5ea-080d-9131.310.pool.telefonica.de. [2a02:3100:ae93:f301:cdd9:d5ea:80d:9131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b499cc49sm20754015e9.9.2026.07.24.14.37.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Jul 2026 14:37:20 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: [PATCH v2 2/2] serial: amba-pl011: keep console clock enabled for atomic writes
Date: Fri, 24 Jul 2026 23:33:48 +0200
Message-Id: <20260724213348.77418-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260724213348.77418-1-kmehltretter@gmail.com>
References: <20260724213348.77418-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_143722_919246_D8A4579F 
X-CRM114-Status: GOOD (  19.80  )
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

pl011_console_write_atomic() runs from nbcon atomic context, where
sleeping is not allowed. It calls clk_enable(), which takes the common-clk
enable_lock. Under PREEMPT_RT that is a sleeping lock:
clk_enable_lock() first tries spin_trylock_irqsave(), but on contention
falls back to spin_lock_irqsave(). Therefore, an atomic-context printk on
an RT kernel with a clk-backed pl011 can trip:

  BUG: sleeping function called from invalid context at spinlock_rt.c:48
    __might_resched from rt_spin_lock
    rt_spin_lock from clk_enable_lock
    clk_enable_lock from clk_enable
    clk_enable from pl011_console_write_atomic
    ... from vprintk_emit

This was found and reproduced on PREEMPT_RT. Arm32 and arm64 DT SoCs are
affected; arm64 SBSA/ACPI has no clk, so clk_enable(NULL) short-circuits
before the lock. In addition, write_atomic() may be invoked from NMI
context and is documented to avoid locking. Removing clk_enable() from
the callback also avoids a potentially unsafe NMI acquisition of the
common-clock enable_lock.

An nbcon atomic-capable console must be printable from any context, so
the clock cannot be gated between writes. Enable the clock while the
console is available for output: use clk_prepare_enable() in
pl011_console_setup(), release it via clk_disable_unprepare() in the
console .exit() callback, and drop the per-write clk_enable()/clk_disable()
pairs from write_atomic() and write_thread().

When printk suspends consoles, drop the reference after
uart_suspend_port() stops console access and restore it before
uart_resume_port() -- but only if suspend actually marked the port
suspended (a wake-capable tty stays running and must keep its clock), and
keep it when console_suspend_enabled is false so no_console_suspend works.

The active power cost of keeping the clock enabled is platform-dependent:
none where the UART clock is a fixed always-on oscillator, real where it
is a gateable clock branch, which then cannot be gated (nor possibly can
its parent clocks) while the console is available for output. When serial
core actually suspends the port, the reference is released so the clock
provider can gate the clock tree.

Fixes: 2eb2608618ce ("serial: amba-pl011: Implement nbcon console")
Suggested-by: John Ogness <john.ogness@linutronix.de>
Link: https://lore.kernel.org/all/8733xeaxix.fsf@jogness.linutronix.de/
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/amba-pl011.c | 40 +++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 1aa43994a3cd..611d1f6a0590 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -2523,7 +2523,7 @@ static int pl011_console_setup(struct console *co, char *options)
 	/* Allow pins to be muxed in and configured */
 	pinctrl_pm_select_default_state(uap->port.dev);
 
-	ret = clk_prepare(uap->clk);
+	ret = clk_prepare_enable(uap->clk);
 	if (ret)
 		return ret;
 
@@ -2556,7 +2556,7 @@ static int pl011_console_exit(struct console *co)
 {
 	struct uart_amba_port *uap = amba_ports[co->index];
 
-	clk_unprepare(uap->clk);
+	clk_disable_unprepare(uap->clk);
 
 	return 0;
 }
@@ -2630,8 +2630,6 @@ pl011_console_write_atomic(struct console *co, struct nbcon_write_context *wctxt
 	if (!nbcon_enter_unsafe(wctxt))
 		return;
 
-	clk_enable(uap->clk);
-
 	if (!uap->vendor->always_enabled) {
 		old_cr = pl011_read(uap, REG_CR);
 		pl011_write((old_cr & ~UART011_CR_CTSEN) | (UART01x_CR_UARTEN | UART011_CR_TXE),
@@ -2648,8 +2646,6 @@ pl011_console_write_atomic(struct console *co, struct nbcon_write_context *wctxt
 	if (!uap->vendor->always_enabled)
 		pl011_write(old_cr, uap, REG_CR);
 
-	clk_disable(uap->clk);
-
 	nbcon_exit_unsafe(wctxt);
 }
 
@@ -2662,8 +2658,6 @@ pl011_console_write_thread(struct console *co, struct nbcon_write_context *wctxt
 	if (!nbcon_enter_unsafe(wctxt))
 		return;
 
-	clk_enable(uap->clk);
-
 	if (!uap->vendor->always_enabled) {
 		old_cr = pl011_read(uap, REG_CR);
 		pl011_write((old_cr & ~UART011_CR_CTSEN) | (UART01x_CR_UARTEN | UART011_CR_TXE),
@@ -2692,8 +2686,6 @@ pl011_console_write_thread(struct console *co, struct nbcon_write_context *wctxt
 	if (!uap->vendor->always_enabled)
 		pl011_write(old_cr, uap, REG_CR);
 
-	clk_disable(uap->clk);
-
 	nbcon_exit_unsafe(wctxt);
 }
 
@@ -3080,21 +3072,45 @@ static void pl011_remove(struct amba_device *dev)
 static int pl011_suspend(struct device *dev)
 {
 	struct uart_amba_port *uap = dev_get_drvdata(dev);
+	int ret;
 
 	if (!uap)
 		return -EINVAL;
 
-	return uart_suspend_port(&amba_reg, &uap->port);
+	ret = uart_suspend_port(&amba_reg, &uap->port);
+	if (ret)
+		return ret;
+
+	if (console_suspend_enabled && uap->port.suspended &&
+	    uart_console_registered(&uap->port))
+		clk_disable_unprepare(uap->clk);
+
+	return 0;
 }
 
 static int pl011_resume(struct device *dev)
 {
 	struct uart_amba_port *uap = dev_get_drvdata(dev);
+	bool resume_console;
+	int ret;
 
 	if (!uap)
 		return -EINVAL;
 
-	return uart_resume_port(&amba_reg, &uap->port);
+	resume_console = console_suspend_enabled &&
+			 uap->port.suspended &&
+			 uart_console_registered(&uap->port);
+	if (resume_console) {
+		ret = clk_prepare_enable(uap->clk);
+		if (ret)
+			return ret;
+	}
+
+	ret = uart_resume_port(&amba_reg, &uap->port);
+	if (ret && resume_console)
+		clk_disable_unprepare(uap->clk);
+
+	return ret;
 }
 #endif
 
-- 
2.39.5 (Apple Git-154)


