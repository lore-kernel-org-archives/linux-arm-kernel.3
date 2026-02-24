Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8990DF4BB68
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YdVAxteEwm7ePRyi85aGdE3pL6Ph5zbuokUZmvtP0I=; b=3O63xM+xGqlOPNPplW5FcSklUu
	2ihMc8EJ+8YIQdmjvVmSfSlGxCbejxwP0KaueVfLoyjCPN2epd8gwZmN4/iHk0nK5bCRBS3HrrV2p
	qcKREURT6Z03gam2dS0576eVvzUN+aRVS1HV1MwSGItIkqWIM36fJ3ApnvEu3KMKW3xWo6wzEEKQD
	VuGxLT9tqEdxS0YPHtYCI7S6O1wRnfLz9VA73jCKtR4pi+D5MLjcZy+mZEc8IBx5X1jeGJE73nO+0
	uTaQOIm9y4div2zQoR0l7t9Y+KwchljKXd+IZTTO5gC/JvsjT59brF8Cd53L+dit4AJtNA3QcEOQU
	OAKPAc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwb7-00000002W0x-0w8z;
	Tue, 24 Feb 2026 17:53:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwb4-00000002W0X-1wGk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:53:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68E72339;
	Tue, 24 Feb 2026 09:53:13 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B4253F59E;
	Tue, 24 Feb 2026 09:53:14 -0800 (PST)
Message-ID: <35bf397e-bf96-4c15-b905-2141020b7627@arm.com>
Date: Tue, 24 Feb 2026 17:53:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
From: Ben Horgan <ben.horgan@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 linux-doc@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <9945d28e-f1f2-e11a-1481-8d80167d6f89@huawei.com>
 <b844c632-c8fc-48f1-b347-07f166019b22@arm.com>
 <28dbde39-5b21-5f2f-59f5-4500c8b0296d@huawei.com>
 <2f2410a0-69dd-4da5-bd84-d168ba6b0605@arm.com>
Content-Language: en-US
In-Reply-To: <2f2410a0-69dd-4da5-bd84-d168ba6b0605@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_095322_584199_A098D680 
X-CRM114-Status: GOOD (  35.78  )
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

Hi Zeng,

