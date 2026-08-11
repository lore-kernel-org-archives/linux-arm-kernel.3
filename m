Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6684EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hF7Kn6Oocs5orb8GcrxywBb2rOULTfC5b3zs7Me4nLc=; b=x9L4Bk6ULCsoyI5I/O4H4qrPOH
	F1/vsLLxzck/vEil+YTddYQOkXr0L4TMv5EJ3/wf3TXnHa+YVSeP7bxFF3ONyKXrOFE7JzH0t7NNU
	xiFGcCfW4ib+eT+oN9edozMBliRsuwJPzrsYo+R7z4QMVJKU411+HLeIMrranPwS8ESTtpU5Lr0Ik
	wyJYL/Bt1OnMC4tZbtSRYfMzUA7VwLjubJCmsEZ3DWR8oilFj7iJ0zFjB802evH603U47zqS7Oog8
	ZQ33bM2CwlMnwPJGdxm2DPwShAhVXqRLe4fPP4TKrpNSJKx/0ArjTcvABqJlBIrIT4qs3Kklqd114
	qTRrRKAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpbe-0000000EXgG-0XTW;
	Tue, 11 Aug 2026 16:45:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpbb-0000000EXfk-2U3O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:45:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47de0093c42so2403005f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786466734; x=1787071534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hF7Kn6Oocs5orb8GcrxywBb2rOULTfC5b3zs7Me4nLc=;
        b=mEAEr9yixChcgermQsjA5twKe/eKcvhxOTVKr49QP67xy0X008auplcIjoGJ+hEf9M
         WtA8sybXzYpPg8EbIui3pc66+vdGgWeST22is80Rw1/KnxKMJU+nbwfypy/TJ7hQu5HX
         loc+GsC9eu7/ZLeowExVPcvmCZA+CojDyUtoIV/EkjvQHVg/OVMyCO33+JdkpTSg0asd
         S6/AK9ByWyxlVtAf6COh/QN5zmvhnNHPyJboA2blJzdbhWDAoyKLllA05DYFfE28XgGM
         6UNT9TvR+6lQjuD2TOvIBh0GbkBBZV0sM4MT3TH0Cq9b4OST20Fh9DpdtALYJ7Sc2KuP
         Ms0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466734; x=1787071534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF7Kn6Oocs5orb8GcrxywBb2rOULTfC5b3zs7Me4nLc=;
        b=Q3eFobV7xFb5zDR4R4suloH7DSNZ+ZbRvwhslkzqZ4HBKG8TXIzAdag/iAbd6F5d+v
         zpgVBHOraX4CUW7RdngJVI9dPPrI0Rt9RCe0sxquIvweB5Ww5lXFDVZJ1i3/wIPr2vUF
         xIiGnZh112vXYr1XlzBMNJPrdHy6I5sjO/LjsOm/wWFemtA7su6sJK/zHY9HX+hG3GiA
         ecTL4LRYloiENvUn5edJBVZp5EuaxRZLtC6Lju2a+u8GVJCsdqDa6hiq/yNqIPF1FJWZ
         H8clHzdLXvyIphz+CLpV5aakH9gewe+3pJlyvzxFNmNk03x8qyD0QvibE5VkqkOJDuIc
         xicg==
X-Forwarded-Encrypted: i=1; AHgh+RoGFBPF32r/D+3bUHsc2opqrRGfddc7f9udK3j5RLuEyYFWykTOgALWi4Ni+G+RT7wzm+DF8jfWHR7DQNkTQlpD@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ1hl06x5sCzmhhpKmZZx3WHpHd4ivDWCzBpYOVmPPT+/E4Xst
	lPJd3VQ2wBvZEizAUx7YPeYV5uXHrqGPVOI2C6MKwYoLTIqw3/Io1bhJ
