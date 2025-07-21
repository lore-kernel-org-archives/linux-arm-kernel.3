Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030B1C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2krLqXbrvL69zHTI+OSB0Sx07egWNgje2ekoJXV//wU=; b=JS5i21kiirHoq9
	LwfHlisgvn83NRdXjZBLmXgI9/fWrRyxbkLwQf7w/UE2JD2Zgv3JKvvvFUfRg6x5XmAhYyvporfg/
	XR1ZD8MOATDlyGh1nlUa7Cx7IGY+GIq2AUhqZvYQ4aml/BhW5c18RW/1SNbM4CYAzFnfnHzC80tM7
	xaUjcgxj7LwGScWMCDDDiK38aRWFe6BQDn5VwybVjPzicR0CujpQz1XiTd72B/13GDg0bnNdZ/qK7
	t/seoqAvBXZWIaNJ+SZfL9UDTeRh/1V1agt1H50Xf4uWPaYybWoH+cXA2ttedP9rkfzxQk7K4PMog
	iG/XLqaC6Ar6fuvMuFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvhs-00000000RlH-2KzA;
	Mon, 21 Jul 2025 18:57:48 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduoX-00000000Ng9-0aWs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 18:00:38 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86f4e2434b6so533186239f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753120835; x=1753725635; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2krLqXbrvL69zHTI+OSB0Sx07egWNgje2ekoJXV//wU=;
        b=ijce9q5gh7d/jEGXHecLOhmcW3EJezxHGvs77tswOeaYN+Q8qnnkOSHwGZcrJMQAZF
         Abm98y/JhPi6jLw7ogSTFRhVZDLDLI74wwU7dUmsiMV6ic3FIWNveBUwzxfV4VfZ0Xxg
         rEfdKyfUxSJAOOTLAnu1xLEpR3DK5hWoVlYFu6tTmNjVuhXtYL3csPcbRVVnpDCvZ3Ze
         q5r7IWmNmyMkGoe4PSCOtl6Mbr2sfMQkmaLSizCpkvbWOLFt0M5qiYusE3QrW6QHcQdh
         jkTef3FuOJce4weEcUjwIOaron62oGoAg8l7GjOMf5wc1pl3WVCRqOni84cr2chHMiVK
         dacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753120835; x=1753725635;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2krLqXbrvL69zHTI+OSB0Sx07egWNgje2ekoJXV//wU=;
        b=Ae2i4sQzhIulJj6dglgDdU79OiLn8zVGy8y1GQRnpM2oeBWlhYzMZU2vtw0qqfXgL5
         Arg1dynBZlF6s0ltITuf5yEsWnJWCO5M5+XPFWmo7I2EqGVi2KEi3G3mm3JgmXSvQzrC
         8SMukmJRhOb5zqFsuDR40yMwtZhjMU+eLb6qN82BnXpYHoqDRZCVPfpdnCTQag0u81pL
         3hNAZVC5/jpShQugQExikWbFO6mG18DfIOgTM5Y1J3ngWBO77vsAyS4IFzFvQkVvmrW9
         eB3hDzGxN8Z/YGXFd4ZmQ/UVZL+C+QwJRcxCo1GP4JynV6U60C+Hb1s7ZCgvXo6x9kMt
         zekw==
X-Forwarded-Encrypted: i=1; AJvYcCVrlv5Z0nqcaNzRQT+PwLOFCIZRSQ5jqcPYcLnShwmHWJAvKUHDDpQaGBjvfSUNetrJ54mvuT6diCuGhz9YhcWB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Ag0JE61XlHS/plg53fV+0V8yffK8c/DwMqdPR9xAGJoo4X1t
	zF1PaCsfhA+AvxSylb7UPFJW4ZMYp6FUjzZelAhdjxsOFJDg3+SS3k67isMmCekN1WdDXDpUrX9
	+q7gVRy3TAFDyFkUZnx4OR49uPg==