On 2/24/26 14:19, Ben Horgan wrote:
> Hi Zeng,
> 
> On 2/24/26 11:03, Zeng Heng wrote:
>> Hi Ben,
>>
>> On 2026/2/16 20:22, Ben Horgan wrote:
>>> Hi Zeng,
>>>
>>> On 2/14/26 09:40, Zeng Heng wrote:
>>>> Hi Ben,
>>>>
>>>> On 2026/2/4 5:43, Ben Horgan wrote:
>>> [...]
>>>>>
>>>>> Based on:
>>>>> [1] git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cache
>>>>> (To include telemetry code which changes the resctrl arch interface)
>>>>>
>>>>> The series can be retrieved from:
>>>>> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v4
>>>>> (Final commit is a fix already in 6.19-rc8)
>>>>>
>>> [...]
>>>>>
>>>>
>>>> I've tested the MPAM functionality on my local Kunpeng platform. Here's
>>>> a summary of the results:
>>>
>>> Thank you very much for your testing and detailed report.
>>>
>>>>
>>>> Features enabled and verified:
>>>>    * L2 and L3 CPBM
>>>>    * L3 CSU
>>>>    * L2 and L3 CDP
>>>> All enabled features passed functional testing as expected.
>>>>
>>>> + Tested-by: Zeng Heng <zengheng4@huawei.com>
>>>>
>>>> Features not enabled:
>>>>    1. MATA MBMAX partition and MBWU monitor.
>>>
>>> What's MATA here? Just memory allocation or something more specific?
>>>
>>
>> The MATA serves as the agent for the Broadway MESI coherence protocol
>> among multiple L3 caches or between I/O and L3 caches. It maintains data
>> coherence among multiple L3 caches or between I/O and L3 caches.
>>
>> As the connection module between the SoC and the memory system, the MATA
>> interfaces with the DMC on the DDR die. It provides the system with DDR
>> access paths, delivering high-bandwidth, low-latency DDR read/write
>> access.
>>
>> On the Kunpeng chip, the MB related MSC resides in this module rather
>> than being directly located on the L3 cache controller.
>>
>>>>       Reason: These do not meet the driver's current topology>
>>> expectations for MB support, hence they were not initialized.
>>>>       This behavior is expected.
>>>
>>> Is this because you have more than 1 L3 cache?
>>
>> Yes, Kunpeng platform has more than 1 L3 cache.
>>
>> However, the reason it is not supported here is that the current driver
>> does not support MATA recognition, while both Kunpeng MBM and MBA
>> functionalities reside in the MATA MSC side as mentioned above,
>> resulting in the inability to provide support.
>>
>> Relevant logs are as follows:
>>
>> [   10.997406] mpam:topology_matches_l3: class 255 component 0 has
>> Mismatched CPU mask with L3 equivalent
>> [   10.997411] mpam:mpam_resctrl_pick_mba: class 255 topology doesn't
>> match L3
>>
>>>
>>>>
>>>>    2. L2 CSU and MBWU monitors.
>>>>       Reason: The current MPAM driver does not support L2-related
>>>>       functionality yet.
>>>
>>> Thanks for letting us know you have these. But, yes, unfortunately
>>> monitoring is only supported on the L3 at the moment.
>>>
>>>>
>>>> + Tested-by: Zeng Heng <zengheng4@huawei.com>
>>>>
>>>>
>>>> Detailed test logs are as follows:
>>>
>>> I'm confused by these logs as it looks like you aren't getting any
>>> monitors but you verified the L3 CSU. Also, it looks like cpor (cbpm) is
>>> disabled (at least partially) but you verified L2 and L3 CPBM. Is this
>>> across different machines?
>>>
>>
>> The logs were of course tested on the same machine.
> 
> Ok and the same run? Just asking because I can't yet see how this all
> goes together.
> 
>>
>> Since the L3 CSU/CPBM resides on the L3 cache, it can be correctly
>> recognized and run smoothly.
>>
>> In fact, not only was L2 successfully mounted, but all L2 MSC CPBMs were
>> also correctly recognized. The suspicion here is that the L2
>> class->components were incorrectly mounted to an unknown object, which
>> is believed to be related to the monitoring capabilities (CSU and MBWU)
>> of Kunpeng L2. The root cause is still being investigated.
> 
> I'll try and mock up a system with L2 monitoring and cpbm to see if the
> driver behaves in the same way.
> 
> However, I still can't understand how you get CPOR on L2 after seeing
> "mpam:mpam_resctrl_pick_caches: class 2 cache misses CPOR" as that
> should be the only place class is set for the l2 cache which guards the
> call to mpam_control_init() in mpam_resctrl_setup(). The
> mpam_monitor_init() comes later so I can't see how that effects.
> 
> Is the driver corrupting something or writing to mpam_resctrl_controls
> with the wrong index? Clutching at straws here.
> 
>>
>> Resctrl mounting status:
>>
>> # cat schemata
>> L2:4=ff;7=ff;10=ff;13=ff;16=ff;19=ff;22=ff;25=ff;29=ff;32=ff;35=ff;
>> 38=ff;41=ff;44=ff;47=ff;50=ff;54=ff;57=ff;60=ff;63=ff;66=ff;69=ff;72=ff;
>> 75=ff;79=ff;82=ff;85=ff;88=ff;91=ff;94=ff;97=ff;100=ff;104=ff;107=ff;
>> 110=ff;113=ff;116=ff;119=ff;122=ff;125=ff;129=ff;132=ff;135=ff;138=ff;
>> 141=ff;144=ff;147=ff;150=ff;154=ff;157=ff;160=ff;163=ff;166=ff;169=ff;
>> 172=ff;175=ff;179=ff;182=ff;185=ff;188=ff;191=ff;194=ff;197=ff;200=ff;
>> 204=ff;207=ff;210=ff;213=ff;216=ff;219=ff;222=ff;225=ff;229=ff;232=ff;
>> 235=ff;238=ff;241=ff;244=ff;247=ff;250=ff;254=ff;257=ff;260=ff;263=ff;
>> 266=ff;269=ff;272=ff;275=ff;279=ff;282=ff;285=ff;288=ff;291=ff;294=ff;
>> 297=ff;300=ff
>> L3:1=1ffff;26=1ffff;51=1ffff;76=1ffff;101=1ffff;126=1ffff;151=1ffff;
>> 176=1ffff;201=1ffff;226=1ffff;251=1ffff;276=1ffff
>>
>> # ls mon_data/*/*
>> mon_data/mon_L3_01/llc_occupancy   mon_data/mon_L3_151/llc_occupancy
>> mon_data/mon_L3_226/llc_occupancy  mon_data/mon_L3_276/llc_occupancy
>> mon_data/mon_L3_101/llc_occupancy  mon_data/mon_L3_176/llc_occupancy
>> mon_data/mon_L3_251/llc_occupancy  mon_data/mon_L3_51/llc_occupancy
>> mon_data/mon_L3_126/llc_occupancy  mon_data/mon_L3_201/llc_occupancy
>> mon_data/mon_L3_26/llc_occupancy   mon_data/mon_L3_76/llc_occupancy
> 
> Thanks for the extra details. These are as expected, right?
> 
>>
>>>>
>>>> Boot logs:
>>>> [root@localhost ~]# dmesg | grep -i mpam
>>>> [    0.000000] ACPI: MPAM 0x000000007FF35018 003024 (v01 HISI   HIP12
>>>> 00000000 HISI 20151124)
>>>> [    9.509852] mpam_msc mpam_msc.64: Merging features for
>>>> vmsc:0xffff0800973cf5a0 |= ris:0xffff08009757ee90
>>>> [    9.509859] mpam_msc mpam_msc.254: Merging features for
>>>> class:0xffff08009736fe50 &= vmsc:0xffff080097628520
>>>> [    9.509860] mpam:__props_mismatch:
>>>> mpam_has_feature(mpam_feat_cpor_part, parent) = 1
>>>> [    9.509864] mpam:__props_mismatch:
>>>> mpam_has_feature(mpam_feat_cpor_part, child) = 0
>>>> [    9.509866] mpam:__props_mismatch: parent->cpbm_wd = 8
>>>> [    9.509869] mpam:__props_mismatch: child->cpbm_wd = 0
>>>> [    9.509871] mpam:__props_mismatch: alias = 0
>>>> [    9.509873] mpam:__props_mismatch: cleared cpor_part
> 
> Do you know where this mismatch is happening? Is it expected?

