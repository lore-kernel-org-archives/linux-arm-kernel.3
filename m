Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F25D3E2BA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7BCIKpTVqIRNR9S6eacMDL7qtu1ZJ5oyLsNXt+b1AU=; b=uHSLg9lRwXJQZwZlfVB0LZ7+7L
	5/jgpFHMd54t7GyIlqNv0BlDXac+aTiiJ0Bld598tyPy+5ZcRb50POaYpCaWDvc3ZE1UNzCnZn36c
	JfjhINXdvHudR70AqhW4sfBMHfG2Kw7zUtze7gBBKb0vDcCJfbq4AQmdN41n5ZorHpO5SRE9FRhEA
	xrxYrkX4ZfpngEjib8USPMcB6SINLk3/vZNcUv/HCwclp1vqE5aXVYnusPDFjnjOGYjp97ZOpNgS4
	cMlD8VeN2fed/945xTSKffEcOdyAFEwRgJqQNFCzNhnPYpV/dIBMkFLEEdAXV06g3kS7hTCeVkWWT
	JSWZ+l3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VG6-0000000Bz2R-3CvN;
	Mon, 28 Oct 2024 19:18:34 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V0n-0000000Bw2u-0Z2z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:02:46 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43159603c92so31365715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730142163; x=1730746963; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a7BCIKpTVqIRNR9S6eacMDL7qtu1ZJ5oyLsNXt+b1AU=;
        b=ZL9ygH4ezKQdjTyxG2rJQrYm1Kru/9w/n5+l5RXg/c/71z+v/hM6k0+k1CCBFh1O/r
         +08tNQaJCFHj6p+ObdMnG+jX6NfroSzZYpQmGOSJ8kLw/NRaaURoo+KOSmtYDHqPQ7Hx
         /6oKZhj0C8uld1Nj4UJSOcqKCQmAnzwhmO8Kf2d2M9+ZsJ4k+jI0wWeJuYtnq4CMbA8O
         ZTREN49ChMxeWz7eLDkkbs0Q38Wl+TTJgRnW/5yDoooNB3JdrKTKhMh/K5ZipjhEAMVu
         x/u2MurpWZlB3bStDhW4sfaHNqKxR//u3K9tzq33XgKIgS9JXaRMjChNDqoplnf60cXE
         p1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142163; x=1730746963;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7BCIKpTVqIRNR9S6eacMDL7qtu1ZJ5oyLsNXt+b1AU=;
        b=nCvZXxWWS9fpU2oUDl4YgBRvK4vW6/cFU/YMhhcccwC7D3vqTXEWwwLtkOvYVlHvtw
         G6g+RndHrESj5B8Hx/eccKUQvHe9g3YZVIPzALnEfiJyIZSl5RtuRJ3+TJCH2tyqU7kW
         yczKUa1cUTRPWcLMWqGVOh7kZJhKngc09d6fHC7EjlpkbqNZt11vg4kYYZZtDGS0QRW0
         U2Bsr09UpDOekaRpjqlbqlSIFdeE3LLTB05tBxGPfoylQUn9Foq7hbQglV3xsUfi68u1
         bzCfwQrtb8/5CQYFkKUuXQ+loX5AkBJ4VGbp0wmaEkhHF4fIbmy4wd/0SPNkEB7Lz8dK
         pGjQ==
X-Gm-Message-State: AOJu0YwobdpKr0uz8cwzsVj+vNToqIEc10uUyvg/6svaHsjArUq648AT
	gQtTWwPMPCs8CNZyI60B1+inBEa9tS+gFog1PeV4GCExBsMQJX1kRZAGfqTVTOvz9h+xaQ==
X-Google-Smtp-Source: AGHT+IEzvN2ok8rDBPNnkk6TZNp9LKGhiBd3e2OVhcExVW8L9WPTUFB0RHTWAmh3/KKNio+2HfLioMjl
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:4306:b0:42c:a7dc:a5be with SMTP id
 5b1f17b1804b1-4319ad1fc7bmr1257055e9.5.1730142163422; Mon, 28 Oct 2024
 12:02:43 -0700 (PDT)
