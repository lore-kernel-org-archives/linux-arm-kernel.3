Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35C2EC143B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbOReU/Qrt+NIBJEEbqoIset+uAbt9VrkEKkfMdPqog=; b=HtzwrbfyvR4No6UL5ETnyD+lgL
	5wNhF1stziUW3LFGcStM5nlQCzx6Ph1V6n+XCu4rNAKYmvmfuAHkglgAgRf2y+M5n7zKLve45Z0qM
	DYsvaUUWhBP3Wzf0gHPfiybwaECnBejifoO77PeD1vjVSrAA6UjPP9WYWjLr+Yd6LoB9fjP9icfny
	tCYN1s6VmOY8dlZURhxHyS3fQveiGXIY9wHbu7C6YjWk3/ggpZcz2ipMDWa9EYrWHbSvwBPpvw6XH
	xK63sMuNsyHdfwP9H/u5aOpg0ZHq8WAS3Fe9C7P3MRFSmkLZT+gxQy8HOLvF99sDLk6LgzAZf8xaO
	bO/0lxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPYe-0000000FCTV-2N7G;
	Tue, 03 Mar 2026 13:13:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPYc-0000000FCT7-3dPb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:13:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 584FA497;
	Tue,  3 Mar 2026 05:12:52 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1D613F73B;
	Tue,  3 Mar 2026 05:12:56 -0800 (PST)
Date: Tue, 3 Mar 2026 13:12:50 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 1/4] arm64: tlb: Use __tlbi_sync_s1ish_kernel() for
 kernel TLB maintenance
Message-ID: <aabeUlR3QcBg7GmM@J2N7QTR9R3.cambridge.arm.com>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-2-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302165801.3014607-2-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_051303_023538_F034D4D5 
X-CRM114-Status: GOOD (  21.68  )
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

Hi Catalin,

On Mon, Mar 02, 2026 at 04:57:54PM +0000, Catalin Marinas wrote:
> Add __tlbi_sync_s1ish_kernel() similar to __tlbi_sync_s1ish() and use it
> for kernel TLB maintenance. Also use this function in flush_tlb_all()
> which is only used in relation to kernel mappings. Subsequent patches
> can differentiate between workarounds that apply to user only or both
> user and kernel.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>

This looks fine to me. I have one minor comment/naming nit below, but
this looks functionally correct, and I'm happy to spin a follow-up for
that.

With or without the changes below:

Acked-by: Mark Rutland <mark.rutland@arm.com>

> ---
>  arch/arm64/include/asm/tlbflush.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 1416e652612b..19be0f7bfca5 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -191,6 +191,12 @@ static inline void __tlbi_sync_s1ish(void)
>  	__repeat_tlbi_sync(vale1is, 0);
>  }
>  
> +static inline void __tlbi_sync_s1ish_kernel(void)
> +{
> +	dsb(ish);
> +	__repeat_tlbi_sync(vale1is, 0);
> +}
> +
>  /*
>   * Complete broadcast TLB maintenance issued by hyp code which invalidates
>   * stage 1 translation information in any translation regime.
> @@ -299,7 +305,7 @@ static inline void flush_tlb_all(void)
>  {
>  	dsb(ishst);
>  	__tlbi(vmalle1is);
> -	__tlbi_sync_s1ish();
> +	__tlbi_sync_s1ish_kernel();
>  	isb();
>  }

The commit message is correct that flush_tlb_all() is only used for
kernel mappings today, via flush_tlb_kernel_range(), so this is safe.

However, the big comment block around line 200 says:

	flush_tlb_all()
		Invalidate the entire TLB (kernel + user) on all CPUs

... and:

	local_flush_tlb_all()
		Same as flush_tlb_all(), but only applies to the calling CPU.

... where the latter is used for user mappings (upon ASID overflow), so
I think there's some risk of future confusion.

To minimize the risk that flush_tlb_all() gets used for user mappings in
future, how about we rename flush_tlb_all() => flush_tlb_kernel_all(), and
update those comments:

	flush_tlb_kernel_all()
		Invalidate all kernel mappings on all CPUs.
		Should not be used to invalidate user mappings.

	local_flush_tlb_all()
		Invalidate all (kernel + user) mappings on the calling CPU.

Note: I chose flush_tlb_kernel_all() rather than flush_tlb_all_kernel()
__flush_tlb_kernel_{pgtable,range}, with 'kernel' before the operation/scope.

Thanks,
Mark.

> @@ -568,7 +574,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
>  	dsb(ishst);
>  	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
>  			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
> -	__tlbi_sync_s1ish();
> +	__tlbi_sync_s1ish_kernel();
>  	isb();
>  }
>  
> @@ -582,7 +588,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
>  
>  	dsb(ishst);
>  	__tlbi(vaae1is, addr);
> -	__tlbi_sync_s1ish();
> +	__tlbi_sync_s1ish_kernel();
>  	isb();
>  }
>  

