Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEAEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wD7yF0GAKWRb+mQsUAMmC5FxloKEkaaG7ULvfvONxAo=; b=VMnKNodp8/qV5JqLwUX6gGI+7n
	nCl8kNhSZ+Ow2GOipHTTuZgvUMpxRLt5DvMmodLTGIhnH57Wr3PjJjgXzKBBe+fPCzNM1ls9ChVuH
	MyYsuFA0gYYpE9yWU1fP2wkbxwpQZNn37FHLEuSadvleVznfV4o+xWJsfEC7F0L1eaDLfG5BUF+jq
	T6Ea2ngUlYCmeURiOCQGaFuS+DJPw1HsKmsgmruYud82snKDcVCsKdyM3T5ZSlzNZn1jVnPnux4I/
	P4TPYvjUJV+uul8W8jnTOiCiGmK769BeN+inPdZyAKWmOIAyQvRXh11y5bRE8W3UmLmfw1VHTv119
	498E/NDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lyp-0000000BXoT-1fN9;
	Thu, 24 Sep 2026 16:07:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ly8-0000000BXON-3X3H
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 16:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wD7yF0GAKWRb+mQsUAMmC5FxloKEkaaG7ULvfvONxAo=; b=gOaxIB9VJi8ULOLnf1YoPZz8SH
	dH+/1b/5Z9Gj8xd3EMEYPvmuRigKXVUeuAByusSuJJbZLIxhDyJsK2kruAkacH5JiWknple0KZtro
	oyhqNBSkXf1vprZ5cAIApS7ppL7f4r+fU8mCnmskCy3EPlou42Uq4eCiaf4fSls1/KieFU91TvJbj
	sWr8ARUKyAhgsx/uX2fQuPgd1Ic8XP46ila0BYAr0g37XyM+FCtEZ4Rx+Qq0Dapqmk0LpvB69MJtY
	gJap7yc4vIX0TMgSSXeqhpJV5HE/OESUWROReg1GlSGx9WG3ijv/F6Ye7p34dzxv9FO5Gw0zoh7BZ
	jxErxZ+w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9ly5-0000000GAsp-40OR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:06:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D44F51E7D;
	Thu, 24 Sep 2026 09:06:36 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 654013F86C;
	Thu, 24 Sep 2026 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790266000; bh=qqIjAm5se+qNeiPgYmrOoah+WsJiOdR/osHb0Swv+J8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nDu7cat3hBgepiWbiMSkO3kfnWAYWqPsbHIYDWOKfPWjgvpVMpXzhxHYvT13Vjc18
	 xzo2b1WLRJ5740MBkNbq/FXR2fnvp+6Jq1Ll3IIvd4451VnlKLxdS5taIHyRxxhYGn
	 2E3D69CdxmjtXN46A6OK0dTJbpgsG4l9Sq5BaewU=
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
Subject: [PATCH v20 18/22] KVM: arm64: CCA: Don't expose unsupported capabilities for realm guests
Date: Thu, 24 Sep 2026 17:05:00 +0100
Message-ID: <20260924160504.853911-19-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924160504.853911-1-suzuki.poulose@arm.com>
References: <20260924160504.853911-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_170642_321615_3040A5E6 
X-CRM114-Status: GOOD (  18.74  )
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
ioctls. Rename the helper to kvm_vm_ioctl_allowed() and move it
into arch/arm64/kvm/arm.c. Also add a generic kvm_vm_ext_allowed()
to handle pKVM and Realm capability filtering and route them accordingly.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v18:
 * Bail out early for !pKVM && !Realm vms. Use kvm_vm_hyp_is_distrusting()
 * WARN_ON_ONCE(!kvm), we are only called from kvm_arch_vm_ioctl() with a
   valid kvm instance.
 * Move the kvm_realm_ext_allowed() to asm/kvm_rmi.h - Fuad
 * Rename kvm_arch_vm_*allowed => kvm_vm_*_allowed - Fuad
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
 arch/arm64/include/asm/kvm_pkvm.h | 19 ------------
 arch/arm64/include/asm/kvm_rmi.h  | 23 +++++++++++++++
 arch/arm64/kvm/arm.c              | 49 +++++++++++++++++++++++++++++--
 3 files changed, 69 insertions(+), 22 deletions(-)

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
 
diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 44f5c75a27b5b..6b8b9ee9ea245 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -6,6 +6,8 @@
 #ifndef __ASM_KVM_RMI_H
 #define __ASM_KVM_RMI_H
 
+#include <linux/kvm.h>
+
 /**
  * enum realm_state - State of a Realm
  *
@@ -58,4 +60,25 @@ struct realm {
 
 void kvm_init_rmi(void);
 
+static inline bool kvm_realm_ext_allowed(long ext)
+{
+	switch (ext) {
+	case KVM_CAP_IRQCHIP:
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
 #endif /* __ASM_KVM_RMI_H */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 0e77f59ded6d9..106b52e556e20 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -136,6 +136,49 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
 }
 
+static inline bool kvm_vm_ext_allowed(struct kvm *kvm, long ext)
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
+ * Check whether the KVM VM IOCTL is allowed. For pKVM and Realm VMs, certain
+ * ioctls are not allowed. Further, certain features are allowed only for
+ * non-protected VMs in pKVM.
+ */
+static inline bool kvm_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
+{
+	long ext;
+	int r;
+
+	/*
+	 * We are guaranteed to be called with a valid kvm instance, as the
+	 * only caller is kvm_arch_vm_ioctl(). Catch any deviations, as we
+	 * rely on the kvm instance below.
+	 */
+	if (WARN_ON_ONCE(!kvm))
+		return false;
+
+	/* Cover both pKVM host and Realm VMs */
+	if (!kvm_vm_hyp_is_distrusting(kvm))
+		return true;
+
+	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
+	if (WARN_ON_ONCE(r < 0))
+		return false;
+
+	return kvm_vm_ext_allowed(kvm, ext);
+}
+
 int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			    struct kvm_enable_cap *cap)
 {
@@ -144,7 +187,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 	if (cap->flags)
 		return -EINVAL;
 
-	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, cap->cap))
+	if (!kvm_vm_ext_allowed(kvm, cap->cap))
 		return -EINVAL;
 
 	switch (cap->cap) {
@@ -403,7 +446,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
 
-	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, ext))
+	if (!kvm_vm_ext_allowed(kvm, ext))
 		return 0;
 
 	switch (ext) {
@@ -2144,7 +2187,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 	void __user *argp = (void __user *)arg;
 	struct kvm_device_attr attr;
 
-	if (is_protected_kvm_enabled() && !kvm_pkvm_ioctl_allowed(kvm, ioctl))
+	if (!kvm_vm_ioctl_allowed(kvm, ioctl))
 		return -EINVAL;
 
 	switch (ioctl) {
-- 
2.43.0


