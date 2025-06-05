Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C32BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcvdK+kUqsSYXK1dvlLkx29YE1Y4FdRzYsL+M29q+YQ=; b=Ky7Lz0U2bPb8QsK7nK1BgJSra3
	QZqX9YRbTiIRzZqrucQHp9YWChEI44B6kNx1mve7aY0jXhCh1Sl/vyAwq4hR5BmNsDxQ0VnDGN/8N
	B+Z4cFyOAqeipAnsZYTfhzwvrGiPPP90L0niEmUkVcvJUN6JcRvyQTUdGZOkolHktaCPrd+PGw/PJ
	0OaBG+rdLV1dkbCm9wUQFJougAZPlXi5ZNIgntCdolGQM4jR3Yl4JpN7Vb8ECvhyx3b6bXnvpkeve
	LtEfSHtAUB0ZyrS39Xyt7phoPaZ040YyI09X42j6yO9oGVKc6khXMlZSh9pL+O1+IokerNIUyd9Y2
	xUKqp9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7wj-0000000FGPt-0eTJ;
	Thu, 05 Jun 2025 10:35:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7uX-0000000FG47-0Iev
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:33:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so8617835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749119603; x=1749724403; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CcvdK+kUqsSYXK1dvlLkx29YE1Y4FdRzYsL+M29q+YQ=;
        b=wk/13x/rcyFNKQie1KV7hIvtV2IJEeVSyCJWc9+1/MD6jGeCz3P+qyJqfD0lJVfGWz
         Afc226IxVGLw6fQ+FavRfX7nhxpE4GXXyRLRX0/HRZ7RiSn1yAApNGK+3wexSWRw1B49
         AolK2UzkqXMtT30pJrdn6e0R65Zt24bgv4vGcH7Mj0Tq9w8wRasCn2LyXxdfuMymCXqb
         xFn5YspNsJEv7aEKs6gZuILHfzYBRG0UIjbUiuR9RZFo74RHFbn8Xe/h7bsdObSHDXHW
         s1T/6tXi9KbABU1wrvrZVAyjHaIB4e5VqiqwWeN7Oy+LcmwsfAf0SApXoyZFxqIZM1PR
         762g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119603; x=1749724403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CcvdK+kUqsSYXK1dvlLkx29YE1Y4FdRzYsL+M29q+YQ=;
        b=h+8CsHBU9RGU6JrWrBpM1Ca/k6+j4ixaWV5uIpPIec2BcwDERnNn/KYmMrCCRx8mVK
         bGgW9SI2c7UK/4vrvWSUDeO17ceY5xbANoTftzZr7c74DVhkWrb+sJY6eJPWhVhZ+zp0
         VsVrUeCScWkSoFAf/wcOqghxc6tplTEisAY4fcK3lCZFxEFhNLz54yYlejMMxQJ1+AgW
         ujIuu0qpIKIUHYM7UOzLGbecppLoS5bxiLn7GgZj2g/z+XY2dxzFdh2c6gwHpoOiE77x
         cqhkpOK4Q9lhX2b2w7cEivUJUUwpeaGNj8DyF7/UThvMfkJURu0+aMyScAWGJdwWe4V6
         Ju1w==
X-Forwarded-Encrypted: i=1; AJvYcCUtOGQn700FIPh29sLvows+ZuvFy0SHYyhMFKVTuR6pVWvLYqd5rxuyKs/SpX8jwl14ojaTPmkAe+/+kFqaDF3E@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5S3YSBCi9uTidVRqyYn5fsyudFIi3MXpJZ4L0Ozljr162ypi0
	4mmV/+ss4sMvIWoEi9SOSgV4rH/sis+Dwq40i2NB28cw7whmJIFMAdcRWlT3eMu/AB0=
X-Gm-Gg: ASbGncu3Z2fd6L5/2ylTc3Fqep2e3DdV9566ZU/3YCb7iQyQ33Ies0bElhk1WFkLky8
	1KMbjDW2OzHEMACgXmJkCC+hByPLAgAeLkRKOVc6rtcCsJxOZNnZPiRffMzdS4Go6b1uTpxon5h
	NrAg3eB5WEMY4P2t7XG9oUau08jMgp9NWXKcXMcJkjI3kVJXh5lePYhyzTZdevn2cms918pxixz
	shhSVwOQS5PEDbEbDUb0YFOmxsCrkKOI3SPz5wDgCNtTLe/VjcHzsL48u7nE8I5uaiirncuh1Vk
	vkaAT2oEtEzTnOHZ9CqyjSDxMFXhSv2+DZ4bCyTve1jkwfzn67Msijcr
X-Google-Smtp-Source: AGHT+IG/pYQASQpxqALpdTzyKn6tGv+QxqdbmbGFod1wFV2dwtYmyNkB99H/KuhQnFWYsX9U2WTL4A==
X-Received: by 2002:a05:600c:8112:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-451f0b3ce3fmr54377325e9.23.1749119603114;
        Thu, 05 Jun 2025 03:33:23 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6ca08sm24967656f8f.33.2025.06.05.03.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 03:33:22 -0700 (PDT)
