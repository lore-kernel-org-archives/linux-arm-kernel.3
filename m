Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E90C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjUqkqCowpJ5lnZrv17ukt2R2oRrFdKBckxhi5ciuJg=; b=hTuz/NmLjGL6YNdcVX3J5zQ6HQ
	XrEVHMQjibFd7jMQSILR3zzQfNmns2PfDbmru05eawpcnVctAFIquVwPK2X3h8gA8ZCnP05JueVxg
	13UxUWVbHzllkVOM6N+mSTlBxzkH9JweAbokUBr9LxhkV9eYCK1AJjM5WKJ26JZClETx312kXTUQB
	yUvO92aFNgW6OJdDAG8wSUrCHnGc3zk1Pu0aSKvmm68GA2A07D0fTqGjyDU6lpvT9s+ow7jcq2zhB
	MY+rjZtdeh8AlE1F5GgKGlX5WDvmIV5HPp3+UbhIGCWM6W6AyQ8ZzlZzQ6dlRC0z7R2O4f6qc6iz9
	peGjrIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgua-0000000EatG-1kRD;
	Fri, 04 Jul 2025 13:57:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgbo-0000000EXPG-0Csa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 13:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3993A6145D
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Jul 2025 13:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47FBC4CEF2
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Jul 2025 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751636262;
	bh=HKYQfTfq82gpnvKOee0ZGNWnbiOHEHL+EOj2rgjNOy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OpZqH8sEMjFcs/Db+OSNHWewJXGZQhKN1+mxAeGFZyRv0FI9m85RpZmWKU/BKQlOn
	 rW40FGefFdS5KAaavUps6QEgjXz/PY8803+bv59LL92D9f1lv2ygYHXVGsFEuOdxaS
	 2i6JVlU0L0sjNaVYQp73Mg3EoDt2B1mVRI+QDOekolIWDKJJSTXS/LrDaTT6uxtOlT
	 wUdF+LK1evI/TZJuODoeJBpESZ8MKcgC7Ywnt418Hm0u3xlzmwbwtNtfUFlljRE9y2
	 SuvBwoZ7hADq9aeo7DXH+NCDPhWNrdOwSjZq/7FbIPFYP+plLXd/BjxZcbV/QtL4sO
	 x6DtJ9Oj3miew==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5562d8c8970so1016807e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 06:37:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMkIuorGF9UnTJJhYm7H3f5w8HyeSdWWXAet97dwHk/SoKIVvDrqg4M7HosQ2MECDdWw4TrZk530fmgn2vWm+C@lists.infradead.org
X-Gm-Message-State: AOJu0YzJqY0RYJePvrKXROFKOLkkGHZG0Z0m+XQ4HjwEnUSGOoOYYz0B
	F+yrbougENWGt+m//e+YicYROneRUvjSmH5uvb3tN5eFZxCXKkcZz+18btlQAMQd/filk9qqVnL
	0ajfwK1YxkA6qjD4+r5ZBdwY08ApM7Eg=
X-Google-Smtp-Source: AGHT+IGhZi79Wa4TZUOknDyO3OQuq/IrL0An6lSKg98ZUJaFoX2kye6ZyCvKSzgo+2AwS+cWqhXZsfqu2IVPO0+7k20=
X-Received: by 2002:a05:6512:1050:b0:553:252f:addf with SMTP id
 2adb3069b0e04-557a1235e66mr609612e87.10.1751636261192; Fri, 04 Jul 2025
 06:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-arm_kasan-v1-1-21e80eab3d70@debian.org>
 <aGaxZHLnDQc_kSur@arm.com> <CAMj1kXFadibWLnhFv3cOk-7Ah2MmPz8RqDuQjGr-3gmq+hEnMg@mail.gmail.com>
 <aGfK2N6po39zyVIp@gmail.com> <aGfYL8eXjTA9puQr@willie-the-truck>
