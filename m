Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5231ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoZ08vdQUrLRtXTU33fu/ui7zJgKLRAjEy4AIqVEq5Y=; b=pYyAJoxlsP57CWO0tZqnF4h+fm
	zGVdvI9QDbcSt7pNqvnshv/qRRjIxZ23mamhAzGNDEXKu5M8kWV5D5zhZbNRfxnXSv9nPjL1Fd1Ng
	z59BYo1TdxG7TRGcH2UuylI16ZBnDKjlljYcckblDi6cHeHxo7UVFHcd2xOhdcZrsOlVxeuRf87qd
	kgPHcF9j6GA9bEQzb9L7K1yxiybWZGeNu3W9gFs5An1WrxDxR9X7QgWsOyaYHg3nmGL2i8ox0/X2d
	0N1iyTBZrjrD2nxe98F69t4FLiJsRJCnYHOnG1xmj2DQZH4d8YBMSMDrKC/9ct4lThqePegj3Cp5e
	vNLLiy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgGS-0000000E3cR-1wkD;
	Wed, 05 Nov 2025 16:21:40 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgGP-0000000E3bP-28xN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:21:39 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b71397df721so586063366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 08:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762359695; x=1762964495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoZ08vdQUrLRtXTU33fu/ui7zJgKLRAjEy4AIqVEq5Y=;
        b=ZCOMoCnrgZq7mW688z7/Q5+cvdfGo9mKlErwWIcL1VbuuUosA/5ZiO0X7ytNkUu3z4
         +SI5pxLnAKge6iuGwla9/1P3x6bTUli7ldyXn7cQHHk2Cmqv3T31Jt/7j+WoZ192lOkd
         tqSOcLg0pvLG/pwW7S/XRufX2CwqOPVJKPGsODgiofYgUYfAH0g9kw+wAINHoLyEhOC+
         5d6HTacsYMAIqcj6eS+YI+XVKAdYV0okfT7QoQ0U8/iR8/VpXssvelqLME9bNYdjwOfw
         G7jEYo6MDbPAZ9nZoLBsRTPqaXo8FmDhE1R+F7fFw3cyVcAwMW60LXmg3KZu3MFzepe4
         +VFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV278x054CPEjpwLDNQmfYGvkVvc2ZRbMioEglM/81jtq8ywb7/zPMXuLOyVbk4rBgnlkb13Q0P6e41MVW2jh4H@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4ZcXmDFK+/FurC1prd95N+Nj/t/4MvSoL+fLD/RI6+jI8/R5a
	gWy1TiFlJSdETQzqDhO0amed8rg3c0ScLc799OJ+DsQYH72V4qf09jG+
X-Gm-Gg: ASbGncsOyrXzHGKqHCuqAVSWiEpE2X+diSEFfC6uyflopsODNGRY1aZ7cAtLAUZBq7N
	9/7ndh3rRJQLwGXnCn85vo93avkUbOGtWZjDr6Sd4KJ5HwVCQqCmQBsZLlQpEkCZtpU0jkE8EhF
	/gOIQpnUfVEz7bw3yo9mEiPfSY4uTpw9zuPwV+lFOMOQhNi5kXNE60l6WOvZnTbrp6IG1tY2vtz
	1dg9pEVf0ZoXGyaVPfVswFQ0tp/lbMa7rrUhmV6gRqpe4OP5QOo1VSAv2qjYmv6kQOkVu+U0HMB
	qrwp1Gu85oEi31cYS0OAE91WJc1cDDUmj5x4TvA1wdl/K23kJDI/YgKTmgjSJlkJMI8Di2edIoj
	W6VUiUm866E/nA8QAVoSO52lQvvu/4UaKxQP5aZlH2raUSPKUpztNd4Cx5ADKA6E+Xjo=
X-Google-Smtp-Source: AGHT+IEGbgN5GNScNBqS1thM0JjcYS3duc9T+Lj4wIHvy2InFaqrwvJaDiW9gTN9r+YDmPObJiVRBw==
X-Received: by 2002:a17:907:1c0a:b0:b3f:f66b:268a with SMTP id a640c23a62f3a-b726529ee53mr356309466b.19.1762359694973;
        Wed, 05 Nov 2025 08:21:34 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d916e26sm536171766b.26.2025.11.05.08.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:21:34 -0800 (PST)
