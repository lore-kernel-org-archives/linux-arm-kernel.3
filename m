Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ED6CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yWeicN1l2mf2js2fMAiSU2E7NZlQ/I1rzR2l36yFu0=; b=qAbG/tAvP0xQ5GEeDie/K3BLMF
	+NLgG8eyxv/kW4En6jyJsDvFiTkFWl+7Y2hcJ1Fh6IiSk1U5liewAi7lek3s9Aqq2PNVLSlV5/bLH
	7IKjm8s0M5/hzGG4IdR7Ld+73q0P16NoMjhAM0GxZlPY3PfdgkzdogvQEGoSFrzjanJlNQR5hrcMC
	RKnBA75pG+bSRpfw6BcEubb043FzslhbXTQ2ipQCpyZEjruuDDq5GxTzkemLLIgbtaJiq1Gk9DUu+
	r/4dDtBFE9G/DRefxeb03zbAkk/SXjmdaroQrIMDgl/nS4DisHDXKGvj1Lqh0QdXK2r5H2g8oZk0O
	A5cZ9vSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZ4-00000005vog-1Ky5;
	Fri, 31 Oct 2025 10:41:02 +0000
Received: from mail-wr1-f74.google.com ([209.85.221.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY7-00000005vDS-1mZc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:40:05 +0000
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4283bf540ceso1121424f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907200; x=1762512000; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6yWeicN1l2mf2js2fMAiSU2E7NZlQ/I1rzR2l36yFu0=;
        b=Y8j9WnvD6WrRnz11sIj+/D+zIeIMWglCMzWvLfY6Okx1J23Wc0N8vt+WXcTRcuCLLZ
         sMEISEJjkh50fSxqYibK0EE+hk3soDyjh71sI1xTz4yI08yqP7tVY1cYJhKZGSY+2Z6H
         9XcAZ5+fpNJOUq5x1NPyv+eDn7/YPB8gtPs42pLxa5Pcpj/Vv80NdJRm9i3cUEMikisy
         G3KuMbAxTKLwdP+VT7zrD0V1P7rm6eMeY6fOm+yrP+Z71qlCarMtrMnxaR8LjF2eK3fF
         gQyNPNUG+MxtAd4n80RkvUUJhMNV1jjboCK0jjUIdBA/zMKk8xLoghi+lf7/S0UD337H
         IxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907200; x=1762512000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yWeicN1l2mf2js2fMAiSU2E7NZlQ/I1rzR2l36yFu0=;
        b=PfMH49EMvmTl/+KtJKcM1Z1gBS/Ivm8V8oAYKnkD3pgO6CRqeUPGi/w+K+4QdD3nnB
         XfAo0yMdKkuOw4sw5MWnX3j6G2wJsWGbqsg9IEj4hVeegEHDZf1QUDdOezsdPAqvZSZA
         r7ex7qcQjJSlEfjQ71MdGMZmHvIkeTnh0eufIvb3pRieOuFYMVmGMkgC1yiXWMM+OvXB
         KDRu/ye27m80PxnKlm5BYwqNXQnCNJFGCAXAVHcgFvmFpFEZ+BI8NWlrtbAuAPqvd6d5
         SCjq3ZunT1YNG7HWKpMY/bap4VEpehx9Quf6ZYwPAA4cl1C5OClDcrC2kvHHGr1vur12
         JMqA==
X-Gm-Message-State: AOJu0Ywi2gcEzxDExnUwoS0YvqjOoNp7y7Mxt9howD3SRsNYArZ1pjpN
	9BEqM0VTEVFp1ZVQI3drnUrY63nny9kEgYlk1mz1rVRfJsG5o205CZtv5UOlJOb8WxRf8auQdqg
	C57Q0U/yq70kBsduDpu1LlhPgQU2sGlLk/7ueLw7ATQZb6oi4+R3w5+bWgc92+DQK6mnrMk6AD/
	9eGvThXSJn8HVomlkT2aK/AqMqNXIESsQSTQwJhp0GRsl4
X-Google-Smtp-Source: AGHT+IGge7CDFO2OF9s+yRivgMJ3E9pJmbYtIoCyI0ADpE92mt1tOKjrtt06Hn0rVZeuCfWm13CM2Kef
X-Received: from wmbh2.prod.google.com ([2002:a05:600c:a102:b0:477:172a:1020])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:290c:b0:427:9e6:3a76
 with SMTP id ffacd0b85a97d-429bd69910emr2488587f8f.36.1761907200510; Fri, 31
 Oct 2025 03:40:00 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:14 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=ardb@kernel.org;
 h=from:subject; bh=HC3oKa6XX6UzW4T61UkwwEg9itjK9pSOgUvVasKYlBk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4k3lqGSf0tTW9dM3lu6fuKnZar2H1FFe5v+PezZ0m
 Zeta/vfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbytZ3hn21Qzpv8ZRv+Har8
 9KmtbbbpjscfoguOVrx0LerWOarod5uRYUuDAgP/9kk7Mvbetlm0MWDyzq03jO+IzUisMv9cprf QmxkA
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-38-ardb+git@google.com>
Subject: [PATCH v4 15/21] crypto/arm64: sha3 - Switch to 'ksimd' scoped guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034003_522054_C8864EA6 
X-CRM114-Status: GOOD (  11.99  )
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
2.51.1.930.gacf6e81ea2-goog


