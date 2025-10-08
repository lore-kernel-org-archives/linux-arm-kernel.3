Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B54CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9LVoYmYTtGptKcGaIqz4TtHmJpnpszkhgfxtgMZN1E=; b=Gm9aL7OaKOQxXjFXBtdpIohj2z
	z39KaYxjC7GWQvOybdMkPwWeuDeDEI/gk27zQ12qYmkFSIbTmh1FY0Gz/Og0qfDSjtmUlo3BDHG06
	OQtD9pSkiUmrGgrPIY2mgxJhqZfKulRlyR0PvFmqgVfFyu07njnpagSJGGPGhYtTt/oTk7g1YLB1H
	TSWsVYScnaZoOXXfOXSXB6oKnSlyvZ5ruRXwy930Hl/aIE7fOtLc89NSwfK690hU8AS4wRgAPKXM2
	XTIHRdnH9QOLNuQOTlmi/p55L+JusArWydPEr6fxkZ6mRxpiGwgNLNjJkj+pDNEjgkptrQoYA7eUk
	1ayUEiNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNj-00000004BhS-06Jc;
	Wed, 08 Oct 2025 15:47:11 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNb-00000004BT9-2SDe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:47:04 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ece0fd841cso66719f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938422; x=1760543222; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s9LVoYmYTtGptKcGaIqz4TtHmJpnpszkhgfxtgMZN1E=;
        b=zgZh9fIuFg8HL1N29gEjyFm7w01vv8TYlH/HvKlSs7wq/wsra+hN9Fj7jqn063M9K7
         xDUX4oM8xnQFX9g96uVXe7ojK9TX9x5ODpEHQTSXWKiIyWGqTKnonjswZhfY3WQpU3kE
         bG8X2VfS+JAFMr5MBl+XWtyw+GA6Yzr+0Jsge8KMT0gWY1038Tng5jEPN6bJ5kfJbauA
         rbh4GaI/QJwpkFfwF9VTKww951v4Zor0XRFavJQGw2vOOKxd4qq42878xN58dZni7Tkj
         B+V8XUSwhnEGhS6OoKHR+j1Kjj15LyuvDJ/eUkKHzALxgpLJl+tCxTn+jUUYnX8RUGeI
         ervA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938422; x=1760543222;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9LVoYmYTtGptKcGaIqz4TtHmJpnpszkhgfxtgMZN1E=;
        b=tkPQtKox6713eluQCaBrXSY7MHwZtpw7MeJqf+N/yaDNp6YMJhqZU10ikA+oAFx7h+
         Udxwjikk5qV6yLTL+Td7bLR6/2K0eANimGMZKv4DJsPw7tJKoSZncl+q3mnC13rs/m2j
         sbrYU04zLMXxO9Dm1EXCk42PW2beCLFkWE1pwNWPWYfi1szW5HMoj+BtBKnnTY1PF2Vl
         RhUdDBanySXZn2CR6nbIFrZ1jhawn4bcV0qyV8eoB4ExYqYkq2QjnTXK39ng3km+yZzh
         5FZeNfqtHaq1CB1g/KYBkFUld2p+erlHIUNmLx8N6vhhrgX2EmeZiIxWWyctv0zLP8VJ
         Wu2g==
X-Gm-Message-State: AOJu0YyvN+62Ao3Voa7JXnoq1+ng6LIU3hVdlJrrxf4cb74/njUUa7TA
	VaLqzcS1xXFAsJPeGm0HRI163UDrHftM9zx9dl0ZM7cjRhh8f91KrYYxSKVwk99gBREP74X2J7e
	c5165hvxXFLGpCXpudMCMO8O/VQGR9TU+Ael7U/xUx9poJxCyJiAJO3CjwI4uABNBJTR93AGnBg
	uXaDkbM0fihAedP4rcufzalMdzyYKWiqpWC4JAgvdUzEJS
X-Google-Smtp-Source: AGHT+IHpvSRci2gpv7ZU1IAhZM+xVMFiXHJZypmfvURMXvnTa0pwgCk5eYUgWECkxlzPguEf0Tz1w3HD
X-Received: from wmbd24.prod.google.com ([2002:a05:600c:58d8:b0:46e:4943:289b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d03:0:b0:3ec:e0d0:60e5
 with SMTP id ffacd0b85a97d-42667177bd4mr2760140f8f.15.1759938421849; Wed, 08
 Oct 2025 08:47:01 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:49 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=ardb@kernel.org;
 h=from:subject; bh=KbLRn3K+fhgTbW1ynT/DmRKNIqX5FUyDJ4LA4JLPqDs=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGjmh0mgHwxNRpFR0uLeyEM/7Ru0XZRuTjmbCFMD+pwVKCMPv
 Ih1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmjmh0kACgkQMG4JVi59LVyXkwD9GvEh
 GB4myAwRpn32iKqBOQuzHl9IIEadlLMcTujoQkgA/ie4fhaKFva43l0IM40cGryU1yaSMyBQQI8 ARZPeCzsG
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-38-ardb+git@google.com>
Subject: [PATCH v3 15/21] crypto/arm64: sha3 - Switch to 'ksimd' scoped guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084703_645949_67CB8491 
X-CRM114-Status: GOOD (  12.67  )
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
 arch/arm64/crypto/sha3-ce-glue.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/crypto/sha3-ce-glue.c b/arch/arm64/crypto/sha3-ce-glue.c
index b4f1001046c9..22732760edd3 100644
--- a/arch/arm64/crypto/sha3-ce-glue.c
+++ b/arch/arm64/crypto/sha3-ce-glue.c
@@ -46,9 +46,8 @@ static int sha3_update(struct shash_desc *desc, const u8 *data,
 	do {
 		int rem;
 
-		kernel_neon_begin();
-		rem = sha3_ce_transform(sctx->st, data, blocks, ds);
-		kernel_neon_end();
+		scoped_ksimd()
+			rem = sha3_ce_transform(sctx->st, data, blocks, ds);
 		data += (blocks - rem) * bs;
 		blocks = rem;
 	} while (blocks);
@@ -73,9 +72,8 @@ static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
 	memset(block + len, 0, bs - len);
 	block[bs - 1] |= 0x80;
 
-	kernel_neon_begin();
-	sha3_ce_transform(sctx->st, block, 1, ds);
-	kernel_neon_end();
+	scoped_ksimd()
+		sha3_ce_transform(sctx->st, block, 1, ds);
 	memzero_explicit(block , sizeof(block));
 
 	for (i = 0; i < ds / 8; i++)
-- 
2.51.0.710.ga91ca5db03-goog


