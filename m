Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3FBCD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ic2DGsrtEHhUHaDXXEd0q4Y8zWmRk/iCag+la1hIg4=; b=KOKBzpgi9gZXGZINRpF1szLom6
	pxhXCkCJ+h4JudsOfJ5h2HcCyIVbzhguepa6+4362/9KPdqXcpK7g9OkeM7L9BD6l8NZpHUvEkibt
	aYS/lU9wx099T7lvgwav9sfNP0QzRCQrqRVB01vuYHerDpHquMGzier8MlpKIq/wyVplKtoANW4m2
	JF/lp3KzRW+o8xYspPWjOyw9rptqfTSer5wqSZS7nVoJCfu14hPdz/CtwzzJd0TstpBguXgAE9PPx
	g4wv33jEJwNjvZZ5sWPy7mRVOYsVJ9qtHDJOTmwF5UqQWEbsDjWE/pS4SAw2AvYUv/xOTEV7hx/1f
	RF0CHZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjQ-00000007brY-1cGE;
	Fri, 29 May 2026 15:02:40 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjL-00000007bkC-2MVL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:37 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-bd50f081f72so203558766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066952; x=1780671752; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ic2DGsrtEHhUHaDXXEd0q4Y8zWmRk/iCag+la1hIg4=;
        b=G6duyjxDwaxlZ7i9e94CQele3r62Wl5H2aRe6FHH91mrGSXm1UyRGVgoFkheRy32fb
         dIdsjBQr2ZdNktaWvo/oVETCCLuU05P/N729oGsIZ1InInSlzUhBs/nky/kzJjgbe6RT
         CipqhlZBgJdTtJBrh1+wYXxr+pvuEYtWVMhZA4jyU2LpxUNr/MVB4LUNuONZgXwiyj6E
         r4KSQXQuPFLjRt7GayizY+B85XENgolgtQoSkgdmE4dcK0KwqszTbgeFuyceUujJVsrx
         FNuKLNBJpzFBucYDO6U9LJrUnKjL5Quqs7eWhmobdMLxLpOa1uYZPq3bANzqpWeL6UJ4
         NtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066952; x=1780671752;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ic2DGsrtEHhUHaDXXEd0q4Y8zWmRk/iCag+la1hIg4=;
        b=nKhsryO2IwYqpr/yMaPxuoUNG28BE7OJw4x77rckj+iArJmYY7qa4PaP5OBEP4u04C
         +SXXy+fM2V65veippzodX1S+StIUADp/gIYi1k2jinSAvg/TpsynauF0oLXxZ/jAf0T6
         oMPfqywzV5mE2TC1ixjMbvnbsM72KKb4CGiJmRkA7Uq9jU96te/pdccacQ1kIRHjBpv8
         RZSykbI2iTg9IOlhk5WUFi4Pqok48qf3Fsfg7lguOor91Zk8n5rBO4baAnU2lIJ8Fpxv
         piS6z8QSPEIG6UHVw51HV0/4hJjnK/5VVRbIq/sdx/DuuoMdx31S5kEdfxRa2RCn570T
         /Adg==
X-Gm-Message-State: AOJu0YzUEeGKmJIhYq44rgVLkKksN4hSddnTOh0Tk8DCvDa1CgCXZPkT
	9IPi+3go+COWIIW0JcPgK7coOgWjNRwutvIZbJaJ/e+YijCpAmbn71OYeW63m52drx0AUioUcsx
	nOLiz4C9FtEIgJj3FoHikgX+0nFLqyKnh6tRWWv+8mzmYFsydGGDIeehH6ZRHbtjxODpilbvglc
	/LFW2UKW92rtQ1xeJY+iGE9494DKasfFVnXlFlMaWw9vqW
