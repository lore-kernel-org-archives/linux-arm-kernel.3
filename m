Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ADBCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 03:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UERytwwDGGJ/h+dcwywEihpzTblVylFNdoqu7pJIrY=; b=lFU7R372dgk0bn4GJKDpDBigH0
	ZS/dPVy+3uh+zbYHI8NMzlf/koEEPDtG5nh8j0jP8+xdoFRDWUZLmaxbq/fxuAm99HgoiAXN3sYV/
	+fhyHEJfqj4fPALch5EDyHGsc+9SYU2Cf1Yu+LqW4asqNghGCEDTpTG4kiv3pNwqs9kWMLAPfXn70
	4CamxZ1aXgQs0AzWepzXp8VN7sNTPRGUddeFiLk4zHsLBU8IRMTlmJtMszUo9tTitZNznCzdkLJyG
	BvyOdtBrsqy/f2AFkVi5+mBn+VJ7xXRCrStSRYuBuFYzVzhBvkVZmP4kqD+usjUq5net1tkaHoMNt
	f6i/6RMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urq9v-00000004GNr-0RDH;
	Fri, 29 Aug 2025 03:52:15 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urq7D-00000004G8y-1Ull
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 03:49:28 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-771ff6f117aso1577833b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 20:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756439366; x=1757044166; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UERytwwDGGJ/h+dcwywEihpzTblVylFNdoqu7pJIrY=;
        b=Y4iqAt6xVpftq/MCwO9EBUH7/7m1pWMqnXwBP1BJipzpCJBjVujQrH6cp9SK+QFCVM
         S7U3Wu8cvI2ovgvNJ6KnsogyLAc2FmrcciOf8yaZU91lWqxDKE3wFQ7WiSREFXhw7OJc
         TRr/wSApFFotVQNybRSMipG8y0Mwbqy5+545q73vKE6+DU4xhGDLqhWa/1hzkfSs7uR/
         EUign9x1a5x1zKApGkAuk8oR9o2sTyf2XNbGXSbTxL0mYotHBUU/E9jKvxFcoTR/kmYo
         zxaQ2WlKvikX6y4RnhcUlmSuS4iKClBYkJznovQXhscL9gkYx6SgozpZDC6qkDjnvrC5
         mWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756439366; x=1757044166;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UERytwwDGGJ/h+dcwywEihpzTblVylFNdoqu7pJIrY=;
        b=P/J1yWX13JUVSIyatqh6L+CxMOT3D1zH1r0O1hFO5sKyShKpuA3j4//icn7iJF+95a
         Qf/PM12IWK5FTZYCZxl4Hc6J85G+oS1HVDaUbzeSMQJ+TTXKFQ5q/k1N7/u7ye782lZV
         pT71K1ICRjXmK9e9i1NsAfXsmTv8x4d+W0G+61JQOuDozqfDj4h1ImT3EmQPKxR4Hudm
         qIjehAsiBB3UvxXMg5x3ncvP4fF/R3KieEcMQZp7GY/8GcsR2q5P7KwwB38B6W17STya
         fk/AoV/Ti4NDEVGr8rtjd+vC1qdRA9JdAHfzpcvzsGN8oM6Rh13ZZHdBqFdlZjeMWnab
         dA/A==
X-Forwarded-Encrypted: i=1; AJvYcCW2mcOL5q8+q1yoXoGbYXzI6Ocp2Nhw//6e3R3XBoxgQYySzGUCizbGB2ksW8bKCewm3FiDRQhRzr08NtgBmkKy@lists.infradead.org
X-Gm-Message-State: AOJu0YwaKTgJ25axENoJ5wgm7MDGGvzGvQfaXUWfX98vzmDKJI2Xhwto
	fbGFD+p+3ZI6zBcO3ds8dgGxH/CcYTo2L4eYM5IvbggpAFuaqgXmUkM5sHFjRw==
