Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA99D31768
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5C9UQXxiURmILMPEwiZdl1ShbeIW9MqWROHwJW9ezc=; b=c25+B8oldPwyAxmq0HUS7DDJRF
	Y5z6X8B5TR4W+LFs4rqh+p6i0c2bSrXs34aTJZQXnQ0t/wVA+uYYa5/yA3fVLL2BlgxgCnfDI1Yqu
	o9zfr4tlCL1qjrsajQ/7KBLaszcv0cCMGyG0i8Uz/dhe1u9CBPIbOXf0ax5gNqtyEKXMRA+ad/6st
	7U20IQXj4v4X+DhyI9C0J2WYUvl8U7I0QilNfBRhVZ2s7rJuC/EcJTMCGzKse0ayplFKn0zUJ4dG3
	wJoTviD3DgV44iaGWsaZYf+RHqdxqrXW9GOtBTY/uoIQhiywL+vR2PI5Ycpf8Nhd1iFbBxoz8Heg8
	bcHB9YQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Mqx-000000007qj-1KCO;
	Tue, 05 Nov 2024 16:56:27 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MCF-000000000PO-2JAr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:14:24 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43151a9ea95so36618635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 08:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730823262; x=1731428062; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j5C9UQXxiURmILMPEwiZdl1ShbeIW9MqWROHwJW9ezc=;
        b=Vf5aWI8bf+u9RIDxlnMPLOywILSIgtGwFZYbOKaSkvPIL5LfK7U/AU9x6Jqdnb5pxj
         MqfBVHHnFTelxVtBX17mtFLdykpVVT2LK/QmU6C7tCSRNjJrJn+htUZiycL3sxSOnBxE
         4g9IpmWxko0ZoNI/2df5yV14l7+wVlhzeAYgYCrr0wD4KyDbJMxVOYSGAJjBgu5HCLvb
         eee9/f68gJLs+CYv7zN4FH82ImG4W5zpF4Ln4TJBEZ8qW2KqPkTW4L2aK9Vd8/87KfKX
         TYG3oDYBX0oHFnkC/b6EaV9lIx+bH3urh/Xa/ZTAI6VMmZo0WFRwWeAdXPC9RA04odI+
         Vs/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823262; x=1731428062;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j5C9UQXxiURmILMPEwiZdl1ShbeIW9MqWROHwJW9ezc=;
        b=Q6XTsT467przm4BXhVFAX+At5smheXhrFnk0Tk3idb4Q0nP7OzxsFjIUCULzCHp0HL
         7kuEkLyteZYpu3ak763GSkIyX5AwOcUD6R2qHX7yR2yNxXhQnMr0+gJR6rVuUKYgc26+
         +cde22Ql1/GJ/iV5y1ROJRvts0Q/lff0w2gAgIduc76LqUzHm9aRN0saOe91QOCaf4tR
         ameYh6+6VOalZyVj4Bw/eAcmcTQG3RJxb2fvjmo5Fp1Lq30kCik+cYPN0X4+1kdkYHen
         j8qhZrx9kiRoF2HkftnuupU2ucg9/kYWYzm+TcLstimVWP+LzG6SRAR1wTAcuLrr2/kC
         uS4g==
X-Gm-Message-State: AOJu0YzhGQrvTMSf6ESJnLiNc+QWasCWoKzxOFJF+k69hIEOYVaFcL3M
	JCvErX2YU9NKGSYlEuewIb+M7hftWPRqwy/eJ1fRgSx9TUfnTHqe8hJL1O7ER7ErsrQ8uA==
X-Google-Smtp-Source: AGHT+IGoUtJ5+KmRmnOKl2AZ6ZxwHw9MzdvYo9g4ve3paCn9ggnLv8R8NjYp1xRcfQPf/t8joGA1v+aG
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:6c56:b0:431:44c4:c932 with SMTP id
 5b1f17b1804b1-432830b14dfmr1188005e9.4.1730823261778; Tue, 05 Nov 2024
 08:14:21 -0800 (PST)
