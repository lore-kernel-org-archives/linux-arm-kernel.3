Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3033CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0XJZwW+JkFpzcplxYMak6+MZCC1s//FIoxa0e+pFLI=; b=MykPPKE/K9dbBkbKxbSkdLsdLf
	AbcEKyXwa6xozbtUhCq7RiONIpq7CDhg2m2WO1I9mjHa9iQBU8yYBTeMwZIbwzJE5tmUBJ7vwQb2o
	QWDEga0csdHRCUhM+wZU1ditR8XzzdQcZty//XzqS6kRGfUBT5xofsBlzAea1EYsyk6bTVeHKDeXt
	fUok4DN75i3HXi+Ax+/suQWSg7xFKyqeJWSB4wA00zQi5Wqtwhdvk/TMvRIMoqcbuB414sPin1JL9
	KyxvN7NKrr4gP4EI9x7Hyi3S3+fKd3ftS21YjamGv5KTRV0IamR89YodiR8or6ev/e+PzCdjCVW8I
	6VAYK54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDegr-0000000Fx47-2zmZ;
	Mon, 05 Oct 2026 09:08:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDegn-0000000Fwx2-3JaB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:08:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B05C11576;
	Mon,  5 Oct 2026 02:08:49 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00C2B3F66F;
	Mon,  5 Oct 2026 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791191333; bh=LyL5B1qOj0HkhORdpwGLrIdiUvix2Y2ro+Acc4eBvHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hsnwLOFf7ss/vZ6ni2abtSZij8w0UfBBHJyZmL2Q4F1xbmczt8GkVw5dzmNycjgbo
	 KuxIAnyDfL9sgBdBHJL9MfBkrS9Xdi8LkTBPVlwKZAxyu+4tTNVufa2PvFycaq7pfi
	 9nJD3sTinKpMg9TwYSd7aa2lvEjUVHDYxcS1tCJI=
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
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH v22 14/23] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
Date: Mon,  5 Oct 2026 10:07:45 +0100
Message-ID: <20261005090754.2140522-15-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005090754.2140522-1-suzuki.poulose@arm.com>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_020853_929992_8E7CAF74 
X-CRM114-Status: GOOD (  12.11  )
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

pKVM does not trust the host. Realm VMs follow a similar trust model, with
the Realm Management Monitor owning the protected state instead of the
host. Add a helper to identify VMs that run under a host-distrusting
hypervisor.

Use this for blocking ioremap of vgic-v2 into stage2 and prevent creation
of VGIC other than v3.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 4 ++++
 arch/arm64/kvm/mmu.c              | 2 +-
 arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cb343583953d..56861b75411f1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -328,6 +328,8 @@ enum fgt_group_id {
 enum kvm_arm_vm_flavor {
 	VM_NVHE,
 	VM_VHE,
+	/* VMs running on a hyp that doesn't trust */
+	MARKER(__VM_DISTRUSTING_HYP),
 	VM_PKVM,		/* Normal guests on pKVM */
 	MARKER(__VM_PROTECTED),
 	VM_PROTECTED_PKVM,	/* Protected VM */
@@ -1562,6 +1564,8 @@ struct kvm *kvm_arch_alloc_vm(void);
 		(__kvm && kvm_vm_is_protected_pkvm(__kvm));		\
 	})
 
+#define kvm_vm_hyp_is_distrusting(kvm)	((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
+
 int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
 bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ccbe2ffeda40b..909ea3f545e83 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1249,7 +1249,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 				     KVM_PGTABLE_PROT_R |
 				     (writable ? KVM_PGTABLE_PROT_W : 0);
 
-	if (is_protected_kvm_enabled())
+	if (kvm_vm_hyp_is_distrusting(kvm))
 		return -EPERM;
 
 	size += offset_in_page(guest_ipa);
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 4012df6002ea6..874025513afcc 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -84,6 +84,8 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 		!kvm_vgic_global_state.can_emulate_gicv2)
 		return -ENODEV;
 
+	if (kvm_vm_hyp_is_distrusting(kvm) && type != KVM_DEV_TYPE_ARM_VGIC_V3)
+		return -ENODEV;
 	/*
 	 * Ensure mutual exclusion with vCPU creation and any vCPU ioctls by:
 	 *
-- 
2.43.0


