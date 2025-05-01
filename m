Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F4FC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzT7K8I220lkIra9KzhKbkEcpgT3/dCi3JXgDt4xJnU=; b=vMb4NGZekBAPnpAWaRGxerqdSD
	Lj5uYZifCTAK/j2s5DxglzPLsTuKIrgSiC+8jazhg7UGm6uMfpK5XczVZ+XJiTs/5UZYDaMu0oox/
	zo89zYLYMY4G48v4uVKS3LBSOkZp4I2Pk621AJ+o7NbCHlfLmZ3R1Rae+rXubpzzZyeu4l+2H+JvN
	HQaT9IvziBD/6VISkSMKsWVPw1SWhtSE965ogSc739iwGgsOvORBpNCdTXzwJbvhDU49uzFKllC3A
	w3jH6ITzGwuGXIWy83tl10kFBqcZaWM4mNiemcLfySchk+DIn+AiPYBGaMNOSPqyrhhHDqwq0DaG1
	wVcmAlbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKoQ-0000000Ecw0-2RpE;
	Thu, 01 May 2025 03:42:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKmW-0000000EcjO-1G25
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 03:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746070815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YzT7K8I220lkIra9KzhKbkEcpgT3/dCi3JXgDt4xJnU=;
	b=LI+Y2Rshyt4KWQqi4zMrRKxaL9BnhcT6QU2LRgyiU+a7fzcYzkmPXM+D1CmlvgsORokLs4
	SmrmJKeKqWogEJMfUjFFH+1GuOVDnMglf/1CO8KtgrRGNE0Hvx8nQpyfmKbEYT/kqEsufT
	p/bOWtX/Y4XPMoVpfYqfO/kaGazXj1k=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-tVoHSUiwOwuezubTUJvSIA-1; Wed, 30 Apr 2025 23:40:13 -0400
X-MC-Unique: tVoHSUiwOwuezubTUJvSIA-1
X-Mimecast-MFC-AGG-ID: tVoHSUiwOwuezubTUJvSIA_1746070812
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b1f8d149911so237854a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 20:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746070811; x=1746675611;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzT7K8I220lkIra9KzhKbkEcpgT3/dCi3JXgDt4xJnU=;
        b=v3ON0YwMfGr7T/1CXuwD/MYZTJFOR9izx0PnLpLq1Vy8Ys/h8sVWJynpDDUkm1+CyB
         8SDS+a8NKar+dEXyAXTcBSsDXoMEgJLOBU0pKtLaSITgyIkeCYaEhbKzdqlgmRHbwhow
         mGLj7WJ4y4jyor38+x5NYpXfeARvK04MhTlvcN7wFlFHSn/F++1RXkrkMZLUEryT0hTn
         Rot1u/au9OmumgHUeAnAAWzs9exS/Nyz8cdEx1KXFIVcpU1CCoreHbpswJwVVc0HjE5u
         y+4xW4Ea7SmxclD/h7256FXdIIm6RhT6uxTWoGXHyUZk3pg47CWNeb1QYFXRFGeuHksY
         JiCA==
X-Forwarded-Encrypted: i=1; AJvYcCXTu7VsorTr2d0a0hUCUuRBogP13gXuBWKHNKopCi9h35x8HkzU5yhteb1i2VheaqhTrOUCunlSnlNsbhHmyWkS@lists.infradead.org
X-Gm-Message-State: AOJu0YwyNENDqa/mZJnlrUHMlkMbgdUOevnGkLM7H7fNY38DcQhKaGqO
	0r4pv3BZog2sk5+foT/R4NtJmsTOhWO//Qpiymg4wVs1gNkzLth0P+igFp3ZfUK1w4T+2RqIodq
	Gisbg8/S65lf9GSj/QBhrex+EiC2R4ZiLi/aMmXKpx/fgPuwAZzUCzKkzfhwwMIVbcncMmpx9