Date: Tue,  5 Nov 2024 17:09:06 +0100
In-Reply-To: <20241105160859.1459261-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241105160859.1459261-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=8242; i=ardb@kernel.org;
 h=from:subject; bh=wTU9qg6b3+f755RWEvZYGTwnH7lJNldlFtFrxF4nGyQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3LWeXwTm/eq6/+PLzxffMV+f6dLy5VnE4v+j/H7dKjp
 iUrGMSndZSyMIhxMMiKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJdFcw/M+SVzEreeqg4rXr
 kLXYssdCTfEb1EvidTZcF5F2f5xwQJ3hf/yc9+ums846tMnkwgr9muMJDs29N/NuXpF/YV7dMVN VjQcA
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105160859.1459261-14-ardb+git@google.com>
Subject: [PATCH v2 6/6] crypto: arm/crct10dif - Implement plain NEON variant
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ebiggers@kernel.org, 
	herbert@gondor.apana.org.au, keescook@chromium.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081423_705999_0827FF41 
X-CRM114-Status: GOOD (  20.76  )
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

The CRC-T10DIF algorithm produces a 16-bit CRC, and this is reflected in
the folding coefficients, which are also only 16 bits wide.

This means that the polynomial multiplications involving these
coefficients can be performed using 8-bit long polynomial multiplication
(8x8 -> 16) in only a few steps, and this is an instruction that is part
of the base NEON ISA, which is all most real ARMv7 cores implement. (The
64-bit PMULL instruction is part of the crypto extensions, which are
only implemented by 64-bit cores)

The final reduction is a bit more involved, but we can delegate that to
the generic CRC-T10DIF implementation after folding the entire input
into a 16 byte vector.

This results in a speedup of around 6.6x on Cortex-A72 running in 32-bit
mode. On Cortex-A8 (BeagleBone White), the results are substantially
better than that, but not sufficiently reproducible (with tcrypt) to
quote a number here.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/crypto/crct10dif-ce-core.S | 98 +++++++++++++++++++-
 arch/arm/crypto/crct10dif-ce-glue.c | 45 ++++++++-
 2 files changed, 134 insertions(+), 9 deletions(-)

diff --git a/arch/arm/crypto/crct10dif-ce-core.S b/arch/arm/crypto/crct10dif-ce-core.S
index 6b72167574b2..2bbf2df9c1e2 100644
--- a/arch/arm/crypto/crct10dif-ce-core.S
+++ b/arch/arm/crypto/crct10dif-ce-core.S
@@ -112,6 +112,82 @@
 	FOLD_CONST_L	.req	q10l
 	FOLD_CONST_H	.req	q10h
 
