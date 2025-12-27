Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDE4E9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TucCmhZOA7i1Z82TbHC9/BloO3wYJZCYcsSdo+RW81I=; b=cGzUl8pN5AqJDNp6d/jPX/dDEY
	6BUFrrUA+AwNAPaEhVTDvKZ0HpDN6OuMg9yv4DeXDNa2AG+k1LPzES7ZD51IVssI4YAWIZnOkZrCa
	L96GgSVfLLHqmD2r01nLuuO36WEyuZ3SvRjbaqn582Y2sySfTvoVNizlFXn0w/ABbrvdTHWLY93KU
	hDGktOlPrk91kAH3IbS7CjZarNL4mBWWjdtVzPMIuQ1h1IAS19GtLTa2yBbXo9i7sfxT9ths3lEYW
	h892d67dCf94fV2pFmxWxA9DGGsuDf7CuvV2EHTff2I2N2MajyAIA7ytFVl4c28SozU9Zu6imj1+m
	3BtKdqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTEE-00000001vNF-0Ev3;
	Sat, 27 Dec 2025 12:17:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTEA-00000001vLX-3gZY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:17:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so77987845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837817; x=1767442617; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TucCmhZOA7i1Z82TbHC9/BloO3wYJZCYcsSdo+RW81I=;
        b=KHwKeZPewUeIlPMuDT8Ap7Z2m2/RvlAXp6FgOCizJMoxo1QSKkxIXg8BhQLBidlY57
         kH67RQQY2D9+5N9MtdT2igj5QZG17dpe6vTlXV3DtMOpdfuyzLMtzamn//M13KXGYJx4
         gFW1cZgjZlbgWMrUJ8o3JFampTY2FcHMeuDsZnJBCONmKvsEZSeVZlpU5Jgvip2jRLZq
         zZ44nHPZjSilUMKO6K+oWqNLphWh0PMBPGQS0r4GAWZEXqoP5wJZRJomuFK0H9zfcmnd
         xlj2dnOLQoYdRPPh/lWeI93prS1fuzVer8hmAVP4FHVoN3v7pmKT6TWYd29ndKta0vtp
         2kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837817; x=1767442617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TucCmhZOA7i1Z82TbHC9/BloO3wYJZCYcsSdo+RW81I=;
        b=xPDCgu5VQdLTEbSFFUAODldRxifv80J6qWPfIkB+OiD3KPzLvrV5inNLk5jnCSj7jH
         ygrrT0KCGOqdAYJ4j2KNy9xX6tTlEokRJAoIDo2dvbNs8rnjSAOYKlAlDYbWygrqrRDY
         ipsou8MM4gWoBLsPJoeGDejbd9FzLR75l9j+Mh5PGGOVf/bmPmr2lul0L/PXmR8rO055
         nS3b0+jaQWQxVHpm+RTgO0mz07TvhUyENDpdsp/JGGPdmdsPScw7szRzaC7+ixPqSEi2
         kE/CP4UEN/Bi2BzweFeaqc2Hb4HZ3pXC2FABZG7IpJhCAdhFk7mEsr8euowXPeNMAMFw
         yL7w==
X-Forwarded-Encrypted: i=1; AJvYcCUEBuduR8RXCJ+3hxpDHoql0O71a/berfbSpSnVG1hdn3NqYEravCLDAvs6py3IU/eOJ7jC96wo97UPqgu3FWyl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7ywSCIMNGFPLCMPc2n22twshVb2+Vw8H8BFOOzJIrCPQARJit
	N7do08d6WTwgJhxC/ayWsQSZstqXVUM1y4eGPW6U+rnB0fH+v6XXJ3c1RCUp3d3zVhU=
X-Gm-Gg: AY/fxX7u0msHGGl53k9ebxf/0fszwAy981WbfNlSjDMPG6nEuu5AbDGx2lFn6AG7JSa
	+BA3NduKSapWBBDhANRirld+Zch9UswR/x1RyST161MIRbNAXt99WIAGHCguOsKqqL64ul6DEXL
	Kx+H/iWVtc7ugDFRdrrIzKXTuU023z2u3zftO0C9C1XxjWVL0/3xbfQCE1gIgaLX7s2YTIYKTz0
	rffMkPTQZtYJg1p8W3Vavdhcfo569OWvwSCHMb/menfkGwqOjnktAJ2mt9YveAUMaq3bQZ3lw9Z
	mDGBBJqH7UiMfb48d2FBrI8nfzn5CEF4E5zoPkfQ0bdvDTqZLl26tQ8S+QlaivpYMSkpsEA8bTn
	zEU8uleFahFm4XD3F9+Rfz01LZIzODuirm/JCsivMnOVGOvnG7Wdn+yrwJMULKQ8SIj2p2AwSMp
	QBSwDz3Uyr
