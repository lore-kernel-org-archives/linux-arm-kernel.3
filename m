Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D14A606A948
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NzHlmtzF;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TO3TIizf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OILCjqp4rpCuWLpYe1vtBX1qnrLQcf8UfE34EzygRjs=; b=NzHlmtzFKy0jHm
	yz6hB2Ch1kfFzVrEJ1uWX3WY6Nju5MpwxV2fZYHfXbS3FhrsEdMDclZtilAW3cdSWt8YDRVoKMlOD
	HWf1hsgehd9b42/Y5mWhPScBGGOtwZlwMDMhdr+UintmCVo2PK3JHp0s2K1t/tnKiW0ucqaRV1bpt
	DnVTO50MUbd5Cf8uSWjC3rAbBVY2m710lQnm6KhQVQCS/hXtogJfNW1UIuXkK5OgAaAdVn00bZvTG
	9gSciIZj7XehlSeRRlz0y0XZKKGWy4ZPlv6d/urHECn7b3p/o3oHms81JrvLBwb3loiyZZb+VGrtt
	NgURwXtb2Um/2LoDIFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOABK-00000001cuC-1pcq;
	Tue, 03 Nov 2026 08:47:50 +0000
Received: from out-87.mta1.migadu.com ([95.215.58.87] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOABH-00000001csI-3hvH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:47:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=w/k/7zrmyeo5I/eUYEpGuLcAIJvpXePkVLh+wDmGFys=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793695663; v=1; x=1794300463;
 b=TO3TIizf9FF/Syh31DMy7PRBV1NzEn8VfdLS+HF5htINIa0hJtO/Nv82Ebd1lZfNvj7bPSlz
 UwkiliIIeuzcyiSVBWk5EZFR3xtgN1lsp4gKYARbq09qwu1d6kxkNEZufTqlJjPXNtFeSZBKBiW
 96mbtuPCrKOFi/sXgVzRb6G8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cdb0f0ca1530150d;
	Tue, 03 Nov 2026 08:47:43 +0000
X-Mizu-Trace-ID: cdb0f0ca1530150d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 1/3] KVM: arm64: Don't walk the whole IPA space when destroying a pKVM stage-2
Date: Tue,  3 Nov 2026 08:47:40 +0000
Message-ID: <20261103084742.1302597-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103084742.1302597-1-fuad.tabba@linux.dev>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004748_067580_9EDAAA98 
X-CRM114-Status: GOOD (  12.90  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 4ddfab5436b6 ("KVM: arm64: Reschedule as needed when
destroying the stage-2 page-tables"), kvm_stage2_destroy() steps through
the IPA space in block-sized chunks, and with pKVM each chunk is a
lookup in the VM's mapping tree. However, pKVM gives every VM the host's
IPA limit, so with LPA2 a teardown makes 2^27 lookups with 16K pages
(2^22 with 4K), nearly all of them for empty space.

Walk the mapping tree once instead, and reschedule after passing each
mapping to the reclaim or unshare helper. The unshare helper can't
reschedule itself, as the map and unmap paths call it under the
mmu_lock. A failed unshare now leaves only its own mapping behind, not
the rest of its chunk.

Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c  |  7 ++++++-
 arch/arm64/kvm/pkvm.c | 17 +++++++++++++----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db73..42977cf8a7f5d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1022,7 +1022,12 @@ static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
 {
 	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
 
-	stage2_destroy_range(pgt, 0, BIT(ia_bits));
+	/* pKVM walks its mapping tree, not the IPA space, and reschedules per mapping */
+	if (is_protected_kvm_enabled())
+		pkvm_pgtable_stage2_destroy_range(pgt, 0, BIT(ia_bits));
+	else
+		stage2_destroy_range(pgt, 0, BIT(ia_bits));
+
 	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
 }
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 016997288fd23..992ed3ca6bdd9 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -504,6 +504,7 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	pkvm_handle_t handle = kvm->arch.pkvm.handle;
+	struct pkvm_mapping *mapping;
 
 	if (!handle)
 		return;
@@ -513,10 +514,18 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 		kvm->arch.pkvm.is_dying = true;
 	}
 
-	if (kvm_vm_is_protected(kvm))
-		__pkvm_pgtable_stage2_reclaim(pgt, addr, addr + size);
-	else
-		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
+	/* Called once for the whole IPA space, so reschedule between mappings */
+	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
+		u64 start = __pkvm_mapping_start(mapping);
+		u64 end = __pkvm_mapping_end(mapping) + 1;
+
+		if (kvm_vm_is_protected(kvm))
+			__pkvm_pgtable_stage2_reclaim(pgt, start, end);
+		else
+			__pkvm_pgtable_stage2_unshare(pgt, start, end);
+
+		cond_resched();
+	}
 }
 
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
-- 
2.47.3


