Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89769E7DEF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSL2a4dz4q/APgbl8Q8Mh7iH7a4SNBvs18iz1k3EzMA=; b=c9hwhYiWYWhHzh5folkNYJW1jT
	otvda+cnsGqP9hvHop4RWQhaMLHTrOjmN71LxBtPEGB77yMMTRS3Q9pGHt8VjTK7p5u5S+vpCcMh/
	Lu0PkzHltm4ars5mCADKXqRA8Mpg/dumSb++acUw9+FsVpXxW3aJCDlBQCy+ZUTpLoWgEP2Q2orKK
	mciqfYij8i8KOtFfuxI8e4tWQ5vBi1nYP5CkhWbzTDFyi4ziWyTNVQuk4iSlqEx3Bt4OYQb6gLHEY
	7PV3FTK8VPpQIKZoSi0izwVoIY686/9lWZqu6lpZdWmozQxo8ej9IfTamcbkuHkmGbk5ZezslUuQw
	gCKtLq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvyp-00000005CIG-49fE;
	Mon, 02 Feb 2026 15:36:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvyp-00000005CHw-0qtB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4584960010;
	Mon,  2 Feb 2026 15:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AACDC2BC86;
	Mon,  2 Feb 2026 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770046606;
	bh=WI6zutmVBSxRxobYaH3/CHHeRqahghvOWUS1hAR6f9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZeEBiyj67lav4qkYYDtamQukkvU4UhwkXxxUd7IGB3J8tok8/UGdeU/bYWf8vcy1
	 32lYKKSfiDF5MyL3k8+rkj4WtW+JC0MMGaAzyQkV4jZ1cZ1/6ikLAKeiIMZQjWx658
	 ZLmkrIIW2u9BX9XSVZNdcZlJEtcuD/HChCtuu9h30eP/MD6+npqcEFjzQ6QF1ObyTn
	 XMNHY6odUN/gBuMisa1sTHMMYv77QjN3Udd2qRMED7S9Gt1zNEmzTInajbXFFeD97Y
	 tpVYTswxHkfSUb+5QmeBy3Y1PxgsIkEKV9cGSmcfC7w8JNGAk9x3cUZVe9dglCI/qR
	 MO8x6HRGKnbfQ==
Date: Mon, 2 Feb 2026 15:36:40 +0000
From: Will Deacon <will@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aYDEiOutq3_O8irP@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-3-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130132951.2714396-3-elver@google.com>
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

On Fri, Jan 30, 2026 at 02:28:25PM +0100, Marco Elver wrote:
> Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> 
> 1. Replace _Generic-based __unqual_scalar_typeof() with more complete
>    __rwonce_typeof_unqual(). This strips qualifiers from all types, not
>    just integer types, which is required to be able to assign (must be
>    non-const) to __u.__val in the non-atomic case (required for #2).
> 
> Once our minimum compiler versions are bumped, this just becomes
> TYPEOF_UNQUAL() (or typeof_unqual() should we decide to adopt C23
> naming).  Sadly the fallback version of __rwonce_typeof_unqual() cannot
> be used as a general TYPEOF_UNQUAL() fallback (see code comments).
> 
> One subtle point here is that non-integer types of __val could be const
> or volatile within the union with the old __unqual_scalar_typeof(), if
> the passed variable is const or volatile. This would then result in a
> forced load from the stack if __u.__val is volatile; in the case of
> const, it does look odd if the underlying storage changes, but the
> compiler is told said member is "const" -- it smells like UB.
> 
> 2. Eliminate the atomic flag and ternary conditional expression. Move
>    the fallback volatile load into the default case of the switch,
>    ensuring __u is unconditionally initialized across all paths.
>    The statement expression now unconditionally returns __u.__val.
> 
> This refactoring appears to help the compiler improve (or fix) code
> generation.
> 
> With a defconfig + LTO + debug options builds, we observe different
> codegen for the following functions:
> 
> 	btrfs_reclaim_sweep (708 -> 1032 bytes)
> 	btrfs_sinfo_bg_reclaim_threshold_store (200 -> 204 bytes)
> 	check_mem_access (3652 -> 3692 bytes) [inlined bpf_map_is_rdonly]
> 	console_flush_all (1268 -> 1264 bytes)
> 	console_lock_spinning_disable_and_check (180 -> 176 bytes)
> 	igb_add_filter (640 -> 636 bytes)
> 	igb_config_tx_modes (2404 -> 2400 bytes)
> 	kvm_vcpu_on_spin (480 -> 476 bytes)
> 	map_freeze (376 -> 380 bytes)
> 	netlink_bind (1664 -> 1656 bytes)
> 	nmi_cpu_backtrace (404 -> 400 bytes)
> 	set_rps_cpu (516 -> 520 bytes)
> 	swap_cluster_readahead (944 -> 932 bytes)
> 	tcp_accecn_third_ack (328 -> 336 bytes)
> 	tcp_create_openreq_child (1764 -> 1772 bytes)
> 	tcp_data_queue (5784 -> 5892 bytes)
> 	tcp_ecn_rcv_synack (620 -> 628 bytes)
> 	xen_manage_runstate_time (944 -> 896 bytes)
> 	xen_steal_clock (340 -> 296 bytes)
> 
> Increase of some functions are due to more aggressive inlining due to
> better codegen (in this build, e.g. bpf_map_is_rdonly is no longer
> present due to being inlined completely).
> 
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v3:
> * Comment.
> 
> v2:
> * Add __rwonce_typeof_unqual() as fallback for old compilers.
> ---
>  arch/arm64/include/asm/rwonce.h | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index fc0fb42b0b64..42c9e8429274 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -19,6 +19,20 @@
>  		"ldapr"	#sfx "\t" #regs,				\
>  	ARM64_HAS_LDAPR)
>  
> +#ifdef USE_TYPEOF_UNQUAL
> +#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
> +#else
> +/*
> + * Fallback for older compilers (Clang < 19).
> + *
> + * Uses the fact that, for all supported Clang versions, 'auto' correctly drops
> + * qualifiers. Unlike typeof_unqual(), the type must be completely defined, i.e.
> + * no forward-declared struct pointer dereferences.  The array-to-pointer decay
> + * case does not matter for usage in READ_ONCE() either.
> + */
> +#define __rwonce_typeof_unqual(x) typeof(({ auto ____t = (x); ____t; }))
> +#endif

I know that CONFIG_LTO practically depends on Clang, but it's a bit
grotty relying on that assumption here. Ideally, it would be
straightforward to enable the strong READ_ONCE() semantics on arm64
regardless of the compiler.

>  /*
>   * When building with LTO, there is an increased risk of the compiler
>   * converting an address dependency headed by a READ_ONCE() invocation
> @@ -32,8 +46,7 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	typeof(&(x)) __x = &(x);					\
> -	int atomic = 1;							\
> -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -56,9 +69,9 @@
>  			: "Q" (*__x) : "memory");			\
>  		break;							\
>  	default:							\
> -		atomic = 0;						\
> +		__u.__val = *(volatile typeof(*__x) *)__x;		\

Since we're not providing acquire semantics for the non-atomic case,
what we really want is the generic definition of __READ_ONCE() from
include/asm-generic/rwonce.h here. The header inclusion mess prevents
that, but why can't we just inline that definition here for the
'default' case? If TYPEOF_UNQUAL() leads to better codegen, shouldn't
we use that to implement __unqual_scalar_typeof() when it is available?

I fear I'm missing something here, but it just feels like we're
optimising a pretty niche case (arm64 + LTO + non-atomic __READ_ONCE())
in a way that looks more generally applicable.

Will

