Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD40CCD188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0Zu7n3LaOo+I8CYEuQkDSSyekyMvHu55FmTnZPR1Fs=; b=BVwjADby3BHOEyVYk1qIrNVtlH
	IW0HahLEWscsBT2XC2wbLAXq2yDfkC3ewuLfaDRgI7Uvzp1hY7uQ/aNDBs1tCUIFkZTvxXAvGZT0X
	wGZwhxwfQGmNFFbyWKUVs8sJ451NuFfvrWIj0OR5NPY9Z4sxp4uKq9+dmaiJI5gXGiug2fn1B9tP6
	CDARpewFzcDpZybJ4HvB9Ul82BUPyWjB/drAFEEtwkeIhtHZXd+PXADpgjIhQQp85Cbzldp7wb6hS
	cG7PYQ+FNTUaKmuU1g4hwYLpacp542w+pxN5Chh6xHv4JHMoWx2054YRVEvaOXBhs/Hjsgx/oe2cZ
	a523h/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNe-00000004BYl-07a2;
	Wed, 08 Oct 2025 15:47:06 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNZ-00000004BP0-0XZV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:47:02 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6394afe514eso6335189a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938419; x=1760543219; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Zu7n3LaOo+I8CYEuQkDSSyekyMvHu55FmTnZPR1Fs=;
        b=oxPNIOIsqzfcJPa1T2bFE/MZu3KDZwNepHlJci9aNDkuirnKSulxaWo0lBjXpUDUxT
         g1LkNpORsayxQKaLcpg0S5RIGzm/d/x6AznXgVCF6qVFbHpMJFZcdzDVr89jky/wcPNH
         MNMXh4TI8rMfEvfRESY9UDDaU7uMkI2r/Hx2aTBu0d+PX7go2WaSv1NnoRH79tw8jcM5
         IXsk+6UV2OTDTQyMw+V6xs4MQqfITnzb63MPOKZHMItBBdEJji0e9cd/G4851iZjrqQ7
         TrxKADNO+FeM/fTtvD3Z0Nhx2NOMljmletgWBzQ06GZfUf4llRWTocFPOZTSui7sWiPi
         1vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938419; x=1760543219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Zu7n3LaOo+I8CYEuQkDSSyekyMvHu55FmTnZPR1Fs=;
        b=mOQrqBuTujf+wOTb/ahUdwL14hM//YXhAtiuKdef/p2JHDQ1fho8u4Me2ux3yo+chU
         oCRWQgkv6peXJh4DzcuJS11qZ5MWAL18PvufVQuzea/mG1xLshNPp/2iy90OhjiV2eAS
         ASJBt5uuWUeJxHDuBxBNAK5omiyNTqYoI0CG/goVVeZSxcqTl17rStTGpmsNlp6Rt8Pb
         kkGrcELLTmCOWff8ERj5ef7ZHe5gvcSuu3aVbItVbNx+gzd5Cpz9V7NiUnnixwOakMI+
         qcwamMebAz601NKQQWbtiMM6tx0tjM0qqxfMkde6hViS8N35hhNH8LM5aHbHZmES3Gn1
         07gA==
X-Gm-Message-State: AOJu0YxA67nRofzgynXa+CvbxOjLXE5FEnbwD9Eqtrvt1772owsVKrPn
	JS00enbADgw7c44c00OGlsnqSy4uqcZ0OKbCHFQIT+7LwdvOe7tas6N+uJmihITWxsoqR6imVKN
	seoQG343bITKFkkY3vhGnivJjM200sx/Flyt/fhne9X4qs9MsnrbkZxLgeACt0n1m7DSiEustIn
	NB9sod5LgUVBBXYBlA6P47k5PMy33zV79pyOQ+59KL/VRT
