Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89C9CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YW83U9WXzmuOgO+qiU2xntn4xO4oQspRqeeRLd3+Ago=; b=tL1N1IJiRn4eSlptLyHDBGvqH9
	7vW23wo83wzuXT29eIYF0yzjdJGQ/A355oeubvnLxdCJ8w7V7drBXcC9pQri2F9dS0a/9dXcZAylw
	Q8l5slBxXZhPiqG6TOWFCMvZCvKfJRbegueHI+7StdKFn2IMglIAPKFin13qwaJDLpRd5jhGNQmW7
	DorPHqGFF7vLqq8paruPpFG/+DYsHlUWB5YlgWgPP/Ok2263owFaaYXFSzGV9IaavUdKa7kAYn5k8
	F3Sq3KQIXGYGIod78JIKwUcs/wBCeJOXg5mhuaEcD6jAtnrfAEvZ/BxqqzrRHhtLcW2Gpda/awOQt
	EM9hPfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw4W-00000002nMl-09lv;
	Tue, 26 May 2026 18:00:08 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw46-00000002mxj-2WcP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:44 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-49043386b3fso40658255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818380; x=1780423180; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YW83U9WXzmuOgO+qiU2xntn4xO4oQspRqeeRLd3+Ago=;
        b=ny49P+1fUYz7Mavis1gOgUUtfrRWGULXoXEy2FgZuFEOivaOc54fUN6wcdCFsoi08c
         wzeo4vHHRV0vZQLoUObe7h4ybQhq0bjXbxevs45wRZid4sgkES8dzpIhYGcEESh2LXiU
         qd9QAtxCCWrWdKW4jyIgLD4WXwHLXQxDzDkCa2z/epR1RYOPn9lliApcQELeBjyUaZqM
         znhtF/JvcS2Vflyjw73MhDvRhGhZ6UCW5zCZOaOZLUmNd2VPIdHZtDWeUV1oeBu+ynI9
         3eb6uqhzjgcfa8dc3r2HSzWVuMxHAoZ09LZ7gjx2bw7sqD3aRHPRROSBDXmQz+oiK3g8
         0Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818380; x=1780423180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YW83U9WXzmuOgO+qiU2xntn4xO4oQspRqeeRLd3+Ago=;
        b=Ax6r0l/oZJKwufkLuX2VR8gPFTl17FTA6FlGUqE3D/O0hLbioXEvpuzm1zvKbI0Vl8
         4ULTan5xSWSbMWm19enJwVa76a1LSeVYVxefqW32YKjDi51+yjTN5Yz/pcBkmLwy7bmD
         6nguzBvmboYQ3F/6vOOyYWNgpTfFNFuNzQ0V2zHVpS5tpZ13qRmOwtLKiCO+S0lvxqqV
         SRexnq9iTULjmNaWJNG5KZlR9E7xiXv0IQvW4IZgdG60HgyRSlpKPPDkRul2yoLhG/vp
         PcKGOsU1kJia9IS3/zOryHZK+TmBFNkyZ5ZDoLxITdmHB9rV0j9p7EWraHL1xWqFTU5W
         tULw==
X-Gm-Message-State: AOJu0YyjTifMppehzKd5qi/j+RkpKtQd+ZPN4NDgyg0ZcRgGPO5E2Ilp
	F00nQ8d5DH2FnYmsBwK6TuAUDhLVfcJgL9oRPFoovwev0nflJ5z8r+vDzoWcQ1ltZWlAXxw7iIo
	WRKU9uStTEZG9AIWHdY9dxxcxlgCvRqTqgW39ArDRdgFFcN1ZI8P4+g0skX82nxgKRF1I02IcsP
	4JGnbhm7tdColZ1SJmUvQO4ltjgoh+VFpjnDFMGwo3aBY5
X-Received: from wmbet15.prod.google.com ([2002:a05:600c:818f:b0:490:3dc3:e5bb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c4a1:b0:490:3fd9:e78b
 with SMTP id 5b1f17b1804b1-490426cef8bmr337552265e9.17.1779818379722; Tue, 26
 May 2026 10:59:39 -0700 (PDT)
Date: Tue, 26 May 2026 19:59:02 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3044; i=ardb@kernel.org;
 h=from:subject; bh=yy+qAKwWsZGAcScio201064FyPP//0qmouvkE8IJvkQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fnaITtnLMqdFLhxOPsKdSl/fzf8vyMu45VaardtDA
 beLD6d2lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgInYcDP8lc9eXJtj5vLqXm5w
 sP0Cd7YzPcsCnzf0M7wXrV0bcOh0CsN/58OffBc4fZ3FmC48Z1Xn1KPu098u1d/xmnenxq61z05 +ZQEA
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-32-ardb+git@google.com>
Subject: [PATCH v6 15/15] arm64: mm: Unmap kernel data/bss entirely from the
 linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_105942_667093_D5DCA4CD 
X-CRM114-Status: GOOD (  18.88  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The linear aliases of the kernel text and rodata are mapped read-only in
the linear map as well. Given that the contents of these regions are
mostly identical to the version in the loadable image, mapping them
read-only and leaving their contents visible is a reasonable hardening
measure.

Data and bss, however, are now also mapped read-only but the contents of
these regions are more likely to contain data that we'd rather not leak.
So let's unmap these entirely in the linear map when the kernel is
running normally.

When going into hibernation or waking up from it, these regions need to
be mapped, so map the region initially, and toggle the valid bit so
map/unmap the region as needed. (While the hibernation snapshot logic
seems able to map inaccessible pages as needed, it currently disregards
non-present pages entirely.)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 39 +++++++++++++++++---
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e7ca53d20b87..cb00e42abbe1 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -24,6 +24,7 @@
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
+#include <linux/suspend.h>
 #include <linux/kfence.h>
 #include <linux/pkeys.h>
 #include <linux/mm_inline.h>
@@ -1056,6 +1057,29 @@ static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
 				 end - start, prot, early_pgtable_alloc, flags);
 }
 
+static void remap_linear_data_alias(bool unmap)
+{
+	set_memory_valid((unsigned long)lm_alias(__init_end),
+			 (unsigned long)(__bss_stop - __init_end) / PAGE_SIZE,
+			 !unmap);
+}
+
+static int arm64_hibernate_pm_notify(struct notifier_block *nb,
+				     unsigned long mode, void *unused)
+{
+	switch (mode) {
+	default:
+		break;
+	case PM_POST_HIBERNATION:
+		remap_linear_data_alias(true);
+		break;
+	case PM_HIBERNATION_PREPARE:
+		remap_linear_data_alias(false);
+		break;
+	}
+	return 0;
+}
+
 void __init mark_linear_text_alias_ro(void)
 {
 	/*
@@ -1064,6 +1088,16 @@ void __init mark_linear_text_alias_ro(void)
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
+
+	remap_linear_data_alias(true);
+
+	if (IS_ENABLED(CONFIG_HIBERNATION)) {
+		static struct notifier_block nb = {
+			.notifier_call = arm64_hibernate_pm_notify
+		};
+
+		register_pm_notifier(&nb);
+	}
 }
 
 #ifdef CONFIG_KFENCE
@@ -1189,11 +1223,6 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
-
-	/* Map the kernel data/bss read-only in the linear map */
-	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO, flags);
-	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
-			       (unsigned long)lm_alias(__bss_stop));
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.794.g4f17f83d09-goog


