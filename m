Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C044DEEC2BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJbVxrAh2sgRkfyUsRN4GAdelI26v+3FB02iGoi1c7s=; b=vt4ZZoyy0dWdjPfaHBXWIKgc34
	V1Snvo3rsb+79l6ni7hWawyQITIGXiO5R25STmb2PiR/yUVndGTEmKVG4Veb+JQLCAoZ2vQIX+StC
	wsiXxnqNo2E06L+/lQxnaTLbgcxlcdGmyOiPEtruPWYMGB1M47UZ6Miys1aZSwj+F+wJ1DROWFmTy
	Kn7qQ92RNUjZywRiL7N7hl0xV0+GQ45hLyWlxRpsR8GaccrlhVMFMjLee/tmjr1yjRfrduui8ABoM
	g4NZqIoiY6uGW6CTGfZ5ozTlD9dDfuLxV8wsrqLUkSsYF62PxvOset3pz1qE3J8hMB8/tLe9IWSqD
	xawO/Y9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhS9-00000001I4c-2UVy;
	Tue, 24 Feb 2026 01:43:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhS5-00000001I2g-3lvP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:43:07 +0000
Received: from canpmsgout02.his.huawei.com (unknown [172.19.92.185])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fKgTH4R5Kz1BG5m
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:42:43 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fKgM36y9yzcbMR;
	Tue, 24 Feb 2026 09:37:19 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 5DFE740567;
	Tue, 24 Feb 2026 09:42:18 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 09:42:17 +0800
Message-ID: <b4c98160-e6b4-44a5-9396-0acc8334a39c@hisilicon.com>
Date: Tue, 24 Feb 2026 09:42:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: topology: Fix false warning in
 counters_read_on_cpu() for same-CPU reads
To: Sumit Gupta <sumitg@nvidia.com>, Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <zhenglifeng1@huawei.com>,
	<viresh.kumar@linaro.org>, <rafael@kernel.org>, <beata.michalska@arm.com>,
	<pierre.gondois@arm.com>, <ionela.voinescu@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<treding@nvidia.com>, <jonathanh@nvidia.com>, <bbasu@nvidia.com>
References: <20260127080700.3565546-1-sumitg@nvidia.com>
 <3c6d58b2-b4c9-4dc7-a705-b7626e127f33@hisilicon.com>
 <aXoJUYDrhuJgkXEr@willie-the-truck> <aZyciAy8zCvrvGB7@willie-the-truck>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <aZyciAy8zCvrvGB7@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_174306_240983_4086E5DD 
X-CRM114-Status: GOOD (  18.50  )
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



On 2/24/2026 2:29 AM, Will Deacon wrote:
> On Wed, Jan 28, 2026 at 01:04:17PM +0000, Will Deacon wrote:
>> On Wed, Jan 28, 2026 at 06:50:42PM +0800, Jie Zhan wrote:
>>> On 1/27/2026 4:07 PM, Sumit Gupta wrote:
>>>> The counters_read_on_cpu() function warns when called with IRQs disabled
>>>> to prevent deadlock in smp_call_function_single(). However, this warning
>>>> is spurious when reading counters on the current CPU since no IPI is
>>>> needed for same-CPU reads.
>>>>
>>>> Commit 12eb8f4fff24 ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks
>>>> for non-PCC regs") changed the CPPC Frequency Invariance Engine to read
>>>> AMU counters directly from the scheduler tick for non-PCC register
>>>> spaces (like FFH), instead of deferring to a kthread. This means
>>>> counters_read_on_cpu() is now called with IRQs disabled from the tick
>>>> handler, triggering the warning:
>>>>
>>>> | WARNING: arch/arm64/kernel/topology.c:410 at counters_read_on_cpu
>>>> | ...
>>>> | Call trace:
>>>> |  counters_read_on_cpu+0x88/0xa8 (P)
>>>> |  cpc_read_ffh+0xdc/0x148
>>>> |  cpc_read+0x260/0x518
>>>> |  cppc_get_perf_ctrs+0xf0/0x398
>>>> |  __cppc_scale_freq_tick+0x4c/0x148 [cppc_cpufreq]
>>>> |  cppc_scale_freq_tick+0x44/0x88 [cppc_cpufreq]
>>>> |  topology_scale_freq_tick+0x34/0x58
>>>> |  sched_tick+0x58/0x300
>>>> |  update_process_times+0xcc/0x120
>>>> |  tick_nohz_handler+0xa8/0x260
>>>> |  __hrtimer_run_queues+0x154/0x360
>>>> |  hrtimer_interrupt+0xf4/0x2b0
>>>> |  arch_timer_handler_phys+0x4c/0x78
>>>> |  ....
>>>> |  CPPC Cpufreq:__cppc_scale_freq_tick: failed to read perf counters
>>>> |  ....
>>>>
>>>> Fix this by calling the counter read function directly for same-CPU
>>>> case, bypassing smp_call_function_single() entirely. Use get_cpu() to
>>>> disable preemption as the counter read functions call this_cpu_has_cap()
>>>> which requires a non-preemptible context.
>>>>
>>>> Fixes: 12eb8f4fff24 ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs")
>>>> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
>>>
>>> Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>
>>>
>>> Looks fine for me except for the minor comment wrapping.
>>>
>>> Thanks for spotting this.
>>> I may have missed the warning log in the FFH test.
>>>
>>> This happens during the short window in cpufreq_policy_online() between
>>> driver->init() and the CREATE_POLICY notifier that gets AMU FIE ready.
>>> After that, CPPC FIE will be stopped.
>>>
>>> Ideally this can be merged together with Viresh's PR since the CPPC FIE
>>> changes are there.
>>> https://lore.kernel.org/all/j4qdid7iqmng4gzb5ozefemjkep3wx2b5z2yki5tnqc3vzvzf4@kvrnarvdod5p/
>>
>> Right, looks like this should go via Rafael but if it doesn't make the merge
>> window then I can pick it up at -rc1 (please remind me :)
> 
> Looks like this fix is still needed. Please can you post a new version,
> based on -rc1, so that I can pick it up?
> 
> You'll also need to fix the SHA in the commit message and the Fixes: tag,
> as 12eb8f4fff24 doesn't match the upstream change.
> 
> Will
> 
I believe this goes to Sumit because he's the author.

Sumit, can you update this patch?

Jie

