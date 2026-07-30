Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4F5C53200
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 01:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oep9GUzmGHr26u2If40/oW9YH4ApgXIqp1l7c/0lb/w=; b=a+29qDRkz0U3c1kXTfpJFDka5W
	yqTMnky1OskY2zjMeEEzBv/EBh/3vZEOhaiyBwIVQQJ8HzmIffkzbKOBHFAolgpcUPFrfWqrJH3j7
	XpVhNEAKDnypNwbxTDF9nK3wDE0M+tt9ZzwfKNU5Uhb+htNsE8TeH+VRl5ne9aUh+wwtcPeFjTBxL
	6IsMVobEdMOrSUBHi8saFFjmvFCyNA5wRUeFmytELZvs4We5lRu+E2kwkJDJwiqiZPqYgX79cvLkr
	USbTYHmU96jDIaAE3ayGIGpeh29KTgpSeYCD4qzb98Vn4KRV0t8F3YfFzJlgzqiLZFTrxXEy5uDnr
	iNd2ob6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFNX-00000009Er8-0fuh;
	Thu, 30 Jul 2026 01:16:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFNT-00000009Eqi-3QG4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 01:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785374161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oep9GUzmGHr26u2If40/oW9YH4ApgXIqp1l7c/0lb/w=;
	b=MNTSY341ezvkFDG0SMxKoHzuxcvmQHQ/sHfVO3BSwX1qOQWMRrdrrjp4WLlBieNF3TopOi
	RZ91ZXrw3Bo5PFg4vxRpuKm1tt+VcV6SuNbbli5qjWHDuh4ebC/exBlNU+RdIXiGJBd/O3
	5baq2wwfSnj7TlS26vmBgb8RjKVbxtw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-_2QrTJkqNL6GEL1URfKMOw-1; Wed,
 29 Jul 2026 21:14:24 -0400
X-MC-Unique: _2QrTJkqNL6GEL1URfKMOw-1
X-Mimecast-MFC-AGG-ID: _2QrTJkqNL6GEL1URfKMOw_1785374061
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B967119560A2;
	Thu, 30 Jul 2026 01:14:19 +0000 (UTC)
Received: from localhost (unknown [10.22.81.218])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CB8531956094;
	Thu, 30 Jul 2026 01:14:15 +0000 (UTC)
Date: Wed, 29 Jul 2026 22:14:14 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [RFC PATCH] ARM, ARM64, LOONGARCH: Delay HW BP notification to
 task_work()
Message-ID: <amqlZiO8rxu_k08L@redhat.com>
References: <20260713144939.FuCj9yvZ@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20260713144939.FuCj9yvZ@linutronix.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: pfsQcUX4-Wq6NT_KXu0OZrzAZbPSiOIXoSn_oQos9y0_1785374061
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_181603_964829_F833D775 
X-CRM114-Status: GOOD (  23.68  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Clark Williams <clrkwllms@kernel.org>, James Clark <james.clark@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, loongarch@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, Oleg Nesterov <oleg@redhat.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jul 13, 2026 at 04:49:39PM +0200, Sebastian Andrzej Siewior wrote:
> Waiman, Luis, Ada reported that HW breakpoints on ARM64 trigger
> "sleeping while atomic" warnings on PREEMPT_RT. The hardware event is
> delivered with disabled interrupts and perf intrastrucure expects
> disabled interrupts while the overflow callback is invoked.
> 
> The callback then sends a SIGTRAP signal for which it acquires
> sighand_struct::siglock, a spinlock_t which becomes a sleeping lock and
> must not be acquired in atomic context.
> 
> Delay the event callback until the return to userland.
> Add perf_arch_hwbp_notify(), a generic perf callback which delayes the
> actual callback invocation to task_work_add() callback. This callback
> invokes the architecture defines callback arch_hwbp_send_sig().
> This requires struct callback_head and the functions require
> ARCH_NEED_PERF_HW_NOTIF to be defined.
> 
> This was reported against ARM64. ARM and LongARCH follow the same
> pattern are also converted.
> 
> Reported-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> Reported-by: Waiman Long <longman@redhat.com>
> Closes: https://lore.kernel.org/all/aho0eqjMESuHxECr@redhat.com/
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> 
> This is approximately the fifth iteration at which point I think I can
> share what I have.
> 
> Could this be tested, please? I tested it on arm64 for arm64 based on
> Luis' test. ARM compiles my HW lacks support for this I think (gdb
> aborts early). I hope the best for LoongARCH.

I tested your patch on baremetal (3 different aarch64 machines) and 3
different Virtual Machines. Apart from the one VM that didn't provide the
HW breakpoints the test used, I was able to reproduce the problem with
v7.2-rc5-rt3 and earlier kernels in all the other setups. Applying your
patch eliminated the backtraces. I ran several batches of 2000 and 10000
executions in a row of the gdb test from the original thread without a
glitch.

Having DEBUG_ATOMIC_SLEEP enabled in the kernel (along with PREEMPT_RT)
was all I needed to reproduce the problem with the unpatched kernel. After
I applied the patch I run tests with and without lockdep. No backtrace,
no complaints.

I started working on trying to reproduce the (possible) problem Sashiko
highlighted, but so far, no luck in reproducing that specific scenario.

Best regards,
Luis


