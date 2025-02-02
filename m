Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C73C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 23:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRA7lWgwDKj6UV5o7i7BX8BX6gq8Cn4M7Ftrg8fkVDM=; b=AV+EbKgFrNhSwYKPd201vQm6n+
	PHxUJqpYwDrevzy2pCawGtgmL6F/TmX66epYpBiX1R2jm0mLf6BtrdTvZIL6LCn4I5xKGkStAa5u3
	OiS5KVumRsmLKbDCKdVVLepn7c+efFC+D0TOjvJ43XhOhz83eVDoUKl+9/TQxignSS4Il01x50IEd
	+L/HBI8QBGE5pcBj2IDi4qnoJwoI/XUeloClNTNaZ46b1Gf2TXpsQzaDFclF07vYSY9tLJ3o8n5CJ
	PVaO89KkymDMoII386ANpdGuFD43xtHqMTv3ggX9/7xYbAypYGQicst7mv/pkmWSviQHDHASUxVOT
	tG2XnbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tejEn-0000000EHyW-3GCv;
	Sun, 02 Feb 2025 23:18:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tejDT-0000000EHrC-1Tzn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 23:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738538246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hRA7lWgwDKj6UV5o7i7BX8BX6gq8Cn4M7Ftrg8fkVDM=;
	b=C4uZZKNSeBejYRD/NyKeKVNbNtjhgoiMyolvr2MtGoRtCLbB42/kAwepygO5P9pGOy8mON
	VjAg5v6+Yvl2hwZuW+c44PuRvE++3IYqTy6MB4IQbpS2AdRZRxhVqQqGH2mmBeEkEKT3nu
	FsGapwtGqBI3xavzT8N82491HaoC7Uc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-4VjiD05kOFyuHuNlMhgmdg-1; Sun, 02 Feb 2025 18:17:25 -0500
X-MC-Unique: 4VjiD05kOFyuHuNlMhgmdg-1
X-Mimecast-MFC-AGG-ID: 4VjiD05kOFyuHuNlMhgmdg
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso7192155a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 15:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738538244; x=1739143044;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRA7lWgwDKj6UV5o7i7BX8BX6gq8Cn4M7Ftrg8fkVDM=;
        b=voOjKWjP7Q0elr6D5iPQBk4NNCciAaCrZWsZGo+YL8Nk77AyLxo1J4pd+25FBCVriW
         2CCZFsBQVuQpPabagFhHBYdGbYriwtkqQ4zauU/NF/eEhMBuJ4APJDRGtVrcHSBhVwcH
         SAM4TgqYaY4TD3SdgtnUAvF8IEPlxcvXMH07zvSZlsPlOhuBTN+hL+IZCm+1CKZ+XMeX
         wqcdMrV7qq3aLaBkj6SR8M34CI8/TxH3XqdtFTeKWqHFlh87lfFucWL1z6JAdXo3y2ze
         lpAsbvwPtlQ1JYs5tfzpJiuFF2vTqfP+6g0ZBta2g2ZQt3QZ0lJsOJVFLZwJ59XNcscI
         xifw==
X-Forwarded-Encrypted: i=1; AJvYcCVYbVS8ZyKeAtzxIt+658OYYuSedlBtTDc2Muw2EVLyttfHwPeG3rClmGMP4XLvjcMp6cSzBgfnDF1m2W1gImEg@lists.infradead.org
X-Gm-Message-State: AOJu0YyCRBaVygTWKfqJc5ukUntnlng21qqvB+DJm95LeR6HmZpipv7j
	zd34kWTpCyuuPsjJf44t0SYNU5AMZ35rBVOFuLQso9IJWgHiSYZ1fgGq3R4sCpWAr0OiCCnpOmz
	bVXKo2U6ZzDjpo2lGUH7wIkzyMar9vv0uWbzeoz7nwj1I3tGphUwKkGK/ZtIsYLCKq6LYr0TS
X-Gm-Gg: ASbGncvNTuhI2nTvZBcr1I7s411eJv3m7aF3/rO9k2niTDFUiC19gIThWU9iYeyy1Sj
	REb0bzIebxbUbcXm813G27Am+wMiFjvUAFaPRzUewm5dIstR002FBSOU4yzm9/ghVprWigw6MlH
	KwMUbekafrxji9DWY4HalPPIDCDvsBkUyo9xc7obSBFag9uyxbPGzSgShe38zRqOmVgC4erQFf1
	bHLIUumj9B2uNE35OvL1EbYtPdVxFjmArcr5H2ZBuJd5DOxDAYfVQSuFNSU7CQVxaJE7i9+AYCp
	ABPBGw==
