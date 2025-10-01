Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EA4CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGpAD7So2A8Y91ye2lz/R4t8i6WlG+BPLoLmcvlg798=; b=r/5HaEox7YDYRXG5XPLfUHPgrU
	NvT1zWekM+u58EfGXoD9WuauwPiTbdkqApIyFl/zOkCc+6R2/47GUeRKVVmun9IIPl2vnqsKBT837
	m3G3aJt5fMreKsmGTcrQrKST31lzFpY0g7FXBBR/0HtTwkKG4Ojo3PBGfMk3ddPJMggd412WFsCUN
	NSim/VbbiDQpdgSsyqp4wxmYxQjprjq9ECIQPGxM94ar9fhFdZ5rg27n6UFFX/ikMvfultY/hX8kq
	nRr1MBZTTBq0AXTw/nBNwjnMTVqUAR3gWlNPVVOcBnORZ0ukzHpLhTEO62DRAVqHxTmYEKotIzCG4
	K7Nx2jyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zj-00000008zHk-2f1w;
	Wed, 01 Oct 2025 21:04:15 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zg-00000008z8h-0G8e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:13 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-40fd1b17d2bso91609f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352650; x=1759957450; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGpAD7So2A8Y91ye2lz/R4t8i6WlG+BPLoLmcvlg798=;
        b=PebIjcsvJSrwzI8pTh/Ese2R0EJxKjMKDi2cju64tJlAjBnIeTN2b+EJKvF8grzL34
         t6cSAcRVKuUfp7SG1u6GaDPNx3qpvC90M8X5//MiE0z20EfejnwZn/mF8hq0oU8Seeor
         jCs67VkkYubesYTH/o69Bb2TTBrvHIG2kS7zdqd1iTd2IGQ9vTQLzQV6SH1+GnoETVBP
         SH74P9dMP7lnsp9hrlDCio/uOAIuc196yyqn5bZ4kOGpXSOjbM4+xcKdVHGD77rT4WRG
         IWI7ebSil981q3tVAZ/bWU/8dPiVLXIBjkFgL++nhZ8Q9hVkgaZDP0o1KDOzLmYbWJBL
         s69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352650; x=1759957450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGpAD7So2A8Y91ye2lz/R4t8i6WlG+BPLoLmcvlg798=;
        b=FDar54JcwcMMKP+X9QCa0iN8EXl662lccVmXjvhyL5GV7kY63m26SrX8ajXAYZkUjM
         Mka5bnNnQj54GLWXbAJngZgvrIaf+6qTEsvC40Y3AiDoX8EC6sBgGKaeU/UJIiGEPqiU
         6i5jgQigE5oUvCcyQhEvr2pmlxieU/3FLy/pBwHmEMmZj7EQ0v+BPpgILLgZghJeDbAE
         B4UW8IZ0liIUzyN6pmsOPX9c1j5VUW49dUQDNcbhkH4VpeCz7E5TR4vIestlDQkvFXZi
         wV48Ms1efP7XqKHA3BuiDm6JrxwcG+t9E+5VZiDvk4XExDRzFCxjZSZoemB+2M74Gb1w
         LLZA==
X-Gm-Message-State: AOJu0YwICfUIMbt4VlxyGTP4hjoP/3MGXRT+L+veME2Ozp4ZbEtfCaJq
	LfEkRgSVgFEaYBiDaR2XcsrqDDmdWAmKWZVf/GhIAdPe+bC9nwQRTQ0YfUM6GzT+edNDtdUnBnn
	bKYIBv9v+7ocYZaB7/jcLEBy3yf/lXqlRBTuzylSMmPrHDgptJ3oHNEvx/Jbg+bXxxXvEzqkLJD
	PxfAlltuWDbl578sWJf53XDO0B1KYxB9lOBUxAUU6Rs6Qc
X-Google-Smtp-Source: AGHT+IHWWReVgSgZUQEq8XT+L+cxH1DIu/oJIKEaKdRtIQPT1yPlkOb9ch5vfT9GQM1XrYkcIG8pVP20
X-Received: from wrxg11.prod.google.com ([2002:a05:6000:118b:b0:403:1719:fe2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f53:0:b0:3ee:1296:d9e8
 with SMTP id ffacd0b85a97d-425577f057cmr3436647f8f.17.1759352650072; Wed, 01
 Oct 2025 14:04:10 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:18 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=ardb@kernel.org;
 h=from:subject; bh=oFEUnftgBXE3h0R5t48zlJmEk3FO4wNTPpQmOq7/RvQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePudD65SYn5avG5Dcvubcq+/Oeqwd7/dv8Lvh7dE+bzK
 E5H5/bpjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARkQRGhu9nlry9Ll7B9c5p
 S3eg+lWV5s/JX2a+vP7s0xz5d3LhTPsZ/kplbDI8nSli739/azmz6Vbd0ilZXGuOBjtYvLxl614 7jwEA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-38-ardb+git@google.com>
Subject: [PATCH v2 16/20] crypto/arm64: sha3 - Switch to 'ksimd' scoped guard API
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
X-CRM114-CacheID: sfid-20251001_140412_184914_16D9858A 
X-CRM114-Status: GOOD (  12.75  )
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
2.51.0.618.g983fd99d29-goog