+	/*
+	 * Pairwise long polynomial multiplication of two 16-bit values
+	 *
+	 *   { w0, w1 }, { y0, y1 }
+	 *
+	 * by two 64-bit values
+	 *
+	 *   { x0, x1, x2, x3, x4, x5, x6, x7 }, { z0, z1, z2, z3, z4, z5, z6, z7 }
+	 *
+	 * where each vector element is a byte, ordered from least to most
+	 * significant. The resulting 80-bit vectors are XOR'ed together.
+	 *
+	 * This can be implemented using 8x8 long polynomial multiplication, by
+	 * reorganizing the input so that each pairwise 8x8 multiplication
+	 * produces one of the terms from the decomposition below, and
+	 * combining the results of each rank and shifting them into place.
+	 *
+	 * Rank
+	 *  0            w0*x0 ^              |        y0*z0 ^
+	 *  1       (w0*x1 ^ w1*x0) <<  8 ^   |   (y0*z1 ^ y1*z0) <<  8 ^
+	 *  2       (w0*x2 ^ w1*x1) << 16 ^   |   (y0*z2 ^ y1*z1) << 16 ^
+	 *  3       (w0*x3 ^ w1*x2) << 24 ^   |   (y0*z3 ^ y1*z2) << 24 ^
+	 *  4       (w0*x4 ^ w1*x3) << 32 ^   |   (y0*z4 ^ y1*z3) << 32 ^
+	 *  5       (w0*x5 ^ w1*x4) << 40 ^   |   (y0*z5 ^ y1*z4) << 40 ^
+	 *  6       (w0*x6 ^ w1*x5) << 48 ^   |   (y0*z6 ^ y1*z5) << 48 ^
+	 *  7       (w0*x7 ^ w1*x6) << 56 ^   |   (y0*z7 ^ y1*z6) << 56 ^
+	 *  8            w1*x7      << 64     |        y1*z7      << 64
+	 *
+	 * The inputs can be reorganized into
+	 *
+	 *   { w0, w0, w0, w0, y0, y0, y0, y0 }, { w1, w1, w1, w1, y1, y1, y1, y1 }
+	 *   { x0, x2, x4, x6, z0, z2, z4, z6 }, { x1, x3, x5, x7, z1, z3, z5, z7 }
+	 *
+	 * and after performing 8x8->16 bit long polynomial multiplication of
+	 * each of the halves of the first vector with those of the second one,
+	 * we obtain the following four vectors of 16-bit elements:
+	 *
+	 *   a := { w0*x0, w0*x2, w0*x4, w0*x6 }, { y0*z0, y0*z2, y0*z4, y0*z6 }
+	 *   b := { w0*x1, w0*x3, w0*x5, w0*x7 }, { y0*z1, y0*z3, y0*z5, y0*z7 }
+	 *   c := { w1*x0, w1*x2, w1*x4, w1*x6 }, { y1*z0, y1*z2, y1*z4, y1*z6 }
+	 *   d := { w1*x1, w1*x3, w1*x5, w1*x7 }, { y1*z1, y1*z3, y1*z5, y1*z7 }
+	 *
+	 * Results b and c can be XORed together, as the vector elements have
+	 * matching ranks. Then, the final XOR can be pulled forward, and
+	 * applied between the halves of each of the remaining three vectors,
+	 * which are then shifted into place, and XORed together to produce the
+	 * final 80-bit result.
+	 */
+        .macro		pmull16x64_p8, v16, v64
+	vext.8		q11, \v64, \v64, #1
+	vld1.64		{q12}, [r4, :128]
+	vuzp.8		q11, \v64
+	vtbl.8		d24, {\v16\()_L-\v16\()_H}, d24
+	vtbl.8		d25, {\v16\()_L-\v16\()_H}, d25
+	bl		__pmull16x64_p8
+	veor		\v64, q12, q14
+        .endm
+
+__pmull16x64_p8:
+	vmull.p8	q13, d23, d24
+	vmull.p8	q14, d23, d25
+	vmull.p8	q15, d22, d24
+	vmull.p8	q12, d22, d25
+
+	veor		q14, q14, q15
+	veor		d24, d24, d25
+	veor		d26, d26, d27
+	veor		d28, d28, d29
+	vmov.i32	d25, #0
+	vmov.i32	d29, #0
+	vext.8		q12, q12, q12, #14
+	vext.8		q14, q14, q14, #15
+	veor		d24, d24, d26
+	bx		lr
+ENDPROC(__pmull16x64_p8)
+
         .macro		pmull16x64_p64, v16, v64
 	vmull.p64	q11, \v64\()l, \v16\()_L
 	vmull.p64	\v64, \v64\()h, \v16\()_H
@@ -249,9 +325,9 @@ CPU_LE(	vrev64.8	q0, q0	)
 	vswp		q0l, q0h
 
 	// q1 = high order part of second chunk: q7 left-shifted by 'len' bytes.
-	mov_l		r3, .Lbyteshift_table + 16
-	sub		r3, r3, len
-	vld1.8		{q2}, [r3]
+	mov_l		r1, .Lbyteshift_table + 16
+	sub		r1, r1, len
+	vld1.8		{q2}, [r1]
 	vtbl.8		q1l, {q7l-q7h}, q2l
 	vtbl.8		q1h, {q7l-q7h}, q2h
 
@@ -341,9 +417,20 @@ ENTRY(crc_t10dif_pmull64)
 
 	vmov.u16	r0, q0l[0]
 	bx		lr
-
 ENDPROC(crc_t10dif_pmull64)
 
