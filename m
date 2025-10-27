Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BFBCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=fZFzuFe1kZwWOtUDwXLfQwu5MJAw6qMRRDC36ZwVfYw=; b=uN930bwmZRmAa2
	rrHOPGN05x+c4CnGUTP1HP0/hMhPMnLZrdHACxZNMuVAchkcsaWBfZB7U0bt3xote0Yy9qmsF40pl
	F94opjD3HnLiH6U7WgP5BBECXPQ/rX3W/RrTb5ZL/TIzcyiHbe36X6U3KUssYl9N9hOyVfUq2TLhU
	VpAAymSLdxGe1EybTCDTFGhzhsd871Su2E7hP56cOGo709PHmKD4g1+cQ/R2I4NPy3kd0NecVMjRv
	FUgj02Jc7chn2oQgkB3Hh1gyPozRwXBebV3xsilTkXs41dMYr7lJ6RkxMY5ahHlHICqeev7U5W6hN
	+T7pLPl0KAIBh0MBsgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpX-0000000DO48-2K2r;
	Mon, 27 Oct 2025 08:43:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpP-0000000DNuO-1leR;
	Mon, 27 Oct 2025 08:43:48 +0000
Message-ID: <20251027083745.168468637@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=fZFzuFe1kZwWOtUDwXLfQwu5MJAw6qMRRDC36ZwVfYw=;
	b=iFqtRUO/UF2NLRN/kVvPD3nQK4TtwRE+uDnO/hAO9U0W3NxlSPxD/v9M3GkAgfLhzRq8vt
	CCj5rekchm56nj5Mkf0unik0Wc1yln3p29i6fLF4pDN2PJ4nydOyxBIJ7aCWP4ANtZSG2m
	EjPshhXBnv1o0WyIzzi7xVc6doO/sprXROIpHSbWiTpe3hvvz1UIyNOTUbrLwKuI0+Coh9
	kRGd2RAdEdrM7wGIoDnrf7H33CaumUKoK1SI1UJVHhvofEUCgYuVGouzrKyUl6KLHmEkfh
	zO6cBR1DBJ/kbO/dGTiHnJ+qTvaCmUiblx012RiwgwaWPfEfF3sWe7Txt2k2tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=fZFzuFe1kZwWOtUDwXLfQwu5MJAw6qMRRDC36ZwVfYw=;
	b=5XK95FhES5auvsDsX3IerBIddRz/phA3Vz8BHEXdqt/pEUw83Sq0/r1f7Qo4op0y1URgn/
	liQFWLDPUinvqECg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V5 01/12] ARM: uaccess: Implement missing
 __get_user_asm_dword()
References: <20251027083700.573016505@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 09:43:42 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014347_606162_D0E71C84 
X-CRM114-Status: GOOD (  14.19  )
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

When CONFIG_CPU_SPECTRE=n then get_user() is missing the 8 byte ASM variant
for no real good reason. This prevents using get_user(u64) in generic code.

Implement it as a sequence of two 4-byte reads with LE/BE awareness and
make the unsigned long (or long long) type for the intermediate variable to
read into dependend on the the target type.

The __long_type() macro and idea was lifted from PowerPC. Thanks to
Christophe for pointing it out.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Closes: https://lore.kernel.org/oe-kbuild-all/202509120155.pFgwfeUD-lkp@intel.com/
---
V2a: Solve the *ptr issue vs. unsigned long long - Russell/Christophe
V2: New patch to fix the 0-day fallout
---
 arch/arm/include/asm/uaccess.h |   26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -283,10 +283,17 @@ extern int __put_user_8(void *, unsigned
 	__gu_err;							\
 })
 
+/*
+ * This is a type: either unsigned long, if the argument fits into
+ * that type, or otherwise unsigned long long.
+ */
+#define __long_type(x) \
+	__typeof__(__builtin_choose_expr(sizeof(x) > sizeof(0UL), 0ULL, 0UL))
+
 #define __get_user_err(x, ptr, err, __t)				\
 do {									\
 	unsigned long __gu_addr = (unsigned long)(ptr);			\
-	unsigned long __gu_val;						\
+	__long_type(x) __gu_val;					\
 	unsigned int __ua_flags;					\
 	__chk_user_ptr(ptr);						\
 	might_fault();							\
@@ -295,6 +302,7 @@ do {									\
 	case 1:	__get_user_asm_byte(__gu_val, __gu_addr, err, __t); break;	\
 	case 2:	__get_user_asm_half(__gu_val, __gu_addr, err, __t); break;	\
 	case 4:	__get_user_asm_word(__gu_val, __gu_addr, err, __t); break;	\
+	case 8:	__get_user_asm_dword(__gu_val, __gu_addr, err, __t); break;	\
 	default: (__gu_val) = __get_user_bad();				\
 	}								\
 	uaccess_restore(__ua_flags);					\
@@ -353,6 +361,22 @@ do {									\
 #define __get_user_asm_word(x, addr, err, __t)			\
 	__get_user_asm(x, addr, err, "ldr" __t)
 
+#ifdef __ARMEB__
+#define __WORD0_OFFS	4
+#define __WORD1_OFFS	0
+#else
+#define __WORD0_OFFS	0
+#define __WORD1_OFFS	4
+#endif
+
+#define __get_user_asm_dword(x, addr, err, __t)				\
+	({								\
+	unsigned long __w0, __w1;					\
+	__get_user_asm(__w0, addr + __WORD0_OFFS, err, "ldr" __t);	\
+	__get_user_asm(__w1, addr + __WORD1_OFFS, err, "ldr" __t);	\
+	(x) = ((u64)__w1 << 32) | (u64) __w0;				\
+})
+
 #define __put_user_switch(x, ptr, __err, __fn)				\
 	do {								\
 		const __typeof__(*(ptr)) __user *__pu_ptr = (ptr);	\