Date: Wed, 5 Nov 2025 08:21:32 -0800
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Willy Tarreau <w@1wt.eu>, Yicong Yang <yangyccccc@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, kernel-team@meta.com, 
	rmikey@meta.com, palmer@dabbelt.com
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <c7hra5r77vxixwnjygqerxc6yfmix563xtzurlqwff7nk4ozyy@cazcsyvaxici>
References: <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQXtqoUEtDr-xUeS@arm.com>
 <3868c862-cf16-4259-829e-e9004028b3c1@gmail.com>
 <aQtQRSoL8GGVNrUQ@arm.com>
 <20251105134231.GF22848@1wt.eu>
 <aQtkA0cOb6Fm9Mrc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQtkA0cOb6Fm9Mrc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_082137_575799_2DE8B38D 
X-CRM114-Status: GOOD (  28.80  )
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

On Wed, Nov 05, 2025 at 02:49:39PM +0000, Catalin Marinas wrote:
> On Wed, Nov 05, 2025 at 02:42:31PM +0100, Willy Tarreau wrote:
> > On Wed, Nov 05, 2025 at 01:25:25PM +0000, Catalin Marinas wrote:
> > > > But need to add the prefetch in per-cpu implementation as you've
> > > > noticed above (didn't add it since no prefetch for LL/SC
> > > > implementation there, maybe a missing?)
> > > 
> > > Maybe no-one stressed these to notice any difference between LL/SC and
> > > LSE.
> > 
> > Huh ? I can say for certain that LL/SC is a no-go beyond 16 cores, for
> > having faced catastrophic performance there on haproxy, while with LSE
> > it continues to scale almost linearly at least till 64.
> 
> I was referring only to the this_cpu_add() etc. functions (until Paul
> started using them). There definitely have been lots of benchmarks on
> the scalability of LL/SC. That's one of the reasons Arm added the LSE
> atomics years ago.
> 
> > But that does
> > not mean that if some possibilities are within reach to recover 90% of
> > the atomic overhead in uncontended case we shouldn't try to grab it at
> > a reasonable cost!
> 
> I agree. Even for these cases, I don't think the solution is LL/SC but
> rather better use of LSE (and better understanding of the hardware
> behaviour; feedback here should go both ways).
> 
> > I'm definitely adding in my todo list to experiment more on this on
> > various CPUs now ;-)
> 
> Thanks for the tests so far, very insightful. I think what's still
> good to assess is how PRFM+STADD compares to LDADD (without PRFM) in
> Breno's microbenchmarks. I suspect LDADD is still better.

I've hacked my microbenchmark to add these tests Catalin suggested, and it seems prfm improve the latency variation.

This is what I am measuring now:

	/* LL/SC implementation */
	void __percpu_add_case_64_llsc(void *ptr, unsigned long val)
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

	/* LSE implementation using stadd */
	void __percpu_add_case_64_lse(void *ptr, unsigned long val)
	{
	asm volatile(
		/* LSE atomics */
		"    stadd    %[val], %[ptr]\n"
		: [ptr] "+Q"(*(u64 *)ptr)
		: [val] "r"((u64)(val))
		: "memory");
	}

	/* LSE implementation using ldadd */
	void __percpu_add_case_64_ldadd(void *ptr, unsigned long val)
	{
	asm volatile(
		/* LSE atomics */
		"    ldadd    %[val], %[tmp], %[ptr]\n"
		: [tmp] "=&r"(tmp), [ptr] "+Q"(*(u64 *)ptr)
		: [val] "r"((u64)(val))
		: "memory");
	}

	/* LSE implementation using PRFM + stadd */
	void __percpu_add_case_64_prfm_stadd(void *ptr, unsigned long val)
	{
	asm volatile(
		/* Prefetch + LSE atomics */
		"    prfm    pstl1keep, %[ptr]\n"
		"    stadd   %[val], %[ptr]\n"
		: [ptr] "+Q"(*(u64 *)ptr)
		: [val] "r"((u64)(val))
		: "memory");
	}

	/* LSE implementation using PRFM STRM + stadd */
	void __percpu_add_case_64_prfm_strm_stadd(void *ptr, unsigned long val)
	{
	asm volatile(
		/* Prefetch streaming + LSE atomics */
		"    prfm    pstl1strm, %[ptr]\n"
		"    stadd   %[val], %[ptr]\n"
		: [ptr] "+Q"(*(u64 *)ptr)
		: [val] "r"((u64)(val))
		: "memory");
	}

