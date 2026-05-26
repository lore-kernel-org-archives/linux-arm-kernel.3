Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECC5CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mHEuoeqgeJwwKsR5vVxh3j7NIc/RKdm0H7T5NxNZG0=; b=nVoooXoOMMd+jfELvXj5D4NWy1
	vPZzMDju3eGxpYv13oXpSbafbLTiJbAW1UYWzfMmEirk4aygla9kvkwAtFpEEuGP3Q3A9jHE+zvgX
	oDk48yDGNdXA3uV9uVzRCiPjd0NtUXfMVxYhNupAOjedvVBMzWgD6jbni+o0i3auq0BkpUpCFfKKH
	qfhZG4gAFLE9BLdMJy48M8mWFIzkdcK3dbD5wLtcaaUw8tqPbAcJB6NrMa99+EP2dP7JKs594MDBA
	GpL/rteWStAz5CgX+5UwyVJCT6Utg1qBOdDCCdIOUw/12Kvohgni3/ynkTxXg373xU66m8P8ifIUW
	rB3X91Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw40-00000002mr8-11jn;
	Tue, 26 May 2026 17:59:36 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3s-00000002mjs-2Gf0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:29 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43d789cebcfso7466281f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818366; x=1780423166; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mHEuoeqgeJwwKsR5vVxh3j7NIc/RKdm0H7T5NxNZG0=;
        b=H54aTV121ibEZwrj7sKbLN8rT+WFnNui3lwjHau11ht1IX8XSBti8YtVBMxEUqu58u
         PoWDIu+8NnIvAbXL9jL4wB3kC4tiReZBizbLHCXmdzDA+P8EfmnJI7xhpVSrsMiJIhUI
         rk60MGu87FHhubf0pVUQiucexu0kGRW7HX7tA8v2vxjkzhlAqYPQ76JjpUcpZmPfTYjc
         OZAXQKv46rLyhinAfPsluEaou0MHiu0xrpnI8LFueUAbs8Ksb1wXGVyMGxn9ufmcm5qa
         xjMiF4wy3DjF76ljZnH6DQAVceqZH2Md6zNL4lcVjT1Ccny7MQfyVC+VPKtI06ZaOniX
         Jigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818366; x=1780423166;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3mHEuoeqgeJwwKsR5vVxh3j7NIc/RKdm0H7T5NxNZG0=;
        b=eNGQchNmGu/3oyVTnNmqq9zbhaCuUTx4Ek533/tQn06wiCZVPRs+xHuxgdrAdxpqba
         TvRlIowt4+fx6BpVacj9zhR24nUyQgatF0QfZ7v+Mfe0xjEGQD3Yp7ZAGLmf1GcG4nZo
         UDrP+bK7Ivrr0VIy10xUkuM1/jHqTc1yupxmRI4VqyKvomXjozdWB7C/BJv01ISGatvh
         z3pbO5bbhc6CyplqGSiffB/8ofHFo2Yxro8mjrmT/O8xGpdHmlZelrkzbeMH4YC+y89s
         6Y/w7MXuYZf35sjPjN2gCUcoBoBPLK8R3GG8zHv+gG4q9+eUUOKNg4t8ovptZWG1828C
         m00Q==
X-Gm-Message-State: AOJu0YwMHUC7uMbcChoa882sQyy+OwU9Uhu47iYOYKC00eYFWxDzc7sQ
	COkrYcXG8MXgxN+UyLTpPVR+tPn/Nw1VXI1tyS2fc+Oysbic/t+isjktV/Pw38cJ0M4nc0TMVP4
	5RWXifWRIg0uBVX93b9uPoSHSUweuGPLWLLjZDr7ZszN75fqGpsZCaP/4pRZXHO1WO3fDiTuf+i
	Pct/SZhygikvywdiB6tE2G+Ysnw2sZ27KNQhKI41sl6upJ
X-Received: from wmbh6.prod.google.com ([2002:a05:600c:a106:b0:48f:de29:3f52])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a402:b0:48f:e230:29f5
 with SMTP id 5b1f17b1804b1-490426b0c92mr233953415e9.16.1779818365325; Tue, 26
 May 2026 10:59:25 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:51 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=ardb@kernel.org;
 h=from:subject; bh=HTVCAgvGTLScrJ2CZV4D8VSId3uhva+Scq8FVpoE17Y=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fgzPcSP+Z1uPSc089cXOMuHXyr/rHy2TE5mx/o6dx
 X9ece7OjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARxViG/1GnxVK2TMh4vX6H
 yFPbSV03ey81Ml2OaYnZZ/vlkGzNih2MDIuvZ3AHycz03hNo9ypyg7OB0C2/DLkSk46sXolZjBl hfAA=
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-21-ardb+git@google.com>
Subject: [PATCH v6 04/15] arm64: mm: Preserve existing table mappings when
 mapping DRAM
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
X-CRM114-CacheID: sfid-20260526_105928_598382_7117E590 
X-CRM114-Status: GOOD (  12.00  )
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

Instead of blindly overwriting an existing table entry when mapping DRAM
regions, take care not to replace a pre-existing table entry with a
block entry. This permits the logic of mapping the kernel's linear alias
to be simplified in a subsequent patch.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b2ba5b35c35f..5c827fa3cd38 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -256,7 +256,8 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 
 		/* try section mapping first */
 		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    !pmd_table(old_pmd)) {
 			WARN_ON(!pmd_set_huge(pmdp, phys, prot));
 
 			/*
@@ -379,7 +380,8 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		 */
 		if (pud_sect_supported() &&
 		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    !pud_table(old_pud)) {
 			WARN_ON(!pud_set_huge(pudp, phys, prot));
 
 			/*
-- 
2.54.0.794.g4f17f83d09-goog


