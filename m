Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D09C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YZ1JJ2lc+rqbj4t+lEsnkv4DYz6wMBYG946EJ5Reyc=; b=D1eBUoEVqbGQGa8XKfyHFxoUXj
	+UkF99ga3ZAZSHo2Y18CqdIwOwoF5Wj974rvhXEDkhfA79wqAxlw1s2GNZq2Nzs6SyS+IIJMPuTFx
	iwqNGlqGbKP+UXbVjHQ4xW0JnQrAe3/ZyvMAh5Hn1U2ek+WEl1WU5T+a9T99z/inFR3Wok+UoKDDD
	mdev10kOLXL1FJk9UQjEuo7Bwj6kZNXYrl3V+A/BzvkLXUNMGfjPyTzSFoVR5wncmTtjHq2Ty5Vif
	vWMPL2nFRM8RX0AAutmSw8fnjxQ7JYJxKuLxfFqAyt/Nh1HjjLfLTArE/1bfeiajYd/+wQsYdsx20
	ch6y5TBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78GT-0000000AzKl-1AUb;
	Thu, 17 Sep 2026 09:18:45 +0000
Received: from out-137.mta0.migadu.com ([2001:41d0:1004:224b::89] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78GN-0000000AzHt-1EJc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:18:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qWxN+EE1n/NUST3E3o6AfroyhPJ5HLiC0YPhK6f/EL4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789636717; v=1; x=1790241517;
 b=lryTLbVG0IdxUM+FXjxuRvrAM6K+TupsS9K+15+MMaDRrKvxpUze5nEWAd9nQn7R2WfgbMP2
 Juz23r1veoh4d5i0YPE3/YilRQDReNHe8K4QPweN0Zo7gD4R6UFcrXYLEnKBZUok8oTtZ45YVS+
 Sv4wIcLIkmf72azCG/H9z2j4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2a294692267e0b73;
	Thu, 17 Sep 2026 09:18:37 +0000
X-Mizu-Trace-ID: 2a294692267e0b73
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	qperret@google.com,
	vdonnefort@google.com,
	martijnbogaard@google.com,
	seiden@linux.ibm.com,
	tabba@google.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] KVM: arm64: Check PGD alignment when creating a pVM
Date: Thu, 17 Sep 2026 10:18:24 +0100
Message-Id: <20260917091826.2639205-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260917091826.2639205-1-fuad.tabba@linux.dev>
References: <20260917091826.2639205-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_021839_481049_21B61D65 
X-CRM114-Status: GOOD (  12.24  )
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

From: Quentin Perret <qperret@google.com>

Martijn reported a hypervisor crash when providing pKVM with an
undersized PGD allocation. Indeed, although the size of the PGD
allocation at EL2 is not under host control, a smaller host-side
allocation can lead to providing pKVM with a misaligned PGD, which will
cause the guest stage-2 init to fail in a bad way. Specifically,
guest_s2_zalloc_pages_exact() expects a successful allocation from
hyp_alloc_pages(), which can only happen if the pool has been pre-filled
with a physically aligned high-order page.

In order to guarantee allocation success in this path, check the
host-provided PGD alignment early on.

Fixes: a1ec5c70d3f6 ("KVM: arm64: Add infrastructure to create and track pKVM instances at EL2")
Reported-by: Martijn Bogaard <martijnbogaard@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
[Fuad: rejected with -EINVAL before any donation is mapped, as the
 other input checks in __pkvm_init_vm() do]
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c        | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 39aa8911f62c1..805dade1d4510 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -186,7 +186,7 @@ static void *guest_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&current_vm->pool, get_order(size));
 
-	WARN_ON(size != (PAGE_SIZE << get_order(size)));
+	WARN_ON(!addr || size != (PAGE_SIZE << get_order(size)));
 	hyp_split_page(hyp_virt_to_page(addr));
 
 	return addr;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 459bd9eb7e4bc..3770315b50361 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -846,6 +846,10 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 
 	vm_size = pkvm_get_hyp_vm_size(nr_vcpus);
 	pgd_size = kvm_pgtable_stage2_pgd_size(host_mmu.arch.mmu.vtcr);
+	if (!IS_ALIGNED(pgd_hva, pgd_size)) {
+		ret = -EINVAL;
+		goto err_unpin_kvm;
+	}
 
 	ret = -ENOMEM;
 
-- 
2.39.5


