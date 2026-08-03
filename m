Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9F8C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 22:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wXVKLiTea0/59JUrrH+7PA7Bo3NKwmFvSDJL86vx0Jw=; b=bQsX7bV/hDGSXnoHz93iEuwaxX
	AieAUDJEfzsGHERT3iVmNHkUYNhn2j/AWhYSHQCalX3ePR/DgH+wJgd4h/h9ie5/tmqF0oJiFTZUg
	NHP8r9QX2dHODmO1CQr1DdUWMFfR0VaigypGN1s6+Um2AKW5TozkD1/x5qIT/Km90WWSUzLhOOYI8
	xB/+jDlDdI3vUMJMooSapPTBp0vG8tXBY1Tde65rEaITpR7MIjkOiusRzypbM2GH8cwqO5spfoJs4
	/DXtO89wCVqxJZoluvvvMXAry9kUBdpjjhmEFazqZHIraCnV8PMQnJnSDzwFg4pMtei7TH3AkP7BU
	mRROXvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1OR-00000000ca3-23jg;
	Mon, 03 Aug 2026 22:44:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1OP-00000000cZX-092l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 22:44:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so27152845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785797059; x=1786401859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXVKLiTea0/59JUrrH+7PA7Bo3NKwmFvSDJL86vx0Jw=;
        b=LDFHagiCnspFnEe22Dz7OniPk1iINtKRcy/JUjQtMBiqIPZo4r8t44MwA3iPq1aixj
         aEsv2INm/sLy5BQRZzTuxhhe9p4CjrUyKBuaMGwq0T9iO6af21qOJYV2J/rZxxtJ3efq
         omIkQZ3aFwtPYaQZGFqLljecee4pMTxT1gSl83o54XxHeUCxFmbdis6YWr5ma1vGPbJI
         RHQE/0ILv66r7IKYK9rWGm1Ag3CykKQv8jf/Xkl+wK0R2AUuIRqPlVeQKrt8o0x32kFn
         TgK9QjCG6SIx3JbuhzOdhwRHf9JBt/h3h6hNPpTT+FcUPDITIzBL1oisY8m7WjLSqLg0
         1zJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785797059; x=1786401859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXVKLiTea0/59JUrrH+7PA7Bo3NKwmFvSDJL86vx0Jw=;
        b=GAQFaol0ya0zlm9aJ5s0V9oWKiJjrCRriM+Ho0siOL1E6dqHzVzVLwWjaNSjubRNOo
         dQ9l3NM3dOtuNVBAmcIaPgtF4srPeDmhzQmR1wT38hYK3/HkBjjMVJjKglUGjvR2Xh0s
         OmM/okNq+m4uTM27icQKzepRpNOGYP/I7ItgiQh1EeRgxBPJPBBi8dWlUkWbZdlCkbEK
         BwMWqXPej1Xeg+uOaRrxo7/tK6YlbnQnTDvUroLe8HiTggoi/0HTBsdrdQiZgFkRtcpW
         05GHEvSCJxGJkEknJMe5LdRblkE322QonSPORGGJRBgbVk5Szo4fv4mx3X0bILT/IIxK
         Oa5A==
X-Forwarded-Encrypted: i=1; AHgh+RppA+o8EpcRuy/yT3IE8MHhgzRYr1EDMc+AzKY/7mR1NLO5fWtbpn1jOaI6fdcOW5ohYds/rXL3XzwMcFfu3l7G@lists.infradead.org
X-Gm-Message-State: AOJu0YxuVTzxHYBz5D9AutflQVSJxAejmF47bfjMqJX4BcenVqmHP0+S
	DNMV6JKvV05MuY7FfjezYxHOr58PTGmyC4yYmpST+KLq79Y2fNIx9oIR
X-Gm-Gg: AR+sD13KtxaDJap+2G1EDdefURj+Obkj5C6UJoyZ7TfLmT/VFiztlq5iqJUy3LhXmw8
	f+Nq9K1rmmXxVfW+1HzT4ZIowC7YW4vGsOI2fMOBpfWEMLNw64Ym7O8lwoV7SzQCCpTe7PNoStO
	951/17q16qugfWjwCKM3jB0/l5bWXYPKFNE6bboqhXh5QWJFpwATz8+IXTP8yWaF5Nka3HMcdD+
	7yKHPxke/OqrUOBuV88Mvp5pu06Pt8hcbRC3lsp6yJPAMAbeFBkhkeaQiWvBGn2+DBaxuCJho+8
	GCwtPPvlA41gTB/Jfrmq4Kz/G/C52YQ2xTvF+u3hOgmAaPcykjvzddQu3UM/RyCp80YZY3JfnLe
	KDjfUTXLf1fJxrynUGLf8KWewgXYy4/kiaisc5U2saPApDWwCj5G7jOIcyqsevEXglKJltgX1Fc
	io/4Brs2ZbVtWWLZ6dVkGbUSYeVxbpck+XKWAPzqxEZGgI4xTqZiQNXqBV5iZJ9nm0exG5RZhju
	DjBc7TwrwUhtO9RGVqIYa++nMOqFHMtMIkY+1z/TrEi+wv5GQDrus7YNbMBfoes1WFbxQl1G/HF
	A929La//rqxjTh826givtMB9xLCWqqbfabqsxcnWyG8aUHovlsMvT7fOaVcWaI/C6SHW
