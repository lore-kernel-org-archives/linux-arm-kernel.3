Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CCBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 00:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PeWip+HoUsQbRGwZAN+OhPaopG7QLZ1AJBKtn3hmr98=; b=XSPi6KY8rc4roYz0a914EJpLhV
	SdAaZfVnqXiddgSKnaUXozt3DOUPcHM1HG18UCd0lS80l58g3y9xuWKcO52HjTGGbzZk6oEJ9UgRV
	wTlShIOGDmNfLmC1jq9PIScS41k7/LAbJFXsIJC7/JUv+QLpgiNlsyOYcfPKiskvAE/4BlF8lta6o
	Vx5CA4IXpbme2jH60pYpYcTIDoes5lUwi/5VjwEQfotITYqkwBURrQG8m20ZbZDiO3zs/BaO8ggzF
	4GtFcVSYrLTRmUtmptRaN1ooknBu/v3FaoB7VBMn9xFpXQkdE59udQVFHxZoWrHr8O1rb+TdBsrEN
	2o+1DFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvkoN-00000005DF5-0Efy;
	Mon, 17 Aug 2026 00:02:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvkoK-00000005DEV-1xzb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 00:02:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so14077815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 17:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786924959; x=1787529759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PeWip+HoUsQbRGwZAN+OhPaopG7QLZ1AJBKtn3hmr98=;
        b=AgCbrBwRGBmeLQQoLzfoBvdMvbsL1k2LBala7GLsWLGH1C+vQ6KOq4rIF1td2y0YDz
         Sm/xDo4WSbK8BG8suceElNHKvuDkKaBoCoiHUBoWDUjH4swL70fjRvbCDSYB6Ww4UVMO
         y6gC6NFjI/9adOkIh8f8wNSjP3UvPK+mZ2eej/PdE/glHMwrP3lHD2a48tbZ2CN275FB
         /GfnfiELSqJpCmAEhKWW1vCuxQUyY15CwVwKlym6viMA8fpUcohLBSnisGftySauMANq
         B4Fy0Gnnwh3kYhENvwgI3eGUaHBPy8XFjnIINkhJUjc79/JPm9QD6cxEzKActplRRKD/
         gVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786924959; x=1787529759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PeWip+HoUsQbRGwZAN+OhPaopG7QLZ1AJBKtn3hmr98=;
        b=Le+a+vyKV/CBewsIozQVI8Pf6N3sT6658qMMyfH24iLh0z7s/Fxv7We5od5Z3s83GK
         mseUab0ViY42tThtETs2wX9FS12Ju1nvE/Qw33gKA408jkG5ftOCU0vsSFoXLxjWwEy2
         4KbB6mbh/q2BV0fCQrwBDJjecKUXsjnWy4Bf9RCdbzyzfFr8kmsHHpS1F3NwAN5FYA56
         PePw7EOYRraoqNeRiNoIyhKE6namC0k7GNJFHh2rbQFbXLxWWQ86EKSuFvRSA50aL34H
         OC5lY2Z0X8TD44ZfsGiHi8G9xk7CguvpyjCkcsihYAYGKuAqCSHWWLISBJb7ndJ93k2/
         2Olw==
X-Forwarded-Encrypted: i=1; AHgh+RpxdjImlFHssBLabJ+Id94Vd76umMajCqf7UkxOKPzA0XHJawsxSdXimhGdocsQmTmq55U/9nU9D6Zg+L3XzmTR@lists.infradead.org
X-Gm-Message-State: AOJu0YxIy5nf89jJDHyFFmrs44ZLfGP9SxxzsM+dQig1s7FBK7MtBlDa
	O18uVWc+zsKuE7vHtTaltOpoJ3Ug3T+gvOwRCq17q2Rla0V2JQ6OlO+M