Message-ID: <632eadac-e5fd-4e50-9ced-cd4f2b9e6c82@linaro.org>
Date: Thu, 5 Jun 2025 11:33:21 +0100
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
 <2fb1965b-bef9-4a8e-a1c7-c8a77d957b23@linaro.org>
 <87a56ned6r.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <87a56ned6r.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_033325_130267_DBBE3B96 
X-CRM114-Status: GOOD (  33.44  )
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



On 04/06/2025 4:31 pm, Marc Zyngier wrote:
> On Tue, 03 Jun 2025 10:50:23 +0100,
> James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 29/05/2025 5:56 pm, Marc Zyngier wrote:
>>> On Thu, 29 May 2025 12:30:27 +0100,
>>> James Clark <james.clark@linaro.org> wrote:
>>>>
>>>> SPE data source filtering (SPE_FEAT_FDS) adds a new register
>>>> PMSDSFR_EL1, add the trap configs for it.
>>>>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    arch/arm64/kvm/emulate-nested.c | 1 +
>>>>    arch/arm64/kvm/sys_regs.c       | 1 +
>>>>    2 files changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
>>>> index 0fcfcc0478f9..05d3e6b93ae9 100644
>>>> --- a/arch/arm64/kvm/emulate-nested.c
>>>> +++ b/arch/arm64/kvm/emulate-nested.c
>>>> @@ -1169,6 +1169,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
>>>>    	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
>>>>    	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
>>>>    	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
>>>> +	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
>>>>    	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
>>>>    	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
>>>>    	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
>>>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>>>> index 5dde9285afc8..9f544ac7b5a6 100644
>>>> --- a/arch/arm64/kvm/sys_regs.c
>>>> +++ b/arch/arm64/kvm/sys_regs.c
>>>> @@ -2956,6 +2956,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>>>>    	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
>>>>    	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
>>>>    	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
>>>> +	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
>>>
>>> PMSDSFR_EL1 has an offset in the VNCR page (0x858), and must be
>>> described as such. This is equally true for a bunch of other
>>> SPE-related registers, so you might as well fix those while you're at
>>> it.
>>>
>>> Thanks,
>>>
>>> 	M.
>>>
>>
>> I got a bit stuck with what that would look like with registers that
>> are only undef in case there was something that I missed, but do I
>> just document the offsets?
>>
>> +++ b/arch/arm64/include/asm/vncr_mapping.h
>> @@ -87,6 +87,8 @@
>>   #define VNCR_PMSICR_EL1         0x838
>>   #define VNCR_PMSIRR_EL1         0x840
>>   #define VNCR_PMSLATFR_EL1       0x848
>> +#define VNCR_PMSNEVFR_EL1       0x850
>> +#define VNCR_PMSDSFR_EL1        0x858
>>
> 
> This should be enough.
> 

Thanks, I'll resend with these added.

>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -596,6 +596,16 @@ enum vcpu_sysreg {
>>          VNCR(ICH_HCR_EL2),
>>          VNCR(ICH_VMCR_EL2),
>>
>> +       /* SPE Registers */
>> +       VNCR(PMBLIMITR_EL1),
>> +       VNCR(PMBPTR_EL1),
>> +       VNCR(PMBSR_EL1),
>> +       VNCR(PMSCR_EL1),
>> +       VNCR(PMSEVFR_EL1),
>> +       VNCR(PMSICR_EL1),
>> +       VNCR(PMSIRR_EL1),
>> +       VNCR(PMSLATFR_EL1),
> 
> I don't see a point in having those until we actually have SPE support
> for guests, if ever, as these will potentially increase the size of
> the vcpu sysreg array for no good reason.
> 
>> And then sys_reg_descs[] remain as "{ SYS_DESC(SYS_PMBLIMITR_EL1),
>> undef_access }," rather than EL2_REG_VNCR() because we don't actually
>> want to change to bad_vncr_trap()?
> 
> This seem OK for now. We may want to refine this in the future though,
> as these registers cannot trap when NV is enabled. Yes, this is a bug
> in the architecture.
> 
>> There are some other parts about fine grained traps and res0 bits for
>> NV, but they all already look to be setup correctly. Except
>> HDFGRTR2_EL2.nPMSDSFR_EL1, but it's inverted, none of the FGT2 traps
>> are configured currently and PMSDSFR_EL1 is already trapped by
>> MDCR_EL2 anyway.
> 
> Can you elaborate on that? We have:
> 
> 	SR_FGT(SYS_PMSDSFR_EL1,		HDFGRTR2, nPMSDSFR_EL1, 0),
> 
> which seems to match the spec.
> 
> We also have full support for FEAT_FGT2 already (even if we have no
> support for the stuff they trap).

Oh I think that was misleading, the version I was poking around on 
didn't have the FEAT_FGT2 stuff applied yet but I see it now. And yes, 
as you say, what's there matches the spec.

> 
> Thanks,
> 
> 	M.
> 


