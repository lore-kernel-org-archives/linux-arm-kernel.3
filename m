Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A371BCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKVgCyEYUlEYJnl7IzVVeeoQQVhKM/SWcfJ5A7yRcl4=; b=g/Lz9qo1UjyCMHQ007smdw4EQk
	5U2AUGfTKAP3HrDYgGWeJIDwlBsEhaok+Mv2pW60LuZu6dOxTfw/x/HHy7dXKVC4qcUtSArUmu3nT
	1GYftge4HXzZPLSS+f0B0IUBr7Tv28rhvKYYTO3izNp66CpZ5LA9asvvz2L4FBQ0wSMrxfcdFw0+X
	buLG85rASOM04HjC8P0ixJ8MusbKhUEpOfTFMIgwQTXhu2RbwqqA0xwlRcQqOneR2Wo2Uf2kOoetA
	6OmZi4g2Xm51iCalDSdsMUz8pc0QilqCHs/7G+z2BCBScaffwZzEUi8thTHSTQCNZsQW0aHykQMN7
	3uDj/ZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zY-00000008yzg-3rKX;
	Wed, 01 Oct 2025 21:04:04 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zW-00000008yvq-3sMf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:04 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e4943d713so1254495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352641; x=1759957441; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKVgCyEYUlEYJnl7IzVVeeoQQVhKM/SWcfJ5A7yRcl4=;
        b=gMw/ia5qvxjjdO0TpAlHdE6iSeP4vSHl5bTg8Hf49IoJQ4V5T8lFrjibml5LazcuNo
         c5MxdsZlj3hR1m1D/X2Adb9old3ps3uiHxOeQtkyWqTvjRcmyPcRl3yw9f8oOkrcnVhS
         10pluOdHGN9KGDxDX5I8c4eOyxBXz2dOWwxGoT3AzVSuq/TLL3WaPWJftHFa3ICkz/RF
         d8I4HXWzN/Qr08dFjFMGBxajaup5wSrq+6PsUzh2ub7cBRci+vN+Sf/RnT5t8UBB/ldd
         /xgv5o1FLWJofIB0M6rIcqdL0tUF8/t2pAHk+KFnnZfo5rEHiYWrRqQ7eOrX4qXdycoG
         XF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352641; x=1759957441;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKVgCyEYUlEYJnl7IzVVeeoQQVhKM/SWcfJ5A7yRcl4=;
        b=uR9ggX+pKWzaNsiTnK2EpF2fPzccIfpQU5vBSpMqZ73HbmtZx0NM3DIEI6EeaKIeyL
         St0Talcvw1v41/XiMrs62SnPPwvsug1UmB2t10LVUykG5KJabJ12x8dFlzsWQ/zxosv4
         FABaOGW3nmmUWIoOZqgmc7CT0FaRHRdVWi0c+5BCD+aP5mxnrcgWJJsFwzLjH7vPZUN7
         kdAbB148iFyf7FnNQu6vETrWKqbBYvtbOuNNSc68KFB/e6fxFkJEvQRe8jM57UC9CLDc
         4sC8V3BAaaAHN6ltc2KH/DyiKhIU/19eTT1FzdHcM+tx1y6ctxnQQjwD1zGYKxZKt2wN
         0lfg==
X-Gm-Message-State: AOJu0Yy45INarKVtUAT/1xyb/wxR+wNp3b0pDfQDFAifBdUxAQ+S88Qb
	pxaXfmtYpxA+9N4PIkwKU4p2sKjpxdrIxVGBJ8rsuVW6gXiNX4cx5VoIvTy2NeYMfo4m6B7iKXR
	mCm3Sc6NHP+vq+R4L+EfGcK87HLyPYyBOFlzuklhvyIbTTg4auL/WNph37HNq0UMyTwfZgx71h/
	sdwOoHu5zz9qt8MRCyC/cljHuEjUOrb9w0jlxaOsRTb1Ge
X-Google-Smtp-Source: AGHT+IHDmr/Nj33e2mS518oZ37yPaOtdq4b9XOTrdSeSEajRVgzVPmNn2xLCvIBcNV1g6wzgv51cRxYJ
X-Received: from wrge9.prod.google.com ([2002:a05:6000:1789:b0:421:8d6a:e0b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:18a6:b0:3eb:a237:a051
 with SMTP id ffacd0b85a97d-42557820770mr3555146f8f.58.1759352640509; Wed, 01
 Oct 2025 14:04:00 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:10 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=ardb@kernel.org;
 h=from:subject; bh=ibLsffhkx3eQuDIH6wng+X3cde8PFK2qiv2gBQvEgB0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutDcHLTbs9tkZJfys9AfjVivVRQv3qXhZt9g/3VRX8
 NRJsOZvRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhImxDDf4esiwetRG6+KPnm
 dV3iVm7kOcUz9zdPjTqh5XVbccJP178M/0xnpNX4dnd6mPue5Dt550ecgevSD2vKLggFBe54s/6 hGDsA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-30-ardb+git@google.com>
Subject: [PATCH v2 08/20] crypto/arm64: sm4-ce-gcm - Avoid pointless yield of
 the NEON unit
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
X-CRM114-CacheID: sfid-20251001_140402_984543_FDCD6AE8 
X-CRM114-Status: GOOD (  14.96  )
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

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/sm4-ce-gcm-glue.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/crypto/sm4-ce-gcm-glue.c b/arch/arm64/crypto/sm4-ce-gcm-glue.c
index c2ea3d5f690b..170cd0151385 100644
--- a/arch/arm64/crypto/sm4-ce-gcm-glue.c
+++ b/arch/arm64/crypto/sm4-ce-gcm-glue.c
@@ -165,26 +165,22 @@ static int gcm_crypt(struct aead_request *req, struct skcipher_walk *walk,
 					       ctx->ghash_table,
 					       (const u8 *)&lengths);
 
-			kernel_neon_end();
-
-			return skcipher_walk_done(walk, 0);
+			err = skcipher_walk_done(walk, 0);
+			goto out;
 		}
 
 		sm4_ce_pmull_gcm_crypt(ctx->key.rkey_enc, dst, src, iv,
 				       walk->nbytes - tail, ghash,
 				       ctx->ghash_table, NULL);
 
-		kernel_neon_end();
-
 		err = skcipher_walk_done(walk, tail);
-
-		kernel_neon_begin();
 	}
 
 	sm4_ce_pmull_gcm_crypt(ctx->key.rkey_enc, NULL, NULL, iv,
 			       walk->nbytes, ghash, ctx->ghash_table,
 			       (const u8 *)&lengths);
 
+out:
 	kernel_neon_end();
 
 	return err;
-- 
2.51.0.618.g983fd99d29-goog


