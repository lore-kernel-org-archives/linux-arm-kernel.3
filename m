Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C54FC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+m4obLpE/HW4A6a7j1ZHzk/rl7wY0vTPUziQ0RWgSU=; b=tadY0CuztKn4C3XQaGEsUMVU7s
	xiCecIxAGzdQyGGoi/flgquwtH/Bki89oOdvNKCrYtEx0Phih/l9CLt8qWKZwphh8BLE10xqV1jVz
	Iyjp61BXc4Ey3LuUiXfFxJyKSo2WRsSRkcc5wLMvsL9eBrjS4TsU1E5Oe8gxWFDD8JYyKyrHFKK6Q
	iu/wuxGusi9W0Pvfc0+pJDYJmXl+Wqwx486SaH3uRha95UWXNEmQ5J6Ebtgg7MNzV/QLvy2+n+xZU
	b/hNh1f9LSvZFYxn+bDmXmiXnt4boINLiXpE3vRQHvWLNhjLAQIsooGz+ExZIK+bf+w433XGaUjew
	6CwrQIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vch-00000007Lrb-1Vkb;
	Tue, 15 Sep 2026 16:03:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VcT-00000007Lff-2MnQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:02:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 781B415A1;
	Tue, 15 Sep 2026 09:02:49 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5FEFA3F882;
	Tue, 15 Sep 2026 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789488173; bh=6jkrogZGSbm4RdA1R7kTYWIwGIAxksB43/2wFkQ0l0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bR1+20uS1/cFWUrmp4PYnvq1nwFrNe0m5t5XuH/4v7LC0f2gew2gBZtGSvrOAUwaA
	 x6a1/pEVTQNMWuLaILtEDNHY7dHY0xEV+IuV9wiFUmyO7zoHW3H6D8Qki/rxeVkyTB
	 jyJoXuUwhsBmzNsv0GTL+hSVzESf4qvdlgP0w4/U=
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
Subject: [PATCH v18 20/23] KVM: arm64: CCA: Don't expose unsupported capabilities for realm guests
Date: Tue, 15 Sep 2026 17:01:38 +0100
Message-ID: <20260915160141.3543048-21-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_090253_686308_A5F8E610 
X-CRM114-Status: GOOD (  17.02  )
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

Limit the capabilities that are allowed for Realm VMs. Similarly block
the vm_ioctls backed by the capabilities.

Repurpose the kvm_pkvm_ioctl_allowed() to support both pKVM and Realm
ioctls. Rename the helper to kvm_arch_vm_ioctl_allowed() and move it
into arch/arm64/kvm/arm.c. Also add a generic kvm_arch_vm_ext_allowed()
to handle pKVM and Realm capability filtering.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v17:
 * Drop superfluous !kvm check from kvm_vm_ioctl_enable_cap() - Sashiko
 * Drop KVM_CAP_CREATE_IRQCHIP, as we don't support VGIC_V2 for Realms
 * Filter out the vm_ioctls that are based on blocked cap.
 * Repurpose the pkvm plumbing for filtering the caps and ioctl to generic
   and plumb the Realm support in
Changes since v13:
 * Add missing check in kvm_vm_ioctl_enable_cap().
Changes since v10:
 * Add a kvm_realm_ext_allowed() function which limits which extensions
   are exposed to an allowlist. This removes the need for special casing
   various extensions.
Changes since v7:
 * Remove the helper functions and inline the kvm_is_realm() check with
   a ternary operator.
 * Rewrite the commit message to explain this patch.
---
 arch/arm64/include/asm/kvm_pkvm.h | 19 ----------
 arch/arm64/kvm/arm.c              | 58 +++++++++++++++++++++++++++++--
 2 files changed, 55 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index e4ea80711bec6..1bc4fe2726e9b 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -53,25 +53,6 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	}
 }
 
-/*
- * Check whether the KVM VM IOCTL is allowed in pKVM.
- *
- * Certain features are allowed only for non-protected VMs in pKVM, which is why
- * this takes the VM (kvm) as a parameter.
- */
-static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
-{
-	long ext;
-	int r;
-
-	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
-
-	if (WARN_ON_ONCE(r < 0))
-		return false;
-
-	return kvm_pkvm_ext_allowed(kvm, ext);
-}
-
 extern struct memblock_region kvm_nvhe_sym(hyp_memory)[];
 extern unsigned int kvm_nvhe_sym(hyp_memblock_nr);
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8ed7dd1ce446c..df0aa66b6f5ed 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -136,6 +136,58 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
 }
 
+static inline bool kvm_realm_ext_allowed(long ext)
+{
+	switch (ext) {
+	case KVM_CAP_ARM_PSCI:
+	case KVM_CAP_ARM_PSCI_0_2:
+	case KVM_CAP_NR_VCPUS:
+	case KVM_CAP_MAX_VCPUS:
+	case KVM_CAP_MAX_VCPU_ID:
+	case KVM_CAP_MSI_DEVID:
+	case KVM_CAP_ARM_VM_IPA_SIZE:
+	case KVM_CAP_ARM_SVE:
+	case KVM_CAP_ONE_REG:
+	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
+	case KVM_CAP_ARM_PTRAUTH_GENERIC:
+	case KVM_CAP_SYNC_MMU:
+		return true;
+	}
+	return false;
+}
+
+static inline bool kvm_arch_vm_ext_allowed(struct kvm *kvm, long ext)
+{
+	/*
+	 * We could be called with kvm as NULL, so can't use kvm_vm_* for pKVM
+	 * flavors
+	 */
+	if (is_protected_kvm_enabled())
+		return kvm_pkvm_ext_allowed(kvm, ext);
+	else if (kvm && kvm_vm_is_realm(kvm))
+		return kvm_realm_ext_allowed(ext);
+	else
+		return true;
+}
+
+/*
+ * Check whether the KVM VM IOCTL is allowed.
+ *
+ * Certain features are allowed only for non-protected VMs in pKVM, which is why
+ * this takes the VM (kvm) as a parameter.
+ */
+static inline bool kvm_arch_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
+{
+	long ext;
+	int r;
+
+	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
+	if (WARN_ON_ONCE(r < 0))
+		return false;
+
+	return kvm_arch_vm_ext_allowed(kvm, ext);
+}
+
 int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			    struct kvm_enable_cap *cap)
 {
@@ -144,7 +196,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 	if (cap->flags)
 		return -EINVAL;
 
-	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, cap->cap))
+	if (!kvm_arch_vm_ext_allowed(kvm, cap->cap))
 		return -EINVAL;
 
 	switch (cap->cap) {
@@ -418,7 +470,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
 
-	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, ext))
+	if (!kvm_arch_vm_ext_allowed(kvm, ext))
 		return 0;
 
 	switch (ext) {
@@ -2150,7 +2202,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 	void __user *argp = (void __user *)arg;
 	struct kvm_device_attr attr;
 
-	if (is_protected_kvm_enabled() && !kvm_pkvm_ioctl_allowed(kvm, ioctl))
+	if (!kvm_arch_vm_ioctl_allowed(kvm, ioctl))
 		return -EINVAL;
 
 	switch (ioctl) {
-- 
2.43.0


