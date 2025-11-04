Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40862CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 20:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnKSPwfKlx2DBN24Hp2EKNz/XfNX+CqIN59bbaUPLLY=; b=3yD0Ezw8hZgA3hOdshdWo8dELt
	LXpyaLImBdr02hTjLSOjdq/IC7pW8Fj4NAkYZDWNU3MH6SsO7SC9VoFtp7jlpBBydEDo+ggg5Ke1U
	5M+KISIdThkzb+EqnWRBQmf4vquB3866s9AXakwlX9InLl8lXJQtVl4lwzCSHM4KPA1Ge9qVn79F1
	lxgUmqUFAfSHgEOxyIN1dXhvoscdR5MN0jVN+HmB/xs+fXBf2JCtsyqyQUWpNwJvBeZENKtPlCMEX
	WI88ujcNau6AnQOj4VU1f3GmL+4aoNQQbk87a2cz2Z9ENdt9xalxED8pUqjPlIXibK3mSvXv2s6Ve
	yYzyv+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNPh-0000000CWxG-0v82;
	Tue, 04 Nov 2025 20:13:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNPf-0000000CWws-2zCQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 20:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1670C601EC;
	Tue,  4 Nov 2025 20:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF33C4CEF8;
	Tue,  4 Nov 2025 20:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762287234;
	bh=VMEQeic9VObiBjNMdoqXXb1yFVtID1qOrQpY9JjFxVc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=BrOZqOXKU+Dxtej19apNOJ5Qa92FhBf/ZDsttuouNSLJ9wKoH2t6vH0ciOr/uqnDK
	 JeTezFWBkyfUlqfaMc9sx47XGS03tk3aBcb5u9R7cAjIyAe0yVap86vovu7QRiWoSz
	 3VDcDeonncpwiQ1nM6Wyx2coUg7HTgX0skdnALX7BVJJ7x/eYNo6oUmcJxdgurYP5Z
	 9sSPp+ZIxa030Mw93HsnwTnV4uyFP9OJ66Gj5FVscYSLFVixIh9RxzPeLSHwEFZaU7
	 LvpwZcRPdtJ78apEKFaj/5Qc7w72LrKdMuQU93zVSJSziuackBTsIAY3vNsxYi/QVz
	 5qMuD7q8V0Bug==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9A980CE10DA; Tue,  4 Nov 2025 12:13:53 -0800 (PST)
Date: Tue, 4 Nov 2025 12:13:53 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Breno Leitao <leitao@debian.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com,
	rmikey@meta.com
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <9a58c50e-729e-4565-932d-641aee259758@paulmck-laptop>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
 <20251104180819.GB20579@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104180819.GB20579@1wt.eu>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 04, 2025 at 07:08:19PM +0100, Willy Tarreau wrote:
> Hello Breno,
> 
> On Tue, Nov 04, 2025 at 07:59:38AM -0800, Breno Leitao wrote:
> > I found that the LSE case (__percpu_add_case_64_lse) has a huge variation,
> > while LL/SC case is stable.
> > In some case, LSE function runs at the same latency as LL/SC function and
> > slightly faster on p50, but, something happen to the system and LSE operations
> > start to take way longer than LL/SC.
> > 
> > Here are some interesting output coming from the latency of the functions above>
> > 
> > 	CPU: 47 - Latency Percentiles:
> > 	====================
> > 	LL/SC:   p50: 5.69 ns      p95: 5.71 ns      p99: 5.80 ns
> > 	LSE  :   p50: 45.53 ns     p95: 54.06 ns     p99: 55.18 ns
> (...)

Thank you very much for the detailed testing on a variety of hardware
platforms!!!