And prfm definitely added some stabilityu to STDADD, but, in most cases, it is
still a bit behind the regular ldxr/stxr.

	CPU: 0 - Latency Percentiles:
	====================
	LL/SC           :   p50: 5.73 ns      p95: 5.90 ns      p99: 7.35 ns
	STADD           :   p50: 65.99 ns     p95: 68.98 ns     p99: 70.13 ns
	LDADD           :   p50: 4.33 ns      p95: 4.34 ns      p99: 4.34 ns
	PRFM_KEEP+STADD :   p50: 7.89 ns      p95: 7.91 ns      p99: 8.82 ns
	PRFM_STRM+STADD :   p50: 7.89 ns      p95: 8.11 ns      p99: 9.76 ns

	CPU: 1 - Latency Percentiles:
	====================
	LL/SC           :   p50: 7.72 ns      p95: 18.00 ns      p99: 31.51 ns
	STADD           :   p50: 103.81 ns    p95: 127.60 ns     p99: 137.12 ns
	LDADD           :   p50: 4.35 ns      p95: 22.46 ns      p99: 25.03 ns
	PRFM_KEEP+STADD :   p50: 7.89 ns      p95: 22.04 ns      p99: 23.66 ns
	PRFM_STRM+STADD :   p50: 7.89 ns      p95: 8.75 ns       p99: 11.10 ns

	CPU: 2 - Latency Percentiles:
	====================
	LL/SC           :   p50: 5.73 ns      p95: 6.87 ns      p99: 23.96 ns
	STADD           :   p50: 63.30 ns      p95: 63.33 ns    p99: 63.36 ns
	LDADD           :   p50: 4.34 ns      p95: 4.35 ns      p99: 4.35 ns
	PRFM_KEEP+STADD :   p50: 7.89 ns      p95: 7.90 ns      p99: 7.91 ns
	PRFM_STRM+STADD :   p50: 7.89 ns      p95: 7.90 ns      p99: 7.90 ns

	CPU: 3 - Latency Percentiles:
	====================
	LL/SC           :   p50: 5.70 ns      p95: 5.71 ns      p99: 5.72 ns
	STADD           :   p50: 61.94 ns     p95: 62.95 ns     p99: 65.05 ns
	LDADD           :   p50: 4.32 ns      p95: 4.33 ns      p99: 7.28 ns
	PRFM_KEEP+STADD :   p50: 7.86 ns      p95: 7.87 ns      p99: 8.08 ns
	PRFM_STRM+STADD :   p50: 7.86 ns      p95: 7.87 ns      p99: 8.25 ns

	CPU: 4 - Latency Percentiles:
	====================
	LL/SC           :   p50: 5.72 ns      p95: 5.73 ns      p99: 5.74 ns
	STADD           :   p50: 62.04 ns     p95: 122.78 ns    p99: 131.43 ns
	LDADD           :   p50: 8.08 ns      p95: 11.70 ns     p99: 14.89 ns
	PRFM_KEEP+STADD :   p50: 13.83 ns     p95: 20.70 ns     p99: 22.54 ns
	PRFM_STRM+STADD :   p50: 12.80 ns     p95: 19.42 ns     p99: 20.36 ns

	CPU: 5 - Latency Percentiles:
	====================
	LL/SC           :   p50: 5.68 ns      p95: 5.70 ns      p99: 5.70 ns
	STADD           :   p50: 59.30 ns     p95: 60.52 ns     p99: 66.53 ns
	LDADD           :   p50: 4.30 ns      p95: 4.31 ns      p99: 4.32 ns
	PRFM_KEEP+STADD :   p50: 7.84 ns      p95: 7.85 ns      p99: 7.85 ns
	PRFM_STRM+STADD :   p50: 7.84 ns      p95: 7.85 ns      p99: 7.85 ns

	CPU: 6 - Latency Percentiles:
	====================
	LL/SC           :   p50: 5.70 ns      p95: 5.71 ns      p99: 5.72 ns
	STADD           :   p50: 59.37 ns     p95: 59.41 ns     p99: 59.42 ns
	LDADD           :   p50: 4.32 ns      p95: 4.32 ns      p99: 4.34 ns
	PRFM_KEEP+STADD :   p50: 7.85 ns      p95: 7.86 ns      p99: 7.88 ns
	PRFM_STRM+STADD :   p50: 7.85 ns      p95: 7.86 ns      p99: 7.86 ns

	CPU: 7 - Latency Percentiles:
	====================
	LL/SC           :   p50: 5.72 ns      p95: 5.74 ns      p99: 6.90 ns
	STADD           :   p50: 64.46 ns     p95: 74.34 ns     p99: 77.47 ns
	LDADD           :   p50: 4.35 ns      p95: 7.50 ns      p99: 10.06 ns
	PRFM_KEEP+STADD :   p50: 8.92 ns      p95: 14.34 ns     p99: 17.31 ns
	PRFM_STRM+STADD :   p50: 8.88 ns      p95: 13.74 ns     p99: 15.11 ns

As always, the code could be found at
https://github.com/leitao/debug/tree/main/LSE



