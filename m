Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AB010ED64A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oVsep+OnNn7JjfRNfhed+Wy/93jjXXVgXXIbtJAxUA=; b=QCFqOwfy73WshBlUevO6Zlsip/
	PALT4aYxkupw6o6pP823tu9ufhO6gRVa7C4iDXB4TpnlqJTdW49IxjiiDMOyCLR0LG2O3aa2eJ7zy
	UfYV9yrScFP/tPG9R8DErqw1Rhd67o+ZIdlOuMRIOFR+F5tlJ3nvuit20Q5H6WSIvPb+U72492f18
	B4+EOmjk6TQIiwv5iqUQEHhk/4rdX6FiCZih2X2+3sVBIsP+I3N/dh2ku/N5NwJ5Sn/ilvhKELgMU
	mOUS7vqQbxcAFwy++EFSDPeTuoFwCEiABC0KvmyyI8qA8h0D1+fIpndyzZIkNbl3GTy9wXjJKAgB1
	f7aSllBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ul-00000007FXD-1C3w;
	Fri, 27 Mar 2026 11:36:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UL-00000007F24-3x0v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4E3740AF5;
	Fri, 27 Mar 2026 11:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8415AC2BCB4;
	Fri, 27 Mar 2026 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611389;
	bh=PstDFGkZeF8dkGmxvk4oRyMbmEixCqCmAuiHv71POEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nz8gvLHJjkcN8sZMYYNLfzvJ3Dh0Q0FlIdtGE4FiVIgV+AXY60drNJ7+WmQXGz41o
	 PRE0G27HZX75sYQ1/QhqBrVXipwLnX6fe7vuVUSOIr4An7IJgsqwwGUA8VrJR4ZG8G
	 jN+iIPAsPAfV7FSs502YaixMdhKYE63t38ytQf58TjJx1HnoPvlDtnJjCdlfjUw6gn
	 bQd8z6U8YV3kwXLH0GciOmIzIsTlnOkk2ECZx1KgXE5z5qV1TH7N6SaYw7BUK1HSaJ
	 rwA2znbcrS52PnkFknPxQNlrwIuwrYRJ7NlI4+3hz5Bk1omiMpSTo89+z5g6Uy0FLL
	 ttmxHdFcv6Lxg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UJ-00000006K4a-2vb9;
	Fri, 27 Mar 2026 11:36:27 +0000
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
Subject: [PATCH v2 23/30] KVM: arm64: Kill logging_active from kvm_s2_fault
Date: Fri, 27 Mar 2026 11:36:11 +0000
Message-ID: <20260327113618.4051534-24-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260327_043630_089222_5C0779EA 
X-CRM114-Status: GOOD (  16.00  )
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

There are only two spots where we evaluate whether logging is
active. Replace the boolean with calls to the relevant helper.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 5b2862e2bfcf3..26313e0b40c25 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1723,7 +1723,6 @@ struct kvm_s2_fault {
 	bool writable;
 	bool s2_force_noncacheable;
 	kvm_pfn_t pfn;
-	bool logging_active;
 	bool force_pte;
 	enum kvm_pgtable_prot prot;
 	struct page *page;
@@ -1853,7 +1852,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 			 */
 			fault->s2_force_noncacheable = true;
 		}
-	} else if (fault->logging_active && !kvm_is_write_fault(s2fd->vcpu)) {
+	} else if (memslot_is_logging(s2fd->memslot) && !kvm_is_write_fault(s2fd->vcpu)) {
 		/*
 		 * Only actually map the page as writable if this was a write
 		 * fault.
@@ -1989,11 +1988,9 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
-	bool logging_active = memslot_is_logging(s2fd->memslot);
 	struct kvm_s2_fault_vma_info s2vi = {};
 	struct kvm_s2_fault fault = {
-		.logging_active = logging_active,
-		.force_pte = logging_active,
+		.force_pte = memslot_is_logging(s2fd->memslot),
 		.prot = KVM_PGTABLE_PROT_R,
 	};
 	void *memcache = NULL;
@@ -2005,7 +2002,8 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	 * only exception to this is when dirty logging is enabled at runtime
 	 * and a write fault needs to collapse a block entry into a table.
 	 */
-	if (!perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu))) {
+	if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
+			    kvm_is_write_fault(s2fd->vcpu))) {
 		ret = prepare_mmu_memcache(s2fd->vcpu, true, &memcache);
 		if (ret)
 			return ret;
-- 
2.47.3


