Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDE3F459EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dOd3b6dhdGXmqqK78Lid06Cxk0cuNXyK59TkBMLpgI=; b=KWdczZZHlxKgzVpSJ10VnK+86y
	EMWvLWg3BB9AbPaPkWwpraXxZbe0wgRJveCFLLzDJJnV2qhrVTFZQiWqhDgv4T56WetGbYH4xV1VV
	1vOs7Fnk7ZwdkhHg0cqnrxA2XJq86+PsnCurTHVExJ4EcuZALTDdSTeFehCA+BYghTPhETTyUEuOC
	qERqMsArjkZfUcVwz9PpfWj71vEp97w3HoGel3d8hjGwU+nHjC19SovfO5a1tCLvxF4/VbBY3/Poz
	l5Hd2jxcbbDYXgT6bWwQGHCb1DTqmc+JXCJkhuuFLANvTka+Iy/GDNUfHpQ5ph1pE0P4x8InuypcU
	8Kds4aaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDWd-0000000CQKZ-36fJ;
	Fri, 10 Apr 2026 15:12:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDWb-0000000CQKB-3igV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 15:12:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF6073543;
	Fri, 10 Apr 2026 08:11:53 -0700 (PDT)
Received: from [10.1.29.18] (e122027.cambridge.arm.com [10.1.29.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C44743FAA1;
	Fri, 10 Apr 2026 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775833919; bh=mfZ7HV7qOdJ4SYmi9ANL32i5NeQMgCmP8MyF+qFXJPM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AyxViiHBDTJMe09anT05P8KCOR+UkoSMxjgP54ID7bmaEz0IJ8qgxDZzrfPPnmhju
	 oIj3ZBOQaxAdcEMThJNMzmKBfEwoxraWqCPGU8mo9t8KlW97mznJGEMOLdcFdwkWnj
	 QVdNdClinPqrUv00O5rMgY46Mb1kZiT5ypjR3dDk=
Message-ID: <ac4e789d-1906-4447-8e98-f6878a513f3d@arm.com>
Date: Fri, 10 Apr 2026 16:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 20/48] arm64: RMI: Handle realm enter/exit
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-21-steven.price@arm.com>
 <8929a008-0991-4e3c-98a1-f00af47dd0ff@arm.com>
 <02582577-3701-4d5c-88c6-3ce0b3328377@arm.com>
 <c4e30ad1-6fbe-448f-a9fe-6a2480581082@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <c4e30ad1-6fbe-448f-a9fe-6a2480581082@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_081201_983306_8F43E81D 
X-CRM114-Status: GOOD (  14.35  )
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

On 23/03/2026 10:03, Suzuki K Poulose wrote:
> On 20/03/2026 16:32, Steven Price wrote:
>> On 20/03/2026 14:08, Suzuki K Poulose wrote:
>>> On 18/03/2026 15:53, Steven Price wrote:

[...]

>>>> +int noinstr kvm_rec_enter(struct kvm_vcpu *vcpu)
>>>> +{
>>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>>> +    int ret;
>>>> +
>>>> +    guest_state_enter_irqoff();
>>>> +    ret = rmi_rec_enter(virt_to_phys(rec->rec_page),
>>>> +                virt_to_phys(rec->run));
>>>
>>> In the normal VM case, we try to fixup some of the exits (e.g., GIC
>>> CPUIF register accesses) which may be applicable to Realms. Do we
>>> need such fixups here ? Given the cost of world switch, it is
>>> debatable whether it matters or not.
>>
>> I'm not really sure what you are referring to here. Can you point me at
>> the normal VM case? This function is the equivalent of
>> kvm_arm_vcpu_enter_exit().
> 
> This happens via fixup_guest_exit() in either vhe/nvhe cases. The VGIC
> registers are emulated in the fast path for normal VMs (when trapping is
> enabled)

Ah, I see what you mean. Yes the VGIC emulation in theory could be
shortcut and speeded up slightly. I'd prefer to leave this sort of pure
optimisation until the basic support is merged to keep the size of the
series (vaguely) under control.

I think it would also be worth doing some benchmarking on a real
platform to see whether it really makes a meaningful difference (or
whether we need to push for an architectural change moving more
processing into the RMM).

Thanks,
Steve


