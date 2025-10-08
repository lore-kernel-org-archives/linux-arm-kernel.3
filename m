Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1023ECAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwsGC9QKQTLtCs75FaDogWhQBHMqAIsOgOtZEqdLRzo=; b=l7Ifhf27O+70RcKjShVzvb3YhP
	KzOsRYVqbXAVdi8Xc/nwBghOnSqZGFXxIRcm7WtBu1ELOF1DUrx+/LTyPeBI+83y5PTQLwKlzF8SH
	B+10t4ci1Ezk7dxifTFzDOv2qdqAI6jRQchfdd+RyjtcJ2n9LM0YcYVuyxdG5Njx8NknSTMS+ZdzI
	+HRYrhww+ytgIRP9FTLQxb5S30StKjx7Pb9ZA+z+yzknhbVzU/JVSi1gDyXoR/3qiyrPlZwFaTvRQ
	Nnwr+qsBYYgoR86oijVeOQeorFc5OdjNdAkdvo9t2uZHft7ELBzet1/3DM+I0H4tAIrkmI/pNb+9Q
	OMBjVP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNW-00000004BNV-1vde;
	Wed, 08 Oct 2025 15:46:58 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNR-00000004BHc-2hGz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:46:54 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e45899798so29370005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938412; x=1760543212; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BwsGC9QKQTLtCs75FaDogWhQBHMqAIsOgOtZEqdLRzo=;
        b=j2ucMuDke8V3/toEbRXxdvhHjOqlpoHWnhrbSpkD/dAh7RRkYf4Qqj9nTgexkj/ax4
         DUwbliF5QIrBRjXusuMo7MzLYzaAoitEj1X4LpxzW3yOzc4S2zFnFYCmXX7kzbBcqE9l
         vfvEBPTHAIQwOHefGGKKf2/veRUQp7tz96Uv/TY67BkgLkufZ16R17LBYFjuQhUY9sJj
         MtdkshLVK72YKu5Mrhb6njTLOYUqROKXwzzWdc5GMB4icZfIzG6vaYFtEowhcG/nklvZ
         aB5+1PbNsVjk4rDmRH86IvY/S4MZ4y9jUy+tPH67fkCGFN1sQjpZCRYb3/Rjfl8H2wMR
         DrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938412; x=1760543212;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwsGC9QKQTLtCs75FaDogWhQBHMqAIsOgOtZEqdLRzo=;
        b=vt0ArtLRDkii+FizbXn1xtcEnDHOZnvB3DcBZr3zZYYYaDzD9HqqirIoVaI6Vs+jau
         MJvGvdUJGIPs9M3OzwUuiQcnw9VqfA1twtTGxPIU25QZI4YCyWdlhmmlJXUz6/Heafnq
         9fT/sGlJcJA8zuB1QB85Uwe8aUH7mdOX7Wfi5LYOINNMhUSYJ3JpopKfPbC2JCv6H0IU
         2j/e2YIfJJzCbggXq+ZoGG0LeLIRkdKJD8AY1kosdd4Kn9uBiwQ7SRDN8QzeWBHz920x
         PON5ZDnIUZKs35VJtqOxdi6c/Jp4tgx1R8t+gJZ1j38ZjfpuMXJ+R8JifmHc83XwljZH
         AAVg==
X-Gm-Message-State: AOJu0Yxiu4RGuXrP2vHB1aCXnlcsBdNLtwsoMj+mutQGQI4oBHbGyudy
	ji794HJrlPJHMMndiMpK3M3rCSmaMJdaeu1lDNmF7qxp4q7GSN1YRYDe4TMrV2wNN3ZO5ovakIo
	MOe64lbJtKItq45NYY9BsyBh+znYVCotOAWHe0gEJI/huII10EAhJB/4MvU0rw4RnG9ZH+2rkVv
	sWyTbnmjUEbq7uUJytc1KYkiDBF80AXbxPUkiyAfduE6Gn
X-Google-Smtp-Source: AGHT+IEOgrgEpk6rF4pwgydWRRxFmyjFZR66yjaGox58gQWW/rEuccbEtdMOOvaxvGbVBzuauWSm+SmC
X-Received: from wmbd24.prod.google.com ([2002:a05:600c:58d8:b0:46e:4943:289b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e86:b0:46e:4784:cdf5
 with SMTP id 5b1f17b1804b1-46fa9a9f254mr31390415e9.15.1759938411713; Wed, 08
 Oct 2025 08:46:51 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:40 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508; i=ardb@kernel.org;
 h=from:subject; bh=F7nm70Zr8k/vjaUwWeyRiRk62Pm6f7C9Vg0TLVgfN6E=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu/6Ovtba/KtFh7eWac/6dvG0Vb6kQLLduz69rw3NT
 pfS+6w7SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQ2XmT4K99b9HVftbJii5ZR
 c4K5hGTNl4tpiZ/2z5q7WVjz134VPoZfzAWPtm382KB1uL7+b8/u0pMrj5oeOh0rknX4Tqj5v2Q 3BgA=
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-29-ardb+git@google.com>
Subject: [PATCH v3 06/21] crypto: aegis128-neon - Move to more abstract
 'ksimd' guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084653_701562_21637CC3 
X-CRM114-Status: GOOD (  11.81  )
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

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
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
2.51.0.710.ga91ca5db03-goog


