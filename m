Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5350BCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 22:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BOMu6oe61GRg1Xw06oGM7tV1QKUcyOcaBUZMk0O3xV8=; b=DHLd7vzicR33QoE7WkqreIY5h+
	wJVrjk1HpnUjx5d3clXjQMKqdXXl0v6XgYYy1+kUve2vdr0Jdy1t8Ogc97YLbQReEuVpPbqQhWTPD
	Nv0kLKxfx3V8Xaj103IbDbXk7pEmh/w/lR172bTd6AVtDHGFxuSwq/onhSrdc/NNf9c6wLdIw9Y9A
	+34J9s0F+DbXJhpku09y8NsDzDFrguKvnramvVdFM8CA4p2Uf16/92erhmqQ5kFz7CvKom+zwCW+Z
	5QAlcnbgMuZhCrI378Oa6Z3S/reXExA+0q9ADUpW92rfpdlyWBX47OCNSu/ssFuuIfxmRda8IXcZY
	cxJcJadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8OY-0000000GIzp-2jj1;
	Thu, 06 Nov 2025 22:23:54 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8OV-0000000GIz2-2OCi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 22:23:53 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7afd7789ccdso115235b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 14:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1762467830; x=1763072630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOMu6oe61GRg1Xw06oGM7tV1QKUcyOcaBUZMk0O3xV8=;
        b=R1DMjWLOZZSI6nZJm9PMYg3aJTE/XVvzk03Zj/WF1699bid2AarxS0xWHm8InYqZ3x
         BGXDICP/A3A8PGg62yaxfTyWgso/cRTCutX9DKYjCeIOy3Go/jRlnpIqrXXFfSjJOSzO
         /v/PQPDxglFsHjmS9avAKsoCW39fohgZ6tp/XcHgUtToJSw8ZRBc12Biy1qNQM72GhP4
         AqS6IwR07WyMubBzXymhxw5Vu548tj0yFb473upF0hum6QXtBPkjLMiXSjWbKGDOVYO1
         dYlYprYWG9uV/L6Q41QuhBuSwOqpwVYO2cw08SnANKADmYeYjTnq9VV3mEoW0SzMFFhB
         ulrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762467830; x=1763072630;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOMu6oe61GRg1Xw06oGM7tV1QKUcyOcaBUZMk0O3xV8=;
        b=L4tFK6Oo72nbn4xUsTCzdbFaGJj7poQEzlotKOUAy26ZjE4IChEYlgPd6nyRZrgBOo
         Eb2+tX1QJ1OgAFnEwRIqmOtNEBf6xrRPRHVrBUbuye9Y9DQj/zoi7VOyfp11NntYR5bW
         ijL7Y+C89RnKHRNgK+bFp+WGb9AX8VybGa24lDaRAcmWgqzrLSJQ/Q9fY8APTi2QeKHR
         xArG3E/cYw2H9awfnGz235ajxHPl5NQWtZwUBLPPXbWtIzJJvTE+hHTf2Yr8Yv9qnf0z
         BtjTiaeq+VjpLKTsp4TGQIxB75mdbObghLZ5PxsXYKqPM0CmAfcBcYAyc2dYkxSixiBs
         ZBUw==
X-Forwarded-Encrypted: i=1; AJvYcCUEWD5N6u4+JwczmSwSInNZfGo0+ts0DkAomftajuAUwT8A38vimtRn9PpOMUCUmN3ZD8TNzc31X0Vk2H5r3KdX@lists.infradead.org
X-Gm-Message-State: AOJu0YzwsnPHLqi3vurmRXj2e2NgjQFKDOhUfZsnRcrITkzpFkWeNGrx
	zrmLB9HMLeO9RqDcuCOxg1s2rT1kUIIEzC9fJEoWsjjSpUfY7snRk0U40S3ozkrAF8w=
X-Gm-Gg: ASbGncv+m2odHXNyBjLiNF0FBmhbeP7LXlWPU09SOwbLU63O9NVv6mCqvBbm3tzeypQ
	F1Hu7ISar/ARZW7yYtYgDwoe8E32GkP6Bba8MTEuf03zO+HfVDDHJzlrRxW3ak7mbzU/fRdfec+
	+7W+cMztko2gg/ghzTnldE1FzTVdZChYXvo2Xk5a+TyO1NAvQgieycXed0Kte80HoiDhAbW4LIf
	85u1/Hpow59Of2bi8fK7LHkvylvrM5JVB0X1iBEubHBzPOirbf97Jo+DXQy6g817hN8y5ra543R
	1eGlF++RmyXvnP/aktH+5bIHHL3GWOzBxIk7QZ62CnnZxGwqvM0IVqvBLrAy5Vsk1EtJHPIfGWl
	fdReIIBC1FByTASTZRMBWXsAikwA7uTAm17zqC3tUpDpJscegEaYXXOzuEPa8NYnYzTTRU7yG8l
	uN8xWaZ/1+E+qz5R5Vtv8cI0JiflaR6w==
