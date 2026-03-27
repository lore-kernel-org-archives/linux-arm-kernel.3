Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F28A10ED660
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StpBh0mM5CqqZ/JHHAthYScW7dsevwMbPKiUShgi7p4=; b=z+t/M9NuBp70aKTJ77CgofC2eo
	1u2NpIWeA8L9hngesOlN00vSkFs26sSv/x3yjZM8dqOUyBtjfsa+O7cqnX3oTJmR3g8ue2VfDHu3O
	azfcZWUutM8h3SIp//GwX/Y0TplRJoPv72c+5CZOKFFSlGoyXKWi8KgdUH1u0KGxyFTn/21/A9fRP
	QK7JhC0IlhtHPQikuAcv2KnMrMc9KYvFouINFJGL1+tDLmTT1XAwvW5Ovxmqfav2fTOGqDLdhIZsv
	USml0jamgmyUkdzdzl+yyucWq9CfwOc9ZibwWzBu3K50bWGGPCGfZqUNNdNrqYMUytwxiji/SOTiK
	5xo0xEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Up-00000007Fg5-29JW;
	Fri, 27 Mar 2026 11:36:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UM-00000007F4Q-3eFW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5CAC44759;
	Fri, 27 Mar 2026 11:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD27C2BCB9;
	Fri, 27 Mar 2026 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611390;
	bh=JBNTJRSvjklGeXjz74YMlXlOnAfmQRC0oOqP8vM31FY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yk5JO1Rda0QGnBFyP9+ez0TpEM35b3LzMgfaDHMDZaTwyF00N977lhkYALEgGNb4M
	 O9fQRDGSjRTXdO6Jy99ctARChBLUu6k0/HtIdTtbYTdgvJUPvDePZwDlETH6Zjhorj
	 e7H1HKTu+uBIjrqwm/ZXsVsghlrUtfi6pW0MPqwM0RipaLuHJoL1x+xqC1cjmiDZwx
	 sknz+ZtpS9MALJBi+i1nIl1bhkI0rCy2UoltZQogmQxMJkvY821yj4fWdqFzprIhsY
	 aAhstvXAGERhB+w+hkakCRJ4X4Nbfis1OFpSQk6C6qf771rPUSdgXwUIF+yKdg3e9U
	 FPFv5WrGVq/ng==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UK-00000006K4a-1n6y;
	Fri, 27 Mar 2026 11:36:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH v2 26/30] KVM: arm64: Replace force_pte with a max_map_size attribute
Date: Fri, 27 Mar 2026 11:36:14 +0000
Message-ID: <20260327113618.4051534-27-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043630_976348_E1BA18B4 
X-CRM114-Status: GOOD (  16.28  )
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

force_pte is annoyingly limited in what it expresses, and we'd
be better off with a more generic primitive. Introduce max_map_size
instead, which does the trick and can be moved into the vma_info
structure. This firther allows it to reduce the scopes in which
it is mutable.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 39f01dd59259c..61b979365c6ee 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1652,6 +1652,7 @@ struct kvm_s2_fault_vma_info {
 	unsigned long	mmu_seq;
 	long		vma_pagesize;
 	vm_flags_t	vm_flags;
+	unsigned long	max_map_size;
 	struct page	*page;
 	kvm_pfn_t	pfn;
 	gfn_t		gfn;
@@ -1661,14 +1662,18 @@ struct kvm_s2_fault_vma_info {
 };
 
 static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
-				     struct vm_area_struct *vma, bool *force_pte)
+				     struct kvm_s2_fault_vma_info *s2vi,
+				     struct vm_area_struct *vma)
 {
 	short vma_shift;
 
-	if (*force_pte)
+	if (memslot_is_logging(s2fd->memslot)) {
+		s2vi->max_map_size = PAGE_SIZE;
 		vma_shift = PAGE_SHIFT;
-	else
+	} else {
+		s2vi->max_map_size = PUD_SIZE;
 		vma_shift = get_vma_page_shift(vma, s2fd->hva);
+	}
 
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -1686,7 +1691,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 		fallthrough;
 	case CONT_PTE_SHIFT:
 		vma_shift = PAGE_SHIFT;
-		*force_pte = true;
+		s2vi->max_map_size = PAGE_SIZE;
 		fallthrough;
 	case PAGE_SHIFT:
 		break;
@@ -1697,7 +1702,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 	if (s2fd->nested) {
 		unsigned long max_map_size;
 
-		max_map_size = *force_pte ? PAGE_SIZE : PUD_SIZE;
+		max_map_size = min(s2vi->max_map_size, PUD_SIZE);
 
 		/*
 		 * If we're about to create a shadow stage 2 entry, then we
@@ -1715,7 +1720,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 		else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
 			max_map_size = PAGE_SIZE;
 
-		*force_pte = (max_map_size == PAGE_SIZE);
+		s2vi->max_map_size = max_map_size;
 		vma_shift = min_t(short, vma_shift, __ffs(max_map_size));
 	}
 
@@ -1724,7 +1729,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 
 struct kvm_s2_fault {
 	bool s2_force_noncacheable;
-	bool force_pte;
 	enum kvm_pgtable_prot prot;
 };
 
@@ -1748,7 +1752,7 @@ static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
 		return -EFAULT;
 	}
 
-	s2vi->vma_pagesize = BIT(kvm_s2_resolve_vma_size(s2fd, vma, &fault->force_pte));
+	s2vi->vma_pagesize = BIT(kvm_s2_resolve_vma_size(s2fd, s2vi, vma));
 
 	/*
 	 * Both the canonical IPA and fault IPA must be aligned to the
@@ -1933,7 +1937,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	 * backed by a THP and thus use block mapping if possible.
 	 */
 	if (mapping_size == PAGE_SIZE &&
-	    !(fault->force_pte || fault->s2_force_noncacheable)) {
+	    !(s2vi->max_map_size == PAGE_SIZE || fault->s2_force_noncacheable)) {
 		if (perm_fault_granule > PAGE_SIZE) {
 			mapping_size = perm_fault_granule;
 		} else {
@@ -1994,7 +1998,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
 	struct kvm_s2_fault_vma_info s2vi = {};
 	struct kvm_s2_fault fault = {
-		.force_pte = memslot_is_logging(s2fd->memslot),
 		.prot = KVM_PGTABLE_PROT_R,
 	};
 	void *memcache = NULL;
-- 
2.47.3


