Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC92F33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ib3Y1WfXK/VAkE8AT+6ehanWQlaf0h04pTxuz0yWfmU=; b=OzoTQlSOv4ePzB0DZCdbaWi7fx
	DLFuvSlmIXFhxlIdZw3e9i60jnG8OIF+ZL6k8pIpV6J381G6VBFIFl7UZlKJQbp2+AyaD7Vsa9QDl
	3nbLM/LEgVcundJOFj7sNRk+SVTAoSDrxXl2d7dr5Q1KEPhV/JrrYO5iLRg+zo9Q4NVmOKHrNV/YB
	+3KfHTwNX1bWLJY+hN4no/OcN9BGtkqtLLLfsTwJNCTdJVlnw4NnHa+Zt/dcV0lLEdCHHOFbJoB1P
	BmtmNn7TNVpzaV7Kkx1KxBVpP76gNyngm4hZ6VfHFLZNrYxpRBQSEKESqO6IGrFsGm9yxFlyc6Px3
	J4dFS9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9y4-000000023MO-1Hx4;
	Thu, 05 Mar 2026 14:46:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9y3-000000023JI-0cbl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 14:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ib3Y1WfXK/VAkE8AT+6ehanWQlaf0h04pTxuz0yWfmU=; b=HjZ9YrGuyB5HamY1vfjn3bDHkO
	Pp1omwaxCToss0LGOvKJO36rvl08/OxMnAHRg14T4HOSWu/y4sAOTWzryHTDCSaj3DwP0tCOKOhHn
	ISFxqU+B2kKe8haWvx0t/c4l6VldVShTv2elYC7dmhcDgNKp1JgDGLD+e1RcaZUZcDu+0u8wtr4fp
	oAP5nz7EIpLvVNSv5SElge0alF8ccz5PLPdiLZnTFmNbD/pMeS8E1etOzdvQP+YNfnV9fKaPa8eH+
	9vmW8N19fpbzlxAXMKJctmD8lLN7gEKdnr6yqRg5l10ROwnWeB/SkBIeKChXVFTQ1Ncjsnsicr5hq
	PAYVqtHQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xx-00000006yi4-2hlO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96C4B43A30;
	Thu,  5 Mar 2026 14:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D13C116C6;
	Thu,  5 Mar 2026 14:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721975;
	bh=oZcCfY/nioqPKTU9trBN+esVvAZhnr2RYRCLrfwP754=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nupp1a6D9V7Y7uajqJaNSL5oBJxrMqJWYyxJyXxRnRCKd01rf+liXMQJRjgjOb3Q7
	 0UDlrr43Ob7yq+XRRKwZPAU6Pz1RoF0Rwf6jfCEJHLAsy9BGu/3yVB/f7dQ/sJXosk
	 OukL7EtKxgLKi1O1eVT5BnyO4z69zYJSJiqj2huXpnzU5U5mMYh7kppGVQu23BKsRy
	 8LEz0T/gIoomgLrN4TL21A5R+ZakCQVAhEPTRCsQD+3PA4Tz5F6CSYP1ABR6wFXqwe
	 g9z/Wm93kK4SzRMNs6AXxtUuE/e8CQhtRkU8mPutTGmKzsmAk4r6L7YtjBYYKXE8+C
	 QHaVviOpkTuUQ==
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
Subject: [PATCH v3 36/36] KVM: arm64: Rename PKVM_PAGE_STATE_MASK
Date: Thu,  5 Mar 2026 14:43:49 +0000
Message-ID: <20260305144351.17071-37-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_144617_927119_291B41D5 
X-CRM114-Status: GOOD (  10.96  )
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
2.53.0.473.g4a7958ca14-goog