X-Google-Smtp-Source: AGHT+IF/Ogs7VBJ7Lrr7CGG7veshYzlT60dJ+vTxBr8CJY/jnjI8AOD4UQ6PSSMzci7/2/zJylqGqg==
X-Received: by 2002:a05:600c:314f:b0:47d:4fbe:e6cc with SMTP id 5b1f17b1804b1-47d4fbee749mr22553095e9.13.1766837816753;
        Sat, 27 Dec 2025 04:16:56 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:16:56 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:08 -0300
Subject: [PATCH 01/19] printk/nbcon: Use an enum to specify the required
 callback in console_is_usable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=7808;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=v10odBRNUVRtYegW6AWVkSJvotaiGNuLgfoYzWWV1rM=;
 b=pFG5z/R9mPhdW0GcbWwBqAYRxphqjaw37XiHB8zK2Svw6cgWPnnbt5ix8LVRTlDSXoMKx6YOe
 j641rf88XbSCyYZnTx7OjU6MTkBS6ecM7BDrludb53BNNBG+/Mhcz0A
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041658_969158_A48F30B5 
X-CRM114-Status: GOOD (  20.13  )
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

The current usage of console_is_usable() is clumsy. The parameter
@use_atomic is boolean and thus not self-explanatory. The function is
called twice in situations when there are no-strict requirements.

Replace it with enum nbcon_write_cb which provides a more descriptive
values for all 3 situations: atomic, thread or any.

Note that console_is_usable() checks only NBCON_USE_ATOMIC because
.write_thread() callback is mandatory. But the other two values still
make sense because they describe the intention of the caller.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 arch/um/kernel/kmsg_dump.c |  3 ++-
 include/linux/console.h    | 20 +++++++++++++++++---
 kernel/debug/kdb/kdb_io.c  |  2 +-
 kernel/printk/nbcon.c      |  8 ++++----
 kernel/printk/printk.c     | 16 ++++++++--------
 5 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
index fc0f543d1d8e..8ae38308b67c 100644
--- a/arch/um/kernel/kmsg_dump.c
+++ b/arch/um/kernel/kmsg_dump.c
@@ -31,7 +31,8 @@ static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
 		 * expected to output the crash information.
 		 */
 		if (strcmp(con->name, "ttynull") != 0 &&
-		    console_is_usable(con, console_srcu_read_flags(con), true)) {
+		    console_is_usable(con, console_srcu_read_flags(con),
+				      NBCON_USE_ATOMIC)) {
 			break;
 		}
 	}
diff --git a/include/linux/console.h b/include/linux/console.h
index fc9f5c5c1b04..35c03fc4ed51 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -202,6 +202,19 @@ enum cons_flags {
 	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
 };
 
+/**
+ * enum nbcon_write_cb - Defines which nbcon write() callback must be used based
+ *                       on the caller context.
+ * @NBCON_USE_ATOMIC: Use con->write_atomic().
+ * @NBCON_USE_THREAD: Use con->write_thread().
+ * @NBCON_USE_ANY:    The caller does not have any strict requirements.
+ */
+enum nbcon_write_cb {
+	NBCON_USE_ATOMIC,
+	NBCON_USE_THREAD,
+	NBCON_USE_ANY,
+};
+
 /**
  * struct nbcon_state - console state for nbcon consoles
  * @atom:	Compound of the state fields for atomic operations
@@ -622,7 +635,8 @@ extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
  * which can also play a role in deciding if @con can be used to print
  * records.
  */