X-Gm-Gg: AR+sD13iIhPw4P41cIsjKC48MGONZJgcShcRBqxQa5uB4PDiTcOm6Tnji2/tQUH6vGj
	5bW2j3OS6ZkqWboEEC6P68i7I6oQ5bBOawsdjY8eqe6pAyiWUQD2eo+urUurDZt/QX9JwBz0KI7
	FjaKnqg70pRCHZU+o+l/2bD5cxLNu/BRyedsCBz7SIkIdt2y2qK84jcN2+9UzXPbso3M/Ixc8Yd
	7cyWjnEfzwXR1PmflrgnBrcHummnBUppNvSCZeVVMfRLHN1nrazk4rky2hvsQVyI5tYk5GmXcIS
	ktZYLrMxPlHQj6vHqv0gHLnQCvw+0s7D1gi+2Qd1i8iRpXMbw4Sk6+j94MBAAmDfttbqhQKTgBJ
	C6/wIWCwkm7T/BUYo/ZAnXg9LgeAzPTPGHblI0E8T+rOrk99JMeFmws7dJ/sOLSGdiVKq82JAbG
	7sNM58AO5mUhU41NseH2JKks8ZsaP3/rH+PPo2Lez4g/e1/duYGS4YFwY/0yjL+rriN4nOL7cV5
	K9Omv0Ld4UQaWziMOX6D919usxCEUQCLmrbeNTnjCvHAzcB8+qH5EfCirSMJzY+XGqlBiJYzi9I
	ZSomoNEAHIvgZMWHLOEFi/kdbVnx95i1/r1IEb/zOiqrcMNB9HocHKnOZcC+ZqFsTpKt
X-Received: by 2002:a5d:5888:0:b0:47f:d011:f644 with SMTP id ffacd0b85a97d-4814ad82de4mr7363109f8f.4.1786466733642;
        Tue, 11 Aug 2026 09:45:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5ac691sm5949354f8f.3.2026.08.11.09.45.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 09:45:33 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH RESEND] ARM: alignment: restore uaccess state on emulation fault
Date: Tue, 11 Aug 2026 18:45:28 +0200
Message-Id: <20260811164528.65747-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_094535_661813_49803C82 
X-CRM114-Status: GOOD (  14.54  )
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

The alignment handlers enable access to user memory while emulating
unaligned instructions. If a checked access faults, its exception table
fixup jumps to the handler's fault label and bypasses uaccess_restore().
This leaves DOMAIN_USER as DOMAIN_CLIENT with SW domain PAN, or leaves
TTBR0 page table walks enabled with TTBR0 PAN, while the fault is handled.

An ARM926 QEMU test using LDMIA across an unmapped page boundary reports
DOMAIN_USER=1 at TYPE_FAULT before this change and DOMAIN_USER=0 after it.
SW domain PAN is the default on ARMv5, ARMv6, and non-LPAE ARMv7 builds.

Keep the saved uaccess state at function scope and track whether it was
saved. Restore it at the fault label only when needed. Paths that did not
enable user access continue to skip the restore.

Fixes: 274e91b81ed2 ("ARM: alignment: fix alignment handling for uaccess changes")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Resending after two weeks without feedback; add ARM alignment/PAN
reviewers to Cc.

 arch/arm/mm/alignment.c | 51 ++++++++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mm/alignment.c b/arch/arm/mm/alignment.c
index 812380f30ae3..2b470a419dda 100644
--- a/arch/arm/mm/alignment.c
+++ b/arch/arm/mm/alignment.c
@@ -341,6 +341,8 @@ static int
 do_alignment_ldrhstrh(unsigned long addr, u32 instr, struct pt_regs *regs)
 {
 	unsigned int rd = RD_BITS(instr);
+	unsigned int ua_flags;
+	bool ua_saved = false;
 
 	ai_half += 1;
 
@@ -364,10 +366,11 @@ do_alignment_ldrhstrh(unsigned long addr, u32 instr, struct pt_regs *regs)
  user:
 	if (LDST_L_BIT(instr)) {
 		unsigned long val;
-		unsigned int __ua_flags = uaccess_save_and_enable();
 
+		ua_flags = uaccess_save_and_enable();
+		ua_saved = true;
 		get16t_unaligned_check(val, addr);
-		uaccess_restore(__ua_flags);
+		uaccess_restore(ua_flags);
 
 		/* signed half-word? */
 		if (instr & 0x40)
@@ -375,14 +378,17 @@ do_alignment_ldrhstrh(unsigned long addr, u32 instr, struct pt_regs *regs)
 
 		regs->uregs[rd] = val;
 	} else {
-		unsigned int __ua_flags = uaccess_save_and_enable();
+		ua_flags = uaccess_save_and_enable();
+		ua_saved = true;
 		put16t_unaligned_check(regs->uregs[rd], addr);
-		uaccess_restore(__ua_flags);
+		uaccess_restore(ua_flags);
 	}
 
 	return TYPE_LDST;
 
  fault:
+	if (ua_saved)
+		uaccess_restore(ua_flags);
 	return TYPE_FAULT;
 }
 