X-Received: by 2002:a05:600c:1908:b0:495:7838:7e25 with SMTP id 5b1f17b1804b1-4980ee9f00fmr252333455e9.15.1785797058758;
        Mon, 03 Aug 2026 15:44:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d4-c101-2c67-9805-4069-c4eb.310.pool.telefonica.de. [2a02:3100:b3d4:c101:2c67:9805:4069:c4eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6cbsm32690944f8f.23.2026.08.03.15.44.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Aug 2026 15:44:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: nv: Allocate the shadow S2 MMUs individually
Date: Tue,  4 Aug 2026 00:44:04 +0200
Message-Id: <20260803224405.41468-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_154421_113354_389B1AA9 
X-CRM114-Status: GOOD (  21.61  )
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

A vCPU in L2 caches its shadow S2 MMU in vcpu->arch.hw_mmu.
kvm_vcpu_init_nested() can grow kvm->arch.nested_mmus while initialising
another vCPU: it copies the MMUs, publishes the new allocation, and frees
the old one.  It updates pgt->mmu back-pointers, but not hw_mmu, leaving
the first vCPU with a pointer to freed memory.  hw_mmu cannot be fixed up
the same way: a running vCPU reads it without holding mmu_lock.  Copying
also duplicates the MMU's refcount, leaving the live copy permanently
elevated.

KASAN reports this as a slab-use-after-free in kvm_handle_guest_abort().

Make nested_mmus a pointer table and allocate each MMU separately.
Growing the table now moves only pointer entries, preserving cached
hw_mmu pointers, pgt->mmu back-pointers, and each MMU's refcount.  Fully
initialise new MMUs before publishing the table and its size under
mmu_lock.

The old failure path passed uninitialised entries to
kvm_free_stage2_pgd(), which needs mmu->arch.  Use an allocation helper
that returns only fully initialised MMUs, so error cleanup frees only
completed objects; kvm_init_stage2_mmu() unwinds a failed initialisation.

Fixes: 4f128f8e1aaa ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Tested on an arm64 KASAN kernel under QEMU TCG with EL2 emulation
(-machine virt,virtualization=on -cpu max, kvm-arm.mode=nested): the
selftest in patch 2 reports the slab-use-after-free without this patch
and passes with it.

 arch/arm64/include/asm/kvm_host.h |  6 +-
 arch/arm64/kvm/nested.c           | 92 +++++++++++++++++++++----------
 2 files changed, 67 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bae2c4f92ef5..f587b01039f9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -319,10 +319,10 @@ struct kvm_arch {
 	u64 fgu[__NR_FGT_GROUP_IDS__];
 
 	/*
-	 * Stage 2 paging state for VMs with nested S2 using a virtual
-	 * VMID.
+	 * Stage 2 paging state for VMs with nested S2 using a virtual VMID.
+	 * MMUs are individually allocated to keep their addresses stable.
 	 */
-	struct kvm_s2_mmu *nested_mmus;
+	struct kvm_s2_mmu **nested_mmus;
 	size_t nested_mmus_size;
 	int nested_mmus_next;
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index dfb96edbdc43..af804a5ddca7 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/err.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
 
@@ -66,11 +67,36 @@ static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
 	return kvm_init_stage2_mmu(kvm, mmu, kvm_get_pa_bits(kvm));
 }
 
+static struct kvm_s2_mmu *alloc_nested_s2_mmu(struct kvm *kvm)
+{
+	struct kvm_s2_mmu *mmu;
+	int ret;
+
+	mmu = kzalloc_obj(*mmu, GFP_KERNEL_ACCOUNT);
+	if (!mmu)
+		return ERR_PTR(-ENOMEM);
+
+	ret = init_nested_s2_mmu(kvm, mmu);
+	if (ret) {
+		/* kvm_init_stage2_mmu() frees its internal allocations on error */
+		kfree(mmu);
+		return ERR_PTR(ret);
+	}
+
+	return mmu;
+}
+
+static void free_nested_s2_mmu(struct kvm_s2_mmu *mmu)
+{
+	kvm_free_stage2_pgd(mmu);
+	kfree(mmu);
+}
+
 int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
-	struct kvm_s2_mmu *tmp;
-	int num_mmus, ret = 0;
+	struct kvm_s2_mmu **tmp;
+	int i, num_mmus, ret = 0;
 
 	if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features) &&
 	    !cpus_have_final_cap(ARM64_HAS_HCR_NV1))
