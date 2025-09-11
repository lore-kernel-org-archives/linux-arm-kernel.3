Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714BECAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isdwFXSTuI6vyPoZ5KEzSCMF3I2UJtuA1www3knapSA=; b=fFQP8eRwnj32NGrHXcLoSjnoz4
	R/Pqk4PAvkCvDaO4h2/WNdSwzvZyt23++ZG8y70iuEvvkd2XnPlcpO1JluThzL6W7w3nCV9V4BDiO
	vz80ZqxtnNgmXjJBvv8prz1paov3g1C1gOzN/OS92sy9+KPjMl52IXiIfNZoPTMXTReZ42ZZwcjCW
	qYZ2lh44d1Wh3KsL4AxdOoas+ZjiLqa5IUwTzAozXbhfdpU456X/1Hxg3aGuzOMEGNQ4CYCbYJqLS
	eXH3fwJ2sFL8DSm8HwZR4/bCGJbGbWSliuJDITPANO5/sRh8qKdfHml+gtd7LsJZnAGMbz+hqscEC
	9zOBW13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgO-00000003LRi-0Qff;
	Thu, 11 Sep 2025 13:49:52 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgL-00000003LOX-10ri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:49:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3e751508f21so584921f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598587; x=1758203387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isdwFXSTuI6vyPoZ5KEzSCMF3I2UJtuA1www3knapSA=;
        b=gMuOlcHIAtlD0aGWcKPB6ij06nD91LxnMB1Vby0GMbPN1i8O7fxgXMrv29nQnzEKox
         /d25hyGO9zNWFtxpwO3RpYCNGiUnjmRQNHFYVIwoX2VR5xntb2mFcI5BrxQKgbv/u6fO
         gwupqBlqJuLK61iNPsFDg0C50QZPvg2iywzMmrSKaQx1e0FnDCL7GkdmdtWTRiw7cG7C
         BwRpOYv8KO0zFLJ8IlaI9o88TxBIk4sLwU4tVqsgrt2PHd0FjIk7FC0UWTbzIqBPoJU0
         6LBcEE6syL56Cks76Ab8NLKIppnjEYG4DLYhhggugmEUF0jC01nrIgkv/YL3gTfjfBR1
         pkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598587; x=1758203387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isdwFXSTuI6vyPoZ5KEzSCMF3I2UJtuA1www3knapSA=;
        b=qJnFOMBG0N+tVZXg44Z/KNKHbrRLwGWzSGr/uZTSW4V7sm+sDz3aOd/XkhYkMkKpxU
         82vTs/WU9Qcau/+PMUo7HN9pDr44mpCUaTkXGky0uwD7pF+X3HiQ7iCMf0o6wtVPHpBM
         ym+J1IzMy3XCu5rMjLgKzt75g60Fhk9KEwWvT2cytScq5zX0yXgMmp37GukmF2TERodI
         SaKIRqMUyX3Uq1MhOeDS0utHigqgbJmv2BsDYAw77fH5SWF6oaCXGAWsdaf5QWZ3MjJx
         eXQDq0PwvhU7qaFj9nsp43RHE/dpHId8AT5wmFhimal+Z8XOgluam474RplCIIP0XqB0
         ZcHA==
X-Forwarded-Encrypted: i=1; AJvYcCW+e1iHRGwCaChV7LKI52+JlYqo80GE+dgEdC8boo/piyPcR/3Q56oPMtaIKK+IGNa0llaMs3plF5XIb+0E76HS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv7M9sHMeYvFXlA7gSylSLRjlXnE2Nd7r7ZtutDvoYx//wcGBI
	HalpW2R8LkuQiq/KF1tf9LXK8qtbF/pPRDX1H9zPMF2YLDvPn7gq2mly
X-Gm-Gg: ASbGncsZ8x10bBp8UUEN7R/NhqSzcNxtyCGrZR1imCP16S4RebJpDIYxBBqQ/uCDDkV
	a5udxtAnPLKSK9PNV1kTiVNIStuyH+39JXUfW2tjgUMkA5alzfXjzMHnBXao58cbopZR1G1GNuC
	HMS55MYoEmNf9m7OXoD/+0BMIVfTjOQ5duYfWSHMYRy/iGDLwLaWe1lz4GrdmCFMndSO/rFyQ2Y
	sGwpvjPj2rx4sBMk7g6XB/jz1LZzrdMfhj9i0Y9LuKWkicPLmg14JyWiz7n9isnkJXeH0360jg/
	yOTJYipW91LP/OwMnZuqF/lfCnq02WKo4O18pKTrlaz/riBH04mrII829o7NT+BBE5hvOx+YE/D
	58gZyan7F0gHhCKE0WvgifZlMkd6+SaLN0kbhm7nZRQXHYdlLTmn7859y6uuUMLCEKDLj8jht
X-Google-Smtp-Source: AGHT+IEUm00hUmaf0xUsT6+9m3Zb4ZN7y4GJW9ZTUjRe1MIWGQuwO5e+uMIcjcSuvIP0YWNV9JWh1w==
X-Received: by 2002:a05:6000:2385:b0:3e0:152a:87ad with SMTP id ffacd0b85a97d-3e64bde9161mr15064477f8f.31.1757598587245;
        Thu, 11 Sep 2025 06:49:47 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760778915sm2608361f8f.12.2025.09.11.06.49.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 11 Sep 2025 06:49:47 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	roypat@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH 3/6] KVM: arm64: Add pre_fault_memory implementation
Date: Thu, 11 Sep 2025 14:46:45 +0100
Message-Id: <20250911134648.58945-4-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250911134648.58945-1-jackabt.amazon@gmail.com>
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064949_335034_A010349B 
X-CRM114-Status: GOOD (  16.92  )
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

