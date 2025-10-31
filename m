Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA5ECCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HN/+IzS5796w6R+9DpNyrnH5kTzGCEYUE8OX1y/TT0c=; b=EXPRwstfAf1fKBUjRaX9oT+pOf
	6ge6VWo48D3EsdqcrpEpNnO8rt6JpRI15/VfU2Pao7RE6a6WkK/KXSAh3NwFGAaOoteR5BhCJIvS0
	B3ANOJ+doM5DWDJrduiGsnKBMFIxwx02xzcU7Af86KifQrKoMGRJykTuC3hLGv9OZ/7RCOqfsgk9N
	MjAtiQDglMQnUPnBjrPTD9kZt2NnIectAJpfsgejc83iLHc1QjFDqsW8e6MmX0oIqB7s7F4pVGohs
	DvnNqNsbeJ8napfLKu9KzS5sI2egGa755eKro+gUnUgQ7ZFsAwruORh+A0RVa+JLI9iXKjSWDUHPN
	jXW3TTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY1-00000005v9i-1ZLu;
	Fri, 31 Oct 2025 10:39:57 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmXu-00000005v50-1hro
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:39:51 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4770eded72cso11689675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907188; x=1762511988; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HN/+IzS5796w6R+9DpNyrnH5kTzGCEYUE8OX1y/TT0c=;
        b=lRDGwHtSKj8PXtt049CVC7KNCOhugC6+xWCn/v5D73tDdKvqd2CFl2liD6KS+lgCuM
         ZO8sXqHE6R3f9sHQ8UDoqNAvcnDSDOY9yJJb4Rq04Wx39ACC9GL8LDFERdSglCxAWp/1
         8L/Ujt8c8dE2lJ1RtiTSUcqVEUkhK48vtYLnz2CPeIodaf+RwLnle3fCy67MPDamkfOc
         d8FVvH0Y26rxITeECk7f655Ji5U/i7dzUu3AMMx/qVQSWNnA/W7qAjkDklngeBcDxkgS
         mqVHU6JFVJH23cVovOYs3lfX1SbIJhVAGALQKJW1ozOgPU088tchLRvTA4ND61e4KBjC
         nkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907188; x=1762511988;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HN/+IzS5796w6R+9DpNyrnH5kTzGCEYUE8OX1y/TT0c=;
        b=fIBgvfkinY6lT851rpRkLPXgurISr8TWJQ3lUou2hFR+1IpG3DIs6uCpvcyAauWFuS
         gLu3+e19WGEMKqW6iwPnBxCSKicIwSkSmvJlBaJi8fhIHW0Z58kmViuGFGqaqxMtQjGL
         MybdUfNaGuvrp5NWr28srJMsjRpEIcw6RizFuMg9VZxD6ofKrwyVJQYkvQkA4Bbg6wGp
         SrlQ0D0QRsJRP4oxl/hN5HQ5tuUVAdMLwlrScClRXUYhQ+jEb8G6Ia+VoPJFrxBI+QlM
         +FjjLOrDMGMAQh6sJHbTS8ymxALKJLNAWRxuxtGsRYwzBjR3l+q3iWR7U9Sol/PdWB+K
         QZeA==
X-Gm-Message-State: AOJu0YyR9Z6vMcf01+hx525grA9H8LSybrjtCce2gpWo2GPNco/0RD6K
	5kdzS2xnJHA6B9t58r9yX0bSm0s/yeWSsEoOs10XcL/sn7xr54r3lcNeDVhwf9vqlM+alOacVUj
	lJnfi3ZEHL7J1Bxsz+ZDychHmq7RkRFoWxKrEWjQfqf0eBW8Pa7H1uduTbkZy1JFqqXZTZy+d+q
	IdTwzDpzDQvwwYs0ReKFWAKKxOoWu4ova3gPwEa/lGqIHb
X-Google-Smtp-Source: AGHT+IHlmFXxc1C8TcZ+HXf8DCZ7hZ6snCdGJ0O89HH9mn+babxzm78NbK82txSCG6oBizn12pHWQ7nS
X-Received: from wma8.prod.google.com ([2002:a05:600c:8908:b0:46e:4c7c:5162])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a7b:ca54:0:b0:475:dc32:5600
 with SMTP id 5b1f17b1804b1-477262e8fd6mr49406465e9.19.1761907188374; Fri, 31
 Oct 2025 03:39:48 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:01 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825; i=ardb@kernel.org;
 h=from:subject; bh=yjdixCt9NaDfY8u4Fm681ZNm+FKMZ22mvY7LIiuXs68=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4rFLr9lSCrOW7tixbpb2jXSBA2sFQ/zV59hqMJ4UW
 BvJV8HVUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYy7wHD/+A1+gVed6+eSP31
 oeHEnZUKayoiHTn2rFzct9j7W+9xWxeGP3y15UmKR/Odrh3eEr7Iwj51X+TpI87ad6Rlf32r4mF fwQEA
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-25-ardb+git@google.com>
Subject: [PATCH v4 02/21] crypto/arm64: sm4-ce-ccm - Avoid pointless yield of
 the NEON unit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033950_460073_09A70FF8 
X-CRM114-Status: GOOD (  14.15  )
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

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/sm4-ce-ccm-glue.c | 25 +++++---------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/crypto/sm4-ce-ccm-glue.c b/arch/arm64/crypto/sm4-ce-ccm-glue.c
index e9cc1c1364ec..e92cbdf1aaee 100644
--- a/arch/arm64/crypto/sm4-ce-ccm-glue.c
+++ b/arch/arm64/crypto/sm4-ce-ccm-glue.c
@@ -172,35 +172,22 @@ static int ccm_crypt(struct aead_request *req, struct skcipher_walk *walk,
 	if (req->assoclen)
 		ccm_calculate_auth_mac(req, mac);
 
-	while (walk->nbytes && walk->nbytes != walk->total) {
+	while (walk->nbytes) {
 		unsigned int tail = walk->nbytes % SM4_BLOCK_SIZE;
 
+		if (walk->nbytes == walk->total)
+			tail = 0;
+
 		sm4_ce_ccm_crypt(rkey_enc, walk->dst.virt.addr,
 				 walk->src.virt.addr, walk->iv,
 				 walk->nbytes - tail, mac);
 
-		kernel_neon_end();
-
 		err = skcipher_walk_done(walk, tail);
-
-		kernel_neon_begin();
 	}
 
-	if (walk->nbytes) {
-		sm4_ce_ccm_crypt(rkey_enc, walk->dst.virt.addr,
-				 walk->src.virt.addr, walk->iv,
-				 walk->nbytes, mac);
-
-		sm4_ce_ccm_final(rkey_enc, ctr0, mac);
+	sm4_ce_ccm_final(rkey_enc, ctr0, mac);
 
-		kernel_neon_end();
-
-		err = skcipher_walk_done(walk, 0);
-	} else {
-		sm4_ce_ccm_final(rkey_enc, ctr0, mac);
-
-		kernel_neon_end();
-	}
+	kernel_neon_end();
 
 	return err;
 }
-- 
2.51.1.930.gacf6e81ea2-goog


