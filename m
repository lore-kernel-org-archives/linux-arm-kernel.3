Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF6BD2D10D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOcc0KRBXay6wWD+u9p0xoC86rnX88DOcRXGUN9LsyM=; b=MvwYi5VQLN+qJIaaC5Oyn92QM6
	kqGnjYCyWVARfuwihglRVI0V3E3Y6z1UUBEifv+tx8F+xfiewHHb7bk89kK28ZlClK7qhr3GXLy05
	VyK0LYXu3rA+JwJOBOri1jJf293ci7VBUjTn2IzQwWymYVdTBveqWkOWdQlwBE+rZ3O3CaxDBt/aW
	ds77R5UrgCij13Ug1XbkF30GfWDn3qWOCJmlcA26RBCSx7zEEJ57GarTSp3yj61qsv8u92EfnRyY/
	VPCBPQxjizNq2F3ugCRlXhsDGT79Xsry2mfVVThcg3eEei5FO6IUeh0GZuYIKiJxM3jEeFOauO3WF
	T33WW9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffHx-00000007F5L-0fTF;
	Tue, 13 Jan 2026 14:22:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffHu-00000007F4X-3XIf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:22:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so4865875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 06:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768314145; x=1768918945; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kOcc0KRBXay6wWD+u9p0xoC86rnX88DOcRXGUN9LsyM=;
        b=FNz2e59N8rkgzIflIyBwSyH5nUrA8ppolbBIhNEC6wLwB+RE6Nj72UeBdRSATXuXMg
         VkhaW3me0Qv4YtieqbT7jsVdg2BRakN658fbZ0J2iEgxtrqVV4v3Mu/S/p0RLV/4XIP9
         BO9x224IsI0WRx7I/3mJPYLixb/Y7yUqP3OKWWO/aAmFYRtK7MwOzFwIiKFKkmb2MwBh
         wAGVFt2jwsZF3x4JeQXQYbWwWhpw69H45Gbw5WN0SlqC9uRScVR6sFPjd/sl12ZsoW1b
         oSYvDJ/H+39wTP0jo9Jrvh91h4Ng+myZocUf91ws3/OIBovlf7jAAzWRLF+yh2VOV30a
         fL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314145; x=1768918945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOcc0KRBXay6wWD+u9p0xoC86rnX88DOcRXGUN9LsyM=;
        b=J8MMNSbC9eAm3qU6Qhj4Hpw5sqUddq1dHKe/8Mc67rm02YL7CrAF/QtFXYK/Ium+Hm
         YJuICW3UxXeDPshmIqaKp4R05OptEGaI18QsSjWbyut5lbLhiwWdMOkbElgz3lY7kIYv
         s+gjR7+77yRu31xzwEU8MTOO3qndK174ql7m00CCxkVKDWIVXB26tDy02+GZzOmoRCB/
         YKi9VjHF9ifsnzUTfxQzHQ+qaLnngqyWau870pwKdtSRISSHxnKtOcxqvYg7ee0A7GXt
         mmUv3VvREQdtjq7Zf+Ku+LvvlRbMT9u9M5b+W3U69UhZTy8+IxBEhIDlGSO/qjbJ0rI3
         OwkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYC3/WIiZaaEhiiBDCqN2qQBqgSvHBcPpsAwFBM3LPggcYKepoPnjv6UPUfbTNDMXF6H/QtXRYbCVP1mbXWdiQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1IuLGIVRbEV2472Il1fwEOTytn2H2BjAc6vLEAHsWltPZQfY2
	4IPAh1piU7q9xOt2OtC6x7xm5sANnOmLXgdBM0CyxMJErZYIu3PLV/DreIAz7S9hjlM=
