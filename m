Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE39C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlD6AuVRVDatK+VtWeA658+FAtt02mo9vv0HvJ1zP58=; b=w0iQP2VyA9AaoRbOhRyLABrfsE
	mLVyLZ22jBUSKiaIxW7RRlUvF4GW9+lGrQPOHvT3wxhxnhbCupfsR/uNwcFcmr1SJjt4eQWNSX9xc
	ungY7bWhFayqaCTDSfxJ7XWnk+KcQwQXKXY7wbg3AoYJqOooTrXDxhdsg9KXf84BfOMxSBC4DyGO7
	xEEqufypNdFqorJEMwBfZHJ3szrUcY/5kQuYmWoU1mNKefKtLVEj0sHRyjbMITYMAXO9tDr0B0cbQ
	D39hv2c/s1em8PwQ6YedZnUIu361Y9rWRVwXJ8n8S4i/NNJ9gkc1NRYjo4Dj9X+TYj9Q0uWDvgW7p
	js2YDq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQQP-0000000AUuI-31Ww;
	Thu, 17 Jul 2025 15:21:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOxM-0000000AIDJ-1SOj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 13:47:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59B981596;
	Thu, 17 Jul 2025 06:47:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09E543F694;
	Thu, 17 Jul 2025 06:47:25 -0700 (PDT)
Date: Thu, 17 Jul 2025 14:47:23 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: Revisiting c0a454b9044f
Message-ID: <aHj-6xGYQ6RDvUHE@J2N7QTR9R3>
References: <20250714195205.GA3723043@ax162>
 <aHY4d46ehF-j_pbw@J2N7QTR9R3>
 <20250716182641.GA2746700@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716182641.GA2746700@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_064728_468827_EA33CF03 
X-CRM114-Status: GOOD (  26.76  )
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

On Wed, Jul 16, 2025 at 12:26:41PM -0600, Nathan Chancellor wrote:
> On Tue, Jul 15, 2025 at 12:16:07PM +0100, Mark Rutland wrote:
> > The concern from the kernel side is simply whether we get unexpected BTI
> > failures. IIUC so long as compiler and linker agree we should be good,
> > and we simply need to forbid broken combinations.
> 
> Mark Brown did mention something about the module loader as well so I
> was not sure if that was relevant here.

Sorry, I had forgotten anout that, and that is a concern.

If a single module has executable sections placed more than 128MiB apart
we'd potentially have the same problem with any cross-section branch.
Truly handling that would be quite tricky and require a fair amount of
rework, so the best bet is probably to reject loading modules that are
too large (or where we specifically find such cross-section branches
needing veneers).

Note that exported symbols and address-taken functions should have a
BTI, so this only really matters for cross-section calls within a single
module.

I suspect it should be relatively simple but I'm not sure exactly where
to plumb that in. I can put that on my TODO list if no-one gets around
to it.

> > > Or should the kernel adjust its expectations now that the ABI and
> > > toolchains all agree?
> > 
> > Yes, we can probably rework this.
> > 
> > IIUC we'd need to forbid BTI with:
> > 
> > * GCC + old GNU LD
> > * GCC + old LLD
> > * new clang + old GNU LD
> > * new clang + old LLD
> > 
> > ... and can enable BTI otherwise.
> > 
> > Does that make sense to you?
> 
> So something like this if I understand correctly?
> 
> Cheers,
> Nathan
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 393d71124f5d..fe523f9f2d61 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2097,7 +2097,11 @@ config ARM64_BTI_KERNEL
>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
>  	depends on !CC_IS_GCC || GCC_VERSION >= 100100
>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
> -	depends on !CC_IS_GCC
> +	# https://sourceware.org/bugzilla/show_bug.cgi?id=30076
> +	depends on !CC_IS_GCC || LD_VERSION >= 24100 || LLD_VERSION >= 210000
> +	# https://github.com/llvm/llvm-project/commit/7af2b51e761f49974a64c3009882239cea618f2a
> +	# https://github.com/llvm/llvm-project/commit/098b0d18add97dea94e16006486b2fded65e228d
> +	depends on !CC_IS_CLANG || CLANG_VERSION < 210000 || (CLANG_VERSION >= 210000 && (LD_VERSION >= 24100 || LLD_VERSION >= 210000))

Yep, something like that.

I was thinking that we could factor this out into a separate config,
like we have for BUILTIN_RETURN_ADDRESS_STRIPS_PAC, as that'll make it
easier to avoid duplication, e.g.

| config TOOLCHAIN_HAS_WORKING_BTI
| 	bool
| 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
| 	default n if CC_IS_GCC && GCC_VERSION < 100100
|	# Newer LD/LLD handle BTI in veneers automatically
| 	default y if LD_IS_LLD && LLD_VERSION >= 210000
| 	default y if LD_IS_GNU && LD_VERSION >= 24100
| 	# Newer clang requires newer LD/LLD above
| 	default y if CC_IS_CLANG && CLANG_VERSION < 210000
| 	default n

... and we can easily extend that to handle fixed stable versions, like with
BUILTIN_RETURN_ADDRESS_STRIPS_PAC.

Mark.

