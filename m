Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC63C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 09:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqPQildVUr5OZauQmAhm0/cwcJh5PP5Ede7gwQE/8hQ=; b=rW0G3W7oAS7rvAaNNFxm/KWhyL
	qFIrG0ajKdx9JShqXeslGwfn3Ewk/mP3jSyd9gpPowPUyC6v3b9wP5wd6DNi9Ai3Qp49OhPiPAyco
	id3SXG/kdrwRCqwPxJeRZwHkSi1y24xNGlIjmb+tGBgD2migsQEl9vDi6lzSUhHEfGzOyBKIiIHex
	wqINK50FEgyN039mStHeb715jnKA11R7huPVyStMcRPZjWIdg3qMDSx2atrUhtjs0Snd+gyuStVqg
	C8jR0WhFg2T/rIpoIFOK6iuboOSGNxQsNfMiRLhHFWbiSaivmwB+EFzskULFxeHLBnIzmRNg1Qesm
	TOrDIAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQY-0000000ERTH-0gIY;
	Sat, 22 Aug 2026 09:54:14 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQM-0000000ERMo-2ZW6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 09:54:04 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so3425897a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 02:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787392441; x=1787997241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqPQildVUr5OZauQmAhm0/cwcJh5PP5Ede7gwQE/8hQ=;
        b=FyqOA6tupfCGPWOgbtPL97eIM31ZusQf48paheMKz3z4MVrzlkK3r2IciROseCSEDV
         dhNDYMG+OXY5nca0/oyIhI7ComVfNozbIOhUV50JbBHHc/+lZ0oLdUdP6VY8/3dlCP8K
         +i3QJxwBCV9Ww270emwJvfGQO1VyF4arI5qD+MmekqeLTq6Z/mVFHusv+tdob41E55su
         mTxq5ORs+qPFpP/m82FBOYLZ9zlAOTJd349RHdVFwU2bajjan2fLqfNyYYcuyCQ4+BHL
         JnDe+46cowSMBamGIlG9Up1TjPqNYT6Koq47f7i+B3WAmXEghx0EEvwjYIRd14wADlYm
         6ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787392441; x=1787997241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PqPQildVUr5OZauQmAhm0/cwcJh5PP5Ede7gwQE/8hQ=;
        b=pj3BvizGYx3tquW1UjnBDR5bUHk/m+fbBIJNoqZhJT8n6+nN0to7tuzdCzu3EFVr3o
         WSP63RXFZ+idjyP8r4YZx0d0RLeWk5jRYqvi5AzNAu5ztqSeWQFbcGJ8yx9vGOtdK5YB
         qBJKDMXbAqpN9NK6uJeIyIfMpO/stapJjIA3czzYfM81H1lfkFKP+WgYFpeh7KjjMEyH
         Mi3ksZC6zRz7KIGOM6YH3uViIpWX1KbYArT2eLNS3uXGqZetVDu9vUwAg38/wOj3R7eU
         ZUCODXGbCUVqDqez6L5G2bZurUTfyJylYqg0JO88pSVrYagGNL7GN3tiDWTp4aBiq9ZL
         jIyw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8bKG9e0qs3CcqsdmQPFCznykaldngbji79XbiHO5ZuKtvAIe9tlLtP4mVoGhny8LDnVilfKs24hrbtTHT6fWv@lists.infradead.org
X-Gm-Message-State: AFuF++khBbjBUbmIXC1ZhUMZ5RNiknU3hpgUOI07L9it4gIovVXgxStj
	/ShZgYXrQYxGW2gzgobDEhLfBbAsxxlF3zVyNUOkHslUAdajYJsqFrXp
