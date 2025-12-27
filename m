Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41D4E8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhFoe+/fNVQYtucZwNZBdpwy2GyzZc29S0jBT7dXZmU=; b=okWnrsPGDd/7GdMotekhtYsLBP
	OeQqlE/ppUQbZi40otjhMvkleifmVsmARSzK7aW819XyWL8DCuFfLNhbOhnXJ2SmMp2Z17Kpg64k3
	/nKBQ6UEux5YzLeRj8kiczgOm6axmfguljPctxO7hwtClNiyEen3q5C5e7ImHUJ6uLsHu4D+sS4vO
	nDfFoQhM1OpPW5UJ291plLe6kDkre4owdl7/j9rQcjXo0H0PX0B8NsnfYrtKh2qoKnKWsxMxMiR2J
	x8YzMCF/Yc39iQDH/6s4w+xuoo731MJAAR5bLwx4xPJxII9k3da8O9ubv/pAbAn66g1IaVWM/eMDM
	mff5S93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTEN-00000001vRg-1SeA;
	Sat, 27 Dec 2025 12:17:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTEK-00000001vPM-07wc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:17:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so61961605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837826; x=1767442626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhFoe+/fNVQYtucZwNZBdpwy2GyzZc29S0jBT7dXZmU=;
        b=RhPHlBHTWOWkssXWVqSGqW6RHBruQeABJST2oN3iNrEGEgOm9Fn/SsPKtdbrQfQ55h
         pYMwfy4aXougqjTodsEKbroxXRvrddb98XyE7gc5f6BKUcweFJUikVg9K2l02XHXs4Uk
         fp6mPDjl+tShfEhGQja1l3AFEroWKRqvcUhBN6CEbX3Txpp0Y5plcetTWGAhd/qc0ToV
         58mg/q3VDFXLyB9kjMZFe/gLKMgfc/BoftQZ8HNqMfVXtR0sikMbskdVgC/h+axegRJo
         5I7wVXZiuEQ7/F0yyga/O/fq4s/iZYkY9rEbhlpfnyY1R5caMkjep/kfoG4oZjdCJdjE
         TzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837826; x=1767442626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhFoe+/fNVQYtucZwNZBdpwy2GyzZc29S0jBT7dXZmU=;
        b=RmYYTDZtaHogW28Zm5kaD1Z6FAaEOLAicKdfZMOQ1SM1hS1QvT5pXA2G0m1hP9xgIw
         eDaVrbUKXj59x1I3UYbOaqA212r0DmL9U0cAMXXbpK63alx4esBMD6vaCWwsA9qoRZ3Q
         5Mga2h3Fa2AvLScAXCYzy5gkjusAxshaWFUapTpggVkG8LgghHooY6Nmxw6R+i7d+koE
         gUh+Wb/NCNiZsQ7twh+MnqL0IgcTOelNybEY8OrAuO4HaBpx8H8dlxikBjcT62clJT/A
         IGskvp6pRsPyfbuCpDlfR6K3+TjCZvZo3h/KJQ/he4yats5KMMPNXg7cYtHUFxUX01CM
         dU4g==
X-Forwarded-Encrypted: i=1; AJvYcCWwP6T68UOmNiuRU28HN2BQbjNkFZwd+8R/eA6iX+1QsbZIGxMjTR4ITOm9Edbnhvq0DNfyYViFnLR7wByu0iZd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsxun5KE85fvP4p1Lu8Kk9x9VEfgvNf/73BjskWMW1qKRvaVud
	b88TwQAn4YPLnSsHsu+b6XSJ4Q3j0Xx/8Zz6GJyeUUhdtJcTMmJbZcOZt0Oe5b4TQiA=
X-Gm-Gg: AY/fxX4qc3h+ubM7fMMb2j3NY5oqIG19L2RP9KTchifOUGskeOZc59qOwU5RUyzlO/w
	YV6S0M6IXgjpmXuRSSeWBo4lNz3gFX+fKAHB8KLGP+viyruTGiQ1WwFeNzrwRph5xRZVP9Hetvq
	iASDRszJySZoi7T7E+CPnB4n/1xJkMhbhPnLAbwJcGjgbl0SdJmY5+YfaCYvZq+QP+HZmxOrhHo
	ADApB6Er4AfcFRvLsGDpbdfBzetCrWw5bFJXWT+CwXcEM8g79PdPoVeioMtGaHpBZoDNxae9LpE
	34EKKZsqgMw+4H5qEZ7AhkXg2aFpHab5RiGS86X0W8bPZ/z7OkWC2feZ7+5fEHcoHt43Lu/q+DG
	Km0xn9WrpLFTDEQCwYd/CeKa+9vZZ719iE/hrPg46gq4vmTMVJ47LrLjaEW5GbXvDHLzY2/3VqK
	+IsWiUZjZw
X-Google-Smtp-Source: AGHT+IHT9M2beqQrZzp9xbbyJud8/h6Q+UOZtBpjbh3fLwHrPjz2pLTjAJscQz+yaZcvqZw8y6NMSQ==
X-Received: by 2002:a05:600c:3b88:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-47d19556cf7mr356539265e9.12.1766837826003;
        Sat, 27 Dec 2025 04:17:06 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:17:05 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:09 -0300
