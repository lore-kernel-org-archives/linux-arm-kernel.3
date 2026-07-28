Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152CBC54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6+R0LCxQeekp6wj7rvdvkEtiJ5BIDX3J9Wzr35njtk=; b=DFFWZgp9y6r3ZQlyjDt4cG3YAf
	HGXenLkLVGRumK71He68i0nt27dJUy4BI9jSXdwKcNWO6xPnSDwB+9qVyZp206WzNNype8+jgS4oo
	iTtK9qwEYnHXBcxXjmUwNCXjh0HM8WPqYHcQEkVHnedEzQeyXHn4Ohh4S5OZHjfCrXoQn7CBF2j6C
	j5XbpcZphv9PUwGqkOFaQAQoJZHACpfVnnDYACTSswZvFk7AnCf2kyF+bnJs29hY9wfq/slctPDaj
	+uaXUALx5tzzHvoDGAJEYlmX0MYLVFkuDw5LHe/aLv6aloAxeYdb+gTkSXna/KgBLmbCpqpNQ7/4P
	EVw0TR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolei-00000005xe0-2PFQ;
	Tue, 28 Jul 2026 17:31:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolef-00000005xde-2l29
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 17:31:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B526169E;
	Tue, 28 Jul 2026 10:31:43 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 500643F763;
	Tue, 28 Jul 2026 10:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785259907; bh=KwxVOT9RanBvHZZjm9RuSigNIRCQICh1YKEM1MGk1YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdB6N83X3iLpzBAs56YxTADvdNoNZXoS0zfJgLFb2XlYkQy2TH7DB2JXkyRnHUZXl
	 MpeXExUY6kB+w7GT0Op7HI0Bud9xBTrMwOuKLk0qVrWzTWhu2yK43hZw7aYkKKUMvq
	 LeqhuiBGAg5g3/XwD1qO7BaxvXDtzMHG5MRlXcs4=
Date: Tue, 28 Jul 2026 18:31:43 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	bpf@vger.kernel.org, Florent Revest <revest@chromium.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huawei.com>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without CALL_OPS
Message-ID: <amjnf5gz0xP5PTSB@J2N7QTR9R3>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_103149_779325_B3126DFE 
X-CRM114-Status: GOOD (  34.04  )
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

