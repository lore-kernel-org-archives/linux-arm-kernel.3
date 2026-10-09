Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D36CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcfVFuw8y4allRfA0r8LA1ajHlqXqDKvtUL3AcNI1VM=; b=sXamZxbBB/7IApy1IngdladxL7
	DCb5NVG3k5iEPz53XLIVmXpf7s1alB3nMgh5CkjObx/Gx0Myc3z10qFguJKRZuACkhwTIFDqFIaLb
	Fx0D+HmBQ/IeWLVtoGP31a7yzBb1St1BjO8kisgId6PESw8TrOrvnfD8n/cLwyoZ6IZPTge0Nfnaj
	i+EYTnyYjjvhni8lDxP8eVeyDUnLKBq0tT34EKxkW3Ej/i1+t6jBiCVMp6cpYK9cPKhoJNwOmTrXl
	CChcOud43yst2lnpt4RN7aHTpsWnuB0F44kzMQMJnu2prbXXgoLQ4XY+OFQ2h4FM2eEjzos/vmId8
	4UrmP35g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7hO-0000000625d-2uWH;
	Fri, 09 Oct 2026 10:19:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7hL-0000000624p-0FUN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:19:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DF611570;
	Fri,  9 Oct 2026 03:19:25 -0700 (PDT)
Received: from [10.0.152.148] (e121487-lin.cambridge.arm.com [10.0.152.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 175DA3F66F;
	Fri,  9 Oct 2026 03:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791541168; bh=0uVZyrSFbnCmq47O9I86ihSpiigxgO/1CIG2YpZmSJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oo1qP3xCOPVzdsZY5Bu3Nj7H0Fu17aqZj0jg5Q30YOLcT2xf+jNt2pkortidfLyJs
	 Ggy36Voo+Y2Z6rPUjJ3ghqkXcOpqL/XbzVllM4n6g2U9cLILoJ7hn/wFgWAYcr0cfg
	 FmeDxZ8JvqMbSLasm3Y5l53OENbRF5XOl6uyVrww=
Message-ID: <cf5ad22c-31b2-4076-8d69-3be4fc4c72e5@arm.com>
Date: Fri, 9 Oct 2026 11:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: insn: remove deprecated memory barrier types
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi
 <vsethi@nvidia.com>, Tejun Heo <tj@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Lucas Wei <lucaswei@google.com>, Barry Song <baohua@kernel.org>,
 Oliver Upton <oupton@kernel.org>
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
 <20260928133034.243541-2-ada.coupriediaz@arm.com>
 <dc663e58-b366-4f97-a260-0aff278f2f6f@arm.com>
 <a163f846-dbc3-4077-ab9c-a17d31656af2@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <a163f846-dbc3-4077-ab9c-a17d31656af2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_031931_323754_7B387CF0 
X-CRM114-Status: GOOD (  22.99  )
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

Hi Ada,

On 10/7/26 18:05, Ada Couprie Diaz wrote:
> Hi Vladimir,
> 
> On 07/10/2026 07:21, Vladimir Murzin wrote:
>> Hi Ada,
>>
>> On 9/28/26 14:30, Ada Couprie Diaz wrote:
>>> Arm ARM DDI 0487 version M.c[0] deprecated a number of types
>>> used as options for the DMB and DSB instructions, with no change
>>> in behaviour.
>>> The deprecated types are not used in the kernel, so remove them
>>> from our instruction generation framework and add the missing
>>> `AARCH64_INSN_MB_OSH` case in `__get_barrier_crm_val()`.
>>>
>> Arm ARM says that OSH has the same behaviour as SY, so I'd assume
>> any user of OSH should be fine to upgrade to SY, no?
> 
> As you mention below, OSH is _technically_ not deprecated for DSB, so I think
> it would make sense to add it for completion.
> Though, given that it is indeed equivalent I can see the argument for leaving it.
> 

Ahh, missed that. I think if we go for inlining barrier encodings into 
aarch64_insn_gen_d{m,s}b() then we can keep OSH for completion.

> I initially wanted to silently convert deprecated encodings to SY and co.,
> Mark was against the idea but I guess it could be OK just not providing them.
> 
>>> This simplifies the switch-case and now covers all the enum types,
>>> which allows for making the DSB and DMB generation non instrumentable
>>> in a follow-up commit.
>>>
>>> [0]: https://support.arm.com/documentation/ddi0487/mc/
>>>       (See C6.2.150, C6.2.152)
>>>
>>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>> ---
>>>   arch/arm64/include/asm/insn.h |  6 ------
>>>   arch/arm64/lib/insn.c         | 10 ++--------
>>>   2 files changed, 2 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
>>> index 1ce75a4426387..8ec9d86cc575c 100644
>>> --- a/arch/arm64/include/asm/insn.h
>>> +++ b/arch/arm64/include/asm/insn.h
>>> @@ -302,14 +302,8 @@ enum aarch64_insn_mb_type {
>>>       AARCH64_INSN_MB_ST,
>>>       AARCH64_INSN_MB_LD,
>>>       AARCH64_INSN_MB_ISH,
>>> -    AARCH64_INSN_MB_ISHST,
>>> -    AARCH64_INSN_MB_ISHLD,
>>>       AARCH64_INSN_MB_NSH,
>>> -    AARCH64_INSN_MB_NSHST,
>>> -    AARCH64_INSN_MB_NSHLD,
>>>       AARCH64_INSN_MB_OSH,
>>> -    AARCH64_INSN_MB_OSHST,
>>> -    AARCH64_INSN_MB_OSHLD,
>>>   };
>>>     #define    __AARCH64_INSN_FUNCS(abbr, mask, val)                \
>>> diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
>>> index e70ac02385153..c70820d65805f 100644
>>> --- a/arch/arm64/lib/insn.c
>>> +++ b/arch/arm64/lib/insn.c
>>> @@ -1572,16 +1572,10 @@ static u32 __get_barrier_crm_val(enum aarch64_insn_mb_type type)
>>>           return 0xd;
>>>       case AARCH64_INSN_MB_ISH:
>>>           return 0xb;
>>> -    case AARCH64_INSN_MB_ISHST:
>>> -        return 0xa;
>>> -    case AARCH64_INSN_MB_ISHLD:
>>> -        return 0x9;
>>>       case AARCH64_INSN_MB_NSH:
>>>           return 0x7;
>>> -    case AARCH64_INSN_MB_NSHST:
>>> -        return 0x6;
>>> -    case AARCH64_INSN_MB_NSHLD:
>>> -        return 0x5;
>>> +    case AARCH64_INSN_MB_OSH:
>>> +        return 0x3;
>>>       default:
>>>           pr_err("%s: unknown barrier type %d\n", __func__, type);
>>>           return AARCH64_BREAK_FAULT;
>>> -- 2.43.0
>>>
>> It looks like NSH, ISH and OSH applies to DSB and deprecated in case of DMB
>> which is slightly confusing. Given that we drop bunch of encodings perhaps we
>> can inline logic in aarch64_insn_gen_d{m,s}b()?
> 
> Yeah I can see an argument for that, I'm not against it and it probably makes
> the error handling in patch 2 a bit cleaner...
> 

Happy to take a look!

Thanks!

>> Cheers
>> Vladimir
> Thanks for the comments !
> Kind regards,
> Ada


