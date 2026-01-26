Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF549D74EF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ir5Ku/kBhV1xo3f4cYFTds8Jwvu5+ARQt7mXP3/a2YI=; b=bSOxGQ9s0M/k5nz+0xbYHgByTx
	3YLxUHz6KQjEqs3u/2BDl7FVCiKKNnKtVvABSGiDEtecwDxqzCEaVonMXDnP5QqDX4Esok2GPZ77G
	HEyA2WzYgVKG204Oji4P1PY4EXixuwOyShRXeSSTf7fdkQif6fOooDX/1eTo4G8sbaVzNBR5L9H92
	Hi4NxUNqzhoHkcI/RGxJBEOAya5HbdNnZKlM2QN+KxizoMjYzVAnrxqUU+KxMo7jSdncbrVa8RrWO
	YY6CHTM49YjI7Fo1VAwFfZ24FrhpXWUCY9BEtOefVJ5qXTRu6sKw9VRk05jNK1jKq3Id3L6VdRy6n
	T3Tv1YmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsp-0000000CC3v-480n;
	Mon, 26 Jan 2026 09:27:43 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsh-0000000CBzA-2dnQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:36 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4803b4e3b9eso34378265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419653; x=1770024453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir5Ku/kBhV1xo3f4cYFTds8Jwvu5+ARQt7mXP3/a2YI=;
        b=mqQiGltbPEZFiaacPn5LaLRTjGf9HKJvaHrlvp3EeYU4P2lUcWYzfDTAd9iVpeQ9Q+
         iC7gSCqkyJYgF/HUvbEElMxm6d0HtmFyJ0qyhjNN0H8gC1p6Ps4n8JRkfUKaiX6sYsuZ
         /o6El8GDWK3J6Cb9/hE8oNqADOGgeunJJe5FnkffUbhP8a6DFx38sqS++FF4duROV6PT
         aZs2LaN4jnWs45yNxukCIYEgaRMVw11CjUt5OXyJ9UBlzjzzF6u2AiFcnS50fN+P6lAH
         L1407CnOhz09kt2GeiJDRPRqpUoezcGhnVoEeDGgO52e0ZhfPmn/lR6twLp4bVrbsrwn
         buXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419653; x=1770024453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir5Ku/kBhV1xo3f4cYFTds8Jwvu5+ARQt7mXP3/a2YI=;
        b=h9etwo3napdMBakH+WlE5U41P5Z6jnrWEeFv6ZaZrty0QuAaKPsnRxD8e/BVeYaaz8
         Zdpwoke6+9ShAHj+SuLvZHYuF4VcW3j2ggqWZDUmPReGLvk1hjVQDUcG50OTbk+ZKJBj
         yn8JXn81BbJbS3pBHILLA1FtUZS/i8sbZkzcwUZ0QH6dOunDFa12kxNeICYcPqbFeHbe
         artRzF89noC5k4QciVnKbtzhl3ovPqmA/5IGLPnwJNuGySSZZiNxEGGq2ZxU19blLNZ8
         k34lo/Xeg0bcwtreXAcUyy49JylVsmsUnudNjhD44qHkxkJmQIsK0li8Sedhswv3iLg1
         1Qmg==
X-Gm-Message-State: AOJu0YwdWjS+KND+oi+sWvtiSkz0sFOlPdBm8+RpcNmEABzXSR/csiLy
	MgB0YSjyBPCdNM27woU1Kyb7c+wqu18ugKNl4M04UhtWQfIUHc7WjHvDqMRj9uN5qhxtMm0dBw=
	=
X-Received: from wmcu2.prod.google.com ([2002:a7b:c042:0:b0:47e:e4a5:c5f2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a08c:b0:480:3a72:5c10
 with SMTP id 5b1f17b1804b1-4805ce4f010mr77377385e9.16.1769419653485; Mon, 26
 Jan 2026 01:27:33 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:33 +0100
In-Reply-To: <20260126092630.1800589-12-ardb+git@google.com>
Mime-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953; i=ardb@kernel.org;
 h=from:subject; bh=pPbGakq4Y87FHZEohxgZxqjL2z9m2SzmfynlW86oFBs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2OPan3+7fij8ksibeLlIhSWt4tJNvstbmdqFDO+zh
 Vs5Pm3vKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNJ1mL4H17OOzNlTmVlZV79
 +YvKLROfvd2wtjzTXW/xIa5XnZcW/WX4zb5FfJ5ThmXau6Mv2BbW9E99PtvpwHdeVv7LhyP8mrK 3MAIA
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-14-ardb+git@google.com>
Subject: [PATCH v2 02/10] arm64: Move fixmap page tables to end of kernel image
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
X-CRM114-CacheID: sfid-20260126_012735_760059_E763B7A5 
X-CRM114-Status: GOOD (  13.75  )
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
 arch/arm64/mm/fixmap.c          | 7 ++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index b2a093f5b3fc..c089b83308a5 100644
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
index c5c5425791da..b649ea1a46e4 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -31,9 +31,10 @@ static_assert(NR_BM_PMD_TABLES == 1);
 
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
-static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __page_aligned_bss;
-static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
-static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;
+#define __fixmap_bss	__section(".fixmap_bss") __aligned(PAGE_SIZE)
+static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __fixmap_bss;
+static pmd_t bm_pmd[PTRS_PER_PMD] __fixmap_bss __maybe_unused;
+static pud_t bm_pud[PTRS_PER_PUD] __fixmap_bss __maybe_unused;
 
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
-- 
2.52.0.457.g6b5491de43-goog


