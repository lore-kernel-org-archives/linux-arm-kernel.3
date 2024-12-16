Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B171E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKKtybYMKA7zsu5unQStwbk02cJvQpLoCTe4uFlfQf0=; b=c+/8lWuDPf/LolGOqkNLs14I5f
	HWAA40kTe0AP99qTHQ2185I1O3EnT+IyGbUL6YPcRHiV3BPVBr+3L0bcWKioBpaOng1jhelUFGIKu
	F5sRgLiL+vRTVsvbk1UfYtiMtfVglprNDlnXvVWXlM9mE9+tlVP8yf6lPRUw64k2vXBunOSKTXVNE
	NlUHm1CjqaygVkWm/7eFHl6nBizGeEIv+38ydNKyg/J0S9qcMVQC24hwobGhhEWe9OwOvTrnqYJgR
	SDzz6Ofz1bqC4qfQ8fnIYEee2dARFM72/tmhKHNoqMknHOWAoLs7WBwTNKJd2ZXNkPmKdZYKaj1Sm
	o8xY+vEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFQe-0000000AsNo-0qnZ;
	Mon, 16 Dec 2024 18:02:48 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMB-0000000Aqtc-2aNx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:12 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-aa6845cf116so447105766b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371889; x=1734976689; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKKtybYMKA7zsu5unQStwbk02cJvQpLoCTe4uFlfQf0=;
        b=vGbD9abXB+Y2dIWI3hcZWSXoeYAW5N9xsUXTjxLb4kDgr4HVsgPQDN/jRIBuZ1buEW
         ZRlmgteLunqEljajXFqvFZ5U2BwTiJBE1zaQyO+BiC4UbqKuou7OtxLDcce4d7eMm6py
         9P4nbGhXWNYiqTMfYh006Ri0/KpVO1ksWMzbVVRKQNp99uTjPwpa5oaSsxik/4UklIL2
         J2yf63cQxDVhS8giUO48/73+DyxumkjpVeRBXK40hUEcnRxlJt/p9LTiiSpkCP1wzEHP
         20d7iC6jm9U8L4wWqHrJF58sw/zTCAZFVubXDkQI9BvQr6f1AEHlwlDnwTrr+ewFcn6m
         Cx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371889; x=1734976689;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKKtybYMKA7zsu5unQStwbk02cJvQpLoCTe4uFlfQf0=;
        b=pbDsIgldexIZNfFxITA/hcSIyk5xPjKwV7Mrucwb5TFtI/lKSTcmAG3IK8WaEDl69J
         0tnW71LNVYM1YkEyHrTBd21uRjpNIaYKTluY7K9EU0MAt98teS2JMc16lXtiws4ARbJv
         4eFG+TtpC+pBH/wrCeH7HR6naTlt2oslV7gfMuxI4eTEdh6IoayUH4Q1iELTGLR94yex
         92tvvK8M9s6d5j4QzRmDe5oawrH7lHjbr+EMOWiwwRJJE3PX5UGgPohf7cMs0UZrY3mM
         3nVOL7RB7mDGOFxloClccz2TRtaQ32lrdTknQjpaEZuKqBSXzL7uYYkoIzxkGR43L4JV
         q1pA==
X-Forwarded-Encrypted: i=1; AJvYcCXAepz5AvOM6AqekQygzaebtCZ3Mjad+uvDHCBhJayMu0XSFW+v1yr2znpwH4m6OPCPT7CkHX75ptQyggZU9+h2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy05jfCJuZoyXNaG+R6bCjIsS7vscE/RgpSpWyV1xwcU7vl/y9b
	R+9QiQiHbunA2IHZBRiK8mMwlk+Hlb4onJVHDNWLrQHE+Q/KUksEy6+qt68iL9yzKGDMgAY7Y4G
	CPptjQA==
X-Google-Smtp-Source: AGHT+IGNIsVt310HOq58YI6qOaJU0R9CQoXTaCdBST5eb3fkgxzHsq57oQwvG8ZxTSrd75RDqwWjPK4h1541
X-Received: from edbin5.prod.google.com ([2002:a05:6402:2085:b0:5d2:727b:9b35])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7da5:b0:aa6:9540:570f
 with SMTP id a640c23a62f3a-aabdc8bd0e0mr21397566b.18.1734371889630; Mon, 16
 Dec 2024 09:58:09 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:47 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-3-qperret@google.com>
Subject: [PATCH v3 02/18] KVM: arm64: Move enum pkvm_page_state to memory.h
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_095811_655511_64471B40 
X-CRM114-Status: GOOD (  14.02  )
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

In order to prepare the way for storing page-tracking information in
pKVM's vmemmap, move the enum pkvm_page_state definition to
nvhe/memory.h.

No functional changes intended.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 34 +------------------
 arch/arm64/kvm/hyp/include/nvhe/memory.h      | 33 ++++++++++++++++++
 2 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 8c30362af2b9..25038ac705d8 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -11,42 +11,10 @@
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_pgtable.h>
 #include <asm/virt.h>
+#include <nvhe/memory.h>
 #include <nvhe/pkvm.h>
 #include <nvhe/spinlock.h>
 
-/*
- * SW bits 0-1 are reserved to track the memory ownership state of each page:
- *   00: The page is owned exclusively by the page-table owner.
- *   01: The page is owned by the page-table owner, but is shared
- *       with another entity.
- *   10: The page is shared with, but not owned by the page-table owner.
- *   11: Reserved for future use (lending).
- */
-enum pkvm_page_state {
-	PKVM_PAGE_OWNED			= 0ULL,
-	PKVM_PAGE_SHARED_OWNED		= BIT(0),
-	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
-	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
-
-	/* Meta-states which aren't encoded directly in the PTE's SW bits */
-	PKVM_NOPAGE			= BIT(2),
-};
-#define PKVM_PAGE_META_STATES_MASK	(~(BIT(0) | BIT(1)))
-
-#define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
-static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
-						 enum pkvm_page_state state)
-{
-	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
-	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
-	return prot;
-}
-
-static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
-{
-	return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
-}
-
 struct host_mmu {
 	struct kvm_arch arch;
 	struct kvm_pgtable pgt;
diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index ab205c4d6774..c84b24234ac7 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -7,6 +7,39 @@
 
 #include <linux/types.h>
 
+/*
+ * SW bits 0-1 are reserved to track the memory ownership state of each page:
+ *   00: The page is owned exclusively by the page-table owner.
+ *   01: The page is owned by the page-table owner, but is shared
+ *       with another entity.
+ *   10: The page is shared with, but not owned by the page-table owner.
+ *   11: Reserved for future use (lending).
+ */
+enum pkvm_page_state {
+	PKVM_PAGE_OWNED			= 0ULL,
+	PKVM_PAGE_SHARED_OWNED		= BIT(0),
+	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
+	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
+
+	/* Meta-states which aren't encoded directly in the PTE's SW bits */
+	PKVM_NOPAGE			= BIT(2),
+};
+#define PKVM_PAGE_META_STATES_MASK	(~(BIT(0) | BIT(1)))
+
+#define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
+static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
+						 enum pkvm_page_state state)
+{
+	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
+	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
+	return prot;
+}
+
+static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
+{
+	return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
+}
+
 struct hyp_page {
 	unsigned short refcount;
 	unsigned short order;
-- 
2.47.1.613.gc27f4b7a9f-goog


