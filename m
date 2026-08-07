Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEFCC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrL6gBCAOxHb0LQHDdbrlJolZxiGNWOy/qwBrxrXEdw=; b=4JFSeZNrVZ+hc5+rxjHOMwm9/8
	NtkdiiWUFjXQC96jtiozNwz8XbKpnuU5LxoNWWCzTy/zoNfGpUQVqok5ecGJpXUf0h4FcfRv97Dxo
	LzvSfAHoQrrdavvy0HHKa5UzFejpZ67plmMjSrl6OMP59cWuI/RVlyR9bArAbjc57jvkIc7W4qrXa
	uK0Y2CBGpyTZHJyARFj0AY6LK1AA5I2Rfhk1MzXR2JXYhF8Nksyh9rnQkNuTB9sDmKdTT+oegJcnq
	rDu7Rp/S8uvPbEgGMIk574OzqJswOSsCwsi0+jBhCmzg8tACOuecHqYV/ekUOcpjEzjc8jofQfkad
	wRVaT1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKtK-00000008AT0-0Swj;
	Fri, 07 Aug 2026 13:45:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKtI-00000008ASY-0gXw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:45:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so2629812f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 06:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786110338; x=1786715138; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DrL6gBCAOxHb0LQHDdbrlJolZxiGNWOy/qwBrxrXEdw=;
        b=jf3JDVUG/ykyVD5D9o0+xCrTHKJzF8fbrL7LB5ou2feTM//Fof74/4nOqMLQKW7r9K
         4/YalcfstZ5b1AlNuibJ8iFcBpqiFf2szaXG3eGq6e6MNHDUruYU8kJ3gUmlcZGMomGd
         LgTcET23lPvnTI95GxTar0zkLs8Q1h45hQ2odJV2CXOq8SSDZzXU7jzBZredWDVnmxzO
         LhpHPhrZi37AqnK8cK1UjchxJrun5Ie0VpS4eRW9YW/+eq7oKGLO0zfni4i+DjFBOae5
         dSqNPfcIYeX0CMqOnPubIjnYsJiMrXMeLPKi5YNAifgJMn/9aiwsr7ya7YZPgTAZtA3m
         8I5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786110338; x=1786715138;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrL6gBCAOxHb0LQHDdbrlJolZxiGNWOy/qwBrxrXEdw=;
        b=VotdK+ta/aXoH39yNIXir/wlhO/Ne5qVr9/3taB5UMYUNcyXW8QTcSqXIOhfaYwHOS
         LxkHPUa0EzbCTduJhkwjkC84AWSThlQ7KjdapR0VpCHRgEENOH9MWzmlFkUqdU06I1f0
         nSztVG85hPEqinajZCZ5iRauCcNLAIkIRsiLnRZQN3wVw1GcJb8I4X8SnplHYe+iQYrv
         +6Tk0l3DFgKIRx/fxHiy5DMgLBh7NJ6k333mBJmbxhvsfRQWtC1+xcndSc5VcrjF6MEr
         ob2LKx1GjeBg/LQHmE+WCSc7mXmHqiM4Wl4FWJZd1RT2vE0LLJ2HUdm8WQcx27bvBEld
         wgrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5WM0gfr6aOTb87dAcdDLesgdTGa0kGd9WkjHV5C+4V4F9lQslo0Rs9zRQdkPpt1luMC2bTZQ/Cm9dmXH/O8FB@lists.infradead.org
X-Gm-Message-State: AOJu0YzOVaFfDkfNrpYPM/zZ45nN0GTEP0zjDBwfKwSSBqwE63SVXdEP
	3FVaEwnLkcNN0uBaz5OzYUT3N7+kTabO/4yexJ5yix7LJeJ68lDprqkVra6QFjqfoA==
X-Gm-Gg: AR+sD128Ek25RU/Pj81qkE1+VGFczMykCvHepiT//7EepGd0g4e08XddyX5YvJJFCK3
	fHEcaBTw+NxK7oa4Sg58p5XLH3oWuTYgIsd/f/lQkcTXQJPank3mkEofp3bNVx8edFSrQwZV6yC
	TNWkku82m440efCjQbvoFLKB0no5ZNaWPR4o1wPxgO4b7Nj5yjxIX1i/7TONhmZCqqxGUShU+fI
	UwV0iaYOTgz+CSK27LB4XYgjAYmi4BCLfyal8eOUj948vlsjaihK9x4T2arvW8/iRIE3Pko70es
	sEFNNu9rA/PhF8kPFVKXw5vZ7e/TuMf9EdAYM50rwX+QJdExXIWNpzN5AiCVRPkNMCNZC6gPX/Z
	CCAivGskh9OYI87WFMY+Baa/ZHipRBRDEB7l2fvltgZrLYjOj5TqfwIuFryR4THnwHBFfhWIjoU
	gjaX/9pwVrejBrkJx9TyS5uhEYq+4GSDHSrT0JX60Oamr5igkEOtWb8MtyNdHADLg4Rj+Q7j3h7
	EWzn4pAcW+DGgeldsqC48/ft3NHRbMmQJRe2wfM1w==
