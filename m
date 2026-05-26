Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A5FCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QGcTo9f84jQQ3RURqBOJp1vLQa/oONqz3vOx7niDYc=; b=3X1IgqSih+ivbiV7PjUnRs/88Q
	DUBwAwHy5g6bfWf/ME3H1Yf4HlaxMFKsxGeMJ3NXI4U0gMN/Otk4WaP6aMROsUI5SswQux9eBIO3T
	nlj5c8hneX67sciWaAM5Z5u1ttEsPGep/fW4p7gCrewUMdTdL+0MAy+9qIgprDEGXR2/pvgun767O
	G4plEz6Q+59D7GcnddOAH5bFRlZF9lMksO/WOHEg6qU16breP+APu8ZMtLfJDYNMoHuPpgIDytZew
	s9i8K3vi65QWJd1FxggIemex9exBatxVEGJIYzLk4c/gS4QaNup4D1uneox/gKJ0g0OWooO15LTda
	J5hW5yqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw4U-00000002nK0-0EJX;
	Tue, 26 May 2026 18:00:06 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3x-00000002mnO-2tSc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:35 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-bdbe7ad665aso610231166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818371; x=1780423171; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8QGcTo9f84jQQ3RURqBOJp1vLQa/oONqz3vOx7niDYc=;
        b=cuNMK+LPZskO0tLCYoDMx86MjqeQZmDVnisYS1KvO+bhRrcWYG1SeXuwR8mRFZs14K
         gomePeUOn39OHY+tUKEVEm4peuRef1CnctPqmiNOrZxWrCLJXruFjVC5o3R86SRMGgkS
         fjFe1VKdXCsE05fMnpRo6ASJCCLA8wIOa7g6pYeedjYr0J28U8xgDGiIKr24FIzbxVyn
         CfNY5JPRrwi7Knl6XmbjtUcFHMQjxS8Qf6XyVcmmQVNZfMMpR50O0/6Y8cGWl9ZBebFq
         isqf7OpBvxp6HHYAOy8n5Xm+LWo0ujOLcy1WhI4Qh2sBDYTi9YGnjPvzBGY5dKW/8MNV
         cWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818371; x=1780423171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8QGcTo9f84jQQ3RURqBOJp1vLQa/oONqz3vOx7niDYc=;
        b=JvYQKHBlKkCD1th5bqa9BYnj9XUr5cguAUwq1uEWt+RRhqw5rUIcCOc6JVdUGPQrP4
         kdMnbKhZXPMNDCrFkv9/rJtEXOKKuzztx0dP83o1I6hBAtoeTBoSxGTaTPwgsNrWpO8H
         XeY+Ym9nMRCZWRhsek2U9uxtMz42gTP0sP+A3+IyPMqoUQMIRHkZmTCkBEQ3Pgquey7B
         nsJx8jVPw/hlMcEN7Bmcup7wrRMgGMZI4Zianp8m/oyQHglKIKE/L2Fo7CvBXjkaerkL
         1P41p97LCY2ZTKDOPR1HdjfHFpU58HEBnJ+Bl/lH1M3SkbOMhGtaFtVvGxuPsb85hcam
         FcBw==
X-Gm-Message-State: AOJu0YycMCPeyQnxch2W9I5Lraq+EAHWBzm/q8ZasRZGr4jxDwqML9Qb
	NC4iJA4Fm1jzKG/DIpzS6W2rK9NlD0urravFmfsL9uEiprKKVWyxs8nqHdE4Qqsy3YmkqhmEcSO
	zbDc7nlwFDVtO64Bjqu8V7u4Rnk5YCaq/85FZQuH9MmdU8Do7QVOcXH4O4E1AhXZG1ZEWS79jax
	H7tKB7+e6BoexHQRo7SZDU+fhjcOhwgNXYZwL7+PEW0+O5
X-Received: from edyn13.prod.google.com ([2002:a05:6402:6cd:b0:687:e30e:62a9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:ca84:b0:bd2:e940:db25
 with SMTP id a640c23a62f3a-bdd22e30cc2mr1206557666b.13.1779818370675; Tue, 26
 May 2026 10:59:30 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:55 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2937; i=ardb@kernel.org;
 h=from:subject; bh=xB9oKBi8uLt+1POTvwyFN4ig92BBqhDsXz5+cc7USWw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fhKj4MmKF6L9vM+ex9Rs9b0+/d9Nq+XeXuXTJwrky
 3esF1nfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACby6AzD/9Dd3yeIi89KKpkZ
 tS7DjyPAYY6GxZyveRIHIpY9rS1/zc3wV6BhbVqFXb6I0JNF9ifsanP6XEOzznS/b/x27JQXe9l 0VgA=
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-25-ardb+git@google.com>
Subject: [PATCH v6 08/15] arm64: mm: Permit contiguous attribute for
 preliminary mappings
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
X-CRM114-CacheID: sfid-20260526_105933_749147_39F0C1B4 
X-CRM114-Status: GOOD (  17.87  )
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

There are a few cases where we omit the contiguous hint for mappings
that start out as read-write and are remapped read-only later, on the
basis that manipulating live descriptors with the PTE_CONT attribute set
is unsafe. When support for the contiguous hint was added to the code,
the ARM ARM was ambiguous about this, and so we erred on the side of
caution.

In the meantime, this has been clarified [0], and regions that will be
remapped in their entirety, retaining the contiguous bit on all entries,
can use the contiguous hint both in the initial mapping as well as the
one that replaces it. Note that this requires that the logic that may be
called to remap overlapping regions respects existing valid descriptors
that have the contiguous bit cleared.

So omit the NO_CONT_MAPPINGS flag in places where it is unneeded.

Thanks to Ryan for the reference.

[0] RJQQTC

For a TLB lookup in a contiguous region mapped by translation table entries that
have consistent values for the Contiguous bit, but have the OA, attributes, or
permissions misprogrammed, that TLB lookup is permitted to produce an OA, access
permissions, and memory attributes that are consistent with any one of the
programmed translation table values.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 55bb40348a47..04cc579c7a15 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1016,8 +1016,7 @@ void __init create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
 			&phys, virt);
 		return;
 	}
-	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-				 NO_CONT_MAPPINGS);
+	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
 }
 
 void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
@@ -1044,8 +1043,7 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 		return;
 	}
 
-	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-				 NO_CONT_MAPPINGS);
+	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
 
 	/* flush the TLBs after updating live kernel mappings */
 	flush_tlb_kernel_range(virt, virt + size);
@@ -1191,10 +1189,8 @@ static void __init map_mem(void)
 	 * alternative patching has completed). This makes the contents
 	 * of the region accessible to subsystems such as hibernate,
 	 * but protects it from inadvertent modification or execution.
-	 * Note that contiguous mappings cannot be remapped in this way,
-	 * so we should avoid them here.
 	 */
-	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
+	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, 0);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 }
 
-- 
2.54.0.794.g4f17f83d09-goog


