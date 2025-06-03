Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA573C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTiUXP9qqpwePncWUOCrudvn6ikDCRoeniFYV5C54HQ=; b=RmR3/SwN/OX0NM92XGQLuZ7yyR
	usteLYYw3ikOy4HYfgfxfenomwSN39WP26llqrJndgDs8TD5PxAKbD8tX8f0rBe/Ho8C2V0gy9pCE
	td6OA/Z6Z/5LX1RzBHXm5WMXu5uQcPIO2B0fWGAKoPnPfUcdWqyjt8xjYnhdwMwtndE3kQbP8hzqG
	19mqub7KmlpXu+7u600tNdm+MuEukq3XGc7HB6b1AUhNuSS0N7mvafrBkdaWObfZHOOIXI9T0i/iX
	28uX0Lq/bnXL1f9acA2OEs7CL1mN8tXQXB0/wECPs0kXh7s7NWpHUeIbvg0zoahDtdw+x3H5bHmaq
	Uotee2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOLt-0000000AcfV-2Gb2;
	Tue, 03 Jun 2025 09:54:37 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOHr-0000000AbdW-3PIv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:50:28 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so2115775f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 02:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748944226; x=1749549026; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTiUXP9qqpwePncWUOCrudvn6ikDCRoeniFYV5C54HQ=;
        b=rQo3jRkpwfydcAQb6WR1fWC+YlmRwXjPFsnWS28U55Z1BYYTE2nholOLMz6JzYvRNz
         CDuSTxpvb9Mk7hs3Ey8oWBlJjl54M57X1k8ElCOtXLVDChJJZxV2C4Yp2bjQFlH2coJ3
         VMJ3MHeILE0VgL6d4GSs+3Ogm7ZLtbSdaXiqdSyNhw0KsUkx0+zIjLuQmL4gbLe7+v9b
         FtWZ4c6rwzNOe28mnegZRZkPTSLZbYRaFV+FRPDpiqdJsc8O9PlwA3TTmpJcYnZpDPqv
         pug7qmblU4jazHv8QuIJQ0Gd7PBqwsJXqk/57riiyiOV+kmMwDmRzvqZjp1o3N4OniGh
         P4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748944226; x=1749549026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTiUXP9qqpwePncWUOCrudvn6ikDCRoeniFYV5C54HQ=;
        b=FLQlVHPvvUJq3LlMEQBCfzO7Vy07cmMbdJyyVjSK3jKoibcRaIKoToJbLTAIqH6clt
         msw98akVvCmCWG4FgfjQcBPu4iCzc9A+CcrXr2LK79wMntB1hCF+kL83Z8ClhI1MMQ1H
         2dpoD61vrd4gKJAfwZ0ikqPquvWcwb9RzmnRutZHsGVvUPVZS0J7yNCyg7h/nicjG9Oe
         /beMKiZk/A8glYHazAdvKhNbPHFNAiC8RkKy1+meJnTlO601LMd9RmmpmZHGdQq7ZMWH
         L6aoBqME9n8jNawX/KvifyUPHEKnF6klVx2h1gsdesdTtAa2f4rHtZJEGB1F0xQlezlC
         crkA==
X-Forwarded-Encrypted: i=1; AJvYcCUj4TrfCPTIlIh8OPxq+yvr6W4qyVqqhd+00PZ034ChWNOAVtOK5DhEIENeTzqiTzVJadf8woEQ3ipTAw5C1PeV@lists.infradead.org
X-Gm-Message-State: AOJu0YwHphkQC9CPrKOT7w74CW0SLyzJRVQvVA3UQUxYVbDQGRXX8FrT
	ZCLkC5+AWTTs/hfh011lfGlXsH9mKqKbemjAIQv5k6vXLqCBiQK6osK3iOJ/fFPJJHc=
X-Gm-Gg: ASbGncs26bWemi/lscWDsRrfa/uNHm5iteGZZC+xAdxiiiTTEOXCDofa1N8BQ60M6Rm
	VXi2+VJH9sqlViCsmNU2GTtvIJ1y0wSrpOEuvg60ZVqla91htlo8OiTDvguY+1gACjSy1WiSiY7
	TKVn0obxVhY84DXJdiB4EzS681iPSxGpv+KD53SqoTzpgP9nI89kOZph3AJi/sqbh88ypiuhAij
	C513Q1CgzHccgPpPEU62gez5E2D27INNplZSAAzOwXXSBw1i5p01u0mFKeGaOvUfeVAfjEh/g16
	S4B59a6B75VKoIR/zvMQPsgVNT7dWEBijMt+SFRWuEgi6jwPiMsKohf+
