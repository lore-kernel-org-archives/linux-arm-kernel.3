Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A93810ED65E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wKgwqngC+n9nTuZBsGoS7OcI+nS542czdO9Kgsigec=; b=ZjIsEvWhHMFxVWVsBa2LSzipf7
	TNFbeOeROAL/jCKni8kh4x5+HU2JJJS8yYBkCvaPq+yq6L8FJzKwMaJMFaWwBkMk8e5tyMwfK8bq/
	+EGkv5IV/D/lbj0paK+ZrNPck4Z2va7ahtp+wEUBD/5hw2RR93Vs1rseoXQBg5K5abDIXo/IrqpZU
	p8epNedXbRnkFGGfNcVIvHn9gvjQd4SPn2o3VPB5kc9PqMSTCL8zC+NcO6k8SNwEFby2GWSMCMSKy
	FiNQw0H0xR4nHEmVhc1PPywJJtpTZVV+ZW8C0+9f5rCjAMEE8ZeNNS+sZ7lrqNKikkJgGOzrQ0EIV
	ZgZv/e7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Uf-00000007FLv-3GaN;
	Fri, 27 Mar 2026 11:36:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UJ-00000007F24-0nGC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF36A4475A;
	Fri, 27 Mar 2026 11:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FC8C2BC87;
	Fri, 27 Mar 2026 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611386;
	bh=JLaNnn4Z96cQuZ+mgviskKs9pjvRxJpA5npZ1PilnT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h1DulSSbA+vnqnf2XVW7GeXoX4/gyIFkgDhEML58oAQyyhzHasIp1fVFju9X6MrzQ
	 XMwhhvn0DACeb9gWhsKO/MXry46J+9g1B1j0JvTQphRcvHFkPJa6nV/bhhCbN4c0BT
	 CZUjZxopHS9NxCbl/dfcqmIzepUgC6j8Jn+ieD+DzkeOK/9ODcnRCrTxTrk9x4rV5l
	 IFTLbMAIHgM165kWsOCpBYDPu1r98trEfeZgFqQkwaL1MioPYaRCXJpjsRVq5d4gkJ
	 sfSstYq4eaRa9fbx8aFFs2iHO3uOuAm/TEWCMyavDSU3fYU6VQsjODeuJu8ZEg7Pe8
	 6+uTzJLPDDxQg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UG-00000006K4a-37HP;
	Fri, 27 Mar 2026 11:36:24 +0000
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
Subject: [PATCH v2 11/30] KVM: arm64: Optimize early exit checks in kvm_s2_fault_pin_pfn()
Date: Fri, 27 Mar 2026 11:35:59 +0000
Message-ID: <20260327113618.4051534-12-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260327_043627_259310_8EC407AA 
X-CRM114-Status: GOOD (  12.00  )
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

From: Fuad Tabba <tabba@google.com>

Optimize the early exit checks in kvm_s2_fault_pin_pfn by grouping all
error responses under the generic is_error_noslot_pfn check first,
avoiding unnecessary branches in the hot path.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2b85daaa4426b..0c71e3a9af8b0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1791,12 +1791,13 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 	fault->pfn = __kvm_faultin_pfn(fault->memslot, fault->gfn,
 				       fault->write_fault ? FOLL_WRITE : 0,
 				       &fault->writable, &fault->page);
-	if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
-		kvm_send_hwpoison_signal(fault->hva, __ffs(fault->vma_pagesize));
-		return 0;
-	}
-	if (is_error_noslot_pfn(fault->pfn))
+	if (unlikely(is_error_noslot_pfn(fault->pfn))) {
+		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
+			kvm_send_hwpoison_signal(fault->hva, __ffs(fault->vma_pagesize));
+			return 0;
+		}
 		return -EFAULT;
+	}
 
 	return 1;
 }
-- 
2.47.3