X-Gm-Gg: AY/fxX7+c82Pw/YW3aE77qPsnbQMORf0BeJZeGGztWpeHSBlQuh2UrFPCyPDvDGfMmf
	YutwoG5Z8TjKGvyrRArAAZU9F8IuXjp40CMZIoxrKRR8BsdCHwGpNwZDhiTPQs4/CoLQrI9pPiI
	N2OeuePGqILwh0Mk3uN7f2iGY2BGEyQ5ZyEFP6vTFwBohnW8Mp7mGnrNiQkCjWfcxlkkpP5lYOZ
	pVbnFLjehBm6AGm/91QmoCQt0Y1XHfmgIsfhNiZIIuhJjgfo9YTHc4QA/RDQA+pZBRRX8RkpcEf
	5BaQE0Do0rEhH6G5T56VQt2gayQsRxr75+4WFlyiwZOrsFPfCKzIqIhoziKnvRNoAboxHqbqPGM
	yM95PgV3/ifYpxjnhCQf7aDH8kN3CHP6AqHpjHJP8PuLAi1thYgMcOaLNTfBVaM1FU/UfZsx2CE
	qWb+TaTNfFP8d6pR2w
X-Google-Smtp-Source: AGHT+IEhLNzlzezmO94C9Di983Zw5BpIJOch/75pRQUe03HO2q7PgBEqy8xZhLdl4DPED2OEci+CzQ==
X-Received: by 2002:a05:600c:1e1c:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-47d84b0a8d1mr222924975e9.5.1768314144942;
        Tue, 13 Jan 2026 06:22:24 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47edfd5cfd5sm15667235e9.8.2026.01.13.06.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:22:24 -0800 (PST)
Message-ID: <a3c54401-707a-472f-a3e2-62cb9b70020f@linaro.org>
Date: Tue, 13 Jan 2026 14:22:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 19/35] KVM: arm64: Trap PMBIDR_EL1 and PMSIDR_EL1
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-20-alexandru.elisei@arm.com>
 <f7d73dc3-aa4a-4c32-aabb-21a61a2f773f@linaro.org> <aWTa76KXpIwzPh4k@raptor>
 <adacaff6-c6c7-47a5-993a-29f006fe1b86@linaro.org> <aWY_GGzNW85ZR7dP@raptor>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aWY_GGzNW85ZR7dP@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_062226_924768_5BF07308 
X-CRM114-Status: GOOD (  28.55  )
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



