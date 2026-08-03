Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC952C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zR9oDzMDcMKYUFVT4DN1XNOjKgBHljylO6h0nbDmjLQ=; b=BhXokCPmMtY0JxxlFWR7+fSoRj
	yhf8KYj1lNO96P6D3TZBUCuDWmSXrtGp/4c8Vn5zjTLDsPJTFQTFVjJylSkPuo5bn5iIORjVvj3+2
	5lbXhoNNf1H6rmmTgk/5b7L29YTXw/oEw3iJ0EG5QSXXI9kTlcEuRbSgLAO3aABwUPMpNGLBcsZ84
	x7/LNsyKM+sPshRQWH2nHctSkFjYAzgOyRGDGaFpnauG++akNjGZSoKU/3pMCqcBX7jkb5OP/jCAr
	MW1gGkWhzJwLT+W1vJ0vsRgJodTOlx4NhrO0iSpR0QejuH8Hofm+TeRaLsxw1rQLHzTR2+Eds/EBA
	pzYcrT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvbw-000000005gr-0ndU;
	Mon, 03 Aug 2026 16:33:56 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvbu-000000005fX-1934
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:33:55 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-698aa8bd688so3817066a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785774831; x=1786379631; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zR9oDzMDcMKYUFVT4DN1XNOjKgBHljylO6h0nbDmjLQ=;
        b=Vs+/Ls3xoKmLTWIX/uULOMsCG9PCEnff7q9DNsOFKg4NuaQkcvccgPWKMGLhdIrv7v
         uIxTN2vrc3jeFotBN26UxBd8U1tRtb5SSbcSN1o3CY67HlwPm/Zjq369sQZYLUY95uon
         xzLvgkp1zguti32SkVk9zxqZ1v1pYnmSgg6NnN60kO7fSTkARuGwbP410+kHDZK1B3dy
         Z5QZ+h/DaOxXH3U7YdvFjSQhzzBS3gqIICn1mkjZNVgDIQ0yi3eZZpHbKiudnrVqknAp
         pMSKKlH20SXhYvwGPcDLdzwIx897zmUVcIWE9i7qKeoly8NOaGfL/iB9niy2is/sJkKV
         QAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785774831; x=1786379631;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zR9oDzMDcMKYUFVT4DN1XNOjKgBHljylO6h0nbDmjLQ=;
        b=Tk5Vuw9lsx/Lyui3nrSmHaGu00NThcyPWM9Xyr2xAgw8oPLUyLnFVo/G0pxCW7Oy2f
         CT1VteeBvvN/MtyobX+nL39iHruN63kDlhX8pJU4AGEzuGY/EB2LH9l467vM0PbJeU4i
         vQsIQ6ji7JVeUocYJS5kn8dZ9R68Hf8pyHCk06QM37fVNBfqYIEPxMHyh7WH9sdPFxkV
         QflPAjPHjV71NwMh++sEZyff+z0np/tvd9RgaL2EHRqzZnE2aAZz6VlHfJQN3vWe6I2O
         vF69XDAVFvDdY287LOx12Ymn32p2hf6tXALlAl1h+sPdx5f09Fernb/qxhJOAiiCY/qd
         6RVw==
X-Gm-Message-State: AOJu0YwyRQK9n6LoVozB839IJlLBM2DhpiDekBUBIz7p4dCs4njuQ9cf
	GPkND811hKPcNyB9nhJ5LcXw6fhBuDoEhO6Fr3l4yv3FTLUB6MKUX0VhaNYrnD2uZZVu32OrMzL
	z40Em1B9uzJdvjcq54DktqZdM1w2xNFJ8Qm0tIc7+8Il6bvs1RY7z8d+VtMMWGe5C9q3kVdrE9m
	YNDxN5FkS/ap5Hy7w6cSrKN5az9zM+WEco2AutbvnXZ5E4
