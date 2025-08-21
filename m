Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49334CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1Z7dlZxBw5nHn1FPuYZbn+Y0LXB1yXFMLEbzmKHn2A=; b=aB/d1yUzQgQOyXQdF6YxydjZ46
	FELzd6ZicbopCFUsIuTpD/H9FqODyy7BkehOGXI6t8HuhIDdbNe1kpoA9twiS579yNVFv5dPjJOZu
	Paa/QZ6Wnede2OGXivGhD1jvGyoS6EpD2INSKo0pA/ssMncgvH0IoT3h8GJa406htzCesaPZzQk9J
	H1fIq60tP2ZIHrmGnL3CpHlM4FzrlJPBwFA3GvBoEB8mhSas+g/HxFpig9x+9DYAigwLQeWUb9eH0
	88QpnLVQNysjJ06MGDJyl9YTVMbz+2EH+Pr5tvgrJEloIo99HV4EhSPOrj5v1fHItEKE2pZ1Wwb4W
	xEUJHKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHfV-00000001IUS-3mXG;
	Fri, 22 Aug 2025 02:38:17 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCOx-00000000bUG-3C6E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:00:52 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-76e92b3dde9so1382329b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810051; x=1756414851; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1Z7dlZxBw5nHn1FPuYZbn+Y0LXB1yXFMLEbzmKHn2A=;
        b=eRwodeWh5f8SoG2LT/2c4E7UbySHn/N4m1GcLaqWkCUd6HYFNMXQv4Nz2a9bd40l41
         G9si1J5Oq6WXsGXmteELQXZeG6VLPtTUQ4QMvrOl42JWbtYeN+XfkUUbe2oCrdLPfI6i
         JpxcejQyW5R7PmvYvSPXq7ZIfXWauxKDbSAqeXynbA1co6KBXlLcPuxEcHXhcx9mHNjT
         8RXI6hDApDy6PPdYQ/F0CYAHPAAgK6nLPkc6BSNwGz6MH128xCrJmYAWNmWXf55Zn3nX
         MkHKzN5mgq7GSlSGYBIMdtaB5HzWEVg8gbJL43ULIcR+MK0eXLvlRkC7D0tbcz6Ih7Uv
         fVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810051; x=1756414851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1Z7dlZxBw5nHn1FPuYZbn+Y0LXB1yXFMLEbzmKHn2A=;
        b=YSiw1OZD3h71kqIQmeTz8MiDP41Cea8G7cfUN/36YwZMKLAa9YRJf2MRIg/mWBY1gT
         mEQ+HaLw9wHNkdIk1ZHZVXPBW4sayxj11NdbqVu6OsTvgh68N2oNRckXNhczABQvfPEP
         Y8iPhmhLVkyQ5Bv0EgVCE5aOZrKGWy+kZNk+Lw8Wmz0SmSvBnM+8RFI1s1YhGv5reodD
         gah+KQ9ZsuKeP8iSsYZRT+h9/lNDnB6NYaThHbZhkzr4JPSQJJNqbex95JgQgDbyb0VH
         tQJcvrR7OLZVvSHPBa17wvJtooGwmSv2o1TTpXQcK2RNWxuwMUpZO1Yz+5L0H4vzGgva
         HSdg==
X-Gm-Message-State: AOJu0YzTgGb58Eo+QydievAZBLjdCvWL4liprzpdGQaD24CnaxbA6ol6
	aXQPK6NivTOPctAh6YcRry1XYWsTwcNmpzA/5QTNcSuqrhKWtUqjGaPCZf+JrGgSbZcJm9DAGWM
	51LNMYw==
X-Google-Smtp-Source: AGHT+IFM0DDRKUEvT6bUujvJ11ucFjwG7bXTKg/FynvNfyXGnyLk/rw/50Ds3R7JLyodH6b8OqA5quCXy9I=
X-Received: from pfbfj2.prod.google.com ([2002:a05:6a00:3a02:b0:76b:c53c:7184])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:5483:b0:240:11b3:bf2e
 with SMTP id adf61e73a8af0-24340b5b48bmr715813637.16.1755810050610; Thu, 21
 Aug 2025 14:00:50 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:29 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-4-seanjc@google.com>
