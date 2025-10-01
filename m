Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E57CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acDSbPr0ckzlJYMJhQI+twxWM3EGvwpk6VEzCJHCwrY=; b=r7nmR0dFtluaH15fTpDmKR9ELU
	S8FzdYpbceUuSAeQ8ditLLJ958Es2cp/YQkYGtFybXlP5TVuwtdJO+Y7RfZ7MGNpj99B+hdACkA2D
	TQYOjxsCusFy0QOuvhLM7uMfVIKSx1NLasgdFSO9XXFb3w8MLHplnXaesDQyHjOACX7xKB2qBgMy2
	zR4ZJO37aLZmGo9VcgXumxZCmZMXVRLUyOLgTLFjuHNi31LHxTc5jFoJrezy9AiA2MsYAjk173N7+
	yQr//5KYcdaOBCu7hI6wX0xRb8e/p4T0imScHNGS9dgqzWmBmhJqCwn2FFv2ifYgSKDqcRocNU2BH
	0+zpbUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43za-00000008z1s-09FW;
	Wed, 01 Oct 2025 21:04:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zX-00000008ywy-33fz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Oct 2025 21:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=acDSbPr0ckzlJYMJhQI+twxWM3EGvwpk6VEzCJHCwrY=; b=Xdcx5aknBRyVgdx33qBgXPJUuZ
	To++HYhhmVdPsBUecbBjCCog62c+l6Chk1tIyuhDN1T2HyXLuMUtpfzhYdY/ikdICygp2mo2jYDrM
	fznXWV5GsI5X63npzySrmGRsTqwScp572MleA8Qyq7yBbJi3Bgmm7w5JUE7u+X8oV00nnv32Topz3
	C1hzDg7QIltCeMYEaZiKVSDURc2AGInzMZEBmOrqQ2J71THH6dda8YuarFIsZpWr+31sm0VmRxQ+Q
	3T+AZIe1bOp2tluTQetPWy4UZCwCUB9a7UkVd5RoFhr9dnTfMAZte3As3A+YzwGbbKabV1eJr6VZx
	lMOT/R2g==;
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zS-0000000DoOR-3cte
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:01 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6378fa71087so232886a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352636; x=1759957436; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=acDSbPr0ckzlJYMJhQI+twxWM3EGvwpk6VEzCJHCwrY=;
        b=fhwGODI0uVn0QcX3mK+Yfze0pIdNNwqaIMegxizuTETcAZfQ+AuZuMFmjFrLVTnYhF
         i1bl87KlxCpSx1xQNfQc8m2sqGK8/meI+uEAtWpDqvV5HiRBLsRG0GOXKGKANsc6nRRo
         vcAwwdvUmv6cC/fv9gnT3r+mFG6pbHbjrPj0sc1gtAWzh0sty5sVRUcjGEh/wAB8qWWT
         CZlhOjfpw6T1Cc6MpqvEz4qkd2Kd7NHxv1P4NMZ5D6NUucllVFaJxFx5h+pLqS2Q/tAr
         6T6xOH46UIL95Epg6vVyVGWoGG7Ty+8V5ktX4LGTQXQUPvpa3TJBft8MbHBmvn7zYGDV
         wf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352636; x=1759957436;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acDSbPr0ckzlJYMJhQI+twxWM3EGvwpk6VEzCJHCwrY=;
        b=bHIQbVut4W0o7zMHHxTh16UsVKDmx5DAi6dBcTVcAhMPiEh7JexLSJlE6IG846i0nD
         NOYxLSY58i5upEL8sYlR3kuKJwN3jRhrIn6RQ+B9HSwtcEsLGPvwGZp0mGMYSKqawn0N
         uuWeaeDA7kKP/3ZwlwcilmOfM8pG0wUi7YO2jECjV1U42zoh3lTWlyqk+kInHuigr5j9
         +RHATRGyU36HGtLe34Ifd6qJj8TtvCpsjcty7Ony8Zlfjuhth85QDBiP8ALirNHehKgj
         rKFo108QUZ2KKRqAG+hHR0POkvF4uk3lts2rXTffCnqJe91LPLD0Zf3sbkyTYsc6Mij9
         oJEw==
X-Gm-Message-State: AOJu0Yy+XyB1MqwuB+YZ5TZPmPn79wi8oBq5U4z0rQGNUl8HkNM8I36n
	JImqmRzmx//xHuzI75HC7e6daWMkLO6P0iJrDXGGAffGCcsYfIbSqXBNHkUPaYVl/Qpej1vCpXH
	lhN9z5zVlwf3VorwOVNna9p+tQZO5Kx4JrWK82gJ6W9WbD4b2S/oARCYcjBuBXZ2WUPYwio2Mad
	VollRNe9vVMixZrreW7HARISVztihImHf6TrnzLKcMRBRI
