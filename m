Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AFAC98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nikJNuqjhKo6/wA/fv+EpIxnYvDFHZCiETpG+5rraU=; b=IlzzfWmXM56nVvSS60s2J5Y8op
	XtXkijNzz47s5j8h74UkOhD5UVlz+Em4i7NwiDhsbayBZwo+QMzKaDvjOS6phxezIAl6KNrkfWq+K
	B/7nQajD16Iiz9fe+xwoAfb4l4e2ofiTv8bBWJ2tpoumxgvN7LG4glLBcB0014avp2QN52dKkYFXH
	Sq52S66P9GJqhBykOiSEmkk4mE9tgW51CzRFfwKjx9BAdLdI7zHIu2jWYsyyE17qJzxAT/JDpFQPh
	ghgCIOi140dn+i63wQqYGulRPfdKbMPbUXosz+DoYLPVMXsXYA+TZDKmxiFlqcvL6P2nnZ63nPTfE
	RxaBnkhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g6F-0000000AdMg-0F7a;
	Thu, 24 Sep 2026 09:50:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g66-0000000AdJN-0MY8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 09:50:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97B80152B;
	Thu, 24 Sep 2026 02:50:29 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FEA13F86F;
	Thu, 24 Sep 2026 02:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790243433; bh=8EeDJUKWzmbKZHvSf5EzOlL7Hm/HRnxcUKk/qxOp0jQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qfWYrEUB5j3U+8mgY0E3CjMBvSOqzbpp456E3vbet8uflDlSnbRssfEFdaOBqUsLN
	 NuyhALNLlfoYjc1CRYHyltNa52hifvRoDEucaedFOBaGznMxbD5JoEDvQZVvbOpFv1
	 txrpvLYdBl2qL2VEEhGWnLaqbkkOXlX9/VbRJWaI=
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
	Sebastian Ene <sebastianene@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Sashiko AI <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] KVM: arm64: ptdump: Check the page tables aren't freed when accessing
Date: Thu, 24 Sep 2026 10:49:50 +0100
Message-ID: <20260924094951.727352-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924094951.727352-1-weilin.chang@arm.com>
References: <20260924094951.727352-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_025034_209322_7EE92BD6 
X-CRM114-Status: GOOD (  19.01  )
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

An open debugfs file keeps the KVM structure alive, but does not prevent
mmu notifier release from freeing the stage-2 page tables when the VMM’s
address space is torn down. Therefore page tables belonging to the mmus
could have been freed when a thread opens or reads the ptdump files.
Take the mmu_lock and check mmu->pgt is still alive before accessing the
page tables.

Also for the ipa_range file and stage2_levels file, switch from keeping
the pointer to the page tables to keeping the pointer to the mmu.

Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/kvmarm/20260623144054.B91D21F000E9@smtp.kernel.org/
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/ptdump.c | 43 +++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 69899797dbad..b5a0584260e8 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -115,15 +115,28 @@ static int kvm_ptdump_build_levels(struct ptdump_pg_level *level, u32 start_lvl)
 
 static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm_s2_mmu *mmu)
 {
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	struct kvm_ptdump_guest_state *st;
-	struct kvm_pgtable *pgtable = mmu->pgt;
+	s8 start_level;
 	int ret;
 
+	/*
+	 * We only need the pgt start level to initialize the ptdump, get it
+	 * while holding the mmu_lock. It's fine if the pgt gets freed
+	 * afterwards, we'll check again when doing the actual dump.
+	 */
+	scoped_guard(read_lock, &kvm->mmu_lock) {
+		if (mmu->pgt)
+			start_level = mmu->pgt->start_level;
+		else
+			return ERR_PTR(-ENOENT);
+	}
+
 	st = kzalloc_obj(struct kvm_ptdump_guest_state, GFP_KERNEL_ACCOUNT);
 	if (!st)
 		return ERR_PTR(-ENOMEM);
 
-	ret = kvm_ptdump_build_levels(&st->level[0], pgtable->start_level);
+	ret = kvm_ptdump_build_levels(&st->level[0], start_level);
 	if (ret) {
 		kfree(st);
 		return ERR_PTR(ret);
@@ -149,6 +162,9 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 	};
 
 	guard(write_lock)(&kvm->mmu_lock);
+	if (!mmu->pgt)
+		return 0;
+
 	st->parser_state = (struct ptdump_pg_state) {
 		.marker		= &st->ipa_marker[0],
 		.end_address	= BIT(mmu->pgt->ia_bits),
@@ -211,17 +227,27 @@ static const struct file_operations kvm_ptdump_guest_fops = {
 
 static int kvm_pgtable_range_show(struct seq_file *m, void *unused)
 {
-	struct kvm_pgtable *pgtable = m->private;
+	struct kvm_s2_mmu *mmu = m->private;
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+
+	guard(read_lock)(&kvm->mmu_lock);
+
+	if (mmu->pgt)
+		seq_printf(m, "%2u\n", mmu->pgt->ia_bits);
 
-	seq_printf(m, "%2u\n", pgtable->ia_bits);
 	return 0;
 }
 
 static int kvm_pgtable_levels_show(struct seq_file *m, void *unused)
 {
-	struct kvm_pgtable *pgtable = m->private;
+	struct kvm_s2_mmu *mmu = m->private;
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+
+	guard(read_lock)(&kvm->mmu_lock);
+
+	if (mmu->pgt)
+		seq_printf(m, "%1d\n", KVM_PGTABLE_MAX_LEVELS - mmu->pgt->start_level);
 
-	seq_printf(m, "%1d\n", KVM_PGTABLE_MAX_LEVELS - pgtable->start_level);
 	return 0;
 }
 
@@ -230,15 +256,12 @@ static int kvm_pgtable_debugfs_open(struct inode *m, struct file *file,
 {
 	struct kvm_s2_mmu *mmu = m->i_private;
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
-	struct kvm_pgtable *pgtable;
 	int ret;
 
 	if (!kvm_get_kvm_safe(kvm))
 		return -ENOENT;
 
-	pgtable = mmu->pgt;
-
-	ret = single_open(file, show, pgtable);
+	ret = single_open(file, show, mmu);
 	if (ret < 0)
 		kvm_put_kvm(kvm);
 	return ret;
-- 
2.43.0


