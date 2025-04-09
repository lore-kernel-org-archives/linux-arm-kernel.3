Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A8AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6J6WTvk794vBzL/QLxvZvIPax5OTTVkjUzMu/+XE/k=; b=wO4gOMaLSs0I4gjkZP+La0UfSH
	vIOZWkR/1qtKQ5r7LkiAifJH51k5w9n+KhOu8Knzk4uGMBgiA9XxRCDQigF8T5PgMcDI+Qee538jI
	jSX+NQLoYPLXks/f8YXZ8HXQOlOYhTYX7qP5K8jpMkbWiouKPiD51V0Br50o4GHyqzglA2bqf0P7b
	OEauzqIyhQbMnY7j/kXceBTHJRrp1t2rxaI6QpDs5AePe01KDecKG74h6cF4hiZqOsYA3YJ4N0IUe
	For+CXCiyZWjy0RU4BjyQolOV6K8GAgFs9jGFHjnmd4EkIP4dT4w4RjUOjVuVbtAKw6d2cG4x9nlv
	YmJp0S5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZIR-000000083Tk-1u50;
	Wed, 09 Apr 2025 17:33:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZGe-000000083AA-1jgj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:31:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A626E15A1;
	Wed,  9 Apr 2025 10:31:13 -0700 (PDT)
Received: from [10.57.89.24] (unknown [10.57.89.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79A673F694;
	Wed,  9 Apr 2025 10:31:08 -0700 (PDT)
Message-ID: <6ccce610-62ba-484a-a8a0-d63b9081b037@arm.com>
Date: Wed, 9 Apr 2025 18:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 28/45] arm64: rme: support RSI_HOST_CALL
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-29-steven.price@arm.com>
 <12b5ba41-4b1e-4876-9796-d1d6bb344015@redhat.com>
 <54f1fbb1-4fa1-4b09-bbac-3afcbb7ec478@arm.com>
 <b76ffc1c-32e1-4bf6-916a-41af9378fb4b@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <b76ffc1c-32e1-4bf6-916a-41af9378fb4b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_103116_541321_258426BD 
X-CRM114-Status: GOOD (  25.87  )
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

On 08/04/2025 06:19, Gavin Shan wrote:
> On 4/8/25 2:34 AM, Steven Price wrote:
>> On 04/03/2025 06:01, Gavin Shan wrote:
>>> On 2/14/25 2:14 AM, Steven Price wrote:
>>>> From: Joey Gouly <joey.gouly@arm.com>
>>>>
>>>> Forward RSI_HOST_CALLS to KVM's HVC handler.
>>>>
>>>> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> ---
>>>> Changes since v4:
>>>>    * Setting GPRS is now done by kvm_rec_enter() rather than
>>>>      rec_exit_host_call() (see previous patch - arm64: RME: Handle
>>>> realm
>>>>      enter/exit). This fixes a bug where the registers set by user
>>>> space
>>>>      were being ignored.
>>>> ---
>>>>    arch/arm64/kvm/rme-exit.c | 22 ++++++++++++++++++++++
>>>>    1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
>>>> index c785005f821f..4f7602aa3c6c 100644
>>>> --- a/arch/arm64/kvm/rme-exit.c
>>>> +++ b/arch/arm64/kvm/rme-exit.c
>>>> @@ -107,6 +107,26 @@ static int rec_exit_ripas_change(struct kvm_vcpu
>>>> *vcpu)
>>>>        return -EFAULT;
>>>>    }
>>>>    +static int rec_exit_host_call(struct kvm_vcpu *vcpu)
>>>> +{
>>>> +    int ret, i;
>>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>>> +
>>>> +    vcpu->stat.hvc_exit_stat++;
>>>> +
>>>> +    for (i = 0; i < REC_RUN_GPRS; i++)
>>>> +        vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
>>>> +
>>>> +    ret = kvm_smccc_call_handler(vcpu);
>>>> +
>>>> +    if (ret < 0) {
>>>> +        vcpu_set_reg(vcpu, 0, ~0UL);
>>>> +        ret = 1;
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>
>>> I don't understand how a negative error can be returned from
>>> kvm_smccc_call_handler().
>>
>> I don't believe it really can. However kvm_smccc_call_handler() calls
>> kvm_psci_call() and that has a documentation block which states:
>>
>>   * This function returns: > 0 (success), 0 (success but exit to user
>>   * space), and < 0 (errors)
>>   *
>>   * Errors:
>>   * -EINVAL: Unrecognized PSCI function
>>
>> But I can't actually see code which returns the negative value...
>>
> 
> I think the comments for kvm_psci_call() aren't correct since its return
> value
> can't be negative after 7e484d2785e2 ("KVM: arm64: Return NOT_SUPPORTED
> to guest
> for unknown PSCI version"). The comments should have been adjusted in
> that commit.
> 
> Please take a look on 37c8e4947947 ("KVM: arm64: Let errors from SMCCC
> emulation
> to reach userspace"). Similarly, the block of code to set GPR0 to ~0ULL
> when negative
> error is returned from kvm_smccc_call_handler() in this patch needs to
> be dropped.
> 
>>> Besides, SMCCC_RET_NOT_SUPPORTED has been set to GPR[0 - 3] if the
>>> request can't be
>>> supported. Why we need to set GPR[0] to ~0UL, which corresponds to
>>> SMCCC_RET_NOT_SUPPORTED
>>> if I'm correct. I guess change log or a comment to explain the questions
>>> would be
>>> nice.
>>
>> I'll add a comment explaining we don't expect negative codes. And I'll
>> expand ~0UL to SMCCC_RET_NOT_SUPPORTED which is what it should be.
>>
> 
> Please refer to the above reply. The block of code needs to be dropped.

Thanks for the pointers, I had not been aware of that change. Yes this
code should be updated to match.

Thanks,
Steve

>> Thanks,
>> Steve
>>
>>>>    static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
>>>>    {
>>>>        struct realm_rec *rec = &vcpu->arch.rec;
>>>> @@ -168,6 +188,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int
>>>> rec_run_ret)
>>>>            return rec_exit_psci(vcpu);
>>>>        case RMI_EXIT_RIPAS_CHANGE:
>>>>            return rec_exit_ripas_change(vcpu);
>>>> +    case RMI_EXIT_HOST_CALL:
>>>> +        return rec_exit_host_call(vcpu);
>>>>        }
>>>>          kvm_pr_unimpl("Unsupported exit reason: %u\n",
>>>
> 
> Thanks,
> Gavin
> 


