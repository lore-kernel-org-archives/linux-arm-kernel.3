Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F444C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 23:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIY3kQ/rqom2CHUFVot9LfFPX3TJilMq8XIt5R0Ja1w=; b=m/VStAewh4e5J01KcxTPEaDOQU
	nmk3eELoyWFo3LaUUNZs3dIUWvBgqVro2qDXe0Y7zDPdugUDJ4xktc1Icrpuv8QLrxkeWNmIE+Vhn
	X2kG+rj6WJDvci3t7I3lHGb4CzzlOyEfXPtZSI8X+fiDmD4SDWFl+sb6wNchne3JOax5UCP4+E1j5
	GY8ibNnFSMJS8wf2iPB/DeX5gqOU66mmRD5+nOS1sSGjlojPUEWM/uw0efMEF2aXZTa70tgueBVzi
	i9UF716DIK+HhzPi4rJSzjEuknneIUxA+Cqb+5XhL/eDr2sbw6KnfvUewLJelnkkWy8zbrwBnHyoc
	U43I5UHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ygg-0000000ADkr-166l;
	Wed, 16 Sep 2026 23:05:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ygX-0000000ADim-3bMd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 23:05:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68C5A1516;
	Wed, 16 Sep 2026 16:04:56 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE8323F7B4;
	Wed, 16 Sep 2026 16:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789599900; bh=vi57qo/8SMKA7ce5milDFGhdsFoRJ0qsi5qR9nbde/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pF7L6UA2zHJqy59tQ07hSXxqT0O700GRTGRub53WtpRgDJZIe/eH6oq3DcCXPO+Au
	 XxRkeTzfwxduIE5+qBdar4R3GY5mZFF8umnXJDTpnjqhS9rWSexjq6MQYN5p3bn+9h
	 5S+cUqbue86mYNqrS/1zYANFhNVzrABbEhEWc7uI=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] KVM: arm64: ptdump: Fix shadow ptdump sleep-in-atomic-context problem
Date: Thu, 17 Sep 2026 00:03:37 +0100
Message-ID: <20260916230337.4162485-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916230337.4162485-1-weilin.chang@arm.com>
References: <20260916230337.4162485-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_160501_991380_1BD62C96 
X-CRM114-Status: GOOD (  20.05  )
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

Previously we exposed shadow page tables by creating a debugfs ptdump
file whenever a nested mmu instance gets bound to a new context, and
deleting the debugfs file whose context was getting unbound.

This turned out to be buggy, as the instance<->context binding process
is done with the mmu_lock held, and debugfs creation/deletion can sleep.

Change the approach and create a shadow ptdump file for each nested mmu
instead during kvm_vcpu_init_nested(), in a sleepable context. The files
will be named nested_mmu<index>, and reading it will return the nested
context's VTTBR, VTCR, and s2 enabled or not before dumping the shadow
page tables, given the nested mmu is valid.

Fixes: 19e15dc73f0f ("KVM: arm64: nv: Expose shadow page tables in debugfs")
Reported-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Closes: https://lore.kernel.org/kvmarm/aiuF0KSvvv-ZozI1@sm-arm-grace07/
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/kvm_host.h |  4 ----
 arch/arm64/include/asm/kvm_mmu.h  |  6 ++----
 arch/arm64/kvm/nested.c           |  9 ++++-----
 arch/arm64/kvm/ptdump.c           | 32 +++++++++++++++----------------
 4 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index cd9b9d2462f9..db177af9149f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -217,10 +217,6 @@ struct kvm_s2_mmu {
 	 */
 	bool	nested_stage2_enabled;
 
-#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
-	struct dentry *shadow_pt_debugfs_dentry;
-#endif
-
 	/*
 	 * true when this MMU needs to be unmapped before being used for a new
 	 * purpose.
diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 6eae7e7e2a68..ac2b0637692a 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -392,12 +392,10 @@ static inline bool kvm_supports_cacheable_pfnmap(void)
 
 #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
 void kvm_s2_ptdump_create_debugfs(struct kvm *kvm);
-void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu);
-void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu);
+void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu, int idx);
 #else
 static inline void kvm_s2_ptdump_create_debugfs(struct kvm *kvm) {}
-static inline void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu) {}
-static inline void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu) {}
+static inline void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu, int idx) {}
 #endif /* CONFIG_PTDUMP_STAGE2_DEBUGFS */
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index b191365d97cc..41253fe45941 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -124,6 +124,9 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 			return ret;
 		}
 
