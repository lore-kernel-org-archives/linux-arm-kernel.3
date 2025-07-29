Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548D9C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDl/Z2nDShRMQ7byYBS08byBrvvDkNBpeMrG9Oxjko0=; b=l1pRI/xBIVAskGu1j3gE6EpgBX
	W3IyCOrIFVE6A0XDbjaijzvGRze0UcLuT4iYlyptAMcLyUQaOFTdNByaWg0U2M43J+sU4blSsf4Rh
	4ylrkHFPlBeSWtPJBZJMIWW81su0PSbQUH4Hi2b1sFqYytJH2AFDoOi9ytuHGzsyckNlTpH+y9qOg
	93yOknANQfwTSSQBNA7ywNm/QIle+Y0UhTOxlpoE/KfsnI/868i6DGIOgutxrWJAnjdjzJzNPyebq
	PT07FLXQLTQ4xpFovdY0uLbIfkSGDupUyob6TFyQxmQGsLW1lDPK0jPhHdnOl/wfafZz+xm4IwqGw
	nD/dT44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugocv-0000000HPau-1ONo;
	Tue, 29 Jul 2025 18:00:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoaR-0000000HPJx-3MJ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 17:58:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D24E61516;
	Tue, 29 Jul 2025 10:57:52 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA4C33F5A1;
	Tue, 29 Jul 2025 10:57:57 -0700 (PDT)
Date: Tue, 29 Jul 2025 18:57:40 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 00/10] ftrace,bpf: Use single direct ops for bpf trampolines
Message-ID: <aIkLlB7Z7V--BeGi@J2N7QTR9R3.cambridge.arm.com>
References: <20250729102813.1531457-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729102813.1531457-1-jolsa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_105803_918735_AFAEBA71 
X-CRM114-Status: GOOD (  22.83  )
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

Hi Jiri,

[adding some powerpc and riscv folk, see below]

On Tue, Jul 29, 2025 at 12:28:03PM +0200, Jiri Olsa wrote:
> hi,
> while poking the multi-tracing interface I ended up with just one
> ftrace_ops object to attach all trampolines.
> 
> This change allows to use less direct API calls during the attachment
> changes in the future code, so in effect speeding up the attachment.

How important is that, and what sort of speedup does this result in? I
ask due to potential performance hits noted below, and I'm lacking
context as to why we want to do this in the first place -- what is this
intended to enable/improve?

> However having just single ftrace_ops object removes direct_call
> field from direct_call, which is needed by arm, so I'm not sure
> it's the right path forward.

It's also needed by powerpc and riscv since commits:

  a52f6043a2238d65 ("powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS")
  b21cdb9523e5561b ("riscv: ftrace: support direct call using call_ops")

> Mark, Florent,
> any idea how hard would it be to for arm to get rid of direct_call field?

For architectures which follow the arm64 style of implementation, it's
pretty hard to get rid of it without introducing a performance hit to
the call and/or a hit to attachment/detachment/modification. It would
also end up being a fair amount more complicated.

There's some historical rationale at:

  https://lore.kernel.org/lkml/ZfBbxPDd0rz6FN2T@FVFF77S0Q05N/

... but the gist is that for several reasons we want the ops pointer in
the callsite, and for atomic modification of this to switch everything
dependent on that ops atomically, as this keeps the call logic and
attachment/detachment/modification logic simple and pretty fast.

If we remove the direct_call pointer from the ftrace_ops, then IIUC our
options include:

* Point the callsite pointer at some intermediate structure which points
  to the ops (e.g. the dyn_ftrace for the callsite). That introduces an
  additional dependent load per call that needs the ops, and introduces
  potential incoherency with other fields in that structure, requiring
  more synchronization overhead for attachment/detachment/modification.

* Point the callsite pointer at a trampoline which can generate the ops
  pointer. This requires that every ops has a trampoline even for
  non-direct usage, which then requires more memory / I$, has more
  potential failure points, and is generally more complicated. The
  performance here will vary by architecture and platform, on some this
  might be faster, on some it might be slower.

  Note that we probably still need to bounce through an intermediary
  trampoline here to actually load from the callsite pointer and
  indirectly branch to it.

... but I'm not really keen on either unless we really have to remove 
the ftrace_ops::direct_call field, since they come with a substantial
jump in complexity.

Mark.


> 
> thougts? thanks,
> jirka
> 
> 
> ---
> Jiri Olsa (10):
>       ftrace: Make alloc_and_copy_ftrace_hash direct friendly
>       ftrace: Add register_ftrace_direct_hash function
>       ftrace: Add unregister_ftrace_direct_hash function
>       ftrace: Add modify_ftrace_direct_hash function
>       ftrace: Export some of hash related functions
>       ftrace: Use direct hash interface in direct functions
>       bpf: Add trampoline ip hash table
>       ftrace: Factor ftrace_ops ops_func interface
>       bpf: Remove ftrace_ops from bpf_trampoline object
>       Revert "ftrace: Store direct called addresses in their ops"
> 
>  include/linux/bpf.h           |   8 +-
>  include/linux/ftrace.h        |  51 ++++++++++---
>  kernel/bpf/trampoline.c       |  94 +++++++++++++-----------
>  kernel/trace/ftrace.c         | 481 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------------
>  kernel/trace/trace.h          |   8 --
>  kernel/trace/trace_selftest.c |   5 +-
>  6 files changed, 395 insertions(+), 252 deletions(-)

