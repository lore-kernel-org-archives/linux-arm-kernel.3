Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7519DE9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5BRw7RvrfQfP/K6gt0hDAa/lWwGnQ3AR1h1gaT2J0c=; b=m2LiM86yoNH1X5iiDiKJnNsolM
	ABjtB9ZsLrg0QvEgBka7GwwiMWlfWAUa9yFug5/AvCk/oevmpaizNOmQs32SdS/PYhIGdByhGerYQ
	jqjrObfA4Kz2ACI/RnydiJ51AcYUR9DHArRZIjol86wGBpdTOUluI89gMLYRmZBomgpzXF8muOijN
	p7iTs1BguDjsNnfpM6arNtlCHnDB3aLMCbRuwnTE4JYh4JTjqjF7lNjkbBQ0yAuk6p53lfxzKzlV7
	XfchUI4KqaqvAnR3M7qXXdfmyH9xoP0Me7kUqVjIX21G/Ko+pbYjaSRToBxCzPJoVo4F45xgplMYl
	V7W2/9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTEe-00000001vcl-1P4W;
	Sat, 27 Dec 2025 12:17:28 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTEc-00000001va7-0YvQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:17:27 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so61962555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837844; x=1767442644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5BRw7RvrfQfP/K6gt0hDAa/lWwGnQ3AR1h1gaT2J0c=;
        b=HrZg32ZnQ/sE6V8AhmmCAdf+jRoKj3km6NdsX/ePnWpNIycd0S9S5a6nx9EOtl1UK+
         GRtzE3tzRRIjKATc0eeJoHjveinpWeSo+PNxLAqi7F9ZZfjH78s0zAOS2C3CNzPAmlIi
         fxoqzNBswGMFQqHA+gTkikqLV8AXrqbyayqqda9r7Mj6vrozH3IeNcYlhKjTUOsYreQe
         ItXi54isNMI/fmhXn8P7P3ZdMy271aFaGr224d/XgvT7b0zIq1ZzIu5ZUhg694FlFxoH
         8lmLR3KYC451fmkqviW+hEXkUKhFsQRmFoYmrsl1WAkMEzfIJhHop3+C8QK4XcFLe3MR
         ejzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837844; x=1767442644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5BRw7RvrfQfP/K6gt0hDAa/lWwGnQ3AR1h1gaT2J0c=;
        b=auQjpCSVewwWXxoZc6iAWa7ByGPHmsgI9V6dQwNQSZeDWqrCD05tuXDepsmEpNu/AO
         ssOIZlZD4Ck03PixuBs0pdxzlxKbHWy80bGX0EtEKXwiDpzt0laprG7c2JFrTZKgisl8
         IrCIRJlV2gsZMSEOT00YGKhDmLEe+XxdQEJZuNoYzu5wzhRuKi2XcKurmX7lCzZPnJ+b
         VO4msu+avfP0jc9fT/WwAyrgsPpCCGOoMxGP9MJR8LvfYYXZyttx25Y9qtxboRruNZ1H
         EvkIiSGx0J/u0K5K2EwXMPDBFDLUqug6Oi1b8Refh17t8tOppBN7HhU/ipO4iGp0PjL4
         RdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGl4IcBu6J48YCRfXk02scZmh/QfhaCAmG85Nsffxuv7L8O8O5NhmJrHS37KD1qNRFW89TO3Ha+A4TeFMBxIb4@lists.infradead.org
X-Gm-Message-State: AOJu0YxySbDv6FZU50F83Bmp0aCD0tqdj9TFkt91U/94VfV/59Bl3JmZ
	M7zOymLOTYl0RI/YTYAWtHEfEdPoGH1UhnAjMiGEMIwtcQLyrfzzlEhLdqQG5hrTs84=
X-Gm-Gg: AY/fxX7QFYxnkx5Qk6FacuCVCD6uVUsK8OXqf/VsuxsbMGB87NlTH8ye3nRYtVjb1Xm
	qNGidM8iv/6KaeSxDLro6jVzblBGUcjLDPCVE146YOKIrj4OuBbZyPjszF1ktPza5216S9Ree3y
	7AbPBUR329sUEpRQAwl1sFApEC04Gq1Bq4Gju6WSkNaHh0ui4Wcuuy95nFERjxZODR12V0xhiuf
	4R1aGSBNv8/xDFkHXQzUXEPZEthxiRYiVBw2bMIjHb9Kz3+2goWK8nf8YrZ1wlYfB30pQNxbJ6I
	BxImrq5DwClzY0PHxXYoFy2qHlpyGaZYZ0xQ891EEgMVh76Phh8x55kogK4HnlreCj37khG96So
	8ywrF3tej0dbRcyb3Q4SKjy02H7SIViM5yIa7tbwThCFOMTbnlqdhi6jZ/NlmuWAD+cZ2wt1m9W
	UPzv1gX3eV
