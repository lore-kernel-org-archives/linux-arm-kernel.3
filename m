Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E327CD132C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKkm6+349ykGA9NvXy7LF0BQjMAqTfQ2kTd431L999Q=; b=tsVhleHN24J/aqHeYr0YwFcShu
	NC314aRL8SgrGAUwJEMbuDrPSKthi1YYEDDBSMoHXgMBdVMtM44BQxtb4SU47yX28Eu+rNZh43YuX
	HU6JywACHN3yOCx+OOAxqyWojBKPAfjUzacFUQftYmCvmPAqZUc6dgeyhvLa7V00UUtXjtCxYBmNi
	Vkfx3yscmaUauiu1bT4pWoEHkPBRdBblNwen02cW3m41hJwd+vtr2R+gv4vBryzt9w8FjE2Kzf7gT
	QSx4eSwITSnV/rxZCiD4TMdIBrxYCgrcrCAzbB4TESQQOElpLRsHp4ReXwasPFfaOTFhhgr9Ht/9Q
	ojszrajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xNC-0000000DvGk-3rbl;
	Mon, 04 Nov 2024 13:44:02 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xBm-0000000DsH0-3cJG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:16 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e3313b47a95so4415820276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727133; x=1731331933; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PKkm6+349ykGA9NvXy7LF0BQjMAqTfQ2kTd431L999Q=;
        b=IUkgHOq9aq5ZQw6eIBC2Wt3R7j9XaTyH7Pvb1O3x9jT6rL7hYBoR/QeJwtxvXiGyJq
         vMgIiL6SfdtREdqni+/uNq052Oo+LPxivmCNi07bCowIGlnv0KU1xf41+cptqX0KHB5M
         Mcxvw7on9NhTF78MjNNJphX17qxNDW/gJzzxYPAhdgmTFWMg/ZskpOEPlXN93/fcUMb1
         YA7n8DGLxTIuH2EUAOujqstUN2a0qo3wJKJqXATY3TtdqoZzU7Jo9R5Ngb6WxoT+pSnu
         VuVVlwl+DQfSuCzInabKa4yXwgsS0f3u6O0iOlx+/Llr/F7GsglhbNXnh1jKnmRQwHE0
         MHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727133; x=1731331933;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKkm6+349ykGA9NvXy7LF0BQjMAqTfQ2kTd431L999Q=;
        b=Mf06Epsb0cTqETrPSanv4JB1VfV3qQdBaGF01BEiamt41Adqv+98e+pU2Z7Upv3aiW
         960OoCgMtpgYM9KMoRm5Pjn4qZDNiJ0xDegCaFVJLmn1rUIdTcjxKfBPmqFqbdx9BBek
         4igVuO6PzC9wTR2Wg4o+P1BtDSEGG/i01TRE7bQc92ArCHyECMhD/1gFpymaK2C/Gf1w
         4LswEU0dbIZZ7MyLVFlDe81WxPIZboUxRs9kH8KsWXvv8s5RVsixqeO7XJTNXIRm/7ZK
         mQGHCDKBXt9T+0OgzyYbf1BEk0zLct1hGSwXkv37MRl3oxtQy5ErCgsH4gQWdlntHsmi
         h0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXWtOF5IKuQJKnu0I5WJ6v4LwYc8gPIZQ5G0/ecdIhJ3lm3Ll4mEAwV35AZsrDhImVWMx94xzOF0P//7k4e93zW@lists.infradead.org
X-Gm-Message-State: AOJu0YyriK3m/hdZlbEpvVfuinS2RaqufXCLZ9co3WSqzorE9P+w2lUK
	lKSOLecFe+vjMTmQkFaJ8sGfHGy4mQuGH+F046EwKj0MBuPFQXAKDglM3HCFsHw4hI+I/c1xPx2
	a2NbcGA==
X-Google-Smtp-Source: AGHT+IEeIacQkmxOu92UwsFG/d4mBUfXOkjaaTFyk9RQX+gm0U4bljU3gFu+U2mMY/h3tB6h+FVJRJ+qoRNf
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a5b:f0f:0:b0:e2e:2cba:ac1f with SMTP id
 3f1490d57ef6-e3087bd5414mr144751276.6.1730727132285; Mon, 04 Nov 2024
 05:32:12 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:48 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-3-qperret@google.com>
Subject: [PATCH 02/18] KVM: arm64: Move enum pkvm_page_state to memory.h
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
X-CRM114-CacheID: sfid-20241104_053214_923412_B6A71540 
X-CRM114-Status: GOOD (  15.07  )
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
2.47.0.163.g1226f6d8fa-goog