-static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
+static inline bool console_is_usable(struct console *con, short flags,
+				     enum nbcon_write_cb nwc)
 {
 	if (!(flags & CON_ENABLED))
 		return false;
@@ -631,7 +645,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
 		return false;
 
 	if (flags & CON_NBCON) {
-		if (use_atomic) {
+		if (nwc & NBCON_USE_ATOMIC) {
 			/* The write_atomic() callback is optional. */
 			if (!con->write_atomic)
 				return false;
@@ -679,7 +693,7 @@ static inline bool nbcon_kdb_try_acquire(struct console *con,
 					 struct nbcon_write_context *wctxt) { return false; }
 static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
 static inline bool console_is_usable(struct console *con, short flags,
-				     bool use_atomic) { return false; }
+				     enum nbcon_write_cb nwc) { return false; }
 #endif
 
 extern int console_set_on_cmdline;
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 61c1690058ed..6ffb962392a4 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -591,7 +591,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	for_each_console_srcu(c) {
 		short flags = console_srcu_read_flags(c);
 
-		if (!console_is_usable(c, flags, true))
+		if (!console_is_usable(c, flags, NBCON_USE_ATOMIC))
 			continue;
 		if (c == dbg_io_ops->cons)
 			continue;
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index be5a04367e60..13865ef85990 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1184,7 +1184,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
 	cookie = console_srcu_read_lock();
 
 	flags = console_srcu_read_flags(con);
-	if (console_is_usable(con, flags, false)) {
+	if (console_is_usable(con, flags, NBCON_USE_THREAD)) {
 		/* Bring the sequence in @ctxt up to date */
 		ctxt->seq = nbcon_seq_read(con);
 
@@ -1251,7 +1251,7 @@ static int nbcon_kthread_func(void *__console)
 
 		con_flags = console_srcu_read_flags(con);
 
-		if (console_is_usable(con, con_flags, false))
+		if (console_is_usable(con, con_flags, NBCON_USE_THREAD))
 			backlog = nbcon_emit_one(&wctxt, false);
 
 		console_srcu_read_unlock(cookie);
@@ -1650,7 +1650,7 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 		if (!(flags & CON_NBCON))
 			continue;
 
-		if (!console_is_usable(con, flags, true))
+		if (!console_is_usable(con, flags, NBCON_USE_ATOMIC))
 			continue;
 
 		if (nbcon_seq_read(con) >= stop_seq)
@@ -1904,7 +1904,7 @@ void nbcon_device_release(struct console *con)
 	 */
 	cookie = console_srcu_read_lock();
 	printk_get_console_flush_type(&ft);
-	if (console_is_usable(con, console_srcu_read_flags(con), true) &&
+	if (console_is_usable(con, console_srcu_read_flags(con), NBCON_USE_ATOMIC) &&
 	    !ft.nbcon_offload &&
 	    prb_read_valid(prb, nbcon_seq_read(con), NULL)) {
 		/*
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 7394f1b6033b..5f4b84f9562e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3203,7 +3203,9 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
-		if (!console_is_usable(con, flags, !do_cond_resched))
+		if (!console_is_usable(con, flags,
+				       do_cond_resched ? NBCON_USE_THREAD
+						       : NBCON_USE_ATOMIC))
 			continue;
 		any_usable = true;
 
@@ -3392,7 +3394,7 @@ void console_unblank(void)
 	 */
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		if (!console_is_usable(c, console_srcu_read_flags(c), true))
+		if (!console_is_usable(c, console_srcu_read_flags(c), NBCON_USE_ATOMIC))
 			continue;
 
 		if (c->unblank) {
@@ -3432,7 +3434,7 @@ void console_unblank(void)
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		if (!console_is_usable(c, console_srcu_read_flags(c), true))
+		if (!console_is_usable(c, console_srcu_read_flags(c), NBCON_USE_ATOMIC))
 			continue;
 
 		if (c->unblank)
@@ -3633,7 +3635,7 @@ static bool legacy_kthread_should_wakeup(void)
 		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
-		if (!console_is_usable(con, flags, false))
+		if (!console_is_usable(con, flags, NBCON_USE_THREAD))
 			continue;
 
 		if (flags & CON_NBCON) {
@@ -4204,7 +4206,7 @@ static int unregister_console_locked(struct console *console)
 
 	if (!console_is_registered_locked(console))
 		res = -ENODEV;
-	else if (console_is_usable(console, console->flags, true))
+	else if (console_is_usable(console, console->flags, NBCON_USE_ATOMIC))
 		__pr_flush(console, 1000, true);
 
 	/* Disable it unconditionally */
@@ -4485,10 +4487,8 @@ static bool __pr_flush(struct console *con, int timeout_ms, bool reset_on_progre
 			 * that they make forward progress, so only increment
 			 * @diff for usable consoles.
 			 */
-			if (!console_is_usable(c, flags, true) &&
-			    !console_is_usable(c, flags, false)) {
+			if (!console_is_usable(c, flags, NBCON_USE_ANY))
 				continue;
-			}
 
 			if (flags & CON_NBCON) {
 				printk_seq = nbcon_seq_read(c);

-- 
2.52.0


