Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D798C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpf1SLU7riSmJbq2urpeTgKNyFPJuomjOleDNsdPZos=; b=S2h9FRuMJraeci2FYaaVE+T8MQ
	etBcVkWssifh+IXFP80XRXZ76hoomQW8yqVYIXDZ7mv63du0XIVkw+0sV1Y4cErbv/OFU5K02z218
	MBJdyEyv5UdHglgajydNuncTmlU5RW47Hw4PIY2M7R8mh64zsoT12tAgoytse0pnV1t6cRJDEKmEb
	xv4wGLrNZGG7ssif/n3pH1RGWUtkdTLJoMI+3KSTag4QHKYEEl3rYFahOhc+UK+W4LlCki5fqaEPn
	eqxZnXjLrKcLEnHkBdMz6KPruDbBhkajFuRO6UWRG3OORf2aWhpRrnC/xz+0CoYMJQ3zaXYROHN4e
	jaBUWVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RaO-0000000DaPa-1xbB;
	Thu, 17 Apr 2025 15:55:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QzI-0000000DTHi-1A3m;
	Thu, 17 Apr 2025 15:17:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B5071515;
	Thu, 17 Apr 2025 08:17:07 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFCC93F59E;
	Thu, 17 Apr 2025 08:17:07 -0700 (PDT)
Message-ID: <2cb2d9af-460e-481d-81cc-b189948f4e8c@arm.com>
Date: Thu, 17 Apr 2025 16:17:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] perf/amlogic: Replace smp_processor_id() with
 raw_smp_processor_id() in meson_ddr_pmu_create()
To: Will Deacon <will@kernel.org>, Anand Moon <linux.amoon@gmail.com>
Cc: Jiucheng Xu <jiucheng.xu@amlogic.com>, Mark Rutland
 <mark.rutland@arm.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:AMLOGIC DDR PMU DRIVER" <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM PMU PROFILING AND DEBUGGING"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM PMU PROFILING AND DEBUGGING"
 <linux-perf-users@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250407063206.5211-1-linux.amoon@gmail.com>
 <20250417132033.GA12863@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250417132033.GA12863@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_081712_405891_3BFC8790 
X-CRM114-Status: GOOD (  17.47  )
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