@@ -96,38 +122,48 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 		if (!tmp)
 			return -ENOMEM;
 
+		/*
+		 * Populate new slots before publishing: table walkers hold
+		 * mmu_lock and iterate up to nested_mmus_size.
+		 */
+		for (i = kvm->arch.nested_mmus_size; i < num_mmus; i++) {
+			struct kvm_s2_mmu *mmu = alloc_nested_s2_mmu(kvm);
+
+			if (IS_ERR(mmu)) {
+				ret = PTR_ERR(mmu);
+				break;
+			}
+
+			tmp[i] = mmu;
+		}
+
+		if (ret) {
+			while (i-- > kvm->arch.nested_mmus_size)
+				free_nested_s2_mmu(tmp[i]);
+
+			kvfree(tmp);
+
+			free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
+			vcpu->arch.ctxt.vncr_array = NULL;
+
+			return ret;
+		}
+
 		write_lock(&kvm->mmu_lock);
 
 		if (kvm->arch.nested_mmus_size) {
 			memcpy(tmp, kvm->arch.nested_mmus,
 			       size_mul(sizeof(*tmp), kvm->arch.nested_mmus_size));
-
-			for (int i = 0; i < kvm->arch.nested_mmus_size; i++)
-				tmp[i].pgt->mmu = &tmp[i];
 		}
 
 		swap(kvm->arch.nested_mmus, tmp);
+		kvm->arch.nested_mmus_size = num_mmus;
 
 		write_unlock(&kvm->mmu_lock);
 
 		kvfree(tmp);
 	}
 
-	for (int i = kvm->arch.nested_mmus_size; !ret && i < num_mmus; i++)
-		ret = init_nested_s2_mmu(kvm, &kvm->arch.nested_mmus[i]);
-
-	if (ret) {
-		for (int i = kvm->arch.nested_mmus_size; i < num_mmus; i++)
-			kvm_free_stage2_pgd(&kvm->arch.nested_mmus[i]);
-
-		free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
-		vcpu->arch.ctxt.vncr_array = NULL;
-
-		return ret;
-	}
-
-	kvm->arch.nested_mmus_size = num_mmus;
-
 	return 0;
 }
 
@@ -725,7 +761,7 @@ void kvm_s2_mmu_iterate_by_vmid(struct kvm *kvm, u16 vmid,
 	write_lock(&kvm->mmu_lock);
 
 	for (int i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (!kvm_s2_mmu_valid(mmu))
 			continue;
@@ -767,7 +803,7 @@ struct kvm_s2_mmu *lookup_s2_mmu(struct kvm_vcpu *vcpu)
 	 *   if S2 translation is disabled.
 	 */
 	for (int i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (!kvm_s2_mmu_valid(mmu))
 			continue;
@@ -806,7 +842,7 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 	for (i = kvm->arch.nested_mmus_next;
 	     i < (kvm->arch.nested_mmus_size + kvm->arch.nested_mmus_next);
 	     i++) {
-		s2_mmu = &kvm->arch.nested_mmus[i % kvm->arch.nested_mmus_size];
+		s2_mmu = kvm->arch.nested_mmus[i % kvm->arch.nested_mmus_size];
 
 		if (atomic_read(&s2_mmu->refcnt) == 0)
 			break;
@@ -1223,7 +1259,7 @@ void kvm_nested_s2_wp(struct kvm *kvm)
 		return;
 
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (kvm_s2_mmu_valid(mmu))
 			kvm_stage2_wp_range(mmu, 0, kvm_phys_size(mmu));
@@ -1242,7 +1278,7 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 		return;
 
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (kvm_s2_mmu_valid(mmu))
 			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
@@ -1261,7 +1297,7 @@ void kvm_nested_s2_flush(struct kvm *kvm)
 		return;
 
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (kvm_s2_mmu_valid(mmu))
 			kvm_stage2_flush_range(mmu, 0, kvm_phys_size(mmu));
@@ -1273,10 +1309,10 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 	int i;
 
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (!WARN_ON(atomic_read(&mmu->refcnt)))
-			kvm_free_stage2_pgd(mmu);
+			free_nested_s2_mmu(mmu);
 	}
 	kvfree(kvm->arch.nested_mmus);
 	kvm->arch.nested_mmus = NULL;

base-commit: 38436106b2f5ceb55950a7098c1a5804de2bde62
-- 
2.39.5 (Apple Git-154)