> Very interesting. I've run them here on a 80-core Ampere Altra made
> of Neoverse-N1 (armv8.2) and am getting very consistently better timings
> with LSE than LL/SC:
> 
>    CPU: 0 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 7.32 ns     p95: 7.32 ns    p99: 7.33 ns
>   LSE  :   p50: 5.01 ns     p95: 5.01 ns    p99: 5.03 ns
>   
>    CPU: 1 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 7.32 ns     p95: 7.32 ns    p99: 7.33 ns
>   LSE  :   p50: 5.01 ns     p95: 5.01 ns    p99: 5.03 ns
>   
>    CPU: 2 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 7.32 ns     p95: 7.32 ns    p99: 7.33 ns
>   LSE  :   p50: 5.01 ns     p95: 5.01 ns    p99: 5.02 ns
>   (...)
> 
> They're *all* like this, between 7.32 and 7.36 for LL/SC p99,
> and 5.01 to 5.03 for LSE p99.
> 
> However, on a CIX-P1 (armv9.2, 8xA720 + 4xA520), it's what you've
> observed, i.e. a lot of variations that do not even depend on big
> vs little cores:
> 
>    CPU: 0 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 6.56 ns     p95: 7.13 ns    p99: 8.81 ns
>   LSE  :   p50: 45.79 ns    p95: 45.80 ns   p99: 45.86 ns
>   
>    CPU: 1 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 6.38 ns     p95: 6.39 ns    p99: 6.39 ns
>   LSE  :   p50: 67.72 ns    p95: 67.78 ns   p99: 67.80 ns
>   
>    CPU: 2 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 5.56 ns     p95: 5.57 ns    p99: 5.60 ns
>   LSE  :   p50: 59.19 ns    p95: 59.23 ns   p99: 59.25 ns
>   (...)
> 
> I tried the same on a RK3588 which has 4 Cortex A55 and 4 Cortex A76
> (the latter being very close to Neoverse-N1), and the A76 (the 4 latest
> ones) show the same pattern as the Altra above and are consistently much
> better than the LL/SC one:
> 
>    CPU: 0 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 9.39 ns     p95: 9.40 ns    p99: 9.41 ns
>   LSE  :   p50: 4.43 ns     p95: 28.60 ns   p99: 30.29 ns
>   
>    CPU: 1 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 9.39 ns     p95: 9.40 ns    p99: 9.59 ns
>   LSE  :   p50: 4.42 ns     p95: 27.51 ns   p99: 29.46 ns
>   
>    CPU: 2 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 9.40 ns     p95: 9.40 ns    p99: 9.40 ns
>   LSE  :   p50: 4.42 ns     p95: 27.00 ns   p99: 29.60 ns
>   
>    CPU: 3 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 9.39 ns     p95: 9.40 ns    p99: 10.43 ns
>   LSE  :   p50: 8.02 ns     p95: 29.72 ns   p99: 31.05 ns
>   
>    CPU: 4 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 8.85 ns     p95: 8.86 ns    p99: 8.86 ns
>   LSE  :   p50: 5.75 ns     p95: 5.75 ns    p99: 5.75 ns
>   
>    CPU: 5 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 8.85 ns     p95: 8.85 ns    p99: 9.28 ns
>   LSE  :   p50: 5.75 ns     p95: 5.75 ns    p99: 8.29 ns
>   
>    CPU: 6 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 8.79 ns     p95: 8.80 ns    p99: 8.80 ns
>   LSE  :   p50: 5.71 ns     p95: 5.71 ns    p99: 5.71 ns
>   
>    CPU: 7 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 8.80 ns     p95: 8.80 ns    p99: 9.30 ns
>   LSE  :   p50: 5.71 ns     p95: 5.72 ns    p99: 5.72 ns
> 
> Finally, on a Qualcomm QC6490 with 4xA55 + 4xA78, I'm getting something
> between the two (and the governor is in performance mode):
> 
>  ./percpu_bench 
> ARM64 Per-CPU Atomic Add Benchmark
> ===================================
> Running percentile measurements (100 iterations)...
> Detected 8 CPUs
> 
>    CPU: 0 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 8.23 ns     p95: 8.24 ns    p99: 8.28 ns
>   LSE  :   p50: 4.63 ns     p95: 4.64 ns    p99: 19.48 ns
>   
>    CPU: 1 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 8.23 ns     p95: 8.24 ns    p99: 8.26 ns
>   LSE  :   p50: 4.63 ns     p95: 4.64 ns    p99: 16.30 ns
>   
>    CPU: 2 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 8.23 ns     p95: 8.25 ns    p99: 8.25 ns
>   LSE  :   p50: 4.63 ns     p95: 4.64 ns    p99: 4.65 ns
>   
>    CPU: 3 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 8.23 ns     p95: 8.25 ns    p99: 8.36 ns
>   LSE  :   p50: 4.63 ns     p95: 19.01 ns   p99: 32.15 ns
>   
>    CPU: 4 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 6.27 ns     p95: 6.28 ns    p99: 6.29 ns
>   LSE  :   p50: 5.44 ns     p95: 5.44 ns    p99: 5.44 ns
>   
>    CPU: 5 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 6.27 ns     p95: 6.28 ns    p99: 6.29 ns
>   LSE  :   p50: 5.44 ns     p95: 5.44 ns    p99: 5.44 ns
>   
>    CPU: 6 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 6.27 ns     p95: 6.28 ns    p99: 6.28 ns
>   LSE  :   p50: 5.44 ns     p95: 5.44 ns    p99: 5.45 ns
>   
>    CPU: 7 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 5.56 ns     p95: 5.57 ns    p99: 5.58 ns
>   LSE  :   p50: 4.82 ns     p95: 4.82 ns    p99: 4.83 ns
> 
> So it seems at first glance that LL/SC is generally slower but can be
> more consistent on modern machines, that LSE is stable on older machines
> and can be stable sometimes even on some modern machines.

