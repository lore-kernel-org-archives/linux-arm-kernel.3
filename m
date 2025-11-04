Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C05CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9308af9824wJRQCfrTUzUzLWeaNsBxXGH7cM00c8/dg=; b=Z0uDS+VLI3Yl2h4LFeawg7MLrs
	tsZOsU+xWh1Xmnf8dTGVTlHbSSmdRhlulnYtOYmIvSLXCc+qDmNsz68/gufuGON/5cLKc/8alkZnj
	kMJ95P4gTDU8zEQoTQOUv/MGuFl7uEmDxcVKDj5WpzRzNA/7rhwk/sNyxoKI5huIHbfeOuobk5Ws8
	VpgtXJ6XCR2Fm4L3Y0vogVnkuRyMDQ00ulzlprxOaOnuDEZLXpoCxK+9nqm+6c/yXy0991zeJulx6
	Lw1rSTgWB4M/zg45FCSWTz+buWMJyv64hVKJlSr56AdARRIjOYqp6yXp8Oyw+wFl+EfGk+L53EfOq
	JhA5ekZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJRi-0000000C930-2Cgx;
	Tue, 04 Nov 2025 15:59:46 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJRf-0000000C92V-19SA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:59:44 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b5e19810703so768802266b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 07:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762271981; x=1762876781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9308af9824wJRQCfrTUzUzLWeaNsBxXGH7cM00c8/dg=;
        b=qIOyqZVbqa2sJOHalHrTPPm6pCp1a00R5bb6vztCYbR35X/QWlZWLs5aH1UyMGQs4B
         d/suqN6EWuH9MzO8xENaZXTZEre06n4re6WRt+Bkpn4aGVldP3Ie6H/Lhv1kKnilA9cv
         f2SncCz/eva0qoscVuqCcDUPLhKw9RRkHpiFcS72XuHI+eszj3BimDk0LBMa8M0CAZs/
         KVZfTfyyLrzbelmC62QtswS7aoHpyorB9ZoFBf/GREwDDwXMRT90WNeGDbHz7S1KF88m
         X3BXKNtHchKqMoziWzXkEqJxN8kwXg1PffSUPgzUVe0jHWOoFzw60+0u63slf4KCWZwI
         jZTw==
X-Forwarded-Encrypted: i=1; AJvYcCW4pPv5eE3Y38037Rf2jvzF3WbUBYOx8TtXF3udIocKncnVHRtzLZ1WBP5CrSbwL4uCdQ84w7xvoC6d2nn5SBDx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw69N3WkJBjpNFsl4WvW85DUdkZIuEYAdoBIzwPEFPpsoNvAIIZ
	nYIKXhiRdDihTFA9PUML9rMJXGnU6PKkWhYgBp7SpAubVmROayb1qogg
X-Gm-Gg: ASbGncvcXZc5xkn0OUtRVMq0hz7qTPfbRyVnhIuPsRus76eY2I5ICMT1oLBMzjPL/Sr
	fiDIeMDYWsN4ATY3VQyCYQsyDGEcuBktuTJlJJfXh2onuylbrEhlU7uDfM7yLa5LsMhXkKHdtA1
	chu8YrUpAwwojSpDIzS17TXbuB/hAGZfEIp70rppkUShvXDTgHt0iV+IuXUDr7HcUwqXrJ8VbbP
	M2Ov4gfgsu6jCyHNW1GSB7wmM7/MJ1Uc6dXHBvX3chEU3AyjqXznJVl2saV0LO67UGO1YMkIFHm
	Le0SmOIYzwAOhA00MJbVrftBnw+zaORrQSuK1F8TuBF/hluOJ2MpTwimyEeGcnKB/+andjiAq8u
	4plBeGgsCh0/tb1YKf7dD2PW82h6Fi2uW5Y6oUn2c35PilrDwIXmDV9+OcSFO8RaUyw==
X-Google-Smtp-Source: AGHT+IHpmsXSBgeR/w7xWSqSP2e0Jw7qjRWDdQQ9nO24GcsKEnOmflUVhuJ5rMTNxWHA7NiItt9nSQ==
X-Received: by 2002:a17:907:944d:b0:b70:b661:cfcb with SMTP id a640c23a62f3a-b70b6620591mr1064291966b.31.1762271980738;
        Tue, 04 Nov 2025 07:59:40 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:6::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d7030adsm245704466b.24.2025.11.04.07.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 07:59:40 -0800 (PST)
