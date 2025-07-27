Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA10AC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osewTv5iwxMFM/tv1Ao9hcTAdA+kqkzEhct++Uojy/o=; b=kCXwY9SwI1twEYOalsa4so7BDs
	3cVfw87DNd9F4qNaFlOU5Gzr75xRmdP6usmpveRFMXARxA5gj9dF/akpfZGfqlUmBNrQm9aDsmgr4
	6s0PnwhMsbZY7ZaaGlzpT/MRth6eBZrmX26VUV3mmqJn1FQnBfokblcRrEHk2lpPk69h4EaVSLGpt
	DQrSt36wE+cEcs01GCBXtvyRvvD9wCW/dteGJzGSez7/SHb0EBByiuw5EZyzjoxKDspe9AD4EhIEA
	2gHIWOZ2Qb8KWEyL/zX0BxRMpC4dhOtYekgD6xNs2H0m4qUeYq3HRnJiqG489pZjBeskDkzle8v8X
	uBQjzVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug3hT-0000000CsxF-3gQr;
	Sun, 27 Jul 2025 15:54:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug3ex-0000000CsqY-0e6g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 15:51:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95C30454B3;
	Sun, 27 Jul 2025 15:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9048AC4CEEB;
	Sun, 27 Jul 2025 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753631494;
	bh=urSz8rDjHicplSAJE4AaaacmFFB9vhHitFdGRexF+Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEv2fiBJkYIyzGlsYaAusnzNXOeYUW5CIbDSHmdtJeMD1Dvn0gKzzDRepbR9UDKYy
	 LS64k2JAePhCkvobAkNBCymLoVlFhj2TOO+8XobA9L7Au1AVeh5rgIPn0DbbBTdAOB
	 A/27xUSr3bYrwTTke3Em3yOluDzyOBmhFsb6qg3H1ikNvLnvuyZBEdBzOTikk8Gah+
	 R9nI8xZuwAErYAhU7Eu+ysMHXtsIsd3RRnwQFCrdQQdE2PLufiqN2nJ9BC0/iJ+k3n
	 dYE+6QBS36I02VhVy/zzZ5qFOAuLQC/lZ6iZTDsIZbRWdVh9eqj5RSfS8y3RwtdMYE
	 8E4VgmpNe2J6A==
Date: Sun, 27 Jul 2025 08:51:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Linux Kernel Functional Testing <lkft@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kstack_erase: Disable kstack_erase for all of arm
 compressed boot code
Message-ID: <20250727155129.GC1183915@ax162>
References: <20250726212945.work.975-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250726212945.work.975-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_085135_213825_3D3A1B3A 
X-CRM114-Status: GOOD (  20.26  )
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

On Sat, Jul 26, 2025 at 02:29:45PM -0700, Kees Cook wrote:
> When building with CONFIG_KSTACK_ERASE=y and CONFIG_ARM_ATAG_DTB_COMPAT=y,
> the compressed boot environment encounters an undefined symbol error:
> 
>     ld.lld: error: undefined symbol: __sanitizer_cov_stack_depth
>     >>> referenced by atags_to_fdt.c:135
> 
> This occurs because the compiler instruments the atags_to_fdt() function
> with sanitizer coverage calls, but the minimal compressed boot environment
> lacks access to sanitizer runtime support.
> 
> The compressed boot environment already disables stack protector with
> -fno-stack-protector. Similarly disable sanitizer coverage by adding
> $(DISABLE_KSTACK_ERASE) to the general compiler flags (and remove it
> from the one place it was noticed before), which contains the appropriate
> flags to prevent sanitizer instrumentation.
> 
> This follows the same pattern used in other early boot contexts where
> sanitizer runtime support is unavailable.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYtBk8qnpWvoaFwymCx5s5i-5KXtPGpmf=_+UKJddCOnLA@mail.gmail.com
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/all/20250726004313.GA3650901@ax162
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Kees Cook <kees@kernel.org>

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/boot/compressed/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index f9075edfd773..a159120d1e42 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -9,7 +9,6 @@ OBJS		=
>  
>  HEAD	= head.o
>  OBJS	+= misc.o decompress.o
> -CFLAGS_decompress.o += $(DISABLE_KSTACK_ERASE)
>  ifeq ($(CONFIG_DEBUG_UNCOMPRESS),y)
>  OBJS	+= debug.o
>  AFLAGS_head.o += -DDEBUG
> @@ -96,6 +95,7 @@ KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
>  
>  ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
>  	     -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
> +	     $(DISABLE_KSTACK_ERASE) \
>  	     -I$(obj)
>  ccflags-remove-$(CONFIG_FUNCTION_TRACER) += -pg
>  asflags-y := -DZIMAGE
> -- 
> 2.34.1
> 

