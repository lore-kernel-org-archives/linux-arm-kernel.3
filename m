Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B14AF53D83
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxRn3wVpnx+ZoGO/Dvvf/smHaTJ/FoUA7V2QYbx/mVk=; b=B4mlLrFxUXiD/85EhuIXt4eS2e
	olSdHT0IHNmImzkJj+ZvxlkmsfvfE58n98kM+yf7G0K9pvIsSfeQvt/467R7mn6dJfgHmwBIvXmEw
	GFF6GWrsnzlk2j3yUzBJnLigz/KiPl+L06JsLqhCnUTPxoJznsYMQve2YYULq5IuFrmdchvWwvBWf
	nywjUJa8P/efAQC+cJNsPx1YlHY012zy+XtQsmX3OlrGFF2trAnC6njnOASNcRE+ekQh26s+dgCVu
	xmRMAuc735l4uS9AoYK9kuLxrdlIFM7PcboYDzQnxFfPwBpg0pOfwBecMOa313OcW+bIYPcy1sPpg
	4j1QPqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9n-00000004cqx-3JrL;
	Mon, 16 Mar 2026 17:55:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9h-00000004clC-1HBZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF16C44572;
	Mon, 16 Mar 2026 17:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867AAC19421;
	Mon, 16 Mar 2026 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683703;
	bh=S9BG/7xPpOu8U0aAfaIVPmi8MtVwmOxDoQeqtQS+iaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HBr8Aaoz6+AqRiwPED51/+M9L1DbPyG3AnjZyAltrJnflYWzluLmYHQqMg9UtNgRO
	 WY7G5xF4rGiPwoqxCggNGQ9/DQXhHMUUtqfKQZ4YUVjIfaSAXOeWFA0EHW//JRzSaR
	 VICPrE3Ogb/6EegNXfDG91RIHe/nm4rHDp1NT8cRzFOMiGucaQU0HqkFivNWAicfYo
	 IfM1aPV7NwaYA8uGbAoIL7cXYFv+AmFPSYdVg+Pg7zH3an7l8FpdQ4Zu1GLyP7Gyae
	 TT8+wVRgIHZVmNAZ3xeeQfhL/K1Y8stkOkpwhHLegHXmtMwszxSc8UTl5sSISSOWSm
	 j6r4MAn51C8Ww==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9d-00000002XDx-2PAC;
	Mon, 16 Mar 2026 17:55:01 +0000
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
Subject: [PATCH 10/17] KVM: arm64: Kill logging_active from kvm_s2_fault
Date: Mon, 16 Mar 2026 17:54:43 +0000
Message-ID: <20260316175451.1866175-11-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260316_105505_389127_205DEE74 
X-CRM114-Status: GOOD (  15.52  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a5b0dd41560f6..caa5bedc79e19 100644
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
@@ -1985,11 +1984,9 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
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
 	void *memcache;
@@ -2001,7 +1998,8 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
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


