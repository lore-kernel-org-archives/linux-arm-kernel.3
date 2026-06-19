Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27001CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKYWa/kKv1FUIk4EMf+/2smVEZNT8x+DETzoP4RcXu0=; b=SrriF4RD22KnoLEIO3gTBVZJ0Q
	GC4Fp//VJe0ol59WWgte2l8SzEQAg+V8TKa5dP5/cnI3GPp8/vuB4oIWwWZMZjnA8DkTZ0cFQkdoQ
	8d/zrPQzYnM3Ti8XJBodzPvXa9ezgXlO6UcleDKWWlFnQM7WHFWaie8wYkRPdRNqhCAxg+lPC3zCO
	8VxtOvCEIz/lHA79wa96AWGVqZH2HOnA9N1elxHrNS5yqZ4kmlOd54tTbBGSBlQm9XG8hw5bjAaNw
	0+qMszh3pG8MqRVdtCYNSnPOyF03So60UPfTzfVxrxR9GfyZaj03K/uUqXcalnzTPBTwKOs++uzEx
	gk9LcKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabBk-00000002g5q-04Yz;
	Fri, 19 Jun 2026 15:31:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabBj-00000002g5j-0Yuz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 15:31:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87D3840D88;
	Fri, 19 Jun 2026 15:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454DB1F000E9;
	Fri, 19 Jun 2026 15:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781883082;
	bh=GKYWa/kKv1FUIk4EMf+/2smVEZNT8x+DETzoP4RcXu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QlMgV1cE6tVSJJtcjO3IAoVO8QeR02Q1zvHqIiCw4J1DztrwmVSTyv/zvRTiVxJdp
	 hYwxhhQfpaSUHeMYCHCvNefRO8iES/W8FA2MqXJgnfML08HePpIyek48scePYPLsEL
	 VxJinvk+RJTDshiNIGF24cC4+tDTxOasXwUqdh4X+f49L3jX2qpOM7JiX6/yXZQByW
	 BeTjqCGGUBIYKAzhnrSvtoiXQMvJf2yzD3q+s6cTzAddXbzAZuF0/wGoy6YJlpB/9O
	 gB4ay+GChKVb68jzzvr4D+XugLsIBLp90wxt4s5eGH91yCA21YkGR+1y+Enj1AaWU3
	 6x7G0ZRjAfhug==
Date: Fri, 19 Jun 2026 16:31:14 +0100
From: Will Deacon <will@kernel.org>
To: Fredrik Markstrom <fredrik.markstrom@est.tech>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Santosh Shilimkar <santosh.shilimkar@ti.com>,
	Olof Johansson <olof@lixom.net>, Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>,
	Ivar Holmqvist <ivar.holmqvist@est.tech>,
	Malin Jonsson <malin.jonsson@est.tech>
Subject: Re: [PATCH v2 0/3] arm64: perf: Skip device memory during user
 callchain unwinding
Message-ID: <ajVgwgSl1Pf7d_Z8@willie-the-truck>
References: <20260430-master-with-pfix-v3-v2-0-bd526ec04a75@est.tech>
 <agsq4wZMGth-T3BG@willie-the-truck>
 <agweYAbxRWOs41BE@elx-5cg6022w5t>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agweYAbxRWOs41BE@elx-5cg6022w5t>
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

On Tue, May 19, 2026 at 10:25:04AM +0200, Fredrik Markstrom wrote:
> On Mon, May 18, 2026 at 04:06:11PM +0100, Will Deacon wrote:
> > On Thu, Apr 30, 2026 at 12:55:12PM +0200, Fredrik Markstrom wrote:
> > > Perf callchain unwinding follows userspace frame pointers via
> > > copy_from_user. A corrupted or malicious frame pointer can point
> > > into device I/O memory mapped into the process (e.g. via UIO or
> > > /dev/mem), causing the kernel to read from MMIO regions in PMU
> > > interrupt context. Such reads can have side effects on hardware
> > > (clearing status registers, advancing FIFOs, triggering DMA) and
> > > on arm64 can produce a synchronous external abort that panics the
> > > kernel.
> > 
> > Hmm, but why is unwinding special in this case? If userspace has access
> > to sensitive MMIO/device mappings, it can presumably pass them to
> > syscalls and trigger crashes all over the place?
> 
> You’re totally right, a broken app with access to hardware like this can
> already cause chaos by passing bad pointers to syscalls etc. But the big
> difference here is who is to blame when things crash.
>  
> If an app passes a bad pointer to a syscall, it’s self-inflicted.

So I was going to argue that building arm64 code without frame-pointers
is self-inflicted, but it looks like that's the default in GCC for some
bizarre reason.

> Unwinding here is asynchronous and unrelated to the application.
> Perf interrupts a perfectly healthy app at a random moment. If that app
> is using the frame pointer as a normal register (totally legal in
> optimized code), it might hold a junk value that points to MMIO memory.
>
> If the kernel blindly follows that junk pointer during an unwind, perf
> causes the crash. I think it's acceptable that an app (with hardware
> access) causes a crash if buggy, but I don't think it's acceptable that
> a profiling tool is causing a crash just by looking at it.

I can see your argument, but I'm also not hugely keen to add fastgup to
our stack unwinder for each frame record. It's also not clear to me how
you avoid the mapping changing between the check and the access, given
that you still appear to use the user mapping for the unwind. Do other
architectures have this issue and, if so, how do they solve it?

If we could guarantee that the fault is synchronous, then we could
presumably hook up the uaccess exception fixup handlers.

Will

