Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF322C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 10:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDsSGB1xRhkRov1KMpYy6biawVkrNNWECkhOPtva83U=; b=I6IJOIirXvPtJ0pW6KpjlQeS8d
	cLwPVgio66SwkOFcIXbASTa0eRFmwE/qkRQvvssaOKhL3LoOQFqkIHlDBa1EhZNkARq2PSWcEJE5W
	UuAQtdpz3B90pl75SromA9mWLZ3ajf1mOBEhyAzYtUoM5HtkSVcOn3reNZSXwVVAqg73mCl2jl3Hs
	Om2ZVJLbi00xDbkpVMoPJxbBkM64hPYAufa07jduO++s+4YBwviN3LzOCYQUEMaNOtkz85aBF/Wv3
	fsvYLt/xa5LRhHMeofD+Z0MIPBh9ZJpnH9jt069xdeoCuig+lhsHuE8gyuj8BhLSUjTztB6jO7kcr
	E/GtnDYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjZ5-0000000DpsT-2e1a;
	Tue, 11 Aug 2026 10:18:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjZ3-0000000DprV-3IAL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 10:18:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 755E943F5E;
	Tue, 11 Aug 2026 10:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26E21F00A3A;
	Tue, 11 Aug 2026 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786443512;
	bh=FDsSGB1xRhkRov1KMpYy6biawVkrNNWECkhOPtva83U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MxdMjzdRWb9tyFdEMp/fLMZAWqyWR48m8YKXAFDQgtTnwwA9r2d6KXQwohhEGr+Mv
	 YHRzhIbmHhJp159K5tXhoVzpz9ziHv0KOvgZnxBoqHTWG3fzgn9RbgPk5xiNPF7zGt
	 oe2Qb6MH7IHhDDz3oLeZ9DqQ987UX1BxCU4mX74BTcK1mXh3HA48BdIOHFLq34bskK
	 9kaE7jxNoV443H/cFneBJwRo9kxqopVQwubCOnxHevCIrXkMD2WyFnoFaOGN8KZJhU
	 dtQ+OWRbEXcsN2sN3W3Svmu2MilHAVszdNc2AmML3MyuJ+iZz1rD19qyU7iGPNq4fr
	 SOH48LGVk56qA==
Date: Tue, 11 Aug 2026 11:18:27 +0100
From: Will Deacon <will@kernel.org>
To: Bradley Morgan <include@grrlz.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maz@kernel.org, james.morse@arm.com
Subject: Re: [PATCH] arm64: hibernate: pass HVC_SET_VECTORS args to the
 resume hvc
Message-ID: <anr28wUlKjci8JPn@willie-the-truck>
References: <20260809213615.11646-1-include@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809213615.11646-1-include@grrlz.net>
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

[+Maz, Pasha and James]

On Sun, Aug 09, 2026 at 09:36:15PM +0000, Bradley Morgan wrote:
> swsusp_arch_suspend_exit() reinstalls the restored kernel's hyp stub
> vectors with an hvc, but never passes the arguments. x0 is not set to
> HVC_SET_VECTORS and x1 is not set to the vector address, so the stub
> dispatch falls through and returns without writing vbar_el2. EL2 is
> left pointing at the trans_pgd copy of the vectors, a page that
> swsusp_free() releases right after resume.
> 
> Set the arguments up the same way __hyp_set_vectors() does.
> 
> Fixes: 788bfdd97434 ("arm64: trans_pgd: hibernate: Add trans_pgd_copy_el2_vectors")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bradley Morgan <include@grrlz.net>
> ---
>  arch/arm64/kernel/hibernate-asm.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/hibernate-asm.S b/arch/arm64/kernel/hibernate-asm.S
> index 0e1d9c3c6a93..2baefe7a82d3 100644
> --- a/arch/arm64/kernel/hibernate-asm.S
> +++ b/arch/arm64/kernel/hibernate-asm.S
> @@ -89,6 +89,8 @@ alternative_insn "dc cvau, x4",  "dc civac, x4",  ARM64_WORKAROUND_CLEAN_CACHE
>  	isb
>  
>  	cbz	x24, 3f		/* Do we need to re-initialise EL2? */
> +	mov	x1, x24
> +	mov	x0, #HVC_SET_VECTORS
>  	hvc	#0
>  3:	ret
>  SYM_CODE_END(swsusp_arch_suspend_exit)

I'm having a really hard time figuring out what's supposed to be going
on here!

The original hibernation code added by James in 82869ac57b5d ("arm64:
kernel: Add support for hibernate/suspend-to-disk") unconditionally
set the vectors in the exception handler:

+el1_sync:
+       msr     vbar_el2, x24
+       eret
+ENDPROC(el1_sync)

However, it _also_ set the vectors from C code in swsusp_arch_resume():

+       if (el2_reset_needed()) {
+               phys_addr_t el2_vectors = phys_hibernate_exit;  /* base */
+               el2_vectors += hibernate_el2_vectors -
+                              __hibernate_exit_text_start;     /* offset */
+
+               __hyp_set_vectors(el2_vectors);
+       }

Later, Pasha refactored the assembly so that it could be shared with
kexec in 788bfdd97434 ("arm64: trans_pgd: hibernate: Add
trans_pgd_copy_el2_vectors"), however this added arguments to the
exception handler without updating the hypercall on the hibernation path.

So I think we need to figure out:

0. Whether this code is actually broken atm (I have a feeling it might
   happen to work)
1. Why the original hibernation code set the vectors twice.
2. Assuming they only need to be set once, whether we can drop the hvc
   from the swsusp_arch_suspend_exit assembly code entirely.
3. Whether we can then drop the HVC_SET_VECTORS handling from this set
   of vectors.

Will

