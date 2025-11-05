Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB9BCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=59vsqQ0JqH9pWu9RaayMP8MYSzxTsVH9ss8hNgzFB6A=; b=Tr6iumHYS/SkmyhRE6Euz1o9j8
	T54ZULyAJBtB+0wwhzz2R5M6/Xu/vvWX+xdorByRs0o0ImVbL5kCadhHTyXyrLBvDqQamirGT1Hos
	IqtBGwtHuhREs+9tAy5PnkTe5qZvc7EDkkd/oxQYB2FOxy7Sj3yt2mG30/6aCwmB/BwTVoeDcb5Xq
	ofdurS7xhymdzU+TIQklcPHlZc1OqDSBK96wLEQry5PzC9BhvF4y4NTFow1vE2ztV6GHqu4lbKcDF
	3b9sjggLQEtuR16UbAiXDkQQgzI8OncLwIFb05tPGKeMjj81J+3lQ3xPPGQTHVjB4eGXv1Hi9hbGz
	3vUY1bKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkoe-0000000ETNP-2cBD;
	Wed, 05 Nov 2025 21:13:16 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkob-0000000ETMA-3BJJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:13:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2953ad5517dso3051335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 13:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1762377192; x=1762981992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59vsqQ0JqH9pWu9RaayMP8MYSzxTsVH9ss8hNgzFB6A=;
        b=IEzdI+/RcHrSA3gaLiOiY32UihMWG7f76bIckTQO/WaR3YwyY6lyjuuFTpo6zvuY2e
         McCoPyjbJu5DqeA0YSoY5jyKpCQgQiHXTSBcJTFwHGXLQ7J2pa8F4M2+WqzaN/2U7ZGy
         zPZh7nlNLF2ozBluTnACNhbZA4rkE4Z7I3k1VbJN06c1AoT9Vd/Zu7V8o0BNYa+jQf18
         DHpBx5yBPAZtFE07magWMAQWeQHCG1N64g/9kAO1QQcHbY3qtiAYiaLjnPC8XGi6Yb1v
         0hAR7xwyBBjaTnLrzcpcwKrr2wUo2FXFMAn06R+w+W4+mZYMsUXY9HyL61dOsG7fFWV7
         Fh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762377192; x=1762981992;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59vsqQ0JqH9pWu9RaayMP8MYSzxTsVH9ss8hNgzFB6A=;
        b=Ivlhm+XrA9fbG/BsAUdyfoQaBAfIu9b0iteOSRm/uw9x/8MzcEkJXmwYsU97YRYCpu
         gAcjjRq6PkF50Qe3bUKNc0yojriyLfdFWDqEpbsuVFMbD1MkxhYe5NGlzDwmeCFDXfPx
         UbOo111Fejvbo+dfHVSfFxQn5Kq1sTI76Fji0nKz0UktWp4kTq3b77kONXJacJndOwdq
         ig5xxT7bMQJY1A4gUU1d4hCUhyrtVE6ja/87J8E8OuY2Q/McDPh5WmrqhHsReO9y/0MT
         y76d3b3yuy9iEmkh1uhKJ1+w5g7rcItf5WAScM7lTvWvyOCFRuq17soScCinavySgwrb
         ebTw==
X-Forwarded-Encrypted: i=1; AJvYcCVypJgX+KOsEnuf/lG8KO7/MOy/SmjHK9DD9Qd2KJPHZjkWc48psRctEunMqKBKx2Lbui6uQqnyb2d2ZM9F5cgH@lists.infradead.org
X-Gm-Message-State: AOJu0YxE3uKGAVVhisbZHRpVKuxs7VWkDbnBypeWtzIlT0uB1O+qJngM
	UJc41vHaZ7c3MO3CNR/3frXBp36dpHaFt7T+Iw7skMfvXabkunFRljqcE+pdHnDBFnk=
X-Gm-Gg: ASbGnctKAubX3kXIBPkfLBQ8ycYBddq8/E1II+rHmQ0frr0y45GLklFIWsFNSGMlOlO
	N4jqNiuznXV0QjaRBdbLkCHQH+B0ZtQsOdXuS3kfiyqJZ3aTON3QYp3BBMshqOfjYY7i1ENwPKD
	aCA5SoTF7t3joik3m7mk7NmAYKzo+4Sz7CgYKzsOJ621r9yY3kNWqVXovfpbDKBSoEmY1yHV/VL
	O+bnfPdqHdOomBOBvXiLZeKJ/xYas0p+DAjyieYOZIwG4YaSgWqC/HGSRzaIqrVc7sewJh6Vs1q
	O2/V649pnze+wBJI0gMh3Y099U2O3Xn8RheAwuHrL1VvNA7pFbQzGrVrGoE2PrX8l5oE37eEWnE
	YDd0II9O5cEvHZOGkIHlvPdlzeISZNh7Y+o6vNDoRvaXqEAn6JV/eD+yuiQariGL7C0S2Nza2cr
	bPjd8OweB+EaibeINc0L2bRhkCpoGR0g==