X-Gm-Gg: ASbGncsmcgMSeEfmcBZJVSq+flKEYQmG+/RzPuOOKXwyZwxDY7ETfXTMf/+Q6sxYiw8
	/hEcWS7iK/6Z9ElxNCZwf8gp3uv52+XvE9AIaDEhlIdYy1aJHy8iSM6EZ1QzHDOGTJvbM2qIQNV
	tlCAr07AzHAfHlHroI6ZPdRA2ygUB8xLeKQo65PB77NtaIasE5zadt0s6YfqDnIFAY1CheVhMeC
	E8465SiWhm3DsG9hiC0GIK0v28aoWUR0F1Lxq3AmTEFnfbV8CKYD6h1knQ2OCgAatYynRIBwduj
	zor1m3M+x2F4EpJIZYZijkpJ5tgNdTga5M4qjux0lNQj1yqJtO7QXyBlQZjR1XOI2GMRIcWqLXp
	hQ2Bk3a34kxdb/7KJxmZaUde0yA==
X-Google-Smtp-Source: AGHT+IEMAHHXLDxdG1bpNQzRYVh+4u2VlQ8X0kCscAvkN0YeF/j/ERa1DIFLlWFgSB3atG35kIT6rQ==
X-Received: by 2002:a05:6a20:2450:b0:243:b38b:eb94 with SMTP id adf61e73a8af0-243b38beeebmr6357860637.50.1756439366074;
        Thu, 28 Aug 2025 20:49:26 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d932efd5sm1239497a91.5.2025.08.28.20.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 20:49:25 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC 3/3] arm64/ptdump: Add ARM64_PTDUMP_CONSOLE
In-Reply-To: <7302615c-e190-43ac-bc29-e82d7b048403@arm.com>
Date: Fri, 29 Aug 2025 09:12:08 +0530
Message-ID: <87zfbikd4f.fsf@gmail.com>
References: <20250818091436.938517-1-anshuman.khandual@arm.com> <20250818091436.938517-4-anshuman.khandual@arm.com> <87bjo2qe5w.fsf@gmail.com> <7302615c-e190-43ac-bc29-e82d7b048403@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_204927_395530_469F9E7A 
X-CRM114-Status: GOOD (  27.76  )
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

Anshuman Khandual <anshuman.khandual@arm.com> writes:

> On 26/08/25 9:16 PM, Ritesh Harjani (IBM) wrote:
>> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>> 
>>> Enable early kernel page table dump for debug purpose when required via new
>>> config ARM64_PDUMP_CONSOLE. This calls existing ptdump_walk() early on just
>>> after ptdump has been initialized with ptdump_init().
>> 
>> I happen to stumble upon this while looking for something else related
>> to ptdump and was curious to understand where this will be really
>> useful? 
>> 
>> So instead of dumping it via cat /sys/kernel/debug/kernel_page_tables,
>> this will dump at early boot during arch setup and before start_kernel().
>
> Right, primarily before vmalloc() space gets crowded. Also this provides
> an opportunity to do a diff between early boot and after boot kernel page
> table states.

Just want to understand this better - the diff here will mainly show the
new page table entries for the remaining layout which will get populated
in start_kernel() right? The existing mappings created during
setup_arch() won't get changed right?

>> 
>> I was curious, since this anyway gets enabled only in debug kernels.
>> There we can always just boot with minimal busybox image which can jump
>> to shell quickly and dump the kernel page tables, correct?
>
> Here the kernel page table dump could happen earlier than that as well.
>> 
>> Also is ARM64_PTDUMP_CONSOLE config option added on purpose? A kernel cmdline
>> like early_ptdump=yes|1|true could come much handy, right?
>
> Currently this is just for arm64 platform but could be enabled in general
> for other platforms as well. Yes, early_ptdump=yes|1|true will be useful
> as well. ARM64_PTDUMP_CONSOLE just build guards the additional code. But
> if required cmdline option "early_ptdump=" could just provide the runtime
> switch and then this could always be built enabled on CONFIG_PTDUMP.
>> 
>> (Since I am fixing few issues on powerpc ptdump - hence was just curious
>> to know whether this can come useful for me too or not :) )
>
> This feature could be extended in general to other platforms. Let me know
> if you find this useful for powerpc.

