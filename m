Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4624D12671
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q28i3iDLwz6h+nvDmz+AND4wzha8IY7lNxsqII8tV4I=; b=oRvHkpbcXqzz2pkOVrqUxTALeX
	oFyUbuzCdDAz8Xr/GqmRt7VP02two4Q/WcEA3Y+XcexpKx55acH+PjHWA4LkbRbbWnh9hP3kX8Ejj
	A6VQJ1hg0ZsexUcdP++MjlQ16OULLfUQnPug6oLHaKSMVHEyAvcZM6EM8ZI2N4eZPYA6lMcucTNgy
	4VLgwppkV/K9Rh/L1Q9y8DrHOeUrNEWMno5w11dvFsWHKra66DET8gniP2pflINkJGK321gVZsMiW
	QGakYRc6CbQ8PuMMikriGnJKBKw8ASaY/gss8dEethXhrREKh0qby03/2FqCpLBDHZ9qn4FcWyDC9
	krc6v3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GAy-0000000GZKG-08oV;
	Tue, 05 Nov 2024 09:48:40 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8G24-0000000GY8U-3JkF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:39:30 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4314a22ed8bso37012765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 01:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730799566; x=1731404366; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q28i3iDLwz6h+nvDmz+AND4wzha8IY7lNxsqII8tV4I=;
        b=gkreZdp626G8uNrFv+6NFJXhkEAWvZLlwJBvor+rAOTfYCaynpjZVqSa/Dtac45CUj
         KoUV+jO4usul6qiykX73AYmgdt3spg350kbE6ydsIwA5JTA6b/HY2FXZT4Uw4TcuDnMi
         LZsDtQu5A/q/pbZQKOP9DNk3NvE65vaVG/cbeOrU8d1NWTuZa6cDmy7GrFthhelkrIXj
         rYSXkrlZo5nDLTjDhVkKpf1Y2pJj7Oe2yA5aDaAP1QvgRIfSaZWVe+WPQ5QwNzQRoYzJ
         ams9AYdvV0UtL1uwgXCHFAcTHRHCsT9ptiUnBwYNVvNH1qkAORhGRUpXa6DtrCrjyF9W
         etDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730799566; x=1731404366;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q28i3iDLwz6h+nvDmz+AND4wzha8IY7lNxsqII8tV4I=;
        b=SqPN62y8cFKvNaJKvN7gB0UneSgrDcNgJCIT+qDvN2FNt0gTBi5mDtUygtsKvuQAiS
         WBdxZZHToXt0osKOHnYS/lZwklbBRt/WDnhmRUmEa95W3U8iACqaWYHs79wiGTxbtqQ9
         xzT4aeA/N0XHTjusRKmkkBIgn4MGddgsF6PpdLU13ZEPTybZKbbnLRYO0epDwqcJTkJz
         w0wmzJwFULRkvbcTqHwEbt5My4FXaMDm8DQ89YBXiSPnUTlRxnYplPdpARBZH8/AO0yh
         NMCAG9jD03g0bPYcJKozXEuDC3uwPYXxdv0nWNAzaRtUCd6ZnUoE/XNLJWMyOUMXOerj
         Olyg==
X-Gm-Message-State: AOJu0YzuFfP44PAAGL+Z20HQkNqgt+v3EO85kgmkSIlkTnUj96ITO/S5
	H30aw57oE/latkTPSqqUAQuab3o5FvyxF4GqA5cSihk5MSJHeasEyf7grLDGSzz9skaoGgIqxjv
	5qreeFNuLvUZv6ivatPX9TxbLY1GKwIm7nPaFbd1akpmi3XUBFCt/Jg3U7h3YsU43nBtallARmr
	ruXiEG+HLUY1Xw027xh9URgWAz/JnZ1KpsNCvlvG0I
X-Google-Smtp-Source: AGHT+IFnciVY2KeIILevoNwNSK2WLL1rxI1laG+iGKQCXVyIU5VGru/l9ioMiS6V+y1pNjFF+j/N9DZW
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:5891:b0:430:541c:415 with SMTP id
 5b1f17b1804b1-4327b6c6bacmr299575e9.0.1730799566049; Tue, 05 Nov 2024
 01:39:26 -0800 (PST)
Date: Tue,  5 Nov 2024 10:39:20 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785; i=ardb@kernel.org;
 h=from:subject; bh=y0dHBbbN+XfNDTU0LtH5iwvHsZNQOeiA4plCC1Qebic=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3z+YnZTx6m/Dpwd/3uTx7CpVd+dFfs4HV4fERS4wbLz
 LlxHPq/O0pZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEFC4wMkwMk+K+vtJQpaWT
 W03T/eS2xS98RGoEVYWlpqX4SW9elMnwV5z1063kH2sS6pwrV10214twnHfYjudu7UZ7rbKXu71 WcgIA
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105093919.1312049-2-ardb+git@google.com>
Subject: [PATCH v2] arm64/mm: Sanity check PTE address before runtime P4D/PUD folding
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_013928_856228_67CC8627 
X-CRM114-Status: GOOD (  11.18  )
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

The runtime P4D/PUD folding logic assumes that the respective pgd_t* and
p4d_t* arguments are pointers into actual page tables that are part of
the hierarchy being operated on.

This may not always be the case, and we have been bitten once by this
already [0], where the argument was actually a stack variable, and in
this case, the logic does not work at all.

So let's add a VM_BUG_ON() for each case, to ensure that the address of
the provided page table entry is consistent with the address being
translated.

[0] https://lore.kernel.org/all/20240725090345.28461-1-will@kernel.org/T/#u

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v2: drop complicated logic and static inline helper

 arch/arm64/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index dd5dcf7ae056..b76603618716 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -932,6 +932,9 @@ static inline phys_addr_t p4d_page_paddr(p4d_t p4d)
 
 static inline pud_t *p4d_to_folded_pud(p4d_t *p4dp, unsigned long addr)
 {
+	/* Ensure that 'p4dp' indexes a page table according to 'addr' */
+	VM_BUG_ON(((addr >> P4D_SHIFT) ^ ((u64)p4dp >> 3)) % PTRS_PER_P4D);
+
 	return (pud_t *)PTR_ALIGN_DOWN(p4dp, PAGE_SIZE) + pud_index(addr);
 }
 
@@ -1056,6 +1059,9 @@ static inline phys_addr_t pgd_page_paddr(pgd_t pgd)
 
 static inline p4d_t *pgd_to_folded_p4d(pgd_t *pgdp, unsigned long addr)
 {
+	/* Ensure that 'pgdp' indexes a page table according to 'addr' */
+	VM_BUG_ON(((addr >> PGDIR_SHIFT) ^ ((u64)pgdp >> 3)) % PTRS_PER_PGD);
+
 	return (p4d_t *)PTR_ALIGN_DOWN(pgdp, PAGE_SIZE) + p4d_index(addr);
 }
 
-- 
2.47.0.199.ga7371fff76-goog


