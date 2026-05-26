Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CCACD6E40
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqWf3aIh9jwoRDW7ej6OaYtUXPKSIApXmlGfcanpMS4=; b=hhDRArhK3z77M5Qj4ebtdkNZCJ
	HF3O1v0kxoxbXOXw11jKW2WjuHZW+mWY4Y5BaikmDaNmRTpWAtxjdnE4jgD1ke5YxBzwSmoLSaoTQ
	5hQEq/zuSRoR2AyhdVle77xeqYOLy64wYbNe2MvpWcHL8hiCJThUDASsbCseJWwRjN1fdIIrZcT8f
	jjcSDRdmiE2cwGW0icSeS8GoD8nzuVqQHYU/WjrL7zjGllY/dy0/0gRcBxouXZsjn1IkgRkvqlFq6
	n2MAxaH1jthXGxihczU8Tt01PTQbrVf0X/wZki7Tu5yc0ShRiiV1/8jHQUeHN89oa1tX3gcwLtLyt
	ckkWIxvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw4V-00000002nLN-05aB;
	Tue, 26 May 2026 18:00:07 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw42-00000002mst-34p5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:40 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-6794b459297so7109745a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818376; x=1780423176; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqWf3aIh9jwoRDW7ej6OaYtUXPKSIApXmlGfcanpMS4=;
        b=vZ0G5W4Na/sjDpkA43FDgYUa03REHGncVzYlYZkm5hfayNxfq1gY3dxNSd7r+Jvoq6
         scA7UlxmmDBsWtjXN/a1JWmD2UkI/gahyhqw9wI9hDhML+K6Y+Tphyieg/89PmDq68XV
         eXwXzZS+cxSkGvUQZMq9i0P1BPKUPKGGbWj6XkjBYixMqctTbzrQ6mMRsSclHP2RiWni
         fYB6p9EcipPRoVSgnoY4ma0VqWwcRF7I3vBMtwLagEFNPoRuB5uDPZLlI+MVrNMxvTlX
         aXjxXD8cdpBdBwvFB/Sv+8jcFbG+m0JmRh00ItRV7DB+keGtMhJgFagY9ScEkVvzLAM2
         dm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818376; x=1780423176;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqWf3aIh9jwoRDW7ej6OaYtUXPKSIApXmlGfcanpMS4=;
        b=F1peXQuKBu7W6uQYqpnq9eCJCuUzwDSZ5CPWzyiMjo6arzygoGZaw/omLAylCCGytj
         4eOA0Uzf4xabpOX5VeXp3NUplK2PsBI5sRFHL9mOkEvmGWCvLpdrj02h5QTFRBbULIT4
         apk294YdHkVEPWREUVqWGh9C+BrhWXXuHfFoq4ojGH1uN3o4Wd9uaawXrgXRwNgokWki
         3cfWDxQVvoekG6QYIcWvpgafMfvNKO31Km9yK4FaP/1Y3cviT0YXmgYvJ1f8EffPDLl4
         m9FA2A4zvujZ3lE8X7VYzGUSRrRdlj8LKzd/0fTc/yOWgZtlDRkOLa8IXkl5+i6NYejt
         o12Q==
X-Gm-Message-State: AOJu0Yw8OL+9x8PJzyOSBWKmr/cPifkjCvcfbE5UCvCDUPIJfpHEHuc/
	0v5e+N3VWpcyhkcc1lZqSntuav0n3OQbYGsCewcP6GSHAEUbU34SX/xvoDC6l/4wrn6IG+fcia0
	AYbIcRXaA7ZiXa3QbDnWxc1dfSFIrCkAoJIyKhNrcn53PVvdKX6hzDyqj8GMdAFnoJfqHJdLQAS
	QfhpwPliRJ7J1S5zwzNbHQRiZaC2NigrVz/SMWYU44d3Oj
X-Received: from edqv21.prod.google.com ([2002:aa7:d815:0:b0:67b:7c67:1fa3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4348:b0:674:5b2c:d42c
 with SMTP id 4fb4d7f45d1cf-6889c406b3cmr9914567a12.3.1779818376178; Tue, 26
 May 2026 10:59:36 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:59 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3562; i=ardb@kernel.org;
 h=from:subject; bh=UEzDYeArIhcNSC2frPncytSQGHg972cpOAqaWBBxbIk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fnq9X+pUBo2wreeSOJ9dXiQeemVxk13k2m0KUYbfu
 fQXzIvuKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPRzGRkWNkdW18r/eqia85v
 tUMNMXXf3V+K+oQl+nh/av96UvTZBEaGFv6biY3/V70q4frOvkbMYcPfR2skZm6tkJiyR9TynUs ZOwA=
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-29-ardb+git@google.com>
Subject: [PATCH v6 12/15] powerpc/code-patching: Avoid r/w mapping of the zero page
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_105938_826516_A0447834 
X-CRM114-Status: GOOD (  17.31  )
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
2.54.0.794.g4f17f83d09-goog