X-Google-Smtp-Source: AGHT+IFB/Fm/BbhF4rdbmVdiGzUqk88gX/08HvStcaIXA3100u27BggsIM2y0GxgIqiLG/N+dnbC3Q==
X-Received: by 2002:a05:600c:4f52:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-47d1958a5d5mr344953125e9.22.1766837844304;
        Sat, 27 Dec 2025 04:17:24 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:17:23 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:11 -0300
Subject: [PATCH 04/19] printk: Reintroduce consoles_suspended global state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-4-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
To: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=7960;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=lE/1DIYMabiYcINvDQN+J482ZjUVJCV7RenaBaf63GU=;
 b=0Nm1rVm8usUyQfc8Y8VdqZ5lSxqrxogghCnWlBop68h2x3eX8wvULmkNK1yqxgDQDAsr7NT2A
 16smAUrBtylBcdO0yBiCQkV9TDNRTRX47nnARx+C0eR1hFzoRnJz2MU
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041726_231600_579D5F63 
X-CRM114-Status: GOOD (  22.86  )
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

This change partially reverts commit 9e70a5e109a4
("printk: Add per-console suspended state"). The intent of the original
commit was to move the management of the console suspended state to the
consoles themselves to be able to use SRCU instead of console lock.

But having a global state is still useful when checking if the global
suspend was triggered by power management. This way, instead of setting
the state of each individual console, the code would only set/read from the
global state.

Along with this change, two more fixes are necessary: change
console_{suspend,resume} to set/clear CON_SUSPEND instead of setting
CON_ENABLED and change show_cons_active to call __console_is_usable to
check console usefulness.

