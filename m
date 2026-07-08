Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CEFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QolbbD7v24l2Rpfdio7tLgTKClqjgFar5mCZ10xege0=; b=Jx1/g8sCmrV2bbmYPpNn/cy/gX
	j4EWV6FU4nFWRKeSZdGX8Dou5shdoe6F5MSm9SngF2QOhaD6KXrTgzYyP+dA5ERwaPh/kzpAXxsuL
	T1dQxVuVBqmOhFKDEHCRmuVBoOO0XYBuwf9+6BBGFCPtmqZZ3Qel+Qj6H77Cv6UMgqNt4BxhHZxm/
	4WrDpj9mvnPS1EqBGVY7L+Bnb3Tz3EGELGkfgLDKqkXvRM0O7Wev6+Tt5/vNbkWmjslqZCVIvusZi
	EonApVAlJ+6Y7oaJoQNmp1E5RtamD05APS68wxEOIHcFH53jfRKy1pIrRhj+GvyZw3Oe4PDWYqm64
	A+wgJCyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNVA-0000000GbVW-33fC;
	Wed, 08 Jul 2026 08:19:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNV8-0000000GbUE-0y5h;
	Wed, 08 Jul 2026 08:19:27 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783498758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QolbbD7v24l2Rpfdio7tLgTKClqjgFar5mCZ10xege0=;
	b=wJBs5RQXT93Rj0WQ3W2UjXnibxsqiLbIDJ2EExwrm6HAo2pk85TctpHJuBEmV3aPxRE9/+
	19IRZLp6+KLkGFv2vkCAdxikItD94lX8SW0t9VBsENgq/RFDWiL/1mTGYkXdsnO8uNoGcb
	jkv91w7AT5oFaWCs74R4FpDddKUEoKjxzz0r5/KqtkOuhc3PfY5r9pAnBJwLgU25a1T4Om
	7vQc756+Oohnbzd99zjRZwS66PsQ4PhS+Nnp+PlTyKJ11UZGzMMGc/RbPU3jrCdc322tXl
	960SCdCYyRppgg5LYoxF+P8+vI/vMmSWTh7R4nkvO2zFL4Mj4nQXr1P46bg0/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783498758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QolbbD7v24l2Rpfdio7tLgTKClqjgFar5mCZ10xege0=;
	b=owmvoh/axlZIXsleVK++YNkeWnMsI1p5SL4D8lv15ClKwUy3AitASqBmYXqrSfVTEJkmSI
	Du20Yva8X9oSBkBg==
To: Petr Mladek <pmladek@suse.com>, Benedikt Spranger
 <b.spranger@linutronix.de>
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Russell King
 <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
In-Reply-To: <ak0VguIf-PxmbUOS@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra> <ak0VguIf-PxmbUOS@pathway.suse.cz>
Date: Wed, 08 Jul 2026 10:25:17 +0206
Message-ID: <87qzldvqpm.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_011926_408038_D474F597 
X-CRM114-Status: GOOD (  21.08  )
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

On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
> To summarize this discussion:
>
>   + Benedikt would prefer to add the synchronous mode before
>     moving the delay from the printk() caller to the console emit
>     code path.
>
>   + The delay in the printk() caller code path did not guarantee
>     the output but it increased the chance to see it.
>
>   + The synchronous mode will be even more reliable than the delay
>     in printk() caller path.
>
> Please, let me know if I did not get it right,
>
> John, did you have any plan how to add the synchronous mode, please?
> Does it look complicated?
>
> I guess that we would somehow need to "mis-use" the emergency
> priority and force it everywhere by some global system setting.

The synchronous mode would rely on the driver being nbcon. I envision
something like this:

---- BEGIN SYNC IDEA ----
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2fe9a963c823a..beb5bb3c037b5 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2456,6 +2456,8 @@ asmlinkage int vprintk_emit(int facility, int level,
 
 	if (ft.nbcon_atomic)
 		nbcon_atomic_flush_pending();
+	else if (have_nbcon_console_sync)
+		nbcon_atomic_flush_sync_pending();
 
 	if (ft.nbcon_offload)
 		nbcon_kthreads_wake();
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 4b03b019cd5ee..8f8f29f757614 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1200,7 +1200,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
 	cookie = console_srcu_read_lock();
 
 	flags = console_srcu_read_flags(con);
-	if (console_is_usable(con, flags, false)) {
+	if (!(flags & CON_SYNC) &&  console_is_usable(con, flags, false)) {
 		/* Bring the sequence in @ctxt up to date */
 		ctxt->seq = nbcon_seq_read(con);
 
@@ -1654,7 +1654,7 @@ static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
  *					write_atomic() callback
  * @stop_seq:			Flush up until this record
  */
-static void __nbcon_atomic_flush_pending(u64 stop_seq)
+static void __nbcon_atomic_flush_pending(u64 stop_seq, bool sync_only)
 {
 	struct console *con;
 	int cookie;
@@ -1666,6 +1666,9 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 		if (!(flags & CON_NBCON))
 			continue;
 
+		if (sync_only && !(flags & CON_SYNC))
+			continue;
+
 		if (!console_is_usable(con, flags, true))
 			continue;
 
@@ -1688,7 +1691,12 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
  */
 void nbcon_atomic_flush_pending(void)
 {
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
+}
+
+void nbcon_atomic_flush_sync_pending(void)
+{
+	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), true);
 }
 
 /**
@@ -1701,7 +1709,7 @@ void nbcon_atomic_flush_pending(void)
 void nbcon_atomic_flush_unsafe(void)
 {
 	panic_nbcon_allow_unsafe_takeover = true;
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
 	panic_nbcon_allow_unsafe_takeover = false;
 }
 
---- END SYNC IDEA ----

BTW: The sync mode is the final piece so that PeterZ can start using
mainline code for debugging by serial instead of his own workaround [0].

John

[0] https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=debug/experimental

