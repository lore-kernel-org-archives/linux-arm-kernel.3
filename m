Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D93CE8E8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6EAsGmqJZp9Jtu5OJswFR19+GlBdu1maiVLtf3Rqjs=; b=MIzQuEB1vmyu+b5WAEwL6Pv8xJ
	qGTk6+HAfVxxs9QYEienUi+zrlJPuVE/dFIjsUJhKsBcsE+pkbISYVYpwfN+yLTS167sKDawHGslq
	wdSOm3Zh3B9zLyetBDRcDnYq54TNdbM8N5SQJytnakPUb2zDRUUYelJ4X0HLBY8lXXsGLBDTMSSX3
	nhG8CFq36SHbsYnnpvGDxDzpOi3MITxRGInqdH/u3VgSIqNpy1ho4QTX7o87YMvuowvqb8idFBWZD
	RZGKxbh+RZmZCNL6NBEtph6g7UJyulNxdGNv+chFZC4Fv6h+JUy4/wBQf2b0rLfWpKaEOvBVIlbC4
	8YU1sg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zzR-00000000xms-3OpK;
	Thu, 24 Oct 2024 15:43:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zgV-00000000tr1-0jk8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 15:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:CC:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=E6EAsGmqJZp9Jtu5OJswFR19+GlBdu1maiVLtf3Rqjs=; b=JerxgNyJdIP2TlYNhs+7t9YpDV
	PO77CPq49lRyA5zeEfUy0RBjbj2K5ubR7UcRoYRpidBxKhZMwglcrZ5jZR4jQ/C7kdi//0Rmgy/7I
	zvWrnldVkQOePuAneqxJpPplGX2g9gPWEGS5sMR6wgMXkblJsudYVhXP4+IZDgMBI6jZxYDNppjsb
	11PePy+v/qty838vlAq4ngpI9bmk0pVPnSm9QWlnwBF60/wcY6POASOXl7GjxdVRKVX4i9Y1ZQoKQ
	jrmwW4+8PYSj8JxuTuImyX+dyviMM3x9KiJT1Ao9wKiV6t+ks2eW4//GCvfj3oGyALNLb5IVWRVQV
	lSH90pAw==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zgR-00000008hby-1Dxy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:23:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XZ8m759Jqz20qXX;
	Thu, 24 Oct 2024 23:22:15 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id BC6B81A0188;
	Thu, 24 Oct 2024 23:23:08 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 24 Oct 2024 23:23:08 +0800
CC: <yangyicong@hisilicon.com>, <will@kernel.org>, <maz@kernel.org>,
	<mark.rutland@arm.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <oliver.upton@linux.dev>,
	<ryan.roberts@arm.com>, <linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>, <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 3/5] arm64: Add support for FEAT_HAFT
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20241022092734.59984-1-yangyicong@huawei.com>
 <20241022092734.59984-4-yangyicong@huawei.com> <ZxfvVO75Mob_FWF7@arm.com>
 <3ad59e2d-957d-e704-4a4c-ee0af2bd8dd4@huawei.com> <Zxjt62hKsNu06OrD@arm.com>
 <5b31a644-1eac-46de-6212-d2733234814b@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <14f1802a-6a45-576b-8ded-fcb6015c5928@huawei.com>
Date: Thu, 24 Oct 2024 23:23:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <5b31a644-1eac-46de-6212-d2733234814b@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_162332_343075_7BB26C0C 
X-CRM114-Status: GOOD (  30.42  )
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

