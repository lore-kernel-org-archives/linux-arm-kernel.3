Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDC6E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvnjN4P6SkLUk+22h2Qqv7fPFdw/8dEz5PT/l7XI0hY=; b=nIiNSIQJzfFGd8wh1/ZkAW1u//
	sujXvYk5IvqOp6mHtKVdOThOdcPouXabWUgmKEDyIz/1BWR1JI59cccW59FY29UYSxKbEjbpDEPMH
	qJIPyrDZ/1YwXQzY3jA/McjnTmotUkvDhp1dPz6ROTOR9pzEsOwdl+ojGBsiZyIP1ANRZDGckFR+8
	8dGq6Uta06dS4N1FV226AyXTMPN7TvPFogJiRtQb2yA4/pLNC4ArCEqLUdgVeS/tMf4Xwq5d6hqSh
	8OUcE4AFr0DEXRc7EsVPayll0uu7W14nWzRBdMOqxfM9yLGZ77yyi/cffsOkkNfaulXXzeTFFc5qO
	382tp1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzy6-0000000HZ2o-1Hd1;
	Wed, 18 Dec 2024 19:44:26 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzuv-0000000HYIc-02cC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:10 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-aa6869e15ebso123481566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550867; x=1735155667; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KvnjN4P6SkLUk+22h2Qqv7fPFdw/8dEz5PT/l7XI0hY=;
        b=TqbUiA7B0BACvniSqtVImuu0qfFyoTbl82c7BXxNJKBbYd0Q3/0ozP+l+JxSguNpYW
         Xz/kiNPjSSiqzPcOH4gh2TaHllI4W9BiVs2DagkWsQTOeGOjvaCtwdqaVTb3fLP7Tq8K
         oWXLrcAXj/GfSCTQ4qUpLgcphDDqfs5tLouos+BVNCM2hjtkg0C7RX3WUAiGGggYU3U/
         HTx0DQe7wqM7GeH+ufgYwzm2AJ80capam+BY7oLhNS9ZdWd9kzFUfFYK9k6CCB6Zw8eH
         3Y3SN+FjuEjz/8LOIC8NqAcbZPraXJ+pFSGtmxRLCPhwEwVP9OG5ZjOL5RQIy9Q27VNp
         tYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550867; x=1735155667;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KvnjN4P6SkLUk+22h2Qqv7fPFdw/8dEz5PT/l7XI0hY=;
        b=wFFJsv/3xSRfo0hzzGuSzlV22IG3WTtrSlXxa4UddEt5Opl6jb0kWHhf/rUXYyIinu
         rE8v1/UoPpWSriWpYOj0FaBAqbnpxkjTfEH5vkzBXaCoR1Fu+ZGOIwQ2nlBgsxPI/1/Y
         nmGFRSVzqDPBAWCaEAmJFWuJgj6BnSKWeOLo+rVdI+wiMsaPXf2tuHTPhYDj4xyHPNmu
         562fVv4bKOT3AmkhPd0fDTt4b5ZxgU+IqAgjofI3X727N04qKfRh3fo54hSePYOdOqwe
         iIPyC5p0MMB+KJyumfohlmAJyy4az8IBsx/AsUei++k9hy4/4DuFw4xF/er5Mi8ajFxC
         T5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVuE01tydGkk/F9XhHX5ywF4kwOku2U9Jukm6cI2VIc0F1N2AgkTX1SA/Qfn5y7yxER+0A4sgqRSabesD0QnRV+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8CFnkIFMQnzEsniqmBjvSavdlg+X6z5RQz883mVp23+cj483G
	QAmp+xc5Wj9A8jNVdEGCCI249MiePs104VHiASAC393EYAPm5Yd19scq9n8f6cCD7QROC9dUebn
	sngdy6A==
X-Google-Smtp-Source: AGHT+IFzaab4WIj+uu0eFb5+RqKYGg9wSGHkRG5sqXUBPbPpIpzkAXtULFRuD1TiGRf7/yopTJZ+yFFS1fDj
X-Received: from ejcvw10.prod.google.com ([2002:a17:907:a70a:b0:aa9:1b4b:489d])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:c23:b0:aa6:8096:2049
 with SMTP id a640c23a62f3a-aac08147180mr54742866b.13.1734550866770; Wed, 18
 Dec 2024 11:41:06 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:43 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-3-qperret@google.com>
Subject: [PATCH v4 02/18] KVM: arm64: Move enum pkvm_page_state to memory.h
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
X-CRM114-CacheID: sfid-20241218_114109_052717_AFD58734 
X-CRM114-Status: GOOD (  14.31  )
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

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 34 +------------------
 arch/arm64/kvm/hyp/include/nvhe/memory.h      | 33 ++++++++++++++++++
 2 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 5462faf6bfee..25038ac705d8 100644
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
-#define PKVM_PAGE_META_STATES_MASK	(~__PKVM_PAGE_RESERVED)
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
index ab205c4d6774..0964c461da92 100644
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
+#define PKVM_PAGE_META_STATES_MASK	(~__PKVM_PAGE_RESERVED)
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