@@ -391,6 +397,8 @@ do_alignment_ldrdstrd(unsigned long addr, u32 instr, struct pt_regs *regs)
 {
 	unsigned int rd = RD_BITS(instr);
 	unsigned int rd2;
+	unsigned int ua_flags;
+	bool ua_saved = false;
 	int load;
 
 	if ((instr & 0xfe000000) == 0xe8000000) {
@@ -425,26 +433,30 @@ do_alignment_ldrdstrd(unsigned long addr, u32 instr, struct pt_regs *regs)
  user:
 	if (load) {
 		unsigned long val, val2;
-		unsigned int __ua_flags = uaccess_save_and_enable();
 
+		ua_flags = uaccess_save_and_enable();
+		ua_saved = true;
 		get32t_unaligned_check(val, addr);
 		get32t_unaligned_check(val2, addr + 4);
 
-		uaccess_restore(__ua_flags);
+		uaccess_restore(ua_flags);
 
 		regs->uregs[rd] = val;
 		regs->uregs[rd2] = val2;
 	} else {
-		unsigned int __ua_flags = uaccess_save_and_enable();
+		ua_flags = uaccess_save_and_enable();
+		ua_saved = true;
 		put32t_unaligned_check(regs->uregs[rd], addr);
 		put32t_unaligned_check(regs->uregs[rd2], addr + 4);
-		uaccess_restore(__ua_flags);
+		uaccess_restore(ua_flags);
 	}
 
 	return TYPE_LDST;
  bad:
 	return TYPE_ERROR;
  fault:
+	if (ua_saved)
+		uaccess_restore(ua_flags);
 	return TYPE_FAULT;
 }
 
@@ -452,6 +464,8 @@ static int
 do_alignment_ldrstr(unsigned long addr, u32 instr, struct pt_regs *regs)
 {
 	unsigned int rd = RD_BITS(instr);
+	unsigned int ua_flags;
+	bool ua_saved = false;
 
 	ai_word += 1;
 
@@ -469,18 +483,22 @@ do_alignment_ldrstr(unsigned long addr, u32 instr, struct pt_regs *regs)
  trans:
 	if (LDST_L_BIT(instr)) {
 		unsigned int val;
-		unsigned int __ua_flags = uaccess_save_and_enable();
+		ua_flags = uaccess_save_and_enable();
+		ua_saved = true;
 		get32t_unaligned_check(val, addr);
-		uaccess_restore(__ua_flags);
+		uaccess_restore(ua_flags);
 		regs->uregs[rd] = val;
 	} else {
-		unsigned int __ua_flags = uaccess_save_and_enable();
+		ua_flags = uaccess_save_and_enable();
+		ua_saved = true;
 		put32t_unaligned_check(regs->uregs[rd], addr);
-		uaccess_restore(__ua_flags);
+		uaccess_restore(ua_flags);
 	}
 	return TYPE_LDST;
 
  fault:
+	if (ua_saved)
+		uaccess_restore(ua_flags);
 	return TYPE_FAULT;
 }
 
@@ -502,6 +520,8 @@ do_alignment_ldmstm(unsigned long addr, u32 instr, struct pt_regs *regs)
 {
 	unsigned int rd, rn, correction, nr_regs, regbits;
 	unsigned long eaddr, newaddr;
+	unsigned int ua_flags;
+	bool ua_saved = false;
 
 	if (LDM_S_BIT(instr))
 		goto bad;
@@ -547,7 +567,8 @@ do_alignment_ldmstm(unsigned long addr, u32 instr, struct pt_regs *regs)
 #endif
 
 	if (user_mode(regs)) {
-		unsigned int __ua_flags = uaccess_save_and_enable();
+		ua_flags = uaccess_save_and_enable();
+		ua_saved = true;
 		for (regbits = REGMASK_BITS(instr), rd = 0; regbits;
 		     regbits >>= 1, rd += 1)
 			if (regbits & 1) {
@@ -559,7 +580,7 @@ do_alignment_ldmstm(unsigned long addr, u32 instr, struct pt_regs *regs)
 					put32t_unaligned_check(regs->uregs[rd], eaddr);
 				eaddr += 4;
 			}
-		uaccess_restore(__ua_flags);
+		uaccess_restore(ua_flags);
 	} else {
 		for (regbits = REGMASK_BITS(instr), rd = 0; regbits;
 		     regbits >>= 1, rd += 1)
@@ -581,6 +602,8 @@ do_alignment_ldmstm(unsigned long addr, u32 instr, struct pt_regs *regs)
 	return TYPE_DONE;
 
 fault:
+	if (ua_saved)
+		uaccess_restore(ua_flags);
 	regs->ARM_pc -= correction;
 	return TYPE_FAULT;
 
-- 
2.53.0


