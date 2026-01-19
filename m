Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03FCCCF2F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ue3cep+raSqjIYsAQsctUtDspYAnnUzEvAlKyKfxOQ4=; b=4bZz55Xgq90w3UkGojIBxMmqL0
	JyYPLSVvjpwG012vc+Nlpdotzr0EFISRA0DucacA/TM/1vxhgI5n/OnlFavd7A7I0LWJObU0FE7RY
	8DRnIKegrttTq31I9wc2FeORmk8K0LzXn2wArXKObwy1Ge4TIM2nNzJVOFLkIks/1ktMUUlB2jcg+
	YiLiqF2wpujhU4Ei7pEG8fclddb96u6SX/fqpOkIzwp5uzHTXeSFsU4i7XvHFfvmm9dYAaU5u3XHx
	USihRoEVMuOFMKR4OyoIp2xHuBtbcCuynQa0FxKGdM9s7UbYqT3xtLNkNPiuzTcMkTDAF/fyvRn/j
	DI4bC+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofs-000000023lD-3Eoa;
	Mon, 19 Jan 2026 12:48:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofW-000000023SO-3ycq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A523B406D3;
	Mon, 19 Jan 2026 12:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DD1C116C6;
	Mon, 19 Jan 2026 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826862;
	bh=ZAjQPBd9eNNnkLXTRXaMdVil4Dxe23mZFWAvFAqk33c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OD68X2+9iSoTK54PME/4C5vHWoVLb0I5Xg9b2Y628p30SzH/63jINSFkxWs9elu1g
	 Q97tAfYz5oMyKlZMXknSBYV/KfbzJxBe7BDt8JYPSOFbRaCa/U0HyDxtIN1OimKAVz
	 Qc4ZJsz7PLzD3Qevdck0NB2bGsKRzvM9Gj7XcWWwIM6r1xEIh1i+6IMmMmCaUWi9XN
	 NZbdloJjIobJzBWx6/cp5JdUNhV5XnNghhieZjkRlwY8VBD1MElPn5sM24uI6iBNhN
	 MprVGO7yHEJlLNFH5ZvhjTX4sK/jw53KU5qEIsswhy9dk+LH++cbK3ER2RF6qfZCtI
	 217Fe2xfv8Qqw==
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
Subject: [PATCH v2 16/35] KVM: arm64: Hook up reclaim hypercall to pkvm_pgtable_stage2_destroy()
Date: Mon, 19 Jan 2026 12:46:09 +0000
Message-ID: <20260119124629.2563-17-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_044743_184198_571BA32D 
X-CRM114-Status: GOOD (  12.37  )
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
2.52.0.457.g6b5491de43-goog