I have added some of James' debug patches at:
https://gitlab.arm.com/linux-arm/linux-bh/-/tree/mpam_resctrl_glue_v5_debugfs?ref_type=heads

These are on top of a v5 of the series. They apply to older series
as well.

The debugfs should then contain details of all the MSC which
should help debugging.

It would be great if you were able to share that information, either on list or
privately if needed.

You can snapshot the mpam debugfs using:

find /sys/kernel/debug/mpam -type f -exec sh -c 'echo {}; cat {}' \; > mpam_debugfs.txt

> 
>>>
>>> cpor (partially) disabled?
>>>
>>>> [    9.509876] mpam:__props_mismatch: took the min num_csu_mon
>>>> [    9.509878] mpam:__props_mismatch: took the min num_mbwu_mon
>>>> [    9.509881] mpam_msc mpam_msc.252: Merging features for
>>
>> [...]
>>
>>>> [   10.978496] mpam:mpam_resctrl_pick_caches: class 2 cache misses CPOR
>>>
>>> No L2 cpor?
> 
> This particularly confuses me...
> 
>>>
>>>> [   10.978497] mpam:mpam_resctrl_pick_caches: class 255 is not a cache
>>>> [   10.980470] mpam:mpam_resctrl_pick_mba: class 2 is before L3
>>>> [   10.980472] mpam:mpam_resctrl_pick_mba: class 3 has no bandwidth
>>>> control
>>>> [   10.997406] mpam:topology_matches_l3: class 255 component 0 has
>>>> Mismatched CPU mask with L3 equivalent
>>>> [   10.997411] mpam:mpam_resctrl_pick_mba: class 255 topology doesn't
>>>> match L3
>>>> [   10.997415] mpam:mpam_resctrl_pick_counters: class 2 is before L3
>>>> [   11.024109] mpam:topology_matches_l3: class 3 component 276 has
>>>> Mismatched CPU mask with L3 equivalent
>>>> [   11.024114] mpam:class_has_usable_mbwu: monitors usable in free-
>>>> running mode
>>>
>>> mbwu enabled?
>>
>> The fact that the number of monitors merely satisfies the conditions for
>> free-running mode does not imply that the MBWU functionality can be
>> successfully mounted. The specific reasons are explained above.
> 
> True
> 
>>
>>>
>>>> [   11.063882] mpam:topology_matches_l3: class 255 component 0 has
>>>> Mismatched CPU mask with L3 equivalent
>>>> [   11.113183] mpam:mpam_resctrl_alloc_domain: Skipped monitor domain
>>>> online - no monitors
>>>> [   11.113189] MPAM enabled with 32 PARTIDs and 4 PMGs
>>>>
>>>>
>>
>> Sorry for the late reply. And this is my first day back from a long
>> vacation.
> 
> No problem. Hope you had a good holiday.
> 
>>
>>
>> Best regards,
>> Zeng Heng
> 
> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben


