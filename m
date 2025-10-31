Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB14CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnEn/zNYGpYeH2kzoRoKsGDEwWWCiCH27FEc88gwnrM=; b=pMsUQrc0/2Rbwi6HEN/dUcTGlf
	pugZj/hcoLAZ8MylEOvsVNzPraJwvXhxrSLgMMpUnC+M5F3eVWLzvgmmujVyEXkHD8WwVqczNOZMz
	N/v4woOjpYk+Kjl2konCrTuEv3vbK1+fmPSHqrAKcfOvh3XIfXeomjX046aa42ZFMNMzpJIVWKgg8
	7caR2hq6VSAuPYGTMD5gAhm1TsqelYxCfaXNISXzt8vIsboKaI5NF6P3n9af9T/x6r24zmmKW5kFs
	Dz/LZHCQQOu8iBq1I3EQiNoesC9+E6+A8DCbphGbS6HnWGtaKyBAGE39OF+/ICb4x88HqSBJCbkOW
	E806tkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZ9-00000005vsC-0amm;
	Fri, 31 Oct 2025 10:41:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY7-00000005vE0-14km
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 31 Oct 2025 10:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fnEn/zNYGpYeH2kzoRoKsGDEwWWCiCH27FEc88gwnrM=; b=XLUJL+yOo/ceMR+UI/mfk6iVua
	58ARj46kziEml28c2HVOjk1C6a9Es8DoCRqSPj0oZAMyIa7Bl+MzhBZUFCzGCg+DciWMqgG/wxcLi
	yW0wTvqm6Ew9ymHsZZXpUUPVc2I/wF7PUtzNmCk2bx0iNN53P2MqeE5Qcl8+7tAFUEVQHB7ktcXBt
	45yjj5iAV7Dhhh1JeXkNRiziQSflDPjj1L/JfcrkqgNLp3c67zt6uECC6kf1n78gbUwceNVJf0hSS
	orkDikkSVUcwnIK92pTRAlv8rlPPXGtPDlY9nxEOcpv5ZSHe5L6lPLJ36GNZs1nslcU0SMSesAF6U
	v0P8d/qA==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElgL-0000000B39o-0dls
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 09:44:31 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-475dc22db7eso17428015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907197; x=1762511997; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fnEn/zNYGpYeH2kzoRoKsGDEwWWCiCH27FEc88gwnrM=;
        b=3noCBoIYEcaVsZBJDqXyRaORYLb80KLRf9JcuE7iB2pcwTgvCX1MSNkxtXlAes1yPk
         fa2yBJL7igL5TU2oyQoxlAN2xSS3VQQA02sI8BEKi+Mcoqnf9eCISk82RKbYhl10y46z
         wosEQGzw3vt/COs5a2Qnung7Dw/cTs+s3gqsVrsz11VkbXBec/jpRpiVQOuEOTsPvPLl
         U7W8hxx0b1ILzGpR1UB+sgGdSWMVzg1CLZVGDomky1ihPSU0MWfZsv6acvW0EhTphCgU
         CZ15uLfFqandN8p7vIq9uyOUC6MwhrqHfVsxuzq9whdBmkrzQ8oOwpFdecfAmubAunqX
         yDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907197; x=1762511997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnEn/zNYGpYeH2kzoRoKsGDEwWWCiCH27FEc88gwnrM=;
        b=i6x6Mqo7kyO9xNn14JRR3xbrFJ5m0EkoQjkvLuLYts9N0+S/E/i813bkKAQakWp082
         vjO5Gik9eUck1dq/7mTSnOsQr0LFqi2PSBhNrMXvyl/05GJ4s4kqeOSgwuZHL9DSxxDk
         SEvCVbIorAta+taf+EqQAGRcWhmTvUBeOmai+/6a5+P1UOVbKi5pIYDyoJnle0so52R9
         1SCqoyVzTmT/buu4npSkkuC+qoX8rfqPczURMVyCagMI+CPLGvcp3JK8+SWC/7D6IGXG
         wnrv+UoABDaiTwlTF9j/7KQwkMcT2pPBMB1u1mSIuo3+5BkntoVFPyO4o+5KcLMbmrAY
         ximA==
X-Gm-Message-State: AOJu0YxePjRsQSBV5/Gzzr4AMZGrUytWn4ss06/PUFaXGK/w3IlJrYCy
	dlzMbQzMD+D7zkb7mipJjBZYTQVreFxLnKBc5ieZhyG5idj05pgFanmYAuKXXd8zb7aWs/bciri
	WfH8/frlUt0p40LodwXXQzX0BSeEE+bJbxwXeLWMOZ6i4bcz/44jxOT1dihxE4b4SEkZIgJwvh6
	6gAaLdqID2EnShy+N2qioyqTDcdrIrHDZl3CrrWRnZjMno
X-Google-Smtp-Source: AGHT+IHCyP4IoqlcDxNTDlmIlfwEjZNFju0cobcumYETAExfBlb7/GHCab1JzpZ/nMQ3mxmWwEU6aIlU
X-Received: from wmbz25.prod.google.com ([2002:a05:600c:c099:b0:477:1449:b093])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e43:b0:477:e66:406e
 with SMTP id 5b1f17b1804b1-4773088be60mr32292295e9.29.1761907197646; Fri, 31
 Oct 2025 03:39:57 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:11 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613; i=ardb@kernel.org;
 h=from:subject; bh=yue2NgA2zOFgSdHmsGEDM3WvkPWdV3V1tFnMJXN62q8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4pXDLztqpIo6hLcsd73t7SATYpg2w/73MaM52isPZ
 9sdCFrbUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACayZCLD/+hF9jw8SjcfLluw
 8djdsI+hFpuVv2Ue7+59fDNvX+yWHa8Z/vvtjXpyx0itOtrFvyVh5VYhrwPVWY/3XEn/972AqXr +Gx4A
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-35-ardb+git@google.com>
Subject: [PATCH v4 12/21] crypto/arm64: aes-gcm - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_094429_319711_8A9EABD7 
X-CRM114-Status: GOOD (  12.00  )
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
2.51.1.930.gacf6e81ea2-goog


