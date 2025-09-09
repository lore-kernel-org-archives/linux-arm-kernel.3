Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CBECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vl21Ac/hRl5KaWEXAXbzKsLXJ9UhwUEd+pnm8CY14SY=; b=hiCk3K/p/kO2Gb9B8f3s5OiK0m
	LyYWLwuQPZFFB7LgmN2F3eYKxZwWFMjKf/Jx0kHuDPMJ2iaZAD4Venr5vn8bycHoN64MY0E+xeR0Y
	9D6b1oA0mR7IDoC24DC1dsQTFRcM9Hzd6pm15y5BeKr9tCcrRzxwlu669LPaBzdXZK0JqGiS/yONx
	mEFP41wH/DzYjKSyVa41mw4Dtormg5UuCi+OXX2U54ucAa+PZ9MVQm9ReyYadDF3m0m+u6I1ocnZq
	8e2lliDxEMfKptTzWs6ynxGimz6oY0tiSsPZwjdywZBC2w2t4LYYnB31cIXzYnL+Ghk+H7LLQr1XJ
	q3tfaqyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20y-00000008vyy-2tDf;
	Tue, 09 Sep 2025 17:20:20 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvysx-00000007ZhP-0TAz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:59:52 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-62bec18abe6so1643648a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757426389; x=1758031189; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vl21Ac/hRl5KaWEXAXbzKsLXJ9UhwUEd+pnm8CY14SY=;
        b=iql97IPqx87ds3+f05l3/cDuIvEiuBuclW7La87WBRNCYO9hT3Go+2/D9eBGW3ZC/1
         o76bWEctZbyBlgtPdTaETEmIHYGQ/ulhs3JgtFy+gTk3SsFM9qT+L+GwhKjXmH8+4jkl
         Hyhpc3KFxhg1/7TESjmyajzplgSTIw/vNENnYcxYh9NWkgMw5GdoXffwAygOLO9Mqma6
         od6pYFx5ZRJfaXaCinnbr9X3gYYVBeEusqHKps5QIOIMbVyqPBT+1kCltugoLbdLa/yr
         AXM8XFHROdTLiJ0HhEjWNtoMMGqREPnjLIRoobgtmUFyPI7qtxfBfBaAwc+qOxyobskW
         1nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426389; x=1758031189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vl21Ac/hRl5KaWEXAXbzKsLXJ9UhwUEd+pnm8CY14SY=;
        b=DE+bPFEepHGPyzgLmjAnttg2FXIBDRbV+MVwpGe2YL5YpnRmnWJoLzjCoSy8v9fZw+
         o2H66SVL65tav6/5TVfBPO7rVhZHWtCg3S6NTPnnHD4rEVwCtRRMU+SQZskY39Bgt2wC
         sIVDt/LOAqHfzqznxvv5oO82juOZjUDRAoVDWOVcaS5bBV5CleQNvWQIS3EC+rPRcuxO
         4tASdAlpu2A4Z37mMj8291icyiYwL8pnwiBAg0NnpLEG5EV+TkyfkqhrAhjvV6urq11o
         sqtM0BwN3Rf+DV79CpdBfo3nB13EfsW9slw1RJ0DQzy6nq+35ZP7AStZQXTH+ZUZ7jTO
         9OJg==
X-Forwarded-Encrypted: i=1; AJvYcCU/Y98SEwfT+8llnzHo9PTdgKUBQqS7OxQMr+PuCusaMfI+U4b01T2FDJ8LomVAsbjL/Yqm8SmEZlb21As0KDpa@lists.infradead.org
X-Gm-Message-State: AOJu0YzfPTY3eFxypBiaMDOjQf73b0gXXibS1AJ73Cbk2ov/WL0frTsc
	lI4xju8vcgU32I+ArVV7J/B14xXZ7/lTAmkZ2WSOyybHPMOZ7kOr9h1RZaxyciUXRE9dqqEzU8f
	gFRD7qkAz/MjOq/ZRAFt1tWJGEKdSkqQ=
