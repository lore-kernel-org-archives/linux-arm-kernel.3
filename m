Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D96D3B988
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2S9QYgEQoKUpEwU39+L35Uj8JGecJ6e9hKFmaUPyHQ=; b=OYDl4A7/YJZEQDZ50/nxtJH8a3
	JdPSa3bYm7DSaK71/bK/rIVolrsR7cZIvA4le9v2XqF0j6PZT2cP2uyxfx4ypG+2spr8VAJI+f7b6
	KC+XHGukUWYpf0ZAvuAAfgK3zBqEohJk8xE+IfiGLkLZo0PhvMvC7DSNVKZ+4C1LueI8S//9G/x98
	TVtl0yhPitMrv7hvCy5G1E/kuHx0NtVwqIdoVzL9q3Q47tWVS6x9dAGLCMgMG9B6ysGAMoLqqzma7
	Q07j0bzbAezCgqRLkOlVZP4fD77ehob0hd04s09zOYhac+h6deR/HqbRpPHZSgsDvuHJMLhJFvxt7
	XvLCB1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFuEC-0000000AUwO-3fZT;
	Tue, 26 Nov 2024 11:59:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFuDE-0000000AUq2-2qVx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 11:58:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A07F153B;
	Tue, 26 Nov 2024 03:59:03 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D46CA3F58B;
	Tue, 26 Nov 2024 03:58:32 -0800 (PST)
Date: Tue, 26 Nov 2024 11:58:30 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: andre.przywara@arm.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [boot-wrapper v4 4/4] aarch64: Start Xen on Armv8-R at EL2
Message-ID: <Z0W35oFzkdOaahsv@J2N7QTR9R3>
References: <20241017095520.939464-1-luca.fancellu@arm.com>
 <20241017095520.939464-5-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017095520.939464-5-luca.fancellu@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_035836_757446_40C1EBC5 
X-CRM114-Status: GOOD (  19.59  )
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

On Thu, Oct 17, 2024 at 10:55:20AM +0100, Luca Fancellu wrote:
> When bootwrapper is compiled with Xen support and it is started
> at EL2 on Armv8-R AArch64, keep the current EL and jump to the
> Xen image using the SPSR_KERNEL as spsr_el2 value.

What's the plan for booting Xen? i.e. is that using spin-table or PSCI?

I'm hesitant to expose PSCI booting to EL2 on ARMv8-R, because PSCI
doesn't really support ARMv8-R (the spec says nothing about it, and all
we're doing is providing the illusion of ARMv8-A to Linux), and Xen
would have to override the vectors anyway, so it doesn't really make
sense.

Given the latter part I'm assuming you only care about spin-table for
Xen, which is less concerning. I think we should make that more explicit
in the config options and forbid the combination of ARMv8-R + PSCI +
Xen.

Mark.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
>  - no changes
> ---
>  Makefile.am         | 1 +
>  arch/aarch64/boot.S | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile.am b/Makefile.am
> index aecda694fd6c..a8d5c1b96822 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -127,6 +127,7 @@ XEN_CHOSEN	:= xen,xen-bootargs = \"$(XEN_CMDLINE)\";		\
>  			compatible = \"xen,linux-zimage\", \"xen,multiboot-module\"; \
>  			reg = <0x0 $(DOM0_OFFSET) 0x0 $(KERNEL_SIZE)>;	\
>  		   };
> +DEFINES		+= -DXEN
>  endif
>  
>  if INITRD
> diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
> index 565397823cb4..3fcc63bf2437 100644
> --- a/arch/aarch64/boot.S
> +++ b/arch/aarch64/boot.S
> @@ -100,7 +100,7 @@ ASM_FUNC(jump_kernel)
>  	mov	x1, x21
>  	mov	x2, x22
>  	mov	x3, x23
> -#if defined(BOOTWRAPPER_64R)
> +#if defined(BOOTWRAPPER_64R) && !defined(XEN)
>  	// On Armv8-R Linux needs to be booted at EL1
>  	mov	x4, #SPSR_KERNEL_EL1
>  #else
> -- 
> 2.34.1
> 

