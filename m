Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C60C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 20:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3lsZMwRkh1UP98Tqde8+akeySm6v1iX6h0YAqQdmB3c=; b=Q9QjtT5wYGr4YE
	w9FVjkLCb+Mdei7Lmj+ZKKOMEdI6FrrEjYDXG+1EBrEnUVQsShNq5LQlTJz+1m2ABHcd5d9eK1f+n
	xsZXkEZly1vNOq45TMnCyt9bgqw05qQDCIM7T1GsrR6VgZa/l/LujA22ebBXdcXnhx9UAc8bOSh6g
	V6Eo/cdELPY7zUJjmfHiYeDN9hIzQv6aYAsiX1E2Q0UwZne7w29gx0niRkTt5RfX7YrRLDHj2T/rZ
	p/ejBBXD61T+p15VKBfguJMGgXxKelIPx8bEpTEZPgprIFycVX4z93K7QECruv/8iqacZdQU1FL6j
	Ci/pARjf8Mtkvy4Z3K1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYd5-0000000Bp48-04ps;
	Tue, 03 Jun 2025 20:53:03 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYad-0000000BoSv-1vmA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 20:50:32 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-86d122107a9so343754639f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 13:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748983829; x=1749588629; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3lsZMwRkh1UP98Tqde8+akeySm6v1iX6h0YAqQdmB3c=;
        b=4MPcrof6eiAhVQnKSkXD0Vda3vhUjR0kpV8R6i/lM10Z4riV2GAbCpWl/lTvP3pJaG
         GBsY2UMW0t4i3cnYlVOk58XIjvEShiAL3u6O0OQunUpO/I9iYc2wqk/3EYYa9Arusojv
         c4yxAwbAS3iDox1rLBr/exo7+xKfPEysukG3hsETVPIYcsv5wjiSDf8sQR0aD2+5lf7s
         VuQp8xO0pHO3ad4Vl416Qkq/0jUKQD3fOmAZS52qaIs0pG46MRFXM26ry+B3vr+rRKVZ
         VD3Kash2o18izfiuAbQgE+45HCLXag7s4ckzpCWriOpbA6sRE8/G/hFVYgaP6OMD3L1N
         jw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748983829; x=1749588629;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lsZMwRkh1UP98Tqde8+akeySm6v1iX6h0YAqQdmB3c=;
        b=iw2bKuyJPl5O0Askm7nvTBStpE/fzpeT0GhI2ELKbyKcJlkSLOkWGwIj1mvKpr+mAk
         3VKOm2nW8UKHGg8XPuIUVVXuphKtyu3DmfxTd7EvkyS+pvPndOpVccaI/pK9geLDbLiP
         kT+EKoIdRa0ap4B09AZOHAx7NK6M1dnSkLxVSMGS990h7rT+Y/1C36lpb29gkeeJ4zI+
         1PhVTze3CI1NXUtKn5xhZ4cbki89Edr/IQZHLCGwzEIuJzE8Qu06HfR173kEJpPTva9l
         K6iThH06SqF4tuMi6JtON4UWE66mpjRhB0ywvK6CkR5XfDDUYP9tEC3LLc7u+WUi6hDg
         hyvw==
X-Forwarded-Encrypted: i=1; AJvYcCUtHe90vz1vL7Q0GYZmROVWLRTLPIkps+T5bxwaa/97VX5P8wC6j7pCiMIjEsywiSUaTfcsoP1U6D8m5eKiwabZ@lists.infradead.org
X-Gm-Message-State: AOJu0YylkRF8Eo6ADYuKvu2ebEVsF2qBKGlf+ey6OCKnUYpK+l6e6r/X
	275dBxLYHnMasODr9/s64V2yrdB+RCtt7C/1CkyVhaOwYQyhj9PQdfgmi4nvps3215b8eKGML0v
	DNzefzcLnzZkSBC0GypmiY7HzEw==
X-Google-Smtp-Source: AGHT+IE8lcweOrXzv1dJ7JnXQujzAi86ZbFeivqiLkC8HSJs78PXh7Mwa8lRBkCmnRTpW9aZv5V6w/tu2G1Ilng5MA==
X-Received: from ilbbf2.prod.google.com ([2002:a05:6e02:3082:b0:3dd:a279:72c1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1807:b0:3dc:8b29:30bc with SMTP id e9e14a558f8ab-3ddbedbef4cmr5429525ab.21.1748983829547;
 Tue, 03 Jun 2025 13:50:29 -0700 (PDT)
Date: Tue, 03 Jun 2025 20:50:28 +0000
In-Reply-To: <aD4ijUaSGm9b2g5H@linux.dev> (message from Oliver Upton on Mon, 2
 Jun 2025 15:15:41 -0700)
Mime-Version: 1.0
Message-ID: <gsnt7c1s35yj.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 01/17] arm64: cpufeature: Add cpucap for HPMN0
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
X-CRM114-CacheID: sfid-20250603_135031_498778_05023718 
X-CRM114-Status: GOOD (  15.43  )
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

Hi Oliver. Thanks for the speedy response.

Oliver Upton <oliver.upton@linux.dev> writes:

> Hi Colton,

> On Mon, Jun 02, 2025 at 07:26:46PM +0000, Colton Lewis wrote:
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
>> index a3da020f1d1c..578eea321a60 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -541,6 +541,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
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
>> @@ -2884,6 +2885,13 @@ static const struct arm64_cpu_capabilities  
>> arm64_features[] = {
>>   		.matches = has_cpuid_feature,
>>   		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
>>   	},
>> +	{
>> +		.desc = "Hypervisor PMU Partitioning 0 Guest Counters",

> nit: just use the the FEAT_xxx name for the description (i.e. "HPMN0").

Okay