Date: Mon, 28 Oct 2024 20:02:14 +0100
In-Reply-To: <20241028190207.1394367-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241028190207.1394367-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5729; i=ardb@kernel.org;
 h=from:subject; bh=eoCM7N8BhzX8EfbDlPGwcIi6u3yVlDPFwPgcxjWgo+Q=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3+/g7m2yfeb4usKay/K6ry867R8S0XL7ef+HZjZ6a5i
 oT23G+7OkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEfOcyMnxivttTWmitdX1Z
 kEibDdsUMcFzM42arr44MT9Ws/ftb2mG/+EzCzXspqdZuOzo/+hafl5Vk0d/dszOCOWzGuwKehp TGQA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241028190207.1394367-14-ardb+git@google.com>
Subject: [PATCH 6/6] crypto: arm/crct10dif - Implement plain NEON variant
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ebiggers@kernel.org, 
	herbert@gondor.apana.org.au, keescook@chromium.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_120245_203623_1A66BC55 
X-CRM114-Status: GOOD (  16.45  )
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
mode.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/crypto/crct10dif-ce-core.S | 50 ++++++++++++++++++--
 arch/arm/crypto/crct10dif-ce-glue.c | 44 +++++++++++++++--
 2 files changed, 85 insertions(+), 9 deletions(-)

diff --git a/arch/arm/crypto/crct10dif-ce-core.S b/arch/arm/crypto/crct10dif-ce-core.S
index 6b72167574b2..5e103a9a42dd 100644
--- a/arch/arm/crypto/crct10dif-ce-core.S
+++ b/arch/arm/crypto/crct10dif-ce-core.S
@@ -112,6 +112,34 @@
 	FOLD_CONST_L	.req	q10l
 	FOLD_CONST_H	.req	q10h
 
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
         .macro		pmull16x64_p64, v16, v64
 	vmull.p64	q11, \v64\()l, \v16\()_L
 	vmull.p64	\v64, \v64\()h, \v16\()_H
@@ -249,9 +277,9 @@ CPU_LE(	vrev64.8	q0, q0	)
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
 
@@ -341,9 +369,20 @@ ENTRY(crc_t10dif_pmull64)
 
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
 
@@ -376,3 +415,6 @@ ENDPROC(crc_t10dif_pmull64)
 	.byte		0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f
 	.byte		 0x0,  0x1,  0x2,  0x3,  0x4,  0x5,  0x6,  0x7
 	.byte		 0x8,  0x9,  0xa,  0xb,  0xc,  0xd,  0xe , 0x0
+
+.L16x64perm:
+	.quad		0x808080800000000, 0x909090901010101
diff --git a/arch/arm/crypto/crct10dif-ce-glue.c b/arch/arm/crypto/crct10dif-ce-glue.c
index 60aa79c2fcdb..4431e4ce2dbe 100644
--- a/arch/arm/crypto/crct10dif-ce-glue.c
+++ b/arch/arm/crypto/crct10dif-ce-glue.c
@@ -20,6 +20,7 @@
 #define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
 
 asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
+asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len, u8 *out);
 
 static int crct10dif_init(struct shash_desc *desc)
 {
@@ -45,6 +46,27 @@ static int crct10dif_update_ce(struct shash_desc *desc, const u8 *data,
 	return 0;
 }
 
+static int crct10dif_update_neon(struct shash_desc *desc, const u8 *data,
+			         unsigned int length)
+{
+	u16 *crcp = shash_desc_ctx(desc);
+	u8 buf[16] __aligned(16);
+	u16 crc = *crcp;
+
+	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && crypto_simd_usable()) {
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
@@ -53,7 +75,19 @@ static int crct10dif_final(struct shash_desc *desc, u8 *out)
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
@@ -65,19 +99,19 @@ static struct shash_alg crc_t10dif_alg = {
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
2.47.0.163.g1226f6d8fa-goog