I guess that I am glad that I am not alone?  ;-)

I am guessing that there is no reasonable way to check for whether a
given system has slow LSE, as would be needed to use ALTERNATIVE(),
but please let me know if I am mistaken.

							Thanx, Paul

> @Catalin, I *tried* to do the ldadd test but I wasn't sure what to put in
> the Xt register (to be honest I've never understood Arm's docs regarding
> instructions, even the pseudo language is super cryptic to me), and I came
> up with this:
> 
>         asm volatile(
>                 /* LSE atomics */
>                 "    ldadd    %[val], %[out], %[ptr]\n"
>                 : [ptr] "+Q"(*(u64 *)ptr), [out] "+r" (val)
>                 : [val] "r"((u64)(val))
>                 : "memory");
> 
> which assembles like this:
> 
>  ab8:   f8200040        ldadd   x0, x0, [x2]
> 
> It now gives me much better LSE performance on the ARMv9:
> 
>    CPU: 0 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 6.56 ns     p95: 7.32 ns    p99: 8.72 ns
>   LSE  :   p50: 2.76 ns     p95: 2.76 ns    p99: 2.77 ns
>   
>    CPU: 1 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 6.38 ns     p95: 6.39 ns    p99: 6.39 ns
>   LSE  :   p50: 5.09 ns     p95: 5.11 ns    p99: 5.11 ns
>   
>    CPU: 2 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 5.56 ns     p95: 5.58 ns    p99: 9.07 ns
>   LSE  :   p50: 4.45 ns     p95: 4.46 ns    p99: 4.46 ns
>   
>    CPU: 3 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 5.56 ns     p95: 5.57 ns    p99: 7.42 ns
>   LSE  :   p50: 4.45 ns     p95: 4.46 ns    p99: 4.46 ns
>   
>    CPU: 4 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 5.56 ns     p95: 5.57 ns    p99: 5.60 ns
>   LSE  :   p50: 4.45 ns     p95: 4.46 ns    p99: 4.47 ns
>   
>    CPU: 5 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 7.40 ns     p95: 7.40 ns    p99: 7.40 ns
>   LSE  :   p50: 3.08 ns     p95: 3.08 ns    p99: 3.08 ns
>   
>    CPU: 6 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 7.40 ns     p95: 7.40 ns    p99: 7.42 ns
>   LSE  :   p50: 3.08 ns     p95: 3.08 ns    p99: 3.08 ns
>   
>    CPU: 7 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 7.40 ns     p95: 7.40 ns    p99: 7.40 ns
>   LSE  :   p50: 3.08 ns     p95: 3.08 ns    p99: 3.08 ns
>   
>    CPU: 8 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 7.40 ns     p95: 7.40 ns    p99: 7.40 ns
>   LSE  :   p50: 3.08 ns     p95: 3.08 ns    p99: 3.08 ns
>   
>    CPU: 9 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 7.05 ns     p95: 7.06 ns    p99: 7.07 ns
>   LSE  :   p50: 2.96 ns     p95: 2.97 ns    p99: 2.97 ns
>   
>    CPU: 10 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 7.05 ns     p95: 7.05 ns    p99: 7.06 ns
>   LSE  :   p50: 2.96 ns     p95: 2.96 ns    p99: 2.97 ns
>   
>    CPU: 11 - Latency Percentiles:
>   ====================
>   LL/SC:   p50: 6.56 ns     p95: 6.56 ns    p99: 6.57 ns
>   LSE  :   p50: 2.76 ns     p95: 2.76 ns    p99: 2.76 ns
> 
> (cores 0,5-11 are A720, cores 1-4 are A520). I'd just like a
> confirmation that my change is correct and that I'm not just doing
> something ignored that tries to add zero :-/
> 
> If that's OK, then it's indeed way better!
> 
> Willy
> 
> PS: thanks Breno for sharing your test code, that's super useful!

