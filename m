Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B32FED9F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNUU87v2GXx+7s4Kek1NmXOTPHHpG1QoU7CCMxL3XDU=; b=4fIx1CG/MYJVn9QVvLEpajVb6m
	wCLti1kuLgIwybi7EuGXohEQ9nIl/hxjQUQs5IsrvB32Gbfj666vGDwqPtr8Fpd5hXzDBxowCKZy6
	rKKqaAoydVjcoqBpo7g13c7udCcAWSCLoScnQJWPwSyIM6yIhki1F7KJApj4/nF2F4XqRrQJLF6cs
	m6yoywvg3Y5Hy9/9MdSW1ynzDhtPB3A+QwsWFLnNc2ipzmEemg6NsKtbMcyFxeGPBeFIcpWWqjtOE
	TGsFFhEBJSG965Ncw/e2aHHE59UMc62JoZlpUeuiZPHDcW7WaiOeNpVNk7DIut33tjXrEHKexuPqP
	dCikHcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Z8j-000000073Qn-2XmV;
	Tue, 17 Mar 2026 18:27:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Z8e-000000073Pu-2yDR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:27:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42DEF1477;
	Tue, 17 Mar 2026 11:27:25 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAFD43F7BD;
	Tue, 17 Mar 2026 11:27:29 -0700 (PDT)
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 1/2] KVM: arm64: ptdump: Make KVM ptdump code s2 mmu aware
Date: Tue, 17 Mar 2026 18:26:37 +0000
Message-ID: <20260317182638.1592507-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317182638.1592507-1-weilin.chang@arm.com>
References: <20260317182638.1592507-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_112733_114118_302E50C2 
X-CRM114-Status: GOOD (  13.01  )
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

To reuse the ptdump code for shadow page table dumping later, let's pass
s2 mmu as the private data, so we have the freedom to select which page
table to print.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/ptdump.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 6cbe018fd6fd..98763b291956 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -18,7 +18,7 @@
 #define KVM_PGTABLE_MAX_LEVELS	(KVM_PGTABLE_LAST_LEVEL + 1)
 
 struct kvm_ptdump_guest_state {
-	struct kvm		*kvm;
+	struct kvm_s2_mmu	*mmu;
 	struct ptdump_pg_state	parser_state;
 	struct addr_marker	ipa_marker[MARKERS_LEN];
 	struct ptdump_pg_level	level[KVM_PGTABLE_MAX_LEVELS];
@@ -112,10 +112,9 @@ static int kvm_ptdump_build_levels(struct ptdump_pg_level *level, u32 start_lvl)
 	return 0;
 }
 
-static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm *kvm)
+static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm_s2_mmu *mmu)
 {
 	struct kvm_ptdump_guest_state *st;
-	struct kvm_s2_mmu *mmu = &kvm->arch.mmu;
 	struct kvm_pgtable *pgtable = mmu->pgt;
 	int ret;
 
@@ -133,7 +132,7 @@ static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm *kvm)
 	st->ipa_marker[1].start_address = BIT(pgtable->ia_bits);
 	st->range[0].end		= BIT(pgtable->ia_bits);
 
-	st->kvm				= kvm;
+	st->mmu				= mmu;
 	st->parser_state = (struct ptdump_pg_state) {
 		.marker		= &st->ipa_marker[0],
 		.level		= -1,
@@ -149,8 +148,8 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 {
 	int ret;
 	struct kvm_ptdump_guest_state *st = m->private;
-	struct kvm *kvm = st->kvm;
-	struct kvm_s2_mmu *mmu = &kvm->arch.mmu;
+	struct kvm_s2_mmu *mmu = st->mmu;
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	struct ptdump_pg_state *parser_state = &st->parser_state;
 	struct kvm_pgtable_walker walker = (struct kvm_pgtable_walker) {
 		.cb	= kvm_ptdump_visitor,
@@ -169,14 +168,15 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 
 static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
 {
-	struct kvm *kvm = m->i_private;
+	struct kvm_s2_mmu *mmu = m->i_private;
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	struct kvm_ptdump_guest_state *st;
 	int ret;
 
 	if (!kvm_get_kvm_safe(kvm))
 		return -ENOENT;
 
-	st = kvm_ptdump_parser_create(kvm);
+	st = kvm_ptdump_parser_create(mmu);
 	if (IS_ERR(st)) {
 		ret = PTR_ERR(st);
 		goto err_with_kvm_ref;
@@ -194,7 +194,7 @@ static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
 
 static int kvm_ptdump_guest_close(struct inode *m, struct file *file)
 {
-	struct kvm *kvm = m->i_private;
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(m->i_private);
 	void *st = ((struct seq_file *)file->private_data)->private;
 
 	kfree(st);
@@ -229,14 +229,15 @@ static int kvm_pgtable_levels_show(struct seq_file *m, void *unused)
 static int kvm_pgtable_debugfs_open(struct inode *m, struct file *file,
 				    int (*show)(struct seq_file *, void *))
 {
-	struct kvm *kvm = m->i_private;
+	struct kvm_s2_mmu *mmu = m->i_private;
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	struct kvm_pgtable *pgtable;
 	int ret;
 
 	if (!kvm_get_kvm_safe(kvm))
 		return -ENOENT;
 
-	pgtable = kvm->arch.mmu.pgt;
+	pgtable = mmu->pgt;
 
 	ret = single_open(file, show, pgtable);
 	if (ret < 0)
@@ -256,7 +257,7 @@ static int kvm_pgtable_levels_open(struct inode *m, struct file *file)
 
 static int kvm_pgtable_debugfs_close(struct inode *m, struct file *file)
 {
-	struct kvm *kvm = m->i_private;
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(m->i_private);
 
 	kvm_put_kvm(kvm);
 	return single_release(m, file);
@@ -279,9 +280,9 @@ static const struct file_operations kvm_pgtable_levels_fops = {
 void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
 {
 	debugfs_create_file("stage2_page_tables", 0400, kvm->debugfs_dentry,
-			    kvm, &kvm_ptdump_guest_fops);
-	debugfs_create_file("ipa_range", 0400, kvm->debugfs_dentry, kvm,
-			    &kvm_pgtable_range_fops);
+			    &kvm->arch.mmu, &kvm_ptdump_guest_fops);
+	debugfs_create_file("ipa_range", 0400, kvm->debugfs_dentry,
+			    &kvm->arch.mmu, &kvm_pgtable_range_fops);
 	debugfs_create_file("stage2_levels", 0400, kvm->debugfs_dentry,
-			    kvm, &kvm_pgtable_levels_fops);
+			    &kvm->arch.mmu, &kvm_pgtable_levels_fops);
 }
-- 
2.43.0


