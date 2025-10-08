Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBC2CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14A2zAAjYNWwlBslQvMqX7czpAp/zYAIyPXaDxUH4U4=; b=BGiu1sKmysVG8E2egD8g5jAH9M
	emehR7j2TfrlCl6x13IQGMF/kHuRv2NOhu5uhPNl9RwbCqFDTCqZOzkdZ74Rz3H9p11U9ONzkrRaE
	8h9g/fOaAE15AxmqZGrdSwnU72uzo9JOiUb9PprcOvE4Hw+CXdkT+J+Ao3I4jwpZ32fhc4WmG63+w
	3ZccV667SfyCZ1dZCYK8n6kv+yfpfRVS7fCzEBomTszmXDrW4wkUwXc46LWtaEJt9LwvNI7g+7xw6
	4kN+vg9TiQkgXyQ1lFHdB1ExFsBt3VzcVIDtsrWG74KT0QAy1M+AAII3giYn90TpHsehRSxGiMPuK
	LoP5erGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNQ-00000004BIY-3zUc;
	Wed, 08 Oct 2025 15:46:52 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNN-00000004BFs-2SWY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:46:50 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3efa77de998so62344f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938408; x=1760543208; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=14A2zAAjYNWwlBslQvMqX7czpAp/zYAIyPXaDxUH4U4=;
        b=ZXZbAzUjDPAEfvlNlh13cJEPVoNRfTeGpIGVdZhbLLI19OVfwps5rKH418jrY70W6D
         qqj6Es/uEYSCY7Yx29rFQBr2FeysPch/jvKBu9nDw+TWVHwZTY0J5ZKrcA132CSSufyt
         Br8YxoIrOA6NF8CwO8dSk9LJZnQYYqSHI2LTfV5F/U7dgCfNAuKQi/hV2Vdxn3UqKIvP
         DFjtLpdAFd6d1YuUt5lVHRJx8CdC4rmWpgkthhwMatf9nPUxRrkjexP3H2E7QuJjDHs9
         /FvmBUvPTZbjRTGHsNnHNrHogHkMMPfPOw9VnDP2FcoZwJUyW+UKomO9N8nDDuwBy/OR
         2XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938408; x=1760543208;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=14A2zAAjYNWwlBslQvMqX7czpAp/zYAIyPXaDxUH4U4=;
        b=Vy6IbFq2k01+/M87lR4yBE4Lcse8Px5jGL53HHCSXu4iMWh1RL2zsLzjH2XoZtay5B
         lzuaWXTEtr1pxPDKX9ceg6uk74mmvNtyRvKzPwOuyUzgCL9hJ/1CvKS/3m6O78MT1Jt2
         7NvYEN8r0mr5s2mo3yHcay9JkRDSh51cZ2qt1FBflvOE+mN432HzqFuZqRZjnhYfLlku
         rgL9UnMqnexNmqndF23ur5/m4uDaLqndtbzhp/KKwuU7KUso7sC3Qc2UtkNu3J+GW/c6
         Ze5nAmZ0NuyEuJrVmwx2808CUHPpgbyRf6tWnsODzKlEtgGFitYVfb3BoKfFJxtIWUjG
         Qj3A==
X-Gm-Message-State: AOJu0YznPfeWDzrn6jlrCBFCm1EplYw8VVziUn4Y874likn9XcOzHthJ
	BZ7oo39bmVq5zkPBejjIFs708OjnGv//j+HZluhETOplkYTPozFHYwAoUcSrW/8pt4dn+NLvM/Z
	HSlwlxZYTl9fdTUDlIKsY4kkkcpbWHvT+94kOibKmTvCOa8aQ9OBwSqu2dfaGPedDb4ClX2OvUk
	rV9mNNzcOb0OHyY97t9rJ5/9GibG1VJfF674z0TspU25dL