Subject: [RFC PATCH 03/16] KVM: arm64: Move SRCU-protected region of
 kvm_handle_guest_abort() to helper
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140051_812868_05C26407 
X-CRM114-Status: GOOD (  23.75  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Move the SRCU-protected portion of the abort handler to a separate helper
in anticipation of adding "struct kvm_page_fault" to track state related
to resolving the fault.  Using a separate helper will allow making several
fields in kvm_page_fault "const", without having to do something funky
like create a temporary copy in the middle of kvm_handle_guest_abort().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 172 ++++++++++++++++++++++---------------------
 1 file changed, 88 insertions(+), 84 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1e3ac283c519..de028471b9eb 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1811,82 +1811,16 @@ static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 	read_unlock(&vcpu->kvm->mmu_lock);
 }
 
-/**
- * kvm_handle_guest_abort - handles all 2nd stage aborts
- * @vcpu:	the VCPU pointer
- *
- * Any abort that gets to the host is almost guaranteed to be caused by a
- * missing second stage translation table entry, which can mean that either the
- * guest simply needs more memory and we must allocate an appropriate page or it
- * can mean that the guest tried to access I/O memory, which is emulated by user
- * space. The distinction is based on the IPA causing the fault and whether this
- * memory region has been registered as standard RAM by user space.
- */
-int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
+static int __kvm_handle_guest_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+				    unsigned long esr)
 {
 	struct kvm_s2_trans nested_trans, *nested = NULL;
-	unsigned long esr;
-	phys_addr_t fault_ipa; /* The address we faulted on */
-	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
 	struct kvm_memory_slot *memslot;
-	unsigned long hva;
 	bool write_fault, writable;
+	unsigned long hva;
+	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
 	gfn_t gfn;
-	int ret, idx;
-
-	/* Synchronous External Abort? */
-	if (kvm_vcpu_abt_issea(vcpu)) {
-		/*
-		 * For RAS the host kernel may handle this abort.
-		 * There is no need to pass the error into the guest.
-		 */
-		if (kvm_handle_guest_sea())
-			return kvm_inject_serror(vcpu);
-
-		return 1;
-	}
-
-	esr = kvm_vcpu_get_esr(vcpu);
-
-	/*
-	 * The fault IPA should be reliable at this point as we're not dealing
-	 * with an SEA.
-	 */
-	ipa = fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
-	if (KVM_BUG_ON(ipa == INVALID_GPA, vcpu->kvm))
-		return -EFAULT;
-
-	if (esr_fsc_is_translation_fault(esr)) {
-		/* Beyond sanitised PARange (which is the IPA limit) */
-		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
-			kvm_inject_size_fault(vcpu);
-			return 1;
-		}
-
-		/* Falls between the IPA range and the PARange? */
-		if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
-			fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
-
-			return kvm_inject_sea(vcpu, kvm_vcpu_trap_is_iabt(vcpu),
-					      fault_ipa);
-		}
-	}
-
-	trace_kvm_guest_fault(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
-			      kvm_vcpu_get_hfar(vcpu), fault_ipa);
-
-	/* Check the stage-2 fault is trans. fault or write fault */
-	if (!esr_fsc_is_translation_fault(esr) &&
-	    !esr_fsc_is_permission_fault(esr) &&
-	    !esr_fsc_is_access_flag_fault(esr)) {
-		kvm_err("Unsupported FSC: EC=%#x xFSC=%#lx ESR_EL2=%#lx\n",
-			kvm_vcpu_trap_get_class(vcpu),
-			(unsigned long)kvm_vcpu_trap_get_fault(vcpu),
-			(unsigned long)kvm_vcpu_get_esr(vcpu));
-		return -EFAULT;
-	}
-
-	idx = srcu_read_lock(&vcpu->kvm->srcu);
+	int ret;
 
 	/*
 	 * We may have faulted on a shadow stage 2 page table if we are
@@ -1906,13 +1840,13 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		ret = kvm_walk_nested_s2(vcpu, fault_ipa, &nested_trans);
 		if (ret) {
 			kvm_inject_s2_fault(vcpu, kvm_s2_trans_esr(&nested_trans));
-			goto out_unlock;
+			return ret;
 		}
 
 		ret = kvm_s2_handle_perm_fault(vcpu, &nested_trans);
 		if (ret) {
 			kvm_inject_s2_fault(vcpu, kvm_s2_trans_esr(&nested_trans));
-			goto out_unlock;
+			return ret;
 		}
 
 		ipa = kvm_s2_trans_output(&nested_trans);
@@ -1935,10 +1869,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 			goto out;
 		}
 
-		if (kvm_vcpu_abt_iss1tw(vcpu)) {
-			ret = kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
-			goto out_unlock;
-		}
+		if (kvm_vcpu_abt_iss1tw(vcpu))
+			return kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
 
 		/*
 		 * Check for a cache maintenance operation. Since we
@@ -1952,8 +1884,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		 */
 		if (kvm_is_error_hva(hva) && kvm_vcpu_dabt_is_cm(vcpu)) {
 			kvm_incr_pc(vcpu);
-			ret = 1;
-			goto out_unlock;
+			return 1;
 		}
 
 		/*
@@ -1963,8 +1894,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		 * of the page size.
 		 */
 		ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
