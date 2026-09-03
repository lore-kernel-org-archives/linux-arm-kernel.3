Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F29EC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vbjCRdrjxVp6fckV1i3kt+QR+aoKiSt4PvLxtPMrkc=; b=oNzzxlo60pCIkIvHuZ97v8XQl1
	o+aEzZLK/8QJAMRfsLe8/qMRqnfJrE44sk5CIh45Ml7bmWQeOXDjDJXN20CY1aDTdTz8kAlv7SvsE
	W3RW0AdVRxzioBf5NZ9LeRzVxoVwNLyFqPjhpYc7/xk99XLZX0PecD+/voX4PXHWcx6pA8e/nMitG
	hEXElyKrxTnBMWcmB6tv6pdVaDifz4QY9FsTbspZYBipXuXy1iGQ2YjZQqF48dq4Zg+CYYm1ta6HE
	tKUrPNJLCYZqs/+Jp2gP9Vie/+UPfgthbraL+Ya0n4l/N9HDP6GwFaI4Q5eIiHnbf3EwNxRt3WI3h
	t+/ZfWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yB-000000005uE-3SbJ;
	Thu, 03 Sep 2026 16:07:19 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29y7-000000005h4-0YQm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:07:18 +0000
Date: Thu, 3 Sep 2026 18:07:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788451632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/vbjCRdrjxVp6fckV1i3kt+QR+aoKiSt4PvLxtPMrkc=;
	b=xuZVTd+3e+XOsFzlbevv8WgpKXG5gTsuBBMkBxlya3sozHHOlzgelbcrxTZ3dc2S2fKUZH
	Eo2ofpB9QXz++1nNA+l2nW//I/NpSXT/vrPva2BUML6aRc3DqfHqlGlE1V2t3JJo/nIQwC
	4hoXTVevZUC8QVTDO0/gyce7p2CXCRV/uUfesLEFjgZfm0uG4U8QpsjXpPq1tbDCSMX+mx
	7gIEzaiL+A0P1bxr9Si/kf123/uOYqAAZha/i9aojgU1F18YicgLIuc7upSmZ7pQYX5oKR
	1iFVmlocKFD2B1HAW245xFUSV6/LtXCqmDzblVKJLJ/iTvmhYNie9oQEQsHYVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788451632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/vbjCRdrjxVp6fckV1i3kt+QR+aoKiSt4PvLxtPMrkc=;
	b=T8kn4im/sQC5stFlPR2Bqz8b9qO4j+lZamw3HssQ6xL7wclpxMen7l/f/4CP0sh13GTOKy
	vasVqJQNc7WAdJBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v2] ARM, ARM64, LONGARCH: Delay HW BP notification to
 task_work()
Message-ID: <20260903160710.vVf4gEL2@linutronix.de>
References: <20260814085118.OPEA_Ssn@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814085118.OPEA_Ssn@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090715_424732_209F1672 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, Russell King <linux@armlinux.org.uk>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, James Clark <james.clark@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Oleg Nesterov <oleg@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Waiman Long <longman@redhat.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Clark Williams <clrkwllms@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2026-08-14 10:51:18 [+0200], To linux-arm-kernel@lists.infradead.org wrote:
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

Did this get lost, should I repost it or is there something obviously
wrong with it and nobody wanted to hurt my feelings by telling me?

Sebastian

