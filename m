Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2738FF53D82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ApLPZUKgRLJqtUUdsHYciVC8BT+fVWbNpEDOVv9StY=; b=wxtXwTGUgXs/jrsZ++Ia3f60WD
	vgAnGYzeU7EM4s5IDV34SaQft8eK7i5ZTD3YwTXK4ckzxDK/9tFz0yEgzeZr92AlAo6eEujyJjhKd
	bV6OJJSNB9zYdbShPw5MievSMyRgyZvX3TEVdwUjRr90gSoj/ET0e4wn7EKBqk1SZEAFUSGHmsG2q
	PGt1fsBp/M/uRQBIRqQMj4F3wc6Z5kKW9vz5oUGKiiskpFmCBdmhVzr2OKngFSJ9YVh4awag4onG+
	6PxreNQgM3HI/hq7Z3CQL2wkgwU7OFFyRqrdoV/bSh9MCCMAoF05dp3ia+Qru+7H7ULhk8fIvrEkm
	SscANNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CAE-00000004dIA-0J2j;
	Mon, 16 Mar 2026 17:55:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9m-00000004coa-1c5P
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2ApLPZUKgRLJqtUUdsHYciVC8BT+fVWbNpEDOVv9StY=; b=LNtonsyeeRaKy8iERU9iTaXaW8
	F1bCDh0C+UOuuM6MDVADVZN3OBv1aAN0N8VgEsPBj2c5Hn/lPp9IIeImY4CuDhrIbOBpZpUNNhp9n
	D+kKQUQjMo92f9JwqRqEMMNLFSP3IUOytOuPRCqZyhLQXsjZrxTV/a/0t0tU71rmVvH7nUCT3Fvir
	SuGtATaF8bPPgY/wRqw+g218aSSKJOHlOwFifGf9/1i9PDeNYz0L/9clTO568KvURIl9ZywA0zKpb
	cRJvZy3C7TH+qzPcP/tW8qUipBwhOZ+d3V/Gmw6tPU3gZWgKT4o73NuIOmbGF+eSqRNwsss1nbWVr
	AHLVKN1A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9h-00000007OU3-2L40
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 566AB43CDA;
	Mon, 16 Mar 2026 17:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363F5C2BCB0;
	Mon, 16 Mar 2026 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683702;
	bh=yN0Izyr1+3kVClshnIB+MMJVxrA5vG03ZI8xqRa29pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NfPjRJl2ryGV/twk4yGl2phGLElTDQE69MOCRHAX55FEDrRw9phU/ZQuvxvj9B9Ey
	 Pb7HF2m4NAHJJVab3Cu2hNnRWvnk4DcjVaGpHYdT0cfA5mVwgzF4M661M7u0A8sVN4
	 329y7X6c5LMK34LMSk4dT7T2FpZD+umWA0nmtDwoICDNWWVIY/5ddt4KyqU8M1BtTt
	 FLc6sfL4erRtSSeqsGEi6hr+pOJ6Mv+2OsYIcVJgS8GwmtiyP9m5jf7WpyjQ4FtO42
	 CdpYhRWW/qciQnP6VfvnuGT/rFSIupSzuxF/gc2mwgdldJoCp6kgzvst53VopsDgVZ
	 6JmYMTYjujDdw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9b-00000002XDx-49tc;
	Mon, 16 Mar 2026 17:55:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 04/17] KVM: arm64: Replace fault_is_perm with a helper
Date: Mon, 16 Mar 2026 17:54:37 +0000
Message-ID: <20260316175451.1866175-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316175451.1866175-1-maz@kernel.org>
References: <20260316175451.1866175-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_175505_964280_BBAACD22 
X-CRM114-Status: GOOD (  15.46  )
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

Carrying a boolean to indicate that a given fault is slightly odd,
as this is a property of the fault itself, and we'd better avoid
duplicating state.

For this purpose, introduce a kvm_s2_fault_is_perm() predicate that
can take a fault descriptor as a parameter. fault_is_perm is therefore
dropped from kvm_s2_fault.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2a7128b8dd14f..1b32f2e6c3e61 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1711,8 +1711,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 }
 
 struct kvm_s2_fault {
-	bool fault_is_perm;
-
 	bool write_fault;
 	bool exec_fault;
 	bool writable;
@@ -1732,6 +1730,11 @@ struct kvm_s2_fault {
 	vm_flags_t vm_flags;
 };
 
+static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
+{
+	return kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
+}
+
 static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
 				     struct kvm_s2_fault *fault)
 {
@@ -1888,7 +1891,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	if (s2fd->nested)
 		adjust_nested_exec_perms(kvm, s2fd->nested, &fault->prot);
 
-	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
+	if (!kvm_s2_fault_is_perm(s2fd) && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
 		if (!fault->mte_allowed)
 			return -EFAULT;
@@ -1905,6 +1908,7 @@ static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
 static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 			    struct kvm_s2_fault *fault, void *memcache)
 {
+	bool fault_is_perm = kvm_s2_fault_is_perm(s2fd);
 	struct kvm *kvm = s2fd->vcpu->kvm;
 	struct kvm_pgtable *pgt;
 	int ret;
@@ -1922,7 +1926,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	 */
 	if (fault->vma_pagesize == PAGE_SIZE &&
 	    !(fault->force_pte || fault->s2_force_noncacheable)) {
-		if (fault->fault_is_perm && fault->fault_granule > PAGE_SIZE) {
+		if (fault_is_perm && fault->fault_granule > PAGE_SIZE) {
 			fault->vma_pagesize = fault->fault_granule;
 		} else {
 			fault->vma_pagesize = transparent_hugepage_adjust(kvm, s2fd->memslot,
@@ -1936,7 +1940,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		}
 	}
 
-	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
+	if (!fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
 		sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
 
 	/*
@@ -1944,7 +1948,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	 * permissions only if fault->vma_pagesize equals fault->fault_granule. Otherwise,
 	 * kvm_pgtable_stage2_map() should be called to change block size.
 	 */
-	if (fault->fault_is_perm && fault->vma_pagesize == fault->fault_granule) {
+	if (fault_is_perm && fault->vma_pagesize == fault->fault_granule) {
 		/*
 		 * Drop the SW bits in favour of those stored in the
 		 * PTE, which will be preserved.
@@ -1977,7 +1981,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	bool write_fault = kvm_is_write_fault(s2fd->vcpu);
 	bool logging_active = memslot_is_logging(s2fd->memslot);
 	struct kvm_s2_fault fault = {
-		.fault_is_perm = perm_fault,
 		.logging_active = logging_active,
 		.force_pte = logging_active,
 		.prot = KVM_PGTABLE_PROT_R,
-- 
2.47.3


