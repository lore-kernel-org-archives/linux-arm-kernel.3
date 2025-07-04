Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89146C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YW8Mdm8VBfi1qlOCL6Pf2QZ+6mI2RYO5Q+XtAXUgQJ4=; b=zkMcQ++TItnE2fe87359Qpa3G/
	n9RUqrbobONnnV6z0/uKmOW1+GFiDAkNQHMso8xDq31gndY4Ylty9f67P4J5OkCWUwBp1OZ2c7nqJ
	wQv4EwymwBelt5kzx/ziD4hDkcYgnXXSixkLCT7eaoV1heBwbSMtQ3Q3AmXj1Y4VDF7yB6RLUAt+D
	9Qak9zB//NQJROQjVjzqoMGq8sk0fItPdiEJL2djvOhpqyo+rqVyWE+b2+HvYE8VEdcX6LKeQl19U
	xqBEALWZRx/vePH69aCvF3Ax5CXQJOvpNXpSJfnZB+y4B3ZKgniz3gatjYv4DxeFMCiCt+8QEhENE
	V/3kh3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfhB-0000000EPLD-0G5h;
	Fri, 04 Jul 2025 12:39:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfep-0000000EP6F-3rMc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 12:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YW8Mdm8VBfi1qlOCL6Pf2QZ+6mI2RYO5Q+XtAXUgQJ4=; b=NlDyTixG5mcCdBVzP55WKo0AiF
	2gvhcOTwvEfciZkCN1QsOwzqdh8K3SkixqtuAFXjTRT7nXMFLZ047ZPRZN8IAggR7UpseGHNKTXfT
	I/vLEgYrY6gAaMmqQQd9yjtiaOZQLpdVEGiSZ8LRlfwkfyUeM/1eJPlncyRcjxcdHDeblg3mTuqUU
	r/MGLGFf9o2MCJOrq2C+Vl4WW+Xp8GQcO3VUUv9jJF502z+UHP6EOPJc+gqTzjqMAgx/HcBanyCAw
	ye0elTDwucupl1lsPTVgdxDfitWsR3ALTbuSGpobnZyzCITh+rFltFDa0S7CWDElzVfyZb1Fp8/dL
	8VIUH9NQ==;
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfem-00000007yaO-3vR1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 12:36:46 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60c79bedc19so1489437a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 05:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751632603; x=1752237403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YW8Mdm8VBfi1qlOCL6Pf2QZ+6mI2RYO5Q+XtAXUgQJ4=;
        b=TMzLBSCbvQMz4jGRlSQnmEN7zP0yoyFiufC6ZakTpw6LTVIxi7XBN/FSOK8k8bTRI1
         uKq/GflZ+A7Ta7mgnkEaD0kuoFzOIqPqXFlM7StT21R3qc6X+ixLrKuFAGSOymFmhU9f
         tneeoJfNDC1se0P1C5uZBuhZg1M7Zkig1ar/p524DmX1nHGi/7zfu57yXiQeZGCbShMU
         GVM6hjgFpbk4aDAb42mcPQe+D44WJ1+VKjIV/A8/7MKGI6zXrGciCTEB9Im66XDrCzY0
         4Zud1/VaQ3P6+aZc8yExDtzT+07nTQz2OxuwWbjX02Oa3JphXtPfNZWnOlGTypFsqnwr
         tgbA==
X-Forwarded-Encrypted: i=1; AJvYcCWbz8TkLNrllVtF4iZbr+NWIBsi9cynFOhuZs3KU0ykErgC1GyV6h0CpZnAes06dv7ldo51UejMLe49Zc6e60A1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0OREOonpfwzLqEWFu8rROmCWCIfiyK3QaPYkFAOJ7vkgcUKub
	kZWLU4gE9VtNiehhgdyqB9zP9pzrGmVMHJ0sFcwWP0YPYj6Ku0GlcVqV
X-Gm-Gg: ASbGncuGINPMcY6S9yiKevgwtDnelrzagZ+Or7GGrwGrDkq2q0jZSEOy2e/nyrxT4EX
	XnlBb/8vYbOvwm0N66xZX1FKhdflVSoX2m4Y4JBYbQ1j1yGaviR/pA0EG7uYTF83I6PzkSoa5Ua
	XpUMTu6he9MGX13xsNpCQ/4zNGdvNPQ1P5hzqIBEkjc4Rvd94GtWoqpICDee6jQ5NrQSDx/uWNg
	oLNRvLYvG5ImiSm7CLimS5HN/LK/tI6tsQmIaR0K6BRBksUBcB/X77gFlRxJ8RCxHsv5eRAbv95
	qBjuQBEH6nD8Nd2Ptam6LHdfb10xvJxaTOuRKjXCgx0EiCu83JgWfjIjTi4=
