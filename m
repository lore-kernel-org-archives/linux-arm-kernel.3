Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C77AC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 22:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=j/9FFTs3Hz/7yNjDy98C2EAojjbwb0TEz5q962JZJd0=; b=Ha5xSX9qICM/KH
	30qPaYk61gQGFrR9Yfb49zjwx4M5hsLePjFgfvoP2fJZbyOD1B/90u2jtc2fTUoYiRQ8tqumNHVAQ
	ksyV2PIzJSv7PldjYR4qbuyJRtSGeyXhI24WgYsgGEQq2TiA+nm1lF3DnZuCLcEMuWcLsplDrcYw4
	6smpIUGPIW1IU+uVI6JuMSqwa9lwjjEhrgO2NUNrKFb0x+Leec2k9fY1bE8OcUUPDLPQT0Ee/wuV8
	xuX1sC/9s4ugYPNcC0lFgsBOOz62klHnnoKkDXT/FRKD3zFvXDy/2yEHfj7x6jJ68Erg0R91N/qO7
	I6GfCQPD8o+P4Dl4cMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGvx-00000006oOt-2uOx;
	Tue, 08 Jul 2025 22:37:05 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGtb-00000006oB8-06rX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:34:40 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ddbec809acso54958855ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 15:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752014077; x=1752618877; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/9FFTs3Hz/7yNjDy98C2EAojjbwb0TEz5q962JZJd0=;
        b=ymRQANTR6jY0Riu7jOhCuXTZQb94dxVcJcorRA+agZ3Ca1Ad0C8xw1sficl0cXmbvr
         DhEjj+sWHm2x9904JKu4hwN7E70YfbiXnaAgmAl9M6lfH4ZsjB+djOtI0wDJ1m8ygdYz
         4OgBYLNnrLgriD/GBCd99m7qsFqevBl362L8Oy4DInqRwpAhl0A3h1e1nVd8S50berZh
         Mox1MebosppOR9pAg+k4FIekMZBIC2fZjKAaVG5WmSqn/4akoeNUO916lewQiBHZGvL1
         JvyZtb8mXC6wYaWoxyldOkjIXnXw0+IDxU7TOont+oECDt8pTDaepLepBCCsYCtOY0DO
         qmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752014077; x=1752618877;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/9FFTs3Hz/7yNjDy98C2EAojjbwb0TEz5q962JZJd0=;
        b=jnigUvj868zbw0Zj1ZIg4GNx6iWEpayYwQB3ystt5x5xlzQsy/O/CaitqjPecwZw0A
         Jlu4p0fNKcZisiKRfuPLxDRA+/cefEap2JqFXvpkYZcKPxpTOzTxS2lFJRKATVedAuqu
         PPdDYPaPM4lyq+M5FQ5ka1YIAWK8Vmw0rWv2eWOTr1VHnpTuuNCBcwseHOA/03xKQmil
         dP4LKxygYoAd7VbQjvubS6lmVyq0NNvbfKpnN2CxxQqI/132Gctw8c3IfE+xoDDtcOm4
         +7qkDwpZ6qjU9m2SOIipQ6aUedi7+fl7LbAluPXBr/ffIzr8W65Z+3wBgls2CQq4c/P6
         3QRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi6mnETJUhZ0IVTsSnDavEm7IGGiCVbOcIARL/rTU3IaNpTGk0wQkXDS6Siq4pAcbv0EMTGwRlF/3XBCjrWSvg@lists.infradead.org
X-Gm-Message-State: AOJu0YxMHZeE55Q+vM+NTkBw0ZBnoaIU8r+UkcIB3Oxrlb4kIh15zPg9
	12meaBmrpF979odfTDMx6c+RODs2KtQxGDq4kziFuxUClJ0lZrch1Y+5kK9JbENmQYHx3MAICFW
	owhaNuYmxxlD+ow9O/62UnuR40Q==
