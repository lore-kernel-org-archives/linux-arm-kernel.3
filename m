Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388BFC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 03:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8cBtavqwoj0Dfsn1SH3McNU+r0/YgR/+XFrRVKWytE=; b=bIwp1hpxu8KLC34Buby4l9yDiY
	khsfqIAgIua+MfE6T1ECqZYeSRBEFMMTP3eh1JGNks4CTj1viPNq/5FSRDlfAXxQxy1JsaVUmpsPx
	IwR4u/Ya0MJ5rU6F6L4ZN3yYuQZN9Mym5k1lT7nUkNVjozWANIyBCX3Jmmf8Ui3CjwxIjJliblrow
	Fxh25t4oKiXmSrVB2uLlA0QGvX8cBmFpSfpf0tniKsGKuOOraSSSV3KPweEYQVjyRYLneROhtiaTE
	4S/NXl8O4+TC3u0OvHl2X++hdOy0uU016lyAXVhPYVlkh7V9Dd+kyKC/tzfCQBj5ghF/g2ioDZ+KN
	uV5JsJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN16q-0000000Eda7-2xEe;
	Thu, 05 Jun 2025 03:17:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN14j-0000000EdTB-3mXy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 03:15:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4BD8169C;
	Wed,  4 Jun 2025 20:15:10 -0700 (PDT)
Received: from [10.164.18.47] (a077893.blr.arm.com [10.164.18.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B84E83F59E;
	Wed,  4 Jun 2025 20:15:26 -0700 (PDT)
Message-ID: <18ecc087-d5bd-4e98-9543-a6dcbf3e8c11@arm.com>
Date: Thu, 5 Jun 2025 08:45:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-wrapper] aarch64: Enable access into FEAT_SPE_FDS register
 from EL2 and below
To: James Clark <james.clark@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
References: <20250604114604.629782-1-anshuman.khandual@arm.com>
 <189edea6-49d8-4829-88ce-fa75d83401d6@linaro.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <189edea6-49d8-4829-88ce-fa75d83401d6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_201530_032173_309DDB82 
X-CRM114-Status: GOOD (  21.16  )
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



On 6/4/25 17:27, James Clark wrote:
> 
> 
> On 04/06/2025 12:46 pm, Anshuman Khandual wrote:
>> FEAT_SPE_FDS adds system register PMSDSFR_EL1. But accessing that system
>> register from EL2 and below exception levels, will trap into EL3 unless
>> MDCR_EL3.EnPMS3 is set.
>>
>> Enable access to FEAT_SPE_FDS registers when they are implemented.
>>
>> Cc: James Clark <james.clark@linaro.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   arch/aarch64/include/asm/cpu.h | 4 ++++
>>   arch/aarch64/init.c            | 3 +++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
>> index 2b3a659..ac50474 100644
>> --- a/arch/aarch64/include/asm/cpu.h
>> +++ b/arch/aarch64/include/asm/cpu.h
>> @@ -55,6 +55,7 @@
>>   #define MDCR_EL3_NSTB_NS_NOTRAP            (UL(3) << 24)
>>   #define MDCR_EL3_SBRBE_NOTRAP_NOPROHIBIT    (UL(3) << 32)
>>   #define MDCR_EL3_ENPMSN                BIT(36)
>> +#define MDCR_EL3_ENPMS3                BIT(42)
>>   #define MDCR_EL3_EBWE                BIT(43)
>>   #define MDCR_EL3_EnPM2                BIT(7)
>>   @@ -185,6 +186,9 @@
>>     #define SCTLR_EL1_CP15BEN    (1 << 5)
>>   +#define PMSIDR_EL1        s3_0_c9_c9_7
>> +#define PMSIDR_EL1_FDS        BIT(7)
>> +
>>   #ifdef KERNEL_32
>>   /*
>>    * When booting a 32-bit kernel, EL1 uses AArch32 and registers which are
>> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
>> index e1640a9..b6f740c 100644
>> --- a/arch/aarch64/init.c
>> +++ b/arch/aarch64/init.c
>> @@ -146,6 +146,9 @@ static void cpu_init_el3(void)
>>       if (mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 3)
>>           mdcr |= MDCR_EL3_ENPMSN;
>>   +    if (mrs_field(PMSIDR_EL1, FDS))
>> +        mdcr |= MDCR_EL3_ENPMS3;
>> +
> 
> You are only allowed to read PMSIDR if SPE is implemented otherwise it's undef so it needs another check.

The same is true for the earlier bit MDCR_EL3_ENPMSN as well. FEAT_SPE_FnE should
have been checked from PMSIDR_EL1.FnE but the feature is guaranteed to be present
when FEAT_SPEv1p2 is present. Hence PMSVER >= 3 check alone is sufficient here.

But for for FEAT_SPE_FDS feature, ARM DDI 0487 L.A is not very much clear on its
dependency for FEAT_SPE and its versions. It says the following but not the other
way around.

"If FEAT_SPE_FDS is implemented, then FEAT_SPEv1p4 is implemented"

Even PMSIDR_EL1.FDS field is valid only when FEAT_SPEv1p4 is implemented. Hence
you are right - we need to check both before enabling MDCR_EL3_ENPMS3.

        if ((mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 5) &&
            (mrs_field(PMSIDR_EL1, FDS)))
                        mdcr |= MDCR_EL3_ENPMS3;

> 
> It would be much easier to unconditionally set all the known MDCR bits. If the feature is implemented then setting them to 1 disables the traps, which we want, and if it's not implemented it does nothing which we also want.
> 
> Doing them all conditionally is quite error prone and extra work for nothing. In TFA it's already done unconditionally:

But leaving all MDCR_EL3 fields set when corresponding features are not implemented
goes against "don't set register fields when not required even when ignored in HW"
principle and hence might not be ideal.

But will leave it upto Mark and others. Dropping all these conditionality while
setting MDCR_EL3 fields will be a subsequent patch later as if changes existing
fields.

> 
> *
> * MDCR_EL3.EnPMSN (ARM v8.7) and MDCR_EL3.EnPMS3: Do not trap access to
> * PMSNEVFR_EL1 or PMSDSFR_EL1 register at NS-EL1 or NS-EL2 to EL3 if FEAT_SPEv1p2
> * or FEAT_SPE_FDS are implemented. Setting these bits to 1 doesn't have any
> * effect on it when the features aren't implemented.
> */
> mdcr_el3_val |= MDCR_NSPB(MDCR_NSPB_EL1) | MDCR_EnPMSN_BIT | MDCR_EnPMS3_BIT;
> 
>>       if (mrs_field(ID_AA64DFR0_EL1, TRACEBUFFER))
>>           mdcr |= MDCR_EL3_NSTB_NS_NOTRAP;
>>   
> 

