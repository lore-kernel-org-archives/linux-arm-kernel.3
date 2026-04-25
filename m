Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94792FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 02:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAuCq9NQCBLH98ryzbAu/eAZd+F8DHa7KR+l++83vqc=; b=njsD6zlmrYT6vxX9xc3ZDv1VTj
	DoaeR2WsX907dFT9EpIZw5QL6kzAsMu9YEOP4+x2A9acd4ZPeKhIGHfGZpaa9QUMp2wYAldKPdboX
	B5DXFK+jmdqNj4LyCiCbB67pF7YKvi3V0lUsOkWppalj8LUyqLXD3/eP7Nb8LhUty9PnBKns3A2s7
	wLb9jit/rpefrz3hwVrMF43h0fcKXiP7w67gmn5NqOv+HKFu6JJz4RdsrtIbn0JITl/CI52kAJVR7
	fIX5N6U7/Ix7ZQ+qS4k37wusEegZXwKbm1wbYO6bbV2sagC5pvEqBISaIM+g5kf6DPPKUEtsE2isc
	9nP1nSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGSOv-0000000DzYT-2juA;
	Sat, 25 Apr 2026 02:05:45 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGSOr-0000000DzY4-1UV9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 02:05:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EAuCq9NQCBLH98ryzbAu/eAZd+F8DHa7KR+l++83vqc=;
	b=o37jocVRSIaDbfz67h+yPkFhoRW2o+XJXPTmsTIFgm2iNLBcwkmJTE8p+halAlztHW1ZAU0E7
	V6LUk/wAYoAaMCxBlPnC9IpRH9UlLP/knAM5vVhvqU7WvQhXQtwQHfAKKN/6JCF3yQ4K67UnHSm
	Ol0t+dg+Z0uQfr7vudsaG3g=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4g2Y0Q4RLSz1prLm;
	Sat, 25 Apr 2026 09:59:02 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A6BF72012A;
	Sat, 25 Apr 2026 10:05:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 25 Apr 2026 10:05:28 +0800
Message-ID: <b4f97652-5cde-4ef7-8987-6f9b134d50ae@huawei.com>
Date: Sat, 25 Apr 2026 10:05:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Thomas Gleixner <tglx@kernel.org>, <peterz@infradead.org>,
	<sudeep.holla@kernel.org>, <yangyicong@hisilicon.com>,
	<dietmar.eggemann@arm.com>, Jonathan Cameron <jic23@kernel.org>,
	<linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260417075534.3745793-1-ruanjinjie@huawei.com>
 <aeNxKpHzTQX4_kId@arm.com> <87ldee0z1w.ffs@tglx>
 <78515da3-03a1-4fdb-a606-3fea9f4cd20b@huawei.com> <aep85G05D3TM9uj2@arm.com>
 <c6fe5e31-c397-4cf1-a422-f8d1a28fe20b@huawei.com> <aetnTT51ucm2azGG@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aetnTT51ucm2azGG@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_190542_083023_5BF35D5D 
X-CRM114-Status: GOOD (  23.40  )
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



