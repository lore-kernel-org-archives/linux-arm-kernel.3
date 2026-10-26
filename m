Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA73F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bj2SEURi;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tc2dGiQf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GSEN1e/y0bwGfJJMQ9Hg+c2qcQyTslgLVny4UlJpg1o=; b=bj2SEURis3CMez
	93VullOSoewTLomMdLNMAoRahNaUSBI58MwoKi2q4ggUPlZCiLDV+cWrKEMhmjF7l6jG+EYGAZowd
	lLoboFlMuINjXK9EdFXuae5GxkDAau8bRGyXODuDlnUQplNJFk2lIeDma7xM/kw5fZu5hgtqeUvZe
	RCn8pnJvVEMVvggazNlaunjNX7QdXDP9fn/ecs6FvrKqUc5W/1qow6ZakYCgKhFPQz7W+MEHlqFkx
	N7RiD2TbPu827czrW3ptYTSqn6sdzJ/uzQg9rlya1/0khUUwqS2BouZabOpQdRyAscFlOJClJ6L7S
	2EGi6N1g7VJ6GFyzjBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLwQ-00000002gpP-2EjG;
	Mon, 26 Oct 2026 14:44:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLwN-00000002gnl-0WQ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:44:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2BDC2720;
	Mon, 26 Oct 2026 07:44:40 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD66B3F7B4;
	Mon, 26 Oct 2026 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793025883; bh=lqK7uGIZ/jkYXTWUZmtWT+d67C2f5jU7aALBqK7r/3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tc2dGiQfjBvRRqB83xDgLfT7zZBGGXCOJ/y/RYJCTy0uzkUQD6qVBVtFxLC4QFy0P
	 QMrVMRfz9N6Tu4NyMPmo9maOMAYfFWxIMFkCTSiuBjeLbF1mhFwY1juF6ZmQIItpJq
	 tEwHexZYWuH2RcdnrBz20PdT3yRc/HTIUBk41W2U=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/3] KVM: arm64: pgtables: Set DBM attribute on writable Stage-2 PTEs
Date: Mon, 26 Oct 2026 14:44:07 +0000
Message-ID: <20261026144413.441566-2-leo.bras@arm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026144413.441566-1-leo.bras@arm.com>
References: <20261026144413.441566-1-leo.bras@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3059; i=leo.bras@arm.com; h=from:subject; bh=lqK7uGIZ/jkYXTWUZmtWT+d67C2f5jU7aALBqK7r/3M=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLLup5u3z2By3Ri9qyTVOL/ze8XX5j+3r3DXf9jx7tzrd S86Vge/7ihlYRDjYpAVU2SRfTR/Fc/3KRlHrvxYADOHlQlkCAMXpwBMxLaWkeHF7OOelhsb3O52 xp20aLMsf1ic4ltp/X76thmVUZ+qODYyMtzMubvoaMYU0d3TzL5kXngj45Lzab/2Ln22Rc5PuM5 ObmUFAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_074447_249905_4D1DF0E5 
X-CRM114-Status: GOOD (  14.26  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As a preparation to the introduction of HAFDBS-based features, set the DBM
bit (along with S2AP[1]) to all writable PTEs. Also unset DBM and S2AP[1]
when a PTE is made read-only again.

DBM bit works as following:
- If HAFDBS is disabled, DBM bit is ignored.
- If HAFDBS is enabled, and DBM bit is set, a write to non-writable page
  can promote it's PTE to writable (S2AP[1]=1) without taking a fault.

Since it's being set on writable and unset on read-only, it should cause no
functional change.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 3 +++
 arch/arm64/kvm/hyp/pgtable.c         | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..37baa86d6fd8 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -91,14 +91,17 @@ typedef u64 kvm_pte_t;
 #define KVM_PTE_LEAF_ATTR_HI_S1_UXN	BIT(54)
 #define KVM_PTE_LEAF_ATTR_HI_S1_PXN	BIT(53)
 
 #define KVM_PTE_LEAF_ATTR_HI_S2_XN	GENMASK(54, 53)
 
+#define KVM_PTE_LEAF_ATTR_HI_S2_DBM	BIT(51)
+
 #define KVM_PTE_LEAF_ATTR_HI_S1_GP	BIT(50)
 
 #define KVM_PTE_LEAF_ATTR_S2_PERMS	(KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | \
 					 KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | \
+					 KVM_PTE_LEAF_ATTR_HI_S2_DBM | \
 					 KVM_PTE_LEAF_ATTR_HI_S2_XN)
 
 /* pKVM invalid pte encodings */
 #define KVM_INVALID_PTE_TYPE_MASK	GENMASK(63, 60)
 #define KVM_INVALID_PTE_ANNOT_MASK	~(KVM_PTE_VALID | \
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..8c2320c6a7f1 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -730,11 +730,11 @@ static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot p
 
 	if (prot & KVM_PGTABLE_PROT_R)
 		attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R;
 
 	if (prot & KVM_PGTABLE_PROT_W)
-		attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
+		attr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM | KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
 
 	if (!kvm_lpa2_is_enabled())
 		attr |= FIELD_PREP(KVM_PTE_LEAF_ATTR_LO_S2_SH, sh);
 
 	attr |= KVM_PTE_LEAF_ATTR_LO_S2_AF;
@@ -1286,10 +1286,11 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 }
 
 int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	return stage2_update_leaf_attrs(pgt, addr, size, 0,
+					KVM_PTE_LEAF_ATTR_HI_S2_DBM |
 					KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
 					NULL, NULL,
 					KVM_PGTABLE_WALK_IGNORE_EAGAIN);
 }
 
@@ -1366,11 +1367,11 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 
 	if (prot & KVM_PGTABLE_PROT_R)
 		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R;
 
 	if (prot & KVM_PGTABLE_PROT_W)
-		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
+		set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM | KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
 
 	if (prot & KVM_PGTABLE_PROT_X) {
 		ret = stage2_set_xn_attr(prot, &xn);
 		if (ret)
 			return ret;
-- 
2.56.0


