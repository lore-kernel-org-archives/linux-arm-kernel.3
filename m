Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ACFC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fkKX/+jmAY5EI28pxMDSbALm6PmjD/WT98j0aaxzD8Y=; b=q/Pvx9KoPc62mf
	UUDJpkegSsv055o2COnAndvC9N9XrfIkfEnCMKZWhACz2UDm8EwCc2y/qwjVsnidx3+16QE5SlOOz
	gZZrbFArbsCdPCkWNlT+icoajPfVmyxFEvUFPREYAGvnWi3nxX9EWCDayywzIlndSJ1mopfJN2Zzj
	O0e/Ahh4KX4bgYDClfUtUbcJt5s2n86UpFL4CNJQYjBHVMq42E6bXJDdpPYaff0Jd5YmDG1kEu6zR
	ZvqoBvCBXawHfIKdtYbhA2tSreVvZNLjStRYHAsNqdxGsyI4cMFN4pe4oP1DGvIkdFMoxFd+v2/JY
	fPxuCP1j8BIFRFx8Vi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZt-00000004FzS-1Sfa;
	Tue, 24 Jun 2025 00:31:57 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlr5-00000003gIx-3prn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 18:25:21 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-86a5def8869so838024139f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750703118; x=1751307918; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkKX/+jmAY5EI28pxMDSbALm6PmjD/WT98j0aaxzD8Y=;
        b=AeiMjVTHVhDltPObfiwuo1IaOcgYI2wCYD/HLZTNaQwVxqGbeP1CilT9czHfPOb+81
         qRcGr5u7ogbXflSV/kT9Hifj7r34n+RC+sJqM9Ko6Yg+vQOxOBhQDfYqVAX4h3cOWbj5
         +z8MuzOztx4VYclN6tVrz9zoL5rPRckRdYBjKGX8wMGWujqHCly6DfU5pcKgnLnRWrJP
         aOqFGDF6krTn2UCi3D/1cReSDQdw/olzqE0gnB+LvslMz++vGXIIcopV2ipj6X0jXWIG
         nfPrOmC/JeF3U7WVj1sSSvItUiD40GwcD8KsKwoldq72VTbcpZEziHMSqijNkguVEcRM
         IiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750703118; x=1751307918;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkKX/+jmAY5EI28pxMDSbALm6PmjD/WT98j0aaxzD8Y=;
        b=HUpry6MgseuLH0wximI+yvcLNt6brOto+1hpehfGaIciOAVwF9BhBWHwlF9zlXzGlz
         1wuI4bdGmdSKFWAfe01SarGCS2jVhw8VnsyGpHkMuCJFlkY7mF4b0NNax+qcRAwDbjnL
         W/vJcTAUh3AXzIbFBWea9mJ3tdzjjJj0588z1YQawb+7VULUsbZkmiXG4NcWn3oU9cSQ
         Pwy8kVo2ycUJ6vk6ZPw7T0vIYW3EeCWRqkN2WrjW+oaGA9CeFrXvKdoryAvOH7HEUHVR
         t9zA3RY8lEh0gaR2WxzhtDsbrhDLQfYzo9N/pCGq8C9T6Ppr/ft2vq5EYUKMIUsVZPuD
         KIxA==
X-Forwarded-Encrypted: i=1; AJvYcCUyi5l2HQT5RjZ8xowSIu2vMHrc2RFd/TRLLXcLR6/JigQIRK49aUuz6djhNmjJa0q9xca7EmZKHIzhGncHpv1o@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz016TgPeLVEnzXaEmH+l6MoGtcznaRJ70pCqrGMVRDboLxjUI
	CO2BNnkdNhEEuu8LBj4ML9kgo8SyG054Zp1WDoj6gpUhwH+FaKGH6mO3oss5siG/VPQFxCGn2Is
	qXOyzq4/FFzjmMDPG54d7CP0YiA==
X-Google-Smtp-Source: AGHT+IGzBE7m3jRf0szvIWMcwTlET+uxa4mEBdZ8JNu6pA3Bo/Yc8zZA87zzxM+0+5qc5CYD+m3kIHDI/60f4MKLBA==
X-Received: from jay12.prod.google.com ([2002:a05:6638:c2dc:b0:4f0:9e8b:e246])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1806:b0:3de:1200:219f with SMTP id e9e14a558f8ab-3de38cda633mr149171615ab.22.1750703118062;
 Mon, 23 Jun 2025 11:25:18 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:25:16 +0000
In-Reply-To: <aFYAq7GcSx4pTK9Y@linux.dev> (message from Oliver Upton on Fri,
 20 Jun 2025 17:45:31 -0700)
Mime-Version: 1.0
Message-ID: <gsntsejq9uyb.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 03/23] arm64: cpufeature: Add cpucap for PMICNTR
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
X-CRM114-CacheID: sfid-20250623_112519_960031_444D04E5 
X-CRM114-Status: GOOD (  14.23  )
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

Hi Oliver. Thanks for review.

Oliver Upton <oliver.upton@linux.dev> writes:

> On Fri, Jun 20, 2025 at 10:13:03PM +0000, Colton Lewis wrote:
>> Add a cpucap for FEAT_PMUv3_PMICNTR, meaning there is a dedicated
>> instruction counter as well as the cycle counter.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> I don't see this capability being used in this series.

> Thanks,
> Oliver

You are correct it isn't now. I'll take it out.

>> ---
>>   arch/arm64/kernel/cpufeature.c | 7 +++++++
>>   arch/arm64/tools/cpucaps       | 1 +
>>   2 files changed, 8 insertions(+)

>> diff --git a/arch/arm64/kernel/cpufeature.c  
>> b/arch/arm64/kernel/cpufeature.c
>> index 278294fdc97d..85dea9714928 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2904,6 +2904,13 @@ static const struct arm64_cpu_capabilities  
>> arm64_features[] = {
>>   		.matches = has_cpuid_feature,
>>   		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
>>   	},
>> +	{
>> +		.desc = "PMU Dedicated Instruction Counter",
>> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
>> +		.capability = ARM64_HAS_PMICNTR,
>> +		.matches = has_cpuid_feature,
>> +		ARM64_CPUID_FIELDS(ID_AA64DFR1_EL1, PMICNTR, IMP)
>> +	},
>>   #ifdef CONFIG_ARM64_SME
>>   	{
>>   		.desc = "Scalable Matrix Extension",
>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>> index 5b196ba21629..6dd72fcdd612 100644
>> --- a/arch/arm64/tools/cpucaps
>> +++ b/arch/arm64/tools/cpucaps
>> @@ -47,6 +47,7 @@ HAS_LSE_ATOMICS
>>   HAS_MOPS
>>   HAS_NESTED_VIRT
>>   HAS_PAN
>> +HAS_PMICNTR
>>   HAS_PMUV3
>>   HAS_S1PIE
>>   HAS_S1POE
>> --
>> 2.50.0.714.g196bf9f422-goog


