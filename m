Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CD0C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPN2+4ejwarfuYqdSZgS5c2asVcjgx1FiI852RocS8Y=; b=HWQraAbR31nTgADvfBij859s9K
	HN+ZzYeg0fEdteXzWiJ72NbGE6gmWL3nHHOUyYz5/GJ1BsqD0tV1mHFxElj82aHGpPn5AkXnH4Ciq
	92F6ms3imrv0nLER0g5sxT0oHcI8I/fHR+r7CgK83h0RquTxecT2r5PBoY4itON27JW+jEPNUqjrJ
	LO/qQAPy2zJSO2eCWo/AA9Uk7VY8hCKt5x0mLypQbHI/wE8ywei/c+PlxEw8Adnpt6a6LXcgp7zZn
	UhtGl/uwJvS3R1FZ/o46p78/PWhm1DqpQrmcOItmlaC60Z0sQ+ckGd4WOyH2GfMiCPhAQV9wHi0ae
	hVPlElyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqv-0000000Be3i-1BWL;
	Mon, 05 Jan 2026 15:50:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqo-0000000Bdx4-0FyN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE5744197C;
	Mon,  5 Jan 2026 15:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08811C19421;
	Mon,  5 Jan 2026 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628233;
	bh=DzuRRLjnp/dVqJAn5lUOBuYxv+mblAF47GOa3IZTaBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tNblaxEOEmlEeSszWjRgnuGZElsejiKKqEJiDte5tlxFsXP9ZVnkaXbGfE2itosEN
	 +3h3wuzhHCp9gqD0NmxInS9oAEX3K1207TRgStftYU6nJHIQ8fMNWxYGSqHOKRq6RB
	 4+rULFloPwvlefiVGJqmdAiVw6/7L/leb1LvjEPm/eVHj3tnuipXq9MnEPlgRlVqOj
	 dvQdkn1rMYwQzco60xm3sbYiC6t4F8pdav5mnjK7JGAW4BHWQiz+wNQuOEj5kYMyDK
	 8qrhL0QNk0ytFRxZ1ApMyDal6lzpBpTzyB9TgVgteVU+55qjD8c2KbWQ4vzWva7bpX
	 Se5s8UphEydmQ==
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
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 14/30] KVM: arm64: Hook up reclaim hypercall to pkvm_pgtable_stage2_destroy()
Date: Mon,  5 Jan 2026 15:49:22 +0000
Message-ID: <20260105154939.11041-15-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_075034_165888_F4247350 
X-CRM114-Status: GOOD (  12.09  )
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

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/pkvm.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 1814e17d600e..8be91051699e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -322,6 +322,32 @@ int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
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
+			return ret;
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
@@ -355,7 +381,10 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
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
2.52.0.351.gbe84eed79e-goog