Date: Tue, 4 Nov 2025 07:59:38 -0800
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, kernel-team@meta.com, 
	rmikey@meta.com
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQUAR9MRxP6_qtEH@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_075943_327994_2767044E 
X-CRM114-Status: GOOD (  25.14  )
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

Hello Catalin,

On Fri, Oct 31, 2025 at 06:30:31PM +0000, Catalin Marinas wrote:
> On Thu, Oct 30, 2025 at 03:37:00PM -0700, Paul E. McKenney wrote:
> > To make event tracing safe for PREEMPT_RT kernels, I have been creating
> > optimized variants of SRCU readers that use per-CPU atomics.  This works
> > quite well, but on ARM Neoverse V2, I am seeing about 100ns for a
> > srcu_read_lock()/srcu_read_unlock() pair, or about 50ns for a single
> > per-CPU atomic operation.  This contrasts with a handful of nanoseconds
> > on x86 and similar on ARM for a atomic_set(&foo, atomic_read(&foo) + 1).
> 
> That's quite a difference. Does it get any better if
> CONFIG_ARM64_LSE_ATOMICS is disabled? We don't have a way to disable it
> on the kernel command line.
> 
> Depending on the implementation and configuration, the LSE atomics may
> skip the L1 cache and be executed closer to the memory (they used to be
> called far atomics). The CPUs try to be smarter like doing the operation
> "near" if it's in the cache but the heuristics may not always work.

I am trying to play with LSE latency and compare it with LL/SC usecase. I
_think_ I have a reproducer in userspace

I've create a simple userspace program to compare the latency of a atomic add
using LL/SC and LSE, basically comparing the following two functions while
executing without any contention (single thread doing the atomic operation -
no atomic contention):

	static inline void __percpu_add_case_64_llsc(void *ptr, unsigned long val)
	{
		asm volatile(
			/* LL/SC */
			"1:  ldxr    %[tmp], %[ptr]\n"
			"    add     %[tmp], %[tmp], %[val]\n"
			"    stxr    %w[loop], %[tmp], %[ptr]\n"
			"    cbnz    %w[loop], 1b"
			: [loop] "=&r"(loop), [tmp] "=&r"(tmp), [ptr] "+Q"(*(u64 *)ptr)
			: [val] "r"((u64)(val))
			: "memory");
	}

and

	/* LSE implementation */
	static inline void __percpu_add_case_64_lse(void *ptr, unsigned long val)
	{
		asm volatile(
			/* LSE atomics */
			"    stadd    %[val], %[ptr]\n"
			: [ptr] "+Q"(*(u64 *)ptr)
			: [val] "r"((u64)(val))
			: "memory");
	}

I found that the LSE case (__percpu_add_case_64_lse) has a huge variation,
while LL/SC case is stable.
In some case, LSE function runs at the same latency as LL/SC function and
slightly faster on p50, but, something happen to the system and LSE operations
start to take way longer than LL/SC.

Here are some interesting output coming from the latency of the functions above>

	CPU: 47 - Latency Percentiles:
	====================
	LL/SC:   p50: 5.69 ns      p95: 5.71 ns      p99: 5.80 ns
	LSE  :   p50: 45.53 ns     p95: 54.06 ns     p99: 55.18 ns

	CPU: 48 - Latency Percentiles:
	====================
	LL/SC:   p50: 5.70 ns      p95: 5.72 ns      p99: 6.10 ns
	LSE  :   p50: 4.02 ns      p95: 45.55 ns     p99: 54.93 ns

	CPU: 49 - Latency Percentiles:
	====================
	LL/SC:   p50: 5.74 ns      p95: 5.75 ns      p99: 5.78 ns
	LSE  :   p50: 4.04 ns      p95: 50.32 ns     p99: 53.04 ns


At this stage, it is unclear what is causing these variations.

The code above could be run with:

 # git clone https://github.com/leitao/debug.git
 # cd debug/LSE
 # make && ./percpu_bench

