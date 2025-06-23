Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA34AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ADvpydypDshbyoce9QNw9M6/PzaJFhusIDHSDHyEJw=; b=PMVPaOZtFrRsyHPUS+jO8VHvsw
	EdPA1Db5Mj3TUddfCivcWP+acEeQBLb5U2lnuKQFzl3XLmgwKe2amKDYo1U+hOfebHdCsoHLnf3U6
	xCVYS4tKtn4yuG2+wk5+3RJoghQYEycwANkFOP6FzdvOLSWNnmtXvdjqNLGgWs+/2lrEvesZQA9Ri
	399oy+8MJrQQpdaduBxgah5PdmlAEF08t1+iDGZhdgMOfzjFhO1sxvvVYx45Jz1dDZvGcT21bXQRz
	CsJKYOI8jCsRiKziz+yLJS2gms6EdCjjD+LZil/yJuyvdAaYxQ/iWm0vlb0URm+tHhkT1nmi13vNZ
	lp9hXpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTljW-00000003fMl-2UFY;
	Mon, 23 Jun 2025 18:17:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiQO-000000036N0-20DQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:45:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCD5B113E;
	Mon, 23 Jun 2025 07:45:10 -0700 (PDT)
Received: from [10.57.29.183] (unknown [10.57.29.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D6493F66E;
	Mon, 23 Jun 2025 07:45:23 -0700 (PDT)
Message-ID: <6c0e7cce-fb63-4f08-9907-9a58e0326bd3@arm.com>
Date: Mon, 23 Jun 2025 15:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/43] arm64: RME: ioctls to create and configure
 realms
To: zhuangyiwei <zhuangyiwei@huawei.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
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
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 zhouguangwei5@huawei.com, wangyuan46@huawei.com
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-8-steven.price@arm.com>
 <b3b709c2-a154-4b1a-b6bd-7075e6a57fd2@huawei.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <b3b709c2-a154-4b1a-b6bd-7075e6a57fd2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074532_622771_E5B7FE3A 
X-CRM114-Status: GOOD (  20.49  )
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

On 23/06/2025 14:17, zhuangyiwei wrote:
> Hi Steven
> 
> On 2025/6/11 18:48, Steven Price wrote:
>> Add the KVM_CAP_ARM_RME_CREATE_RD ioctl to create a realm. This involves
>> delegating pages to the RMM to hold the Realm Descriptor (RD) and for
>> the base level of the Realm Translation Tables (RTT). A VMID also need
>> to be picked, since the RMM has a separate VMID address space a
>> dedicated allocator is added for this purpose.
>>
>> KVM_CAP_ARM_RME_CONFIG_REALM is provided to allow configuring the realm
>> before it is created. Configuration options can be classified as:
>>
>>   1. Parameters specific to the Realm stage2 (e.g. IPA Size, vmid, stage2
>>      entry level, entry level RTTs, number of RTTs in start level, LPA2)
>>      Most of these are not measured by RMM and comes from KVM book
>>      keeping.
>>
>>   2. Parameters controlling "Arm Architecture features for the VM". (e.g.
>>      SVE VL, PMU counters, number of HW BRPs/WPs), configured by the VMM
>>      using the "user ID register write" mechanism. These will be
>>      supported in the later patches.
>>
>>   3. Parameters are not part of the core Arm architecture but defined
>>      by the RMM spec (e.g. Hash algorithm for measurement,
>>      Personalisation value). These are programmed via
>>      KVM_CAP_ARM_RME_CONFIG_REALM.
>>
>> For the IPA size there is the possibility that the RMM supports a
>> different size to the IPA size supported by KVM for normal guests. At
>> the moment the 'normal limit' is exposed by KVM_CAP_ARM_VM_IPA_SIZE and
>> the IPA size is configured by the bottom bits of vm_type in
>> KVM_CREATE_VM. This means that it isn't easy for the VMM to discover
>> what IPA sizes are supported for Realm guests. Since the IPA is part of
>> the measurement of the realm guest the current expectation is that the
>> VMM will be required to pick the IPA size demanded by attestation and
>> therefore simply failing if this isn't available is fine. An option
>> would be to expose a new capability ioctl to obtain the RMM's maximum
>> IPA size if this is needed in the future.
>>
>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
[...]
>> +static int realm_create_rd(struct kvm *kvm)
>> +{
>> +    struct realm *realm = &kvm->arch.realm;
>> +    struct realm_params *params = realm->params;
>> +    void *rd = NULL;
>> +    phys_addr_t rd_phys, params_phys;
>> +    size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
>> +    int i, r;
>> +    int rtt_num_start;
>> +
>> +    realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
>> +    rtt_num_start = realm_num_root_rtts(realm);
>> +
>> +    if (WARN_ON(realm->rd || !realm->params))
>> +        return -EEXIST;
>> +
>> +    if (pgd_size / RMM_PAGE_SIZE < rtt_num_start)
>> +        return -EINVAL;
>> +
>> +    rd = (void *)__get_free_page(GFP_KERNEL);
>> +    if (!rd)
>> +        return -ENOMEM;
>> +
>> +    rd_phys = virt_to_phys(rd);
>> +    if (rmi_granule_delegate(rd_phys)) {
>> +        r = -ENXIO;
>> +        goto free_rd;
>> +    }
>> +
>> +    for (i = 0; i < pgd_size; i += RMM_PAGE_SIZE) {
>> +        phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i;
>> +
>> +        if (rmi_granule_delegate(pgd_phys)) {
>> +            r = -ENXIO;
>> +            goto out_undelegate_tables;
>> +        }
>> +    }
>> +
>> +    params->s2sz = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
>> +    params->rtt_level_start = get_start_level(realm);
>> +    params->rtt_num_start = rtt_num_start;
>> +    params->rtt_base = kvm->arch.mmu.pgd_phys;
>> +    params->vmid = realm->vmid;
>> +
>> +    params_phys = virt_to_phys(params);
>> +
>> +    if (rmi_realm_create(rd_phys, params_phys)) {
>> +        r = -ENXIO;
>> +        goto out_undelegate_tables;
>> +    }
>> +
>> +    if (WARN_ON(rmi_rec_aux_count(rd_phys, &realm->num_aux))) {
>> +        WARN_ON(rmi_realm_destroy(rd_phys));
> 
> Since r has not been initialized, "goto out_undelegate_tables" leads to
> 
> return unknown value.

Good spot! That should have a "r = -ENXIO" line in there.

Thanks for the review,
Steve


