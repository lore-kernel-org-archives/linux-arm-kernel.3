Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0CBCD5BAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jz5HVOoTF+6wyIXVi1PRz6mG2EpkE1nqqXU3A/HO1M=; b=Tou2oD1nDUKlHOyvce9m1Kb1js
	CXGdgRtBeegF6WBCexW5jiIdyt9BYJfHXUUwj3iS7HbosgQ/C4cZx1Vz07XyglPr9MxDfm5iC0nMW
	+cf7LjinZ4wPtcQ1Es5kSRbUA1E3qzzTXvuM2wxVXSEWfgxIxwYn0Xg+ttAkthNXqkVQ9RLZNAz3e
	AHhPL97FvyuXp3zfEYGfhkVkktRDVFLYDpD3fZI1rzDECFyV0nud9I/HDdi+yi42atR0OlRh4O0pg
	pzM33lw0R6ciaLUK4B8QghLqimw4oi0hsmbG0/GKgcDpIGDi1VKj0GvSzETxyLdJuhKZSq6wFAAEI
	LicKaEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDd-00000001yy5-04LF;
	Tue, 19 May 2026 15:18:53 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDP-00000001yhB-3i6S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:44 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fdacf2616so18324385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203917; x=1779808717; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jz5HVOoTF+6wyIXVi1PRz6mG2EpkE1nqqXU3A/HO1M=;
        b=ed3/FhwwwR8U2RZ/xGdlBSINV0PWR6dHrG/bvexR8qDIV0lPjiFqFcFi0bL+cnQfIi
         atY+r2vaoIb2c8S0zog39sP/nCQ74Vca3xu0AT29UBXTsQgNa598d0AmQdKDoRaQrG9u
         SeqxC1R8rbIKqs/Cd4jQkLFy0lzucyHrSHWOmmw39fzG/Z3Xdu/s0c0ZOzImgioNuNG+
         TV0A8VXwsqJByl2DBVQw3LQTlZnsiYvpCYzfhrIc8Mox3xGItdtxAjYjVXpaKHUZgbfi
         NIr7plfHGGLc6Fwc1LWLOxKK3+6nTzv0MCJgjvOmflbaNYqa6/6PaUfSbUk21sg3YYd3
         ue1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203917; x=1779808717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jz5HVOoTF+6wyIXVi1PRz6mG2EpkE1nqqXU3A/HO1M=;
        b=UYpHv+Eymoxwmg3sOF6S6jQw4TyXi3hwp+ieW4v1ufcJV6mhjpuEQerpA95CnlOQ9F
         fXL5BDoK4mDEVG/K4NkHW4r1CNHEI2cXpbcqoiXwvGcpDnddxaz2xDU9WzdqwwaEkkpw
         i4x+kaIqq45xW1UoAuYwEiuj41/pu9tD3jevB64PYUbqYjJfQYc9ljnB+cJZTJbuwr2C
         z/xCOS7B6LOlpgfwNL581HpgClE6ZbmBj9b1P8fwAOaXnzXbrkILraOtaNQdxdZOMiR5
         V+Afuw2omnL3ykKIrpeAcUWobxMmAeNi20qOj4KXt8Qm37aRiz2DEhqYkh23F33yk0Sy
         vwFw==
X-Gm-Message-State: AOJu0YytFhUM3o64gArD6xuB3CX6I0iPd72PyCeo3jEtpNVp4GYSvgoj
	+2irYpOUaQH4VJ0gkIs22PW4GonR+o2opnzngK8PI9EXiRFgPAvMTP53IViL0MVOgOyXJDizC+X
	HFE31ZsUZXFKWWYt5ydsCbAGPQZGs1BBE5g0wI+9CMcqQYLiEB+I1+643rbcIAb00xnEj2/Xyg6
	ai9dSfZRo03Vsz+mcV2rHEBhJxG8wC+5aCnHxhh88UPVwE
X-Received: from wmgb4.prod.google.com ([2002:a05:600c:1504:b0:48a:5909:4ec0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b27:b0:48e:7854:1608
 with SMTP id 5b1f17b1804b1-48fe6516b54mr287879475e9.25.1779203917004; Tue, 19
 May 2026 08:18:37 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:27 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2309; i=ardb@kernel.org;
 h=from:subject; bh=UkAnTwiseYdN3aottp779GEWC8HTyTdJGgqvssDeFDs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7oLF8bs37COMHj7P+n7snJGyv9rm41dMbMS8zptLS
 tXt/7u3o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExkZRAjQzevZ0Wao2BR6VYx
 Id/GxVnnL9mVyHGzz3i8hW3B1yMN5xj+St4OTmgr/7Gk+JVAuEzcFYW67LpiNmefmmsV5/P5Y/2 YAA==
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-25-ardb+git@google.com>
Subject: [PATCH v5 10/13] arm64: Move fixmap page tables to end of kernel image
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081839_950082_0AEBABAB 
X-CRM114-Status: GOOD (  15.45  )
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

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 10 ++++++++--
 arch/arm64/mm/fixmap.c          |  7 ++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e1ac876200a3..64c7bf4b7176 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -349,10 +349,16 @@ SECTIONS
 	_edata = .;
 
 	/* start of zero-init region */
-	BSS_SECTION(SBSS_ALIGN, 0, 0)
+	BSS_SECTION(SBSS_ALIGN, 0, PAGE_SIZE)
 	__pi___bss_start = __bss_start;
 
-	. = ALIGN(PAGE_SIZE);
+	/* fixmap BSS starts here - preceding data/BSS is omitted from the linear map */
+	.fixmap_pgdir : ALIGN(PAGE_SIZE) {
+		*(.fixmap_bss)
+	}
+	ASSERT(ADDR(.fixmap_pgdir) == __bss_stop, ".fixmap_pgdir should follow BSS")
+
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
2.54.0.563.g4f69b47b94-goog


