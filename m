Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E587EE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8n2ma/ziuKr5ZfTxLhXrZB/sBg/b3H77RWqJjKv6Y0=; b=1bcrBLZN0G51+lfOOZ3VtqLM3j
	ZAFvDNN7ECUJ+IZiIoH4lecPzFqEuEnIEsHsTWdMZnqv/6kGUiuZmqD7T7z5PoJFZnwhKX3hWSFiK
	XXmh8RiPJVdaGk+f4ZPhgGWfN55sYA7C+z1FuoifyaSePeeMpf4AFRNiUmcdmGzbvmV1oU7yUSF7h
	nYqvX7HRBswV88XkYYqSGc5LIIjGwO1mff2/AoyrUHe0OJkIAttS8MhW7pZGWPNm/JdrjVS/TJcPL
	ruFnRr+N0jQrE0vXCGdVn6wLqkZxriG0m79ZzZaU9AKShRWmb7FlT4U+mG98up/ilPQT844xBJNh7
	lPnCE1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBPU-0000000EkNL-2Sxs;
	Fri, 10 Jan 2025 09:34:32 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBEf-0000000EgZ2-4B1G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:23:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so2968838a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 01:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736501000; x=1737105800; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/8n2ma/ziuKr5ZfTxLhXrZB/sBg/b3H77RWqJjKv6Y0=;
        b=HNORQVxhpJUpf5qpqoxU0CTFHxdV5+TX8e7saNL6W+k+4+A6yTAMVvMnmIWUkIrIlD
         vnnB4aoIQdJ6Skcoilbn+xFlG4J+LiCxGaiUMeTA6zhRzKrG7gZ1xCSFzdNAhccnaMTB
         V87JX9g5dqpGY08XeX099QtgT/BqxPKRVo9EWScDB9eszygZGCPBgeJs1VOqaQNyS9SB
         YWwfWp8pLU22te5UZdNACnDP9HuoEhA/h8xrKAfnvkZrLaFb0UwmUBYCKLrWf70HUnds
         8IdtezXiFODs23sUUn0C3nEPDjHWt90Y/WyLbR+gCj+BvmvlbYt813SkXZXKUeJmmUD6
         YZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736501000; x=1737105800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8n2ma/ziuKr5ZfTxLhXrZB/sBg/b3H77RWqJjKv6Y0=;
        b=O/sHW4vLQ7+g9ZoTS3gpaqXUm6+udfIEWKtqD+WcUA79XIn9kgq/DtrqIExSg18MrB
         8ExjdRvB4SPwRDMdTrol3PyRc2iQACRLltppFmevTgRv4O51qx9ii2PY8rpNCkNj8Bqa
         /UfFHshk1txi76GLwx5YrYxvO4zxcQdvmz8FQgU+rJ4iwVijgrqc785pNj1zxw2tjcHZ
         a5wjTVeSjQpKqf//EuHLLa5lys5tALJoq4L7eWe14DN9dfpAftuOUBTeeraJIWh29+wG
         lYjEtukEEXQf1wS/d4+P8Hlse2cCpN8d4B34BRZfzQEV4lmFA8phpnvBuUKiXHv60PHT
         FT8g==
X-Forwarded-Encrypted: i=1; AJvYcCU5aWLLG6R9tVP3sKDrECttaejjZ3MK3ve6THVS+iIhMY7z909e3uykb6mQiMrkDy8DbQFEZzVpmHJJ2zRCeUaI@lists.infradead.org
X-Gm-Message-State: AOJu0YylKzC/KNKBonV0XXDOnZP832OGB7v0hcSwMYbEsYYMDGvCSqCz
	JQ9Ad1/B0SxL10uSjULHHzEbP7sAy+eoPyKcuyclppoA6Ul4izbcChXQCduOZf01opYFrtUywnz
	o8M/zPHELivDTYmeASVlBkgV051AdoNlKdwhi
X-Gm-Gg: ASbGncsH8QAtXBFr0HYkbUcgaGvBQNOM+weaaircLFDhitDBni28q9CrPgAlLVfZbKM
	bS/1xemeciV6knNtursYrkP9mSmXBhxXBei78uvbBConrRQ893m6ZYNQ3vytAIE6ZWFst2Q==
