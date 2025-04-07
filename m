Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88127C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQLAax2Ii+FAHRuLmxj8jCF9OOQWkFkx4XQUnJiKxnY=; b=jH4+8ynTAJylvgg2k1ilYS22GG
	JcKog2VTGNvT4Y5+2RAAJhkX46ngF/K7vlinbLZmlBGuBz1itc1dCVK6eWaBvNM/8VOuDyPnIi76R
	2sODQhoSZS5Jh+KpX5TdjJbvGJd6txzSBB/ObeKnMpFEsCaoOxvnYkzEkCaYSjW3FlKGCAzqFCgxW
	smGDtKKPJC4QhZRbmFZ80Z81sUadekqA8BdrDf4cMLaa9HIXPJ4ZFOpxdMw/xhb16Hro8ZjehQzd7
	SxAbzUCwMNPO2nkrOCIGE2OBAnASFVXLX0gf590gnbXxTUs3SH7gmoaV88Ji7cfhdyUhYtOHKu/p1
	jvlomfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYJ-00000001ckc-168W;
	Mon, 07 Apr 2025 18:50:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pRW-00000001ERe-1EP4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 16:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DQLAax2Ii+FAHRuLmxj8jCF9OOQWkFkx4XQUnJiKxnY=; b=QRHsyw5h9FdkN0sRA1u4/vrL/R
	aLu/jEBNRJBZMv4JacvkpruE327TzPZr7/wfHxe/oR1E0rANobdadldruy+xziZjXmzaGbAh9niSF
	pX4OZ8ELblSJgBfSwI1ePdmUyTOWKWkFE5uDEu7iwDet/2ZDFAygo6Ow79EdFypo2MgLAbQWbdD07
	E92SbIMZFt+9dbRVFka4ZAxv9o/iSJZNDalxfSbZORQxz1DQdY+n6+dj8mj4KeNR5jcPdYZNjrW8r
	9oFyj4tYjoGUsQMGFJQWgvMF/Hn+YHMQqV0pr42UuhlN0YEyJeSCVW7M2jpEHqjQkVQmBwN/UXUKv
	crvP9g3g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pRT-000000083zQ-1G19
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:35:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6174106F;
	Mon,  7 Apr 2025 09:35:23 -0700 (PDT)
Received: from [10.57.17.31] (unknown [10.57.17.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D9893F694;
	Mon,  7 Apr 2025 09:35:18 -0700 (PDT)
Message-ID: <adbca476-7d0f-473d-a2a2-0a29a497dbca@arm.com>
Date: Mon, 7 Apr 2025 17:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 35/45] arm64: RME: Propagate number of breakpoints and
 watchpoints to userspace
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
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
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-36-steven.price@arm.com>
 <c8af8a7f-5ee4-460b-aec4-959f688db628@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <c8af8a7f-5ee4-460b-aec4-959f688db628@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_173523_667204_B2A398F5 
X-CRM114-Status: GOOD (  19.10  )
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

On 04/03/2025 23:45, Gavin Shan wrote:
> On 2/14/25 2:14 AM, Steven Price wrote:
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
> With the following one nitpick addressed:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
>> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/
>> asm/kvm_rme.h
>> index d684b30493f5..67ee38541a82 100644
>> --- a/arch/arm64/include/asm/kvm_rme.h
>> +++ b/arch/arm64/include/asm/kvm_rme.h
>> @@ -85,6 +85,8 @@ void kvm_init_rme(void);
>>   u32 kvm_realm_ipa_limit(void);
>>   u32 kvm_realm_vgic_nr_lr(void);
>>   +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu,
>> u64 val);
>> +
>>   bool kvm_rme_supports_sve(void);
>>     int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap
>> *cap);
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index f83f34358832..8c426f575728 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -87,6 +87,28 @@ u32 kvm_realm_vgic_nr_lr(void)
>>       return u64_get_bits(rmm_feat_reg0,
>> RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS);
>>   }
>>   +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu,
>> u64 val)
>> +{
>> +    u32 bps = u64_get_bits(rmm_feat_reg0,
>> RMI_FEATURE_REGISTER_0_NUM_BPS);
>> +    u32 wps = u64_get_bits(rmm_feat_reg0,
>> RMI_FEATURE_REGISTER_0_NUM_WPS);
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
> The chunk of code can be squeezed to
> sys_reg.c::sanitise_id_aa64dfr0_el1() since
> sys_reg.c has been plumbed for realm, no reason to keep a separate
> helper in rme.c
> because it's only called by sys_reg.c::sanitise_id_aa64dfr0_el1()

The issue here is the rmm_feat_reg0 variable - it's currently static in
rme.c - so I can't just shift the code over. I could obviously provide
helpers to get the necessary information but this seemed cleaner.

Thanks,
Steve

>>   static int get_start_level(struct realm *realm)
>>   {
>>       return 4 - ((realm->ia_bits - 8) / (RMM_PAGE_SHIFT - 3));
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index ed881725eb64..5618eff33155 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -1820,7 +1820,7 @@ static u64 sanitise_id_aa64dfr0_el1(const struct
>> kvm_vcpu *vcpu, u64 val)
>>       /* Hide BRBE from guests */
>>       val &= ~ID_AA64DFR0_EL1_BRBE_MASK;
>>   -    return val;
>> +    return kvm_realm_reset_id_aa64dfr0_el1(vcpu, val);
>>   }
>>     static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,
> 
> Thanks,
> Gavin
> 


