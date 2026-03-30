Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE01061B09
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGBfyxuT3A+wiyE3H/SLgF++5Mki9YNQwF1t4/rvLY8=; b=VhNyq1XOfdBDLDH7rnN8ZZMkim
	tjByTsaH637kLlIQuTQiyPmB4XXNgXG0jNAReunBJo377wjlkWIP8m8VYqZ7Sc2OzGIDXiA2cNp1T
	rzUzYsu/Y40CRlM0g+gQK5PREckwiLyAriN/CPQN2vQn8NoyEF3ivshXrL4AC8eW2Z37EoVPovUx9
	/gFN5oxIMjzl4id4waRpHUiY9U0Q9NuQGHIy4rY2GcXc7OfzuHk4jiZZ75mFjZZ+I1PTb1YumQgnb
	J2Ty69JYUwQ8nyrAeJI3UtU7dal7esZBQYfc5YRbgfhU9Cwb021Z8SfUI5ZlX4ImIQso06g8p/11E
	fA5HN4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dxg-0000000BUqc-1qYM;
	Mon, 30 Mar 2026 14:51:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dx8-0000000BUPl-2shg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:50:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24D1960054;
	Mon, 30 Mar 2026 14:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD3EC4CEF7;
	Mon, 30 Mar 2026 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882253;
	bh=4A/Kf/cSzi1Il6/q35e+0ZP6t+7/cxTLMzjHM29zqvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i9plNqAg1yBElsNrjsjEPXggKpFPx1Gjc9BGCTwjNG0RKOcruZqL8oY6AD9C0rJoG
	 YkArx0DFBg45DZPwPZXWFjbfMoLk8ZpcDsAggVg0mNiFiu6Lw/HtYzjJJg6xpDhCFN
	 qeX6houg8Dyg9dwT+dHhYxHN1gQJDysFa6GoLqeSZVnE/GIqbYBA39v8YzrVo7guNy
	 Y6MPeSws2QjJu0UpesQ7/D9dfcasz8hBwslQqslsWOU/Eyzis5kXyrYlvh84smvqFj
	 2tyyj/AJrZVZhGx8mRLENomv2qXRVJuqGpBgLuMB52RAULF9DPS9bj7ukOvfCdRw9a
	 Yaivu8SBz3fQg==
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
Subject: [PATCH v5 37/38] KVM: arm64: Rename PKVM_PAGE_STATE_MASK
Date: Mon, 30 Mar 2026 15:48:38 +0100
Message-ID: <20260330144841.26181-38-will@kernel.org>
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

Rename PKVM_PAGE_STATE_MASK to PKVM_PAGE_STATE_VMEMMAP_MASK to make it
clear that the mask applies to the page state recorded in the entries
of the 'hyp_vmemmap', rather than page states stored elsewhere (e.g. in
the ptes).

Suggested-by: Alexandru Elisei <alexandru.elisei@arm.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/memory.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index 4cedb720c75d..b50712d47f6d 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -37,7 +37,7 @@ enum pkvm_page_state {
 	 */
 	PKVM_POISON			= BIT(2),
 };
-#define PKVM_PAGE_STATE_MASK		(BIT(0) | BIT(1))
+#define PKVM_PAGE_STATE_VMEMMAP_MASK	(BIT(0) | BIT(1))
 
 #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
 static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
@@ -114,12 +114,12 @@ static inline void set_host_state(struct hyp_page *p, enum pkvm_page_state state
 
 static inline enum pkvm_page_state get_hyp_state(struct hyp_page *p)
 {
-	return p->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
+	return p->__hyp_state_comp ^ PKVM_PAGE_STATE_VMEMMAP_MASK;
 }
 
 static inline void set_hyp_state(struct hyp_page *p, enum pkvm_page_state state)
 {
-	p->__hyp_state_comp = state ^ PKVM_PAGE_STATE_MASK;
+	p->__hyp_state_comp = state ^ PKVM_PAGE_STATE_VMEMMAP_MASK;
 }
 
 /*
-- 
2.53.0.1018.g2bb0e51243-goog