X-Google-Smtp-Source: AGHT+IEfZ2MrsGDQt2Apr+GHWZROOgLVqxxVZM8uTrkAEn6W6ybAfMfVvl1rXs9CqPRl3bXlJpF5OsombirkZgJ7Gg==
X-Received: from iobjk13.prod.google.com ([2002:a05:6602:720d:b0:87c:1d70:43be])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:2c0f:b0:86c:ee8b:c089 with SMTP id ca18e2360f4ac-879c291915bmr2390181339f.3.1753120835597;
 Mon, 21 Jul 2025 11:00:35 -0700 (PDT)
Date: Mon, 21 Jul 2025 18:00:34 +0000
In-Reply-To: <153b5191-c585-433e-9cf5-1ed19b9a7f5c@arm.com> (message from
 Suzuki K Poulose on Wed, 16 Jul 2025 00:22:16 +0100)
Mime-Version: 1.0
Message-ID: <gsntseipa0fx.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v4 01/23] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_110037_187276_5E5FB311 
X-CRM114-Status: GOOD (  17.55  )
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

Hi Suzuki. Thanks for the review.

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 14/07/2025 23:58, Colton Lewis wrote:
>> Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
>> counters reserved for the guest.

>> This required changing HPMN0 to an UnsignedEnum in tools/sysreg
>> because otherwise not all the appropriate macros are generated to add
>> it to arm64_cpu_capabilities_arm64_features.

>> Acked-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    arch/arm64/kernel/cpufeature.c | 8 ++++++++
>>    arch/arm64/tools/cpucaps       | 1 +
>>    arch/arm64/tools/sysreg        | 6 +++---
>>    3 files changed, 12 insertions(+), 3 deletions(-)

>> diff --git a/arch/arm64/kernel/cpufeature.c  
>> b/arch/arm64/kernel/cpufeature.c
>> index b34044e20128..f38d7b5294ec 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -548,6 +548,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
>>    };

>>    static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),

> This doesn't have to be FTR_STRICT. The kernel can deal with
> differences, by skipping to use HPMN0. We anyway rely on the
> system wide cap for using the feature.

Okay. I'll change it


> Otherwise,

> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>



Thanks
>>    	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
>>    	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
>>    	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
>> @@ -2896,6 +2897,13 @@ static const struct arm64_cpu_capabilities  
>> arm64_features[] = {
>>    		.matches = has_cpuid_feature,
>>    		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
>>    	},
>> +	{
>> +		.desc = "HPMN0",
>> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
>> +		.capability = ARM64_HAS_HPMN0,
>> +		.matches = has_cpuid_feature,
>> +		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
>> +	},
>>    #ifdef CONFIG_ARM64_SME
>>    	{
>>    		.desc = "Scalable Matrix Extension",
>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>> index 10effd4cff6b..5b196ba21629 100644
>> --- a/arch/arm64/tools/cpucaps
>> +++ b/arch/arm64/tools/cpucaps
>> @@ -39,6 +39,7 @@ HAS_GIC_CPUIF_SYSREGS
>>    HAS_GIC_PRIO_MASKING
>>    HAS_GIC_PRIO_RELAXED_SYNC
>>    HAS_HCR_NV1
>> +HAS_HPMN0
>>    HAS_HCX
>>    HAS_LDAPR
>>    HAS_LPA2
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index 8a8cf6874298..d29742481754 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -1531,9 +1531,9 @@ EndEnum
>>    EndSysreg

>>    Sysreg	ID_AA64DFR0_EL1	3	0	0	5	0
>> -Enum	63:60	HPMN0
>> -	0b0000	UNPREDICTABLE
>> -	0b0001	DEF
>> +UnsignedEnum	63:60	HPMN0
>> +	0b0000	NI
>> +	0b0001	IMP
>>    EndEnum
>>    UnsignedEnum	59:56	ExtTrcBuff
>>    	0b0000	NI