X-Google-Smtp-Source: AGHT+IHEE1faiKfKH1tfDaLUrBFzle6tgkGUM1s8NmshfL2C3RktZfgqJpT+SXKKnzw1/mEsdDS3IKGM
X-Received: from wrvz8.prod.google.com ([2002:a5d:6548:0:b0:40f:b976:8cba])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:22c5:b0:3fd:bf1d:15d1
 with SMTP id ffacd0b85a97d-4266e8dde71mr2375302f8f.49.1759938407736; Wed, 08
 Oct 2025 08:46:47 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:37 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047; i=ardb@kernel.org;
 h=from:subject; bh=V+R1u4QlJCauwRhK0blDYK+Qy9hXMWQp6E2hey/88as=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu7ozS8uvGUohmk1rtfp6zv1Wq5MrdQzzun9T8pyDv
 tKV+psdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCLTtzIyPPJdPPc1bxab9711
 x85sfSLz8ybbgVdxHSd8Hs40uOCj5sTIcP/E5wlprVHtJsG9m7uYTWTlSo9EtVitL3wUfvTK0lp ZBgA=
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-26-ardb+git@google.com>
Subject: [PATCH v3 03/21] crypto/arm64: sm4-ce-gcm - Avoid pointless yield of
 the NEON unit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084649_661631_60EF4261 
X-CRM114-Status: GOOD (  13.69  )
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

Kernel mode NEON sections are now preemptible on arm64, and so there is
no need to yield it when calling APIs that may sleep.

Also, move the calls to kernel_neon_end() to the same scope as
kernel_neon_begin(). This is needed for a subsequent change where a
stack buffer is allocated transparently and passed to
kernel_neon_begin().

While at it, simplify the logic.

Acked-by: Eric Biggers <ebiggers@kernel.org>
[ardb: Simplify convoluted logic]
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/sm4-ce-gcm-glue.c | 25 +++++---------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/crypto/sm4-ce-gcm-glue.c b/arch/arm64/crypto/sm4-ce-gcm-glue.c
index c2ea3d5f690b..8f6fc8c33c3f 100644
--- a/arch/arm64/crypto/sm4-ce-gcm-glue.c
+++ b/arch/arm64/crypto/sm4-ce-gcm-glue.c
@@ -154,36 +154,23 @@ static int gcm_crypt(struct aead_request *req, struct skcipher_walk *walk,
 	if (req->assoclen)
 		gcm_calculate_auth_mac(req, ghash);
 
-	while (walk->nbytes) {
+	do {
 		unsigned int tail = walk->nbytes % SM4_BLOCK_SIZE;
 		const u8 *src = walk->src.virt.addr;
 		u8 *dst = walk->dst.virt.addr;
+		const u8 *l = NULL;
 
 		if (walk->nbytes == walk->total) {
-			sm4_ce_pmull_gcm_crypt(ctx->key.rkey_enc, dst, src, iv,
-					       walk->nbytes, ghash,
-					       ctx->ghash_table,
-					       (const u8 *)&lengths);
-
-			kernel_neon_end();
-
-			return skcipher_walk_done(walk, 0);
+			l = (const u8 *)&lengths;
+			tail = 0;
 		}
 
 		sm4_ce_pmull_gcm_crypt(ctx->key.rkey_enc, dst, src, iv,
 				       walk->nbytes - tail, ghash,
-				       ctx->ghash_table, NULL);
-
-		kernel_neon_end();
+				       ctx->ghash_table, l);
 
 		err = skcipher_walk_done(walk, tail);
-
-		kernel_neon_begin();
-	}
-
-	sm4_ce_pmull_gcm_crypt(ctx->key.rkey_enc, NULL, NULL, iv,
-			       walk->nbytes, ghash, ctx->ghash_table,
-			       (const u8 *)&lengths);
+	} while (walk->nbytes);
 
 	kernel_neon_end();
 
-- 
2.51.0.710.ga91ca5db03-goog