X-Gm-Gg: AR+sD11Rf9JglkKln1hq8ph8blNBYy21F1CPIVj41eCTKJBPsUbGbli1uEI1lzT34fN
	GK8+QKE+CU8L+qxPuXvEd8GPCE23OJRg0CP0nNKKVt/uoMJ59e/wPsjubBvUilm9rqHzDk6IA8Z
	U3SSk1Zps5kCD0+3N6lLd5JqTxNz19mYIU0+HbWcN6eQae7oiDANtUYjeTTxTsJo/qSQqPzG0Fn
	rI2fy/wsq0UkMD+cV4+Z2hHv+XaRhjyFfKllwzQahvhrJSHzoskvRPYLxUP1r2XZj/yxKUWZDH+
	yD41SCMMRCz+S1Tvr/+idJ0sB12l2CX7YXNU03haJkObrVxPLlyqTTDU8OdXvlbM2SSk4BVo1wN
	ex1grdT3w/CfVpaLcfLaT7QrAgAWGIAhCx59Fx7vA6oDJsYkB4U8P5/YJhvF2oCPv1uvcakKp/N
	GgZzFD4gHvLd5esTDNsx/biuhCNUerZtOWF8A2xXHKvZsJZJL2nm7z9fPt109bnLHidhxAtogZB
	WOnaOrph9NbLgW7MFUQXpqtbH9GsyxJaFMjpqESME//mhaolbMEtHGxVfXAENvZYL0sTaZh7q6d
	p1xHFZk/yUZI+Mise03jQbwyNFpwLBYGJTpPThYmg//GNicf5Dble+M9yfc3RDDYbfI=
