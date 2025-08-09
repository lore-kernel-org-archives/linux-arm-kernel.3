Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D70C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 09:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff4faoBXUHbibj3sYs/QfWtFdyukjLgj173Nc8z0rws=; b=w8R6oAIAJLMazg5filkCrxDshg
	g/qqYGbsi3tzChH66FRoWQimr7MbN3BkjnfENGU4PPYn5GT/2ctDVSCaCNrPlwh8gvjjL8S7UkFFr
	lZ8n447gQ1wF2I5A5P4guIzzM1W3Lz06hqf341I14lUZWnw+8cBiteXr66uKfyno7Y3bUWqe2K6GC
	eMF2JqsxkLuVZTouUBXeRWzmvbtzsiAlEjwYrw55QSgU8jEklEkAEf6XOS9a54qD7HtXCtwrVdstp
	cViAtw6amD2Bk7d+C+tgSCFTCHOYFSeDDtnhAz8xNXErhroegbNvgvumZfb1aOzLI3CH7p4ZTWBBz
	j4//8Uug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukgEj-00000004KQl-2JZ1;
	Sat, 09 Aug 2025 09:51:37 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukgCC-00000004KJq-26Fy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 09:49:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bzbfj4rQjztSwg;
	Sat,  9 Aug 2025 17:47:41 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 965BB1800B4;
	Sat,  9 Aug 2025 17:48:42 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 9 Aug 2025 17:48:42 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 9 Aug 2025 17:48:41 +0800
CC: <yangyicong@hisilicon.com>, <mark.rutland@arm.com>,
	<catalin.marinas@arm.com>, <maz@kernel.org>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<baohua@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>, <linuxarm@huawei.com>, <tiantao6@hisilicon.com>
Subject: Re: [RFT PATCH] arm64: atomics: prefetch the destination prior to LSE
 operations
To: Will Deacon <will@kernel.org>
References: <20250724120651.27983-1-yangyicong@huawei.com>
 <aJXhHVEIdafxcLP_@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <aabe55ce-b245-35a4-51f8-464cc83834f6@huawei.com>
Date: Sat, 9 Aug 2025 17:48:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aJXhHVEIdafxcLP_@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_024900_863832_94C70EAC 
X-CRM114-Status: GOOD (  28.19  )
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

On 2025/8/8 19:35, Will Deacon wrote:
> On Thu, Jul 24, 2025 at 08:06:51PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> commit 0ea366f5e1b6 ("arm64: atomics: prefetch the destination word for write prior to stxr")
>> adds prefetch prior to LL/SC operations due to performance concerns -
>> change the cacheline status from exclusive could be significant. This is
>> also true for LSE operations, so prefetch the destination prior to LSE
>> operations.
>>
>> Tested on my HIP08 server (2 * 64 CPU) using `perf bench -r 100 futex all`
>> which could stress the spinlock of the futex hash bucket:
>>                         6.16-rc7 patched
>> futex/hash(ops/sec)     171843   204757 +19.15%
>> futex/wake(ms)          0.4630   0.4216 +8.94%
>> futex/wake-parallel(ms) 0.0048   0.0039 +18.75%
>> futex/requeue(ms)       0.1487   0.1508 -1.41%
>> (2nd validation)                 0.1484 +0.2%
>> futex/lock-pi(ops/sec)  125      126    +0.8%
>>
>> For a single wake test for different threads number using `perf bench
>> -r 100 futex wake -t <threads>`:
>> threads 6.16-rc7 patched
>> 1       0.0035   0.0032 +8.57%
>> 48      0.1454   0.1221 +16.02%
>> 96      0.3047   0.2304 +24.38%
>> 160     0.5489   0.5012 +8.69%
>> 192     0.6675   0.5906 +11.52%
>> 256     0.9445   0.8092 +14.33%
>>
>> There're some variation for close numbers but overall results
>> look positive.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>
>> RFT for tests and feedbacks since not sure it's general or just the optimization
>> on some specific implementations.
>>
>>  arch/arm64/include/asm/atomic_lse.h | 7 +++++++
>>  arch/arm64/include/asm/cmpxchg.h    | 3 ++-
>>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> One of the motivations behind rmw instructions (as opposed to ldxr/stxr
> loops) is so that the atomic operation can be performed at different
> places in the memory hierarchy depending upon where the data resides.
> 
> For example, if a shared counter is sitting at a level of system cache,
> it may be optimal to leave it there so that CPUs around the system can
> post atomic increments to it without forcing the line up and down the
> cache hierarchy every time.

yes it's true. for a CHI based system the atomic can be implemented in
the cpu (RN-F) which is termed as near atomic and outside the cpu on the
system component (system cache, etc) which is termed as far atomic [1].
the above example should refer to the far atomic and the atomic operations
don't need to be finished in the cpu cache.

[1] https://developer.arm.com/documentation/102714/0100/Atomic-fundamentals

> 
> So, although adding an L1 prefetch may help some specific benchmarks on
> a specific system, I don't think this is generally a good idea for
> scalability. The hardware should be able to figure out the best place to
> do the operation and, if you have a system where that means it should
> always be performed within the CPU, then you should probably configure
> it not to send the atomic remotely rather than force that in the kernel
> for everybody.
> 

the prefetch may not be benefit for the far atomic since the atomic operation
is not doned in the cpu cache, but will help those system implemented as near
atomic since it can load the data into the cpu cache prior to the atomic
operations. So alternatively, instead of enabling this all the time is it
acceptable to make this a kconfig/cmdline option as an optimization for near
atomic systems then those users can benefit from this?

Thanks.



