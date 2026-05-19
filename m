Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDB1CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp6Vbx6VcvTlYXuJmWR3cijY2UdMz6wPDbvvga5K5vY=; b=PfZ1M35+xXZ3byRp0SCBQ//YBX
	Y3/bt3zRkh90d/6p/hjZ67fmbGoK5GZ5pYdmAbgYVkE5s4Pn5ls0HmKK11ozOLaZpfRC3pYM2n8V4
	1whFIff9xUP+A3NalWWBuP5K/OYdrWLiBlms8ugAR/LTnVH7P9Ee7a0AYgxB/Fl2ckH472VUNzELI
	G8Tvh5QeVhkKymAcNjEAjYmLF3dJwad06iSQay8N2xSTBkhyB6K1JosLKp57AcYPU12d/7jS5N8mK
	yMSoxrjbqAh/OT0rhqfzi/zZMpRSJ9jLTWjOBXJcN2RbqHOivBRwCklNK5VkqSiBRxSQp/zIGoaNB
	OSRFTdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDB-00000001yVi-1FV7;
	Tue, 19 May 2026 15:18:25 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMD7-00000001ySZ-3iGh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:22 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-67c2ce99bc4so3485889a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203899; x=1779808699; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yp6Vbx6VcvTlYXuJmWR3cijY2UdMz6wPDbvvga5K5vY=;
        b=vZvfO5Kc6dC61a9ddK1dCAK3b+n3iqs9fttYAAEV89lTKMSNvnH4JVJfJhR0EpQUZ1
         sQm/A7AIYA/S5NYczeGtK/HUVjnKUhHzGzdrEpT2PCnikwat4rPS0kTF57G6RtpU2rZe
         Axj8aQbMHvEvPauNdxFCNTI6gtsUbCWgt09iybx37tNGm2zl7zN9pZjOGOD7JUtgV0av
         WnIlDKjLOvY68eRMl2ZdmCkDFaVMz+gI5ai6Uyv6zzpi4aOJW+HvjGpdRNerMwbEeLwF
         XxXn4WIbGJC9qVfU2KcDAjnrjLva/fg1UKVvC+z1fhwDxrZQNrnudMlB4C1oEKY+Q88J
         IKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203899; x=1779808699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yp6Vbx6VcvTlYXuJmWR3cijY2UdMz6wPDbvvga5K5vY=;
        b=pTePPzSTm8xpg39BJMta92GnZNo3QF91R9Hnht+ro3nedKDPapB5Hykq2Q/jEkMXJQ
         Ttu/ZwWSnDmZeg+vreSBtYW2Ja5gjuNCxlKWrKGpa7ub/bbcrSuI5gYZaoTRFYgy4nnj
         gudJrHbivTv1B58Ee5dlKH2FAzBp+SwExKpXv0/HtfELM0NrRWVamql4nBA8XbTMY9We
         bvR2zTN11Wsx8xMgCSu1t8Aj+MeNTjvnv1NHFVXzmFUrABwwIg3e0Ueg6N2jSriV5vp6
         Je1EymmJ3ddv1IHn1h9+/+l4/eMUmEzhtD6t1IVsBdIWdkOpAEaTZewuuY+613ReO0bI
         7c3w==
X-Gm-Message-State: AOJu0YzJl9XgRuVvomEVOK+AjtSyhXHF1iHul0FS1vci6D5XoXV8IruZ
	6owPZC+wJsvzj8Yvt/Xtd3uEPgxDvH5ukuCaoIPt2oQP3aTLEcK+/OdlF8dKPvNlDOjscvoeciN
	el7DswkvgxK1bGDnlZOleSbZjHcvkViD7WYU7XvRWgdn4F7gTUKN6inx9r4F2NesFfHmPSua7+J
	b4us0QPZSrD3CKN39vd1I056wlwsI51CsLb74Dp1qOj7jB
X-Received: from edsf17.prod.google.com ([2002:aa7:d851:0:b0:671:9d2f:2d21])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5bcd:b0:676:e2c2:9034
 with SMTP id 4fb4d7f45d1cf-683bd28c712mr5773883a12.13.1779203898712; Tue, 19
 May 2026 08:18:18 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:20 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=ardb@kernel.org;
 h=from:subject; bh=HzOxyKiU5x0X81nyNN6N0/Tb7jNyzDNJ+OLc9lYWfgE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7pi9g01ZksV39oqUid92yXdN31TMeWavqc7HepeVn
 ou6vJ93lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgInsXsTIMCthp3fF8SvKomoF
 iluWR+6SSIx6NPH2/8ubVl9Q2u1f78zwh7+qQj0w+5yX82v9mfsl5YIO6kjNEn/++tknw1+qm6J 6eQA=
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-18-ardb+git@google.com>
Subject: [PATCH v5 03/13] arm64: mm: Preserve existing table mappings when
 mapping DRAM
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
X-CRM114-CacheID: sfid-20260519_081821_938287_C6157672 
X-CRM114-Status: GOOD (  11.98  )
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
index 0c3d97f120e1..bd2764f02a7d 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -256,7 +256,8 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 
 		/* try section mapping first */
 		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    !pmd_table(old_pmd)) {
 			pmd_set_huge(pmdp, phys, prot);
 
 			/*
@@ -379,7 +380,8 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		 */
 		if (pud_sect_supported() &&
 		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    !pud_table(old_pud)) {
 			pud_set_huge(pudp, phys, prot);
 
 			/*
-- 
2.54.0.563.g4f69b47b94-goog


