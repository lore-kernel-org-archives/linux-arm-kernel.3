Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E03CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7fZnrtBd3MzTcOpfIWwsZnM6g3Bkm0P4fYMYH0n4+Q=; b=AcKby2PAhtwlJY6Z4serc0xu94
	tBFhvAFK2OwMVYJDuGiaJoZwzPwqifNJ3d2hHG3YeZMXhgbzsj0DrEsNhEZDwHesaGxHw2Md+6Mm+
	CHimKZRnC8MGhqbRmJKqS0xfdksHOJuDlrofTvJYDhqrx3wo5gNhr5bljMVSwjRpx7MAstdC5z7tq
	xI1PuRUFUQoU3FUlEWvUfZhjU1d/pNb/sxdYjFBJPZzSP6Tf/2llfg+Ez63u8YtgVemhCZc1ePeJm
	57gOWRq9G+IGRtkJSUaW+jxbUdN305Wk9cCsbk0gg0MinuvOfYkx25aN6V6aNE3YhbzyEWn6vmrbV
	mW4fug3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sHg-00000008dQO-3p7L;
	Tue, 08 Sep 2026 09:38:32 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sHe-00000008dOf-1yLR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:38:31 +0000
Date: Tue, 8 Sep 2026 11:38:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788860308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7fZnrtBd3MzTcOpfIWwsZnM6g3Bkm0P4fYMYH0n4+Q=;
	b=b3hKLnkpAyvy/BgVkCybg1woRIxg3mMEReV4irm3g+SWRIBY/HUN+jfcHA+o3n9G0TlfnD
	+4s6YCIeXuBTyVwkSPAv3U3D7JkVvrR6yovUqCS0khx5OOzcJe8v1GEof20VR38KQ4oUTA
	oTyrutQWkPR/hngX0h/NRQS+R5xWRlIAEc19xzXPIA2jsujxaUxym5GDcaKW6zSAL5CC6e
	lDsk1XMSUk2CNMcxwjMUwYz7zOYSI1aNT+7Gr3IBYzlwLyPrQftKZP41GUCKBcHdvrYVip
	gvCTlZjUpdow88Cjljtt2tYLi3/RzRW0NkG/zAFBnWdoVGh96Du3/CdlQ/c5Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788860308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7fZnrtBd3MzTcOpfIWwsZnM6g3Bkm0P4fYMYH0n4+Q=;
	b=FdytLzOH5qdsMjt74W6WRHV+nX7GW7p+ezl+S07BdlCbtDKIjIfC7jz/m6K25I/G20mubY
	8FlSJv/XjNyfjCCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Russell King <linux@armlinux.org.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
	Ian Rogers <irogers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Waiman Long <longman@redhat.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>
Subject: Re: [PATCH v2] ARM, ARM64, LONGARCH: Delay HW BP notification to
 task_work()
Message-ID: <20260908093826.ofGxmRRK@linutronix.de>
References: <20260814085118.OPEA_Ssn@linutronix.de>
 <20260903160710.vVf4gEL2@linutronix.de>
 <apmknG55qFAn8EPf@shell.armlinux.org.uk>
 <20260903133146.07095885@gandalf.local.home>
 <20260904155404.ESPFg3zi@linutronix.de>
 <ap7OMYBVKUrQjX9O@shell.armlinux.org.uk>
 <20260908075455.OffmMhrB@linutronix.de>
 <ap_AhKXlAWecV3BI@shell.armlinux.org.uk>
 <20260908083740.0qERUBOE@linutronix.de>
 <ap_Kv73A8exPhK-j@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ap_Kv73A8exPhK-j@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_023830_644567_0B409879 
X-CRM114-Status: GOOD (  20.29  )
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

On 2026-09-08 09:43:43 [+0100], Russell King wrote:
> > > > The linked report shows a backtrace by "BUG: sleeping function"
> > > > originating from el0_breakpt() -> perf_bp_event() following by sending a
> > > > signal force_sig_fault() followed by rt_spin_lock() and
> > > > __might_resched(). It also contains a reproducer.
> > > > 
> > > > The first sentence has the part
> > > > | The hardware event is
> > > > | delivered with disabled interrupts and perf intrastrucure expects
> > > > | disabled interrupts while the overflow callback is invoked.
> > > 
> > > *Where* are interrupts disabled?
> > 
> > On exception entry point, that would el0t_64_sync() for arm64 as in the
> > report.
> 
> Oh FFS. So why does this need to be done on ARM? Explain it. This is
> what I'm trying to get out of you, but you're being very resistant
> to providing the technical details. I can only think you haven't
> actually done the analysis.

I had the feeling that this is not what you were expecting but I wasn't
sure what you were expecting either.

The hardware breakpoint is delivered to the OS via an exception and on
exception entry point the interrupts are disabled. This isn't unique to
ARM but the same on other architectures, too.
It is not limited to ARM but also Loongarch which is sending a signal in
its handler (the one registered via register_user_hw_breakpoint()).
It is not an issue on X86 because they don't send signal but just toggle
the DR6 register.
powerpc and sh have different logic where the perf event is disabled
without sending a signal.
xtensa is the only one untouched which does send a signal from the
hw-breakpoint handler but xtensa does not support PREEMPT_RT and
therefore doesn't enforce proper lock nesting (so this is likely not the
only issue).

> So, NAK.

Would you reconsider, please? It does not seem justified.

Sebastian