On Tue, Jun 09, 2026 at 05:19:25AM +0000, Jose Fernandez (Anthropic) wrote:
> On arm64, HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS is currently selected
> only when DYNAMIC_FTRACE_WITH_CALL_OPS is available. CALL_OPS, in
> turn, is mutually exclusive with kCFI: the pre-function NOPs it needs
> would change the offset of the pre-function type hash (see
> baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")),
> and the compiler support needed to reconcile the two does not exist
> yet.
> 
> The result is that a CONFIG_CFI=y arm64 kernel has no
> ftrace direct calls at all, so register_fentry() fails with -ENOTSUPP
> and no BPF trampoline can attach: fentry/fexit, fmod_ret and BPF LSM
> programs are all unavailable. Deployments that want both kCFI
> hardening and BPF-based security monitoring currently have to give
> one of them up. systemd's bpf-restrict-fs feature hits this today:
> https://lore.kernel.org/all/20250610232418.GA3544567@ax162/
> 
> CALL_OPS is an optimization for direct calls, not a dependency.
> In-BL-range trampolines are reached by a direct branch without
> consulting the ops pointer, and out-of-range trampolines already
> fall back to ftrace_caller, where the DIRECT_CALLS machinery
> (call_direct_funcs() storing the trampoline in ftrace_regs, the
> ftrace_caller tail-call) is gated on DIRECT_CALLS alone. 

It's true that this is not a strict functional dependency, but there is
a substantial performance cliff here.

With CALL_OPS we only fall back to the ftrace_ops_list_func() when there
are multiple ops associated with a given callsite. Where we have a
single ops for a callsite, if the direct call is out of range, the
ftrace caller will call trace_ops::direct_call.

Without CALL_OPS, if there are unrelated ops registered (attached to
difrerent callsites), the ftrace_caller trampoline will call
ftrace_ops_list_func(), and we'll iterate over all of the registered ops
to find the relevant ops and trampoline, every time an out-of-range
direct call is used.

So the big questions are:

(1) How often is a direct call being made?
(2) Where does BPF allocate its direct call trampolines?

From a skim of arch/arm64/mm/init.c, EXECMEM_BPF covers
VMALLOC_START..VMALLOC_END, the vast majority of which is out-of-range
for a BL from the core kernel or a module. So if EXECMEM_BPF is used,
that's likely to be problematic.  Hopefully I'm missing something such
that BPF trampolines are almost always allocated in-range of a BL?

When we originally implemented CALL_OPS and DIRECT_CALLS for arm64, the
understanding was that we'd have many ops with direct calls. We believed
that the ftrace_ops_list_func() penalty was so substantial that it
wasn't worthwhile supporting direct calls in a configuration where
bouncing through that would be common.

If we need to support this configuration, then I strongly suspect we
need to make other changes too in order for it to be worthwhile.

> s390 and loongarch ship HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS this
> way, without having CALL_OPS at all.

Following from the comment regarding EXECMEM_BPF above, it looks like
both s390 and loongarch don't define EXECMEM_BPF, and only define
EXECMEM_DEFAULT with a subsstantially limited range, which I suspect
keeps their direct calls within range.

> Patch 1 prepares ftrace_modify_call() to build without CALL_OPS by
> widening its #ifdef and using the existing ftrace_rec_update_ops()
> wrapper (no functional change for current configurations). Patch 2
> drops the CALL_OPS requirement from the DIRECT_CALLS select.
> 
> Configurations that keep CALL_OPS (clang !CFI, and GCC without
> CC_OPTIMIZE_FOR_SIZE) are unchanged. We verified this: in an arm64
> clang build, every object file is byte-identical before and after
> the series except ftrace.o itself, and its disassembly is identical.
> CFI builds (and GCC -Os builds) gain working direct calls, with
> out-of-range attachments taking the ftrace_caller dispatch path
> instead of the per-callsite fast path.

Can you comment on how you've tested in-range vs out-of-range
attachements here?

> We tested on a 6.18.y-based kernel and on this base with clang
> kCFI builds (CONFIG_CFI=y, enforcing) under qemu (TCG, and KVM on an
> arm64 host) and on GB200-based arm64 hardware: fentry/fexit, fmod_ret
> and BPF LSM programs load, attach and execute; the ftrace-direct
> sample modules (including both modify samples, exercising
> ftrace_modify_call()) run cleanly; no CFI violations observed. The
> fentry_test, fexit_test, fentry_fexit, fexit_sleep, fexit_stress,
> modify_return, tracing_struct, lsm and trampoline_count selftests and
> the ftrace direct-call selftests (test.d/direct) pass on the new
> configuration with results identical to a CALL_OPS kernel built from
> the same tree, and a broader test_progs sweep showed no differences
> attributable to this series. Without the series, all of the above
> fail at attach time with -ENOTSUPP.

Have you made any performance measurements, or was this just functional
enablement?

Mark.

> riscv has the same gap (its DIRECT_CALLS select also requires
> CALL_OPS, and its CALL_OPS is likewise !CFI); if this approach is
> acceptable for arm64 we can follow up there.
> 
> ---
> Jose Fernandez (Anthropic) (2):
>       arm64: ftrace: prepare ftrace_modify_call() for use without CALL_OPS
>       arm64: ftrace: allow DIRECT_CALLS without CALL_OPS
> 
>  arch/arm64/Kconfig         | 2 +-
>  arch/arm64/kernel/ftrace.c | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260607-arm64-ftrace-direct-calls-152230ef7077
> 
> Best regards,
> --  
> Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
> 