X-Received: from edwb26.prod.google.com ([2002:aa7:cd1a:0:b0:6a0:7da0:71f0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3250:b0:6a0:eb:ae41
 with SMTP id 4fb4d7f45d1cf-6a0a7c850ffmr6655991a12.10.1785774830337; Mon, 03
 Aug 2026 09:33:50 -0700 (PDT)
Date: Mon,  3 Aug 2026 18:33:47 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4766; i=ardb@kernel.org;
 h=from:subject; bh=NIT2kcRKD8Q3W+uSn8dGhpBCDTtJ92Sm2lPORvLAoVI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIavg0OvUTo580+Q/SprHPSTed61eK3I6V4zvmGKXOPea1
 +4dl193lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgInsEWJkuLk0JfTzFb/41uVn
 ZoZp3DRbErftuWjSa9F5Tu+Eorxdwxj+6b1qjXGc/VLn9p+uoBmf5Y/0/nksruOr/fJfZZBLT8I KJgA=
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803163346.3490089-2-ardb+git@google.com>
Subject: [PATCH v8] arm64: mm: Unmap kernel data/bss entirely from the linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_093354_357187_07F734B9 
X-CRM114-Status: GOOD (  24.08  )
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

The linear aliases of the kernel text and rodata are also mapped
read-only in the linear map. Given that the contents of these regions
are mostly identical to the version in the loadable image, mapping them
read-only and leaving their contents visible is a reasonable hardening
measure.

Data and bss, however, are now also mapped read-only but the contents of
these regions are more likely to contain data that we'd rather not leak.
So let's unmap these entirely in the linear map when the kernel is
running normally.

When going into hibernation or waking up from it, these regions need to
be mapped, so map the region initially, and toggle the valid bit so
map/unmap the region as needed.

Doing so is required because pages covering the kernel image are marked
as PageReserved, and therefore disregarded for snapshotting by the
hibernate logic unless they are mapped.

Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Liz Prucka <lizprucka@google.com>
Cc: Seth Jenkins <sethjenkins@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Jann Horn <jannh@google.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v8: rebase of the reverted v7 onto v7.2-rc1

The reason for the revert was basically that map_mem() is too early to
do either the r/o remap or the full unmap, and so we ended up with

  36fa5ffa6034 ("arm64: mm: Defer read-only remap of data/bss linear alias")

on top of the revert of this patch, which moves the remap call to
mark_rodata_ro(), which is called sufficiently late during the boot.

So we can bring back this patch now, and unmap the data/bss linear alias
instead of remapping it read-only. Doing so from mark_rodata_ro(), which
is not called if rodata=off is passed on the kernel command line, is
still appropriate enough as a call site, given that unmapping this
region for hardening reasons is rather futile if we don't even bother
with using read-only permissions for text and data. It does imply,
though, that the PM callback for hibernation is only needed when
rodata_enabled equals 'true'.

 arch/arm64/mm/mmu.c | 46 +++++++++++++++++---
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index f2be501468ce..086c3073cf4f 100644
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
@@ -1062,6 +1063,29 @@ static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
 				 end - start, prot, early_pgtable_alloc, flags);
 }
 
+static void mark_linear_data_alias_valid(bool valid)
+{
+	set_memory_valid((unsigned long)lm_alias(__init_end),
+			 (unsigned long)(__bss_stop - __init_end) / PAGE_SIZE,
+			 valid);
+}
+
+static int arm64_hibernate_pm_notify(struct notifier_block *nb,
+				     unsigned long mode, void *unused)
+{
+	switch (mode) {
+	default:
+		break;
+	case PM_POST_HIBERNATION:
+		mark_linear_data_alias_valid(false);
+		break;
+	case PM_HIBERNATION_PREPARE:
+		mark_linear_data_alias_valid(true);
+		break;
+	}
+	return 0;
+}
+
 void __init mark_linear_text_alias_ro(void)
 {
 	/*
@@ -1070,6 +1094,21 @@ void __init mark_linear_text_alias_ro(void)
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
+
+	/*
+	 * Register a PM notifier to remap the linear alias of data/bss as
+	 * valid read-only before hibernation. This is needed because the
+	 * snapshot logic disregards PageReserved pages (such as the ones
+	 * covering the kernel image) unless they are mapped in the linear
+	 * map.
+	 */
+	if (IS_ENABLED(CONFIG_HIBERNATION) && rodata_enabled) {
+		static struct notifier_block nb = {
+			.notifier_call = arm64_hibernate_pm_notify
+		};
+
+		register_pm_notifier(&nb);
+	}
 }
 
 #ifdef CONFIG_KFENCE
@@ -1217,11 +1256,8 @@ void mark_rodata_ro(void)
 			    (unsigned long)_stext - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
 
-	/* Map the kernel data/bss read-only in the linear map */
-	update_mapping_prot(__pa_symbol(__init_end),
-			    (unsigned long)lm_alias(__init_end),
-			    (unsigned long)__bss_stop - (unsigned long)__init_end,
-			    PAGE_KERNEL_RO);
+	/* Map the kernel data/bss as invalid in the linear map */
+	mark_linear_data_alias_valid(false);
 }
 
 static void __init declare_vma(struct vm_struct *vma,
-- 
2.55.0.508.g3f0d502094-goog


