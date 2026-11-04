Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094B0606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ohtxq1Ju;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ghfbLetK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FtBaAdmIcl95OCI3PFXt9e6DtfWzoCVoY5/FJheSnIw=; b=ohtxq1JuJdHQSR3QrMKCKT6y6s
	cctkDLBRP3jXW4LYQ/2CwiGfBW/5ayIh9l9zRMX8hJON8nNtWOcjyn5UkQMB8LvW+JbT/N/Nri8jD
	9KQPez8m5HczkwPYQay2thKi/O+AmjN21+6Exx+xF+YPUuJHwqHpfbucUev5U7CvZxVyL1S2jpLjG
	FFtKPez3ZIujAqcDjSVAInO6yIvX9gY8s/lpL/eer9nhdoxEPEvT7oSGyyvLoqSPffBvZVZXOYjHp
	afthFSZxnSqiosGb2NdjTaG0xHwvnh73f3uxCKyxXYqK6xGQcoVd57SNAHGArDnZjPPGnOBf9QPYc
	Xn/sCSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdqx-00000005yhL-0PpZ;
	Wed, 04 Nov 2026 16:28:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdqt-00000005ygD-1M2V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:28:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A74C7169C;
	Wed,  4 Nov 2026 08:28:36 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58AAE3F632;
	Wed,  4 Nov 2026 08:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793809719; bh=E7sjNFFUNI1GtoHAUd5d5/lxoWzQs1vxAL3CvzkvnH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghfbLetKc6OstxcypkskSZI73knMHuyXtkpaRyIDOd8EUn1Iws6a1iD/OG1oMQBze
	 RXo/zeILWU4pzTnUn2ql7Qj7c8+Fzi4794NQHbx6Rq5mz3A5M38s6xUYm08C3BRWxy
	 HRMdBYsmNPYMxduSTn6PmIM3BHIZBcJYZRmTLKz4=
Date: Wed, 4 Nov 2026 16:28:35 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 1/2] arm64: module: Emit BTI veneers for cross-section
 calls
Message-ID: <autdMwEbDqF2u0Wr@arm.com>
References: <20261005110511.157016-4-ardb+git@google.com>
 <20261005110511.157016-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005110511.157016-5-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_082843_529313_1BB6AAF9 
X-CRM114-Status: GOOD (  30.56  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 05, 2026 at 01:05:13PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The compiler is permitted to omit BTI landing pads from static functions
> that never have their address taken, but are only called directly, even
> if those calls originate from other code sections.
> 
> This means that calls into a module's .text section from .init.text,
> which may need to be routed via a PLT if .text is out of direct
> branching range, may result in BTI exceptions due to the indirect calls
> performed by the PLT veneers. (Note that calls to .init.text from .text
> are not allowed.)
> 
> The 'solution' is to emit yet another veneer - this is what the ELF
> psABI for AArch64 mandates in this case.
> 
> So derive an upper bound for the number of veneers that may be needed in
> the core module region to ensure that any call from init code that ends
> up needing a PLT can be directed at a veneer with a BTI landing pad, and
> allocate the additional space.
> 
> Then, emit these veneers as needed, i.e., only when emitting a PLT entry
> for a call from an init code section to a normal code section in the
> same module. In practice, this only occurs when a module's .init.text
> happens to be allocated far away from its .text section, which might
> happen when the initial 128M 'near' module region runs out of space
> between allocating the core module and allocating its init region.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/Kconfig                  |   7 +-
>  arch/arm64/include/asm/module.h     |  12 ++
>  arch/arm64/include/asm/module.lds.h |   3 +
>  arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
>  4 files changed, 140 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index cab741a695f5..23879cb05d6b 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -210,7 +210,8 @@ config ARM64
>  	select HAVE_HW_BREAKPOINT if PERF_EVENTS
>  	select HAVE_IOREMAP_PROT
>  	select HAVE_IRQ_TIME_ACCOUNTING
> -	select HAVE_LIVEPATCH
> +	# https://lore.kernel.org/all/20260812162058.612202-5-ardb@kernel.org/
> +	select HAVE_LIVEPATCH if !ARM64_BTI_KERNEL
>  	select HAVE_MOD_ARCH_SPECIFIC
>  	select HAVE_NMI
>  	select HAVE_PERF_EVENTS
> @@ -2198,10 +2199,6 @@ config ARM64_BTI_KERNEL
>  	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
>  	depends on !CC_IS_GCC || GCC_VERSION >= 100100
> -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
> -	depends on !CC_IS_GCC
> -	# https://github.com/llvm/llvm-project/issues/215547
> -	depends on !CC_IS_CLANG || CLANG_VERSION < 210000
>  	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
>  	help
>  	  Build the kernel with Branch Target Identification annotations

I think this should be the other way around (and keep HAVE_LIVEPATCH
unconditional):

config ARM64_BTI_KERNEL
	...
	depends on !LIVEPATCH || (CC_IS_CLANG && CLANG_VERSION < 210000)

I also wonder whether dropping the compiler dependency should come with
some sanity check/assert for (the unlikely case) of a large vmlinux,
similar to one of Josh's patches or a boot-time check that skips
enabling BTI. At least until we get some generic compiler/linker
workaround for large images:

https://lore.kernel.org/all/8932e59a4f6e8383f37078dada1f23639b85a035.1786768375.git.jpoimboe@kernel.org/

There are some Sashiko comments. I'd ignore the big-endian ones since we
removed it and it had been marked broken for some time anyway. But the
other points look valid.

https://sashiko.dev/#/patchset/20261005110511.157016-4-ardb+git@google.com

Apart from those, I don't have other technical objections to the patch
but I wonder whether we'll find alternative options going forward that
make this fix redundant. E.g. allocating .init.text and .text together
(you had an RFC) or a new execmem_alloc_near() to try to place them
nearby.

In the meantime, would something like the following work for us instead
of the veneers? We won't free the .init.text module section but this
should be small. There's the ppc64 precedent.

bool module_init_section(const char *name)
{
	if (system_supports_bti_kernel() && strstarts(name, ".init.text"))
		return false;

	return strstarts(name, ".init");
}

-- 
Catalin