X-Google-Smtp-Source: AGHT+IHU3ATpNL/cr0I7xRhbdLV8cgkTlj0aQw3gWc/YSeGekUiyN9FhxtUD4X0JFLW+UcEhQI6LSA==
X-Received: by 2002:a05:6402:2103:b0:5ff:ef06:1c52 with SMTP id 4fb4d7f45d1cf-60fd2f84f16mr2179344a12.3.1751632602449;
        Fri, 04 Jul 2025 05:36:42 -0700 (PDT)
Received: from gmail.com ([2620:10d:c092:400::5:c915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fc81a70e4sm1285566a12.0.2025.07.04.05.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:36:42 -0700 (PDT)
Date: Fri, 4 Jul 2025 13:36:40 +0100
From: Breno Leitao <leitao@debian.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, usamaarif642@gmail.com,
	rmikey@meta.com, andreyknvl@gmail.com, kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: efi: Fix KASAN false positive for EFI runtime
 stack
Message-ID: <aGfK2N6po39zyVIp@gmail.com>
References: <20250624-arm_kasan-v1-1-21e80eab3d70@debian.org>
 <aGaxZHLnDQc_kSur@arm.com>
 <CAMj1kXFadibWLnhFv3cOk-7Ah2MmPz8RqDuQjGr-3gmq+hEnMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFadibWLnhFv3cOk-7Ah2MmPz8RqDuQjGr-3gmq+hEnMg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_133645_077920_337AA27E 
X-CRM114-Status: GOOD (  27.12  )
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

Hello Ard,

On Fri, Jul 04, 2025 at 10:26:37AM +0200, Ard Biesheuvel wrote:
> On Thu, 3 Jul 2025 at 18:35, Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Tue, Jun 24, 2025 at 05:55:53AM -0700, Breno Leitao wrote:
...
> > >  arch/arm64/kernel/efi.c | 9 ++++++---
...
> > >  static bool region_is_misaligned(const efi_memory_desc_t *md)
> > >  {
> > > @@ -214,9 +215,11 @@ static int __init arm64_efi_rt_init(void)
> > >       if (!efi_enabled(EFI_RUNTIME_SERVICES))
> > >               return 0;
> > >
> > > -     p = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_KERNEL,
> > > -                        NUMA_NO_NODE, &&l);
> > > -l:   if (!p) {
> > > +     if (!IS_ENABLED(CONFIG_VMAP_STACK))
> > > +             return -ENOMEM;
> >
> > Mark Rutland pointed out in a private chat that this should probably
> > clear the EFI_RUNTIME_SERVICES flag as well.
> >
> 
> If VMAP_STACK is a hard requirement, should we make CONFIG_EFI depend
> on it for arm64?

What about if we make CONFIG_EFI select VMAP_STACK? I think it is more
straight forward from a configuration perspective.

I thought about the following. What do you think?

	arm64: EFI selects VMAP_STACK

	Modify the ARM64 Kconfig to make the CONFIG_EFI configuration option
	automatically select CONFIG_VMAP_STACK.

	The motivation is that arm64_efi_rt_init() will fail at runtime if
	CONFIG_VMAP_STACK is not set, so the patch ensures that enabling EFI
	will always enable VMAP_STACK as well, and avoid having EFI disabled in
	case the user didn't set VMAP_STACK.

	Suggested-by: Ard Biesheuvel <ardb@kernel.org>
	Signed-off-by: Breno Leitao <leitao@debian.org>

	diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
	index 55fc331af3371..cc2585143f511 100644
	--- a/arch/arm64/Kconfig
	+++ b/arch/arm64/Kconfig
	@@ -2437,6 +2437,7 @@ config EFI
		select EFI_RUNTIME_WRAPPERS
		select EFI_STUB
		select EFI_GENERIC_STUB
	+	select VMAP_STACK
		imply IMA_SECURE_AND_OR_TRUSTED_BOOT
		default y
		help

> > (but let's see if Ard has a different opinion on the approach)

> I think this is fine - the stack just needs to be disjoint from the
> ordinary kernel mode task stack so that buggy firmware is less likely
> to corrupt it, and so that we can recover from an unexpected
> synchronous exception more reliably.
> 
> In that sense, the old and the new code are equivalent, so no
> objections from me.

Thanks. I will send an update with the update that Catalin and Mark
suggested.

Thanks!
--breno

