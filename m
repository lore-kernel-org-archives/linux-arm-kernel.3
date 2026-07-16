Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC288C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhhmdamtR5Zd/RtGvy1VS91tfInJwf6freCO2MEEseY=; b=wcesMQPs81VkNd9DkKZcBfxA+w
	pgfZoZxer0MhouRKd0Rshw5rX5oPb3Sh2wduZRO/209ojRkVHE3suUgLgJmYwxnzrO72S0Vbb5YiZ
	JCZF+g63i5Lm5/PBv50euGDD+oxBwDkpHst4GoUYesnTzS0DcLGI7VWPyeeiwy1X6AlCY3Yuq2SNG
	bVWQqNGsAPVE10yoTgmmhuO0bDnjrVrJFsS1GiMoqKF8ViYwd5j3f3KADt7zSYaveiuCn66CPtR4V
	GgucJqDj6uVgzcPDOUUIu/jONet2ybPcgaRz8gf4JXpc3ahG+FY6iq8Uzx3HLZnZ9K2LiQeoexOua
	CtKyjWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIDq-0000000Gpzr-3HR3;
	Thu, 16 Jul 2026 09:17:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIDn-0000000GpyJ-1GTm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:17:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E56AE1477;
	Thu, 16 Jul 2026 02:17:29 -0700 (PDT)
Received: from [10.1.25.27] (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 746CA3F905;
	Thu, 16 Jul 2026 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784193454; bh=tCEy7iD7MZ+3FGuXj/M08G4NU2HDUW0nKEXLgA8KTkM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=soLPUHJZLQvXa7OkOv1/AEoaPaptD9CpFTjVFUeFEx1FPj2Dg5bXzUIYUu4lin+06
	 h5AijQ/22lRO1N5KUkrvXbYXnhFytcxWaVMzlZQYN7N2HAuVQc9mRflRxK+vfKoIJW
	 seQtYK3S7FjBKbk2yQqjl9/6dNmn/Z33cUnGeNDc=
Message-ID: <9eb4e4c0-f1f6-4ab9-956a-0b233d1656c9@arm.com>
Date: Thu, 16 Jul 2026 10:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 09/37] KVM: arm64: CCA: Allow passing the machine type
 in KVM creation
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
 <20260715142841.80544-10-steven.price@arm.com> <87zezs44cf.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <87zezs44cf.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_021735_440668_D5E4CCBD 
X-CRM114-Status: GOOD (  21.08  )
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

On 15/07/2026 17:14, Marc Zyngier wrote:
> On Wed, 15 Jul 2026 15:28:11 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> Previously machine type was used purely for specifying the physical
>> address size of the guest. Reserve the higher bits to specify an ARM
>> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
>> used to create a realm guest.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v13:
>>  * Rework to use the two top bits for the machine type now that pKVM has
>>    merged and used the top bit for KVM_VM_TYPE_ARM_PROTECTED.
>>  * Update the documentation to include KVM_VM_TYPE_ARM_PROTECTED as
>>    well.
>> Changes since v9:
>>  * Explictly set realm.state to REALM_STATE_NONE rather than rely on the
>>    zeroing of the structure.
>> Changes since v7:
>>  * Add some documentation explaining the new machine type.
>> Changes since v6:
>>  * Make the check for kvm_rme_is_available more visible and report an
>>    error code of -EPERM (instead of -EINVAL) to make it explicit that
>>    the kernel supports RME, but the platform doesn't.
>> ---
>>  Documentation/virt/kvm/api.rst | 18 ++++++++++++++++--
>>  arch/arm64/kvm/arm.c           | 11 +++++++++++
>>  include/uapi/linux/kvm.h       |  7 ++++++-
>>  3 files changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index b38e090ad95d..e39d146b34a3 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -181,8 +181,22 @@ flag KVM_VM_MIPS_VZ.
>>  ARM64:
>>  ^^^^^^
>>  
>> -On arm64, the physical address size for a VM (IPA Size limit) is limited
>> -to 40bits by default. The limit can be configured if the host supports the
>> +On arm64, the machine type identifier is used to encode a type and the
>> +physical address size for the VM. The lower byte (bits[7-0]) encode the
>> +address size and the upper bits[30-31] encode a machine type. The machine
>> +types that might be available are:
>> +
>> + =========================   ============================================
>> + KVM_VM_TYPE_ARM_NORMAL      A standard VM
>> + KVM_VM_TYPE_ARM_REALM       A "Realm" VM using the Arm Confidential
>> +                             Compute extensions, the VM's memory is
>> +                             protected from the host.
>> + KVM_VM_TYPE_ARM_PROTECTED   A "protected" VM using pKVM to isolate the
>> +                             VM from the host.
>> + =========================   ============================================
>> +
> 
> Probably worth mentioning that REALM+PROTECTED is an illegal
> combination.

The original intention was that these were enum values not separate bit
fields. Having to adapt to the pKVM changes when they were merged has
somewhat messed this up. I'll add a clarification, but hopefully we
haven't actually burnt the combination in case we have a 4th type in the
future.

Thanks,
Steve