X-Received: by 2002:a05:6a00:80a:b0:727:d55e:4be3 with SMTP id d2e1a72fcca58-72fd0beabb1mr27783710b3a.7.1738538244191;
        Sun, 02 Feb 2025 15:17:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDd7NX+s9VmJsk4Gu/C5cdF+xO9wYV1JktzYhBU9uRWjBep69A7UQIF0gV3XEciNO6G3kkpg==
X-Received: by 2002:a05:6a00:80a:b0:727:d55e:4be3 with SMTP id d2e1a72fcca58-72fd0beabb1mr27783675b3a.7.1738538243767;
        Sun, 02 Feb 2025 15:17:23 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6429a98sm7393173b3a.67.2025.02.02.15.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 15:17:23 -0800 (PST)
Message-ID: <e76aaa8f-b2cb-4b89-ab9c-6ca4cac8af9a@redhat.com>
Date: Mon, 3 Feb 2025 09:17:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 34/43] arm64: RME: Propagate number of breakpoints and
 watchpoints to userspace
From: Gavin Shan <gshan@redhat.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-35-steven.price@arm.com>
 <34990c4f-b65e-4af2-8348-87ea078afc16@redhat.com>
In-Reply-To: <34990c4f-b65e-4af2-8348-87ea078afc16@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RhSD-tABdjlw2M3PUtUiVC3ufHN9mluf-AQ3J_rk6YA_1738538244
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_151727_463731_34A34FB5 
X-CRM114-Status: GOOD (  18.97  )
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

On 2/3/25 9:15 AM, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> The RMM describes the maximum number of BPs/WPs available to the guest
>> in the Feature Register 0. Propagate those numbers into ID_AA64DFR0_EL1,
>> which is visible to userspace. A VMM needs this information in order to
>> set up realm parameters.
>>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/include/asm/kvm_rme.h |  2 ++
>>   arch/arm64/kvm/rme.c             | 22 ++++++++++++++++++++++
>>   arch/arm64/kvm/sys_regs.c        |  2 +-
>>   3 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
>> index 0d89ab1645c1..f8e37907e2d5 100644
>> --- a/arch/arm64/include/asm/kvm_rme.h
>> +++ b/arch/arm64/include/asm/kvm_rme.h
>> @@ -85,6 +85,8 @@ void kvm_init_rme(void);
>>   u32 kvm_realm_ipa_limit(void);
>>   u32 kvm_realm_vgic_nr_lr(void);
>> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
>> +
>>   bool kvm_rme_supports_sve(void);
>>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index e562e77c1f94..d21042d5ec9a 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -63,6 +63,28 @@ u32 kvm_realm_vgic_nr_lr(void)
>>       return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS);
>>   }
>> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>> +{
>> +    u32 bps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_BPS);
>> +    u32 wps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_WPS);
>> +    u32 ctx_cmps;
>> +
>> +    if (!kvm_is_realm(vcpu->kvm))
>> +        return val;
>> +
>> +    /* Ensure CTX_CMPs is still valid */
>> +    ctx_cmps = FIELD_GET(ID_AA64DFR0_EL1_CTX_CMPs, val);
>> +    ctx_cmps = min(bps, ctx_cmps);
>> +
>> +    val &= ~(ID_AA64DFR0_EL1_BRPs_MASK | ID_AA64DFR0_EL1_WRPs_MASK |
>> +         ID_AA64DFR0_EL1_CTX_CMPs);
>> +    val |= FIELD_PREP(ID_AA64DFR0_EL1_BRPs_MASK, bps) |
>> +           FIELD_PREP(ID_AA64DFR0_EL1_WRPs_MASK, wps) |
>> +           FIELD_PREP(ID_AA64DFR0_EL1_CTX_CMPs, ctx_cmps);
>> +
>> +    return val;
>> +}
>> +
> 
> The the filed ID_AA64DFR0_EL1_WRPs_MASK of the system register ID_AA64DFR0_EL1 is
> writtable, as declared in sys_reg.c. We need to consolidate the field when the
> system register is written.
> 
>          ID_FILTERED(ID_AA64DFR0_EL1, id_aa64dfr0_el1,
>                      ID_AA64DFR0_EL1_DoubleLock_MASK |
>                      ID_AA64DFR0_EL1_WRPs_MASK |
>                      ID_AA64DFR0_EL1_PMUVer_MASK |
>                      ID_AA64DFR0_EL1_DebugVer_MASK),
> 

Please ignore this comment. The consolidation when the system register is
written has been covered by PATCH[35/43].

>>   static int get_start_level(struct realm *realm)
>>   {
>>       return 4 - stage2_pgtable_levels(realm->ia_bits);
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index a4713609e230..55cde43b36b9 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -1806,7 +1806,7 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>>       /* Hide SPE from guests */
>>       val &= ~ID_AA64DFR0_EL1_PMSVer_MASK;
>> -    return val;
>> +    return kvm_realm_reset_id_aa64dfr0_el1(vcpu, val);
>>   }
>>   static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,

Thanks,
Gavin