On 4/24/2026 8:51 PM, Catalin Marinas wrote:
> (updating Jonathan's email address to match MAINTAINERS)
> 
> On Fri, Apr 24, 2026 at 09:56:24AM +0800, Jinjie Ruan wrote:
>> On 4/24/2026 4:11 AM, Catalin Marinas wrote:
>>> On Thu, Apr 23, 2026 at 08:32:34PM +0800, Jinjie Ruan wrote:
>>>> On 4/23/2026 6:08 PM, Thomas Gleixner wrote:
>>>>> On Sat, Apr 18 2026 at 12:55, Catalin Marinas wrote:
>>>>>> Another option would have been to avoid marking such CPUs present but I
>>>>>> think this will break other things. Yet another option is to register
>>>>>> all CPU devices even if they never come up (like maxcpus greater than
>>>>>> actual CPUs).
>>>>>>
>>>>>> Opinions? It might be an arm64+ACPI-only thing.
>>>>>
>>>>> I think so. The proper thing to do is to apply sane limits:
>>>>>
>>>>>  1) The possible CPUs enumerated by firmware N_POSSIBLE_FW
>>>>>
>>>>>  2) The maxcpus limit on the command line N_MAXCPUS_CL
>>>>>
>>>>> So the actual possible CPUs evaluates to:
>>>>>
>>>>>    num_possible = min(N_POSSIBLE_FW, N_MAXCPUS_CL, CONFIG_NR_CPUS);
>>>>>
>>>>> The evaluation of the firmware should not mark CPUs present which are
>>>>> actually not. ACPI gives you that information. See:
>>>>>
>>>>>          5.2.12.14 GIC CPU Interface (GICC) Structure
>>>>>
>>>>> in the ACPI spec. That has two related bits:
>>>>>
>>>>> Enabled:
>>>>>
>>>>>    If this bit is set, the processor is ready for use. If this bit is
>>>>>    clear and the Online Capable bit is set, the system supports enabling
>>>>>    this processor during OS runtime. If this bit is clear and the Online
>>>>>    Capable bit is also clear, this processor is un- usable, and the
>>>>>    operating system support will not attempt to use it.
>>>>>
>>>>> Online Capable:
>>>>>
>>>>>    The information conveyed by this bit depends on the value of the
>>>>>    Enabled bit. If the Enabled bit is set, this bit is reserved and must
>>>>>    be zero. Otherwise, if this bit is set, the system supports enabling
>>>>>    this processor later during OS runtime
>>>>>
>>>>> So the combination of those gives you the right answer:
>>>>>
>>>>>    Enabled	Online
>>>>>    	        Capable
>>>>>    0            0        Not present, not possible
>>>>>    0            1        Not present, but possible to "hotplug" layter
>>>>>    1            0        Present
>>>>>    1            1        Invalid
>>>>
>>>> On x86, it seems that all CPUs with the ACPI_MADT_ENABLED bit set will
>>>> be marked as present.
>>>>
>>>> acpi_parse_x2apic()
>>>>   -> enabled = processor->lapic_flags & ACPI_MADT_ENABLED
>>>>   -> topology_register_apic(enabled)
>>>>      -> topo_register_apic(enabled)
>>>>         -> set_cpu_present(cpu, true)
>>>
>>> Yes but arm64 marks all CPUs present even if !ACPI_MADT_ENABLED as we
>>> don't have the notion of hardware CPU hotplug.
>>>
>>> I need to dig some more into the original vCPU hotplug support and why
>>> we ended up with all CPUs marked as present even if not calling
>>> register_cpu():
>>>
>>> https://lore.kernel.org/linux-arm-kernel/20240529133446.28446-1-Jonathan.Cameron@huawei.com/
>>>
>>> What's the MADT GICC provided by qemu with "-smp cpus=4,maxcpus=8"? If
>>> it says Enabled for the first 4 and Online Capable for the rest, maybe
>>> we can try something like below:
>>
>> Yes, you are absolutely right,Enabled for the first 4(with GIC Flags:
>> 0x1, bit0 set) and Online Capable for the rest(with GIC Flags: 0x8, bit3
>> set). The ACPI MADT disassembly result is as follows:
> 
> That's great, thanks for checking.
> 
> I'd like to get some feedback from Jonathan and James as they
> contributed the vCPU hotplug support. The reason was for kubernetes to
> add vCPUs to an existing VM. Hopefully no-one relied on
> /sys/devices/system/cpu/present to report 0-7 in the above
> configuration.

Yes, only cpu 0~3 present.

# cat /sys/devices/system/cpu/possible
0-7
# cat /sys/devices/system/cpu/enabled
0-3
# cat /sys/devices/system/cpu/present
0-3
# cat /sys/devices/system/cpu/online
0-3
# cat /sys/devices/system/cpu/offline
4-7

