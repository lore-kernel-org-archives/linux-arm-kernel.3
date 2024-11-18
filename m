Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCF4D43FF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGmI8lbwR7NCYeW11AMDl/Et4oHvlVYfxI3t1NYlUOg=; b=3Gd+AiFeeYesfDk7p7YY6B68M5
	DDHbLV5zNs5g9mV8n6/jHNCkrQpgxNhkOquLQ22FYhKPtkcj4G1yK6ptHEEdIPGREFoi5U40VrJga
	wTL3xwQe5t3rLwmcDHEjLL5sN73Atg43lB2WtzOEVVWiGoCDCmOFOYsspq0afPm0PvG4zzaLtmzF3
	b3kgFykCSI09+ikdlYorIAENEQJtEFsiLjbK55cNJNL4iR2zEgwf1EbdfF+HIFApzODh5G23kYPQX
	Ndpwz4xCaJhNd64QH57gxc4H15EWe/T5ymNOl6mGugILmaUbFMNLd561E0+k2rFQk/88PsVl/zmfx
	N6A6S0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxyk-00000008thC-2ph7;
	Mon, 18 Nov 2024 09:23:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxxo-00000008tbB-3Bwb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 09:22:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4314f38d274so26727875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 01:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731921751; x=1732526551; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nGmI8lbwR7NCYeW11AMDl/Et4oHvlVYfxI3t1NYlUOg=;
        b=v7HaCgtlpSq81R5BsEXZbD8+e/l8MsorbJZvw1SX6S4tMzQuY/DogriyUdIRkDU+hL
         qByqChVQvMsgzja43pWCV7s4KyNMUtfEa6Qeb1i3KAL+GI3XfYZxSO41FqRHdMvIAN59
         comZj+WVlUPlaqGXqdFTWVo/0xeFbnB3FfrjEQN22ehkSOuev7yzdqc2AJ0jnVjbpRwa
         mZfdzsEqONPqqk7yc8aHTcwMFc3NfXvuvKa739ym4krbUZsH2UoKCAZe18gk0cWyLqYt
         UOmo2C/NrgS2zUPtXAzkM7A0F7MUCsf9FuGIMWF1LEmpxU4T0M5rDFUkwZdONIdZEvi9
         xxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731921751; x=1732526551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGmI8lbwR7NCYeW11AMDl/Et4oHvlVYfxI3t1NYlUOg=;
        b=tX2H1Py+Dcq6CHIviuM/F6hOQdTrKnGr1pzLqAtGlB3zKiBWj2csxYTBiieYW3l2sP
         kIazNQZWSae/pqzVQwzXv3azwp+8n79pnjJQEYULIqdy1Dosckt7eSKUwyyS3iJynI6A
         8bp2BXIHd0yIIHfIeWYCq0F5/0yi3SlGn+1REFdKNHRTcOQ8rmgJJia13BvUlA4mSwNN
         e8v97Ba4/WtU4nqp4n49poKDAuaqzruwti/+JpkRfq5utjZNGfSbDMWM4TP0cxYtpo16
         hqQLxg4YVymtwLkFU1zxzq+VU+jaicyfHv1y3hC9Az7lbERmylXwYHnULfkOmRsBCRf8
         C74A==
X-Forwarded-Encrypted: i=1; AJvYcCWdvBne81eLUYgUiJLJjZiSfvWtoUd/d3WRfBvaek72oSH/VcZtS6z2VuJISg2AVs8NeCrZOh2JnCkoCm0DaT7y@lists.infradead.org
X-Gm-Message-State: AOJu0YzfpCWC/O+d2Wv99APFhThF4kwvEVCV/LSyVxwFzyQHUnx/0Hh8
	XWualQYfYTr78YeSWHjjFdKYYsw+1xrAiRC8gnQWEw1FK73hKQ+H+dHTXPhZ4WI=
X-Google-Smtp-Source: AGHT+IE8sqN41IKDsVujhddClddX9c86bSpUR4FW8FB4X5ekJHU4YZ5thRdSh5CzRwHbbdczRsLpKA==
X-Received: by 2002:a05:600c:1e88:b0:431:5465:8072 with SMTP id 5b1f17b1804b1-432df793c69mr127392555e9.31.1731921750695;
        Mon, 18 Nov 2024 01:22:30 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da265668sm150597475e9.10.2024.11.18.01.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 01:22:30 -0800 (PST)
Message-ID: <1a843735-0a94-4df7-a8b4-cad68ee2449a@linaro.org>
Date: Mon, 18 Nov 2024 09:22:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/12] KVM: arm64: Make vcpu flag macros more generic
To: Marc Zyngier <maz@kernel.org>
Cc: suzuki.poulose@arm.com, oliver.upton@linux.dev,
 coresight@lists.linaro.org, kvmarm@lists.linux.dev,
 Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
 Shiqi Liu <shiqiliu@hust.edu.cn>, Raghavendra Rao Ananta
 <rananta@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241112103717.589952-1-james.clark@linaro.org>
 <20241112103717.589952-5-james.clark@linaro.org>
 <86y11gvruu.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <86y11gvruu.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_012232_809730_599DBE82 
