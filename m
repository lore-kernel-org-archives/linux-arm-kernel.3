Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914EFCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kwt+xg304itl9Q4y9dyVOqGujD4Vg308m/u0QoJNJxg=; b=pYMRQDPusIkHg5SW13LkiKGNw5
	FzK02G5aI+iWWHwdi18qpiXL0wnAy7vW+GP1L3eyN+YjOCBJbf5ZTvBoQI58ASWdtJ6A8ZuCgNRHX
	Wr64OP1HanYR5pn2CwxW9ZLygoCRIsbDePvbvxO1WRmYEp/3wVgA/P8Njm4UU4pFZ8CsByFjayPEU
	wjWVcJxYPwvwKWNC6zd5Ezho6s2fXNfDHsf3mn3q8fHzJAzGDHZibLisB3Fv4/gV9smbXTTQ281dq
	oK7ck53houc8VnG37xhHIHcQLjhgteXRl45ZktNrHFF00Mv2KCfN89GQ4YUVyWGyZaW3y/QiqD3hK
	Kq71LrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDc-00000001yxh-3hbx;
	Tue, 19 May 2026 15:18:52 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDO-00000001yfa-2DGp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fd2b502e2so34027355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203916; x=1779808716; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kwt+xg304itl9Q4y9dyVOqGujD4Vg308m/u0QoJNJxg=;
        b=Rj7baswz0LVKSSHJoFfkt7Q6l7/BngtWXsmTAS1G0RiViS07oX+Icna2M6bdChDyfa
         hQutsYaG83O6O4siwewom/cexWpbEMna+a6y5ldYCr2ey1yTSu9BcQGm7U1Plm5PNW0N
         9ShEh5SZaEfUfQ3VKTaOl4rUsNSBf4Ljf+3ZBi/ifDdNnxbZasjlMzPC+LxP9P1F1cLQ
         wRcI5xNukGH2h7GUe808rwP04apSbS2wErZklh87dhjVlVurhPTJhhrpJEVAEqK215u+
         Wbl08jHI6USKT4FxJp5acU2mnVMHqE6GWZ9km8nYB1ICvTFO1liz0QgKXNmKd/Z61M/Y
         JO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203916; x=1779808716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kwt+xg304itl9Q4y9dyVOqGujD4Vg308m/u0QoJNJxg=;
        b=c56/qylmI4C9kuWTosb22gxLV70sL+DNlmP7pF9rVj3K9/mj58UBcnGm3d349KXg7W
         Ig4ogteCOHp+xRRXEHExtUO9IvX2WSrVtcwG4HCfdboqMucju3cyK3pZtjv139uH925Q
         eFCvXHkwxx7f98xWcve5qiYEKAe12x+8duT+zPzUv/Cp4Gz7PR4QdwTToyIXoIPYhH5c
         O+Ji+xYhj5XHDD2aWe2yXNXOLFYC1b/SJGlc4Fq24CsJf1gNB3RNgIJqDpLVc6MdY6Mk
         4K+CGGxQetHjpiVGFIW3fIHnJ1ZbbXsZYsbpgLYhlxrcAd3K6XkTnvoCbItqqWBwP3lE
         /NUg==
X-Gm-Message-State: AOJu0YwyxEIDoCkTcL4ocbl+xj3gEy4wrjKr1Ynh2TAAEsizV+CRtL3t
	QPiA3N/pc3lmJgVSm0AWZczp7XpQMoHyd3hm+5KFMWMdLOQMurAzZxvAommIpVVbzsmFBKFj48a
	fkzWIIZYS+W5ikpwucLwtrWE3ZtMKc0SF3IccUR6AFkZpV5En6lDyx5H/dGinPcM9oeubX1EHaB
	a3pGDl6mdVw1QXUilhoX9c0UaMccEQzvPaunQJYJE9jOp1
X-Received: from wrnz14.prod.google.com ([2002:adf:ec8e:0:b0:44c:f516:cbb4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:10:b0:48f:e230:2a1b
 with SMTP id 5b1f17b1804b1-48fe6630137mr253844655e9.30.1779203916085; Tue, 19
 May 2026 08:18:36 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:26 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2933; i=ardb@kernel.org;
 h=from:subject; bh=7JrpdyvPdL1s+/ehcMcKhbiYpfIb7J1bzPCRFLZDLcg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7ryfbU3x9e+3LC5ff7rx1wuN2GTFbXOe32Cu8cvPz
 vnOfNO8o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk+TyGf3p7cv4pVosZ/Xm/
 ZG+Uf4emX6NSUtiWg5fCHzPUTj/CqszIsCmn+ghHSolWRsbsiRLlU/nvMRWcb3cMSLc8eOJ2yY5 aPgA=
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-24-ardb+git@google.com>
Subject: [PATCH v5 09/13] arm64: mm: Permit contiguous attribute for
 preliminary mappings
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081838_588619_ADB75616 
X-CRM114-Status: GOOD (  17.55  )
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
remapped in their entirety can use the contiguous hint both in the
initial mapping as well as the one that replaces it. Note that this
requires that the logic that may be called to remap overlapping regions
respects existing valid descriptors that have the contiguous bit
cleared.

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
 arch/arm64/mm/mmu.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 224fec6ce9d7..d4ad9e4766a6 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1000,8 +1000,7 @@ void __init create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
 			&phys, virt);
 		return;
 	}
-	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-				 NO_CONT_MAPPINGS);
+	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
 }
 
 void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
@@ -1028,8 +1027,7 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 		return;
 	}
 
-	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-				 NO_CONT_MAPPINGS);
+	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
 
 	/* flush the TLBs after updating live kernel mappings */
 	flush_tlb_kernel_range(virt, virt + size);
@@ -1175,11 +1173,8 @@ static void __init map_mem(void)
 	 * alternative patching has completed). This makes the contents
 	 * of the region accessible to subsystems such as hibernate,
 	 * but protects it from inadvertent modification or execution.
-	 * Note that contiguous mappings cannot be remapped in this way,
-	 * so we should avoid them here.
 	 */
-	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
-		       NO_CONT_MAPPINGS);
+	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL), 0);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 }
 
-- 
2.54.0.563.g4f69b47b94-goog


