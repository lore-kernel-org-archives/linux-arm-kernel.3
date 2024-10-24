Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D984CE8E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXugLao44GoAqYOlLnbokyIZAffE0tXAcu8+bZmDWJA=; b=fVpNk61dVG66cJWu8KEX8TVODj
	yM5YJexRbx0CwJFQtSYqDyEE1PkW/fJVZubwin9iQpj6nPdHemKT8Yj/PxvHcujZ3lgZRf8Y1ygbS
	papIjSTTt4LnlzvuNRv7lUkJmB0y2CJuNtvphIhHs2voghpWjCxiNXpk/s4Gc5XeDZ9qDuPpY2hpm
	fuSK4quuWXm8ERVzh0Rec+IvVBUGT7nO43bZ0BPZJvxcqAXB3wFTGsXNz7zqg5qnXAW6peDTx+zbh
	/Tp2RwQ1eykktgRFZYlRjAzVE01+wIgLMTGjE/V5caK3p3fGyFGwTFbbsJTU7Giu/PTHIsbWmpcXF
	kDDmi/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zAK-00000000oFj-3jyZ;
	Thu, 24 Oct 2024 14:50:20 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3z68-00000000nd7-1Oev
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:46:02 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XZ7x74zzPz20qbP;
	Thu, 24 Oct 2024 22:44:59 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id AEC541400D5;
	Thu, 24 Oct 2024 22:45:52 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 24 Oct 2024 22:45:51 +0800
CC: <will@kernel.org>, <yangyicong@hisilicon.com>, <maz@kernel.org>,
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
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5b31a644-1eac-46de-6212-d2733234814b@huawei.com>
Date: Thu, 24 Oct 2024 22:45:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <Zxjt62hKsNu06OrD@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_074600_773335_B388FFDA 
X-CRM114-Status: GOOD (  32.22  )
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

On 2024/10/23 20:36, Catalin Marinas wrote:
> On Wed, Oct 23, 2024 at 06:30:18PM +0800, Yicong Yang wrote:
>> On 2024/10/23 2:30, Catalin Marinas wrote:
>>> On Tue, Oct 22, 2024 at 05:27:32PM +0800, Yicong Yang wrote:
>>>> diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
>>>> index 8ff5f2a2579e..bc1051d65125 100644
>>>> --- a/arch/arm64/include/asm/pgalloc.h
>>>> +++ b/arch/arm64/include/asm/pgalloc.h
>>>> @@ -30,7 +30,7 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
>>>>  {
>>>>  	pudval_t pudval = PUD_TYPE_TABLE;
>>>>  
>>>> -	pudval |= (mm == &init_mm) ? PUD_TABLE_UXN : PUD_TABLE_PXN;
>>>> +	pudval |= (mm == &init_mm) ? PUD_TABLE_AF | PUD_TABLE_UXN : PUD_TABLE_PXN;
>>>>  	__pud_populate(pudp, __pa(pmdp), pudval);
>>>>  }
>>>
>>> Why not set the table AF for the task entries? I haven't checked the
>>> core code but normally when we map a pte it's mapped as young. While for
>>> table AF we wouldn't get a fault, I would have thought the core code
>>> follows the same logic.
>>
>> I may need to check. If I understand it correctly, for most case (e.g.
>> a read fault) we should make pte young if the hardware AF update is
>> not supported. Otherwsie hardware will help to update.
> 
> On arm64 at least, _PROT_DEFAULT has PTE_AF set. So all accessible
> entries in protection_map[] will have it set. I'm not sure how the core
> code clears PTE_AF in the table entries. I'd have thought it goes
> together with some pte_mkold().
> 

you're right. Checked that x86 will set the AF bit for the table entry [1][2].
Will set AF for task entries.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/include/asm/pgalloc.h#n84
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/include/asm/pgtable_types.h#n221

>>>> +#ifdef CONFIG_ARM64_HAFT
>>>> +	{
>>>> +		.desc = "Hardware managed Access Flag for Table Descriptor",
>>>> +		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
>>>
>>> I'd actually use ARM64_CPUCAP_SYSTEM_FEATURE here. We use something
>>> similar for HW DBM but there we get a fault and set the pte dirty. You
>>> combined it with a system_support_haft() that checks the sanitised regs
>>> but I'd rather have a static branch check via cpus_have_cap(). Even with
>>> your approach we can have a race with a late CPU hot-plugged that
>>> doesn't have the feature in the middle of some core code walking the
>>> page tables.
>>>
>>> With a system feature type, late CPUs not having the feature won't be
>>> brought online (if feature enabled) but in general I don't have much
>>> sympathy for SoC vendors combining CPUs with incompatible features ;).
>>
>> ok. If we make it a system feature, we can using cpus_have_cap() then and
>> drop the system_support_haft() which is checking with the sanitised registers.
>> It's fine for me.
>>
>> Will ask to not refuse online a CPU due to mismatch of this feature in [1],
>> hope we have an agreement :)
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/20240820161822.GC28750@willie-the-truck/
> 
> I initially thought this would work but I don't feel easy about having
> should_clear_pmd_young() change its polarity at runtime while user space
> is running. If that's not a problem, we can go with your current
> approach.

this should be ok as I image. after online a CPU without HAFT the system won't
advertise HAFT support but we don't disable the HAFT update on the supported
CPUs, the ongoing page aging process can still use the updated table AF information
and later process will fallback to use the PTE's AF bit. efficiency maybe reduced
but the function should be correct.

the user setting will be changed after online a CPU without HAFT. the user will
know this unless read /sys/kernel/mm/lru_gen/enabled again (LRU_GEN_NONLEAF_YOUNG
bit 0x4 will be cleared after online a CPU without HAFT since system would
not declare non-leaf PMD young support).

>>>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>>>> index ccbae4525891..4a58b9b36eb6 100644
>>>> --- a/arch/arm64/mm/proc.S
>>>> +++ b/arch/arm64/mm/proc.S
>>>> @@ -495,9 +495,15 @@ alternative_else_nop_endif
>>>>  	 * via capabilities.
>>>>  	 */
>>>>  	mrs	x9, ID_AA64MMFR1_EL1
>>>> -	and	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_MASK
>>>> +	ubfx	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_SHIFT, #4
>>>>  	cbz	x9, 1f
>>>>  	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
>>>> +
>>>> +#ifdef CONFIG_ARM64_HAFT
>>>> +	cmp	x9, ID_AA64MMFR1_EL1_HAFDBS_HAFT
>>>> +	b.lt	1f
>>>> +	orr	tcr2, tcr2, TCR2_EL1x_HAFT
>>>> +#endif /* CONFIG_ARM64_HAFT */
>>>
>>> I think we can skip the ID check here and always set the HAFT bit. We do
>>> something similar with MTE (not for TCR_HA though, don't remember why).
>>
>> Thanks for the reference to MTE. Will see and have a test. But a check
>> here may seem more reasonable as we usually detect a feature first
>> then enable it?
> 
> The behaviour of these RES0 bits is that we can write them and if the
> feature is present, it will be enabled, otherwise it won't have any
> effect, so it's not necessary to check the ID bits, the result would be
> the same. We do this in other places as well.
> 
> Of course, we need to check the presence of TCR2_EL1, otherwise it would
> undef. Just a bit less code since we want the feature on anyway.

sure. will drop the check and set the HAFT bit unconditionally.

Thanks.



