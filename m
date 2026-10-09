Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FE2CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UxhisKV3D4rWlk6UMHttXIL2bC6ip/caHIOIsx4Vx4=; b=Apo4EvGMmNabB1tn6vfyN66294
	Y3fXbFaVu4f7r4RZZxYSdirTKM6mzfwNCgjwZuC9k2G1VXJDm7ghdJCGB9cf626kyaH71WbAG5EdL
	9jBlddS2DFOUAbscamo5cc1VnfyLYiXlrhZtgqsc/66BumlhWZmbL9S+R2+hS7f94yYYABO93Y/7Q
	Cwldd6/9UTAePdRbsQFrVFPUqJVWOLRyP73KHv4iru/+OBTTidoKYxSUAZ6LIGi0rC3j7P9Fzx3pS
	a870rHg4oZn1+r7KsCRGmSPdywfIsREy4wGDLPczdnELwAI9WEgIGv14iBtS9l5h8lqM0RnwDKQFq
	q7quRDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6h0-00000005tde-3ZUX;
	Fri, 09 Oct 2026 09:15:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6gy-00000005tcB-0von
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:15:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 289DD152B;
	Fri,  9 Oct 2026 02:14:57 -0700 (PDT)
Received: from [10.0.152.148] (e121487-lin.cambridge.arm.com [10.0.152.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8960A3F8C6;
	Fri,  9 Oct 2026 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791537300; bh=DeExzBDPCQUXF+bF0bzFQ7IT76pjAEPD8Y/YY6aChsM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WaguH3KFD1XckCpLL4CCgDnYsWbLkSxeC069aelsMg0P27cvDKcU5qcBqciUqzViA
	 KM7thFDIsDhB8/0d40Sk21Zm2+7dfANHTfI21ABK1MQwSEd7Y+JvHfHeLo1rprFJsz
	 Op31scA+owLtCgCL4uAAbVA2o3cNDpMJv/3BwJkY=
Message-ID: <7d1ab507-ef5d-491f-acbf-0a57f2a31dab@arm.com>
Date: Fri, 9 Oct 2026 10:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: insn: operate on MSR/MRS sysreg field via
 defines
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
 <20260928133034.243541-6-ada.coupriediaz@arm.com>
 <f0acf203-2cb4-4cda-8e12-c45d02d7499e@arm.com>
 <76f25bff-4f5c-4234-ab8b-c5f96deea9c2@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <76f25bff-4f5c-4234-ab8b-c5f96deea9c2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_021504_443471_5C6E70BD 
X-CRM114-Status: GOOD (  20.71  )
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

On 10/7/26 17:31, Ada Couprie Diaz wrote:
> Hi Vladimir,
> 
> On 07/10/2026 07:53, Vladimir Murzin wrote:
>> Hi Ada,
>>
>> On 9/28/26 14:30, Ada Couprie Diaz wrote:
>>> Replace the few instances of hard-coded system register offset and masks
>>> used to operate on MSR/MRS instructions with defines.
>>> This will allow re-use in future commits while making the connection
>>> between those values more explicit.
>>>
>>> While we are here, mark `aarch64_insn_extract_system_reg()` `noinstr`
>>> so it can be safe to use in alternative pacthing callbacks.
>>>
>>> Changing the mask used in `aarch64_insn_gen_mrs()` to exclude
>>> the lower bits does not change behaviour,
>>> as `aarch64_insn_encode_register()` already clears the bits
>>> used to encode the target register.
>>>
>>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>> ---
>>>   arch/arm64/include/asm/insn.h | 3 +++
>>>   arch/arm64/lib/insn.c         | 8 ++++----
>>>   2 files changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
>>> index 40f13d28a5fd7..03620f67a3e47 100644
>>> --- a/arch/arm64/include/asm/insn.h
>>> +++ b/arch/arm64/include/asm/insn.h
>>> @@ -753,6 +753,9 @@ static __always_inline u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
>>>       return insn;
>>>   }
>>>   +#define AARCH64_INSN_SYSREG_OFFSET    5
>>> +#define AARCH64_INSN_SYSREG_MASK    GENMASK(19, 5)
>>> +
>> Sashiko has raised comment [1]
>>
>> | Does this mask unintentionally exclude bit 20?
>> | The previous hardcoded mask was 0x1FFFE0, which is equivalent to
>> | GENMASK(20, 5) and includes 16 bits. Defining it as GENMASK(19, 5) yields
>> | a 15-bit mask.
>>
>> [1] https://sashiko.dev/#/patchset/20260928133034.243541-1-ada.coupriediaz%40arm.com
>>
>> Cheers
>> Vladimir
> 
> Thanks for bringing the report up, it does raise an interesting issue.
> 
> This does change the mask used and does indeed change the returned value,
> potentially breaking comparisons to the return value of `aarch64_insn_extract_system_reg()`. However, the existing mask is incorrect as far as I can tell : the function is supposed to extract the Op and CR corresponding to the system registers of the MSR/MRS instructions. Those fields are encoded in bits 19-5, which corresponds to the GENMASK I used. I think it would make more sense to fix the `enum aarch64_insn_special_register` values to represent the registers properly and drop bit 20, which is 1 in all cases anyway... I would be happy to send a quick v2 with this change ! Thanks for bringing it up, Kind regards Ada
> 

Make sense, please send it as separate change. AFAICS, it should not affect bpf
folk, but worth making them aware ;)

Thanks
Vladimir

