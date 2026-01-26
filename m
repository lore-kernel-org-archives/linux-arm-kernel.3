Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67613C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1TMSr5rZgNu0o3nZo8UO5URLLTIdBmObavXa1u2Zj8=; b=WCfdELvHEXhsZVIdxK6FvJGhX2
	1zjCJRMMAu0kVTMaAlpINaC8japL/ghY+hwf7e1ntrfm9cp8jzd4Sdl9c/cd4Ln8UskSFDdrhls/i
	xMLYXJA0VVchoGFWbhR58OhZ9WhUvrRTeFscQlOXaaZ36b8qltX9pqvOnuYxAi6l2B7LG2W61LNxS
	lUJu6IxjXrVA1B0ZZ1xr0y+QeGKBAzqxqxyNy/nZEDhIO8pV7dv32LB76KwXs9iVElfUaiZYcU6ll
	M9lTbRJ/fc2qn2rjHUV4hYLtp+GDgCDv95geaTxtuZhmAYDKtSsoGRnFrA2rRGSFw/vhy/M5X1ybB
	3pENUZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsq-0000000CC4l-3sEz;
	Mon, 26 Jan 2026 09:27:44 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsj-0000000CBzi-1y24
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:38 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4325cc15176so2868835f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419655; x=1770024455; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1TMSr5rZgNu0o3nZo8UO5URLLTIdBmObavXa1u2Zj8=;
        b=s9k5Z3syWpUJCavlqHHskKU5dUGukMrERFcOgM3TIsri5jjQhhmMbLCUlXtZ+mytX8
         kJSEmHxG6MBpnzBTRTdB3Q7GoqhdswbFnvZcoC5sq4oYbAU7MSTiQdUkgmGcXPmhp5iN
         qv7yqrU2XhMJ0xfkYvv7HvbqoVlxgDqWwbFbrsGpgAKk/dKxOenv/BiXRjTBY2WMc4Iz
         gIgaUK6g81Cy0HJH9xImDJvAx0T+95/kziVJkzi3IduvUpWQH1Ff/yF5IX75ux56OrGU
         Y9WYQzppuF1Bd2S1IH4EVPwCSXOVbOTOKLQ6b4TTpOsY5e1QFBZavrNuc5O4ZduyBxQJ
         FJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419655; x=1770024455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1TMSr5rZgNu0o3nZo8UO5URLLTIdBmObavXa1u2Zj8=;
        b=vuZmL4cnMAcE6CFBa4egBmGxGit7HL8cXKJvb3UrfQ4q9ejF+940U/CQEmNIApX39z
         dXSiU+EqBGWjY5kJYvbqvTbOxbuMHySj/lFcCl/l55Co1T9UHGQtA0LEBDdTFbAFOWx1
         JRGG6GBZgMiSQ8//OTd1LYJhe3PB7F4YoaDzBdw8olWo6Qi3qaYYm0YZBeXWCr8hNe04
         JHuzOeadt4horHaTp89pKsI/hLqjT1UnFtfLFAKCkHTo/xBlKoU2aES5H58dVi2lazBp
         /ZpT/Yp5zBzqn50byj9XnEoEP46r6kutF0cR0P38pHFZyFiSeIo+8I9ej0VDevkbfr0i
         gApg==
X-Gm-Message-State: AOJu0Yxk+SgS70hPtg+8AgGo/ZuBlT3TJTlB5uz+mR911jUUDyD/DsGr
	6bKtEqWLngkfwevl16VqBokChhA21MjFnGQazd/bMhlCtwtkQYY6rAee/qNBp2ziCQ8eG6Iwuw=
	=
X-Received: from wmqd15.prod.google.com ([2002:a05:600c:34cf:b0:480:4a03:7b65])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:820e:b0:477:9a28:b0a4
 with SMTP id 5b1f17b1804b1-480609fdeb9mr36093305e9.0.1769419655128; Mon, 26
 Jan 2026 01:27:35 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:35 +0100
In-Reply-To: <20260126092630.1800589-12-ardb+git@google.com>
Mime-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=ardb@kernel.org;
 h=from:subject; bh=EuE34ANBL0zVmq4k3+FqMRHYv5MWLB6u2FtpmZwmAd0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2NP6wE/2nDvLTPL8JZbbO+74uCDvbPXcOZ0xtqJM7
 MeUfvR3lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgInEWjH89zjjYLlk9/MzAj/s
 Ld5fusylOnFKjwdb/sa9yiqHVKNkJRgZ5gZzSKnMy3t55rdrWm7btM+br+6/bMRvz21dEsYnZdv NAgA=
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-16-ardb+git@google.com>
Subject: [PATCH v2 04/10] arm64: mm: Preserve existing table mappings when
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
X-CRM114-CacheID: sfid-20260126_012737_512655_41062AEF 
X-CRM114-Status: GOOD (  11.91  )
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9d39de3cfe67..28cc3cda042c 100644
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
2.52.0.457.g6b5491de43-goog