X-Received: by 2002:a5d:5e86:0:b0:47f:ebe3:ca31 with SMTP id ffacd0b85a97d-47fec62e00bmr38542831f8f.28.1786110332995;
        Fri, 07 Aug 2026 06:45:32 -0700 (PDT)
Received: from elver.google.com (24.125.187.35.bc.googleusercontent.com. [35.187.125.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8d50sm5963422f8f.24.2026.08.07.06.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:45:32 -0700 (PDT)
Date: Fri, 7 Aug 2026 13:45:28 +0000
From: Marco Elver <elver@google.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to
 .need_resched
Message-ID: <anXheKZ7zKNw1oD_@elver.google.com>
References: <d345dc9f-c61e-4db5-a342-11b0ff3fb846@paulmck-laptop>
 <amyaRXx8zXxOMgTL@J2N7QTR9R3>
 <13df4ff4-8594-4c37-b25f-860248a222cf@paulmck-laptop>
 <4fa802e7-6cfc-4cce-afee-c29b28171ad3@paulmck-laptop>
 <anR28GyRtCpApQYX@willie-the-truck>
 <ca54b283-3349-43d4-9460-32b084709d67@paulmck-laptop>
 <anXKRdA9sUziFda5@willie-the-truck>
 <CANpmjNPCM0NV1EN2pNBf3EBBk8eLjbGGAiZ_+rJkoROJtG3jFQ@mail.gmail.com>
 <anXbTwhaWZCIxxTg@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anXbTwhaWZCIxxTg@willie-the-truck>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_064540_234926_371FE778 
X-CRM114-Status: GOOD (  21.76  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, dvyukov@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Aug 07, 2026 at 02:19PM +0100, Will Deacon wrote:
[...]
> Ok, but then I don't understand how these accesses can race. They appear
> to be on the same CPU, in the same IPI handler.

The only way this could happen is with an NMI, but that's not the case
here? I should have looked at the 2nd stack trace, and it seems to be
clear that this is a false positive: KCSAN sets up a watchpoint on an
address that is also accessed by __delay.

One problem with disabling KCSAN in this CPU's context is that we'd fail
to detect data races from nested interrupts.

So yes, the best way forward is to disable KCSAN in the delay
implementation. And I recall doing this for x86, which has this:

	[arch/x86/lib/Makefile]
	...

	# KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
	KCSAN_SANITIZE_delay.o := n

So let's do this for arm64, too. Sorry for the noise.

------ >8 ------

From cfea3a0c12b2e685ce04c28b1bd207f0e4c05a56 Mon Sep 17 00:00:00 2001
From: Marco Elver <elver@google.com>
Date: Fri, 7 Aug 2026 13:37:32 +0000
Subject: [PATCH] arm64: Disable KCSAN instrumentation in delay.o

KCSAN relies on udelay() for injecting delays. To avoid recursively
triggering a watchpoint, where KCSAN sets up watchpoint on an address
that is accessed by udelay() in the same thread, disable instrumentation
in arm64's delay implementation.

Paul found a manifestation of this as follows:

| BUG: KCSAN: data-race in __delay / set_need_resched_current
|
| read (marked) to 0xffff000005899b48 of 8 bytes by interrupt on cpu 8:
|  __delay+0xb0/0x378
|  __udelay+0x4c/0x60
|  kcsan_setup_watchpoint+0x3b4/0x820
|  __tsan_unaligned_write4+0x228/0x26c
|  set_need_resched_current+0x138/0x1a8
|  rcu_exp_handler+0x418/0x4a0
|  __flush_smp_call_function_queue+0x36c/0x4a0
|  generic_smp_call_function_single_interrupt+0x20/0x30
|  ipi_handler+0xec/0x558
|  handle_percpu_devid_irq+0x220/0x2a0
|  generic_handle_domain_irq+0x84/0xb4
|  gic_handle_irq+0x64/0x144
|  call_on_irq_stack+0x30/0x48
|  do_interrupt_handler+0x80/0xb8
|  el1_interrupt+0x3c/0x60
|  el1h_64_irq_handler+0x18/0x24
|  el1h_64_irq+0x6c/0x70
|  smp_call_function_single+0x18c/0x25c
|  sync_rcu_exp_select_node_cpus+0x534/0x8bc
|  rcu_exp_sel_wait_wake+0x358/0xef4
|  wait_rcu_exp_gp+0x30/0x44
|  kthread_worker_fn+0x1b4/0x5dc
|  kthread+0x1d8/0x204
|  ret_from_fork+0x10/0x20
|
| write to 0xffff000005899b4c of 4 bytes by interrupt on cpu 8:
|  set_need_resched_current+0x138/0x1a8
|  [...]

This matches what is already done in arch/x86/lib/Makefile.

Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
Fixes: dd03762ab608 ("arm64: Enable KCSAN")
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm64/lib/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 448c917494f3..b33e1ca4a781 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
+
+# KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
+KCSAN_SANITIZE_delay.o := n
+
 lib-y		:= clear_user.o delay.o copy_from_user.o		\
 		   copy_to_user.o copy_page.o				\
 		   clear_page.o csum.o insn.o memchr.o memcpy.o		\
-- 
2.55.0.654.g21b8a5bc05-goog


