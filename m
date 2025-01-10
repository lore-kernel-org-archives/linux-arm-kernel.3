Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1277E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QY0MN1eYQ9kalm3DVYLYKCKUnkYywJxQX+sExO+ZgeE=; b=SFvQaU8sUJOXMg93CfW6jKbmgv
	u625MylIbfIVJWbEiGBgPUrxqE9zT3CNO1slLcPh2uqo4A62HXTK359gP7umVus9ykQsYI1VjlTDK
	al67fvK2XqLeFU6WR7CAMEqdNES+7xcxy5g7C0QZvNudk7wfhZidT6NkoPV2vePTEN9cZwBxVlHhr
	rvE05qeQbDqkxuI+cTYzm+CmHbv7bAHBlrM3sW0tNtK3azOEz4cGE6FXi75KG5xfUwJXOTlot8807
	pRadS0qsMDrLiYHY23zXb9d3b4nymBuRLEwZDnPR00oHVVhXtdsQYwHjR0pYOWN9QjqG/we6ZuybJ
	linePk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWClz-0000000F2tN-22gt;
	Fri, 10 Jan 2025 11:01:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCkl-0000000F2bW-2JMR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 11:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A96895C5900;
	Fri, 10 Jan 2025 10:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A25C4CED6;
	Fri, 10 Jan 2025 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736506834;
	bh=hmKqAySisZ8LuAN+/uPxTk1GZdXBJbQHEcD26LX9Uvk=;
	h=From:To:Cc:Subject:Date:From;
	b=PaTE5gOnVDvQpX3bKHw0UVOqETF7/1i3r308EHm+mvFcWj3bZmcfj+b3ZBlyyUAhI
	 PEv9V480O0dNjjSJ/DSBaknQNcnZr260jPrrd1d3TTaPyxSZsJLnZ3DOVbqnerJyNc
	 VMg23qcDp/4I4gnnYhGxCgq7/1UDaDuEkAAzZfWX2ulfbY2wXDwN32oI6olKD5rqz0
	 5qls0Fg1iCVbrMsDcbR5vcp88CnqvVLtmoAXSlHSHfd0moYugkE+KFsDuZBR/U4zqV
	 oX2zMTIHXkZ/K+BHm3rJyzTO3qLWf/ycapqMyMheQZH91kM95sehPe3RgcjuHBfMYl
	 tOg0pp7BZ2SQA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH v2 0/7] Add support for NoTagAccess memory attribute
Date: Fri, 10 Jan 2025 16:30:16 +0530
Message-ID: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_030035_675949_7F4FB834 
X-CRM114-Status: GOOD (  22.17  )
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

A VMM allows assigning different types of memory regions to the guest and not
all memory regions support storing allocation tags. Currently, the kernel
doesn't allow enabling the MTE feature in the guest if any of the assigned
memory regions don't allow MTE. This prevents the usage of MTE in the guest even
though the guest will never use these memory regions as allocation-tagged
memory.

One example of such a configuration is a VFIO passthrough-enabled guest.
Enabling MTE with such config results in failure as shown below(kvmtool VMM)

[  617.921030] vfio-pci 0000:01:00.0: resetting
[  618.024719] vfio-pci 0000:01:00.0: reset done
  Error: 0000:01:00.0: failed to register region with KVM
  Warning: [0abc:aced] Error activating emulation for BAR 0
  Error: 0000:01:00.0: failed to configure regions
  Warning: Failed init: vfio__init

  Fatal: Initialisation failed

This patch series provides a way to enable MTE in such configs. Even though
NoTagAccess can only be used with cacheable mapping, having the ability to map
both MTE capable and non-capable VMAs allow us to support VFIO with the MTE
capability enabled.

