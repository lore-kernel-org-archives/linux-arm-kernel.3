Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8785F1098793
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bpulp9qaDSG0AQBX1jMfHDsyJIuHHS4dbSktfX7imgM=; b=kNT//IVDS7pTwMqXc9jKF7+ipo
	wiEgg9VILyem3BGIfQ/C+PXLUUfSNOjpGL3SekK4dzXopP8n4IVE7/67lqwlVzOHIN9RD+EgN3dOP
	JFKdXP0Yjh8T3lJLq+J7jMPi1O9cUepdtQOd1GT+98MoqWxKKPwC7CfSXB2yVwFeJOoxlwc8+nKIs
	E6fDzVSJF6nkG/4/DFnoyDZJJhSeNVNndFws2UVXB0MpNvsFxHAB4cCLFL0vUCnuRkyt8Z6KtC93k
	W5/d5KTQAMYNPWnAPN4IFU+HvVMUVLuQ8GeUUqMvf2fatzgSGYmozte1juDOO7EBqXpc3QpF49xf4
	4YXvNMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKd-0000000CyY7-3OyH;
	Fri, 20 Mar 2026 15:00:11 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKU-0000000CyOU-2UIP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:03 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4852ccff333so19604455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018800; x=1774623600; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bpulp9qaDSG0AQBX1jMfHDsyJIuHHS4dbSktfX7imgM=;
        b=a4aQkZ0xfKGKkl0gsGUFH+xFgQIqCdF5JqZq2XKyA/YpfcIgZlmbv4D07D+4zBHNxD
         2hzkOjUwrjjRdlkxyhqbWz+RFQOyKSoleiHR/3DrL+sjzFuZtGRUsphjAekORKJ8LKez
         0L24QFjRALAeRMiA8bsfetO2LbWyih4+cN/OF90YM4gyfpB3hTavcOYz2pTYnUrlrCAd
         qrgOSk0VaiIllcfLwuFBeQL2xy47PRolGF2LbRCw5ezGCc2iYlz7Olq9PlD09AhdgMzU
         npl0CYpqboCWxsApbPekK2l6p9sOW/YvX+8dkcoTR2IZ+fgVM7iegfK1ozHhdGrwnGht
         ff1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018800; x=1774623600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bpulp9qaDSG0AQBX1jMfHDsyJIuHHS4dbSktfX7imgM=;
        b=GCxrnDNYrLcy4Jb4Gt21lHWGDBLoQYoWp086AJGIJbT9UVvCvys4hgpFcrejC9Gt0H
         2YushqCYGgYYD4uZ01a0q7bkevGwUO68AIhjx7AFs9D2siq6Ho7wza4+BJkaLefRgGth
         XCnfxIV90hBvn36G/5RPO+ik+DHjZvLkA656CssyrdXD4MVJbnitAOI8zy54WSCzWJNB
         R2lMmzfF+skwVjmylVcH8lmvpXk9Bu7B5hbOQ0qpwU7vZ+9rEblleXkLAfgAaB/UIeJS
         kOgqD1PlcOhvlu9gM3IfmTMLPguejZr5vCMk+U1AVRhNc5a7nRxJ3YDszEaT/TGUoeaa
         kykQ==
X-Gm-Message-State: AOJu0YweNRtMARm48EkoUyp5xl83uruL9Vf+C68WMepMfaOok+Y6bLjg
	o+BB5gUtp99Caz9di/Y6IhHZ3w3Z7B1P88I4PlGToYl8YQYslAMIcrg9DKGGY/grgSmIWHmSBQ=
	=
X-Received: from wmhf4.prod.google.com ([2002:a7b:cc04:0:b0:485:4553:1a97])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e8e:b0:485:3e6c:aacb
 with SMTP id 5b1f17b1804b1-486feda8c69mr48236065e9.4.1774018799996; Fri, 20
 Mar 2026 07:59:59 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:37 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=ardb@kernel.org;
 h=from:subject; bh=RNseX4mRXVBWe3ByFtnF7vDF/KyNT++5b73PmV91ziY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwq2EdddL5C1WvNOwK94xj3Pq40+BMyeKKn7+bJ8Qu
 499zbLpHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAim9cx/Hfgi/mWLLjsk9uN
 F+teaatVvZ0RbGgj9CG4gPVB1aX0S3wMf7hu3pPafatOKSa/zt88y3a55KMrpRVVNqt75DvYwwq v8QEA
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-17-ardb+git@google.com>
Subject: [PATCH v3 02/13] arm64: mm: Preserve existing table mappings when
 mapping DRAM
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
X-CRM114-CacheID: sfid-20260320_080002_642536_5200C1DD 
X-CRM114-Status: GOOD (  10.88  )
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
index 795743913ce5..9927b55022d8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -262,7 +262,8 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 
 		/* try section mapping first */
 		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    !pmd_table(old_pmd)) {
 			pmd_set_huge(pmdp, phys, prot);
 
 			/*
@@ -385,7 +386,8 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		 */
 		if (pud_sect_supported() &&
 		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    !pud_table(old_pud)) {
 			pud_set_huge(pudp, phys, prot);
 
 			/*
-- 
2.53.0.959.g497ff81fa9-goog


