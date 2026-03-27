Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AF810ED67C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxbQoD/Qpdnz6cFoZ6hUxglZzCvDwS164VQXceUeV64=; b=jp+55r9n5E9pcRIlOUAPEsu69+
	wBqfryGrrkEb76KougNZJbXCpp6I9my3DSONQi2kINaG9xPlS35rMyXi69njBHNR2pumgaILgai/B
	s/Y5wpuH5ZDBqDICHCNVSCVlmZE5kq8q1amnGvcdd6d+vCyvYHn1smBpz5YvICkZQ9S15kS/MUetB
	C1UEa/5+E5Be72LBNJCRkzkEXNOzEcqKA2QF6yq5L17nEfvQlC1guDITwNqOJiU4PH62swxdfkMbQ
	GmHM0agXabjKvVBF4+Col14bKQixehBMwy5bMm32LjHoLvX3LvUSHnZEHDC7KsVDJWNJWKpRiYjRV
	Iqef1Xag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kH-00000007VV1-2t9k;
	Fri, 27 Mar 2026 14:01:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kE-00000007VTq-0ShG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:01:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3537F60133;
	Fri, 27 Mar 2026 14:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3481BC19423;
	Fri, 27 Mar 2026 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620060;
	bh=QaZdw+cKvQLXGdg14aZy7asM3jAbDolMGcxEF/Z3CVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ycz1wOijK9lypWq44ZhQ9nW3bypsyhNMcXmAI5YlT4qlcAQdrDVI7SS9wwUnApkGb
	 w70OH21mudmIycY4muSteKOFiWaaDUAcKqckHo8c73d3Tq8ed7ciy6bWDqkFzDLScy
	 m2vPPZesIsuM1KKbTU7gs8JqpobCkm2iIZzpdyZjUitAAB+S4Hk/0cHjXvcQkNVYpK
	 zaQCicTkpJzWEC8yKYxksM5dsROxhgEblujUu/6Ffw1vg7oqG37cwzaakZXOb7rZc7
	 JH76+hOol4xN5JkK/VNSBDPcIxsu5xDzIdv4dPjKqHbfOz5h4hBpj344VJj0p1MRKV
	 QLAwWKsWSHp2A==
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
Subject: [PATCH v4 03/38] KVM: arm64: Move handle check into pkvm_pgtable_stage2_destroy_range()
Date: Fri, 27 Mar 2026 14:00:02 +0000
Message-ID: <20260327140039.21228-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
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

When pKVM is enabled, a VM has a 'handle' allocated by the hypervisor
in kvm_arch_init_vm() and released later by kvm_arch_destroy_vm().

Consequently, the only time __pkvm_pgtable_stage2_unmap() can run into
an uninitialised 'handle' is on the kvm_arch_init_vm() failure path,
where we destroy the empty stage-2 page-table if we fail to allocate a
handle.

Move the handle check into pkvm_pgtable_stage2_destroy_range(), which
will additionally handle protected VMs in subsequent patches.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/pkvm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d7a0f69a9982..7797813f4dbe 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -329,9 +329,6 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 	struct pkvm_mapping *mapping;
 	int ret;
 
-	if (!handle)
-		return 0;
-
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
 		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
 					mapping->nr_pages);
@@ -347,6 +344,12 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 					u64 addr, u64 size)
 {
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
+	pkvm_handle_t handle = kvm->arch.pkvm.handle;
+
+	if (!handle)
+		return;
+
 	__pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
 }
 
-- 
2.53.0.1018.g2bb0e51243-goog


