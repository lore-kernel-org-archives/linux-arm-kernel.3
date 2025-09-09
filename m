Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA3DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYE/ue6mADXQrf7ouwlsqqjbpynWqExFMHTfxRWVhAg=; b=UNskklNe0CEwHIBc9+kdofReVO
	a83wa9IcGcElrKuZAJ9M8kQTNdl/37vQF5e6zhwIA+Zxy3kmi8Vo+i2ZRfbmbrWg0e/5cPsd3jtH3
	5pIByOfsxuQB9XoeNva1HDFyd7jWyXDUhA48MJsd/l6n4dJKon8DcqL55zw9jipFwG7TNrbceGBVD
	QX567Qhrlc1e3D6KZ8wWx8edMo1oXkKAUNQSmSGgjj+yXePgx5kACe3aqUMwks76dzvLV8x6d/H/Z
	go4/7gIgdGLwVEzCyZAkuOgCBTx2jLjviOn8jAYZX+kioIXtKgIncJgawR8yBDWBFOuzfSUUvThG/
	dHuncygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw4rX-00000009zBy-0Isl;
	Tue, 09 Sep 2025 20:22:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw4rV-00000009zAN-2CRL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 20:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jYE/ue6mADXQrf7ouwlsqqjbpynWqExFMHTfxRWVhAg=; b=hCgeriApR2QldLRKnQYahtNYMt
	5zc3jZgsyGuVTc+7TR1ptJhNkFg6Ma7D8jwpWLPtLdeo7t1ZaHchUQQQeYxNB9VJe/Oz2xsC/NGks
	1KuYKkq6Q3vTgWlc5XcMUFY5vvzHXNlsZGq8MyD7IHDh0WtKUDOAJh5BpcjimAo2BswHmYZo5aCGh
	ewgaN/KRvqbDC90q2Z4KBEk9Qryu6XSRGXY0CPHZZXpKE+rAGlxFAQIZDpAEahPjH4UoexjIBphIU
	M/3RutB8G+yCUhe1Q3Tm/Q+xkbWsOARkEq77vlflt8mgA3PfCNdcm780eiw+YnDTbIHzRwifXm8XH
	uh7dN6kQ==;
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw4rL-00000005Y6L-0Uoc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 20:22:37 +0000
Date: Tue, 9 Sep 2025 22:22:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1757449345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jYE/ue6mADXQrf7ouwlsqqjbpynWqExFMHTfxRWVhAg=;
	b=IkyrOxuqH8EDnr5p1a+FjxAvbR039kgBV4FDoQo1wJcLHFjIx35XQOOMgc3T0zKys1K9D+
	ihpu6/AfUfJEPZpDZoseBrdlgmjNfWrPSkB0GhT/dGNXLfH7/EtLJijRrQIdl7UCi52Txb
	rQecZgCu1beEGaeMYBvVqep2it3D8oE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
Message-ID: <20250909202035.GA10879@localhost>
References: <20240730091322.5741-1-linux.amoon@gmail.com>
 <CGME20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659@eucas1p1.samsung.com>
 <20240730091322.5741-2-linux.amoon@gmail.com>
 <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
 <CANAwSgT_TOFwP80+H8-CdXDLLu+u2XZMr2dnxcsSDe8S5yeYCw@mail.gmail.com>
 <a41a6143-ef2e-4d86-b102-eaf442985173@kernel.org>
 <CANAwSgSbSgXwOQLrVrHD7jpDe0=Bq7r2K8p0JjvZJMPpVNq4XQ@mail.gmail.com>
 <d72d7927-079a-4a82-a298-db9ed70a816f@kernel.org>
 <CANAwSgSgK5hmcLg7sChAs7QL0x7wufHpWDZJFyw6tMiiOuDZeg@mail.gmail.com>
 <CANAwSgRTM4OSnXKZWWzxi2cW8QwWLKJz2xmUThyLkdkq71rH1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANAwSgRTM4OSnXKZWWzxi2cW8QwWLKJz2xmUThyLkdkq71rH1g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_212235_805249_68DBC531 
X-CRM114-Status: GOOD (  27.89  )
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

Hi Anand,

Thanks for working on this!