On 13/01/2026 12:48 pm, Alexandru Elisei wrote:
> Hi James,
> 
> On Mon, Jan 12, 2026 at 11:54:05AM +0000, James Clark wrote:
>>
>>
>> On 12/01/2026 11:28 am, Alexandru Elisei wrote:
>>> Hi James,
>>>
>>> On Fri, Jan 09, 2026 at 04:29:37PM +0000, James Clark wrote:
>>>>
>>>>
>>>> On 14/11/2025 4:07 pm, Alexandru Elisei wrote:
>>>>> PMBIDR_EL1 and PMSIDR_EL1 are read-only registers that describe the SPE
>>>>> implementation. Trap reads to allow KVM to control how SPE is described to
>>>>> a virtual machine. In particular, this is needed to:
>>>>>
>>>>> - Advertise the maximum buffer size set by userspace in
>>>>>      PMBIDR_EL1.MaxBuffSize.
>>>>> - Hide in PMSIDR_EL1, if necessary, the presence of FEAT_SPE_FDS and
>>>>>      FEAT_SPE_FnE, both of which add new registers which are already
>>>>>      trapped via the FGU mechanism.
>>>>>
>>>>> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
>>>>> ---
>>>>>     arch/arm64/include/asm/kvm_spe.h |  4 +-
>>>>>     arch/arm64/kvm/config.c          | 13 ++++-
>>>>>     arch/arm64/kvm/spe.c             | 82 +++++++++++++++++++++++++++++++-
>>>>>     arch/arm64/kvm/sys_regs.c        | 13 +++--
>>>>>     4 files changed, 103 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
>>>>> index 3506d8c4c661..47b94794cc5f 100644
>>>>> --- a/arch/arm64/include/asm/kvm_spe.h
>>>>> +++ b/arch/arm64/include/asm/kvm_spe.h
>>>>> @@ -40,7 +40,7 @@ int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>>>>>     int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>>>>>     bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
>>>>> -u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg);
>>>>> +u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding);
>>>>>     #else
>>>>>     struct kvm_spe {
>>>>>     };
>>>>> @@ -78,7 +78,7 @@ static inline bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
>>>>>     {
>>>>>     	return true;
>>>>>     }
>>>>> -static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
>>>>> +static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
>>>>>     {
>>>>>     	return 0;
>>>>>     }
>>>>> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
>>>>> index 24bb3f36e9d5..ed6b167b7aa8 100644
>>>>> --- a/arch/arm64/kvm/config.c
>>>>> +++ b/arch/arm64/kvm/config.c
>>>>> @@ -6,6 +6,7 @@
>>>>>     #include <linux/kvm_host.h>
>>>>>     #include <asm/kvm_emulate.h>
>>>>> +#include <asm/kvm_spe.h>
>>>>>     #include <asm/kvm_nested.h>
>>>>>     #include <asm/sysreg.h>
>>>>> @@ -1489,6 +1490,16 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
>>>>>     		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
>>>>>     }
>>>>> +static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
>>>>> +{
>>>>> +	__compute_fgt(vcpu, HDFGRTR_EL2);
>>>>> +
>>>>> +	if (vcpu_has_spe(vcpu)) {
>>>>> +		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= HDFGRTR_EL2_PMBIDR_EL1;
>>>>> +		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= HDFGRTR_EL2_PMSIDR_EL1;
>>>>> +	}
>>>>> +}
>>>>> +
>>>>>     static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
>>>>>     {
>>>>>     	__compute_fgt(vcpu, HDFGWTR_EL2);
>>>>> @@ -1505,7 +1516,7 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
>>>>>     	__compute_fgt(vcpu, HFGRTR_EL2);
>>>>>     	__compute_hfgwtr(vcpu);
>>>>>     	__compute_fgt(vcpu, HFGITR_EL2);
>>>>> -	__compute_fgt(vcpu, HDFGRTR_EL2);
>>>>> +	__compute_hdfgrtr(vcpu);
>>>>>     	__compute_hdfgwtr(vcpu);
>>>>>     	__compute_fgt(vcpu, HAFGRTR_EL2);
>>>>> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
>>>>> index 5b3dc622cf82..92eb46276c71 100644
>>>>> --- a/arch/arm64/kvm/spe.c
>>>>> +++ b/arch/arm64/kvm/spe.c
>>>>> @@ -22,10 +22,16 @@ struct arm_spu_entry {
>>>>>     	struct arm_spe_pmu *arm_spu;
>>>>>     };
>>>>> +static u64 max_buffer_size_to_pmbidr_el1(u64 size);
>>>>> +
>>>>>     void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
>>>>>     {
>>>>>     	struct arm_spu_entry *entry;
>>>>> +	/* PMBIDR_EL1 cannot be trapped without FEAT_FGT. */
>>>>> +	if (!cpus_have_final_cap(ARM64_HAS_FGT))
>>>>> +		return;
>>>>> +
>>>>
>>>> Isn't this only required if you want to report a different PMBIDR value? If
>>>> the value in hardware is already what you want to give to guests then it's
>>>> not strictly required. Maybe it's something we can do as an addition later
>>>> to make it usable in more places.
>>>
>>> The maximum buffer size is advertised in PMBIDR_EL1.
>>>
>>> Thanks,
>>> Alex
>>>
>>
>> I know, but 0 "unlimited" is a valid value, and that's what's already in
>> PMBIDR. You only need to trap if the value doesn't match what's already
>> there.
>>
>> You can also "probe" the maximum buffer size without this by attempting to
>> set the limit pointer and looking at the buffer management error code.
>>
>> The first thing I did when I went to use this was comment this out because
>> my hardware doesn't support FGT. But the rest of it works fine without,
>> maybe other people could benefit in the future too.
> 
> I could add a new capability for setting the maximum buffer size (or to set a
> buffer size different than what the hardware advertises), enabled when FEAT_FGT
> is implement by the hardware. But that means not allowing KVM SPE on Neoverse
> because of erratum 3023823 [1]. So I don't think you would be able to use KVM
> SPE out of the box on your hardware anyway (if I understood correctly that
> you've been using a Neoverse CPU to test the series).
> 
> [1] https://developer.arm.com/documentation/SDEN-885747/34-0
> 
> Thanks,
> Alex

Hmm ok, not sure if there are any other systems with working SPE but no 
FGT? Maybe we can wait to see if anyone asks and think about it more at 
that time. I was just thinking out loud anyway.