X-Google-Smtp-Source: AGHT+IHW+RfduRT7VliGk050iQEqjU318xPGArkYZW5dZzAyyRBuwQAaT6oV8zuk0wkHYQ4WnuckwA/hmtfDS9hyaw==
X-Received: from ilfg10.prod.google.com ([2002:a05:6e02:198a:b0:3df:30df:d2c4])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:339f:b0:3e0:4564:4ef9 with SMTP id e9e14a558f8ab-3e166ffbeb5mr5390855ab.4.1752014077049;
 Tue, 08 Jul 2025 15:34:37 -0700 (PDT)
Date: Tue, 08 Jul 2025 22:34:35 +0000
In-Reply-To: <aGvwLIAN8rhxtA_V@J2N7QTR9R3> (message from Mark Rutland on Mon,
 7 Jul 2025 17:05:00 +0100)
Mime-Version: 1.0
Message-ID: <gsnt34b61fd0.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 01/22] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_153439_067701_BA8F0859 
X-CRM114-Status: GOOD (  18.02  )
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

Mark Rutland <mark.rutland@arm.com> writes:

> On Thu, Jun 26, 2025 at 08:04:37PM +0000, Colton Lewis wrote:
>> Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
>> counters reserved for the guest.

>> This required changing HPMN0 to an UnsignedEnum in tools/sysreg
>> because otherwise not all the appropriate macros are generated to add
>> it to arm64_cpu_capabilities_arm64_features.

> I agree it's appropriate to mark ID_AA64DFR0_EL1.HPMN0 as an
> UnsignedEnum. It follows the usual ID scheme per ARM DDI 0487 L.a
> section D24.1.3, and zero means not present, so it must be unsigned.

> Likewise, the value renames (UNPREDICTABLE => NI and DEF => IMP) look
> fine to me.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> I have one minor nit below, but either way:

> Acked-by: Mark Rutland <mark.rutland@arm.com>

Thank you Mark

>> ---
>>   arch/arm64/kernel/cpufeature.c | 8 ++++++++
>>   arch/arm64/tools/cpucaps       | 1 +
>>   arch/arm64/tools/sysreg        | 6 +++---
>>   3 files changed, 12 insertions(+), 3 deletions(-)

>> diff --git a/arch/arm64/kernel/cpufeature.c  
>> b/arch/arm64/kernel/cpufeature.c
>> index b34044e20128..73a7dac4b6f6 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -548,6 +548,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
>>   };

>>   static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
>>   	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
>>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
>>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
>> @@ -2896,6 +2897,13 @@ static const struct arm64_cpu_capabilities  
>> arm64_features[] = {
>>   		.matches = has_cpuid_feature,
>>   		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
>>   	},
>> +	{
>> +		.desc = "FEAT_HPMN0",

> Minor nit, but we can drop the "FEAT_" prefix here, for consistency with
> other features (e.g. E0PD, FPMR).

> Mark.

Will do.

>> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
>> +		.capability = ARM64_HAS_HPMN0,
>> +		.matches = has_cpuid_feature,
>> +		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
>> +	},
>>   #ifdef CONFIG_ARM64_SME
>>   	{
>>   		.desc = "Scalable Matrix Extension",
>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>> index 10effd4cff6b..5b196ba21629 100644
>> --- a/arch/arm64/tools/cpucaps
>> +++ b/arch/arm64/tools/cpucaps
>> @@ -39,6 +39,7 @@ HAS_GIC_CPUIF_SYSREGS
>>   HAS_GIC_PRIO_MASKING
>>   HAS_GIC_PRIO_RELAXED_SYNC
>>   HAS_HCR_NV1
>> +HAS_HPMN0
>>   HAS_HCX
>>   HAS_LDAPR
>>   HAS_LPA2
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index 8a8cf6874298..d29742481754 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -1531,9 +1531,9 @@ EndEnum
>>   EndSysreg

>>   Sysreg	ID_AA64DFR0_EL1	3	0	0	5	0
>> -Enum	63:60	HPMN0
>> -	0b0000	UNPREDICTABLE
>> -	0b0001	DEF
>> +UnsignedEnum	63:60	HPMN0
>> +	0b0000	NI
>> +	0b0001	IMP
>>   EndEnum
>>   UnsignedEnum	59:56	ExtTrcBuff
>>   	0b0000	NI
>> --
>> 2.50.0.727.gbf7dc18ff4-goog