On Tue, Sep 09, 2025 at 07:29:31PM +0530, Anand Moon wrote:
[ ... ]
> > > >>>> On 30.07.2024 11:13, Anand Moon wrote:
> > > >>>>> As per the Exynos 5422 user manual add missing cache information to
> > > >>>>> the Exynos542x SoC.
> > > >>>>>
> > > >>>>> - Each Cortex-A7 core has 32 KB of instruction cache and
> > > >>>>>       32 KB of L1 data cache available.
> > > >>>>> - Each Cortex-A15 core has 32 KB of L1 instruction cache and
> > > >>>>>       32 KB of L1 data cache available.
> > > >>>>> - The little (A7) cluster has 512 KB of unified L2 cache available.
> > > >>>>> - The big (A15) cluster has 2 MB of unified L2 cache available.
> > > >>>>>
> > > >>>>> Features:
> > > >>>>> - Exynos 5422 support cache coherency interconnect (CCI) bus with
> > > >>>>>    L2 cache snooping capability. This hardware automatic L2 cache
> > > >>>>>    snooping removes the efforts of synchronizing the contents of the
> > > >>>>>    two L2 caches in core switching event.
> > > >>>>>
> > > >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > >>>>
> > > >>>>
> > > >>>> The provided values are not correct. Please refer to commit 5f41f9198f29
> > > >>>> ("ARM: 8864/1: Add workaround for I-Cache line size mismatch between CPU
> > > >>>> cores"), which adds workaround for different l1 icache line size between
> > > >>>> big and little CPUs. This workaround gets enabled on all Exynos542x/5800
> > > >>>> boards.
> > > >>>>
> > > >>> Ok, I have just referred to the Exynos 5422 user manual for this patch,
> > > >>> This patch is just updating the cache size for CPU for big.litle architecture..

I do not have access to the 5422 manual unfortunately, but if I add
some prints in the code from the commit Marek referenced:

```diff
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -173,6 +173,7 @@ void check_cpu_icache_size(int cpuid)
        asm("mrc p15, 0, %0, c0, c0, 1" : "=r" (ctr));
 
        size = 1 << ((ctr & 0xf) + 2);
+       pr_warn("CPU%u: icache line size: %u, size %u\n", cpuid, icache_size, size);
        if (cpuid != 0 && icache_size != size)
                pr_info("CPU%u: detected I-Cache line size mismatch, workaround enabled\n",
                        cpuid);
```

Then we get in dmesg:

CPU0: icache line size: 64, size 32
CPU1: icache line size: 32, size 32
CPU2: icache line size: 32, size 32
CPU3: icache line size: 32, size 32
CPU4: icache line size: 32, size 64
CPU5: icache line size: 32, size 64
CPU6: icache line size: 32, size 64
CPU7: icache line size: 32, size 64

I interpret this as that the i-cache-line-size property of CPU4, 5, 6
and 7 (i.e. cpu@0, cpu@1, cpu@2 and cpu@4) should be 64 instead of 32.

Not sure about the other properties..

> Here's an article that provides detailed insights into the cache feature.
> [0] http://jake.dothome.co.kr/cache4/
> 
> The values associated with L1 and L2 caches indicate their respective sizes,
> as specified in the ARM Technical Reference Manual (TRM) below.
> 
> Cortex-A15 L2 cache controller
> [0] https://developer.arm.com/documentation/ddi0503/i/programmers-model/programmable-peripherals-and-interfaces/cortex-a15-l2-cache-controller
> 
> Cortex-A7 L2 cache controller
> [1] https://developer.arm.com/documentation/ddi0503/i/programmers-model/programmable-peripherals-and-interfaces/cortex-a7-l2-cache-controller
> 
> These changes help define a fixed cache size, ensuring that active pages
> are mapped correctly within the expected cache boundaries.
> 
> Here is the small test case using perf
> Before
> 
> $ sudo perf stat -e L1-dcache-loads,L1-dcache-load-misses ./fact
> 
> Simulated Cache Miss Time (avg): 4766632 ns
> Factorial(10) = 3628800
> 
>  Performance counter stats for './fact':
> 
>             926328      armv7_cortex_a15/L1-dcache-loads/
>      <not counted>      armv7_cortex_a7/L1-dcache-loads/
>                          (0.00%)
>              16510      armv7_cortex_a15/L1-dcache-load-misses/ #
> 1.78% of all L1-dcache accesses
>      <not counted>      armv7_cortex_a7/L1-dcache-load-misses/
>                                (0.00%)
> 
>        0.008970031 seconds time elapsed
> 
>        0.000000000 seconds user
>        0.009673000 seconds sys
> 
> After
> $ sudo perf stat -e L1-dcache-loads,L1-dcache-load-misses ./fact
> Simulated Cache Miss Time (avg): 4623272 ns
> Factorial(10) = 3628800
> 
>  Performance counter stats for './fact':
> 
>             930570      armv7_cortex_a15/L1-dcache-loads/
>      <not counted>      armv7_cortex_a7/L1-dcache-loads/
>                          (0.00%)
>               4755      armv7_cortex_a15/L1-dcache-load-misses/ #
> 0.51% of all L1-dcache accesses
>      <not counted>      armv7_cortex_a7/L1-dcache-load-misses/
>                                (0.00%)
> 
>        0.011068250 seconds time elapsed
> 
>        0.000000000 seconds user
>        0.010793000 seconds sys

I tried out the same test on my odroid-xu4, but was not able to
reliably get the same improvement. Cache misses varied between around
0.8 % to around 2.8 %. This was with a desktop UI installed and
though, will try it out in a headless installation in the next few
days, and perhaps try it on exynos5800 as well.

Might be worth also testing on both small and big cores, like:

$ sudo taskset -c 0,1,2,3 perf stat -e L1-dcache-loads,L1-dcache-load-misses ./fact
$ sudo taskset -c 4,5,6,7 perf stat -e L1-dcache-loads,L1-dcache-load-misses ./fact

Best regards,
Henrik Grimler

