Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA04CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROUK26yKaM3+r4gp21QNYLzmmtvtE/oyrWIw8ssAYWA=; b=wzk+Xm3Q+LQwM44DI+06CtiW/L
	tBa3uwZQpphfDnmDLhPBgNoZ9JimWJHvftjfhvuL5mFTfA7Z3gga1Dx80l++nmF5UnykCqDgkzcCH
	EdYr/ZEwz+lujfSD4SnG3/x1EwTq0pBzRhImT2a5N1nRFQ3PFrIOnRMGNyToeF0l+T0WCyeYeT8vF
	OoUI8jj2SdqN/tmJi9rez2UBn8Jk7ZwMIgIP8utHBxXt7mGUxnzt1sMX8uF8s2RpzumK/hVeXJpPv
	OJS5w32HPF8h1qCl3+mziY/eN8ndwxPeWC4Bl7ECoRqzB7qrbOrz8Ulfaj4PNg0zG2wPjqR8hBXFJ
	WZLeTnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zn-00000008zPV-2ywc;
	Wed, 01 Oct 2025 21:04:19 +0000
Received: from mail-ed1-f74.google.com ([209.85.208.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zj-00000008zFi-42l8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:17 +0000
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6305c385adbso299819a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352653; x=1759957453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ROUK26yKaM3+r4gp21QNYLzmmtvtE/oyrWIw8ssAYWA=;
        b=lmN1v2y2gKMN702Rjsfo/IV0gbHhEcbbPtU3W19SN24Uva4ZF+8yWHbSqalZ5kqkLl
         Cl3CvTQfhHTHlt2juphp7R2WD0EDflOOwBdoJ8GUkd7AqyYimnWMeRAM1zRyA/jpxtUy
         OGlTMfe6HvT51FMeSQG7JSD5eELdV5kxrKop2/yMCuaH7bianiCjgEcxftn8OLBrn2C1
         9PBNpC/Ryb4f3hoTJakbTGus5A4moWxg2kzQ2nfepzgmLmMJLJHn/IR3ixlGvOkOIOEd
         vTcX6Fx8MkL4dzAqmSy01YdBVA+PZRacEf5Q8IIv9XZ4BIBDfYVSrYP3KAreOruUnBJw
         /NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352653; x=1759957453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROUK26yKaM3+r4gp21QNYLzmmtvtE/oyrWIw8ssAYWA=;
        b=OpDtQ0cvx+C859HBo7YeD+uw3qci3Ih/QSac4kr28uxZZoHkk871N2B5lGpoUmo4LH
         f0wpBKs9q9LsaKZ+pxfmgI8j6CI9Q2JkLWDsgfwrElWaueqQLZaVQBHNEdOtEfKA7cvb
         cVlMPo1sV2yLhz6zSGmocfKrAnVhS0GB3eMMwIFt8XomqvXMQ+bcbs2F1i9yoQ8nat5I
         9i8h8GED2+9sa3f7PdYz9px4otysAZwgYHy74pRIGvZNWFAlCBWEyHXl5LcP/Rn6avdC
         hBGplztfqrWcaVq5lYRk2uoNfUYanN7Mz+TCNvn1wv/NSmnrGF5xLe/rrMW54XreKxs7
         RA0A==
X-Gm-Message-State: AOJu0YzRhxu+xD/546izjv6DF6FlzAiG/Uu1RgGGjVtYKUncAKeTSkr2
	kaZNriuR1pGRnKS+/+uDvcHIwUt59QsTuG1xCWTP3Zk9IItSxcVpLQyHIaMlWSMVURSTdfokDFk
	OVKMLCNisGtjUX++PX87mWBUlzk3/4IYEL5JCy7PKX8KlmS3lXi+V+ua2n2MJnMXYxyuXDKw02t
	QimKPQFycJcLmYuim3akxlhrzWP4u9oMt7GuYOBq2UZqPm
X-Google-Smtp-Source: AGHT+IHdBwWuloMVUG2aiVvBgPmXkgGhEuo55jA45O9PblNGid5/E1qaOmRe7tj9K1otJi7AohsCgKdN
X-Received: from edrj9.prod.google.com ([2002:aa7:c349:0:b0:633:3402:d21b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:31eb:b0:634:cb54:810e
 with SMTP id 4fb4d7f45d1cf-63678c7b7f1mr4089985a12.31.1759352653423; Wed, 01
 Oct 2025 14:04:13 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:21 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2026; i=ardb@kernel.org;
 h=from:subject; bh=L5/WB9FoNS6vxFGUhS8qwMQNq/irqgYzuB5f44a5Viw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePudMkvCx4bO1zc0Py8oIBBvm1d5YOu6Ibcg0YiLeezT
 j1IXbymo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzEfQPDPxvRymVXmZzqHHqE
 H76zk41vn7d4zkU39zc2Hz9Jr/Q8nMzI8KM/3Ek1telkGIvnq2JXr7y+npyFfaHl/y8FMn/7MfE IGwA=
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-41-ardb+git@google.com>
Subject: [PATCH v2 19/20] arm64/xorblocks:  Switch to 'ksimd' scoped guard API
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
X-CRM114-CacheID: sfid-20251001_140416_043324_AB61C39D 
X-CRM114-Status: GOOD (  12.37  )
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
 arch/arm64/include/asm/xor.h | 22 ++++++++------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/xor.h b/arch/arm64/include/asm/xor.h
index befcd8a7abc9..c38e3d017a79 100644
--- a/arch/arm64/include/asm/xor.h
+++ b/arch/arm64/include/asm/xor.h
@@ -9,7 +9,7 @@
 #include <linux/hardirq.h>
 #include <asm-generic/xor.h>
 #include <asm/hwcap.h>
-#include <asm/neon.h>
+#include <asm/simd.h>
 
 #ifdef CONFIG_KERNEL_MODE_NEON
 
@@ -19,9 +19,8 @@ static void
 xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
 	   const unsigned long * __restrict p2)
 {
-	kernel_neon_begin();
-	xor_block_inner_neon.do_2(bytes, p1, p2);
-	kernel_neon_end();
+	scoped_ksimd()
+		xor_block_inner_neon.do_2(bytes, p1, p2);
 }
 
 static void
@@ -29,9 +28,8 @@ xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
 	   const unsigned long * __restrict p2,
 	   const unsigned long * __restrict p3)
 {
-	kernel_neon_begin();
-	xor_block_inner_neon.do_3(bytes, p1, p2, p3);
-	kernel_neon_end();
+	scoped_ksimd()
+		xor_block_inner_neon.do_3(bytes, p1, p2, p3);
 }
 
 static void
@@ -40,9 +38,8 @@ xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
 	   const unsigned long * __restrict p3,
 	   const unsigned long * __restrict p4)
 {
-	kernel_neon_begin();
-	xor_block_inner_neon.do_4(bytes, p1, p2, p3, p4);
-	kernel_neon_end();
+	scoped_ksimd()
+		xor_block_inner_neon.do_4(bytes, p1, p2, p3, p4);
 }
 
 static void
@@ -52,9 +49,8 @@ xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
 	   const unsigned long * __restrict p4,
 	   const unsigned long * __restrict p5)
 {
-	kernel_neon_begin();
-	xor_block_inner_neon.do_5(bytes, p1, p2, p3, p4, p5);
-	kernel_neon_end();
+	scoped_ksimd()
+		xor_block_inner_neon.do_5(bytes, p1, p2, p3, p4, p5);
 }
 
 static struct xor_block_template xor_block_arm64 = {
-- 
2.51.0.618.g983fd99d29-goog