+ENTRY(crc_t10dif_pmull8)
+	push		{r4, lr}
+	mov_l		r4, .L16x64perm
+
+	crct10dif	p8
+
+CPU_LE(	vrev64.8	q7, q7	)
+	vswp		q7l, q7h
+	vst1.64		{q7}, [r3, :128]
+	pop		{r4, pc}
+ENDPROC(crc_t10dif_pmull8)
+
 	.section	".rodata", "a"
 	.align		4
 
@@ -376,3 +463,6 @@ ENDPROC(crc_t10dif_pmull64)
 	.byte		0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f
 	.byte		 0x0,  0x1,  0x2,  0x3,  0x4,  0x5,  0x6,  0x7
 	.byte		 0x8,  0x9,  0xa,  0xb,  0xc,  0xd,  0xe , 0x0
+
+.L16x64perm:
+	.quad		0x808080800000000, 0x909090901010101
diff --git a/arch/arm/crypto/crct10dif-ce-glue.c b/arch/arm/crypto/crct10dif-ce-glue.c
index 60aa79c2fcdb..a8b74523729e 100644
--- a/arch/arm/crypto/crct10dif-ce-glue.c
+++ b/arch/arm/crypto/crct10dif-ce-glue.c
@@ -20,6 +20,8 @@
 #define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
 
 asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
+asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
+				  u8 out[16]);
 
 static int crct10dif_init(struct shash_desc *desc)
 {
@@ -45,6 +47,27 @@ static int crct10dif_update_ce(struct shash_desc *desc, const u8 *data,
 	return 0;
 }
 
+static int crct10dif_update_neon(struct shash_desc *desc, const u8 *data,
+			         unsigned int length)
+{
+	u16 *crcp = shash_desc_ctx(desc);
+	u8 buf[16] __aligned(16);
+	u16 crc = *crcp;
+
+	if (length > CRC_T10DIF_PMULL_CHUNK_SIZE && crypto_simd_usable()) {
+		kernel_neon_begin();
+		crc_t10dif_pmull8(crc, data, length, buf);
+		kernel_neon_end();
+
+		crc = 0;
+		data = buf;
+		length = sizeof(buf);
+	}
+
+	*crcp = crc_t10dif_generic(crc, data, length);
+	return 0;
+}
+
 static int crct10dif_final(struct shash_desc *desc, u8 *out)
 {
 	u16 *crc = shash_desc_ctx(desc);
@@ -53,7 +76,19 @@ static int crct10dif_final(struct shash_desc *desc, u8 *out)
 	return 0;
 }
 
-static struct shash_alg crc_t10dif_alg = {
+static struct shash_alg algs[] = {{
+	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
+	.init			= crct10dif_init,
+	.update			= crct10dif_update_neon,
+	.final			= crct10dif_final,
+	.descsize		= CRC_T10DIF_DIGEST_SIZE,
+
+	.base.cra_name		= "crct10dif",
+	.base.cra_driver_name	= "crct10dif-arm-neon",
+	.base.cra_priority	= 150,
+	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
+}, {
 	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
 	.init			= crct10dif_init,
 	.update			= crct10dif_update_ce,
@@ -65,19 +100,19 @@ static struct shash_alg crc_t10dif_alg = {
 	.base.cra_priority	= 200,
 	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
-};
+}};
 
 static int __init crc_t10dif_mod_init(void)
 {
-	if (!(elf_hwcap2 & HWCAP2_PMULL))
+	if (!(elf_hwcap & HWCAP_NEON))
 		return -ENODEV;
 
-	return crypto_register_shash(&crc_t10dif_alg);
+	return crypto_register_shashes(algs, 1 + !!(elf_hwcap2 & HWCAP2_PMULL));
 }
 
 static void __exit crc_t10dif_mod_exit(void)
 {
-	crypto_unregister_shash(&crc_t10dif_alg);
+	crypto_unregister_shashes(algs, 1 + !!(elf_hwcap2 & HWCAP2_PMULL));
 }
 
 module_init(crc_t10dif_mod_init);
-- 
2.47.0.199.ga7371fff76-goog