X-Received: by 2002:a05:600c:1c21:b0:499:90f3:13b8 with SMTP id 5b1f17b1804b1-49990f315e9mr158692185e9.12.1786924958419;
        Sun, 16 Aug 2026 17:02:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc5-9401-09c8-a88d-e919-d148.310.pool.telefonica.de. [2a02:3100:9dc5:9401:9c8:a88d:e919:d148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999610e381sm114270165e9.9.2026.08.16.17.02.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 16 Aug 2026 17:02:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: compat: Keep alignment address arithmetic 32-bit
Date: Mon, 17 Aug 2026 02:02:31 +0200
Message-Id: <20260817000231.21311-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_170240_538775_8D60A9E6 
X-CRM114-Status: GOOD (  15.98  )
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

The compat alignment emulator inherited unsigned long data addresses
from the 32-bit ARM implementation. On arm64, negating the unsigned int
transfer size wraps it at 32 bits before it is added to a 64-bit
address. A decrementing LDM or STM therefore adds nearly 4 GiB instead
of subtracting its transfer size. The resulting address lies outside
the compat task's address space, so the access fails and the process
gets a spurious SIGBUS instead of the fixup.

Using 64-bit addresses also prevents transfer and writeback arithmetic
from wrapping at the AArch32 address-space boundary.

Use 32-bit types for emulated data addresses and offsets, and convert
them with compat_ptr() at the uaccess boundary. This preserves AArch32
modulo-2^32 address generation for every supported transfer form.

Fixes: 3fc24ef32d3b ("arm64: compat: Implement misalignment fixups for multiword loads")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested:
  Built a static AArch32 alignment test. It deliberately executes unaligned
  multiword instructions. A 64-bit BusyBox initramfs runs it on arm64 QEMU
  and Pi 400, exercising compat_alignment.c.

  On arm64 QEMU and Pi 400, the old kernel gets SIGBUS for ARM LDMDA,
  STMDA, LDMDB, STMDB, Thumb-2 LDMDB/STMDB, and Thumb-1 PUSH. With this
  change, all 18 cases pass.

  The LDRD/STRD register-offset wrap test also passes on both arm64
  targets.

  Native ARM32 QEMU: all runnable cases pass. The high-address wrap probes
  are skipped because of the 3G/1G user/kernel split.

 arch/arm64/kernel/compat_alignment.c | 30 ++++++++++++++++------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
index b68e1d328d4cb..c926041ee97b6 100644
--- a/arch/arm64/kernel/compat_alignment.c
+++ b/arch/arm64/kernel/compat_alignment.c
@@ -2,6 +2,7 @@
 // based on arch/arm/mm/alignment.c
 
 #include <linux/compiler.h>
+#include <linux/compat.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -41,8 +42,8 @@
 	(((hi16) & 0xe000) == 0xe000 && ((hi16) & 0x1800))
 
 union offset_union {
-	unsigned long un;
-	  signed long sn;
+	u32 un;
+	s32 sn;
 };
 
 #define TYPE_ERROR	0
@@ -51,7 +52,7 @@ union offset_union {
 #define TYPE_DONE	3
 
 static void
-do_alignment_finish_ldst(unsigned long addr, u32 instr, struct pt_regs *regs,
+do_alignment_finish_ldst(u32 addr, u32 instr, struct pt_regs *regs,
 			 union offset_union offset)
 {
 	if (!LDST_U_BIT(instr))
@@ -65,7 +66,7 @@ do_alignment_finish_ldst(unsigned long addr, u32 instr, struct pt_regs *regs,
 }
 
 static int
-do_alignment_ldrdstrd(unsigned long addr, u32 instr, struct pt_regs *regs)
+do_alignment_ldrdstrd(u32 addr, u32 instr, struct pt_regs *regs)
 {
 	unsigned int rd = RD_BITS(instr);
 	unsigned int rd2;
@@ -85,14 +86,15 @@ do_alignment_ldrdstrd(unsigned long addr, u32 instr, struct pt_regs *regs)
 	if (load) {
 		unsigned int val, val2;
 
-		if (get_user(val, (u32 __user *)addr) ||
-		    get_user(val2, (u32 __user *)(addr + 4)))
+		if (get_user(val, (u32 __user *)compat_ptr(addr)) ||
+		    get_user(val2, (u32 __user *)compat_ptr(addr + 4)))
 			return TYPE_FAULT;
 		regs->regs[rd] = val;
 		regs->regs[rd2] = val2;
 	} else {
-		if (put_user(regs->regs[rd], (u32 __user *)addr) ||
-		    put_user(regs->regs[rd2], (u32 __user *)(addr + 4)))
+		if (put_user(regs->regs[rd], (u32 __user *)compat_ptr(addr)) ||
+		    put_user(regs->regs[rd2],
+			     (u32 __user *)compat_ptr(addr + 4)))
 			return TYPE_FAULT;
 	}
 	return TYPE_LDST;
@@ -112,10 +114,10 @@ do_alignment_ldrdstrd(unsigned long addr, u32 instr, struct pt_regs *regs)
  * PU = 10             A                    B
  */
 static int
-do_alignment_ldmstm(unsigned long addr, u32 instr, struct pt_regs *regs)
+do_alignment_ldmstm(u32 addr, u32 instr, struct pt_regs *regs)
 {
 	unsigned int rd, rn, nr_regs, regbits;
-	unsigned long eaddr, newaddr;
+	u32 eaddr, newaddr;
 	unsigned int val;
 
 	/* count the number of registers in the mask to be transferred */
@@ -137,7 +139,8 @@ do_alignment_ldmstm(unsigned long addr, u32 instr, struct pt_regs *regs)
 	     regbits >>= 1, rd += 1)
 		if (regbits & 1) {
 			if (LDST_L_BIT(instr)) {
-				if (get_user(val, (u32 __user *)eaddr))
+				if (get_user(val,
+					     (u32 __user *)compat_ptr(eaddr)))
 					return TYPE_FAULT;
 				if (rd < 15)
 					regs->regs[rd] = val;
@@ -152,7 +155,8 @@ do_alignment_ldmstm(unsigned long addr, u32 instr, struct pt_regs *regs)
 				 * to refer to PC, just add 8 here.
 				 */
 				val = (rd < 15) ? regs->regs[rd] : regs->pc + 8;
-				if (put_user(val, (u32 __user *)eaddr))
+				if (put_user(val,
+					     (u32 __user *)compat_ptr(eaddr)))
 					return TYPE_FAULT;
 			}
 			eaddr += 4;
@@ -311,7 +315,7 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
 {
 	union offset_union offset;
 	unsigned long instrptr;
-	int (*handler)(unsigned long addr, u32 instr, struct pt_regs *regs);
+	int (*handler)(u32 addr, u32 instr, struct pt_regs *regs);
 	unsigned int type;
 	u32 instr = 0;
 	int isize = 4;
-- 
2.53.0