X-Google-Smtp-Source: AGHT+IHAem4LivePbg0wqt+xvyujDNwytdpFM94epGdfDSudcpMIQ3v6yKKTbEgs7zoo4GaMwA9l2g==
X-Received: by 2002:a17:903:2a90:b0:295:57f6:768 with SMTP id d9443c01a7336-297c0464b46mr13062405ad.33.1762467829871;
        Thu, 06 Nov 2025 14:23:49 -0800 (PST)
Received: from localhost ([2620:10d:c090:500::4:b077])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509682casm38740385ad.22.2025.11.06.14.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 14:23:49 -0800 (PST)
Date: Thu, 06 Nov 2025 14:23:49 -0800 (PST)
X-Google-Original-Date: Thu, 06 Nov 2025 14:23:46 PST (-0800)
Subject: Re: [RFT PATCH] arm64: atomics: prefetch the destination prior to LSE operations
In-Reply-To: <aabe55ce-b245-35a4-51f8-464cc83834f6@huawei.com>
CC: Will Deacon <will@kernel.org>, yangyicong@hisilicon.com,
  Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
  broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
  baohua@kernel.org, jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
  prime.zeng@hisilicon.com, xuwei5@huawei.com, linuxarm@huawei.com, tiantao6@hisilicon.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yangyicong@huawei.com
Message-ID: <mhng-A2A85F7A-C90B-4AAA-A16A-AB1539FD1242@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_142351_856515_3A8DF7F5 
X-CRM114-Status: GOOD (  38.14  )
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

On Sat, 09 Aug 2025 02:48:41 PDT (-0700), yangyicong@huawei.com wrote:
> On 2025/8/8 19:35, Will Deacon wrote:
>> On Thu, Jul 24, 2025 at 08:06:51PM +0800, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> commit 0ea366f5e1b6 ("arm64: atomics: prefetch the destination word for write prior to stxr")
>>> adds prefetch prior to LL/SC operations due to performance concerns -
>>> change the cacheline status from exclusive could be significant. This is
>>> also true for LSE operations, so prefetch the destination prior to LSE
>>> operations.
>>>
>>> Tested on my HIP08 server (2 * 64 CPU) using `perf bench -r 100 futex all`
>>> which could stress the spinlock of the futex hash bucket:
>>>                         6.16-rc7 patched
>>> futex/hash(ops/sec)     171843   204757 +19.15%
>>> futex/wake(ms)          0.4630   0.4216 +8.94%
>>> futex/wake-parallel(ms) 0.0048   0.0039 +18.75%
>>> futex/requeue(ms)       0.1487   0.1508 -1.41%
>>> (2nd validation)                 0.1484 +0.2%
>>> futex/lock-pi(ops/sec)  125      126    +0.8%
>>>
>>> For a single wake test for different threads number using `perf bench
>>> -r 100 futex wake -t <threads>`:
>>> threads 6.16-rc7 patched
>>> 1       0.0035   0.0032 +8.57%
>>> 48      0.1454   0.1221 +16.02%
>>> 96      0.3047   0.2304 +24.38%
>>> 160     0.5489   0.5012 +8.69%
>>> 192     0.6675   0.5906 +11.52%
>>> 256     0.9445   0.8092 +14.33%
>>>
>>> There're some variation for close numbers but overall results
>>> look positive.
>>>
>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>> ---
>>>
>>> RFT for tests and feedbacks since not sure it's general or just the optimization
>>> on some specific implementations.
>>>
>>>  arch/arm64/include/asm/atomic_lse.h | 7 +++++++
>>>  arch/arm64/include/asm/cmpxchg.h    | 3 ++-
>>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> One of the motivations behind rmw instructions (as opposed to ldxr/stxr
>> loops) is so that the atomic operation can be performed at different
>> places in the memory hierarchy depending upon where the data resides.
>>
>> For example, if a shared counter is sitting at a level of system cache,
>> it may be optimal to leave it there so that CPUs around the system can
>> post atomic increments to it without forcing the line up and down the
>> cache hierarchy every time.

A few of us were over here 
https://lore.kernel.org/all/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop/ 
talking about similar things.  It doesn't actually have anything to do with
Paul's issue, as that's in percpu, but I happened to have run into some cases
where ATOMIC_ST_NEAR produced better application-level throughput recently and
though I'd poke around here too.

