Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB0DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8Z9iG9ZM/mOKO9yo1YmJm8M5BUfmaBw3dfvTInzj84=; b=Gv+6bc1AKCdtM7tJs7VE71blK7
	277jANxn6t7C2WVP1ExA60zoeTN/ODvF+qB7w+cUTzl9/Dl86Rjab6Swy68mukNb5eNLwRXXvg6I/
	rjpL7rsBOiqXKHXwF1/iA8stIvenLZDpvI7ZwxaKJmOJxZ41NIcdhdxqd1Wu9A4Vn7hNCwCA/1JIe
	AamgfvsFpme4MAaBOHXQES6QxqWD4WA9z6+fEP06sfUfHsUj/W/QcFeRzPlPPzZiYeY8kXXn9A1u8
	h5GoqroAEIWgcJI5Ni/NCDXhW17BE7rImqZ84tTgC+7iZJMclOB2P5QOGBykEvc3Yd8qaj6qUzJx7
	txprnfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8Fe-0000000GR15-1Ps2;
	Thu, 18 Sep 2025 06:36:18 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8FZ-0000000GQwT-0EBE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:36:14 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ee1317b132so96471f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 23:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758177371; x=1758782171; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z8Z9iG9ZM/mOKO9yo1YmJm8M5BUfmaBw3dfvTInzj84=;
        b=MWfHohH3L3rHGBaavcSVobnkTIVfFonFtmRoXCa8L8iPbRTgPN1ZEoG70xhecZTUIF
         DfwXWNW7Wsj0Q0+8EBCHFvrDiAvSU9RxyT1xvA7CoATFeZV1a2PGYLVDUtKV2IKDBIL1
         ySLZ1/B91gMWCyJBl+fZiCK7n3seCYJ7SuXUhPDJ3rujHUDB2NNX7RFretkhBlowk91m
         YzGlzB/slichkFyuUvE+sC1gsialRp3JPECgwRMh2LIgZ/J3AMIHs4KD/Vu626v/jdGT
         wrvCXV6/EaUv9A0KNs5zO6u6lVG3fmWGpdYmioIFc/PJTtaYsWIc1AZTfEXwyi4IY43m
         +8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177371; x=1758782171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8Z9iG9ZM/mOKO9yo1YmJm8M5BUfmaBw3dfvTInzj84=;
        b=J9UdKmBllwfZFB4AWNAn1c9KTxh39s8BDrbR2LJY3SoMuqugQ8f9M+2lfsE5Ojd37B
         UwtYY+9/pHdo3Yj3uUXaaiKKZiz8t2IIJFfifjje2sbovBJtssnpD36H3JUs4/EcJWkE
         oOVo1A7/vMrHgHL2F4WpRgsZPA5Pkhi473hlORcb7HJR1ZuCnpHBHU4Gb2/Hw0724LBo
         sePcZb2+lEJRD29TKQ5usYvqZciB3U8eX/cOR+xRP1687JLQaSFWr5h8AZhqdFRUZGbX
         2LikqlndnH3HeUhPepYRRF2CaVKjcvbJiiE9Np9gZZVd59XKUJjtvm9Sog6aVM0DNebe
         HU2g==
X-Gm-Message-State: AOJu0YxJPG6/FCrqZ5RJXwvmG/BtPIQv4Ic1SOCFQ+SJRDLx03KEtUv+
	rNi5cB6eTpp8nKOODd5g2U3X2+lwT4FNrCgkg+3rA36lJQos2AlJYeE0WVIN2wZAiIn2XyMjYET
	Xo7I5AwNtPPycGs0ZIyq76sioXepAmBRAfAZVouzuVwpZK7++n64D7O6VKOoWgIp4I7gqI33/+1
	7/n9hJ/CL39Y4cjTY5A/OX7oMY+J5spFk8Vx0kMu5TZ0JL
X-Google-Smtp-Source: AGHT+IHxBAKGYkR61gqu3o/eZtme4C7mY2byQeaaeuydCfPZf2Zi8C+SYZvLGQxjBgBDO7fwzsRPKVL5
X-Received: from wmbei6.prod.google.com ([2002:a05:600c:3f06:b0:45f:2b4d:3c2b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:adf:fcd0:0:b0:3ed:e1d8:bd73
 with SMTP id ffacd0b85a97d-3ede1d8c23amr1247837f8f.57.1758177370889; Wed, 17
 Sep 2025 23:36:10 -0700 (PDT)
Date: Thu, 18 Sep 2025 08:35:43 +0200
In-Reply-To: <20250918063539.2640512-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918063539.2640512-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; i=ardb@kernel.org;
 h=from:subject; bh=NpGBicW7ecuYgImi2Z4C0oMoJDuRSNpKAibFeYN1DS4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0Codcfb8dR3+tWDl7z4OeX7N+7mBZfqpUzlRu0Z2Eg
 N0RjsfjOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBE1rkyMqxy3Z108I3FPy+T
 55nvPez/shUk+fnvlZowfxqX4PIFXEAVz7wF1pwVaTiwZrrgxZ7Zynsi8h5NFTE72c94dlHL5Y9 R7AA=
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918063539.2640512-10-ardb+git@google.com>
Subject: [PATCH 3/5] crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the
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
X-CRM114-CacheID: sfid-20250917_233613_110492_593D8780 
X-CRM114-Status: GOOD (  14.38  )
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
2.51.0.384.g4c02a37b29-goog