-		ret = io_mem_abort(vcpu, ipa);
-		goto out_unlock;
+		return io_mem_abort(vcpu, ipa);
 	}
 
 	/* Userspace should not be able to register out-of-bounds IPAs */
@@ -1972,8 +1902,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 	if (esr_fsc_is_access_flag_fault(esr)) {
 		handle_access_fault(vcpu, fault_ipa);
-		ret = 1;
-		goto out_unlock;
+		return 1;
 	}
 
 	ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
@@ -1983,7 +1912,82 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 out:
 	if (ret == -ENOEXEC)
 		ret = kvm_inject_sea_iabt(vcpu, kvm_vcpu_get_hfar(vcpu));
-out_unlock:
+	return ret;
+}
+
+/**
+ * kvm_handle_guest_abort - handles all 2nd stage aborts
+ * @vcpu:	the VCPU pointer
+ *
+ * Any abort that gets to the host is almost guaranteed to be caused by a
+ * missing second stage translation table entry, which can mean that either the
+ * guest simply needs more memory and we must allocate an appropriate page or it
+ * can mean that the guest tried to access I/O memory, which is emulated by user
+ * space. The distinction is based on the IPA causing the fault and whether this
+ * memory region has been registered as standard RAM by user space.
+ */
+int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
+{
+	unsigned long esr;
+	phys_addr_t fault_ipa; /* The address we faulted on */
+	int ret, idx;
+
+	/* Synchronous External Abort? */
+	if (kvm_vcpu_abt_issea(vcpu)) {
+		/*
+		 * For RAS the host kernel may handle this abort.
+		 * There is no need to pass the error into the guest.
+		 */
+		if (kvm_handle_guest_sea())
+			return kvm_inject_serror(vcpu);
+
+		return 1;
+	}
+
+	esr = kvm_vcpu_get_esr(vcpu);
+
+	/*
+	 * The fault IPA should be reliable at this point as we're not dealing
+	 * with an SEA.
+	 */
+	fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
+	if (KVM_BUG_ON(fault_ipa == INVALID_GPA, vcpu->kvm))
+		return -EFAULT;
+
+	if (esr_fsc_is_translation_fault(esr)) {
+		/* Beyond sanitised PARange (which is the IPA limit) */
+		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
+			kvm_inject_size_fault(vcpu);
+			return 1;
+		}
+
+		/* Falls between the IPA range and the PARange? */
+		if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
+			fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+
+			return kvm_inject_sea(vcpu, kvm_vcpu_trap_is_iabt(vcpu),
+					      fault_ipa);
+		}
+	}
+
+	trace_kvm_guest_fault(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
+			      kvm_vcpu_get_hfar(vcpu), fault_ipa);
+
+	/* Check the stage-2 fault is trans. fault or write fault */
+	if (!esr_fsc_is_translation_fault(esr) &&
+	    !esr_fsc_is_permission_fault(esr) &&
+	    !esr_fsc_is_access_flag_fault(esr)) {
+		kvm_err("Unsupported FSC: EC=%#x xFSC=%#lx ESR_EL2=%#lx\n",
+			kvm_vcpu_trap_get_class(vcpu),
+			(unsigned long)kvm_vcpu_trap_get_fault(vcpu),
+			(unsigned long)kvm_vcpu_get_esr(vcpu));
+		return -EFAULT;
+	}
+
+	idx = srcu_read_lock(&vcpu->kvm->srcu);
+
+	ret = __kvm_handle_guest_abort(vcpu, fault_ipa, esr);
+
 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
 	return ret;
 }
-- 
2.51.0.261.g7ce5a0a67e-goog


