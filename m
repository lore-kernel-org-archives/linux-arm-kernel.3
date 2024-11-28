Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161A4D690FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxDuw/fmN6ysGCo52QBWdJfa+g6236vSlscdMfEXh6s=; b=hWSF/0YdIPLqeWhXARiJI7ZJ5+
	lBnlv/FsMOTmEcgYRep8BHElmn7qFv5chcnQC9ItFqPtGpjqrOagmn6OOkAjtcKhQejRWd9e9giwM
	jMng7LYyYSJrURJNRwIHnWPyN4rn6JWyqRtXZMq1NJZExPHyGA9y6h50OYpT/hovsfY9cJk3F1QGU
	k6IlW8Si2UfcHoxlElIOopThk21q1YKF8/uNETbI5fgtvYm0le59qtTdfon3ewHwr/ONO+Tej0nPI
	SYMjcC81yzdSw7MR4oXWirhEQX02QDEpbPAHlBUTMoh0mN/GOh4UpiUwKfCWhwSd0leejcS6b0QRg
	5VpEVA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcKI-0000000FK0U-2510;
	Thu, 28 Nov 2024 11:04:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcJJ-0000000FJxA-13yc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 11:03:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DAAE1474;
	Thu, 28 Nov 2024 03:04:16 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 956A03F66E;
	Thu, 28 Nov 2024 03:03:45 -0800 (PST)
Date: Thu, 28 Nov 2024 11:03:38 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: andre.przywara@arm.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [boot-wrapper v5] aarch64: Start Xen on Armv8-R at EL2
Message-ID: <Z0hOCh16ThvfN-Jr@J2N7QTR9R3>
References: <20241127102300.2822848-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127102300.2822848-1-luca.fancellu@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_030349_335325_10DA48C9 
X-CRM114-Status: GOOD (  21.31  )
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

On Wed, Nov 27, 2024 at 10:23:00AM +0000, Luca Fancellu wrote:
> When bootwrapper is compiled with Xen support and it is started
> at EL2 on Armv8-R AArch64, keep the current EL and jump to the
> Xen image using the SPSR_KERNEL as spsr_el2 value.
> 
> The only available boot method on Armv8-R AArch64 when starting
> Xen is spin table at the moment, reflect this in the build
> configuration.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v5 changes:
>  - Don't allow AArch64-r + Xen + PSCI from the build system, update the commit
>    message.
> v4 changes:
>  - no changes
> ---
>  Makefile.am         | 1 +
>  arch/aarch64/boot.S | 2 +-
>  configure.ac        | 5 +++++
>  3 files changed, 7 insertions(+), 1 deletion(-)
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
> diff --git a/configure.ac b/configure.ac
> index a433c89bd2ae..a16bc25508f3 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -115,6 +115,11 @@ AS_IF([test "x$USE_PSCI" != "xyes" -a "x$KERNEL_ES" = "x32"],
>  	[AC_MSG_ERROR([With an AArch32 kernel, boot method must be PSCI.])]
>  )
>  
> +# Don't allow PSCI + Xen + aarch64-r
> +AS_IF([test "x$USE_PSCI" = "xyes" -a "x$USE_ARCH" = "xaarch64-r" -a "x$X_IMAGE" != "x"],
> +	[AC_MSG_ERROR([With aarch64-r and Xen, PSCI must be disabled.])]
> +)

I'll delete the comment and change the message here to:

	With an AArch64-R Xen, boot method must be spin-table.

... since that's consistent with the other message above:

	With an AArch32 kernel, boot method must be PSCI.

... and it's slightly nicer to tell the user what will work rather than
what won't work.

Otherwise this looks fine to me, and I will apply this shortly (with
those changes) if no-one objects.

Mark.

