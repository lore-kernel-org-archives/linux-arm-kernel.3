Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAE5C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkbxME8Dt2OsFBNnBEgiDClUVkvKnxhmQmdxoM6LavQ=; b=eEIjh/A12fNLddTe7jGnF3yqFd
	0ahTcAtnkYqKJlVs+wd9h+ayKAYU5qYrsB2VPRK+ZNMy2Mo4SiFpLJcto5BVl+amDPqEOy4+IOWgt
	0jNgKpYpT2j1xu3N3OqI8OqG5BA4XYft/HLIwFdS60EyFJ1gDGJsTaOWrmZkZdWT+sUYgXBZfNkQj
	jZf2ztLiDn5l13nOZTEmMC3AivBT4HvdN04odGZu5/vwd0Bx58CoWAV/o9jMJQQayzuiH+XoC81QO
	LsiRKhIwZ9UCs504yPSmrAUmsEAx96s5pr/dvx1yn8z8GTfXXAWKSelyp8NiOOYtXyOZxCp/45GyH
	2uSZ43Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VcD-00000007LO5-1euO;
	Tue, 15 Sep 2026 16:02:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vc8-00000007LJz-34Uv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:02:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F36215A1;
	Tue, 15 Sep 2026 09:02:28 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77E883F882;
	Tue, 15 Sep 2026 09:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789488152; bh=j4bM4Le2AKal5yA6XAi5DmpI3S/KrZ5K/Wzmf15T0ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ClzThnsvV0+f2nZe1I9A9CL5T0IFtVNFtDYXmBqMUKy7p9ELACjh0Ha7pRHGIj4sQ
	 68my1T9P80v3Ia1OsjWhaWL7ckX5so/M5GWZSFkcr9JHRNhaf7wWuasgcuObUGbPVQ
	 PP/+qzn+CvhwZfT+DOXHMcbdyYCO42GZClAvvn3k=
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
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v18 13/23] KVM: arm64: Add a helper for VMs running on hyp that don't trust the host
Date: Tue, 15 Sep 2026 17:01:31 +0100
Message-ID: <20260915160141.3543048-14-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_090232_843492_C4290415 
X-CRM114-Status: GOOD (  12.44  )
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

PKVM and RMM, both do not trust the host. Add a helper to detect the VMs
that have "distrusting" hyp. Use this for blocking ioremap of vgic-v2 into
stage2.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/mmu.c              | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 1bb43c57fb0f0..09910b2c61bfb 100644
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
@@ -1540,6 +1542,7 @@ struct kvm *kvm_arch_alloc_vm(void);
 #define kvm_vm_is_protected_pkvm(kvm)	((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
 #define kvm_vm_is_unprotected_pkvm(kvm)	((kvm)->arch.vm_flavor == VM_PKVM)
 
+#define kvm_vm_hyp_is_distrusting(kvm)	((kvm)->arch.vm_flavor > __VM_DISTRUSTING_HYP)
 #define kvm_vm_hyp_is_pkvm(kvm)		(is_protected_kvm_enabled())
 #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 38f3bf772278f..559a8286807cd 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1251,7 +1251,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 				     KVM_PGTABLE_PROT_R |
 				     (writable ? KVM_PGTABLE_PROT_W : 0);
 
-	if (is_protected_kvm_enabled())
+	if (kvm_vm_hyp_is_distrusting(kvm))
 		return -EPERM;
 
 	size += offset_in_page(guest_ipa);
-- 
2.43.0