From: Jack Thomson <jackabt@amazon.com>

Add kvm_arch_vcpu_pre_fault_memory() for arm64. The implementation hands
off the stage-2 faulting logic to either gmem_abort() or
user_mem_abort().

Update __gmem_abort() and __user_mem_abort() to take the pre_fault
parameter. When passed, the paths to determine write or exec faults are
short circuited to false, as when pre-faulting, it should be treated
as a read fault.

This closely follows the implementation on x86.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 arch/arm64/kvm/Kconfig |  1 +
 arch/arm64/kvm/arm.c   |  1 +
 arch/arm64/kvm/mmu.c   | 71 ++++++++++++++++++++++++++++++++++++------
 3 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index bff62e75d681..1ac0605f86cb 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -25,6 +25,7 @@ menuconfig KVM
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
+	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select KVM_XFER_TO_GUEST_WORK
 	select KVM_VFIO
 	select HAVE_KVM_DIRTY_RING_ACQ_REL
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 888f7c7abf54..65654a742864 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -322,6 +322,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_IRQFD_RESAMPLE:
 	case KVM_CAP_COUNTER_OFFSET:
 	case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
+	case KVM_CAP_PRE_FAULT_MEMORY:
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 082e7d8ae655..002f564c6ac7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1523,7 +1523,8 @@ static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
 
 static int __gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			struct kvm_s2_trans *nested,
-			struct kvm_memory_slot *memslot, bool is_perm)
+			struct kvm_memory_slot *memslot, bool is_perm,
+			bool pre_fault)
 {
 	bool write_fault, exec_fault, writable;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
@@ -1537,6 +1538,9 @@ static int __gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	gfn_t gfn;
 	int ret;
 
+	if (pre_fault)
+		flags |= KVM_PGTABLE_WALK_PRE_FAULT;
+
 	ret = prepare_mmu_memcache(vcpu, true, &memcache);
 	if (ret)
 		return ret;
@@ -1546,8 +1550,8 @@ static int __gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	else
 		gfn = fault_ipa >> PAGE_SHIFT;
 
-	write_fault = kvm_is_write_fault(vcpu);
-	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
+	write_fault = !pre_fault && kvm_is_write_fault(vcpu);
+	exec_fault = !pre_fault && kvm_vcpu_trap_is_exec_fault(vcpu);
 
 	VM_WARN_ON_ONCE(write_fault && exec_fault);
 
@@ -1599,7 +1603,7 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		      struct kvm_s2_trans *nested,
 		      struct kvm_memory_slot *memslot, bool is_perm)
 {
-	int ret = __gmem_abort(vcpu, fault_ipa, nested, memslot, is_perm);
+	int ret = __gmem_abort(vcpu, fault_ipa, nested, memslot, is_perm, false);
 	return ret != -EAGAIN ? ret : 0;
 }
 
@@ -1607,7 +1611,7 @@ static int __user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			    struct kvm_s2_trans *nested,
 			    struct kvm_memory_slot *memslot,
 			    long *page_size, unsigned long hva,
-			    bool fault_is_perm)
+			    bool fault_is_perm, bool pre_fault)
 {
 	int ret = 0;
 	bool topup_memcache;
@@ -1631,10 +1635,13 @@ static int __user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	vm_flags_t vm_flags;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
 
+	if (pre_fault)
+		flags |= KVM_PGTABLE_WALK_PRE_FAULT;
+
 	if (fault_is_perm)
 		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
-	write_fault = kvm_is_write_fault(vcpu);
-	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
+	write_fault = !pre_fault && kvm_is_write_fault(vcpu);
+	exec_fault = !pre_fault && kvm_vcpu_trap_is_exec_fault(vcpu);
 	VM_WARN_ON_ONCE(write_fault && exec_fault);
 
 	/*
@@ -1895,8 +1902,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
 			  bool fault_is_perm)
 {
-	int ret = __user_mem_abort(vcpu, fault_ipa, nested, memslot, NULL,
-			    hva, fault_is_perm);
+	int ret = __user_mem_abort(vcpu, fault_ipa, nested, memslot, NULL, hva,
+				   fault_is_perm, false);
 	return ret != -EAGAIN ? ret : 0;
 }
 
@@ -2468,3 +2475,49 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
 
 	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
 }
+
+long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
+				    struct kvm_pre_fault_memory *range)
+{
+	int r;
+	hva_t hva;
+	phys_addr_t end;
+	long page_size;
+	struct kvm_memory_slot *memslot;
+	phys_addr_t ipa = range->gpa;
+	gfn_t gfn = gpa_to_gfn(range->gpa);
+
+	while (true) {
+		page_size = PAGE_SIZE;
+		memslot = gfn_to_memslot(vcpu->kvm, gfn);
+		if (!memslot)
+			return -ENOENT;
+
+		if (kvm_slot_has_gmem(memslot)) {
+			r = __gmem_abort(vcpu, ipa, NULL, memslot, false, true);
+		} else {
+			hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
+			if (kvm_is_error_hva(hva))
+				return -EFAULT;
+			r = __user_mem_abort(vcpu, ipa, NULL, memslot, &page_size, hva, false,
+					     true);
+		}
+
+		if (r != -EAGAIN)
+			break;
+
+		if (signal_pending(current))
+			return -EINTR;
+
+		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
+			return -EIO;
+
+		cond_resched();
+	};
+
+	if (r < 0)
+		return r;
+
+	end = (range->gpa & ~(page_size - 1)) + page_size;
+	return min(range->size, end - range->gpa);
+}
-- 
2.43.0


