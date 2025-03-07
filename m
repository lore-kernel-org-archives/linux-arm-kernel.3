Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9527C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QODTcsgTD5yMXiVKe+OF+Jq9+cxUR/s/m66SUVGxel0=; b=yCtrR9DjDNMtU6Kc5MiIFg7nhi
	7lWnJeJviVubpEakkCqn7puce21RQijAbocn3CxyM/3EIo7GKgKatmp7Dj+Mic5mALvWXv4m9E49z
	Euc70hoYyvcAvaprXeugPca21oerDJAGgWJGvp/O9c25iHBKsPJV+PxWLRrmLI55+xUT2pxv6R8rU
	hTYZAmDN+S7u9dFXGE8J9iC8HFhTYgYab4QTqLqaiSjh7gjCcHPEYBkcJ6hpIZEwh/tDVZ7/HKgm1
	8bDbPItbbjWFrXcqZaWZwYh02kfkxYwY7JZoNvVeUUrfx2njoVXef4/8jWqGa+8kM20u/uMeTS10W
	EavyosDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZxO-0000000ElIq-2kGb;
	Fri, 07 Mar 2025 15:49:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZrm-0000000Ek3c-1lo7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:44:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8239C1477;
	Fri,  7 Mar 2025 07:44:10 -0800 (PST)
Received: from [10.1.35.22] (e122027.cambridge.arm.com [10.1.35.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D558B3F66E;
	Fri,  7 Mar 2025 07:43:53 -0800 (PST)
Message-ID: <4566d2d1-1f59-49e3-ad75-45c27ac4dfda@arm.com>
Date: Fri, 7 Mar 2025 15:43:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/45] arm64: RME: Allocate/free RECs to match vCPUs
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 <20250213161426.102987-13-steven.price@arm.com>
 <7639eca7-8fd8-491c-90bd-1be084fbd710@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <7639eca7-8fd8-491c-90bd-1be084fbd710@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_074402_550848_F3326F10 
X-CRM114-Status: GOOD (  32.36  )
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

Hi Gavin,

On 03/03/2025 07:08, Gavin Shan wrote:
> On 2/14/25 2:13 AM, Steven Price wrote:
>> The RMM maintains a data structure known as the Realm Execution Context
>> (or REC). It is similar to struct kvm_vcpu and tracks the state of the
>> virtual CPUs. KVM must delegate memory and request the structures are
>> created when vCPUs are created, and suitably tear down on destruction.
>>
>> RECs must also be supplied with addition pages - auxiliary (or AUX)
>> granules - for storing the larger registers state (e.g. for SVE). The
>> number of AUX granules for a REC depends on the parameters with which
>> the Realm was created - the RMM makes this information available via the
>> RMI_REC_AUX_COUNT call performed after creating the Realm Descriptor
>> (RD).
>>
>> Note that only some of register state for the REC can be set by KVM, the
>> rest is defined by the RMM (zeroed). The register state then cannot be
>> changed by KVM after the REC is created (except when the guest
>> explicitly requests this e.g. by performing a PSCI call). The RMM also
>> requires that the VMM creates RECs in ascending order of the MPIDR.
>>
>> See Realm Management Monitor specification (DEN0137) for more
>> information:
>> https://developer.arm.com/documentation/den0137/
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v6:
>>   * Avoid reporting the KVM_ARM_VCPU_REC feature if the guest isn't a
>>     realm guest.
>>   * Support host page size being larger than RMM's granule size when
>>     allocating/freeing aux granules.
>> Changes since v5:
>>   * Separate the concept of vcpu_is_rec() and
>>     kvm_arm_vcpu_rec_finalized() by using the KVM_ARM_VCPU_REC feature as
>>     the indication that the VCPU is a REC.
>> Changes since v2:
>>   * Free rec->run earlier in kvm_destroy_realm() and adapt to previous
>> patches.
>> ---
>>   arch/arm64/include/asm/kvm_emulate.h |   7 ++
>>   arch/arm64/include/asm/kvm_host.h    |   3 +
>>   arch/arm64/include/asm/kvm_rme.h     |  18 +++
>>   arch/arm64/kvm/arm.c                 |  13 +-
>>   arch/arm64/kvm/reset.c               |  11 ++
>>   arch/arm64/kvm/rme.c                 | 179 +++++++++++++++++++++++++++
>>   6 files changed, 229 insertions(+), 2 deletions(-)
>>
> 
> With the following one comment addressed:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
> [...]
> 
>>     /*
>> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/
>> asm/kvm_rme.h
>> index 698bb48a8ae1..5db377943db4 100644
>> --- a/arch/arm64/include/asm/kvm_rme.h
>> +++ b/arch/arm64/include/asm/kvm_rme.h
>> @@ -6,6 +6,7 @@
>>   #ifndef __ASM_KVM_RME_H
>>   #define __ASM_KVM_RME_H
>>   +#include <asm/rmi_smc.h>
>>   #include <uapi/linux/kvm.h>
>>     /**
>> @@ -65,6 +66,21 @@ struct realm {
>>       unsigned int ia_bits;
>>   };
>>   +/**
>> + * struct realm_rec - Additional per VCPU data for a Realm
>> + *
>> + * @mpidr: MPIDR (Multiprocessor Affinity Register) value to identify
>> this VCPU
>> + * @rec_page: Kernel VA of the RMM's private page for this REC
>> + * @aux_pages: Additional pages private to the RMM for this REC
>> + * @run: Kernel VA of the RmiRecRun structure shared with the RMM
>> + */
>> +struct realm_rec {
>> +    unsigned long mpidr;
>> +    void *rec_page;
>> +    struct page *aux_pages[REC_PARAMS_AUX_GRANULES];
>> +    struct rec_run *run;
>> +};
>> +
> 
> REC_PARAMS_AUX_GRANULES represents the maximal number of the auxiliary
> granules.
> Since the base page size is always larger than or equal to granule size
> (4KB).
> The capacity of array @aux_pages[] needs to be REC_PARAMS_AUX_GRANULES.
> Ideally,
> the array's size can be computed dynamically and it's allocated in
> kvm_create_rec().

This is indeed another example of where pages and granules have got
mixed. The RMM specification provides a maximum number of granules (and
there's a similar array in struct rec_params). Here the use of
REC_PARAMS_AUX_GRANULES is just to keep the structure more simple (no
dynamic allocation) with the cost of ~128bytes. Obviously if
PAGE_SIZE>4k then this array could be smaller.

> Alternatively, to keep the code simple, a comment is needed here to
> explain why
> the array's size has been set to REC_PARAMS_AUX_GRANULES.

Definitely a valid point - this could do with a comment explaining the
situation.

> An relevant question: Do we plan to support differentiated sizes between
> page
> and granule? I had the assumption this feature will be supported in the
> future
> after the base model (equal page and granule size) gets merged first.

Yes I do plan to support it. This series actually has the basic support
in it already, with an experimental patch at the end enabling that
support. It "works" but I haven't tested it well and I think some of the
error handling isn't quite right yet.

But there's also a bunch more work to be done (like here) to avoid
over-allocating memory when PAGE_SIZE>4k. E.g. RTTs need an
sub-allocator so that we don't waste an entire (larger) page on each RTT.

Steve


