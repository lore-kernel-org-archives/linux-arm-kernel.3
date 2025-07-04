Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598CDC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gx3SHwSSOHA1sK+lAyXr0DHkaYK3RbpLwm1zJ8Ey4Lc=; b=rs1U3wJ7t74teOEfME1X84/j3P
	zBP5dy4+qdllA22SBXw7BdqYc0mMI3WQzFUVVTXYfz299ulSpVbSihbzhHD4qJHFZLb6YRNcGhsBu
	jr28FypecOaCZgep7JiOD0myFZgvyc/KPpZZ12Kg1BdGhXBiM35rsTqLGlMXDHmOmiNF2oThWF64X
	DdZaaoXxJcW+3fCi8W2lEYYD7F7TOWQwKyWJSFgwoLDLP5W73gWsXqhTfpI2CncDdA6XFmeUm3xrw
	aWsBXZvA8cN4skmsP8P6sEhHt+rdaAKCy3iGyfonRVwGGHNzr4/kv4Nf9BqyGm4IWPA8ipYnHjKF2
	WOe26paQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeU7-0000000EBwY-2zHm;
	Fri, 04 Jul 2025 11:21:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbky-0000000DjbC-2LgJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 08:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66BB3A53964
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Jul 2025 08:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16079C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Jul 2025 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751617611;
	bh=9aUMtw1stPGYE0BaxMp9AP1glAqCxc7OYI5tFwmPTWM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OURYlIL9GNPi9qFVjsgDHlwjFmr6LHHVsCiKuy5ZYDQsFJPg2dMynssNMz83nBETj
	 Tose/50ZAVPROjr1NTxsdJSWzaSQEYtGu8IFIkhYcX+CeuuL2QuDq5G/yiFL6NvBFS
	 CX14xZ4sUIR6HkxC/faKmbiY66EgtBHBEq+NOkMpNXzhELY5v+qPGlmXGX38zwhy8w
	 OBDzRuelFrzpou8NOB4K+GNxkJEF2ZWGcc5cHo3ee05mLTTuql6bD7QvOVSUa8+avG
	 PjsjoeLI3yuN+Pg1Dl224l+8Y43O8JH3gG3sH967QRpEFBr8U0sGIVMZeqEJsvKfs3
	 EgXa19qTjoNzQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b16a0e38so886040e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 01:26:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUC+csVmk2nbvxf0O3k0N1jvRimgqNbZfMQCQXSR7D5LUhbKJhrakLCWKkKWqR4oOSakFOCP89ZsmYLufy/+HvX@lists.infradead.org
X-Gm-Message-State: AOJu0YwDJBeFJok4ke44fCKL44K0Vip3qNSkDrUIPgHfzW+XogmFjE9p
	h+fwhM2ZXWmN+Do2PCo8uIN2RmvYpXQgBbuiQYRFeJDjwsXLuAM2N1b4uPcIJdIlfPx0X9u5FVh
	blpXif0RSj3/nwOO+vEqaqRaXneEM66s=
X-Google-Smtp-Source: AGHT+IGpFw16pMJCMz67SWNFA6IMUVC0qphVdY6vm9ia3sgNYWHEFtvFRfb+0rVLwo2jlzGrmYMI9I0Ytmf3CMf87z8=
X-Received: by 2002:a05:6512:3690:b0:553:3770:c91d with SMTP id
 2adb3069b0e04-556d160f06bmr486751e87.4.1751617609446; Fri, 04 Jul 2025
 01:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-arm_kasan-v1-1-21e80eab3d70@debian.org> <aGaxZHLnDQc_kSur@arm.com>
In-Reply-To: <aGaxZHLnDQc_kSur@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 4 Jul 2025 10:26:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFadibWLnhFv3cOk-7Ah2MmPz8RqDuQjGr-3gmq+hEnMg@mail.gmail.com>
X-Gm-Features: Ac12FXxELlmJOgclmPetSiXcBqm7bPSktVfuSqSd0ARv_5mIl32jvgAoBlJoUvA
Message-ID: <CAMj1kXFadibWLnhFv3cOk-7Ah2MmPz8RqDuQjGr-3gmq+hEnMg@mail.gmail.com>
Subject: Re: [PATCH] arm64: efi: Fix KASAN false positive for EFI runtime stack
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, usamaarif642@gmail.com, 
	rmikey@meta.com, andreyknvl@gmail.com, kasan-dev@googlegroups.com, 
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_012652_746419_C1243C28 
X-CRM114-Status: GOOD (  27.90  )
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

On Thu, 3 Jul 2025 at 18:35, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Tue, Jun 24, 2025 at 05:55:53AM -0700, Breno Leitao wrote:
> > KASAN reports invalid accesses during arch_stack_walk() for EFI runtime
> > services due to vmalloc tagging[1]. The EFI runtime stack must be allocated
> > with KASAN tags reset to avoid false positives.
> >
> > This patch uses arch_alloc_vmap_stack() instead of __vmalloc_node() for
> > EFI stack allocation, which internally calls kasan_reset_tag()
> >
> > The changes ensure EFI runtime stacks are properly sanitized for KASAN
> > while maintaining functional consistency.
> >
> > Link: https://lore.kernel.org/all/aFVVEgD0236LdrL6@gmail.com/ [1]
> > Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
> > Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >  arch/arm64/kernel/efi.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> > index 3857fd7ee8d46..d2af881a48290 100644
> > --- a/arch/arm64/kernel/efi.c
> > +++ b/arch/arm64/kernel/efi.c
> > @@ -15,6 +15,7 @@
> >
> >  #include <asm/efi.h>
> >  #include <asm/stacktrace.h>
> > +#include <asm/vmap_stack.h>
> >
> >  static bool region_is_misaligned(const efi_memory_desc_t *md)
> >  {
> > @@ -214,9 +215,11 @@ static int __init arm64_efi_rt_init(void)
> >       if (!efi_enabled(EFI_RUNTIME_SERVICES))
> >               return 0;
> >
> > -     p = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_KERNEL,
> > -                        NUMA_NO_NODE, &&l);
> > -l:   if (!p) {
> > +     if (!IS_ENABLED(CONFIG_VMAP_STACK))
> > +             return -ENOMEM;
>
> Mark Rutland pointed out in a private chat that this should probably
> clear the EFI_RUNTIME_SERVICES flag as well.
>

If VMAP_STACK is a hard requirement, should we make CONFIG_EFI depend
on it for arm64?

> > +
> > +     p = arch_alloc_vmap_stack(THREAD_SIZE, NUMA_NO_NODE);
> > +     if (!p) {
> >               pr_warn("Failed to allocate EFI runtime stack\n");
> >               clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
> >               return -ENOMEM;
> >
>
> With that:
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>
> (but let's see if Ard has a different opinion on the approach)
>

I think this is fine - the stack just needs to be disjoint from the
ordinary kernel mode task stack so that buggy firmware is less likely
to corrupt it, and so that we can recover from an unexpected
synchronous exception more reliably.

In that sense, the old and the new code are equivalent, so no
objections from me.

