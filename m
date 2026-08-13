Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA1BC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9AHnt/qAuj3d21YfYVQleWfUbYDuJAIMx2XgoXQLJs=; b=1YVdY8jzE72CGdiHpAQ51rkqDX
	HEl68SvUVtNmRwb385413sO106Ktk9uDQDLOtbqusT7lfbfxM7fyzg3VXfxpjHyKl5NzgDNj5fBWV
	J3dFvVzMJkAkEUMBkQ5JT8Plqor9XQKs5r6D8oo50sqjZ0AIO/WlEtlWP8k5cKI9PdzYC9waGgxjk
	HeiNOXtUliGMcM+7D0qmD0FpOvSk5RFSB49GQeJHjjprV8g1HpwrcUI+uIDT6eRa/sFabTzCVHe8t
	xh5f1hxjt6U+4hVGJziXwbQ+340oc9mb865pQ8bfMjP3KxQWV3dYcWmw1W0WNliUgX0QELBl91jhT
	SCIa3Cyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXMh-000000011dN-36ZJ;
	Thu, 13 Aug 2026 15:29:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXMe-000000011a7-3fBs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:29:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A53021576;
	Thu, 13 Aug 2026 08:28:56 -0700 (PDT)
Received: from [10.1.25.28] (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4323F632;
	Thu, 13 Aug 2026 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786634940; bh=qx6brozNBeh7/y5FVrlrm44UKU9NnyTcp3Fzu62bncE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sAMWfFvJcAMMbsVIdYXF4AHelg8coQX/75cj2gaMrDnQgHTaiozoU4qrQtyqz0sIN
	 wTyQG8mr55x3kblByeYOhJPjgaktX+xgJuoBSorZNKEJj+klMnnp0qL/x00chZ/J+w
	 WnZpf1t3nYT75VqnvhFlXNj0rYkAp3W2wPiSQvGs=
Message-ID: <d107e4bc-dc60-42e3-bfbd-05544f02f207@arm.com>
Date: Thu, 13 Aug 2026 15:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 17/45] KVM: arm64: CCA: Tear down RTTs
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Alper Gun <alpergun@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-18-steven.price@arm.com>
 <CABpDEun3NPr7Na85pmOvdfYQ1DB-2nCcocsyDESXM15bzJU1og@mail.gmail.com>
 <c1f0aad2-33cb-4dab-b54d-d09998fed36e@arm.com>
 <73a03e76-10b1-4e05-b9ea-a2f3b5dc6b3e@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <73a03e76-10b1-4e05-b9ea-a2f3b5dc6b3e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_082905_094677_0904182D 
X-CRM114-Status: GOOD (  22.91  )
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

On 11/08/2026 15:51, Suzuki K Poulose wrote:
> 
> 
> On 04/08/2026 13:16, Suzuki K Poulose wrote:
>> Hi there
>>
>> On 03/08/2026 23:29, Alper Gun wrote:
>>> On Mon, Aug 3, 2026 at 6:45 AM Steven Price <steven.price@arm.com>
>>> wrote:
>>>> [...]
>>>> +static void realm_unmap_stage2(struct kvm *kvm)
>>>> +{
>>>> +       struct realm *realm = &kvm->arch.realm;
>>>> +
>>>> +       lockdep_assert_held(&kvm->arch.config_lock);
>>>> +
>>>> +       if (realm->stage2_unmapped)
>>>> +               return;
>>>> +
>>>> +       write_lock(&kvm->mmu_lock);
>>>> +       kvm_stage2_unmap_range(&kvm->arch.mmu, 0,
>>>> +                              BIT(realm->ia_bits - 1), true);
>>>> +       write_unlock(&kvm->mmu_lock);
>>>> +
>>>> +       realm->stage2_unmapped = true;
>>>> +}
>>>> +
>>>> +int kvm_realm_teardown_stage2(struct kvm *kvm)
>>>> +{
>>>> +       lockdep_assert_held(&kvm->arch.config_lock);
>>>> +
>>>> +       realm_unmap_stage2(kvm);
>>>> +       return realm_destroy_rtts(kvm);
>>>> +}
>>>
>>> Hi Steven,
>>>
>>> I noticed a warning in dmesg when destroying a realm:
>>>
>>>    [  158.533495] Call trace:
>>>    [  158.535927]  kvm_destroy_realm+0x208/0x218
>>>    [  158.540356]  kvm_arch_destroy_vm+0xc8/0xd8
>>>    [  158.544439]  kvm_put_kvm+0x324/0x4b0
>>>    [  158.548002]  kvm_vm_stats_release+0x1c/0x38
>>
>> Thanks for the report and the detailed analysis.
>>
>>>
>>> I traced this and found the following:
>>>
>>> At this point, calling realm_destroy_rtts() may fail destroying the RTTs
>>> because RECs are still active and the Realm is not terminated, but the
> 
> May be we should bail out early in the realm_map_ipa() based on the
> state of the Realm (i.e. state != ACTIVE). But looking at this
> I see that we serialize the state of the realm using the config_lock,
> which is a bit odd.

Bailing out early in realm_map_ipa() if the VM isn't ACTIVE makes sense,
I'm not sure if it's truly necessary but it's a good defensive check.

>>> walk finishes and still sets realm->rtts_destroyed = true.
>>>
>>> Later, kvm_destroy_realm() calls rmi_realm_terminate() and then calls
>>> realm_destroy_rtts(kvm) again. But because realm->rtts_destroyed is
>>> already
>>> set to true, it exits early without tearing down the RTTs.
>>>
>>> Consequently, rmi_realm_destroy() is invoked while the RTT tables still
>>> exist in RMM, which fails and triggers WARN_ON(rmi_realm_destroy).
>>>
>>> The fix I used was to remove realm_destroy_rtts() from
>>> kvm_realm_teardown_stage2():
>>> --- a/arch/arm64/kvm/rmi.c
>>> +++ b/arch/arm64/kvm/rmi.c
>>> @@ -434,7 +434,7 @@ int kvm_realm_teardown_stage2(struct kvm *kvm)
>>>    lockdep_assert_held(&kvm->arch.config_lock);
>>>
>>>    realm_unmap_stage2(kvm);
>>> - return realm_destroy_rtts(kvm);
>>> + return 0;
>>>   }
>>>
>>> I think we don't need RTT destruction here as it will be handled
>>> cleanly in
>>> kvm_destroy_realm() later.

Ack - yes this is now unnecessary. Thanks for tracking this down.

>> That sounds sensible to me, I will take a look and fix it locally for
>> the next version.
> 
> On a second look, I think the rtts_destroyed flag may not be saving us
> much. If the RTTs are destroyed, we should complete the second round
> fairly easily.

Agreed, I think dropping rtts_destroyed makes sense - it's not actually
helping and it's making the code confusing.

Thanks,
Steve

> Suzuki
> 
>>
>>
>> Thanks
>> Suzuki
>>
>>>
>>> Thanks,
>>> Alper
>>
> 