X-CRM114-Status: GOOD (  21.85  )
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



On 18/11/2024 9:00 am, Marc Zyngier wrote:
> On Tue, 12 Nov 2024 10:37:03 +0000,
> James Clark <james.clark@linaro.org> wrote:
>>
>> Rename vcpu_* to kvm_* so that the same flags mechanism can be used in
>> places other than vcpu without being confusing. Wherever macros are
>> still related to vcpu like vcpu_get_flag() with hard coded v->arch, keep
>> the vcpu_* name, otherwise change it.
>>
>> Also move the "v->arch" access one macro higher for the same reason.
>>
>> This will be used for moving flags to host_data in a later commit.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/include/asm/kvm_host.h | 88 +++++++++++++++----------------
>>   arch/arm64/kvm/hyp/exception.c    | 12 ++---
>>   arch/arm64/kvm/inject_fault.c     |  4 +-
>>   arch/arm64/kvm/mmio.c             | 10 ++--
>>   4 files changed, 57 insertions(+), 57 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index f333b189fb43..34aa59f498c4 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -790,22 +790,22 @@ struct kvm_vcpu_arch {
>>   /*
>>    * Each 'flag' is composed of a comma-separated triplet:
>>    *
>> - * - the flag-set it belongs to in the vcpu->arch structure
>> + * - the flag-set it belongs to in the structure pointed to by 'v'
>>    * - the value for that flag
>>    * - the mask for that flag
>>    *
>> - *  __vcpu_single_flag() builds such a triplet for a single-bit flag.
>> - * unpack_vcpu_flag() extract the flag value from the triplet for
>> + *  __kvm_single_flag() builds such a triplet for a single-bit flag.
>> + * unpack_kvm_flag() extract the flag value from the triplet for
>>    * direct use outside of the flag accessors.
>>    */
>> -#define __vcpu_single_flag(_set, _f)	_set, (_f), (_f)
>> +#define __kvm_single_flag(_set, _f)	_set, (_f), (_f)
>>   
>>   #define __unpack_flag(_set, _f, _m)	_f
>> -#define unpack_vcpu_flag(...)		__unpack_flag(__VA_ARGS__)
>> +#define unpack_kvm_flag(...)		__unpack_flag(__VA_ARGS__)
>>   
>>   #define __build_check_flag(v, flagset, f, m)			\
>>   	do {							\
>> -		typeof(v->arch.flagset) *_fset;			\
>> +		typeof(v.flagset) *_fset;			\
>>   								\
>>   		/* Check that the flags fit in the mask */	\
>>   		BUILD_BUG_ON(HWEIGHT(m) != HWEIGHT((f) | (m)));	\
>> @@ -813,11 +813,11 @@ struct kvm_vcpu_arch {
>>   		BUILD_BUG_ON((sizeof(*_fset) * 8) <= __fls(m));	\
>>   	} while (0)
>>   
>> -#define __vcpu_get_flag(v, flagset, f, m)			\
>> +#define __kvm_get_flag(v, flagset, f, m)			\
>>   	({							\
>>   		__build_check_flag(v, flagset, f, m);		\
>>   								\
>> -		READ_ONCE(v->arch.flagset) & (m);		\
>> +		READ_ONCE(v.flagset) & (m);		\
>>   	})
>>   
>>   /*
>> @@ -826,64 +826,64 @@ struct kvm_vcpu_arch {
>>    */
>>   #ifdef __KVM_NVHE_HYPERVISOR__
>>   /* the nVHE hypervisor is always non-preemptible */
>> -#define __vcpu_flags_preempt_disable()
>> -#define __vcpu_flags_preempt_enable()
>> +#define __kvm_flags_preempt_disable()
>> +#define __kvm_flags_preempt_enable()
>>   #else
>> -#define __vcpu_flags_preempt_disable()	preempt_disable()
>> -#define __vcpu_flags_preempt_enable()	preempt_enable()
>> +#define __kvm_flags_preempt_disable()	preempt_disable()
>> +#define __kvm_flags_preempt_enable()	preempt_enable()
>>   #endif
>>   
>> -#define __vcpu_set_flag(v, flagset, f, m)			\
>> +#define __kvm_set_flag(v, flagset, f, m)			\
> 
> Hell no. Never. The whole point of this naming is that we know what
> this applies to. Here, you might as well have replaced 'vcpu' with
> 'carrot', and the result would be the same.
> 
> Not to mention the insane churn this generates.
> 
> So no, not happening.
> 
> 	M.
> 

Fair enough, I wasn't feeling to strongly about this either, was just 
anticipating that there might be objection to bare flags if this more 
abstracted mechanism existed elsewhere.

Looks like Oliver already did it with just flags for the same end goal 
here [1], so I will drop this.

[1]: 
https://lore.kernel.org/kvmarm/20241115224924.2132364-4-oliver.upton@linux.dev/T/#u


