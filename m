Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD36FA1FD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBuWwkO3NKaYBu7YzCXDRbesX1p5yTsd+4/nZC8plvE=; b=tXu+j/REGspmAarWKpVawg5BgQ
	h7/Tcazkc+PgCwZxChzF0xrcee0JACBgNf6jWd8kRL+XZxZOgPeBdyLyIWa7Uvzc/hm8489zVpVn7
	CRQjhQNDzoRUcRzOI74kUbMESc59UQXyrk0iXazbS0fOpPDcpmvnwq7e88qS9XHEvjbbqppB9rn6Y
	tyhzHHJR40ls4KqfORwPFp87Jv9+KWBQy7dQY0AakpBetXLZgXja9useyEoyIZG/Q+kH2slwZpgeQ
	oWuwh9QauYrW5iwFyDRcC0r1bNYOnu7+0NbrU7wmdiFU8Oci92/1o7WpLKCYNUwCmg9/rcUfyf9MT
	bESuxyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbhk-0000000AanP-0FJ6;
	Wed, 22 Apr 2026 17:49:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbhh-0000000Aamq-0GtC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:49:38 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776880172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XBuWwkO3NKaYBu7YzCXDRbesX1p5yTsd+4/nZC8plvE=;
	b=linQPxspEWgh9AKcJWRoPaKpvSiDJh5h1gk9gUTPKmL7q94Bsy7QBtYRxj/1aJj5neA++a
	VrUXXlxahPvgBYIlH4uGkindBtH5d6w3r4209pqVYYe5D/J60RdLwES9goNVdVzd9EPLXA
	TpJ/DVYxTPtfqi2IN+IdvnD0Jf0mDaDAwfemBYYNxxcbm9+TMAKt/2WIoBQ79vyLmnlIWS
	/q3feELPwVvc+9/R+oiU5jWvGSUe+9QtfG26pM4Op1qZ/y20ZcIE/HXYLaLpPl/+ApFxfA
	5pGKPDC3y1EVMjuWBpyGLs/XnbYFS18lfuY3TUphW0KbxHMHjIX0ljz+lI2ZTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776880172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XBuWwkO3NKaYBu7YzCXDRbesX1p5yTsd+4/nZC8plvE=;
	b=ZGdWOozzrg59C1LUZXlaz64KuR3ie950K3dYDlOoK210mRnJ4Hn6kpeDV9txRGxSWFtp0F
	8ICPQussMlcrWeBg==
To: Mark Rutland <mark.rutland@arm.com>, Mathias Stearn <mathias@mongodb.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jinjie Ruan
 <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com>
Date: Wed, 22 Apr 2026 19:49:30 +0200
Message-ID: <87zf2u28d1.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_104937_333657_9A54D637 
X-CRM114-Status: GOOD (  19.81  )
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

On Wed, Apr 22 2026 at 14:09, Mark Rutland wrote:
> On Wed, Apr 22, 2026 at 11:50:26AM +0200, Mathias Stearn wrote:
>> TL;DR: As of 6.19, rseq no longer provides the documented atomicity
>> guarantees on arm64 by failing to abort the critical section on same-core
>> preemption/resumption. Additionally, it breaks tcmalloc specifically by
>> failing to overwrite the cpu_id_start field at points where it was relied
>> on for correctness.
>
> Thanks for the report, and the test case.
>
> As a holding reply, I'm looking into this now from the arm64 side.

I assume it's the partial conversion to the generic entry code which
screws that up. The problem reproduces with rseq selftests nicely.

The patch below fixes it as it puts ARM64 back to the non-optimized code
for now. Once ARM64 is fully converted it gets all the nice improvements.

Thanks,

        tglx
---
diff --git a/include/linux/rseq.h b/include/linux/rseq.h
index 2266f4dc77b6..d55476e2a336 100644
--- a/include/linux/rseq.h
+++ b/include/linux/rseq.h
@@ -30,7 +30,7 @@ void __rseq_signal_deliver(int sig, struct pt_regs *regs);
  */
 static inline void rseq_signal_deliver(struct ksignal *ksig, struct pt_regs *regs)
 {
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
+	if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
 		/* '&' is intentional to spare one conditional branch */
 		if (current->rseq.event.has_rseq & current->rseq.event.user_irq)
 			__rseq_signal_deliver(ksig->sig, regs);
@@ -50,7 +50,7 @@ static __always_inline void rseq_sched_switch_event(struct task_struct *t)
 {
 	struct rseq_event *ev = &t->rseq.event;
 
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
+	if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
 		/*
 		 * Avoid a boat load of conditionals by using simple logic
 		 * to determine whether NOTIFY_RESUME needs to be raised.
diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index a36b472627de..8ccd464a108d 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -80,7 +80,7 @@ bool rseq_debug_validate_ids(struct task_struct *t);
 
 static __always_inline void rseq_note_user_irq_entry(void)
 {
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY))
+	if (IS_ENABLED(CONFIG_GENERIC_ENTRY))
 		current->rseq.event.user_irq = true;
 }
 
@@ -171,8 +171,8 @@ bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs,
 		if (unlikely(usig != t->rseq.sig))
 			goto die;
 
-		/* rseq_event.user_irq is only valid if CONFIG_GENERIC_IRQ_ENTRY=y */
-		if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
+		/* rseq_event.user_irq is only valid if CONFIG_GENERIC_ENTRY=y */
+		if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
 			/* If not in interrupt from user context, let it die */
 			if (unlikely(!t->rseq.event.user_irq))
 				goto die;
@@ -387,7 +387,7 @@ static rseq_inline bool rseq_update_usr(struct task_struct *t, struct pt_regs *r
 	 * allows to skip the critical section when the entry was not from
 	 * a user space interrupt, unless debug mode is enabled.
 	 */
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
+	if (IS_ENABLED(CONFIG_GENERIC_ENTRY)) {
 		if (!static_branch_unlikely(&rseq_debug_enabled)) {
 			if (likely(!t->rseq.event.user_irq))
 				return true;