X-Google-Smtp-Source: AGHT+IGav2hs8j+BD8Ez6wtFb9ryWmg+5Cqi/FdQRo4iR29OSB6a6/a1XkaaR/BdhniWetTsV5AzKnAF
X-Received: from edg11.prod.google.com ([2002:a05:6402:23cb:b0:633:88ce:6ba1])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1ed0:b0:639:e469:8ad1
 with SMTP id 4fb4d7f45d1cf-639e469a2e6mr1875949a12.20.1759938418627; Wed, 08
 Oct 2025 08:46:58 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:46 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613; i=ardb@kernel.org;
 h=from:subject; bh=5MqfiBK+zzoh8ZIeemHCwImcnXO2p3OW2OkltAZA92c=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu6PQv0s/3R6FHTWrvdppvE8hc+vPH+tbHDdp7mpvM
 V4evbWxo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEwkezEjw0qBPKbzws7Ls/O1
 ouV3v2yt4VpzsfVj3Rr2CQcy7kcG6DD8s28KWpu+NjTuYv5NwwkVnJz71GZnX1lqLbpLJixgrcQ EFgA=
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-35-ardb+git@google.com>
Subject: [PATCH v3 12/21] crypto/arm64: aes-gcm - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084701_194598_FDD28EC1 
X-CRM114-Status: GOOD (  12.34  )
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

Switch to the more abstract 'scoped_ksimd()' API, which will be modified
in a future patch to transparently allocate a kernel mode FP/SIMD state
buffer on the stack, so that kernel mode FP/SIMD code remains
preemptible in principe, but without the memory overhead that adds 528
bytes to the size of struct task_struct.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/ghash-ce-glue.c | 27 ++++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
index 4995b6e22335..7951557a285a 100644
--- a/arch/arm64/crypto/ghash-ce-glue.c
+++ b/arch/arm64/crypto/ghash-ce-glue.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2014 - 2018 Linaro Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#include <asm/neon.h>
 #include <crypto/aes.h>
 #include <crypto/b128ops.h>
 #include <crypto/gcm.h>
@@ -22,6 +21,8 @@
 #include <linux/string.h>
 #include <linux/unaligned.h>
 
+#include <asm/simd.h>
+
 MODULE_DESCRIPTION("GHASH and AES-GCM using ARMv8 Crypto Extensions");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
@@ -74,9 +75,8 @@ void ghash_do_simd_update(int blocks, u64 dg[], const char *src,
 					      u64 const h[][2],
 					      const char *head))
 {
-	kernel_neon_begin();
-	simd_update(blocks, dg, src, key->h, head);
-	kernel_neon_end();
+	scoped_ksimd()
+		simd_update(blocks, dg, src, key->h, head);
 }
 
 /* avoid hogging the CPU for too long */
@@ -329,11 +329,10 @@ static int gcm_encrypt(struct aead_request *req, char *iv, int assoclen)
 			tag = NULL;
 		}
 
-		kernel_neon_begin();
-		pmull_gcm_encrypt(nbytes, dst, src, ctx->ghash_key.h,
-				  dg, iv, ctx->aes_key.key_enc, nrounds,
-				  tag);
-		kernel_neon_end();
+		scoped_ksimd()
+			pmull_gcm_encrypt(nbytes, dst, src, ctx->ghash_key.h,
+					  dg, iv, ctx->aes_key.key_enc, nrounds,
+					  tag);
 
 		if (unlikely(!nbytes))
 			break;
@@ -399,11 +398,11 @@ static int gcm_decrypt(struct aead_request *req, char *iv, int assoclen)
 			tag = NULL;
 		}
 
-		kernel_neon_begin();
-		ret = pmull_gcm_decrypt(nbytes, dst, src, ctx->ghash_key.h,
-					dg, iv, ctx->aes_key.key_enc,
-					nrounds, tag, otag, authsize);
-		kernel_neon_end();
+		scoped_ksimd()
+			ret = pmull_gcm_decrypt(nbytes, dst, src,
+						ctx->ghash_key.h,
+						dg, iv, ctx->aes_key.key_enc,
+						nrounds, tag, otag, authsize);
 
 		if (unlikely(!nbytes))
 			break;
-- 
2.51.0.710.ga91ca5db03-goog