Over there we also found that microbenchmarks report better performance for a
bunch of different flavors of these atomics (LDADD, prefetches, and
ATOMIC_ST_NEAR on my end).  This was true even for the contended cases, which I
found kind of surprising.

I benchmarked this with schbench, and found it's about 10% worse p99 
latency (and also slightly worse at the other tiers).  I see the same 
thing with ATOMIC_ST_NEAR (which IIUC basically just does this in HW).

I also converted everything to LDADD-style routines (ie, not just the percpu
ones).  Those were the best in the microbenchmarks, but they don't show any
difference compared to STADD-style routines.

Here's the code in case anyone's interested, though:

    diff --git a/arch/arm64/include/asm/atomic_lse.h b/arch/arm64/include/asm/atomic_lse.h
    index 87f568a94e55..03fddf5fa46f 100644
    --- a/arch/arm64/include/asm/atomic_lse.h
    +++ b/arch/arm64/include/asm/atomic_lse.h
    @@ -14,17 +14,18 @@
     static __always_inline void                                            \
     __lse_atomic_##op(int i, atomic_t *v)                                  \
     {                                                                      \
    +       long tmp;                                                       \
            asm volatile(                                                   \
            __LSE_PREAMBLE                                                  \
    -       "       " #asm_op "     %w[i], %[v]\n"                          \
    -       : [v] "+Q" (v->counter)                                         \
    +       "       " #asm_op "     %w[i], %w[t], %[v]\n"                   \
    +       : [v] "+Q" (v->counter), [t] "=r" (tmp)                         \
            : [i] "r" (i));                                                 \
     }
    
    -ATOMIC_OP(andnot, stclr)
    -ATOMIC_OP(or, stset)
    -ATOMIC_OP(xor, steor)
    -ATOMIC_OP(add, stadd)
    +ATOMIC_OP(andnot, ldclr)
    +ATOMIC_OP(or, ldset)
    +ATOMIC_OP(xor, ldeor)
    +ATOMIC_OP(add, ldadd)
    
     static __always_inline void __lse_atomic_sub(int i, atomic_t *v)
     {
    @@ -121,17 +122,18 @@ ATOMIC_FETCH_OP_AND(        , al, "memory")
     static __always_inline void                                            \
     __lse_atomic64_##op(s64 i, atomic64_t *v)                              \
     {                                                                      \
    +       long tmp;                                                       \
            asm volatile(                                                   \
            __LSE_PREAMBLE                                                  \
    -       "       " #asm_op "     %[i], %[v]\n"                           \
    -       : [v] "+Q" (v->counter)                                         \
    +       "       " #asm_op "     %[i], %[t], %[v]\n"                     \
    +       : [v] "+Q" (v->counter), [t] "=r" (tmp)                         \
            : [i] "r" (i));                                                 \
     }
    
    -ATOMIC64_OP(andnot, stclr)
    -ATOMIC64_OP(or, stset)
    -ATOMIC64_OP(xor, steor)
    -ATOMIC64_OP(add, stadd)
    +ATOMIC64_OP(andnot, ldclr)
    +ATOMIC64_OP(or, ldset)
    +ATOMIC64_OP(xor, ldeor)
    +ATOMIC64_OP(add, ldadd)
    
     static __always_inline void __lse_atomic64_sub(s64 i, atomic64_t *v)
     {

> yes it's true. for a CHI based system the atomic can be implemented in
> the cpu (RN-F) which is termed as near atomic and outside the cpu on the
> system component (system cache, etc) which is termed as far atomic [1].
> the above example should refer to the far atomic and the atomic operations
> don't need to be finished in the cpu cache.
>
> [1] https://developer.arm.com/documentation/102714/0100/Atomic-fundamentals
>
>>
>> So, although adding an L1 prefetch may help some specific benchmarks on
>> a specific system, I don't think this is generally a good idea for
>> scalability. The hardware should be able to figure out the best place to
>> do the operation and, if you have a system where that means it should
>> always be performed within the CPU, then you should probably configure
>> it not to send the atomic remotely rather than force that in the kernel
>> for everybody.
>>
>
> the prefetch may not be benefit for the far atomic since the atomic operation
> is not doned in the cpu cache, but will help those system implemented as near
> atomic since it can load the data into the cpu cache prior to the atomic
> operations. So alternatively, instead of enabling this all the time is it
> acceptable to make this a kconfig/cmdline option as an optimization for near
> atomic systems then those users can benefit from this?
>
> Thanks.

