Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BC8E69E9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VefaN+uYOgTsW1Gl3aOfwIF+ybrZqn9BRXod1CkyGg=; b=xtviI3rtT75BoSXEDEekFSMbvF
	NBWMlmBs65ftGMv7Z7C1bECbNMMkOxVIPxOb2P9UMghkxb5FTF7fsLhLmLrgB+yqI1g94Q/Eu9erx
	B+MPpiGY6Hj+xThKGOL0EfY15DFxP7SbEM4QoclSVWchOLSE7QKGQYp3qRxc6OM/nUQMnwf1ZGVYX
	3Jt3Q4O23ZW37Tb7mo6mxkO5SEPfgrLZdW+QHYN91zLk7j/kPsp2hafoAx6Vcsocn0lb5vBqMjaPz
	5gwIBUybU8JR5qYyaYW5AsN0K+mLJZv+jD6UX8TWOEJT4Zupe8GCR57zKqxvurPYuzUaVkZ4Uzn9A
	EG0ByM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQKi-000000096VM-2fjP;
	Tue, 03 Dec 2024 10:40:44 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQHn-000000095X1-0lD8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:37:44 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d0bd0f5ee4so2656134a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222261; x=1733827061; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8VefaN+uYOgTsW1Gl3aOfwIF+ybrZqn9BRXod1CkyGg=;
        b=HwhdBY8DpTX0ROnMl5vsIikl5QER1J4PxHmu4Tg4Z8uiy0bBzQbYnV4KB1VAX3x12X
         Uoij4M5vcPSrIZ+y/HxpQj6C2MMWqrIVlYz4F4UczEnXSDtmFENJqzfCKFKsBa9YK1sX
         GiLXTR0K4lsFkIu3sgMa5QB0HyJdBRRL2kLSR/3HYoHdAlah8cwXkT3dEH0Y90M2dQWo
         ruHlbPUVd8nJwT0WxW2h/QHkfILsVbq5Vr7YQ105+BgWNFEK2057YaQFwmWeexwr8ui1
         kDPXuJOQstqwcWfOiEyN47YwZjMMbdBFUsZS0zXeaFkG+NreUc1c3s9OV0jHeRbjxMdy
         P2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222261; x=1733827061;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VefaN+uYOgTsW1Gl3aOfwIF+ybrZqn9BRXod1CkyGg=;
        b=T40c6ebiB4t7nuQWqDERftgiiccmIY9TWt3jAhvh9zZK5EDjccQOfkwwF5EWmHppdX
         gVgLbjVB6DfkZxGOQ2os6npVMCrKQAtSC8HI2qCZmQRyM4EObEcCgvfUU+IN8nCOgsxf
         dGqPRnaD1+9AQ8/dMGEcmz27q7llyBBpQL8gDlzFfFNiSPPA2rOm9fMkvDuIaYbhlt3k
         igjQgLI/oc0W7YiqkjO3X7uQHoS8+AgLD0ZOwxcHwXo+alkCn7YxW3NgvDyUk+al10q4
         h2kTq85uI/buNum/9ktogiIkWRkKJT5DBDkBFhtc/TxgVKXln98ighs+HyJ+Vtpo/zug
         e/DA==
X-Forwarded-Encrypted: i=1; AJvYcCXDio1kzNsyNBg/BV644h7I0FNSxmSJjNQSAkcoyoDN/iHmzf5wLBraMfreULWvcB7CKFVE/U/qADhUliPIswto@lists.infradead.org
X-Gm-Message-State: AOJu0YxFiiQPPmhPiDrSHOTas24aY1MPnO/HMI1uoJ/XuVE4WhUUpWCM
	an+rPcqGTUn9sd4Fvmwf5f3OT3y2DaYX69JmNbgNluJbMErSXa2Ffk9Ck0HCnjsX+HDtRmgmve9
	Xcl3g6w==
X-Google-Smtp-Source: AGHT+IGE5QTCAH5U7r3oFdzIO1ntikDg2nD7iaMmA+2JXan6nFEy0acuL36E+ffU/jQD6HNvAgowxLrE1pEQ
X-Received: from edxa18.prod.google.com ([2002:a05:6402:13d2:b0:5cf:b86e:9cac])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:51d0:b0:5d0:d84c:abb3
 with SMTP id 4fb4d7f45d1cf-5d10cb7f906mr1537351a12.26.1733222261602; Tue, 03
 Dec 2024 02:37:41 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:19 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-3-qperret@google.com>
Subject: [PATCH v2 02/18] KVM: arm64: Move enum pkvm_page_state to memory.h
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
X-CRM114-CacheID: sfid-20241203_023743_221687_D54BEF66 
X-CRM114-Status: GOOD (  14.87  )
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
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 35 +------------------
 arch/arm64/kvm/hyp/include/nvhe/memory.h      | 34 ++++++++++++++++++
 2 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index ca3177481b78..25038ac705d8 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -11,43 +11,10 @@
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
-	BUG_ON(state & PKVM_PAGE_META_STATES_MASK);
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
index ab205c4d6774..6dfeb000371c 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -7,6 +7,40 @@
 
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
+	BUG_ON(state & PKVM_PAGE_META_STATES_MASK);
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
2.47.0.338.g60cca15819-goog


