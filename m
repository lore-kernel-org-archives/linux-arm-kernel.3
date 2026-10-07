Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D243CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 16:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dn31MxcyFp9XgkThfp9ufR5XFYUM2dKIRC6JYuSpzj4=; b=ENXldODJdTLtMw
	xZGyo7rvz45dlDafTS13EnV4CBHNUNsTyO9Xvk7WmYOQMWSup4EVHOjIxgEJSEkgT9DIhjI+wS4Mj
	8l8CiRYXJrHl8eOTJnnaIWIb0VSiYrrQqzLfjKWSP6BeOFfGJri3By4fYz/3cXvHMoHlynb3LTRib
	gaNjfIhY3npU7GbIE7MIWVMJKDp16HLgwlkT+ynVPmv2R0GJCmuePz61HUIIjyW5XJfMmw1kEe75o
	DPVwfT2bAZ7rkm/oLUH7jQCn3dJh8BI8Sg+og1TnW/HOHa9F3v+q/nM7rjwbALNEgudFGk2MPcVgr
	6ElKipDZmL7Wdx48qdLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEUYh-00000002lbz-1ytW;
	Wed, 07 Oct 2026 16:31:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEUYd-00000002lbE-2DFg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 16:31:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98DFC1595;
	Wed,  7 Oct 2026 09:31:50 -0700 (PDT)
Received: from [10.57.11.235] (unknown [10.57.11.235])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 647273F763;
	Wed,  7 Oct 2026 09:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791390713; bh=BKmQs0frWfzLNLKvPXEu9ewnuTjVNZlrRybFpOUsIo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GHnZvmElMYfQYElQtrt7FTImmNt+fZZeGqi6u62M4ldc7hmf68TBivzdNe3yc06b7
	 8dCeEU3FzHk+njLersdC0C3YroNLXRHt/ZzdqXtnXKJE7NpYtBOD0gZDpuAFeyZIvF
	 izjY/tvbz/b7ecREHPY8UMI4PGebMAqCTwPJIK3E=
Message-ID: <76f25bff-4f5c-4234-ab8b-c5f96deea9c2@arm.com>
Date: Wed, 7 Oct 2026 17:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: insn: operate on MSR/MRS sysreg field via
 defines
To: Vladimir Murzin <vladimir.murzin@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
 <20260928133034.243541-6-ada.coupriediaz@arm.com>
 <f0acf203-2cb4-4cda-8e12-c45d02d7499e@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <f0acf203-2cb4-4cda-8e12-c45d02d7499e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_093156_937268_DDC09AA9 
X-CRM114-Status: GOOD (  21.48  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Oliver Upton <oupton@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, James Morse <james.morse@arm.com>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Lucas Wei <lucaswei@google.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Vladimir,

On 07/10/2026 07:53, Vladimir Murzin wrote:
> Hi Ada,
>
> On 9/28/26 14:30, Ada Couprie Diaz wrote:
>> Replace the few instances of hard-coded system register offset and masks
>> used to operate on MSR/MRS instructions with defines.
>> This will allow re-use in future commits while making the connection
>> between those values more explicit.
>>
>> While we are here, mark `aarch64_insn_extract_system_reg()` `noinstr`
>> so it can be safe to use in alternative pacthing callbacks.
>>
>> Changing the mask used in `aarch64_insn_gen_mrs()` to exclude
>> the lower bits does not change behaviour,
>> as `aarch64_insn_encode_register()` already clears the bits
>> used to encode the target register.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> ---
>>   arch/arm64/include/asm/insn.h | 3 +++
>>   arch/arm64/lib/insn.c         | 8 ++++----
>>   2 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
>> index 40f13d28a5fd7..03620f67a3e47 100644
>> --- a/arch/arm64/include/asm/insn.h
>> +++ b/arch/arm64/include/asm/insn.h
>> @@ -753,6 +753,9 @@ static __always_inline u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
>>   	return insn;
>>   }
>>   
>> +#define AARCH64_INSN_SYSREG_OFFSET	5
>> +#define AARCH64_INSN_SYSREG_MASK	GENMASK(19, 5)
>> +
> Sashiko has raised comment [1]
>
> | Does this mask unintentionally exclude bit 20?
> | The previous hardcoded mask was 0x1FFFE0, which is equivalent to
> | GENMASK(20, 5) and includes 16 bits. Defining it as GENMASK(19, 5) yields
> | a 15-bit mask.
>
> [1] https://sashiko.dev/#/patchset/20260928133034.243541-1-ada.coupriediaz%40arm.com
>
> Cheers
> Vladimir

Thanks for bringing the report up, it does raise an interesting issue.

This does change the mask used and does indeed change the returned value,
potentially breaking comparisons to the return value of `aarch64_insn_extract_system_reg()`. However, the existing mask is 
incorrect as far as I can tell : the function is supposed to extract the 
Op and CR corresponding to the system registers of the MSR/MRS 
instructions. Those fields are encoded in bits 19-5, which corresponds 
to the GENMASK I used. I think it would make more sense to fix the `enum 
aarch64_insn_special_register` values to represent the registers 
properly and drop bit 20, which is 1 in all cases anyway... I would be 
happy to send a quick v2 with this change ! Thanks for bringing it up, 
Kind regards Ada


