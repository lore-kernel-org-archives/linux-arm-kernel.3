Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009D1CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbJ1RsvH9CDGX7ynywoTMvh1UxgUIq2C27MiEC6P6uo=; b=47jUWAnZ/Hwf7nPv+W/kv29/fM
	oy0O2UYBwuqBglLCcFEmh3UvyodO2dE8ggVbuJJofL016xg0mAYBXXnV2aDa5nBVOPXjgdm67acyQ
	uVztYv7SHvbqwUo+hmwVbI4uATBOiOB7oEwCMWJyo1kBDYhG6dxUvylDSu3o3ZCX5OvBPCSaaVEtJ
	LEEA3T5Y4NULT09x6UHdw4Df/QoNOO27u9z/LzdGHVXISVmIDC1pIPCfsx6fnSGxl3cpITsLj58t0
	h5N1DqsRzhf3zQynwUjzDXr2cMBdXmDjA4ZkWjkh5zS81dUk8K7LCZsAeprR0jaGeAOQTH6idByyv
	9wfI333g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUN65-0000000CrPh-1KoE;
	Tue, 02 Jun 2026 11:15:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUN61-0000000CrOr-1pFa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:15:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D4D919F6;
	Tue,  2 Jun 2026 04:15:36 -0700 (PDT)
Received: from [10.1.37.87] (unknown [10.1.37.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5032C3F7D8;
	Tue,  2 Jun 2026 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780398941; bh=QfyHr6isq3j/daYtaiZs+C2sixCP2JlVzFq08HckBoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HWujxxMNF0XkAEjVFicNlwsFJxdqqIdn1C5dC+VOAOA2kvFM8VFTfg4L0OUgEzkNF
	 2ea4M4nsnSFabGaTafXGf3lGFZ8hkOkRBy7/6lAzGVKiOOFq4t88VEq0USPJsy6XJT
	 IUIef4irKsedjTV1++WOJV1wDwD1tW01gZ7IaH0Y=
Message-ID: <f7962e89-ae08-4ace-9201-21fb3055aeaa@arm.com>
Date: Tue, 2 Jun 2026 12:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 13/44] arm64: RMI: Define the user ABI
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-14-steven.price@arm.com>
 <86jysovpxf.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <86jysovpxf.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_041545_670882_8973201A 
X-CRM114-Status: GOOD (  27.06  )
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

Hi Marc

On 27/05/2026 16:21, Marc Zyngier wrote:
> On Wed, 13 May 2026 14:17:21 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> There is one CAP which identified the presence of CCA, and one ioctl.
>> The ioctl is used to populate memory during creation of the realm as
>> this requires the RMM to copy data from an unprotected address to the
>> protected memory - CCA does not support memory conversion where the
>> memory contents is preserved as this is incompatible with memory
>> encryption.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v13:
>>   * KVM_ARM_VCPU_RMI_PSCI_COMPLETE removed.
>>   * KVM_ARM_RMI_POPULATE documentation updated to reflect that the
>>     structure is written by the kernel.
>>   * CAP number bumped.
>> Changes since v12:
>>   * Change KVM_ARM_RMI_POPULATE to update the structure with the amount
>>     that has been progressed rather than return the number of bytes
>>     populated.
>>   * Describe the flag KVM_ARM_RMI_POPULATE_FLAGS_MEASURE.
>>   * CAP number is bumped.
>>   * NOTE: The PSCI ioctl may be removed in a future spec release.
>> Changes since v11:
>>   * Completely reworked to be more implicit. Rather than having explicit
>>     CAP operations to progress the realm construction these operations
>>     are done when needed (on populating and on first vCPU run).
>>   * Populate and PSCI complete are promoted to proper ioctls.
>> Changes since v10:
>>   * Rename symbols from RME to RMI.
>> Changes since v9:
>>   * Improvements to documentation.
>>   * Bump the magic number for KVM_CAP_ARM_RME to avoid conflicts.
>> Changes since v8:
>>   * Minor improvements to documentation following review.
>>   * Bump the magic numbers to avoid conflicts.
>> Changes since v7:
>>   * Add documentation of new ioctls
>>   * Bump the magic numbers to avoid conflicts
>> Changes since v6:
>>   * Rename some of the symbols to make their usage clearer and avoid
>>     repetition.
>> Changes from v5:
>>   * Actually expose the new VCPU capability (KVM_ARM_VCPU_REC) by bumping
>>     KVM_VCPU_MAX_FEATURES - note this also exposes KVM_ARM_VCPU_HAS_EL2!
>> ---
>>   Documentation/virt/kvm/api.rst | 40 ++++++++++++++++++++++++++++++++++
>>   include/uapi/linux/kvm.h       | 13 +++++++++++
>>   2 files changed, 53 insertions(+)
> 
> $SUBJECT looks wrong. This is a KVM change, not an RMI change.
> 
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 52bbbb553ce1..ca68aae7faa2 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -6553,6 +6553,37 @@ KVM_S390_KEYOP_SSKE
>>     Sets the storage key for the guest address ``guest_addr`` to the key
>>     specified in ``key``, returning the previous value in ``key``.
>>   
>> +4.145 KVM_ARM_RMI_POPULATE
>> +--------------------------
>> +
>> +:Capability: KVM_CAP_ARM_RMI
>> +:Architectures: arm64
>> +:Type: vm ioctl
>> +:Parameters: struct kvm_arm_rmi_populate (in/out)
>> +:Returns: 0 on success, < 0 on error
>> +
>> +::
>> +
>> +  struct kvm_arm_rmi_populate {
>> +	__u64 base;
>> +	__u64 size;
>> +	__u64 source_uaddr;
>> +	__u32 flags;
>> +	__u32 reserved;
>> +  };
>> +
>> +Populate a region of protected address space by copying the data from the
>> +(non-protected) user space pointer provided into a protected region (backed by
>> +guestmem_fd). It implicitly sets the destination region to RIPAS RAM. This is
>> +only valid before any VCPUs have been run. The ioctl might not populate the
>> +entire region and in this case the kernel updates the fields `base`, `size` and
>> +`source_uaddr`. User space may have to repeatedly call it until `size` is 0 to
>> +populate the entire region.
>> +
>> +`flags` can be set to `KVM_ARM_RMI_POPULATE_FLAGS_MEASURE` to request that the
>> +populated data is hashed and added to the guest's Realm Initial Measurement
>> +(RIM).
> 
> Where is that measurement stored? And retrieved? At least a pointer to
> that would help.

The measurement is stored by the RMM and is made available to the Guests
via RSI interface (RSI_ATTEST_TOKEN_{INIT,CONTINUE}) as part of the 
attestation report along with the Platform attestation. On Linux Guest,
this could be fetched using TSM report infrastructure. This could be 
added to the doc.


Suzuki



> 
>> +
>>   .. _kvm_run:
>>   
>>   5. The kvm_run structure
>> @@ -8904,6 +8935,15 @@ helpful if user space wants to emulate instructions which are not
>>   This capability can be enabled dynamically even if VCPUs were already
>>   created and are running.
>>   
>> +7.47 KVM_CAP_ARM_RMI
>> +--------------------
>> +
>> +:Architectures: arm64
>> +:Target: VM
>> +:Parameters: None
>> +
>> +This capability indicates that support for CCA realms is available.
>> +
>>   8. Other capabilities.
>>   ======================
>>   
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 6c8afa2047bf..b8cff0938041 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -996,6 +996,7 @@ struct kvm_enable_cap {
>>   #define KVM_CAP_S390_USER_OPEREXEC 246
>>   #define KVM_CAP_S390_KEYOP 247
>>   #define KVM_CAP_S390_VSIE_ESAMODE 248
>> +#define KVM_CAP_ARM_RMI 249
>>   
>>   struct kvm_irq_routing_irqchip {
>>   	__u32 irqchip;
>> @@ -1669,4 +1670,16 @@ struct kvm_pre_fault_memory {
>>   	__u64 padding[5];
>>   };
>>   
>> +/* Available with KVM_CAP_ARM_RMI, only for VMs with KVM_VM_TYPE_ARM_REALM */
>> +#define KVM_ARM_RMI_POPULATE	_IOWR(KVMIO, 0xd7, struct kvm_arm_rmi_populate)
>> +#define KVM_ARM_RMI_POPULATE_FLAGS_MEASURE	(1 << 0)
>> +
>> +struct kvm_arm_rmi_populate {
>> +	__u64 base;
>> +	__u64 size;
>> +	__u64 source_uaddr;
>> +	__u32 flags;
>> +	__u32 reserved;
>> +};
>> +
>>   #endif /* __LINUX_KVM_H */
> 
> Thanks,
> 
> 	M.
> 