In-Reply-To: <aGfYL8eXjTA9puQr@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 4 Jul 2025 15:37:29 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFUjJmJjR3b2S8pZeEheKojJGCYjRWRQDS0EbDYhGEUVw@mail.gmail.com>
X-Gm-Features: Ac12FXxDoYAyne6f9LFfkIyFnAPNWAnIdZPy1iEe6SjskHRpB5hKeukxa0EcUu8
Message-ID: <CAMj1kXFUjJmJjR3b2S8pZeEheKojJGCYjRWRQDS0EbDYhGEUVw@mail.gmail.com>
Subject: Re: [PATCH] arm64: efi: Fix KASAN false positive for EFI runtime stack
To: Will Deacon <will@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Catalin Marinas <catalin.marinas@arm.com>, usamaarif642@gmail.com, 
	rmikey@meta.com, andreyknvl@gmail.com, kasan-dev@googlegroups.com, 
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 4 Jul 2025 at 15:33, Will Deacon <will@kernel.org> wrote:
>
> On Fri, Jul 04, 2025 at 01:36:40PM +0100, Breno Leitao wrote:
> > On Fri, Jul 04, 2025 at 10:26:37AM +0200, Ard Biesheuvel wrote:
> > > On Thu, 3 Jul 2025 at 18:35, Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > > On Tue, Jun 24, 2025 at 05:55:53AM -0700, Breno Leitao wrote:
> > ...
> > > > >  arch/arm64/kernel/efi.c | 9 ++++++---
> > ...
> > > > >  static bool region_is_misaligned(const efi_memory_desc_t *md)
> > > > >  {
> > > > > @@ -214,9 +215,11 @@ static int __init arm64_efi_rt_init(void)
> > > > >       if (!efi_enabled(EFI_RUNTIME_SERVICES))
> > > > >               return 0;
> > > > >
> > > > > -     p = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_KERNEL,
> > > > > -                        NUMA_NO_NODE, &&l);
> > > > > -l:   if (!p) {
> > > > > +     if (!IS_ENABLED(CONFIG_VMAP_STACK))
> > > > > +             return -ENOMEM;
> > > >
> > > > Mark Rutland pointed out in a private chat that this should probably
> > > > clear the EFI_RUNTIME_SERVICES flag as well.
> > > >
> > >
> > > If VMAP_STACK is a hard requirement, should we make CONFIG_EFI depend
> > > on it for arm64?
> >
> > What about if we make CONFIG_EFI select VMAP_STACK? I think it is more
> > straight forward from a configuration perspective.
> >
> > I thought about the following. What do you think?
> >
> >       arm64: EFI selects VMAP_STACK
> >
> >       Modify the ARM64 Kconfig to make the CONFIG_EFI configuration option
> >       automatically select CONFIG_VMAP_STACK.
> >
> >       The motivation is that arm64_efi_rt_init() will fail at runtime if
> >       CONFIG_VMAP_STACK is not set, so the patch ensures that enabling EFI
> >       will always enable VMAP_STACK as well, and avoid having EFI disabled in
> >       case the user didn't set VMAP_STACK.
> >
> >       Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> >       Signed-off-by: Breno Leitao <leitao@debian.org>
> >
> >       diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >       index 55fc331af3371..cc2585143f511 100644
> >       --- a/arch/arm64/Kconfig
> >       +++ b/arch/arm64/Kconfig
> >       @@ -2437,6 +2437,7 @@ config EFI
> >               select EFI_RUNTIME_WRAPPERS
> >               select EFI_STUB
> >               select EFI_GENERIC_STUB
> >       +       select VMAP_STACK
> >               imply IMA_SECURE_AND_OR_TRUSTED_BOOT
> >               default y
> >               help
>
> I would actually like to select VMAP_STACK unconditionally for arm64.
> Historically, we were held back waiting for all the various KASAN modes
> to support vmalloc properly, but I _think_ that's fixed now...
>
> The VMAP_STACK dependency is:
>
>         depends on !KASAN || KASAN_HW_TAGS || KASAN_VMALLOC
>
> and in arm64 we have:
>
>         select KASAN_VMALLOC if KASAN
>
> so it should be fine to select it afaict.
>

I agree - we have plenty of vmalloc space, and the memory footprint is
the same so we should just turn this on unconditionally.

