Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8460DC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vxOu3XF7bVHUG+0agmcIDyKP04Qh+pMOMDiJD5AR2Rg=; b=Skhxk9LN+z+6OiI5Duz42HTDF8
	oc8AcqvRQykKKlSiePo/+7hxnqN2+J5ZQdye/X8Elp2sqSfPOm46GHhKOc+Wc+rQ1odFslAwziGpN
	ML1bNtkXvOTgaUWDvM4pC0VTvER6OgMKMmdnXE1ahC6rJUNit1ln6OROdgOz/7+wywvgSvtnRX17W
	vuYBsdZQaRBnHT/CVmPlmok5J037yCMYxcTqiWaK2m/B2W2OFv1zrYe8J8+234uZeGjmKBlGCHugB
	zynla8FzwGxweHcIljTzXqwyNldSN5fRdZxHlRV6Q+spPtfln0yhldDlwO9xtSxWwQ+TwjPrFOvyX
	QUcsnwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop2c-00000006GHv-2vF1;
	Tue, 28 Jul 2026 21:08:46 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop2a-00000006GGk-0fXn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:08:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4954afac04bso3113435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785272921; x=1785877721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxOu3XF7bVHUG+0agmcIDyKP04Qh+pMOMDiJD5AR2Rg=;
        b=d+17QvFLElwJrJb1Kd0ZxzhK4p3QAdrTGyAdaTP36qPfrf036HYN0HefUgI+B5IdMy
         y7NHfNHabviDPaZ7IsGnOaRYexeLFt7ldHj+0I6OeaWcxTjhnkHbWfMh7FvzT1/ri+v/
         b/GF+Cxe3gcDRyf0g8BqYVABOQ5gkDbl5OaGcmUaQVIXaSVoPkzLzMZYIcZRMg8RelCx
         r18GHohp+9Qv8oCFClO8TZMjlZdljBFBha9Wr6zmp9yD1IKt207Dxnyhe5kdb1ggT20F
         Xe7YkFHaPEvbajM35GYYE5bv3+Hu11bY30tcaSgdabXKlGrQP7kqGpScLQKxKT3cUp4C
         h61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272921; x=1785877721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxOu3XF7bVHUG+0agmcIDyKP04Qh+pMOMDiJD5AR2Rg=;
        b=JO2KCff2Rre7uWWtRouJh+0rb7sKy6g/yu1HyELh8N1oO29ZNwNEQvUFkT/67LOyzP
         e2CWm8Y+Qy6Z8HHXXtXptp4eYa4Md2x1PdCjq3HfvWrSo1pyZaOzZ30CGPX9u4R8rWcM
         HovVr414H8KXFyeV77GkL0DJtp4yore2bTcyToWaerEJxzJK3DacmexzR1skTrgtAqJh
         hQiN9Z/IMBlHqFxudFZrogfOcko98vsgsTozKSJe9FoHs3FjBH27LR9+YcWO0sNkQt79
         pUTVFUdK6uHXCe3YBxFxhOC/MyVWdkFWZjSk88DXxHJXGzATY8PlRbTMt4e5u5ofXGXx
         AZLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqpMmPKy+CChz6fGzYC/IQQVlCthUVh/8taXby8ougYnI6k5QrteJUv87W/abzAPf1nZWtYKSUhn14fg+/n/xC@lists.infradead.org
X-Gm-Message-State: AOJu0YwSzJXQZX6dWxXKs/NgQq9pTr1QgQoCxsFM5Yl11nUFooT7gUO4
	v4JuN0gDmeFs3JaY6je6joYBY6w5YETOavOWsgMGzJU4iOfuCvwazdh5Cv+v/UF6
X-Gm-Gg: AR+sD11+imxzPEgxBZoUTYqi+yXsMICKKfwR7AxdulsH12TBNf0zPyCJnJu9+qoQnsj
	jUyEehCGC3HPVRtxYjCSGU6t2zOW1xTmKFSRrV8IbgKFoZbdEabG5pzFHRaSyHB69/XyE/Hur6N
	J2Zsq6IXGBpH1ZGEOXevgUWz/BhQMmvAaej2Rsx149KGfX/MVvhDR/v1H/KUF8hvUOzrUqv3Omj
	aHjYKkF7zfqf1DaGM54Ty8V8NEfGsHscrDecfG7fJJNR1RHWJd7frpqiuv3HN+m/n2cIGB31cxg
	tTvKpPH5KasP5txqkJ6ouXYgfOtu1ckRUzZGJIsfDytT5mnc/+EWI3jxJ+AbATcy3d+qJHdUuQI
	XHQTr+52P2LEgZLYbEhFqt1eaue7SC5LJALXyoZFQ00vN4TEdYu6BCD8aWr22uiKd+20PoC4mfB
	YIaWZSA1+K0F4XXf3B+cXmXfZ50R3+XQP6B0zxtDAkJUhmcRErGcF9yOpaR9KCvLEIqfvEavCOy
	WijY8iAIOjSr0xESByGmgO9f07DL8BVRLGJULucnWfJm6/fs4+eDNaJH5PmnPyN9U/89Gr/gKTZ
	o3tlQBhNmDFEL0P0OCntmc5kzCwD42scCA0U1Qg1W+vNsy1MMx0POpANqtakB8YlOSvYj1aP
X-Received: by 2002:a05:600c:4452:b0:492:6f6f:fa42 with SMTP id 5b1f17b1804b1-496c65cd672mr40420045e9.37.1785272921199;
        Tue, 28 Jul 2026 14:08:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b323-2b01-0d98-9fe8-a4cd-78ab.310.pool.telefonica.de. [2a02:3100:b323:2b01:d98:9fe8:a4cd:78ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6acfdafsm1934679f8f.15.2026.07.28.14.08.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Jul 2026 14:08:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ARM: alignment: restore uaccess state on emulation fault
Date: Tue, 28 Jul 2026 23:08:28 +0200
Message-Id: <20260728210828.10488-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140844_226334_B755D28B 
X-CRM114-Status: GOOD (  14.53  )
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