> 
> Have you tried the vCPU hotplug with this patch (the original use-case)?

Yes，the basic vCPU hotplug has no problem as below:

Add the last four CPUs:

(qemu) device_add host-arm-cpu,id=cpu4,core-id=2,thread-id=0
(qemu) [  678.984281] ACPI: CPU4 has been hot-added

(qemu) device_add host-arm-cpu,id=cpu5,core-id=2,thread-id=1
(qemu) [  686.593536] ACPI: CPU5 has been hot-added

(qemu) device_add host-arm-cpu,id=cpu6,core-id=3,thread-id=0
(qemu) [  699.493530] ACPI: CPU6 has been hot-added

(qemu) device_add host-arm-cpu,id=cpu7,core-id=3,thread-id=1
(qemu) [  706.165770] ACPI: CPU7 has been hot-added

# cat /sys/devices/system/cpu/cpu*/online
1
1
1
1
0
0
0
0
# echo 1 > /sys/devices/system/cpu/cpu4/online
[  868.423001] Detected PIPT I-cache on CPU4
[  868.437103] GICv3: CPU4: found redistributor 4 region
0:0x0000000008120000
[  868.437193] GICv3: CPU4: using allocated LPI pending table
@0x0000000040120000
[  868.437330] CPU4: Booted secondary processor 0x0000000004 [0x410fd082]
# echo 1 > /sys/devices/system/cpu/cpu5/online
[  871.855694] Detected PIPT I-cache on CPU5
[  871.869725] GICv3: CPU5: found redistributor 5 region
0:0x0000000008140000
[  871.869811] GICv3: CPU5: using allocated LPI pending table
@0x0000000040130000
[  871.869938] CPU5: Booted secondary processor 0x0000000005 [0x410fd082]
# echo 1 > /sys/devices/system/cpu/cpu6/online
[  874.756497] Detected PIPT I-cache on CPU6
[  874.770521] GICv3: CPU6: found redistributor 6 region
0:0x0000000008160000
[  874.770606] GICv3: CPU6: using allocated LPI pending table
@0x0000000040140000
[  874.770748] CPU6: Booted secondary processor 0x0000000006 [0x410fd082]
# echo 1 > /sys/devices/system/cpu/cpu7/online
[  878.212505] Detected PIPT I-cache on CPU7
[  878.226560] GICv3: CPU7: found redistributor 7 region
0:0x0000000008180000
[  878.226646] GICv3: CPU7: using allocated LPI pending table
@0x0000000040150000
[  878.226783] CPU7: Booted secondary processor 0x0000000007 [0x410fd082]
# cat /sys/devices/system/cpu/cpu*/online
1
1
1
1
1
1
1
1
# cat /sys/devices/system/cpu/enabled
0-7
# cat /sys/devices/system/cpu/present
0-7
# cat /sys/devices/system/cpu/online
0-7

Unplug the last four CPUs.

# (qemu) device_del cpu4
(qemu) [  977.336251] psci: CPU4 killed (polled 0 ms)

(qemu) device_del cpu5
(qemu) [  979.948212] psci: CPU5 killed (polled 0 ms)

(qemu) device_del cpu6
(qemu) [  981.976337] psci: CPU6 killed (polled 0 ms)

(qemu) device_del cpu7
(qemu) [  984.476253] psci: CPU7 killed (polled 0 ms)


# cat /sys/devices/system/cpu/cpu*/online
1
1
1
1
# cat /sys/devices/system/cpu/possible
0-7
# cat /sys/devices/system/cpu/enabled
0-3
# cat /sys/devices/system/cpu/present
0-3
# cat /sys/devices/system/cpu/online
0-3
# cat /sys/devices/system/cpu/offline
4-7

> 
> Anyway, feel free to post a v2 with the above proposal, cc Jonathan (on
> kernel.org) and James Morse and we'll take it from there. You can add a
> suggested-by me.
> 
> Thanks.
> 


