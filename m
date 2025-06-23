Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E80AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=x/yRTajGyCYDVao/uBe3yoYTQK0CCPZeD6lCEoWPGDQ=; b=cF/ecUd9Ys/A/B
	gQB9OBRb/tSfH+FQeTEWRFoXNjj+J73kFhpgSekOy3WvriAInJ+E9pvJhGb+8KacUSor2poluAW74
	0Vvs5NLHlBcUQy0078uevxAm9RHpF7xZpx0iR3sqGzLzC+peEvGuma3CLGvWhMvknxtzozmSi6dwF
	3rv+crmaP2Tnbt323ZkRKsZnn58yPN5to2vOu1djlRYvcCEt0ADWe8jOzk0NV3R2nJzV/Q6M9YKfZ
	QH9m0xbz+6io563YCJRiD4JreQIbDRLgUjvbMOepIBymX3K+0TFqCzek2adXmngdOIoEIEn2kBzqk
	V1s/CgvpyIXwvwe8BxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZu-00000004G1c-2KSd;
	Tue, 24 Jun 2025 00:31:58 +0000
Received: from mail-il1-f202.google.com ([209.85.166.202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlrS-00000003gMb-09OG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 18:25:43 +0000
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3ddc9ee4794so66680115ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750703139; x=1751307939; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x/yRTajGyCYDVao/uBe3yoYTQK0CCPZeD6lCEoWPGDQ=;
        b=FnGTY28vfSmC0eQMLyRfrcP2lYlowgouAVqNsKg4+7Eh78qYVTmxImKseAQH7Hcns1
         gZtKmpKyK1esVE7TyEjDfT+L57ZP01jUAGmoAbyayrc3S/+GfPd/bL6rrwYSY+TgapYP
         ZGw2aBLeu5DodGcHFPeEJzN929QzboI+7smhfZUZEOVgD2OvwJZJGHaU2ct/oeJR67ji
         lCiJIp9lf8rjhMWVxOMeaXm1cCGcHDibPUcd7ZYyjRH0bqKxVX5cjq1DG/2qrigkjc+A
         7znNiqK3odMbyBTd8BtqqQ9utujsM6cOKLs5TFaEFDA941tReVGbGmDOQKktLFGJbwHK
         5PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750703139; x=1751307939;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/yRTajGyCYDVao/uBe3yoYTQK0CCPZeD6lCEoWPGDQ=;
        b=JaIrPFNzh1PEi5+glvEbbuFc1jS1okdOkusISIR3h2ikS62kghJMpWJLMda8g3oJ2b
         vFjQnahtC4p9aUmxX+9TGV8YyReftGAXxAIKvLQNmEMNbxMIPpnw65EQHrp0FPrnGtYt
         p5wwyjN87C6mYzsnVKJXdFxmshYGcZP40wkmgMKNRAdyEgvZV8dOK55jHit3C3orgpHk
         VUgwpscE7+C37ZBbWenrjihIe2vCFf7PR6VUAJXQ4IYBTnGc+F2shFEPeA9hNTk2Rw8Q
         xERUN7hUIL6Wpefws1YEbuPe814Eam7teuIlimgaU2Bk0Qza/472R1qSAz/Jx0gJ8mED
         E2VA==
X-Forwarded-Encrypted: i=1; AJvYcCVqOG61KBgL4Iy7UertxeYL4kOwYvJVq2nMAGjdz2GMD7+fdO4JMFTCJGM9VKYU0xZtqHQlSasMzdCFKuiEwpsC@lists.infradead.org
X-Gm-Message-State: AOJu0YwHkIkeVAtplOQt9kvpCbT4nODobr8gQyum0bu7+gRIi6lSZqe7
	d6FvmjaH2KKDjIEhuJ1u85zFHRm63qO6UO4CEhJ9xn/2LhcEJJIPJJG3az6KCFMe4ME88ct0l/X
	9midgYHWAGFIKQIpMw4s4+EOBEw==
X-Google-Smtp-Source: AGHT+IGB4/D8wn12ZeTFWeXtrV3NuVvtA1SOelvWAjyyu6UmZAX76nv7r6P9O4AsImXh2Otv+muKbiEPiY/O85sZZA==
X-Received: from ilbbr10.prod.google.com ([2002:a05:6e02:23ca:b0:3dd:7629:ec3a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:170d:b0:3dd:e7d6:18bb with SMTP id e9e14a558f8ab-3de38cbfd28mr144801735ab.17.1750703139323;
 Mon, 23 Jun 2025 11:25:39 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:25:38 +0000
In-Reply-To: <aFYAXjzICzgmSyLI@linux.dev> (message from Oliver Upton on Fri,
 20 Jun 2025 17:44:14 -0700)
Mime-Version: 1.0
Message-ID: <gsntqzza9uxp.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 01/23] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_112542_074086_C10C65DE 
X-CRM114-Status: GOOD (  15.90  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Fri, Jun 20, 2025 at 10:13:01PM +0000, Colton Lewis wrote:
>> Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
>> counters reserved for the guest.

>> This required changing HPMN0 to an UnsignedEnum in tools/sysreg
>> because otherwise not all the appropriate macros are generated to add
>> it to arm64_cpu_capabilities_arm64_features.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kernel/cpufeature.c | 8 ++++++++
>>   arch/arm64/tools/cpucaps       | 1 +
>>   arch/arm64/tools/sysreg        | 6 +++---
>>   3 files changed, 12 insertions(+), 3 deletions(-)

>> diff --git a/arch/arm64/kernel/cpufeature.c  
>> b/arch/arm64/kernel/cpufeature.c
>> index b34044e20128..278294fdc97d 100644
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
>> +		.desc = "Allow MDCR_EL2.HPMN = 0",

> This feedback still stands...

> 		.desc = "HPMN0",

> [*] https://lore.kernel.org/kvm/aD4ijUaSGm9b2g5H@linux.dev/

Sorry for ignoring your previous feedback. I looked at the other .desc
fields and they had more descriptive English, so I think this one should
be more than "FEAT_HPMN0" for consistency.

If you insist I'll change it.

>> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
>> +		.capability = ARM64_HAS_HPMN0,
>> +		.matches = has_cpuid_feature,
>> +		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
>> +	},
>>   #ifdef CONFIG_ARM64_SME
>>   	{
>>   		.desc = "Scalable Matrix Extension",

Here's one example.

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
>> 2.50.0.714.g196bf9f422-goog


