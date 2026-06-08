Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48986CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RujCOXI6XwVipzbByTYWVUFkr13+AaJM0eBqV130tec=; b=p18ujwtzWGF9IAkBEOQH9ylIg3
	l4R3gc8LpJuAa4yo3DR+0adhG8RTxn930QbVBOq7fx99jMGuc0Rtf1LWqnCrjURrbEX0c93OmmegK
	mvVA5QdwEf+HtmIlFvblT+7fwcXhFYBcL1e68IRVAKR5fdOjBa3vkJe/79acqEhIDyKrffrkLDTTg
	JCOjzCEsRT/9p8+lEoRTKMjymz/EsUSoL2qLu+ExNyB8+a1U7OWkCQTRX43vtlunj8f8z0zKZOjrT
	shMLH6eELHA/GdRQaE4tX2SZE7yi9QprmWzTH7MS0zwUrqmO2ayutwgpu6TBT0rDyNep7vAbnSpXZ
	t2lfWQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaQZ-00000003f1e-1Ama;
	Mon, 08 Jun 2026 13:54:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaQW-00000003f1C-0oTx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:54:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FD22244B;
	Mon,  8 Jun 2026 06:53:57 -0700 (PDT)
Received: from [10.57.28.93] (unknown [10.57.28.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B1E43F86F;
	Mon,  8 Jun 2026 06:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780926842; bh=zyFb9/SAECng/VTwTudQLxjUQyq0g0AZM0OK2JIT8NA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Am229GtpwnsAOTgPNgH0rKMU0izNXaGe3sEaiDNq7CSGq+5bEqKfsCQAYLrBmWu9g
	 R3SFvmmvI0pML1LYEXP6f3iuiDl8j4v8RrDvp7FFT4rwKDMIrcT7jYncMiFsWKki02
	 FZWtyD5eqhQTmw5GvKPFroyhVAwfW/ZXzGJk0H/A=
Message-ID: <9631be66-c757-488d-bb66-a62698aa26b8@arm.com>
Date: Mon, 8 Jun 2026 14:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 26/44] arm64: RMI: Allow populating initial contents
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Gavin Shan <gshan@redhat.com>,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-27-steven.price@arm.com>
 <ea4be6c5-9506-4253-80c5-c76c9ac3b77d@redhat.com>
 <0c71b4b8-ad0b-4a24-9f4a-180b2aaacdb6@arm.com>
 <ad45c64c-18ab-4d42-9813-0ac1704bb127@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <ad45c64c-18ab-4d42-9813-0ac1704bb127@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065404_343934_58BA8755 
X-CRM114-Status: GOOD (  13.93  )
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

On 08/06/2026 10:41, Suzuki K Poulose wrote:
> On 08/06/2026 10:36, Steven Price wrote:
>> On 28/05/2026 06:30, Gavin Shan wrote:
>>> Hi Steve,
>>>
>>> On 5/13/26 11:17 PM, Steven Price wrote:
>>>> The VMM needs to populate the realm with some data before starting
>>>> (e.g.
>>>> a kernel and initrd). This is measured by the RMM and used as part of
>>>> the attestation later on.
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> ...
> 
>>>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>>>> index a89873a5eb77..209087bcf399 100644
>>>> --- a/arch/arm64/kvm/rmi.c
>>>> +++ b/arch/arm64/kvm/rmi.c
>>>> @@ -486,6 +486,75 @@ void kvm_realm_unmap_range(struct kvm *kvm,
>>>> unsigned long start,
>>>>            realm_unmap_private_range(kvm, start, end, may_block);
>>>>    }
>>>>    +static int realm_data_map_init(struct kvm *kvm, unsigned long ipa,
>>>> +                   kvm_pfn_t dst_pfn, kvm_pfn_t src_pfn,
>>>> +                   unsigned long flags)
>>>> +{
>>>> +    struct realm *realm = &kvm->arch.realm;
>>>> +    phys_addr_t rd = virt_to_phys(realm->rd);
>>>> +    phys_addr_t dst_phys, src_phys;
>>>> +    int ret;
>>>> +
>>>> +    dst_phys = __pfn_to_phys(dst_pfn);
>>>> +    src_phys = __pfn_to_phys(src_pfn);
>>>> +
>>>> +    if (rmi_delegate_page(dst_phys))
>>>> +        return -ENXIO;
>>>> +
>>>> +    ret = rmi_rtt_data_map_init(rd, dst_phys, ipa, src_phys, flags);
>>>> +    if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>>>> +        /* Create missing RTTs and retry */
>>>> +        int level = RMI_RETURN_INDEX(ret);
>>>> +
>>>> +        KVM_BUG_ON(level == KVM_PGTABLE_LAST_LEVEL, kvm);
>>>
>>>          KVM_BUG_ON(level >= KVM_PGTABLE_LAST_LEVEL, kvm);
>>
>> Ack.
>>
> 
> Thinking more about this, I guess a buggy VMM can trigger this
> by populating twice ? (level == KVM_PGTABLE_LAST_LEVEL). So, we should
> return the error back, than warning here and suppressing the error ?

Populating twice causes rmi_delegate_page() to be run twice on the same
page and the second one will then fail. So I don't think this is
possible (please correct me if I've missed something!)

Thanks,
Steve

