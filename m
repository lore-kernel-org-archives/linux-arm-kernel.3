Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCA810987B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3bDk4ZNcNdrFDGemMLIUnAkWsLuvycXzLqdxfUMppk=; b=0/jIsdUdpWFfkQWKm7gou5oFAM
	kN9OElO3QHylacVTpC42slS9AS38au3yurLwjhqhnPBBLi66zDja1pzClYHIyc33DdDopeCoZle+c
	SVEnK5IfUtEDmlcaXUTm7ed0SL7DO7s5ikw8liR0c52mD0fdeCOh+YGLbsnvR9msw9UsPCSP6i3Hr
	sfWgmhD+3sYPZjRqw6DekrKPkv3AdlT/gks+ZYQhTP91LSw+pUi7n7EcTNNjB4txN4Y8hiN45PxHB
	ebFRZeK6H8/qNl1gIjiQ2ECrQUEvedbZWvZBalN9WMxUFfdJfNKY05aelrYDwXgjNc2quHffVS385
	k4MDQOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cyg-0000000DAt3-49V5;
	Fri, 20 Mar 2026 16:45:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cyd-0000000DAsG-3gQS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:45:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 475FF165C;
	Fri, 20 Mar 2026 09:45:28 -0700 (PDT)
Received: from [10.1.29.20] (e122027.cambridge.arm.com [10.1.29.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D2FF3F7BD;
	Fri, 20 Mar 2026 09:45:30 -0700 (PDT)
Message-ID: <a30aeb78-1aef-4b56-b30c-0ed2ae05e74a@arm.com>
Date: Fri, 20 Mar 2026 16:45:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 39/48] arm64: RMI: Propagate number of breakpoints and
 watchpoints to userspace
To: Wei-Lin Chang <weilin.chang@arm.com>, kvm@vger.kernel.org,
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
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-40-steven.price@arm.com>
 <yqg4omdkqvslldhxbdzctbgxirxomw6mparqvhuybwyzthhdy3@6glrgqmfydsj>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <yqg4omdkqvslldhxbdzctbgxirxomw6mparqvhuybwyzthhdy3@6glrgqmfydsj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094536_004501_E9C04589 
X-CRM114-Status: GOOD (  17.28  )
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

On 19/03/2026 18:50, Wei-Lin Chang wrote:
> On Wed, Mar 18, 2026 at 03:54:03PM +0000, Steven Price wrote:
>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> The RMM describes the maximum number of BPs/WPs available to the guest
>> in the Feature Register 0. Propagate those numbers into ID_AA64DFR0_EL1,
>> which is visible to userspace. A VMM needs this information in order to
>> set up realm parameters.
>>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
>> ---
>>  arch/arm64/include/asm/kvm_rmi.h |  2 ++
>>  arch/arm64/kvm/rmi.c             | 22 ++++++++++++++++++++++
>>  arch/arm64/kvm/sys_regs.c        |  2 +-
>>  3 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
>> index 17bb7e2a2aa0..8fb526764c30 100644
>> --- a/arch/arm64/include/asm/kvm_rmi.h
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -87,6 +87,8 @@ struct realm_rec {
>>  void kvm_init_rmi(void);
>>  u32 kvm_realm_ipa_limit(void);
>>  
>> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
>> +
>>  bool kvm_rmi_supports_sve(void);
>>  bool kvm_rmi_supports_pmu(void);
>>  
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index 8dc090da6e5f..01519d934d3a 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -212,6 +212,28 @@ u32 kvm_realm_ipa_limit(void)
>>  	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_S2SZ);
>>  }
>>  
>> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>> +{
>> +	u32 bps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_BPS);
>> +	u32 wps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_WPS);
>> +	u32 ctx_cmps;
>> +
>> +	if (!kvm_is_realm(vcpu->kvm))
>> +		return val;
>> +
>> +	/* Ensure CTX_CMPs is still valid */
>> +	ctx_cmps = FIELD_GET(ID_AA64DFR0_EL1_CTX_CMPs, val);
>> +	ctx_cmps = min(bps, ctx_cmps);
>> +
>> +	val &= ~(ID_AA64DFR0_EL1_BRPs_MASK | ID_AA64DFR0_EL1_WRPs_MASK |
>> +		 ID_AA64DFR0_EL1_CTX_CMPs);
>> +	val |= FIELD_PREP(ID_AA64DFR0_EL1_BRPs_MASK, bps) |
>> +	       FIELD_PREP(ID_AA64DFR0_EL1_WRPs_MASK, wps) |
>> +	       FIELD_PREP(ID_AA64DFR0_EL1_CTX_CMPs, ctx_cmps);
>> +
>> +	return val;
>> +}
>> +
>>  static int get_start_level(struct realm *realm)
>>  {
>>  	return 4 - stage2_pgtable_levels(realm->ia_bits);
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 46f5e2ab3e2c..83b5c36f43bf 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -2043,7 +2043,7 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>>  	/* Hide BRBE from guests */
>>  	val &= ~ID_AA64DFR0_EL1_BRBE_MASK;
>>  
>> -	return val;
>> +	return kvm_realm_reset_id_aa64dfr0_el1(vcpu, val);
> 
> Hi,
> 
> Nit:
> In other places we condition on kvm_is_realm() to separate
> realm/non-realm paths but here everyone goes into kvm_realm_*, do you
> think it's more consistent to move the kvm_is_realm() check out of this
> function?

Yes I agree that would be more consistent.

Thanks,
Steve

> Thanks,
> Wei-Lin Chang
> 
>>  }
>>  
>>  /*
>> -- 
>> 2.43.0
>>


