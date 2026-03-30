Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E351061B06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5fcfTP991lgjzl2mPxsyTDxXG5FM5ONdYN/Q1hcVho=; b=ijYeTwJueCH/bfrMmqRNEwiGvk
	xcpU6+RZP0C65Rl3HW04XH+WZ/6vHRF/XrbO4MG8XQq/gxMu25QTYbvHZmCuL1CIl+JpLYhK94uZc
	XwMYzgCskDDM2edsv78CVAPKhRwKtRwHzXgu2SbJ9E2U1Or1NXMEil8VnmDz2mbSgiJ3Mi3QZ0nfu
	iRygo0RqSWi5irb5bFZA3YGXRztXUsY+hToIJqx0C61FRvJ3eXynNy05BoXgBo4SJANzO3S5SUhXY
	2Eufx78u2nMbBbNnG4sShk0wnhxkhtGYK4ksvHU8WvsPlEeEtjKoFWXung9RJlCHpWZeVvv8U0P1s
	7lAawyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DwQ-0000000BThu-2DVo;
	Mon, 30 Mar 2026 14:50:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dw1-0000000BTLx-0Qoy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76A9760127;
	Mon, 30 Mar 2026 14:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70320C2BCB1;
	Mon, 30 Mar 2026 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882184;
	bh=6nkcrkCRHUqqlyZysnmg8tV49OWHt4pl882aBUvDfo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0EAgj4E/0a0Ogua6aDe6AVN5nEabWoT35fQuFc5Z1qEmOjLNKpJRLWeOgFxf+r0r
	 qDQBWsSefe1cccRElJTqYqpAFyLZaHP5jMixtGljyO4YDp10By69rVaVmQVI0NWbEe
	 sIUzoY3aa7va/0epgq0tyed0jh8XBOitTJkAlM6JyyHyDVIh9OzsAOcNoLD8bwQ9bu
	 JM30Wkmn8MYNT02JQ81FyuMkU9A3io8jurZBWkPKgV+C8qM/ZK5D+6H/0dgIckRqga
	 hm++YqoAKzVBO9yP8l17PFDQjW2tSJ3MpAutxXRJlEIFAsf8EnNgmB09MWFjCv1NTo
	 IKVUk+sCOPCsQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 16/38] KVM: arm64: Hook up reclaim hypercall to pkvm_pgtable_stage2_destroy()
Date: Mon, 30 Mar 2026 15:48:17 +0100
Message-ID: <20260330144841.26181-17-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

During teardown of a protected guest, its memory pages must be reclaimed
from the hypervisor by issuing the '__pkvm_reclaim_dying_guest_page'
hypercall.

Add a new helper, __pkvm_pgtable_stage2_reclaim(), which is called
during the VM teardown operation to reclaim pages from the hypervisor
and drop the GUP pin on the host.

Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/pkvm.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 7d0fe36fd8dc..3cf23496f225 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -328,6 +328,32 @@ int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 	return 0;
 }
 
+static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64 end)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
+	pkvm_handle_t handle = kvm->arch.pkvm.handle;
+	struct pkvm_mapping *mapping;
+	int ret;
+
+	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
+		struct page *page;
+
+		ret = kvm_call_hyp_nvhe(__pkvm_reclaim_dying_guest_page,
+					handle, mapping->gfn);
+		if (WARN_ON(ret))
+			continue;
+
+		page = pfn_to_page(mapping->pfn);
+		WARN_ON_ONCE(mapping->nr_pages != 1);
+		unpin_user_pages_dirty_lock(&page, 1, true);
+		account_locked_vm(current->mm, 1, false);
+		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
+		kfree(mapping);
+	}
+
+	return 0;
+}
+
 static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64 end)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
@@ -361,7 +387,10 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 		kvm->arch.pkvm.is_dying = true;
 	}
 
-	__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
+	if (kvm_vm_is_protected(kvm))
+		__pkvm_pgtable_stage2_reclaim(pgt, addr, addr + size);
+	else
+		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
 }
 
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
-- 
2.53.0.1018.g2bb0e51243-goog