On 17/04/2025 2:20 pm, Will Deacon wrote:
> On Mon, Apr 07, 2025 at 12:02:03PM +0530, Anand Moon wrote:
>> The Amlogic DDR PMU driver meson_ddr_pmu_create() function incorrectly uses
>> smp_processor_id(), which assumes disabled preemption. This leads to kernel
>> warnings during module loading because meson_ddr_pmu_create() can be called
>> in a preemptible context.
>>
>> Following kernel warning and stack trace:
>> [   31.745138] [   T2289] BUG: using smp_processor_id() in preemptible [00000000] code: (udev-worker)/2289
>> [   31.745154] [   T2289] caller is debug_smp_processor_id+0x28/0x38
>> [   31.745172] [   T2289] CPU: 4 UID: 0 PID: 2289 Comm: (udev-worker) Tainted: GW 6.14.0-0-MANJARO-ARM #1 59519addcbca6ba8de735e151fd7b9e97aac7ff0
>> [   31.745181] [   T2289] Tainted: [W]=WARN
>> [   31.745183] [   T2289] Hardware name: Hardkernel ODROID-N2Plus (DT)
>> [   31.745188] [   T2289] Call trace:
>> [   31.745191] [   T2289]  show_stack+0x28/0x40 (C)
>> [   31.745199] [   T2289]  dump_stack_lvl+0x4c/0x198
>> [   31.745205] [   T2289]  dump_stack+0x20/0x50
>> [   31.745209] [   T2289]  check_preemption_disabled+0xec/0xf0
>> [   31.745213] [   T2289]  debug_smp_processor_id+0x28/0x38
>> [   31.745216] [   T2289]  meson_ddr_pmu_create+0x200/0x560 [meson_ddr_pmu_g12 8095101c49676ad138d9961e3eddaee10acca7bd]
>> [   31.745237] [   T2289]  g12_ddr_pmu_probe+0x20/0x38 [meson_ddr_pmu_g12 8095101c49676ad138d9961e3eddaee10acca7bd]
>> [   31.745246] [   T2289]  platform_probe+0x98/0xe0
>> [   31.745254] [   T2289]  really_probe+0x144/0x3f8
>> [   31.745258] [   T2289]  __driver_probe_device+0xb8/0x180
>> [   31.745261] [   T2289]  driver_probe_device+0x54/0x268
>> [   31.745264] [   T2289]  __driver_attach+0x11c/0x288
>> [   31.745267] [   T2289]  bus_for_each_dev+0xfc/0x160
>> [   31.745274] [   T2289]  driver_attach+0x34/0x50
>> [   31.745277] [   T2289]  bus_add_driver+0x160/0x2b0
>> [   31.745281] [   T2289]  driver_register+0x78/0x120
>> [   31.745285] [   T2289]  __platform_driver_register+0x30/0x48
>> [   31.745288] [   T2289]  init_module+0x30/0xfe0 [meson_ddr_pmu_g12 8095101c49676ad138d9961e3eddaee10acca7bd]
>> [   31.745298] [   T2289]  do_one_initcall+0x11c/0x438
>> [   31.745303] [   T2289]  do_init_module+0x68/0x228
>> [   31.745311] [   T2289]  load_module+0x118c/0x13a8
>> [   31.745315] [   T2289]  __arm64_sys_finit_module+0x274/0x390
>> [   31.745320] [   T2289]  invoke_syscall+0x74/0x108
>> [   31.745326] [   T2289]  el0_svc_common+0x90/0xf8
>> [   31.745330] [   T2289]  do_el0_svc+0x2c/0x48
>> [   31.745333] [   T2289]  el0_svc+0x60/0x150
>> [   31.745337] [   T2289]  el0t_64_sync_handler+0x80/0x118
>> [   31.745341] [   T2289]  el0t_64_sync+0x1b8/0x1c0
>>
>> Changes replaces smp_processor_id() with raw_smp_processor_id() to
>> ensure safe CPU ID retrieval in preemptible contexts.
>>
>> Cc: Jiucheng Xu <jiucheng.xu@amlogic.com>
>> Fixes: 2016e2113d35 ("perf/amlogic: Add support for Amlogic meson G12 SoC DDR PMU driver")
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>> ---
>>   drivers/perf/amlogic/meson_ddr_pmu_core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/perf/amlogic/meson_ddr_pmu_core.c b/drivers/perf/amlogic/meson_ddr_pmu_core.c
>> index 07446d784a1a..c1e755c356a3 100644
>> --- a/drivers/perf/amlogic/meson_ddr_pmu_core.c
>> +++ b/drivers/perf/amlogic/meson_ddr_pmu_core.c
>> @@ -511,7 +511,7 @@ int meson_ddr_pmu_create(struct platform_device *pdev)
>>   
>>   	fmt_attr_fill(pmu->info.hw_info->fmt_attr);
>>   
>> -	pmu->cpu = smp_processor_id();
>> +	pmu->cpu = raw_smp_processor_id();
>>   
>>   	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, DDR_PERF_DEV_NAME);
>>   	if (!name)
> 
> 
> Bah, this follows what the other drivers are doing but I continue to
> dislike the races we have between CPU hotplug and perf PMU registration.
> 
> Robin -- did you have a crack at fixing that or did I dream it?

I've had "Perf core should do cpu hotplug!" written on the whiteboard 
behind my desk for about 5 years now, does that count? :)

However my initial plan was to at least factor out some of this common 
boilerplate within drivers/perf itself - I currently have one WIP patch 
from last year making a start on that, but I reckon I can find a way to 
make it crucial for the other PMU driver work I've already got scheduled 
this quarter (assuming I win the game of whack-a-mole against IOMMU race 
conditions soon enough...)

Cheers,
Robin.