X-Google-Smtp-Source: AGHT+IE59DB0TFxKIEaN2I6TeCD5JT2tKfuN5ua8cycm1nXwuok/ynSystUmnzz/dmt/rwdeaNCrkQ==
X-Received: by 2002:a17:902:d550:b0:295:86a1:5008 with SMTP id d9443c01a7336-2962ae4d0b5mr60653295ad.38.1762377191563;
        Wed, 05 Nov 2025 13:13:11 -0800 (PST)
Received: from localhost ([2620:10d:c090:500::6:4896])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93cebsm4667625ad.90.2025.11.05.13.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:13:10 -0800 (PST)
Date: Wed, 05 Nov 2025 13:13:10 -0800 (PST)
X-Google-Original-Date: Wed, 05 Nov 2025 13:13:08 PST (-0800)
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
In-Reply-To: <aQuimp4CRywdy97S@arm.com>
CC: paulmck@kernel.org, Will Deacon <will@kernel.org>,
  Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <mhng-28F4A0BA-47EC-49AD-90A5-73EA7D029CA3@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_131313_926012_AF018B2B 
X-CRM114-Status: GOOD (  49.87  )
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

On Wed, 05 Nov 2025 11:16:42 PST (-0800), Catalin Marinas wrote:
> On Wed, Nov 05, 2025 at 09:40:32AM -0800, Paul E. McKenney wrote:
>> On Wed, Nov 05, 2025 at 05:15:51PM +0000, Catalin Marinas wrote:
>> > On Wed, Nov 05, 2025 at 08:25:51AM -0800, Paul E. McKenney wrote:
>> > > On Wed, Nov 05, 2025 at 03:34:21PM +0000, Catalin Marinas wrote:
>> > > > Given that this_cpu_*() are meant for the local CPU, there's less risk
>> > > > of cache line bouncing between CPUs, so I'm happy to change them to
>> > > > either use PRFM or LDADD (I think I prefer the latter). This would not
>> > > > be a generic change for the other atomics, only the per-CPU ones.
>> > >
>> > > I have easy access to only the one type of ARM system, and of course
>> > > the choice must be driven by a wide range of systems.  But yes, it
>> > > would be much better if we can just use this_cpu_inc().  I will use the
>> > > non-atomics protected by interrupt disabling in the meantime, but look
>> > > forward to being able to switch back.
>> >
>> > BTW, did you find a problem with this_cpu_inc() in normal use with SRCU
>> > or just in a microbenchmark hammering them? From what I understand from
>> > the hardware folk, doing STADD in a loop saturates some queues in the
>> > interconnect and slows down eventually. In normal use, it's just a
>> > posted operation not affecting the subsequent instructions (or at least
>> > that's the theory).
>>
>> Only in a microbenchmark, and Breno did not find any issues in larger
>> benchmarks, so good to hear!

FWIW, I have a proxy workload where enabling ATOMIC_*_FORCE_NEAR is ~1% 
better (at application-level throughput).  It's supposed to be 
representative of real workloads and isn't supposed to have contention, 
but I don't trust these workloads at all so take that with a grain of 
salt...

I still had looking into this on my TODO list, I was planning on doing 
it all internally as a tuning thing but LMK if folks think it's 
interesting and I'll try to find some way to talk about it publicly.

>> Now, some non-arm64 systems deal with it just fine, but perhaps I owe
>> everyone an apology for the firedrill.
>
> That was a useful exercise, I learnt more things about the arm atomics.
>
>> But let me put it this way...  Would you ack an SRCU patch that resulted
>> in 100ns microbenchmark numbers on arm64 compared to <2ns numbers on
>> other systems?
>
> Only if it's backed by other microbenchmarks showing significant
> improvements ;).
>
> I think we should change the percpu atomics, it makes more sense to do
> them near, but I'll keep the others as they are. Planning to post a

I guess I kind of went down a rabbit hole here, but I think I found some 
interesting stuff.  This is all based on some modifications of Breno's 
microbenchmark to add two things:

* A contending thread, which performs the same operation on the same 
  counter in a loop, with operations separated by a variable-counted 
  loop of NOPs.
* Some busy work for the timed thread, which is also just a loop of 
  NOPs.

Those loops look like

    for (d = 0; d < duty; d++)
        __asm__ volatile ("nop");

in the code and get compiled to

                            for (d = 0; d < duty; d++)
      41037c:       f90007ff        str     xzr, [sp, #8]
      410380:       14000001        b       410384 <run_core_benchmark+0x74>
      410384:       f94007e8        ldr     x8, [sp, #8]
      410388:       f85e03a9        ldur    x9, [x29, #-32]
      41038c:       eb090108        subs    x8, x8, x9
      410390:       54000102        b.cs    4103b0 <run_core_benchmark+0xa0>  // b.hs, b.nlast
      410394:       14000001        b       410398 <run_core_benchmark+0x88>
                                    __asm__ volatile ("nop");
      410398:       d503201f        nop
      41039c:       14000001        b       4103a0 <run_core_benchmark+0x90>
                            for (d = 0; d < duty; d++)
      4103a0:       f94007e8        ldr     x8, [sp, #8]
      4103a4:       91000508        add     x8, x8, #0x1
      4103a8:       f90007e8        str     x8, [sp, #8]
      4103ac:       17fffff6        b       410384 <run_core_benchmark+0x74>
                    }

which is I guess kind of wacky generated code, but is maybe a reasonable 
proxy for work -- it's got load/stores/branches, which IIUC is what real 
code does ;)

I ran a bunch of cases with those:

 CPU: 0 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 063.65 ns        p95: 065.02 ns          p99: 065.32 ns
LSE (stadd)     (c                0, d              100):   p50: 063.71 ns        p95: 064.96 ns          p99: 065.68 ns
LSE (stadd)     (c                0, d              200):   p50: 068.07 ns        p95: 082.98 ns          p99: 083.24 ns
LSE (stadd)     (c                0, d              300):   p50: 098.96 ns        p95: 121.14 ns          p99: 122.04 ns
LSE (stadd)     (c               10, d                0):   p50: 115.33 ns        p95: 117.25 ns          p99: 117.35 ns
LSE (stadd)     (c               10, d              300):   p50: 115.30 ns        p95: 119.12 ns          p99: 121.68 ns
LSE (stadd)     (c               10, d              500):   p50: 162.94 ns        p95: 185.24 ns          p99: 195.79 ns
LSE (stadd)     (c               30, d                0):   p50: 115.17 ns        p95: 117.14 ns          p99: 117.84 ns
LSE (stadd)     (c              100, d                0):   p50: 115.17 ns        p95: 117.13 ns          p99: 117.35 ns
LSE (stadd)     (c            10000, d                0):   p50: 064.81 ns        p95: 066.24 ns          p99: 067.08 ns
LL/SC           (c                0, d                0):   p50: 005.66 ns        p95: 006.45 ns          p99: 006.47 ns
LL/SC           (c                0, d               10):   p50: 006.19 ns        p95: 006.98 ns          p99: 007.01 ns
LL/SC           (c                0, d               20):   p50: 007.35 ns        p95: 008.88 ns          p99: 009.46 ns
LL/SC           (c               10, d                0):   p50: 164.16 ns        p95: 462.97 ns          p99: 580.92 ns
LL/SC           (c               10, d               10):   p50: 303.22 ns        p95: 575.03 ns          p99: 609.62 ns
LL/SC           (c               10, d               20):   p50: 032.24 ns        p95: 042.03 ns          p99: 048.71 ns
LL/SC           (c             1000, d                0):   p50: 017.37 ns        p95: 018.18 ns          p99: 018.19 ns
LL/SC           (c             1000, d               10):   p50: 019.54 ns        p95: 020.37 ns          p99: 021.79 ns
LL/SC           (c          1000000, d                0):   p50: 015.46 ns        p95: 017.00 ns          p99: 017.25 ns
LL/SC           (c          1000000, d               10):   p50: 017.57 ns        p95: 019.16 ns          p99: 019.47 ns
LDADD           (c                0, d                0):   p50: 004.33 ns        p95: 004.64 ns          p99: 005.13 ns
LDADD           (c                0, d              100):   p50: 032.15 ns        p95: 040.29 ns          p99: 040.69 ns
LDADD           (c                0, d              200):   p50: 067.97 ns        p95: 083.04 ns          p99: 083.30 ns
LDADD           (c                0, d              300):   p50: 098.93 ns        p95: 120.79 ns          p99: 122.52 ns
LDADD           (c                1, d              100):   p50: 049.19 ns        p95: 072.23 ns          p99: 072.38 ns
LDADD           (c                1, d              200):   p50: 143.15 ns        p95: 145.34 ns          p99: 145.90 ns
LDADD           (c                1, d              300):   p50: 153.91 ns        p95: 162.57 ns          p99: 163.84 ns
LDADD           (c               10, d                0):   p50: 012.46 ns        p95: 013.24 ns          p99: 014.33 ns
LDADD           (c               10, d              100):   p50: 049.34 ns        p95: 069.35 ns          p99: 070.71 ns
LDADD           (c               10, d              200):   p50: 141.66 ns        p95: 143.65 ns          p99: 144.31 ns
LDADD           (c               10, d              300):   p50: 152.82 ns        p95: 163.51 ns          p99: 164.03 ns
LDADD           (c              100, d                0):   p50: 012.37 ns        p95: 013.23 ns          p99: 014.52 ns
LDADD           (c              100, d               10):   p50: 014.32 ns        p95: 015.11 ns          p99: 015.15 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 003.97 ns        p95: 005.23 ns          p99: 005.49 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 126.02 ns        p95: 127.72 ns          p99: 128.72 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 021.97 ns        p95: 023.93 ns          p99: 024.97 ns
PFRM_KEEP+STADD (c          1000000, d              100):   p50: 076.28 ns        p95: 080.88 ns          p99: 081.50 ns
PFRM_KEEP+STADD (c          1000000, d              200):   p50: 089.62 ns        p95: 091.49 ns          p99: 091.89 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 003.97 ns        p95: 005.23 ns          p99: 005.47 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 126.75 ns        p95: 128.96 ns          p99: 129.48 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 021.83 ns        p95: 023.75 ns          p99: 023.96 ns
PFRM_STRM+STADD (c          1000000, d              100):   p50: 074.48 ns        p95: 079.56 ns          p99: 080.73 ns
PFRM_STRM+STADD (c          1000000, d              200):   p50: 089.76 ns        p95: 091.14 ns          p99: 092.46 ns

Which I'm interpreting to say the following:

* LL/SC is pretty good for the common cases, but gets really bad under 
  the pathological cases.  It still seems always slower that LDADD.
* STADD has latency that blocks other STADDs, but not other CPU-local 
  work.  I'd bet there's a bunch of interactions with caches and memory 
  ordering here, but those would all juts make STADD look worse so I'm 
  just ignoring them.
* LDADD is better than STADD even under pathologically highly contended 
  cases.  I was actually kind of surprised about this one, I thought the 
  far atomics would be better there.
* The prefetches help STADD, but they don't seem to make it better that 
  LDADD in any case.
* The LDADD latency also happens concurrently with other CPU operations 
  like the STADD latency does.  It has less latency to hide, so the 
  latency starts to go up with less extra work, but it's never worse 
  that STADD.

So I think at least on this system, LDADD is just always better.

[My code's up in a PR to Breno's repo: 
https://github.com/leitao/debug/pull/2]

> proper patch tomorrow and see if Will NAKs it ;) (I've been in meetings
> all day). Something like below but with more comments and a commit log:
>
> ------------------------8<--------------------------
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index 9abcc8ef3087..d4dff4b0cf50 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -77,7 +77,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
>  	"	stxr" #sfx "\t%w[loop], %" #w "[tmp], %[ptr]\n"		\
>  	"	cbnz	%w[loop], 1b",					\
>  	/* LSE atomics */						\
> -		#op_lse "\t%" #w "[val], %[ptr]\n"			\
> +		#op_lse "\t%" #w "[val], %" #w "[tmp], %[ptr]\n"	\
>  		__nops(3))						\
>  	: [loop] "=&r" (loop), [tmp] "=&r" (tmp),			\
>  	  [ptr] "+Q"(*(u##sz *)ptr)					\
> @@ -124,9 +124,9 @@ PERCPU_RW_OPS(8)
>  PERCPU_RW_OPS(16)
>  PERCPU_RW_OPS(32)
>  PERCPU_RW_OPS(64)
> -PERCPU_OP(add, add, stadd)
> -PERCPU_OP(andnot, bic, stclr)
> -PERCPU_OP(or, orr, stset)
> +PERCPU_OP(add, add, ldadd)
> +PERCPU_OP(andnot, bic, ldclr)
> +PERCPU_OP(or, orr, ldset)
>  PERCPU_RET_OP(add, add, ldadd)
>
>  #undef PERCPU_RW_OPS

