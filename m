Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C57C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDXuUuxC6Ep6H1u8oS8xy+op2PojubWz7MzzsmR4bcQ=; b=YcO7FG9Ovejf/FuRN0BTK5AZxK
	HfTqWD/2wsTjQCtRgiaf8H48Jlvws95QMINfszuKAPYfRH18rdQ035bc7zAnj7ow6QnDuaX2Hmb0s
	7irmrbax7yUD5f09D5cRtPKEwTvwutKtu/zVgIPRMkJCXYqESMqnEE80otA7+h9NV6AJYWrZewc0w
	hOyHNqgkxdqy+6B0CA6VhveAiup0gx5/Azsz27Cj3pjy5wduPqw9qhT+7ki/HfhFUUa7VInRB6dUn
	Dz+gnug7P6g9aHnpF3ImNo2UHyeSPp90uBrKcLLAncLmjJQNM1YX6plnOjS0wdfn5IqZ/Sg5UGpQt
	52rVAhuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIDl-0000000Gpxm-2tFK;
	Thu, 16 Jul 2026 09:17:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIDi-0000000GpxC-2qkS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:17:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F21932B;
	Thu, 16 Jul 2026 02:17:24 -0700 (PDT)
Received: from [10.1.25.27] (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 680983F905;
	Thu, 16 Jul 2026 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784193449; bh=wdYx3+YNGnsFo6b1NUuQGLAt2raF/4qY6EFyhZqiuG4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cLVu4Z9+/QXVWXfAzHRXcm4PHZYn3Gd+z293ifRV08TEld6cScveN0UqkHhTPUzKU
	 JvmlyRcNuL30vC6NdJh7eRjy5fOOras8FL78e0e/H6v2F1gKrfKtouUekpcGXAiH9V
	 3lVlkTVO6EXeot92tKnK6sA+vDT2BmKLQ2KaJ0+k=
Message-ID: <a68aca43-d662-42f0-863c-745a0fccac39@arm.com>
Date: Thu, 16 Jul 2026 10:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 26/37] KVM: arm64: WARN on injected undef exceptions
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
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
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-27-steven.price@arm.com> <8733xk5k7v.wl-maz@kernel.org>
 <ec0f52d4-666d-4b6f-b010-eb0391fa53a7@arm.com> <87y0fc43ut.wl-maz@kernel.org>
 <a008d2b9-1eff-4de7-add8-ef8e95efd439@arm.com> <87wluw430e.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <87wluw430e.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_021730_840932_E2144FDD 
X-CRM114-Status: GOOD (  24.71  )
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

On 15/07/2026 17:43, Marc Zyngier wrote:
> On Wed, 15 Jul 2026 17:31:57 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> On 15/07/2026 17:25, Marc Zyngier wrote:
>>> On Wed, 15 Jul 2026 17:15:31 +0100,
>>> Steven Price <steven.price@arm.com> wrote:
>>>>
>>>> On 15/07/2026 16:46, Marc Zyngier wrote:
>>>>> On Wed, 15 Jul 2026 15:28:28 +0100,
>>>>> Steven Price <steven.price@arm.com> wrote:
>>>>>>
>>>>>> The RMM doesn't allow injection of a undefined exception into a realm
>>>>>> guest. Add a WARN to catch if this ever happens.
>>>>>>
>>>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>>>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>>>> ---
>>>>>> Changes since v6:
>>>>>>  * if (x) WARN(1, ...) makes no sense, just WARN(x, ...)!
>>>>>> ---
>>>>>>  arch/arm64/kvm/inject_fault.c | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
>>>>>> index 6492397b73d7..613f223bc7a3 100644
>>>>>> --- a/arch/arm64/kvm/inject_fault.c
>>>>>> +++ b/arch/arm64/kvm/inject_fault.c
>>>>>> @@ -327,6 +327,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
>>>>>>   */
>>>>>>  void kvm_inject_undefined(struct kvm_vcpu *vcpu)
>>>>>>  {
>>>>>> +	WARN(vcpu_is_rec(vcpu), "Unexpected undefined exception injection to REC");
>>>>>>  	if (vcpu_el1_is_32bit(vcpu))
>>>>>>  		inject_undef32(vcpu);
>>>>>>  	else
>>>>>
>>>>> No. WARN_ONCE at a push, but even then, this looks dodgy.
>>>>
>>>> Yep WARN_ONCE() would be better. This function should never be called
>>>> for a realm guest.
>>>>
>>>>> Exceptions must be injectable. Otherwise, how do you respond to, for
>>>>> example, a sysreg access for a feature that is hidden from the guest?
>>>>
>>>> The RMM doesn't allow the host to inject exceptions - with the exception
>>>> of SEA after a host-emulated MMIO.
>>>>
>>>>> Will the RMM perform this in KVM's stead?
>>>>
>>>> Yes the RMM would have to handle this for the likes of sysreg accesses.
>>>> The host doesn't control the trapping of sysreg accesses. There are a
>>>> few GIC-related registers which are forwarded to the host ("REC exit due
>>>> to system register access") but generally the handling of sysregs is
>>>> entirely internal to the RMM.
>>>
>>> Then the only option is not to just warn, but to mark all realms as
>>> dead and refuse to run them any further. If we can't inject an
>>> exception and that the RMM isn't doing its job, I can't see how we can
>>> continue at all.
>>
>> You've got a point - I'm not sure whether it's entirely reasonable to
>> refuse to run any realm, but it certainly would be sensible to mark the
> 
> If the RMM is not playing ball by not doing its part of the bargain,
> the only sane option is stop talking to it immediately. Who knows what
> else the implementation got wrong?

If the RMM isn't playing ball then we're in trouble whatever. Refusing
to talk to the RMM ensures that we wouldn't be able to reclaim any of
the memory that has been donated to the guest (or related RMM metadata).
It also doesn't rule out that a faulty RMM has left a minefield of
"delegated" memory which could cause a GPF at any moment. In reality the
only "safe" option is to BUG() the kernel and completely give up.

But the chances are that the RMM hasn't suddenly become malicious, and
in most likely the situation is that we've hit a corner case which in
the RMM which is highly likely to only affect the one guest.
"panic_on_warn" is available for those who would prefer the system to
stop in these situations.

And of course it's entirely possible that the bug is in Linux and the
RMM is playing ball it's just that I've screwed something up. In which
case the realm VM is probably screwed, but the rest of the system
(including other guests) should be absolutely fine.

I can of course code up a "rmm_is_bugged" flag and litter the code with
paths to handle that - but I can't imagine that's actually what you
want. Although please do let me know if I'm wrong, I seem to have
misplaced my mind reading hat ;)

>> guest which triggers this as dead. Would a KVM_BUG() be more appropriate
>> here?
> 
> That's the absolutely minimal option. Not necessarily the safe one.

I'm not sure how to make it "safer" - I don't think there is a
completely "safe" option for this "should never happen" case.

Thanks,
Steve


