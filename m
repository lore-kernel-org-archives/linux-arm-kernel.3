Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EEEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66lti4rc67S1MgW6C9Fx0qKsel1IWwwp0ZGwruFCjuE=; b=EiPpa+3cCUAYu7wNal02eQs+tq
	La2rKfWX6E1WG1WOz7d7MsmfR6TjqdqKnLXPscoerVVwTYfF+nvozd1kST4MfPQfmfxwzNLtGIWR/
	xS9cddwfcF/4d7DQE6BzfKHD3CCRY+u8ESvj9M3QiKQ5bPZRj8EfiWwBEYH1YtrhDQDe3KXlVBn9g
	sIIK0Ik89E3/P+vbivi1CJ8MA9qeQIoSw5ykoeV8L68oxP6XEEEOewpWFd2S+Y7MZ72JQ+baYxzTZ
	Batb+OU8NdcAewMJb2/Lie4yBocg/qka8hxZKGGFGN5nKaumuEryidz/nKUk3cVcDhkeYunxeqar4
	39LfSb3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJh-0000000GwXD-16oC;
	Tue, 30 Jun 2026 12:11:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJS-0000000GwMs-3T07
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:11:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 341F32C46;
	Tue, 30 Jun 2026 05:11:33 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BFA43F905;
	Tue, 30 Jun 2026 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782821497; bh=N46ez0DDf1cDWzY7fWrdPqdcU1IQG980oeawrFJDpIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vaXLvhl7Tp04uLTI3rg7VSfVqsqMC/4Sqwwj8/ShCwzmZj84LwmWFcz2BPWBN1Eby
	 x8/3xD18EtcB2AyMQ0UiM3M/zPGJN8cIQJg47sjGnAY8C6Uuf0NaHiFMniwP/DF3mZ
	 mrn0LaPQ4CPz0PZsGANef0Wrk5R43RQqf9bDG+3s=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 6/6] KVM: arm64: ptdump: Introduce the shadow ptdump file
Date: Tue, 30 Jun 2026 13:10:05 +0100
Message-ID: <20260630121005.1130996-7-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630121005.1130996-1-weilin.chang@arm.com>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051139_080387_C71D6943 
X-CRM114-Status: GOOD (  17.31  )
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

Create a ptdump file for all shadow page tables. It will dump out all
valid shadow page tables at the time of request, with the mmu's index,
guest VTCR_EL2, VTTBR_EL2, and whether the guest stage-2 is enabled or
not.

Also detach the nested mmu array under the mmu_lock in
kvm_arch_flush_shadow_all() so readers cannot race with the array being
removed, then free the old array after dropping the lock.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/nested.c | 12 ++++++--
 arch/arm64/kvm/ptdump.c | 61 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 6435efd65cb5..17a180ddf6ca 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1283,6 +1283,7 @@ void kvm_nested_s2_flush(struct kvm *kvm)
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
+	struct kvm_s2_mmu *mmus;
 	int i;
 
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
@@ -1291,9 +1292,14 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 		if (!WARN_ON(atomic_read(&mmu->refcnt)))
 			kvm_free_stage2_pgd(mmu);
 	}
-	kvfree(kvm->arch.nested_mmus);
-	kvm->arch.nested_mmus = NULL;
-	kvm->arch.nested_mmus_size = 0;
+
+	scoped_guard(write_lock, &kvm->mmu_lock) {
+		mmus = kvm->arch.nested_mmus;
+		kvm->arch.nested_mmus = NULL;
+		kvm->arch.nested_mmus_size = 0;
+	}
+
+	kvfree(mmus);
 	kvm_uninit_stage2_mmu(kvm);
 }
 
diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 40f93b7c7ad9..1649eaa75798 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -181,6 +181,50 @@ static int kvm_ptdump_guest_canonical_show(struct seq_file *m, void *unused)
 	return 0;
 }
 
+static int kvm_ptdump_guest_nested_show(struct seq_file *m, void *unused)
+{
+	int ret = 0, i;
+	struct kvm_ptdump_guest_state *st = m->private;
+	struct kvm *kvm = st->kvm;
+	struct kvm_pgtable_walker walker = (struct kvm_pgtable_walker) {
+		.cb	= kvm_ptdump_visitor,
+		.arg	= &st->parser_state,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+	};
+
+	guard(write_lock)(&kvm->mmu_lock);
+
+	if (!kvm->arch.nested_mmus)
+		return 0;
+
+	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
+		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+
+		if (!mmu->pgt)
+			continue;
+
+		if (kvm_s2_mmu_valid(mmu)) {
+			memset(st, 0, sizeof(*st));
+			ret = kvm_ptdump_parser_init(st, kvm, mmu->pgt);
+			if (ret)
+				return ret;
+			st->parser_state = (struct ptdump_pg_state) {
+				.marker		= &st->ipa_marker[0],
+				.level		= -1,
+				.pg_level	= &st->level[0],
+				.seq		= m,
+			};
+			seq_printf(m, "nested mmu %d VTCR: 0x%016llx VTTBR: 0x%016llx s2: %s\n",
+				   i, mmu->tlb_vtcr, mmu->tlb_vttbr,
+				   mmu->nested_stage2_enabled ? "enabled" : "disabled");
+			ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
+			if (ret)
+				return ret;
+		}
+	}
+	return ret;
+}
+
 static int kvm_ptdump_guest_open(struct inode *m, struct file *file,
 				 int (*show)(struct seq_file *, void *))
 {
@@ -212,6 +256,11 @@ static int kvm_ptdump_guest_canonical_open(struct inode *m, struct file *file)
 	return kvm_ptdump_guest_open(m, file, kvm_ptdump_guest_canonical_show);
 }
 
+static int kvm_ptdump_guest_nested_open(struct inode *m, struct file *file)
+{
+	return kvm_ptdump_guest_open(m, file, kvm_ptdump_guest_nested_show);
+}
+
 static int kvm_ptdump_guest_close(struct inode *m, struct file *file)
 {
 	struct kvm *kvm = m->i_private;
@@ -230,6 +279,13 @@ static const struct file_operations kvm_ptdump_guest_canonical_fops = {
 	.release	= kvm_ptdump_guest_close,
 };
 
+static const struct file_operations kvm_ptdump_guest_nested_fops = {
+	.open		= kvm_ptdump_guest_nested_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= kvm_ptdump_guest_close,
+};
+
 static int kvm_pgtable_range_show(struct seq_file *m, void *unused)
 {
 	struct kvm *kvm = m->private;
@@ -307,6 +363,9 @@ void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
 			    kvm, &kvm_pgtable_range_fops);
 	debugfs_create_file("stage2_levels", 0400, kvm->debugfs_dentry,
 			    kvm, &kvm_pgtable_levels_fops);
-	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
+	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT)) {
 		kvm->arch.debugfs_nv_dentry = debugfs_create_dir("nested", kvm->debugfs_dentry);
+		debugfs_create_file("shadow_page_tables", 0400, kvm->arch.debugfs_nv_dentry,
+				    kvm, &kvm_ptdump_guest_nested_fops);
+	}
 }
-- 
2.43.0