Also, there is a possibility of cachable device memory. That memory, if exposed
to guest as WB and the guest enables MTE, may trigger SErrors (Arm ARM mention
this as "[RBCFRK] The result of an access to an Allocation Tag where Allocation
Tag storage is not provided is IMPLEMENTATION DEFINED"). With FEAT_MTE_PERM KVM
could trap and do necessary corrective action.

Another use case is virtiofs dax support, which can use a page cache region as a
virtio-shm region. We can use MTE_PERM to enable MTE in this config.

In summary, different types of memory, whether WB MMIO or RAM presented as
virtio-(pmem, shm etc.) backed by files in the VMM, the VM should be aware it is
not standard RAM and should not attempt to enable MTE on it. If it does (either
by mistake or malice), FEAT_MTE_PERM will trap and cause a VM exit with
KVM_VM_EXIT_MEMORY_FAULT as the reason.

A VM exit with exit reason KVM_VM_EXIT_MEMORY_FAULT, gives sufficient
flexibility for any future fault-handling schemes we come up with (One possible
use case is to allocate additional allocation tag space for schemes that want to
use this for supporting smaller allocation tag pool and retry the guest
instruction again). For the current implementation where we expect the guest to
be terminated, this can also be achieved from within the hypervisor.

Implementation notes:
For non-MTE-allowed memory, the hypervisor will install stage2 translation with
NoTagAccess memory attributes. Guest access of allocation tags with these memory
regions will result in a VM Exit. One detail to note here is that NoTagAccess
memory attribute can only be applied to Normal cacheable memory ie, using the
attribute value of MemAttr[3:0] = 0b0100 implies Normal, NoTagAccess, write-back
cacheable memory region. No other memory attribute value will trap the
allocation tag access.

Migration notes:
The feature is only exposed to an EL2 guest only if it is capable of nested
virtualization. Otherwise, a read of ID_AA64PFR2_EL1_FPMR will not expose
MTE_PERM feature. We also want to make sure that an EL2 guest using this feature
as part of its stage2 translation can only migrate to a target that supports the
feature in the hardware. This is achieved by using KVM_CAP_ARM_MTE_PERM.

Nested virtualization notes:
This being a stage2 translation attribute, it is exposed to EL2 guest only if it
is capable of a VirtualEL2 state. When an EL1 guest is started with MTE_PERM
capability enabled, the EL2 hypervisor will look at the EL1 stage2 tables to
determine whether a NoTagAccess attribute needs to be inserted in the shadow
stage2 table at EL2. (Limitation, upstream nested virt support disables MTE in
EL1 guest and in a similar fashion, we don't allow MTE_PERM with EL1 guest for
now. This also mean we can drop the patch "KVM: arm64: MTE: Nested guest
support" because the feature is only used by EL2 guest for now.)

Changes from v1:
* Add KVM_CAP_ARM_MTE_PERM to handle migration.
* Add handling of NoTagAccess with Nested guest stage2.
* Add changes to split some of the kvm_pgtable_prot bits.


Aneesh Kumar K.V (Arm) (7):
  arm64: Update the values to binary from hex
  KVM: arm64: MTE: Update code comments
  arm64: cpufeature: add Allocation Tag Access Permission (MTE_PERM)
    feature
  KVM: arm64: MTE: Add KVM_CAP_ARM_MTE_PERM
  KVM: arm64: MTE: Use stage-2 NoTagAccess memory attribute if supported
  KVM: arm64: MTE: Nested guest support
  KVM: arm64: Split some of the kvm_pgtable_prot bits into separate
    defines

 Documentation/virt/kvm/api.rst        | 17 ++++++++++
 arch/arm64/include/asm/cpufeature.h   |  5 +++
 arch/arm64/include/asm/kvm_emulate.h  |  5 +++
 arch/arm64/include/asm/kvm_host.h     |  7 +++++
 arch/arm64/include/asm/kvm_nested.h   | 10 ++++++
 arch/arm64/include/asm/kvm_pgtable.h  |  9 ++++--
 arch/arm64/include/asm/memory.h       | 14 +++++----
 arch/arm64/kernel/cpufeature.c        |  9 ++++++
 arch/arm64/kvm/arm.c                  | 11 +++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  2 +-
 arch/arm64/kvm/hyp/pgtable.c          | 43 +++++++++++++++----------
 arch/arm64/kvm/mmu.c                  | 45 ++++++++++++++++++++-------
 arch/arm64/kvm/nested.c               | 28 +++++++++++++++++
 arch/arm64/kvm/sys_regs.c             | 15 ++++++---
 arch/arm64/tools/cpucaps              |  1 +
 include/linux/kvm_host.h              | 10 ++++++
 include/uapi/linux/kvm.h              |  2 ++
 17 files changed, 191 insertions(+), 42 deletions(-)


base-commit: 56e6a3499e14716b9a28a307bb6d18c10e95301e
-- 
2.43.0


