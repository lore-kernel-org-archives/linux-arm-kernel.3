Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35611CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 05:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOxe5I/AZyb/UQAXBeAsbDJ5y+6DhrZBYHA9NYhjog8=; b=pm8jhA6q9XaX+gZs447oY/AIUa
	MJxj6QWRmArmT4Q71kt1pr48iIES0bn1dqJDSFjm/PjIT7bMx7qVjzjgGilb2csDEuOyPXfp5cA5e
	hIUT5nT0f9uOtaSUwqutSQbLrvJB0cVmVZpk9eP/gZu0LqvpGmoF5ue5ITIYDOT6/HO6MUbfBVHl2
	ogtYpRv076GYBV8zoJHRx5JRkLlpAurSSHYSsYniOIkjCDZA98CiFe/2O2rHPGz7P/bGqkNaFIM+O
	9D4Zo4J02yW7bs6Sus56bvVTgvttRz8yLjBmbi2GlBofV3nXdZfF5AEEaSQBQnSy2t/5mqWIRtqum
	dsvYgVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxQU-00000000399-3cKJ;
	Tue, 06 Oct 2026 05:09:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxQR-0000000038f-2WyV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 05:09:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD8A71595;
	Mon,  5 Oct 2026 22:09:10 -0700 (PDT)
Received: from [10.57.10.233] (unknown [10.57.10.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 346BC3F763;
	Mon,  5 Oct 2026 22:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791263354; bh=pucEWuti4eI8C1TIGnOlgVd8hOoodN55Yfj70uLt46Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ieN7Mhfm+583ckxOpzcQ0TPToOxynyRRUkZjdJtRAl0AohNUgC5EsQaW8hmhw+y6s
	 m4YIkSwSBHboyH6NXYPwiaKt84uTG6AQVkQoy7qfwZlUjJCxi32DDzHB8JZpZyr9R8
	 Feiu2FdOOHzqjNSLn1nMUW2N0kwJMmw6NOhpHQzQ=
Message-ID: <43bfa699-f35d-4f0a-bebd-3e955dd82112@arm.com>
Date: Tue, 6 Oct 2026 07:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 16/23] KVM: arm64: CCA: Add VCPU load/put for Realms
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-17-suzuki.poulose@arm.com>
 <fdc81d01-27df-4557-80bf-80d4527e4bf2@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <fdc81d01-27df-4557-80bf-80d4527e4bf2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_220915_923831_B4568C43 
X-CRM114-Status: GOOD (  15.99  )
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


Hi Gavin

On 06/10/2026 04:16, Gavin Shan wrote:
> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>> RMM controls the VCPU settings and most are hidden from the KVM, except
>> for the VGIC and timer bits.
>>
>> A later patch would add syncing the VCPU state into the Realm REC related
>> SMC parameters.

This is what you are looking for ^^^

>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/kvm/arm.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 6c81fec35ecec..294cea4cc8271 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -802,6 +802,13 @@ static void pkvm_vcpu_load(struct kvm_vcpu *vcpu)
>>                 &vcpu->arch.vgic_cpu.vgic_v3);
>>   }
>> +static void realm_vcpu_load(struct kvm_vcpu *vcpu)
>> +{
>> +    kvm_timer_vcpu_load(vcpu);
>> +    kvm_vgic_load(vcpu);
>> +    vcpu_set_wfx_traps(vcpu);
> 
> Why we need to call vcpu_set_wfx_traps(), which updates 'vcpu- 
>  >arch.hcr_el2'? I don't
> see how 'vcpu->arch.hcr_el2' is affects realm in RMM. Could you please 
> explain in the
> commit log.

See above.


Cheers
Suzuki

> 
>> +}
>> +
>>   void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>>   {
>>       vcpu->cpu = cpu;
>> @@ -854,6 +861,12 @@ static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
>>       kvm_vcpu_pmu_restore_host(vcpu);
>>   }
>> +static void realm_vcpu_put(struct kvm_vcpu *vcpu)
>> +{
>> +    kvm_timer_vcpu_put(vcpu);
>> +    kvm_vgic_put(vcpu);
>> +}
>> +
>>   void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>>   {
>>       vcpu->arch.vcpu_ops->vcpu_put(vcpu);
>> @@ -2213,6 +2226,11 @@ static const struct kvm_vcpu_ops pkvm_vcpu_ops = {
>>       .vcpu_put = pkvm_vcpu_put,
>>   };
>> +static const struct kvm_vcpu_ops realm_vcpu_ops = {
>> +    .vcpu_load = realm_vcpu_load,
>> +    .vcpu_put = realm_vcpu_put,
>> +};
>> +
>>   #define KVM_VCPU_OPS(flavor, ops)        \
>>       [(flavor)] = &(ops)
> 
> Thanks,
> Gavin
> 
> 