Subject: [PATCH 02/19] printk: Introduce console_is_nbcon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=5401;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=neUSae1tSSd9ZUIMhNnIsDOes9ZbVtbWmizb8QV3UdY=;
 b=gCYQ59/fzh5QOgA05PXMV/E/oNmzy4c9swZbzFlKNzJFERHXZDcBlPYBdYFwyrufnetFktUrT
 qugGUjzspdLDAy+AfxtSwqRvBilWtZIJfksSlShjgsgxcBNFgQvlHOk
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041709_064370_2DF184AB 
X-CRM114-Status: GOOD (  21.74  )
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

Besides checking if the current console is NBCON or not, console->flags
is also being read in order to serve as argument of the console_is_usable
function.

But CON_NBCON flag is unique: it's set just once in the console
registration and never cleared. In this case it can be possible to read
the flag when console_srcu_lock is held (which is the case when using
for_each_console).

This change makes possible to remove the flags argument from
console_is_usable in the next patches.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 include/linux/console.h   | 27 +++++++++++++++++++++++++++
 kernel/debug/kdb/kdb_io.c |  2 +-
 kernel/printk/nbcon.c     |  2 +-
 kernel/printk/printk.c    | 15 ++++++---------
 4 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index 35c03fc4ed51..dd4ec7a5bff9 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -561,6 +561,33 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
 	WRITE_ONCE(con->flags, flags);
 }
 
+/**
+ * console_srcu_is_nbcon - Locklessly check whether the console is nbcon
+ * @con:	struct console pointer of console to check
+ *
+ * Requires console_srcu_read_lock to be held, which implies that @con might
+ * be a registered console. The purpose of holding console_srcu_read_lock is
+ * to guarantee that no exit/cleanup routines will run if the console
+ * is currently undergoing unregistration.
+ *
+ * If the caller is holding the console_list_lock or it is _certain_ that
+ * @con is not and will not become registered, the caller may read
+ * @con->flags directly instead.
+ *
+ * Context: Any context.
+ * Return: True when CON_NBCON flag is set.
+ */
+static inline bool console_is_nbcon(const struct console *con)
+{
+	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
+
+	/*
+	 * The CON_NBCON flag is statically initialized and is never
+	 * set or cleared at runtime.
+	 */
+	return data_race(con->flags & CON_NBCON);
+}
+
 /* Variant of console_is_registered() when the console_list_lock is held. */
 static inline bool console_is_registered_locked(const struct console *con)
 {
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 6ffb962392a4..d6de512b433a 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -596,7 +596,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 		if (c == dbg_io_ops->cons)
 			continue;
 
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(c)) {
 			struct nbcon_write_context wctxt = { };
 
 			/*
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 13865ef85990..f0f42e212caa 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1647,7 +1647,7 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 	for_each_console_srcu(con) {
 		short flags = console_srcu_read_flags(con);
 
-		if (!(flags & CON_NBCON))
+		if (!console_is_nbcon(con))
 			continue;
 
 		if (!console_is_usable(con, flags, NBCON_USE_ATOMIC))
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5f4b84f9562e..bd0d574be3cf 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3200,7 +3200,7 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 		 * nbcon consoles when the nbcon consoles cannot print via
 		 * their atomic or threaded flushing.
 		 */
-		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
+		if (console_is_nbcon(con) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
 		if (!console_is_usable(con, flags,
@@ -3209,7 +3209,7 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 			continue;
 		any_usable = true;
 
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(con)) {
 			progress = nbcon_legacy_emit_next_record(con, handover, cookie,
 								 !do_cond_resched);
 			printk_seq = nbcon_seq_read(con);
@@ -3458,7 +3458,6 @@ void console_unblank(void)
 static void __console_rewind_all(void)
 {
 	struct console *c;
-	short flags;
 	int cookie;
 	u64 seq;
 
@@ -3466,9 +3465,7 @@ static void __console_rewind_all(void)
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		flags = console_srcu_read_flags(c);
-
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(c)) {
 			nbcon_seq_force(c, seq);
 		} else {
 			/*
@@ -3632,13 +3629,13 @@ static bool legacy_kthread_should_wakeup(void)
 		 * consoles when the nbcon consoles cannot print via their
 		 * atomic or threaded flushing.
 		 */
-		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
+		if (console_is_nbcon(con) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
 		if (!console_is_usable(con, flags, NBCON_USE_THREAD))
 			continue;
 
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(con)) {
 			printk_seq = nbcon_seq_read(con);
 		} else {
 			/*
@@ -4490,7 +4487,7 @@ static bool __pr_flush(struct console *con, int timeout_ms, bool reset_on_progre
 			if (!console_is_usable(c, flags, NBCON_USE_ANY))
 				continue;
 
-			if (flags & CON_NBCON) {
+			if (console_is_nbcon(c)) {
 				printk_seq = nbcon_seq_read(c);
 			} else {
 				printk_seq = c->seq;

-- 
2.52.0


