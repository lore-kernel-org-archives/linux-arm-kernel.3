Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD7BCCF2FB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8y5Kh93k1EgncTk96MCri/ZMn5suOEFuiLcIxcjPb5U=; b=gIVEgS1WA9pOlWbnZ7dG+vWrLq
	v+42LUwZesnPkf3BjhXxTH35zBB5hVOr2WMeFz0HPe4/N32f6B6mCh0VxEJM1pkQDQpDAhlYYzP5z
	/zrFR9bx0N2xHN4bXF6OL9e/oEE5/g3R2YZYRdZqdfdQk1SyyJkJOoLlzlZCfHXxUWeDpjBS//jDS
	K9AhqKcfjxXWdHuwcJhlncPBgHcxDX8QMRUlTcEtfKjsmrNeDIkU6FS01adjHmV2uMv0+nFwJgPRg
	Cs4F35+tpI2VST6JvyF6hNnk/8LD00bsHOtyoKPGIkw8oDlLQK46Nb6NCwER6SvtAUNe0jhm9zgHm
	5kd63kGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhogN-000000024Ai-2mbQ;
	Mon, 19 Jan 2026 12:48:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofq-000000023iM-2KJm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 12:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8y5Kh93k1EgncTk96MCri/ZMn5suOEFuiLcIxcjPb5U=; b=j5+ce+4NQJEpT5Qa30DFMey7F4
	vDIFPx5AJhTaFJk9ZMtncgGcoodeC+acCxymvZwOcASOvKoeTthqmGfIUwAy6eJPlDBfhx+EfIvFP
	qlr/BTHUEWYhfGY2ToZinKdNLgu36gt61HMxObT2vO3LOBBd5Xky2QawiCmW0mNrvLftjDJmzLEg/
	/CqwnvBCVZjfToxEXe1kR1Hjppo1xZIIC/+J7UStG3RnyuLHm4sZ7l9Obn5olkdjp4uBoC5kvpWS2
	LgIG8/I51ad9CnHS6Yvjaetz3eJkfCOASF7hdIilXSyblRDi+M1uCs/nmuyvcc48WyjBL2XfBzBjR
	hmlH9OFA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofn-0000000C6UH-1kh5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:48:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09C6340877;
	Mon, 19 Jan 2026 12:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB2AC116C6;
	Mon, 19 Jan 2026 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826877;
	bh=uUL60sV+/ufbRutlnjjHRkQPedaXpLvo0DvrHx8Jcxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gGVi2o3SItUKI4TFnCfojdpXXcS4D+/KjYd3oLM/eAfD16q2a1MjgsDWuL2OpSCIP
	 fRDbYA6eg33yf94MNTH5+TswHmixolpuTG5EFfmhVp7WGF2LgEOPQEs4Q1UTuPIDJH
	 sEgPvpvHjuhHG+zEecHv27xyPUKUs12+vQMobso4z3k+eoaNeUt7wbn6Ci1K2fnK+X
	 kjicRsUVYA2C7TEuUL6PoSb83QX8ZhWEAgmF+br/J/fFV9hf4Ktrla/YfJITt/pXLB
	 75M/wWJeM9C4ft0YCIzx6JhGvRybQHf6ahueGiPVLnA86lKbdXJXGUAXrC5bD+DQBy
	 fqZGEktao39RA==
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
Subject: [PATCH v2 21/35] KVM: arm64: Introduce host_stage2_set_owner_metadata_locked()
Date: Mon, 19 Jan 2026 12:46:14 +0000
Message-ID: <20260119124629.2563-22-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_124759_860318_2146EB46 
X-CRM114-Status: GOOD (  12.30  )
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

Rework host_stage2_set_owner_locked() to add a new helper function,
host_stage2_set_owner_metadata_locked(), which will allow us to store
additional metadata alongside a 3-bit owner ID for invalid host stage-2
entries.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_pgtable.h  |  2 --
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 47 ++++++++++++++++++---------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 4c41a8ed4a7c..eb2a6258d83d 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -97,8 +97,6 @@ typedef u64 kvm_pte_t;
 					 KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | \
 					 KVM_PTE_LEAF_ATTR_HI_S2_XN)
 
-#define KVM_INVALID_PTE_OWNER_MASK	GENMASK(9, 2)
-
 /* pKVM invalid pte encodings */
 #define KVM_INVALID_PTE_TYPE_MASK	GENMASK(63, 60)
 #define KVM_INVALID_PTE_ANNOT_MASK	~(KVM_PTE_VALID | \
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 3f8a73461f90..e090252d38a8 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -546,37 +546,54 @@ static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_
 		set_host_state(page, state);
 }
 
-static kvm_pte_t kvm_init_invalid_leaf_owner(u8 owner_id)
-{
-	return FIELD_PREP(KVM_INVALID_PTE_OWNER_MASK, owner_id);
-}
-
-int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
+#define KVM_HOST_DONATION_PTE_OWNER_MASK	GENMASK(3, 1)
+#define KVM_HOST_DONATION_PTE_EXTRA_MASK	GENMASK(59, 4)
+static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
+						 u8 owner_id, u64 meta)
 {
 	kvm_pte_t annotation;
-	int ret = -EINVAL;
+	int ret;
 
-	if (!FIELD_FIT(KVM_INVALID_PTE_OWNER_MASK, owner_id))
+	if (owner_id == PKVM_ID_HOST)
 		return -EINVAL;
 
 	if (!range_is_memory(addr, addr + size))
 		return -EPERM;
 
+	if (!FIELD_FIT(KVM_HOST_DONATION_PTE_OWNER_MASK, owner_id))
+		return -EINVAL;
+
+	if (!FIELD_FIT(KVM_HOST_DONATION_PTE_EXTRA_MASK, meta))
+		return -EINVAL;
+
+	annotation = FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, owner_id) |
+		     FIELD_PREP(KVM_HOST_DONATION_PTE_EXTRA_MASK, meta);
+	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
+			      addr, size, &host_s2_pool,
+			      KVM_HOST_INVALID_PTE_TYPE_DONATION, annotation);
+	if (!ret)
+		__host_update_page_state(addr, size, PKVM_NOPAGE);
+
+	return ret;
+}
+
+int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
+{
+	int ret = -EINVAL;
+
 	switch (owner_id) {
 	case PKVM_ID_HOST:
+		if (!range_is_memory(addr, addr + size))
+			return -EPERM;
+
 		ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
 		if (!ret)
 			__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
 		break;
 	case PKVM_ID_GUEST:
 	case PKVM_ID_HYP:
-		annotation = kvm_init_invalid_leaf_owner(owner_id);
-		ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
-				      addr, size, &host_s2_pool,
-				      KVM_HOST_INVALID_PTE_TYPE_DONATION,
-				      annotation);
-		if (!ret)
-			__host_update_page_state(addr, size, PKVM_NOPAGE);
+		ret = host_stage2_set_owner_metadata_locked(addr, size,
+							    owner_id, 0);
 		break;
 	}
 
-- 
2.52.0.457.g6b5491de43-goog