On 2024/10/24 22:45, Yicong Yang wrote:
> On 2024/10/23 20:36, Catalin Marinas wrote:
>> On Wed, Oct 23, 2024 at 06:30:18PM +0800, Yicong Yang wrote:
>>> On 2024/10/23 2:30, Catalin Marinas wrote:
>>>> On Tue, Oct 22, 2024 at 05:27:32PM +0800, Yicong Yang wrote:
>>>>> diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
>>>>> index 8ff5f2a2579e..bc1051d65125 100644
>>>>> --- a/arch/arm64/include/asm/pgalloc.h
>>>>> +++ b/arch/arm64/include/asm/pgalloc.h
>>>>> @@ -30,7 +30,7 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
>>>>>  {
>>>>>  	pudval_t pudval = PUD_TYPE_TABLE;
>>>>>  
>>>>> -	pudval |= (mm == &init_mm) ? PUD_TABLE_UXN : PUD_TABLE_PXN;
>>>>> +	pudval |= (mm == &init_mm) ? PUD_TABLE_AF | PUD_TABLE_UXN : PUD_TABLE_PXN;
>>>>>  	__pud_populate(pudp, __pa(pmdp), pudval);
>>>>>  }
>>>>
>>>> Why not set the table AF for the task entries? I haven't checked the
>>>> core code but normally when we map a pte it's mapped as young. While for
>>>> table AF we wouldn't get a fault, I would have thought the core code
>>>> follows the same logic.
>>>
>>> I may need to check. If I understand it correctly, for most case (e.g.
>>> a read fault) we should make pte young if the hardware AF update is
>>> not supported. Otherwsie hardware will help to update.
>>
>> On arm64 at least, _PROT_DEFAULT has PTE_AF set. So all accessible
>> entries in protection_map[] will have it set. I'm not sure how the core
>> code clears PTE_AF in the table entries. I'd have thought it goes
>> together with some pte_mkold().
>>
> 
> you're right. Checked that x86 will set the AF bit for the table entry [1][2].
> Will set AF for task entries.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/include/asm/pgalloc.h#n84
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/include/asm/pgtable_types.h#n221
> 
>>>>> +#ifdef CONFIG_ARM64_HAFT
>>>>> +	{
>>>>> +		.desc = "Hardware managed Access Flag for Table Descriptor",
>>>>> +		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
>>>>
>>>> I'd actually use ARM64_CPUCAP_SYSTEM_FEATURE here. We use something
>>>> similar for HW DBM but there we get a fault and set the pte dirty. You
>>>> combined it with a system_support_haft() that checks the sanitised regs
>>>> but I'd rather have a static branch check via cpus_have_cap(). Even with
>>>> your approach we can have a race with a late CPU hot-plugged that
>>>> doesn't have the feature in the middle of some core code walking the
>>>> page tables.
>>>>
>>>> With a system feature type, late CPUs not having the feature won't be
>>>> brought online (if feature enabled) but in general I don't have much
>>>> sympathy for SoC vendors combining CPUs with incompatible features ;).
>>>
>>> ok. If we make it a system feature, we can using cpus_have_cap() then and
>>> drop the system_support_haft() which is checking with the sanitised registers.
>>> It's fine for me.
>>>
>>> Will ask to not refuse online a CPU due to mismatch of this feature in [1],
>>> hope we have an agreement :)
>>>
>>> [1] https://lore.kernel.org/linux-arm-kernel/20240820161822.GC28750@willie-the-truck/
>>
>> I initially thought this would work but I don't feel easy about having
>> should_clear_pmd_young() change its polarity at runtime while user space
>> is running. If that's not a problem, we can go with your current
>> approach.
> 
> this should be ok as I image. after online a CPU without HAFT the system won't
> advertise HAFT support but we don't disable the HAFT update on the supported
> CPUs, the ongoing page aging process can still use the updated table AF information
> and later process will fallback to use the PTE's AF bit. efficiency maybe reduced
> but the function should be correct.
> 

But we may have a chance to hit the VM_WARN_ON() in pmdp_test_and_clear_young() introduced in Patch 5/5:

CPUx                                         CPUy (without HAFT)
if (should_clear_pmd_yound())
                                             online and make system_support_haft() == false;
  pmdp_test_and_clear_young()
    VM_WARN_ON(pmd_table(READ_ONCE(*pmdp)) && !system_support_haft());

we may need to drop the VM_WARN_ON() with current approach or make this feature
ARM64_CPUCAP_SYSTEM_FEATURE.

> the user setting will be changed after online a CPU without HAFT. the user will
> know this unless read /sys/kernel/mm/lru_gen/enabled again (LRU_GEN_NONLEAF_YOUNG
> bit 0x4 will be cleared after online a CPU without HAFT since system would
> not declare non-leaf PMD young support).
> 
>>>>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>>>>> index ccbae4525891..4a58b9b36eb6 100644
>>>>> --- a/arch/arm64/mm/proc.S
>>>>> +++ b/arch/arm64/mm/proc.S
>>>>> @@ -495,9 +495,15 @@ alternative_else_nop_endif
>>>>>  	 * via capabilities.
>>>>>  	 */
>>>>>  	mrs	x9, ID_AA64MMFR1_EL1
>>>>> -	and	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_MASK
>>>>> +	ubfx	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_SHIFT, #4
>>>>>  	cbz	x9, 1f
>>>>>  	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
>>>>> +
>>>>> +#ifdef CONFIG_ARM64_HAFT
>>>>> +	cmp	x9, ID_AA64MMFR1_EL1_HAFDBS_HAFT
>>>>> +	b.lt	1f
>>>>> +	orr	tcr2, tcr2, TCR2_EL1x_HAFT
>>>>> +#endif /* CONFIG_ARM64_HAFT */
>>>>
>>>> I think we can skip the ID check here and always set the HAFT bit. We do
>>>> something similar with MTE (not for TCR_HA though, don't remember why).
>>>
>>> Thanks for the reference to MTE. Will see and have a test. But a check
>>> here may seem more reasonable as we usually detect a feature first
>>> then enable it?
>>
>> The behaviour of these RES0 bits is that we can write them and if the
>> feature is present, it will be enabled, otherwise it won't have any
>> effect, so it's not necessary to check the ID bits, the result would be
>> the same. We do this in other places as well.
>>
>> Of course, we need to check the presence of TCR2_EL1, otherwise it would
>> undef. Just a bit less code since we want the feature on anyway.
> 
> sure. will drop the check and set the HAFT bit unconditionally.
> 
> Thanks.
> 
> 
> .
> 