X-Gm-Gg: ASbGncv6+yxv92uKDP1TtjRQ4IllT0pAWXZwV0kOGTuS3p0GB+MsnPLYxIEcTFFpQ3J
	DDSwb+uHCdFozVz2nphE2OaE9pwFW7AAIAKoVbOQDuq7L83pe/QX7bX1hqROjO0bsCwhHEhgyS2
	BK8eEgdEGT5LIoniDeQ1k3lu58mt2RRjawsqPRrC73r/33ecDVLbcuFVbGa5l1F2mbW3hz5WfHX
	l07NBBt0aiyVtDU
X-Google-Smtp-Source: AGHT+IHdzYdKi432+CbqXD4bpTGkg+RAdUX/BeDAoijH6nRbojp/RI1EEY0yOSR4vLDMODWDNeuQsigNZI6gn2G14Hw=
X-Received: by 2002:a05:6402:42cc:b0:61c:d457:e542 with SMTP id
 4fb4d7f45d1cf-623775e56cemr11270735a12.17.1757426388676; Tue, 09 Sep 2025
 06:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240730091322.5741-1-linux.amoon@gmail.com> <CGME20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659@eucas1p1.samsung.com>
 <20240730091322.5741-2-linux.amoon@gmail.com> <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
 <CANAwSgT_TOFwP80+H8-CdXDLLu+u2XZMr2dnxcsSDe8S5yeYCw@mail.gmail.com>
 <a41a6143-ef2e-4d86-b102-eaf442985173@kernel.org> <CANAwSgSbSgXwOQLrVrHD7jpDe0=Bq7r2K8p0JjvZJMPpVNq4XQ@mail.gmail.com>
 <d72d7927-079a-4a82-a298-db9ed70a816f@kernel.org> <CANAwSgSgK5hmcLg7sChAs7QL0x7wufHpWDZJFyw6tMiiOuDZeg@mail.gmail.com>
In-Reply-To: <CANAwSgSgK5hmcLg7sChAs7QL0x7wufHpWDZJFyw6tMiiOuDZeg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 9 Sep 2025 19:29:31 +0530
X-Gm-Features: Ac12FXy25GJOdSBU_JfQSnoFhbd7dDaA744zBKRa5JcRhilE7Rzjj8NE0zapeR0
Message-ID: <CANAwSgRTM4OSnXKZWWzxi2cW8QwWLKJz2xmUThyLkdkq71rH1g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_065951_184544_D110DC9C 
X-CRM114-Status: GOOD (  32.55  )
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

Hi Krzysztof, Marek,

On Tue, 30 Jul 2024 at 20:32, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Krzysztof,
>
> On Tue, 30 Jul 2024 at 18:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 30/07/2024 15:20, Anand Moon wrote:
> > > Hi Krzysztof,
> > >
> > > On Tue, 30 Jul 2024 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>
> > >> On 30/07/2024 14:06, Anand Moon wrote:
> > >>> Hi Marek,
> > >>>
> > >>> On Tue, 30 Jul 2024 at 17:14, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >>>>
> > >>>>
> > >>>> On 30.07.2024 11:13, Anand Moon wrote:
> > >>>>> As per the Exynos 5422 user manual add missing cache information to
> > >>>>> the Exynos542x SoC.
> > >>>>>
> > >>>>> - Each Cortex-A7 core has 32 KB of instruction cache and
> > >>>>>       32 KB of L1 data cache available.
> > >>>>> - Each Cortex-A15 core has 32 KB of L1 instruction cache and
> > >>>>>       32 KB of L1 data cache available.
> > >>>>> - The little (A7) cluster has 512 KB of unified L2 cache available.
> > >>>>> - The big (A15) cluster has 2 MB of unified L2 cache available.
> > >>>>>
> > >>>>> Features:
> > >>>>> - Exynos 5422 support cache coherency interconnect (CCI) bus with
> > >>>>>    L2 cache snooping capability. This hardware automatic L2 cache
> > >>>>>    snooping removes the efforts of synchronizing the contents of the
> > >>>>>    two L2 caches in core switching event.
> > >>>>>
> > >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > >>>>
> > >>>>
> > >>>> The provided values are not correct. Please refer to commit 5f41f9198f29
> > >>>> ("ARM: 8864/1: Add workaround for I-Cache line size mismatch between CPU
> > >>>> cores"), which adds workaround for different l1 icache line size between
> > >>>> big and little CPUs. This workaround gets enabled on all Exynos542x/5800
> > >>>> boards.
> > >>>>
> > >>> Ok, I have just referred to the Exynos 5422 user manual for this patch,
> > >>> This patch is just updating the cache size for CPU for big.litle architecture..
> > >>>
> > >>
> > >> Let me get it right. Marek's comment was that you used wrong values.
> > >> Marek also provided rationale for this. Now your reply is that you
> > >> update cache size? Sorry, I fail how you address Marek's comment.
> > >>
> > >> Do not repeat what the patch is doing. We all can see it. Instead
> > >> respond to the comment with some sort of arguments.
> > >>
> > >
> > > Ok, If I am not wrong  icache_size is hard-coded in the above commit.
> > >
> > > +#ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
> > > +.globl icache_size
> > > +       .data
> > > +       .align  2
> > > +icache_size:
> > > +       .long   64
> > > +       .text
> > > +#endif
> > >
> > > In the check_cpu_icache_size function, we read the control reg
> > > and recalculate the icache_size.
> > > if there mismatch we re-apply the Icache_size,
> > >
> > > So dts passed values do not apply over here,
> >
> > So you provide incorrect values in terms of them being ignored? Then do
> > not provide at all.
> >
> I will drop the icache and dcache values and just pass the L2_a7 and
> L2_a15, value
> Is this ok for you?
>
> Earlier, I have tried to verify this information in /sys and /proc
> to verify the changes as ARM does not populate this information.
>
Here's an article that provides detailed insights into the cache feature.
[0] http://jake.dothome.co.kr/cache4/

The values associated with L1 and L2 caches indicate their respective sizes,
as specified in the ARM Technical Reference Manual (TRM) below.

Cortex-A15 L2 cache controller
[0] https://developer.arm.com/documentation/ddi0503/i/programmers-model/programmable-peripherals-and-interfaces/cortex-a15-l2-cache-controller

Cortex-A7 L2 cache controller
[1] https://developer.arm.com/documentation/ddi0503/i/programmers-model/programmable-peripherals-and-interfaces/cortex-a7-l2-cache-controller

These changes help define a fixed cache size, ensuring that active pages
are mapped correctly within the expected cache boundaries.

Here is the small test case using perf
Before

$ sudo perf stat -e L1-dcache-loads,L1-dcache-load-misses ./fact

Simulated Cache Miss Time (avg): 4766632 ns
Factorial(10) = 3628800

 Performance counter stats for './fact':

            926328      armv7_cortex_a15/L1-dcache-loads/
     <not counted>      armv7_cortex_a7/L1-dcache-loads/
                         (0.00%)
             16510      armv7_cortex_a15/L1-dcache-load-misses/ #
1.78% of all L1-dcache accesses
     <not counted>      armv7_cortex_a7/L1-dcache-load-misses/
                               (0.00%)

       0.008970031 seconds time elapsed

       0.000000000 seconds user
       0.009673000 seconds sys

After
$ sudo perf stat -e L1-dcache-loads,L1-dcache-load-misses ./fact
Simulated Cache Miss Time (avg): 4623272 ns
Factorial(10) = 3628800

 Performance counter stats for './fact':

            930570      armv7_cortex_a15/L1-dcache-loads/
     <not counted>      armv7_cortex_a7/L1-dcache-loads/
                         (0.00%)
              4755      armv7_cortex_a15/L1-dcache-load-misses/ #
0.51% of all L1-dcache accesses
     <not counted>      armv7_cortex_a7/L1-dcache-load-misses/
                               (0.00%)

       0.011068250 seconds time elapsed

       0.000000000 seconds user
       0.010793000 seconds sys

Thanks
-Anand

