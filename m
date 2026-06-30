Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E10BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y36XPCPo+zpqqeR/SYDY1illOUAAFDVm95tBxdG8xas=; b=2AkHcyUv6RNvlCQ2y82tO+QeHQ
	sFtPKhzVRxltDuj3ropRUqBTlj2RoivEJbBsdX1W90VpUaNJX199Fo084zy+YJ3PPGHzZVSSlCVwT
	/3zG72s1cR2RdkicFdCd1DtJHff43c0BnkYMQnQ0vLKOdLMz0RSZ/5TuYBz4zdX22nDSuQM+kxqYR
	mywHc3rzo2MxFyN+3dav+tgffHL6lU/tNnqiaAOT/uykkGB9iX6vlyKRPAEyAJy9sKrj2i5L5hja6
	80gmVz115G0+NE+5Q8RqZu/RKCQvdzcsLQdC1PsAujcNip2gEwlVSMu1rO3cHor1KjFSY553fWa+o
	O5pWB8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJS-0000000GwMA-1y36;
	Tue, 30 Jun 2026 12:11:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJL-0000000GwIL-22mu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:11:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF52D2EC6;
	Tue, 30 Jun 2026 05:11:25 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20C283F905;
	Tue, 30 Jun 2026 05:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782821490; bh=NFYyIM4U72kh8EqXRkl12e6lCN6ujyMn5MgKdWQpl2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u5pdm3AWHxAcZvSv5sN89bkMA+i92fEVKDzsmCqshT4lBClmIQn9MCjaiR9C42HhQ
	 fBVWWPKEHv3Qa5J9JAprmUXjbyOEw0k0W4W2pusGaJ+/5S6pYk72Fmplml/CKttV7R
	 lU4/Ly13nBBvtrm5p81Sqq4UyBdQu4mSIYn/bxIs=
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
Subject: [PATCH v2 3/6] KVM: arm64: ptdump: Fix UAF when mmu->pgt is freed
Date: Tue, 30 Jun 2026 13:10:02 +0100
Message-ID: <20260630121005.1130996-4-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630121005.1130996-1-weilin.chang@arm.com>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051131_605812_E426F544 
X-CRM114-Status: GOOD (  14.75  )
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

ptdump files can still be read after the pgt of the canonical mmu is
freed, if they are opened before the VM debugfs directory is removed.
This triggers UAF in places where we cache the pgt pointer or access it
without checking its validity.

Check the pgt is still alive under the mmu_lock before accessing the
pgt.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260623142443.648972-1-weilin.chang@arm.com?part=1
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/ptdump.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index d5aa9eff08d1..752d8e0cd25c 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -115,13 +115,21 @@ static int kvm_ptdump_build_levels(struct ptdump_pg_level *level, u32 start_lvl)
 static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm *kvm)
 {
 	struct kvm_ptdump_guest_state *st;
-	struct kvm_pgtable *pgtable = kvm->arch.mmu.pgt;
+	struct kvm_pgtable *pgtable;
 	int ret;
 
 	st = kzalloc_obj(struct kvm_ptdump_guest_state, GFP_KERNEL_ACCOUNT);
 	if (!st)
 		return ERR_PTR(-ENOMEM);
 
+	guard(write_lock)(&kvm->mmu_lock);
+	if (!kvm->arch.mmu.pgt) {
+		kfree(st);
+		return ERR_PTR(-ENXIO);
+	}
+
+	pgtable = kvm->arch.mmu.pgt;
+
 	ret = kvm_ptdump_build_levels(&st->level[0], pgtable->start_level);
 	if (ret) {
 		kfree(st);
@@ -137,7 +145,6 @@ static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm *kvm)
 
 static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 {
-	int ret;
 	struct kvm_ptdump_guest_state *st = m->private;
 	struct kvm *kvm = st->kvm;
 	struct kvm_s2_mmu *mmu = &kvm->arch.mmu;
@@ -154,11 +161,11 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 		.seq		= m,
 	};
 
-	write_lock(&kvm->mmu_lock);
-	ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
-	write_unlock(&kvm->mmu_lock);
+	guard(write_lock)(&kvm->mmu_lock);
+	if (mmu->pgt)
+		return kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
 
-	return ret;
+	return 0;
 }
 
 static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
@@ -206,17 +213,23 @@ static const struct file_operations kvm_ptdump_guest_fops = {
 
 static int kvm_pgtable_range_show(struct seq_file *m, void *unused)
 {
-	struct kvm_pgtable *pgtable = m->private;
+	struct kvm *kvm = m->private;
+
+	guard(write_lock)(&kvm->mmu_lock);
+	if (kvm->arch.mmu.pgt)
+		seq_printf(m, "%2u\n", kvm->arch.mmu.pgt->ia_bits);
 
-	seq_printf(m, "%2u\n", pgtable->ia_bits);
 	return 0;
 }
 
 static int kvm_pgtable_levels_show(struct seq_file *m, void *unused)
 {
-	struct kvm_pgtable *pgtable = m->private;
+	struct kvm *kvm = m->private;
+
+	guard(write_lock)(&kvm->mmu_lock);
+	if (kvm->arch.mmu.pgt)
+		seq_printf(m, "%1d\n", KVM_PGTABLE_MAX_LEVELS - kvm->arch.mmu.pgt->start_level);
 
-	seq_printf(m, "%1d\n", KVM_PGTABLE_MAX_LEVELS - pgtable->start_level);
 	return 0;
 }
 
@@ -224,15 +237,12 @@ static int kvm_pgtable_debugfs_open(struct inode *m, struct file *file,
 				    int (*show)(struct seq_file *, void *))
 {
 	struct kvm *kvm = m->i_private;
-	struct kvm_pgtable *pgtable;
 	int ret;
 
 	if (!kvm_get_kvm_safe(kvm))
 		return -ENOENT;
 
-	pgtable = kvm->arch.mmu.pgt;
-
-	ret = single_open(file, show, pgtable);
+	ret = single_open(file, show, kvm);
 	if (ret < 0)
 		kvm_put_kvm(kvm);
 	return ret;
-- 
2.43.0


