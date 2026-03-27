Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431BC10ED67E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGBfyxuT3A+wiyE3H/SLgF++5Mki9YNQwF1t4/rvLY8=; b=eckw9DMpXl5x/p//P51rFaoHnG
	v4ALVqRTOVjiQruM+gtKUZl7uQ4pV2RkHvzbpT4h7E8pZSjF/JFalb/SxGQUeeTcw0NA0jqyEn3hg
	yevbkPZDQ+rpk0bMNB6VHQCT+rnJXVWwFZW7pmZSdUo15fExzwTSNgly/Oj7j9dLvSJY8N7yWhz5d
	y546XgKuLfkdm0Woh049Wsr9dYKTauNB+/Qu4WWWTFbvQ/9wq6Xqq5bfuSIZVFbWIeDyz6b8JIDwa
	poaAG7cLdrzPdbZyn9ODmqnPxKtwBiJY1tLGGjgwHa1m33daqorQR/Ivb7Z+8RUAWcVV6c319SK38
	myQt56eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67mv-00000007Xe1-3i60;
	Fri, 27 Mar 2026 14:03:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67m1-00000007X1v-32Ne
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:02:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 176A460134;
	Fri, 27 Mar 2026 14:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148BDC19423;
	Fri, 27 Mar 2026 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620172;
	bh=4A/Kf/cSzi1Il6/q35e+0ZP6t+7/cxTLMzjHM29zqvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QlEsFZ2FK+XFwFy/whdDO3Iojz1ZK1OPbRmQmdETj8Y4UNUI0eytzBBRwa2R8PcQo
	 kIhz+nik7DtxvgXOmK2s1eHSUW97wZMItAqfMd7I4ewdC7EyQMCuNIn3qOZvuHEX3b
	 p6yNYqvd0QyWuvWTlGLt8ngaIF9VrVip671sKyyXMc0JqfbgO6Xwx58fYAKFKIv7j/
	 m5SQtRiutPK7iG+0gzyqAB0SU4AxZk4ms0nz6pvSIUAsV9tuAraLkwVsgbqTfFRu1t
	 QjGdoOVFnjLy2/qCVTfra9gpGWn5NRtPnCd/JYeUYVT7TZPIZektVz6GOtfr+Mg8Vs
	 e5ggsGRmCgwcg==
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
Subject: [PATCH v4 37/38] KVM: arm64: Rename PKVM_PAGE_STATE_MASK
Date: Fri, 27 Mar 2026 14:00:36 +0000
Message-ID: <20260327140039.21228-38-will@kernel.org>
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


