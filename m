Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4BEC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHoBhGqGKQXRPITvyAxkiZxtqGfpxHmGdiHC/l7f53k=; b=PLQCH+3P5txmKrncbAVC61lR8S
	noWgeBQUsIdwyyiVg2C6TYE3aV0wEams3O/AA6mt/ui16nIT2keG2riL3/x4Ljg+t58Cmu1OEWmp6
	mWN42tX4VHaaK+NCvUJV9U+Wa0N3UwRSSTO89PbaNz60T/Ow+6rWNtl7Kn+eWooz86adi5pKxr1ok
	IJViQ7XCvkGSsVdGY5CO4fVx+uSWqa5KGqWskXR16jrcmIHnoJHzUfRmNrlSeI2X6zqjBB8FWC8YO
	XbzeLPaUBfMPoUnjKZyPKvDx3G7GZOllB8ybLHALsVasIqoNYIYSBOM6yFBfx27MYzihqphp1ZIDB
	9aAYWYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2Wl-0000000FTSA-39vc;
	Wed, 15 Jul 2026 16:32:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2Wj-0000000FTRm-2Sqq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:32:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84252152B;
	Wed, 15 Jul 2026 09:31:59 -0700 (PDT)
Received: from [10.1.25.27] (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAAE93F7B4;
	Wed, 15 Jul 2026 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784133123; bh=YEfGwbfCCDQLg/NWb7ORac95kV+EGg+EboFB0vctntM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EsnnfkBLkUlVpcHHNTfvAfYqDrvm/mannNNibJNPyWFan+lyzGNnEwYw7RTUJaujr
	 mT44hxReEcWVNie5MDgDs9a2HVsuOkycUohPyMHxstT0Dq9sC532UfxFDx7wpnkO4I
	 0oNFw4lnqb0uYKfNqSDRuJKCtEOW9eIH2Ueclun8=
Message-ID: <a008d2b9-1eff-4de7-add8-ef8e95efd439@arm.com>
Date: Wed, 15 Jul 2026 17:31:57 +0100
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
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <87y0fc43ut.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_093205_716710_ADC5DAE6 
X-CRM114-Status: GOOD (  16.85  )
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

On 15/07/2026 17:25, Marc Zyngier wrote:
> On Wed, 15 Jul 2026 17:15:31 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> On 15/07/2026 16:46, Marc Zyngier wrote:
>>> On Wed, 15 Jul 2026 15:28:28 +0100,
>>> Steven Price <steven.price@arm.com> wrote:
>>>>
>>>> The RMM doesn't allow injection of a undefined exception into a realm
>>>> guest. Add a WARN to catch if this ever happens.
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>> ---
>>>> Changes since v6:
>>>>  * if (x) WARN(1, ...) makes no sense, just WARN(x, ...)!
>>>> ---
>>>>  arch/arm64/kvm/inject_fault.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
>>>> index 6492397b73d7..613f223bc7a3 100644
>>>> --- a/arch/arm64/kvm/inject_fault.c
>>>> +++ b/arch/arm64/kvm/inject_fault.c
>>>> @@ -327,6 +327,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
>>>>   */
>>>>  void kvm_inject_undefined(struct kvm_vcpu *vcpu)
>>>>  {
>>>> +	WARN(vcpu_is_rec(vcpu), "Unexpected undefined exception injection to REC");
>>>>  	if (vcpu_el1_is_32bit(vcpu))
>>>>  		inject_undef32(vcpu);
>>>>  	else
>>>
>>> No. WARN_ONCE at a push, but even then, this looks dodgy.
>>
>> Yep WARN_ONCE() would be better. This function should never be called
>> for a realm guest.
>>
>>> Exceptions must be injectable. Otherwise, how do you respond to, for
>>> example, a sysreg access for a feature that is hidden from the guest?
>>
>> The RMM doesn't allow the host to inject exceptions - with the exception
>> of SEA after a host-emulated MMIO.
>>
>>> Will the RMM perform this in KVM's stead?
>>
>> Yes the RMM would have to handle this for the likes of sysreg accesses.
>> The host doesn't control the trapping of sysreg accesses. There are a
>> few GIC-related registers which are forwarded to the host ("REC exit due
>> to system register access") but generally the handling of sysregs is
>> entirely internal to the RMM.
> 
> Then the only option is not to just warn, but to mark all realms as
> dead and refuse to run them any further. If we can't inject an
> exception and that the RMM isn't doing its job, I can't see how we can
> continue at all.

You've got a point - I'm not sure whether it's entirely reasonable to
refuse to run any realm, but it certainly would be sensible to mark the
guest which triggers this as dead. Would a KVM_BUG() be more appropriate
here?

Thanks,
Steve