Link: https://lore.kernel.org/lkml/844j4lepak.fsf@jogness.linutronix.de/
Signed-off-by: Petr Mladek <pmladek@suse.com>
[mpdesouza@suse.com: Adapted code related to console_is_usable]
Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/tty/tty_io.c    |  6 +++---
 include/linux/console.h | 53 +++++++++++++++++++++++++++++++++++++++++++++++--
 kernel/printk/printk.c  | 23 +++++++++++----------
 3 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index e2d92cf70eb7..7d2bded75b75 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -3552,9 +3552,9 @@ static ssize_t show_cons_active(struct device *dev,
 	for_each_console(c) {
 		if (!c->device)
 			continue;
-		if (!(c->flags & CON_NBCON) && !c->write)
-			continue;
-		if ((c->flags & CON_ENABLED) == 0)
+		if (!__console_is_usable(c, c->flags,
+					 consoles_suspended,
+					 NBCON_USE_ANY))
 			continue;
 		cs[i++] = c;
 		if (i >= ARRAY_SIZE(cs))
diff --git a/include/linux/console.h b/include/linux/console.h
index 648cf10e3f93..caf9b0951129 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -509,6 +509,7 @@ extern void console_list_lock(void) __acquires(console_mutex);
 extern void console_list_unlock(void) __releases(console_mutex);
 
 extern struct hlist_head console_list;
+extern bool consoles_suspended;
 
 /**
  * console_srcu_read_flags - Locklessly read flags of a possibly registered
@@ -561,6 +562,47 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
 	WRITE_ONCE(con->flags, flags);
 }
 
+/**
+ * consoles_suspended_srcu_read - Locklessly read the global flag for
+ *				suspending all consoles.
+ *
+ * The global "consoles_suspended" flag is synchronized using console_list_lock
+ * and console_srcu_read_lock. It is the same approach as CON_SUSPENDED flag.
+ * See console_srcu_read_flags() for more details.
+ *
+ * Context: Any context.
+ * Return: The current value of the global "consoles_suspended" flag.
+ */
+static inline bool consoles_suspended_srcu_read(void)
+{
+	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
+
+	/*
+	 * The READ_ONCE() matches the WRITE_ONCE() when "consoles_suspended"
+	 * is modified with consoles_suspended_srcu_write().
+	 */
+	return data_race(READ_ONCE(consoles_suspended));
+}
+
+/**
+ * consoles_suspended_srcu_write - Write the global flag for suspending
+ *			all consoles.
+ * @suspend:	new value to write
+ *
+ * The write must be done under the console_list_lock. The caller is responsible
+ * for calling synchronize_srcu() to make sure that all callers checking the
+ * usablility of registered consoles see the new state.
+ *
+ * Context: Any context.
+ */
+static inline void consoles_suspended_srcu_write(bool suspend)
+{
+	lockdep_assert_console_list_lock_held();
+
+	/* This matches the READ_ONCE() in consoles_suspended_srcu_read(). */
+	WRITE_ONCE(consoles_suspended, suspend);
+}
+
 /**
  * console_srcu_is_nbcon - Locklessly check whether the console is nbcon
  * @con:	struct console pointer of console to check
@@ -658,8 +700,12 @@ extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
 
 /* Variant of console_is_usable() when the console_list_lock is held. */
 static inline bool __console_is_usable(struct console *con, short flags,
-				     enum nbcon_write_cb nwc)
+				       bool all_suspended,
+				       enum nbcon_write_cb nwc)
 {
+	if (all_suspended)
+		return false;
+
 	if (!(flags & CON_ENABLED))
 		return false;
 
@@ -711,7 +757,9 @@ static inline bool __console_is_usable(struct console *con, short flags,
 static inline bool console_is_usable(struct console *con,
 				     enum nbcon_write_cb nwc)
 {
-	return __console_is_usable(con, console_srcu_read_flags(con), nwc);
+	return __console_is_usable(con, console_srcu_read_flags(con),
+				   consoles_suspended_srcu_read(),
+				   nwc);
 }
 
 #else
@@ -727,6 +775,7 @@ static inline bool nbcon_kdb_try_acquire(struct console *con,
 					 struct nbcon_write_context *wctxt) { return false; }
 static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
 static inline bool __console_is_usable(struct console *con, short flags,
+				       bool all_suspended,
 				       enum nbcon_write_cb nwc) { return false; }
 static inline bool console_is_usable(struct console *con,
 				     enum nbcon_write_cb nwc) { return false; }
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b03ffc23c27c..173c14e08afe 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -104,6 +104,13 @@ DEFINE_STATIC_SRCU(console_srcu);
  */
 int __read_mostly suppress_printk;
 
+/*
+ * Global flag for calling down all consoles during suspend.
+ * There is also a per-console flag which is used when the related
+ * device HW gets disabled, see CON_SUSPEND.
+ */
+bool consoles_suspended;
+
 #ifdef CONFIG_LOCKDEP
 static struct lockdep_map console_lock_dep_map = {
 	.name = "console_lock"
@@ -2731,8 +2738,6 @@ MODULE_PARM_DESC(console_no_auto_verbose, "Disable console loglevel raise to hig
  */
 void console_suspend_all(void)
 {
-	struct console *con;
-
 	if (console_suspend_enabled)
 		pr_info("Suspending console(s) (use no_console_suspend to debug)\n");
 
@@ -2749,8 +2754,7 @@ void console_suspend_all(void)
 		return;
 
 	console_list_lock();
-	for_each_console(con)
-		console_srcu_write_flags(con, con->flags | CON_SUSPENDED);
+	consoles_suspended_srcu_write(true);
 	console_list_unlock();
 
 	/*
@@ -2765,7 +2769,6 @@ void console_suspend_all(void)
 void console_resume_all(void)
 {
 	struct console_flush_type ft;
-	struct console *con;
 
 	/*
 	 * Allow queueing irq_work. After restoring console state, deferred
@@ -2776,8 +2779,7 @@ void console_resume_all(void)
 
 	if (console_suspend_enabled) {
 		console_list_lock();
-		for_each_console(con)
-			console_srcu_write_flags(con, con->flags & ~CON_SUSPENDED);
+		consoles_suspended_srcu_write(false);
 		console_list_unlock();
 
 		/*
@@ -3557,7 +3559,7 @@ void console_suspend(struct console *console)
 {
 	__pr_flush(console, 1000, true);
 	console_list_lock();
-	console_srcu_write_flags(console, console->flags & ~CON_ENABLED);
+	console_srcu_write_flags(console, console->flags | CON_SUSPENDED);
 	console_list_unlock();
 
 	/*
@@ -3576,7 +3578,7 @@ void console_resume(struct console *console)
 	bool is_nbcon;
 
 	console_list_lock();
-	console_srcu_write_flags(console, console->flags | CON_ENABLED);
+	console_srcu_write_flags(console, console->flags & ~CON_SUSPENDED);
 	is_nbcon = console->flags & CON_NBCON;
 	console_list_unlock();
 
@@ -4200,7 +4202,8 @@ static int unregister_console_locked(struct console *console)
 
 	if (!console_is_registered_locked(console))
 		res = -ENODEV;
-	else if (__console_is_usable(console, console->flags, NBCON_USE_ATOMIC))
+	else if (__console_is_usable(console, console->flags,
+				     consoles_suspended, NBCON_USE_ATOMIC))
 		__pr_flush(console, 1000, true);
 
 	/* Disable it unconditionally */

-- 
2.52.0


