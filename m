Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2D6CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nyu3sJfTvBzaaF8NRzdol7D0KlXiLUJYuDTKFu5v89g=; b=hKUv3qDWVbpPiRzrpezFTwdV1S
	/J+gE15eFwn+bwPAY/JPoaIujUOWUFxQbZTZb25DPfALm/0SStbZ4XFRU3WxPtRJwHBwsDCWH60EA
	lVoVR+xbWLV5tQax+XKJAZTPFDGro4yu6tbctQzEdFpUDV2BdABsllgHkfiWA2bcm8JWXa4mwcp65
	0xq9zOWGZizrfv5p3vywi1EHiQl6IZFCAySHgmp+mcvtkfKOPTFDDz48wWK5VubQSfYyHHapmyb8H
	W9ZyslxAtZrUpCtSJ2celVCN1T6HtVm0R/WuKr+Efc5jVyWJBiS8LT5C8UX1WOYX08V1cL634zsW0
	5zKWbIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8Fc-0000000GR03-1Mug;
	Thu, 18 Sep 2025 06:36:18 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8FY-0000000GQw1-0QhX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:36:13 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ece0fd841cso391587f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 23:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758177370; x=1758782170; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nyu3sJfTvBzaaF8NRzdol7D0KlXiLUJYuDTKFu5v89g=;
        b=htpkSRpSYh1h/a0w+e0tzp+2Ji4OjhZfMGKFf894FQTWbc52KTFvYkFNfk1bmVIS3f
         Ot4n2c+NiD9r5asztAigFkbdezKIUTLsvXhINuP85np8ttzU/fua12dmcH8QgsWsxCD8
         9TqYT3KYxPiyFYfphF2iV/RTcEB3VPmu/F33cbSJNjoZ6zB2rFL6CE/BKIiIOCd62ZZy
         Zh/mIz+k1pIIAnK7G8DD+nuiv5RVSruyJry4URtaMeIJ8vrwC44G+LQu8aLPt280YQ+L
         sFNku6R6DQikJWS2QhHXnhvQyEbQ3hRGenzZbv9ia5xqA/XB+PmqYGUt0EYIJvLBEf/r
         UvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177370; x=1758782170;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nyu3sJfTvBzaaF8NRzdol7D0KlXiLUJYuDTKFu5v89g=;
        b=Ijjxn+gGH0LLDJ19XmW4DdNmK/ZdSTu9OJg0v5nQY7ZbZdZGv1m67AYCjKYGIeOa9W
         zlzyUo2dC16b94+dgFuDCEYXNmIuyJPd1Hd5HDHfEQBBoHpOqxr5ZBs9NCCcQWAyppQq
         rPHO2TrRyNLXGEDlFZTK5xRIkEBsDBPAVdhjXhuoTVMTEQV8a37bxjazftIB+6f3U03U
         w9t/KKMVzFV9GvSH0NLE5uabOANXVmN1y+detMrwBVUAe0YFUO7pVzkfV5/a6TqrYGC4
         4AzuzXf/oY7KVztHSAQPSqHf22sp1rtC77vNgBPPcOJHZZkc//Q609xSJR/joXvCD3bE
         dzZA==
X-Gm-Message-State: AOJu0YynxNkQ/jV81hXvyUZJo45aObMgXNwo6wWijpgPlSgd3DJjWm33
	Z57JwDKaeoHKpb6FSjwg9UBj/2erOzV0IG5kdAZT23sz1USl+YNJs1Pe5vD4VzIEFM77M3mdXMJ
	Vqt/Y4C2OBnesP7q126odz/5so/lJ1jYEZ5isFXIRj83Zr+nRWj18YpEyciS1s4VTcC2kmh/GHp
	tUfJxZI7ooa1PY6a5pkoMLkUSdnwUcjXzgNiLxQLWTsiRH
X-Google-Smtp-Source: AGHT+IGb4uPsjREwonnmwlL62vl4gaBXll8+OUpYZ766bJ2GqzrjEt+LTSzqc6rAb48NKjy2ajlwiyBq
X-Received: from wmbdr18.prod.google.com ([2002:a05:600c:6092:b0:45c:b59f:8805])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2084:b0:3df:c5e3:55fe
 with SMTP id ffacd0b85a97d-3ecdfa3fa97mr3557665f8f.29.1758177369823; Wed, 17
 Sep 2025 23:36:09 -0700 (PDT)
Date: Thu, 18 Sep 2025 08:35:42 +0200
In-Reply-To: <20250918063539.2640512-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918063539.2640512-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=ardb@kernel.org;
 h=from:subject; bh=dTXA4xH7T53eWCY0KfUSuWwFdpHaVa8zubCJjHScVKg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0CvtShrSnrH/mf+9Kv+QanbfrxfSq7ceW7dWUPJX7Z
 uePpHtzOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEyp8z/FN8zda/WnfdybOd
 5a+eKDxrZT32aL2f9z2dhL0vHqxhNrrFyDBlU3Lq+R/eWoxC/6T+nLY9obtbbtc1+dtqsxfmnHn xMp8BAA==
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918063539.2640512-9-ardb+git@google.com>
Subject: [PATCH 2/5] crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the
 NEON unit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_233612_157031_F74377F0 
X-CRM114-Status: GOOD (  14.57  )
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/sm4-ce-ccm-glue.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/crypto/sm4-ce-ccm-glue.c b/arch/arm64/crypto/sm4-ce-ccm-glue.c
index e9cc1c1364ec..f9771ab2a05f 100644
--- a/arch/arm64/crypto/sm4-ce-ccm-glue.c
+++ b/arch/arm64/crypto/sm4-ce-ccm-glue.c
@@ -179,11 +179,7 @@ static int ccm_crypt(struct aead_request *req, struct skcipher_walk *walk,
 				 walk->src.virt.addr, walk->iv,
 				 walk->nbytes - tail, mac);
 
-		kernel_neon_end();
-
 		err = skcipher_walk_done(walk, tail);
-
-		kernel_neon_begin();
 	}
 
 	if (walk->nbytes) {
@@ -193,15 +189,13 @@ static int ccm_crypt(struct aead_request *req, struct skcipher_walk *walk,
 
 		sm4_ce_ccm_final(rkey_enc, ctr0, mac);
 
-		kernel_neon_end();
-
 		err = skcipher_walk_done(walk, 0);
 	} else {
 		sm4_ce_ccm_final(rkey_enc, ctr0, mac);
-
-		kernel_neon_end();
 	}
 
+	kernel_neon_end();
+
 	return err;
 }
 
-- 
2.51.0.384.g4c02a37b29-goog