X-Google-Smtp-Source: AGHT+IHsW44MmqwfDKjzghl/i3BzuGEINgERerQaDbyP3gu7SUf4muuyytvtJbMK7SPgP194SuthmQ==
X-Received: by 2002:a05:6000:2892:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a514502388mr1696065f8f.23.1748944225608;
        Tue, 03 Jun 2025 02:50:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c9d4sm17906246f8f.38.2025.06.03.02.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 02:50:25 -0700 (PDT)
Message-ID: <2fb1965b-bef9-4a8e-a1c7-c8a77d957b23@linaro.org>
Date: Tue, 3 Jun 2025 10:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] KVM: arm64: Add trap configs for PMSDSFR_EL1
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
 <20250529-james-perf-feat_spe_eft-v2-6-a01a9baad06a@linaro.org>
 <867c1ze4pg.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <867c1ze4pg.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_025027_884818_0CB7EBC3 
X-CRM114-Status: GOOD (  22.76  )
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



On 29/05/2025 5:56 pm, Marc Zyngier wrote:
> On Thu, 29 May 2025 12:30:27 +0100,
> James Clark <james.clark@linaro.org> wrote:
>>
>> SPE data source filtering (SPE_FEAT_FDS) adds a new register
>> PMSDSFR_EL1, add the trap configs for it.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/kvm/emulate-nested.c | 1 +
>>   arch/arm64/kvm/sys_regs.c       | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
>> index 0fcfcc0478f9..05d3e6b93ae9 100644
>> --- a/arch/arm64/kvm/emulate-nested.c
>> +++ b/arch/arm64/kvm/emulate-nested.c
>> @@ -1169,6 +1169,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
>>   	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
>>   	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
>>   	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
>> +	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
>>   	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
>>   	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
>>   	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 5dde9285afc8..9f544ac7b5a6 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -2956,6 +2956,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>>   	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
>>   	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
>>   	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
>> +	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
> 
> PMSDSFR_EL1 has an offset in the VNCR page (0x858), and must be
> described as such. This is equally true for a bunch of other
> SPE-related registers, so you might as well fix those while you're at
> it.
> 
> Thanks,
> 
> 	M.
> 

I got a bit stuck with what that would look like with registers that are 
only undef in case there was something that I missed, but do I just 
document the offsets?

+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -87,6 +87,8 @@
  #define VNCR_PMSICR_EL1         0x838
  #define VNCR_PMSIRR_EL1         0x840
  #define VNCR_PMSLATFR_EL1       0x848
+#define VNCR_PMSNEVFR_EL1       0x850
+#define VNCR_PMSDSFR_EL1        0x858

+++ b/arch/arm64/include/asm/kvm_host.h
@@ -596,6 +596,16 @@ enum vcpu_sysreg {
         VNCR(ICH_HCR_EL2),
         VNCR(ICH_VMCR_EL2),

+       /* SPE Registers */
+       VNCR(PMBLIMITR_EL1),
+       VNCR(PMBPTR_EL1),
+       VNCR(PMBSR_EL1),
+       VNCR(PMSCR_EL1),
+       VNCR(PMSEVFR_EL1),
+       VNCR(PMSICR_EL1),
+       VNCR(PMSIRR_EL1),
+       VNCR(PMSLATFR_EL1),


And then sys_reg_descs[] remain as "{ SYS_DESC(SYS_PMBLIMITR_EL1), 
undef_access }," rather than EL2_REG_VNCR() because we don't actually 
want to change to bad_vncr_trap()?

There are some other parts about fine grained traps and res0 bits for 
NV, but they all already look to be setup correctly. Except 
HDFGRTR2_EL2.nPMSDSFR_EL1, but it's inverted, none of the FGT2 traps are 
configured currently and PMSDSFR_EL1 is already trapped by MDCR_EL2 anyway.

Thanks
James