+		for (i = 0; i < S2_MMU_PER_VCPU; i++)
+			kvm_nested_s2_ptdump_create_debugfs(&tmp[i], i + kvm->arch.nested_mmus_size);
+
 		guard(write_lock)(&kvm->mmu_lock);
 
 		for (i = 0; i < S2_MMU_PER_VCPU; i++)
@@ -837,10 +840,8 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 	kvm->arch.nested_mmus_next = (i + 1) % kvm->arch.nested_mmus_size;
 
 	/* Make sure we don't forget to do the laundry */
-	if (kvm_s2_mmu_valid(s2_mmu)) {
-		kvm_nested_s2_ptdump_remove_debugfs(s2_mmu);
+	if (kvm_s2_mmu_valid(s2_mmu))
 		s2_mmu->pending_unmap = true;
-	}
 
 	/*
 	 * The virtual VMID (modulo CnP) will be used as a key when matching
@@ -854,8 +855,6 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 	s2_mmu->tlb_vtcr = vcpu_read_sys_reg(vcpu, VTCR_EL2);
 	s2_mmu->nested_stage2_enabled = vcpu_read_sys_reg(vcpu, HCR_EL2) & HCR_VM;
 
-	kvm_nested_s2_ptdump_create_debugfs(s2_mmu);
-
 out:
 	atomic_inc(&s2_mmu->refcnt);
 
diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 4ead856c181a..9411d6c2dafb 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -17,7 +17,7 @@
 
 #define MARKERS_LEN		2
 #define KVM_PGTABLE_MAX_LEVELS	(KVM_PGTABLE_LAST_LEVEL + 1)
-#define S2FNAMESZ		sizeof("0x0123456789abcdef-0x0123456789abcdef-s2-disabled")
+#define S2FNAMESZ		sizeof("nested_mmu0000")
 
 struct kvm_ptdump_guest_state {
 	struct kvm_s2_mmu	*mmu;
@@ -173,6 +173,15 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 		.seq		= m,
 	};
 
+	if (kvm_is_nested_s2_mmu(kvm, mmu)) {
+		if (kvm_s2_mmu_valid(mmu))
+			seq_printf(m, "VTCR: 0x%016llx VTTBR: 0x%016llx s2: %s\n",
+				   mmu->tlb_vtcr, mmu->tlb_vttbr,
+				   mmu->nested_stage2_enabled ? "enabled" : "disabled");
+		else
+			return 0;
+	}
+
 	ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
 	if (ret)
 		return ret;
@@ -299,26 +308,15 @@ static const struct file_operations kvm_pgtable_levels_fops = {
 	.release	= kvm_pgtable_debugfs_close,
 };
 
-void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu)
+void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu, int idx)
 {
-	struct dentry *dent;
 	char file_name[S2FNAMESZ];
 
-	snprintf(file_name, sizeof(file_name), "0x%016llx-0x%016llx-s2-%sabled",
-		 mmu->tlb_vttbr,
-		 mmu->tlb_vtcr,
-		 mmu->nested_stage2_enabled ? "en" : "dis");
-
-	dent = debugfs_create_file(file_name, 0400,
-				   mmu->arch->debugfs_nv_dentry, mmu,
-				   &kvm_ptdump_guest_fops);
+	snprintf(file_name, sizeof(file_name), "nested_mmu%d", idx);
 
-	mmu->shadow_pt_debugfs_dentry = dent;
-}
-
-void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu)
-{
-	debugfs_remove(mmu->shadow_pt_debugfs_dentry);
+	debugfs_create_file(file_name, 0400,
+			    mmu->arch->debugfs_nv_dentry, mmu,
+			    &kvm_ptdump_guest_fops);
 }
 
 void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
-- 
2.43.0


