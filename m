Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547FD1098795
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjGy6iI8Lh1+RRlATGg4ihT8EoGsIDJChLyr1UIJtV4=; b=15sn8otnhhfAFGp1ydt6zRlUIQ
	x8wlAbRylTg/E1klgMIREY284D13wbtnMSAz3t+1IBuMJfYB/jBKxlFLaKmIhjHGidsvHqBUoE4Bo
	PTU+ldVtcvjKQwXzSzIOzPOPao+WqRUIu5Bb5xgi/VhYQoKiJ+9wkP9rVWhiBGEPrhcl9Ls5PWGkH
	UZyWtjacK/mnIsMmhS6bVUFAMF8LKyyicaiMID6reGeEhPlWxQseQ1Y2x9fGeT9ZzhEL8Egg6IixJ
	biih33UkBjP1rmfgvuWU0id0supfnobkaHQ17WgqV+W5mr3Xg84sFTJNjXq6NW5B4+kcDBXF3+lD/
	nxanULow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKy-0000000Cyqj-2dqI;
	Fri, 20 Mar 2026 15:00:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKd-0000000CyVF-2ZFJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:13 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4853a9467c5so19132765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018809; x=1774623609; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjGy6iI8Lh1+RRlATGg4ihT8EoGsIDJChLyr1UIJtV4=;
        b=neAXbzncd8Wo9bHLPyJOd0+wrQFyy1+0k8ut70pJU+U7XoytCpjodCKDiL4oU7VhKG
         4/MOOMnhEmwjyC3f67RnH2NYtozpbnlUzo4f0tvYqUMrlFqBENh+kKW8fWHxFXfHoXXk
         ofIg6lQmcSWyQvtLGWMniHUZAziExr3R8s36FuYsaOlJqr+ht+nlBZ3kGrJlh8g8Nskb
         PWEKizHJhVlu2lad309K3Q0lw6KCvrXIUccvhdSpO6KkiYroh331sYU7hf4cHDxyXNkc
         SI4LzcK3vPj76XfX/hxYC54ztA5DMRNFOyXs/LUD2hPUY6okx16IYSzzI0DBIXsbYDwr
         U6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018809; x=1774623609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CjGy6iI8Lh1+RRlATGg4ihT8EoGsIDJChLyr1UIJtV4=;
        b=kj3O7ouC4LuBr6E6JvaC4IoMoeQA4dRBQvWJDhSeNdSPrAzQNdhdEicK4g5VPCd7UN
         P8VJLImMmr1Rv+Zl3dXD2TxIz5ZqS+hMWWMLF2td1XsE2gvh9gk2UDi2+vNSEZFKohJV
         8YXTuA1BBJQZirJDl0r4nW7RS6E5m+CnVnNXMfcX+h2UK/IsoYN235sREpt58jQMyDJF
         zYNCz408IomjbcXF7J2R7SWsszV9D5Ub21uVEiXSyZaypKqVuutrkC8nPsI7cmnZAJHK
         9D1zf95K9w+VxywkLBN2vZQWHC1vTlJxmr2TWOxk3CeiS3QcgfJXcC4QFWbCVEkFDnIu
         I+kQ==
X-Gm-Message-State: AOJu0YyQ3hv2JIdoqvgFRUJzr+b0ETBp0HyAzPUJ8ViAfW0VkGxnSDe6
	bIEG6b4Vg7REAnDVoaxn3iH/VrvgzFPJZVc25OJ5iqLoguryKwgPBcbFeXSa+0IYwZJi8+hVmA=
	=
X-Received: from wmro18.prod.google.com ([2002:a05:600c:3792:b0:485:3f57:3523])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c48f:b0:485:2a85:e5ec
 with SMTP id 5b1f17b1804b1-486febb60c6mr50654835e9.2.1774018809101; Fri, 20
 Mar 2026 08:00:09 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:45 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883; i=ardb@kernel.org;
 h=from:subject; bh=Tdi7XhvZoK6DyplxF9vlkCNhMDHkkf+zkyeuXcEumuM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwhMJ6eNTvln2M575eF1IP7qYb3vbFKfHNqy3N/jId
 d+5fOdzRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIrQbD/7LHP8Je2fJcfpVk
 dpgv73/XeeYJrRf97U0O6DhwrL3CspThf3Fi7Lk6pYKFkV9/vA9W28FQfbjy7fHJoh8antZMv5h mygIA
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-25-ardb+git@google.com>
Subject: [PATCH v3 10/13] arm64: Move fixmap page tables to end of kernel image
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080011_697490_E707602D 
X-CRM114-Status: GOOD (  13.47  )
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

Move the fixmap page tables out of the BSS section, and place them at
the end of the image, right before the init_pg_dir section where some of
the other statically allocated page tables live.

These page tables are currently the only data objects in vmlinux that
are meant to be accessed via the kernel image's linear alias, and so
placing them together allows the remainder of the data/bss section to be
remapped read-only or unmapped entirely.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 5 +++++
 arch/arm64/mm/fixmap.c          | 5 +++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 2d021a576e50..282516def39c 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -335,6 +335,11 @@ SECTIONS
 	__pi___bss_start = __bss_start;
 
 	. = ALIGN(PAGE_SIZE);
+	.pgdir : {
+		__pgdir_start = .;
+		*(.fixmap_bss)
+	}
+
 	__pi_init_pg_dir = .;
 	. += INIT_DIR_SIZE;
 	__pi_init_pg_end = .;
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index c3dd3c868cf5..30aba998cf38 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -31,9 +31,10 @@ static_assert(NR_BM_PMD_TABLES == 1);
 
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
+#define __fixmap_bss	__section(".fixmap_bss") __aligned(PAGE_SIZE)
 static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __page_aligned_bss;
-static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
-static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;
+static pmd_t bm_pmd[PTRS_PER_PMD] __fixmap_bss __maybe_unused;
+static pud_t bm_pud[PTRS_PER_PUD] __fixmap_bss __maybe_unused;
 
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
-- 
2.53.0.959.g497ff81fa9-goog


