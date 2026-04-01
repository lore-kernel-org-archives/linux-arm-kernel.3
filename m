Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD52110F92EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 02:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+c5H3xYBvq45m3uqJDkSguGVIjqh12KSD6gLY13TRw=; b=yfvv/47te1yik0ZfVSBRdFtf/H
	QZT3QxVtNKkBbcTB7vBHbBb7GErCFFYTRPCPIN+czDyJrBmmjL/EVRLDa9p9BhEWLogFlf3g46CAL
	LUoD+uic5pKXnZxuCzRSGdFIh3mLasqt6MnU0aDBdq2sa/h8yPSPnLPH9YdKJ+LJrDG0e5mTwkZH5
	U772dlpFsoEt/k5yIqHfYxvhWmamdXPbHEjMmdN5VKOQ0MXACp6vMRGntcwJ0dGbuWeaAq6eVr56j
	Exb0pwD4qzO8Bwi+RGFIBxGru4OVS9jovWW+do3IaXpr2Zvmt4qitivqcgwf9cxSs7kH6S6qQAf+4
	U/nPNkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lAX-0000000DpsS-13P5;
	Wed, 01 Apr 2026 02:18:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lAU-0000000Dpru-0WJ1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 02:18:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B14C3161;
	Tue, 31 Mar 2026 19:18:46 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26B7B3F7D8;
	Tue, 31 Mar 2026 19:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775009932; bh=OAYHliIlM+bHFdWsU9AAJuB9TaySU2rcmCJ1sAPfzcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kEaO0BkH5h6mtyaUhm0lermJN5ONxSpVxxPfEr2vd+1uHxyeVJu3GRkBBxv5X4hYQ
	 8z0e2XYlHPjjv/0gCxrEU4R8EcFjHqgv3TS9QRPNlBvYqzjxpZBl3UjNaxYDvi/gZf
	 SBq6sZiMoqttAH5a2gyapB8uPgMlnqU08Zyev6e8=
Message-ID: <7694e707-9249-40ee-a053-404bc3e1b734@arm.com>
Date: Wed, 1 Apr 2026 07:48:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/30] KVM: arm64: Hoist MTE validation check out of
 MMU lock path
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-13-maz@kernel.org>
 <8bd2b649-01b5-44f4-a034-c202e226e97c@arm.com> <865x6b4zwh.wl-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <865x6b4zwh.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_191854_296327_1221C712 
X-CRM114-Status: GOOD (  16.58  )
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



On 31/03/26 11:58 PM, Marc Zyngier wrote:
> On Tue, 31 Mar 2026 07:57:48 +0100,
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>
>> On 27/03/26 5:06 PM, Marc Zyngier wrote:
>>> From: Fuad Tabba <tabba@google.com>
>>>
>>> Simplify the non-cacheable attributes assignment by using a ternary
>>> operator. Additionally, hoist the MTE validation check (mte_allowed) out
>>> of kvm_s2_fault_map() and into kvm_s2_fault_compute_prot(). This allows
>>> us to fail faster and avoid acquiring the KVM MMU lock unnecessarily
>>> when the VMM introduces a disallowed VMA for an MTE-enabled guest.
>>>
>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> ---
>>>  arch/arm64/kvm/mmu.c | 28 ++++++++++++----------------
>>>  1 file changed, 12 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>>> index 0c71e3a9af8b0..ee2a548999b1b 100644
>>> --- a/arch/arm64/kvm/mmu.c
>>> +++ b/arch/arm64/kvm/mmu.c
>>> @@ -1870,18 +1870,21 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
>>>  	if (fault->exec_fault)
>>>  		fault->prot |= KVM_PGTABLE_PROT_X;
>>>  
>>> -	if (fault->s2_force_noncacheable) {
>>> -		if (fault->vm_flags & VM_ALLOW_ANY_UNCACHED)
>>> -			fault->prot |= KVM_PGTABLE_PROT_NORMAL_NC;
>>> -		else
>>> -			fault->prot |= KVM_PGTABLE_PROT_DEVICE;
>>> -	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC)) {
>>> +	if (fault->s2_force_noncacheable)
>>> +		fault->prot |= (fault->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
>>> +			       KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
>>> +	else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
>>>  		fault->prot |= KVM_PGTABLE_PROT_X;
>>> -	}
>>
>> Is not the existing code block bit more cleaner though ?
> 
> What is wrong with this? Are you stating a matter of personal taste ?
> > Ternary operators are great at making things more readable by reducing
> the amount of nesting, and I'm all in favour of anything that makes
> this $%^&*( code easier to parse.
> 
> Or are you pointing out a technical issue?

There is no technical issue here. Just that the existing code block
appeared bit easier to read but as you mentioned earlier that is
probably subjective. Never mind and please feel free to ignore this
comment.