X-Received: from ejcdp16.prod.google.com ([2002:a17:906:c150:b0:bcc:71b:965d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:846:b0:bd5:7c2:7622
 with SMTP id a640c23a62f3a-be9cce79583mr206170566b.49.1780066950536; Fri, 29
 May 2026 08:02:30 -0700 (PDT)
Date: Fri, 29 May 2026 17:02:02 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3562; i=ardb@kernel.org;
 h=from:subject; bh=ubRBWkWn2UVZmjj/MlvsEvyHLMfMbEt4k4F760d5eRs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVY4k535dO+nZFlbOfzzdd/L8Kc16wKgvUGy0L8C+M
 NAkc31HKQuDGBeDrJgii8Dsv+92np4oVes8SxZmDisTyBAGLk4BmMji6YwM9xVOLdQXVDy63md1
 QcOOcqYQ72WntJ6eyrZNi+loev33MsP/3BPHG8Off7zik3rM8U/Y17jQr64tKe5X7+RwlEXo3Rb gAwA=
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-28-ardb+git@google.com>
Subject: [PATCH v7 11/15] powerpc/code-patching: Avoid r/w mapping of the zero page
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080235_635241_ADE3988C 
X-CRM114-Status: GOOD (  16.91  )
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

The only remaining use of map_patch_area() is mapping the zero page, and
immediately unmapping it again so that the intermediate page table
levels are all guaranteed to be populated.

The use of the zero page here is completely arbitrary, and not harmful
per se, but currently, it creates a writable mapping, and does so in a
manner that requires that the empty_zero_page[] symbol is not
const-qualified.

Given that this is about to change, and that map_patch_area() now never
maps anything other than the zero page, let's simplify the code and
- remove the helpers and call [un]map_kernel_page() directly
- take the PA of empty_zero_page directly
- create a read-only temporary mapping.

This allows empty_zero_page[] to be repainted as const u8[] in a
subsequent patch, without making substantial changes to this code
patching logic.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Link: https://lore.kernel.org/all/20260520085423.485402-1-ardb@kernel.org/
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/powerpc/lib/code-patching.c | 52 +-------------------
 1 file changed, 2 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index f84e0337cc02..44ff9f684bef 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -60,9 +60,6 @@ struct patch_context {
 
 static DEFINE_PER_CPU(struct patch_context, cpu_patching_context);
 
-static int map_patch_area(void *addr, unsigned long text_poke_addr);
-static void unmap_patch_area(unsigned long addr);
-
 static bool mm_patch_enabled(void)
 {
 	return IS_ENABLED(CONFIG_SMP) && radix_enabled();
@@ -117,11 +114,11 @@ static int text_area_cpu_up(unsigned int cpu)
 
 	// Map/unmap the area to ensure all page tables are pre-allocated
 	addr = (unsigned long)area->addr;
-	err = map_patch_area(empty_zero_page, addr);
+	err = map_kernel_page(addr, __pa_symbol(empty_zero_page), PAGE_KERNEL_RO);
 	if (err)
 		return err;
 
-	unmap_patch_area(addr);
+	unmap_kernel_page(addr);
 
 	this_cpu_write(cpu_patching_context.area, area);
 	this_cpu_write(cpu_patching_context.addr, addr);
@@ -233,51 +230,6 @@ static unsigned long get_patch_pfn(void *addr)
 		return __pa_symbol(addr) >> PAGE_SHIFT;
 }
 
-/*
- * This can be called for kernel text or a module.
- */
-static int map_patch_area(void *addr, unsigned long text_poke_addr)
-{
-	unsigned long pfn = get_patch_pfn(addr);
-
-	return map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
-}
-
-static void unmap_patch_area(unsigned long addr)
-{
-	pte_t *ptep;
-	pmd_t *pmdp;
-	pud_t *pudp;
-	p4d_t *p4dp;
-	pgd_t *pgdp;
-
-	pgdp = pgd_offset_k(addr);
-	if (WARN_ON(pgd_none(*pgdp)))
-		return;
-
-	p4dp = p4d_offset(pgdp, addr);
-	if (WARN_ON(p4d_none(*p4dp)))
-		return;
-
-	pudp = pud_offset(p4dp, addr);
-	if (WARN_ON(pud_none(*pudp)))
-		return;
-
-	pmdp = pmd_offset(pudp, addr);
-	if (WARN_ON(pmd_none(*pmdp)))
-		return;
-
-	ptep = pte_offset_kernel(pmdp, addr);
-	if (WARN_ON(pte_none(*ptep)))
-		return;
-
-	/*
-	 * In hash, pte_clear flushes the tlb, in radix, we have to
-	 */
-	pte_clear(&init_mm, addr, ptep);
-	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-}
-
 static int __do_patch_mem_mm(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
-- 
2.54.0.823.g6e5bcc1fc9-goog