X-Google-Smtp-Source: AGHT+IEav7llRQkaGRkKqlm4jpxalFoMFJLbH+c+XE/B2dEdXVu/vLKg6ejDqUmr3L00UB4/cFzFuVkFajos5hgHzXU=
X-Received: by 2002:a17:90b:5483:b0:2ea:3d2e:a0d7 with SMTP id
 98e67ed59e1d1-2f548f2a897mr15945376a91.15.1736501000183; Fri, 10 Jan 2025
 01:23:20 -0800 (PST)
MIME-Version: 1.0
References: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>
In-Reply-To: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>
From: Marco Elver <elver@google.com>
Date: Fri, 10 Jan 2025 10:22:44 +0100
X-Gm-Features: AbW1kvbwJdd-Q4HHGj93BJhXupMaNDNojdpH0KA2V7DRnVCIXbRzJRAefX-Qlpc
Message-ID: <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
Subject: Re: [PATCH] kcov: add unique cover, edge, and cmp modes
To: Joey Jiao <quic_jiangenj@quicinc.com>
Cc: dvyukov@google.com, andreyknvl@gmail.com, corbet@lwn.net, 
	akpm@linux-foundation.org, gregkh@linuxfoundation.org, nogikh@google.com, 
	pierre.gondois@arm.com, cmllamas@google.com, quic_zijuhu@quicinc.com, 
	richard.weiyang@gmail.com, tglx@linutronix.de, arnd@arndb.de, 
	catalin.marinas@arm.com, will@kernel.org, dennis@kernel.org, tj@kernel.org, 
	cl@linux.com, ruanjinjie@huawei.com, colyli@suse.de, 
	andriy.shevchenko@linux.intel.com, kernel@quicinc.com, 
	quic_likaid@quicinc.com, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_012322_034619_AC482DE6 
X-CRM114-Status: GOOD (  22.90  )
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

On Fri, 10 Jan 2025 at 08:33, Joey Jiao <quic_jiangenj@quicinc.com> wrote:
>
> From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
>
> The current design of KCOV risks frequent buffer overflows. To mitigate
> this, new modes are introduced: KCOV_TRACE_UNIQ_PC, KCOV_TRACE_UNIQ_EDGE,
> and KCOV_TRACE_UNIQ_CMP. These modes allow for the recording of unique
> PCs, edges, and comparison operands (CMP).

There ought to be a cover letter explaining the motivation for this,
and explaining why the new modes would help. Ultimately, what are you
using KCOV for where you encountered this problem?

> Key changes include:
> - KCOV_TRACE_UNIQ_[PC|EDGE] can be used together to replace KCOV_TRACE_PC.
> - KCOV_TRACE_UNIQ_CMP can be used to replace KCOV_TRACE_CMP mode.
> - Introduction of hashmaps to store unique coverage data.
> - Pre-allocated entries in kcov_map_init during KCOV_INIT_TRACE to avoid
>   performance issues with kmalloc.
> - New structs and functions for managing memory and unique coverage data.
> - Example program demonstrating the usage of the new modes.

This should be a patch series, carefully splitting each change into a
separate patch.
https://docs.kernel.org/process/submitting-patches.html#split-changes

> With the new hashmap and pre-alloced memory pool added, cover size can't
> be set to higher value like 1MB in KCOV_TRACE_PC or KCOV_TRACE_CMP modes
> in 2GB device with 8 procs, otherwise it causes frequent oom.
>
> For KCOV_TRACE_UNIQ_[PC|EDGE|CMP] modes, smaller cover size like 8KB can
> be used.
>
> Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>

As-is it's hard to review, and the motivation is unclear. A lot of
code was moved and changed, and reviewers need to understand why that
was done besides your brief explanation above.

Generally, KCOV has very tricky constraints, due to being callable
from any context, including NMI. This means adding new dependencies
need to be carefully reviewed. For one, we can see this in genalloc's
header:

> * The lockless operation only works if there is enough memory
> * available.  If new memory is added to the pool a lock has to be
> * still taken.  So any user relying on locklessness has to ensure
> * that sufficient memory is preallocated.
> *
> * The basic atomic operation of this allocator is cmpxchg on long.
> * On architectures that don't have NMI-safe cmpxchg implementation,
> * the allocator can NOT be used in NMI handler.  So code uses the
> * allocator in NMI handler should depend on
> * CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG.

And you are calling gen_pool_alloc() from __sanitizer_cov_trace_pc.
Which means this implementation is likely broken on
!CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG architectures (do we have
architectures like that, that support KCOV?).

There are probably other sharp corners due to the contexts KCOV can
run in, but would simply ask you to carefully reason about why each
new dependency is safe.

