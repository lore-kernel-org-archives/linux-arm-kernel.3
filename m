Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1626DCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlDaO9VOB+Jzq1tI8smJQpWnaautokEQaV46R0NuBeE=; b=JdkknSZ3+rsixxLTFVSEl817Fz
	Z+/StxVb5tIzPpFdVBWuqlDD/H23/zxkVBhdDsjjPoaWZbuPNHfhtvzg92t64Rj8X/+5YW+W9OXVd
	pFaoau54HRaaf+JH0kp6T+r6GRoe3/sOYT7oqZpbWCDFsCuzxtWY4gAu/xHDj1SxEI4jPQ0BKgwjR
	tcLzhMN+KQ6OlaXnMqjCmm+9HAjlYuJPM8GlxeEeqmf0jFf3Hphmpy9YGmVAdmZezJO1F/9g8jBBI
	9fOkWXb4e0YyW5yE7HCpKHQyKtLMQaAqsEWIXSFwMmjDAPVKIR0r/I6WYZTxofFMi701l3CUR/Ll4
	nkYSVo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMCh-00000001rV9-3fia;
	Wed, 07 Oct 2026 07:36:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMCg-00000001rSX-0GFw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:36:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC6841595;
	Wed,  7 Oct 2026 00:36:36 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8E9183F763;
	Wed,  7 Oct 2026 00:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791358600; bh=O0Dqu6x6LEYJVW61CZ0GUP9BKrb4AgNQp1P0YADqkCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XNfSLZuqbLOxLB88v4NyOzG/CwpaLi2GVnAv4mnAN7cCUcmG8zphHe1VqXgsNBRri
	 614JgZqHcnpRBRbO645E3Ey9dttBpKD8fSV6XMAXUlPQYKGgO8tcdjRkkBu8j+MAXH
	 2KAkoxvbuQmqICPYaXyqr34rKs2rUPmoHTpn2i6o=
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
Subject: [PATCH v23 13/14] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
Date: Wed,  7 Oct 2026 08:35:36 +0100
Message-ID: <20261007073537.2454351-14-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007073537.2454351-1-suzuki.poulose@arm.com>
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_003642_194420_9431993D 
X-CRM114-Status: GOOD (  12.74  )
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
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 4 ++++
 arch/arm64/kvm/mmu.c              | 2 +-
 arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2e8ba509daa0f..4d0e6bd2009ac 100644
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
@@ -1556,6 +1558,8 @@ struct kvm *kvm_arch_alloc_vm(void);
 #define kvm_vm_is_protected(kvm)	((kvm)->arch.vm_flavor >= __VM_PROTECTED)
 #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
 
+#define kvm_vm_hyp_is_distrusting(kvm)	((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
+
 #endif	/* __KVM_NVHE_HYPERVISOR__ */
 
 int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9821cac0dce4b..b0dacfa7e6252 100644
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


