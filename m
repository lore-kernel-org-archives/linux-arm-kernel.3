Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC443CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwX5OSigI0JdbJe/ghC6Nz1Hun3Gyl+7nBcMkOknwv4=; b=P2Fd5KtEoK+KN0DfltqruYXK7i
	98NLeAFo7wH5zZA+W5WwiGmMHXze/E6tI4MoD6UpBeNyZY7aTolQQPA9w/eZs86aoNMCS4bt12Qm0
	ifnlW90NZtygF984zLVp2T2q5FlIEgNCotTdwbU3ibQtYr3U2P0MD9oQ2LCutcPLsgvB8PMfWQRvP
	Gg25TgxCwj7KZss55nrouyZYLhOcnMR/Ws1kUDJcdo2NXJlXClHY6QjhIMwnJirouJmypWYqOD8jc
	+XIBVymf2LfhausoSxxcS6jpvPWqgVgXaiEHbqFBQcK7tOKj7rX+j1x5FOxnVQupyY1zJL/rP9uPf
	9bSC3acA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY2-00000005vAl-2hf6;
	Fri, 31 Oct 2025 10:40:00 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmXv-00000005v55-0qeu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:39:52 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b6d35430f56so188051066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907189; x=1762511989; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwX5OSigI0JdbJe/ghC6Nz1Hun3Gyl+7nBcMkOknwv4=;
        b=Jf+XO8eF0YEUfU//itiC8YpR8+HyOwe4PNo/VpJWPePHJb3IIHEvae6zSzUeQwemRD
         g0Jdb9FFQjdys1fvrYoyz6pWCfFuDSyEU6tj1qwGfSezWzTJmlBNh2MeKsgs2GVUCc7A
         qq1ukTRLsCBvjbN3YHW3Y/pVPjibjJl8pg8vuKG0y3r2YrBHcFPs8a9NYCACFTac/X0d
         7XENmsMja79Ibs6qWfcCCtVHgzfTCQCBP8yFDs7DoF8wipioMGJQQS1riutmIrYySd2Z
         +gCPSSYFDTUQ7XpNFDdD61KJOptVrppWBMhca2M+yGTkWZ1+w4W/WAMzWQN+RdIeWqWG
         w5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907189; x=1762511989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwX5OSigI0JdbJe/ghC6Nz1Hun3Gyl+7nBcMkOknwv4=;
        b=CRC24bv6xqyftQiZDXKb4u6XVNpirNTLag31/R0VcVX+9znypQqirPyu6ppZ0UDa++
         gA/CvBe12rioAh3LmZ1L0WX9OWNid06rzAUKRJGQ8tgAfBdo1ZIhOV93K/wBnWdnE6P+
         5prDoWv6ct/vx+4Hb9gBIQzQoR/yTJEusNnqRqDu1nmibE0DkTifuUdD3EvDKpHyiD+7
         0L4SlPTcwZSiOqOmxo85+ul9b9QkbRhXIUkyn8iblRpodT7R/krDoVIcWKiufu6qAcEq
         JV2/Pi9MeYMxsIkcQbHDgAZZhYGYml/dgSWrVfUSdJUP8jcI5cIHa3cBv4O1cgNBjWxP
         7PeA==
X-Gm-Message-State: AOJu0Yz5x1fC5XYCB/NicvhxjhB5+0ZCdJifuPZX/joPZFMiXIbYZ3ZS
	TF8R6mPiapUB6uTlWbLR8lZ/iHdRtyK26KTejY6jsLpH4LbSbONmObtbhMV3xDSGN2N3C1xfz6Y
	7Cma7oyALBEfvkHnlksv+JF8ReNKGV3Xn98xfPX/O1cThZWnogEx9Ybkz/fAAw4kUISaGn/BB0y
	Z+sQ7DvQc3gk5awz2Y8QCuGZiGghWG4jAOtMd25g4gX/2Q
X-Google-Smtp-Source: AGHT+IG2w9Vi0qrSdd2t9CIYM3Jx8PEua5OuP5pZQSuAoghiP0ZDJ01QHeEVRbAeOEHa+k//Ah65fYrH
X-Received: from ejbmd20.prod.google.com ([2002:a17:906:ae94:b0:b6d:5fc2:65ea])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7241:b0:b40:e7ee:b5ec
 with SMTP id a640c23a62f3a-b7070845975mr319361266b.59.1761907189198; Fri, 31
 Oct 2025 03:39:49 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:02 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015; i=ardb@kernel.org;
 h=from:subject; bh=HLMA/w9qPUHfG22juJFC8tVZVVYrXXnkL8gtOvgDLHg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4vGA/peW+wtXBbVv7Dpsf1jj5lGGQqNs5jdprn94z
 b5wBnzsKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPJnMnI8LL7+4pN6kEvdOb1
 bjocqLR//fHEVdcE4yWCrAU2iy2Yp8zIsCdvqadSueE7XuVPQucX/n3y1+LMi9Bv9y+1n33y/2X KbEYA
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-26-ardb+git@google.com>
Subject: [PATCH v4 03/21] crypto/arm64: sm4-ce-gcm - Avoid pointless yield of
 the NEON unit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033951_259108_CE1363F2 
X-CRM114-Status: GOOD (  13.22  )
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

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
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
2.51.1.930.gacf6e81ea2-goog