X-Gm-Gg: AR+sD11VNVDMlvQpeKPlp490hzLyzsiGA2CFRlPVJYghOdEacvfaZBiedqEntIgW9AB
	B5IzdSaJ24XYojJeU0zWTLoMa4gD5iVRHxwO9TvDTdl+0+ugOSggHmdqdavttxWi5+W1NxKxnjK
	9xUSV8ipa8AHI10PAxTtYfLvFgGxkpRd0+TjeLumHRSl4Ij862wQaHUREt9SQXZE3TBs9w8Xzgp
	gagPGlzU0xihvtqrduzBUHERUO6kE5cP/lRkKK5+Rhjv75boLjCidLVq1SvngeKUg9yvI6eFgMf
	6UHdK5EVQuwyt2rK1sXwbfO7thTeCfLfDYPjfXM5v3Gv4I1HRTVZI3MK/upzRfZRqjOuki2Hxab
	X2SsLVnJGvwtPYmZa0D1W8LHjj95nGATKP0JzsBZMHLuiZeiSr1Pj9JxhBBoNh0OpXNdnMBOLww
	VYc02+0Jdq1IrGP5FV5f80wvqnFCZY4SNKbxMi9vZJo0PQYxhTroBsUClR/Za7IMNb/ptBNt7eM
	XgO32CtkoYHfE9TaKGlTabF3WM37kwt1kp0YgCJzlXiPwWLvEAqBk6O7qzb1AuTm7T900pApbrZ
	76S7WR0oW50ktQfj83eovkiCeZuH+KtRwpDlDyd8ufoK/Rq9CSG2rKrcZlR7IqM9fYYj
X-Received: by 2002:a05:6402:4613:b0:698:9e5e:5df8 with SMTP id 4fb4d7f45d1cf-6a42f1aca88mr12197582a12.7.1787392440592;
        Sat, 22 Aug 2026 02:54:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c327asm11151586a12.8.2026.08.22.02.53.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 02:54:00 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v3 3/5] KVM: arm64: vgic-v3: Separate redistributor teardown from unassignment
Date: Sat, 22 Aug 2026 11:53:44 +0200
Message-Id: <20260822095346.53882-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822095346.53882-1-kmehltretter@gmail.com>
References: <20260822095346.53882-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_025403_000983_1A6CB222 
X-CRM114-Status: GOOD (  17.99  )
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

MMIO-bus unregistration may synchronize SRCU and must run outside
config_lock. Conversely, clearing the redistributor assignment needs
config_lock, and teardown must do so before freeing the redistributor
regions.

Introduce an already-locked unassignment primitive that only clears the
cached region and base address. It deliberately does not adjust free_index:
failure rollback resets all region counters, while VM teardown frees the
regions. Keep MMIO-bus unregistration separate. Unregister devices before
taking config_lock in VM teardown, then unassign the vCPUs before freeing
their regions.

Move redistributor cleanup out of __kvm_vgic_vcpu_destroy() and into its
outer wrapper. This preserves failed-vCPU cleanup before its memory can be
freed, without the special conditional in the common destructor. The region
destructor no longer needs to scan the vCPUs.

Suggested-by: Marc Zyngier <maz@kernel.org>
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-init.c    | 46 +++++++++++-------------------
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 16 ++---------
 arch/arm64/kvm/vgic/vgic.h         |  1 +
 3 files changed, 21 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 0a3df6d3a691..a0d72b540331 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -523,29 +523,6 @@ static void __kvm_vgic_vcpu_destroy(struct kvm_vcpu *vcpu)
 	INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
 	kfree(vgic_cpu->private_irqs);
 	vgic_cpu->private_irqs = NULL;
-
-	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
-		/*
-		 * If this vCPU is being destroyed because of a failed creation
-		 * then unregister the redistributor to avoid leaving behind a
-		 * dangling pointer to the vCPU struct.
-		 *
-		 * vCPUs that have been successfully created (i.e. added to
-		 * kvm->vcpu_array) get unregistered in kvm_vgic_destroy(), as
-		 * this function gets called while holding kvm->arch.config_lock
-		 * in the VM teardown path and would otherwise introduce a lock
-		 * inversion w.r.t. kvm->srcu.
-		 *
-		 * vCPUs that failed creation are torn down outside of the
-		 * kvm->arch.config_lock and do not get unregistered in
-		 * kvm_vgic_destroy(), meaning it is both safe and necessary to
-		 * do so here.
-		 */
-		if (kvm_get_vcpu_by_id(vcpu->kvm, vcpu->vcpu_id) != vcpu)
-			vgic_unregister_redist_iodev(vcpu);
-
-		vgic_cpu->rd_iodev.base_addr = VGIC_ADDR_UNDEF;
-	}
 }
 
 void kvm_vgic_vcpu_destroy(struct kvm_vcpu *vcpu)
@@ -553,7 +530,16 @@ void kvm_vgic_vcpu_destroy(struct kvm_vcpu *vcpu)
 	struct kvm *kvm = vcpu->kvm;
 
 	mutex_lock(&kvm->slots_lock);
