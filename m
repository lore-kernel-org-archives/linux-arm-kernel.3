Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E32EC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0izjaE/Fz8LhwJeE7Xt1VSDACgT6yDseiK9TRCIVcE=; b=fSZzvCn2LlV4WTsq0Dkg2zjJYV
	w0Y5g79FpE2zAbcKIgKN0HOVlwWYOleYkM2DjzpokoUzsBK/HYKf4zCW69tkdDkHtDpb8+VXXyZaF
	1wgZNLHJZ7PAv3V6P/7USp3BJctUYjzlFVsNccIKcAwWGGHrfwNMtpnSPUS/+dRILRwOngoOp7TDE
	cN9hErckm3AWaxFFW3xA+2c36oDboWw3d2gTq/D9sGeIB7CeNlVqPtQw4f5cSWz9xpsmvHxxkWZAP
	fRZXx1vloJ/HsObw18NKc18FFzn/sQduTdodByEVo8PiazZlv04WZ1cmzaljQwUJbP5+BTV0kqV/L
	LRgtxXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqUx-00000003HtN-3cuj;
	Mon, 07 Jul 2025 18:23:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpYh-000000039lQ-1qFp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 17:23:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14F9A168F;
	Mon,  7 Jul 2025 10:23:02 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 950673F66E;
	Mon,  7 Jul 2025 10:23:12 -0700 (PDT)
Date: Mon, 7 Jul 2025 18:23:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, leo.yan@arm.com, kernel-team@meta.com
Subject: Re: [PATCH 1/8] arm64: Enable VMAP_STACK support
Message-ID: <aGwCfRkYqcYBvxZK@J2N7QTR9R3>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
 <20250707-arm64_vmap-v1-1-8de98ca0f91c@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-arm64_vmap-v1-1-8de98ca0f91c@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_102315_519849_ACC602A7 
X-CRM114-Status: GOOD (  19.26  )
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

Hi Breno,

On Mon, Jul 07, 2025 at 09:01:01AM -0700, Breno Leitao wrote:
> Enable virtually mapped kernel stacks for ARM64. This provides better
> stack overflow detection and improved security by mapping kernel stacks
> in vmalloc space rather than using direct mapping.
> 
> VMAP_STACK helps catch stack overflows early by placing guard pages
> around kernel stacks, and also provides better isolation between
> kernel stacks and other kernel data structures.
> 
> All dependencies are satisfied for arm64: HAVE_ARCH_VMAP_STACK is
> already selected above, and KASAN_VMALLOC is selected when KASAN is
> enabled, meeting the KASAN dependency requirements.

I reckon it might be better to say something like:

| arm64: Mandate VMAP_STACK
|
| On arm64, VMAP_STACK has been enabled by default for a while now, and
| the only reason to disable it was a historical lack of support for
| KASAN_VMALLOC. Today there's no good reason to disable VMAP_STACK.
|
| Mandate VMAP_STACK, which will allow code to be simplified in
| subsequent patches.

... to make it clear that we're not changing the default, and we are
removing the ability to deselect VMAP_STACK.

Either way, the patch itself looks good to me.

Mark.

> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/arm64/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 393d71124f5d..179b302f43c2 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -280,6 +280,7 @@ config ARM64
>  	select HAVE_SOFTIRQ_ON_OWN_STACK
>  	select USER_STACKTRACE_SUPPORT
>  	select VDSO_GETRANDOM
> +	select VMAP_STACK
>  	help
>  	  ARM 64-bit (AArch64) Linux support.
>  
> 
> -- 
> 2.47.1
> 