Sure - as of now I don't have a direct usecase. But let me try to do
an early page table dump by taking some inspiration from your patch to
see if this adds value for powerpc case or not.

Thanks for sharing the info.

-ritesh

>> 
>> Thanks!
>> -ritesh
>> 
>>>
>>> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>>  arch/arm64/Kconfig.debug        | 12 ++++++++++++
>>>  arch/arm64/include/asm/ptdump.h |  7 +++++++
>>>  arch/arm64/kernel/setup.c       |  1 +
>>>  arch/arm64/mm/ptdump.c          |  7 +++++++
>>>  4 files changed, 27 insertions(+)
>>>
>>> diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
>>> index 265c4461031f..0f8af0dd0f4c 100644
>>> --- a/arch/arm64/Kconfig.debug
>>> +++ b/arch/arm64/Kconfig.debug
>>> @@ -20,4 +20,16 @@ config ARM64_RELOC_TEST
>>>  	depends on m
>>>  	tristate "Relocation testing module"
>>>  
>>> +config ARM64_PTDUMP_CONSOLE
>>> +	bool "Dump early kernel page table"
>>> +	depends on DEBUG_KERNEL
>>> +	depends on ARCH_HAS_PTDUMP
>>> +	select PTDUMP
>>> +	help
>>> +	  Enable this option to dump early kernel page table entries during
>>> +	  boot using the PTDUMP framework. This helps in examining kernel's
>>> +	  page table mapping entries and their attributes etc.
>>> +
>>> +	  If in doubt, say N.
>>> +
>>>  source "drivers/hwtracing/coresight/Kconfig"
>>> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
>>> index 27e774134e7f..81dc53ca9643 100644
>>> --- a/arch/arm64/include/asm/ptdump.h
>>> +++ b/arch/arm64/include/asm/ptdump.h
>>> @@ -74,8 +74,15 @@ void __init ptdump_debugfs_register(struct ptdump_info *info, const char *name);
>>>  static inline void ptdump_debugfs_register(struct ptdump_info *info,
>>>  					   const char *name) { }
>>>  #endif /* CONFIG_PTDUMP_DEBUGFS */
>>> +
>>> +#ifdef CONFIG_ARM64_PTDUMP_CONSOLE
>>> +void __init arm64_kernel_pgtable_dump(void);
>>> +#else
>>> +static inline void __init arm64_kernel_pgtable_dump(void) { }
>>> +#endif /* CONFIG_ARM64_PTDUMP_CONSOLE */
>>>  #else
>>>  static inline void __init ptdump_init(void) { }
>>> +static inline void __init arm64_kernel_pgtable_dump(void) { }
>>>  static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
>>>  			     int level, pteval_t val) { }
>>>  static inline void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte) { }
>>> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
>>> index 0a3812c8e177..86bf7607d304 100644
>>> --- a/arch/arm64/kernel/setup.c
>>> +++ b/arch/arm64/kernel/setup.c
>>> @@ -361,6 +361,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
>>>  	init_bootcpu_ops();
>>>  	smp_init_cpus();
>>>  	smp_build_mpidr_hash();
>>> +	arm64_kernel_pgtable_dump();
>>>  
>>>  #ifdef CONFIG_ARM64_SW_TTBR0_PAN
>>>  	/*
>>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>>> index c78e6b496dea..f6d22462add6 100644
>>> --- a/arch/arm64/mm/ptdump.c
>>> +++ b/arch/arm64/mm/ptdump.c
>>> @@ -407,6 +407,13 @@ void __init ptdump_init(void)
>>>  	ptdump_initialize();
>>>  }
>>>  
>>> +#ifdef CONFIG_ARM64_PTDUMP_CONSOLE
>>> +void __init arm64_kernel_pgtable_dump(void)
>>> +{
>>> +	ptdump_walk(CONSOLE, &kernel_ptdump_info);
>>> +}
>>> +#endif
>>> +
>>>  static int __init ptdump_debugfs_init(void)
>>>  {
>>>  	ptdump_debugfs_register(&kernel_ptdump_info, "kernel_page_tables");
>>> -- 
>>> 2.25.1