+	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)
+		vgic_unregister_redist_iodev(vcpu);
+
 	__kvm_vgic_vcpu_destroy(vcpu);
+
+	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
+		mutex_lock(&kvm->arch.config_lock);
+		__vgic_unassign_redist_iodev(vcpu);
+		mutex_unlock(&kvm->arch.config_lock);
+	}
 	mutex_unlock(&kvm->slots_lock);
 }
 
@@ -563,21 +549,23 @@ void kvm_vgic_destroy(struct kvm *kvm)
 	unsigned long i;
 
 	mutex_lock(&kvm->slots_lock);
+	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)
+		kvm_for_each_vcpu(i, vcpu, kvm)
+			vgic_unregister_redist_iodev(vcpu);
+
 	mutex_lock(&kvm->arch.config_lock);
 
 	vgic_debug_destroy(kvm);
 
-	kvm_for_each_vcpu(i, vcpu, kvm)
+	kvm_for_each_vcpu(i, vcpu, kvm) {
 		__kvm_vgic_vcpu_destroy(vcpu);
+		if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)
+			__vgic_unassign_redist_iodev(vcpu);
+	}
 
 	kvm_vgic_dist_destroy(kvm);
 
 	mutex_unlock(&kvm->arch.config_lock);
-
-	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)
-		kvm_for_each_vcpu(i, vcpu, kvm)
-			vgic_unregister_redist_iodev(vcpu);
-
 	mutex_unlock(&kvm->slots_lock);
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 6c009deb11d4..dc860178105d 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -775,8 +775,7 @@ static void vgic_undo_redist_assignment(struct kvm_vcpu *vcpu)
 	guard(mutex)(&vcpu->kvm->arch.config_lock);
 
 	vgic_cpu->rdreg->free_index--;
-	vgic_cpu->rdreg = NULL;
-	vgic_cpu->rd_iodev.base_addr = VGIC_ADDR_UNDEF;
+	__vgic_unassign_redist_iodev(vcpu);
 }
 
 /**
@@ -855,7 +854,7 @@ void vgic_unregister_redist_iodev(struct kvm_vcpu *vcpu)
 	kvm_io_bus_unregister_dev(vcpu->kvm, KVM_MMIO_BUS, &rd_dev->dev);
 }
 
-static void vgic_reset_redist_iodev(struct kvm_vcpu *vcpu)
+void __vgic_unassign_redist_iodev(struct kvm_vcpu *vcpu)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 
@@ -881,7 +880,7 @@ static void vgic_v3_rollback_redist_region(struct kvm *kvm, u32 index)
 	guard(mutex)(&kvm->arch.config_lock);
 
 	kvm_for_each_vcpu(c, vcpu, kvm)
-		vgic_reset_redist_iodev(vcpu);
+		__vgic_unassign_redist_iodev(vcpu);
 
 	list_for_each_entry(iter, &kvm->arch.vgic.rd_regions, list)
 		iter->free_index = 0;
@@ -991,17 +990,8 @@ static int vgic_v3_alloc_redist_region(struct kvm *kvm, uint32_t index,
 
 void vgic_v3_free_redist_region(struct kvm *kvm, struct vgic_redist_region *rdreg)
 {
-	struct kvm_vcpu *vcpu;
-	unsigned long c;
-
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	/* Garbage collect the region */
-	kvm_for_each_vcpu(c, vcpu, kvm) {
-		if (vcpu->arch.vgic_cpu.rdreg == rdreg)
-			vcpu->arch.vgic_cpu.rdreg = NULL;
-	}
-
 	list_del(&rdreg->list);
 	kfree(rdreg);
 }
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index b71d486ae514..1a2e40004a47 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -350,6 +350,7 @@ int vgic_v3_save_pending_tables(struct kvm *kvm);
 int vgic_v3_set_redist_base(struct kvm *kvm, u32 index, u64 addr, u32 count);
 int vgic_register_redist_iodev(struct kvm_vcpu *vcpu);
 void vgic_unregister_redist_iodev(struct kvm_vcpu *vcpu);
+void __vgic_unassign_redist_iodev(struct kvm_vcpu *vcpu);
 bool vgic_v3_check_base(struct kvm *kvm);
 
 void vgic_v3_load(struct kvm_vcpu *vcpu);
-- 
2.39.5 (Apple Git-154)


