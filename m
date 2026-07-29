Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0FDC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LE0auUINu/x6r3MKpGL6ong08p31tBcJtb4U+bAewvE=; b=iY3k4nZlR2AxmoWd4kqxXBMOlK
	Yhdo1eOuo8zRL3j3p6kL2MIJu/pyz5sDHz7ptheL94MVuMrLqSIX0vJbmaWGnYII0z0cjcah+DImK
	aoRgOY5nFNwPpM4OgFft4vCxXGWSTtix9+7p1Hc13hcfpLwfZAo3JBP6z0/cRc0Dp0XzYTLyaEDxB
	N1BkweH9+8eT5uL9iJH/BnHyPmwqQRel2I+/7vhfbh2Xr09mWTCWIIpnPonEak46k39ivReQ1eAQT
	D17HYJFNssARyz03uXdXWA/nlhViYONOMZsM8MLENDdmwjqhaJIVz42Qzmf2RFr5Y0n9F0P9fvFGW
	5ZXe+EAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4sR-00000008CFt-1pJL;
	Wed, 29 Jul 2026 14:03:19 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4sP-00000008CEs-1TX0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:03:18 +0000
Date: Wed, 29 Jul 2026 14:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785333781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LE0auUINu/x6r3MKpGL6ong08p31tBcJtb4U+bAewvE=;
	b=LrgSg9yRhS5W6xpkWx9r9+eDJkKcDzCNDS9+j6/SbnNx7o1wA6fzFR1r67s/mndVmEfaim
	RZtbpkihgWk1BnX65qwR4pDAyWvKTUhW+0X24ftnH+8hmcZUDkFCO9B7z9WHutNEx2YbwM
	pefAngwFnMiQOtvHGUzT0YMZIBj5fKk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huawei.com>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without CALL_OPS
Message-ID: <amn7cBQ-cqs2XlKV@linux.dev>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
 <amjnf5gz0xP5PTSB@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amjnf5gz0xP5PTSB@J2N7QTR9R3>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_070317_685663_3B13FB5C 
X-CRM114-Status: GOOD (  29.36  )
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

Hi Mark,

Thanks for the review, answers inline.

On Tue, Jul 28, 2026 at 06:31:43PM +0100, Mark Rutland wrote:
> So the big questions are:
>
> (1) How often is a direct call being made?

The workloads that want this are always-on. In our case a BPF LSM
security monitor covers file, exec and socket hooks, so it sits on
syscall-rate paths on busy machines, and fentry-based observability
behaves the same way. That is why we measured per-call dispatch cost
below.

> (2) Where does BPF allocate its direct call trampolines?
>
> From a skim of arch/arm64/mm/init.c, EXECMEM_BPF covers
> VMALLOC_START..VMALLOC_END, the vast majority of which is out-of-range
> for a BL from the core kernel or a module. So if EXECMEM_BPF is used,
> that's likely to be problematic.  Hopefully I'm missing something such
> that BPF trampolines are almost always allocated in-range of a BL?

You're not missing anything. BPF trampolines come from bpf_prog_pack,
which allocates via EXECMEM_BPF, and we confirmed the consequence at
runtime. Across every boot and attach in the measurements below, the
trampoline landed in the same execmem slot while the kernel text moved
with KASLR, 50-90 TB out of BL range. Only a handful of boots, but
EXECMEM_BPF spans all of vmalloc and has no reason to land near
kernel text, so I would expect out-of-range to be the common case
here rather than the exception.

> When we originally implemented CALL_OPS and DIRECT_CALLS for arm64, the
> understanding was that we'd have many ops with direct calls. We believed
> that the ftrace_ops_list_func() penalty was so substantial that it
> wasn't worthwhile supporting direct calls in a configuration where
> bouncing through that would be common.
>
> If we need to support this configuration, then I strongly suspect we
> need to make other changes too in order for it to be worthwhile.

Agreed. One idea I would like your opinion on is an in-range
allocation preference for BPF trampolines, since execmem seems to
have the shape for it on arm64 already. EXECMEM_DEFAULT prefers the
module_direct_base window ("prefer to allocate within direct branch
range of the kernel") and falls back when that neighborhood is full,
while EXECMEM_BPF spans all of vmalloc with no preference. Giving
trampolines the same preference would need no new dispatch machinery,
and the measurements below suggest it recovers 93% of the gap to the
CALL_OPS baseline. Does that direction sound right to you, or is
there something in the CALL_OPS design that argues against it? If it
holds up I am happy to write it as a follow-up to this series.

> Following from the comment regarding EXECMEM_BPF above, it looks like
> both s390 and loongarch don't define EXECMEM_BPF, and only define
> EXECMEM_DEFAULT with a subsstantially limited range, which I suspect
> keeps their direct calls within range.

That matches our reading. Their limited EXECMEM_DEFAULT ranges keep
direct calls in range by construction, same idea as the above.

> Can you comment on how you've tested in-range vs out-of-range
> attachements here?

Reachability is decided per attach at patch time.
ftrace_find_callable_addr() picks the direct BL when the target is in
range and ftrace_caller when it is not. In our runs we read the live
trampoline and patch-site addresses from /proc/kallsyms and computed
the BL-range verdict for every attach, and every attach came out
out-of-range. So all of the original series validation was
out-of-range too, per the allocation behavior above.

To get numbers for the in-range side we forced it on a test rig
instead of writing the real change. A small bench-only patch (six
lines) makes arch_alloc_bpf_trampoline() allocate from
execmem_alloc(EXECMEM_MODULE_TEXT, ...) instead of bpf_prog_pack, and
the guest boots with nokaslr so the module window is always within
reach. From there the existing reach check does the rest and patches
the direct BL by itself. So the rig only tells us what in-range is
worth, the allocator preference above is what I would actually
implement.

> Have you made any performance measurements, or was this just functional
> enablement?

The original posting was functional enablement, so after your review
we measured the per-call cost. The rig is a KVM guest with 8 vcpus on
an arm64 Graviton metal host, 6.18.36 with this series, fentry on
__arm64_sys_getpid, 20M calls per run, per-call overhead taken as
traced minus untraced. Six passes across three fresh boots per
configuration, ranges below are min to max over those six passes.

  CALL_OPS baseline (CFI off):              17.8-18.3 ns
  series path, out-of-range, no other ops:  34.5-35.6 ns  (~2.0x)
  same, plus N unrelated ftrace_ops
  (function tracer on vfs_read):
    N=1                                     41 ns
    N=4                                     53 ns
    N=8                                     68 ns
    N=16                                    98 ns
  in-range trampoline (rig above):          18.7-19.4 ns  (~1.2 ns more)

The extra-ops rows are the ftrace_ops_list_func() cost you were
worried about, a straight 3.9 ns per registered op, and paid
everywhere since the traced callsite never matches their filter. The
in-range trampoline closes 93% of the gap to baseline, though the
passes still sit a bit above, so not quite identical.

Thanks,
Jose