X-Google-Smtp-Source: AGHT+IEnx5RXeiL9kmHFg/RRSgpRtVYIAVUq2zDXnriSjY4GRqOqm0pZKleynTYr8BnmTOEPCHcJAcWB
X-Received: from edwn19.prod.google.com ([2002:a05:6402:4d3:b0:636:7d5e:f1f0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:42c2:b0:634:b4cb:c892
 with SMTP id 4fb4d7f45d1cf-63678c998cdmr5701808a12.32.1759352635997; Wed, 01
 Oct 2025 14:03:55 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:06 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459; i=ardb@kernel.org;
 h=from:subject; bh=cjwJWt4i7jKdiITTdNRuozrMElZ3Ow1rsFcjCp41v6I=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutDtRV62tdzTOWvv8H6N85apP8zU+pHE0XX+8dkfc+
 XknPnrM6ShlYRDjYpAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQATMdZk+F87y/Ne5BfOHc8/
 3mZY2B+3Pdrzc9G9588Cp8dLvpx1WsObkWHnjJRdwZa9pbmFmr8/W8ztFJOJlbz35bApq+W96/U ajMwA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-26-ardb+git@google.com>
Subject: [PATCH v2 04/20] crypto: aegis128-neon - Move to more abstract
 'ksimd' guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_220359_540193_7CA84EF9 
X-CRM114-Status: GOOD (  13.34  )
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

Move away from calling kernel_neon_begin() and kernel_neon_end()
directly, and instead, use the newly introduced scoped_ksimd() API. This
permits arm64 to modify the kernel mode NEON API without affecting code
that is shared between ARM and arm64.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/aegis128-neon.c | 33 +++++++-------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/crypto/aegis128-neon.c b/crypto/aegis128-neon.c
index 9ee50549e823..b41807e63bd3 100644
--- a/crypto/aegis128-neon.c
+++ b/crypto/aegis128-neon.c
@@ -4,7 +4,7 @@
  */
 
 #include <asm/cpufeature.h>
-#include <asm/neon.h>
+#include <asm/simd.h>
 
 #include "aegis.h"
 #include "aegis-neon.h"
@@ -24,32 +24,28 @@ void crypto_aegis128_init_simd(struct aegis_state *state,
 			       const union aegis_block *key,
 			       const u8 *iv)
 {
-	kernel_neon_begin();
-	crypto_aegis128_init_neon(state, key, iv);
-	kernel_neon_end();
+	scoped_ksimd()
+		crypto_aegis128_init_neon(state, key, iv);
 }
 
 void crypto_aegis128_update_simd(struct aegis_state *state, const void *msg)
 {
-	kernel_neon_begin();
-	crypto_aegis128_update_neon(state, msg);
-	kernel_neon_end();
+	scoped_ksimd()
+		crypto_aegis128_update_neon(state, msg);
 }
 
 void crypto_aegis128_encrypt_chunk_simd(struct aegis_state *state, u8 *dst,
 					const u8 *src, unsigned int size)
 {
-	kernel_neon_begin();
-	crypto_aegis128_encrypt_chunk_neon(state, dst, src, size);
-	kernel_neon_end();
+	scoped_ksimd()
+		crypto_aegis128_encrypt_chunk_neon(state, dst, src, size);
 }
 
 void crypto_aegis128_decrypt_chunk_simd(struct aegis_state *state, u8 *dst,
 					const u8 *src, unsigned int size)
 {
-	kernel_neon_begin();
-	crypto_aegis128_decrypt_chunk_neon(state, dst, src, size);
-	kernel_neon_end();
+	scoped_ksimd()
+		crypto_aegis128_decrypt_chunk_neon(state, dst, src, size);
 }
 
 int crypto_aegis128_final_simd(struct aegis_state *state,
@@ -58,12 +54,7 @@ int crypto_aegis128_final_simd(struct aegis_state *state,
 			       unsigned int cryptlen,
 			       unsigned int authsize)
 {
-	int ret;
-
-	kernel_neon_begin();
-	ret = crypto_aegis128_final_neon(state, tag_xor, assoclen, cryptlen,
-					 authsize);
-	kernel_neon_end();
-
-	return ret;
+	scoped_ksimd()
+		return crypto_aegis128_final_neon(state, tag_xor, assoclen,
+						  cryptlen, authsize);
 }
-- 
2.51.0.618.g983fd99d29-goog