X-Gm-Gg: ASbGncscel9mi5Wk882w4I2vRzRtDjhSQepXJkE2Q88ZtCTga9Zp8hv59T+6Wb3N+30
	RrQ7KZC9qkc6rJ4OGkS78yhMGxwa1MPXSAhVy+se1x+yzWXmYyjUs2oHR0n3TQiVOckaQbcyShs
	H7lWhqtjf+ZLvSGbX7jFblLh3CeHJmTwp2t1w1mMeKWuhnFmWPLYIFzlXKNoujhqIntoUenta1B
	A6YV9822ii0ZF9TTyJIse4RTfLI3WinFTJvqlPFsIxqxXVjiP+7Twwi9Rx4E5UW2LD0BY4bEfBy
	uwGQfaoyknDy
X-Received: by 2002:a17:903:18e:b0:224:10a2:cad5 with SMTP id d9443c01a7336-22e040a2e4fmr26932595ad.10.1746070811572;
        Wed, 30 Apr 2025 20:40:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW6a/uU1DCKjMX5JLHAC9khf/wySTJvMqlUsZIdvGKjmMukBMZ9FoZF/x8NrqKxPW33mJK9A==
X-Received: by 2002:a17:903:18e:b0:224:10a2:cad5 with SMTP id d9443c01a7336-22e040a2e4fmr26932325ad.10.1746070811228;
        Wed, 30 Apr 2025 20:40:11 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51051c6sm130511945ad.206.2025.04.30.20.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:40:10 -0700 (PDT)
Message-ID: <cfa0ba0f-86ad-4a72-be14-67b0639a7f59@redhat.com>
Date: Thu, 1 May 2025 13:40:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 34/43] arm64: RME: Propagate number of breakpoints and
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-35-steven.price@arm.com>
 <19ec5533-ee10-4670-a9fd-da1345a6946a@redhat.com>
In-Reply-To: <19ec5533-ee10-4670-a9fd-da1345a6946a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yCtxB6lXke0vACbXMq04I0SRJLO79JPCzSdh2QDN3tQ_1746070812
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_204016_857099_5C80E5E3 
X-CRM114-Status: GOOD (  20.66  )
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

On 5/1/25 1:36 PM, Gavin Shan wrote:
> On 4/16/25 11:41 PM, Steven Price wrote:
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
> 
> If I don't miss anything, it's not enough to apply the filter on reading and
> resetting path where sanitise_id_aa64dfr0_el1() is called. id_aa64dfr0_el1
> is writable and it's possible that QEMU modifies its value. Afterwards, the
> register is read from guest kernel, which will be trapped to host and the
> modified value is returned, without this filter applied. So I think the same
> filter need to be applied to the write path originated from QEMU.
> 

Please ignore this and it has been done in next patch :)

Thanks,
Gavin

>> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
>> index f786fd978cf6..09cbb61816f3 100644
>> --- a/arch/arm64/include/asm/kvm_rme.h
>> +++ b/arch/arm64/include/asm/kvm_rme.h
>> @@ -94,6 +94,8 @@ void kvm_init_rme(void);
>>   u32 kvm_realm_ipa_limit(void);
>>   u32 kvm_realm_vgic_nr_lr(void);
>> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
>> +
>>   bool kvm_rme_supports_sve(void);
>>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index 297b13ef1729..0c358ce0a7a1 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -87,6 +87,28 @@ u32 kvm_realm_vgic_nr_lr(void)
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
>>   static int get_start_level(struct realm *realm)
>>   {
>>       return 4 - ((realm->ia_bits - 8) / (RMM_PAGE_SHIFT - 3));
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index de7fe024dbff..36e22ed84e7e 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -1844,7 +1844,7 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>>       /* Hide BRBE from guests */
>>       val &= ~ID_AA64DFR0_EL1_BRBE_MASK;
>> -    return val;
>> +    return kvm_realm_reset_id_aa64dfr0_el1(vcpu, val);
>>   }
>>   static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,
> 


