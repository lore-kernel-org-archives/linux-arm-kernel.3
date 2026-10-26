Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99101606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fs0XsBz/;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T4l57WYP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CssD/LAYwVkYuy5yMkAUe/+D+tcxyS7rOxl3Jzz2dMk=; b=fs0XsBz/i4Ynyp
	SQLzAOoZKsS8PmsIeqCYpfQO/fCZS16jccJQW5yzzd818SzgU3JekezVsM4Ig5o3S0/QnKI3LL+uG
	qOjB618SE21DcRkcNdirozRPy/MVgf+OlKHHrUP5VYCPM6ZqY3F4oTXQe4qyyQ7NiuGhTJKfd29JU
	2jvoGZBtIo3zvvbPV1bXTVALrmYPKAnYl5WXkdW3qdw45u/dZA9kL7zNy/smAPy1yA67VxTtjRyRg
	jYffA8agbTANXacUyISGYbvGNSywEs09uApBcQk4lvJuchqDNf3jsDUtJvGikuNe1eQr5vcogji7L
	4wgKxx1J0hiaiKaAbkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLwb-00000002gsy-3qhG;
	Mon, 26 Oct 2026 14:45:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLwO-00000002god-1eOW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:44:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A698293B;
	Mon, 26 Oct 2026 07:44:43 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3126D3F7B4;
	Mon, 26 Oct 2026 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793025886; bh=fOsPjMCjhwurDmtr1XUkQ7PqX4RJ1KoomAWKFH0UkYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T4l57WYPvhYHcb1lMYIVy9fATlStKpRHDO8us7XmeLK+AdKsY1FjoVKcQew9aYY6g
	 F8+/SMtumpwNPal9dC6alr+E1tx+brEtGtdfZQOqvMQ73e0oGGJ6P5hK1zcXNJqDa2
	 TBT8KzRa6W5pmU/i7oF/trF+e8fNHcqn93+kAwu0=
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
Subject: [RFC PATCH v2 2/3] KVM: arm64: Introduce a dedicated walker for stage2 write-protect
Date: Mon, 26 Oct 2026 14:44:08 +0000
Message-ID: <20261026144413.441566-3-leo.bras@arm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026144413.441566-1-leo.bras@arm.com>
References: <20261026144413.441566-1-leo.bras@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953; i=leo.bras@arm.com; h=from:subject; bh=fOsPjMCjhwurDmtr1XUkQ7PqX4RJ1KoomAWKFH0UkYc=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLLup1uIes79uO9v+P2Jq03WGhSd/LRimkeXkpjcTRYX7 RnWJtyHO0pZGMS4GGTFFFlkH81fxfN9SsaRKz8WwMxhZQIZwsDFKQAT+bWVkWHB9b2LA99/PbDr u5ko9zy2z/dUMz6VWwtvY3fhqCj82bqOkeFri2nw7vf6579fDsqX1tuzgS+jWd+slXPj9B3b7Ld H/+QGAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_074448_531024_ED0EA65D 
X-CRM114-Status: GOOD (  13.68  )
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

When write-protecting a range, clean the writable bit (S2AP[1]) and keep
the DBM bit set for pages, so on HDBSS-enabled systems we can skip the
fault for making it writable again.

On block entries clean both the writable bit and the DBM bit, so we fault
even on HDBSS-enabled systems, in order to have hugepage splitting.

With disabled HDBSS, there should be no change in faulting behavior.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 8c2320c6a7f1..837546be5c13 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1283,17 +1283,34 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 	if (level)
 		*level = data.level;
 	return 0;
 }
 
+static int stage2_wrprotect_walker(const struct kvm_pgtable_visit_ctx *ctx,
+				   enum kvm_pgtable_walk_flags visit)
+{
+	kvm_pte_t new = ctx->old & ~KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
+
+	/* We remove DBM on blocks so they can fault and get split */
+	if (ctx->level < KVM_PGTABLE_LAST_LEVEL)
+		new &= ~KVM_PTE_LEAF_ATTR_HI_S2_DBM;
+
+	if (kvm_pte_valid(ctx->old) && ctx->old != new)
+		WRITE_ONCE(*ctx->ptep, new);
+
+	return 0;
+}
+
+
 int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
-	return stage2_update_leaf_attrs(pgt, addr, size, 0,
-					KVM_PTE_LEAF_ATTR_HI_S2_DBM |
-					KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
-					NULL, NULL,
-					KVM_PGTABLE_WALK_IGNORE_EAGAIN);
+	struct kvm_pgtable_walker walker = {
+		.cb	= stage2_wrprotect_walker,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+	};
+
+	return kvm_pgtable_walk(pgt, addr, size, &walker);
 }
 
 void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
 				enum kvm_pgtable_walk_flags flags)
 {
-- 
2.56.0


