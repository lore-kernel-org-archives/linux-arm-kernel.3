Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED32CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v518hvX3btZ/zPwZCzmRfymz6QysFNRKxDe/G5tiURc=; b=yhget+Rsjgxu6k2a56CsG+nlal
	KNk8mtau7yGgcKLpWWuiTY0+YHaip7LEzuy/o4dRKUtC+oesuiMRvDo92q3McDpkuLJYrCvhJr/vw
	ktSEtDWQuj6YBQXYF4TLYvHPo/fEk2E7qLOwNmLasB+WF1yTj5RO5q+y5z0hjDJsfxTIdfHiSK6zQ
	EqkRwkHeJmW/ZH4CB2TYR2OXUtsz4GL5krvUu5LqvP7wXzy1NRp65M1gDVfIPZGDCUTYrgD298nMZ
	ETnDGeKdYqTf0eDqPQ+I2XVMXcYqE6vo3ZlWFgZcUOysyByS+sjex4XVjjTK5Hz8zYeJlV7CrGVPW
	N3Y63RrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMC8-00000001qxX-2cEn;
	Wed, 07 Oct 2026 07:36:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMBq-00000001qtX-1Juv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:36:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8541C1477;
	Wed,  7 Oct 2026 00:35:45 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 530BB3F763;
	Wed,  7 Oct 2026 00:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791358548; bh=MwwwUevO7DSWHowBtjBnpSHhKsg5+nScre/xvZ4gWlk=;
	h=From:To:Cc:Subject:Date:From;
	b=kaPb7OjoXX1EbLl8pULSEA5tL2pkcyG+K2zzc1B3xAliR41eJymnvveOXszh9q0dM
	 bcIKmSZ35zosFZaXBFoW990DBdfhLQuRat01xJxTyXEpqVvfDC725CmcYqunj0fJbh
	 NEv14LCRX7b2CkDIz/BlYLYeL1UmTVeygAVflWLo=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v23 00/14] KVM: arm64: CCA: Add basic plumbing for Realms
Date: Wed,  7 Oct 2026 08:35:23 +0100
Message-ID: <20261007073537.2454351-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_003558_866069_B7AB1EE7 
X-CRM114-Status: GOOD (  14.14  )
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

This is a trimmed down and updated version of the v22 of Arm CCA basic
plumbing series [0]. I have dropped the CCA specific bits for the sake keeping
them separate. This series now only contains the framework for handling
different VM types and lay down the path for adding Realm as one of the
protected VMs. The full support for running Realms under KVM is available as
an integration branch at [1].

The integration branch has been tested with the following components:

  tf-RMM:   main branch (commit 5e6e2acd) compliant to RMM-v2.0-beta3
  kvmtool: git@git.gitlab.arm.com:linux-arm/kvmtool-cca.git tag:cca-kvm-v20

[0] Arm CCA KVM basic plumbing v22
    https://lore.kernel.org/all/20261005090754.2140522-1-suzuki.poulose@arm.com
[1] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm-v23/integration

Changes since v22:
 https://lore.kernel.org/all/20261005090754.2140522-1-suzuki.poulose@arm.com
  - Drop the CCA specific patches for now, they are on the integration branch
  - system_supported_vcpu_features() - Start off with a base set of features for
    the type of VM
  - Add () around 'flavor' in KVM_VM_S2_OPS() macro
  - Drop BUILD_BUG_ON and redefine {kvm_vm,vcpu}_is_protected() for nVHE
  - Drop {kvm_vm,vcpu}_is_protected_pkvm() macros

Changes since v21:
 https://lore.kernel.org/all/20261001210703.1597150-1-suzuki.poulose@arm.com
 - Keep the kvm_arch struct packed, by moving psci_version, closer to vm_flavor and also moving the vm_s2_ops, closer to vm_flavor.
 - Drop the kern_hyp_va() for vcpu_is_protected() in nVHE, instead ban nVHE
   code from using vcpu_is_protected() (by using BUILD_BUG_ON()) and convert
   all users to vcpu_is_protected_pkvm()
 - Drop kvm_vm_is_unprotected_pkvm() in favor of open coded check against VM_PKVM
 - Drop WARN_ON_ONCE() in the kvm_vm_ioctl_allowed() to match Fuad's fix merged in v7.3-rc5
 - Move '&' to the KVM_*_OPS macros
 - Nuke __unmap_stage2_range() and define per-VM callback for stage2_unmap_range, removing the KVM_PGT_FN() hack for the call, and also for the others
 - Drop NULL check for vm_s2_ops callbacks and always define everything.
 - Add no_age_gfn() which plugs in for pVMs and Realms for the vm_age_*gfn callbacks

Steven Price (1):
  KVM: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h

Suzuki K Poulose (13):
  KVM: arm64: protected VM: Handle user writes to CNTVCT_EL0/CNTPCT_EL0
  KVM: arm64: Disable Steal time accounting for protected guests
  KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
  KVM: arm64: Track the type of VM in kvm_arch
  KVM: arm64: Don't call vcpu_set_pauth_traps for pKVM host
  KVM: arm64: Refactor the vcpu_load to allow for VM specific callbacks
  KVM: arm64: Add vcpu load/put call backs for flavors
  KVM: arm64: Consolidate stage2 unmap range into kvm_stage2_unmap_range
  KVM: arm64: Add VM specific callback for S2 MMU operations
  KVM: arm64: Use a local kvm pointer in kvm_handle_guest_abort()
  KVM: arm64: Abstract out memory abort handling
  KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
  KVM: arm64: Prevent unsupported vcpu features for VM types

 arch/arm64/include/asm/kvm_host.h    |  73 ++++++-
 arch/arm64/include/asm/kvm_pgtable.h |  10 +-
 arch/arm64/include/asm/kvm_pkvm.h    |   6 +-
 arch/arm64/kvm/arch_timer.c          |  12 +-
 arch/arm64/kvm/arm.c                 | 275 ++++++++++++++++++++-------
 arch/arm64/kvm/hyp/nvhe/pkvm.c       |   6 +-
 arch/arm64/kvm/hyp/pgtable.c         |   1 +
 arch/arm64/kvm/mmio.c                |   1 +
 arch/arm64/kvm/mmu.c                 | 247 +++++++++++++++++-------
 arch/arm64/kvm/pkvm.c                |   6 +-
 arch/arm64/kvm/pvtime.c              |  14 +-
 arch/arm64/kvm/vgic/vgic-init.c      |   2 +
 include/kvm/arm_psci.h               |   2 +
 13 files changed, 493 insertions(+), 162 deletions(-)

-- 
2.43.0


