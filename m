Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5455ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCqfiDMNXwNp3eFCLlUtfPhbgD3LgIedHtp2uSYpz9o=; b=WuK1Qc8+hgzknuT1IPllxE7/iM
	nANyFosjuPVpHbW/Mw7HHYXkjjMJi9ckiHvqRHasLW6dT7wiYBQqdcw7kzbtdIqD/5Qd1mWJYWNfa
	9NWLyNuZI9JMi9jYMi1rLteFaACH4fOU0stQeRrL9hwD+dlA9PqZXqw85b6rLxYtFyV8res8/ruVt
	s3qqo93g6lQ3x/SkAd7bc4n2wd0w/tDgHMWOxnU9i95mphKtlqT7lJOILe2yfLX69xK4hf48FKIOl
	37MkHIHbnDK1uAGtfOKlp3ZkKzL/kQb+qVRAXr44hPIitQcOn8WZ7EBd1B4m1j0oHbmjEj9+6bQ1j
	+bfyNrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNs-00000004Bvd-1ieC;
	Wed, 08 Oct 2025 15:47:20 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNg-00000004BYh-0MeN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:47:10 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e303235e8so12375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938425; x=1760543225; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pCqfiDMNXwNp3eFCLlUtfPhbgD3LgIedHtp2uSYpz9o=;
        b=Z1Go5CIZbo2KYWU/c+kxDrASGhvymgyA1uXCjkDOWCA/Q/HnF2UzqE7KyocNUEUkYd
         YCwmJk3htgpbRyzPTzu7TPjKyi+2I4kAK9m3oazusHtosf8e7UAnqgJjSoXB9IypONwl
         LxyKNrRD33lzJE6B6ypIXL3N9kvKeYTB7wLf5gqa31YGrcnx9KCVeEEi8svJCeM6+l7m
         2gleFSMUO9K1GPEQy7LE9XiDgrcs7fxgBZ3ChO2FGWYpSsMoowoZFJl7pAGYBf7WIoTB
         KnAcbbfaN1/tq/tN6zwftTNv+Od94xU9Qcz6qSA7PVJC64yAwongyumKufGvtfkyF8zQ
         aGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938425; x=1760543225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCqfiDMNXwNp3eFCLlUtfPhbgD3LgIedHtp2uSYpz9o=;
        b=XZSm8QvUKxK233b+5Al+q02j+/ZEH6GBl2I41EFU3k3VENnGdfFxHZrDVENb2FErsL
         XFSOCp3wI3Z56GQA+/5Tdv/sXC+0i33flgYbRIlquRDdkw6ZtCXXbLMfbircwIjYWn4S
         FJeCoDDhehVY6gJ9nitMOb10pQ8owypmP5BMk5MoDNuZAvSMaFb5K0z9ClWKTbFQZ/qN
         1b7aB7/iVbhbYJQpXUfejQBrlsSloewRNkz/xaL5bnKEflbWFRwe/Ek+l2dIJ4j5koDQ
         9flAFDtpDHNPW/4V+4E2vigR+IQd/d8elRibeS65KyXTdulkyVP5+dlIgdyj2kI+DJOg
         XuCQ==
X-Gm-Message-State: AOJu0YyH0n2pYuDud0uQhl4V7K+HJ3zSyKlxBU41CH/OXhlh189lqWub
	R7W9Hg2MxCaB/9O8xcJDURRZ/iUfhFuZ0cCr0hGvDJsK+lLmD7I8Mrl8ZxTLaEFrrgPPuKKUwBY
	LooAFgPVn22Q7ST5uHUTkVQkreiXyVUsOdVn1wP8JcY7qNQMS4GYfKNb4BV5QG8KTjjqhTXE3M+
	xaPLrfYScnQY7cHblTjeRKe8yi4H6RrQxvu3zP31ES60pa
X-Google-Smtp-Source: AGHT+IEstc5WbaKR984lcE73yhlUqY4mnQpun5Em/Dltp0yYfhzejBDQJd+oDTcw6HoRIbI7W/BkGtQg
X-Received: from wmjf4.prod.google.com ([2002:a7b:cd04:0:b0:46e:38c2:1a34])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:468e:b0:46e:4b79:551
 with SMTP id 5b1f17b1804b1-46fa9b092femr34512895e9.31.1759938425183; Wed, 08
 Oct 2025 08:47:05 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:52 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2401; i=ardb@kernel.org;
 h=from:subject; bh=5nhtgxb3dS2zVbgouam5e+M4Gmu5K56lN9xZqYXBI3s=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZe6DOTtbCqP/MvEdnNO/+dDayK/WX4sFtL+4vEJj/I
 +l81yPtjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRyBUM/6z/Z+Z7rrJVsj3o
 NKFtdgfTrePKpyWn38q/ubvk6uoTq6UZGebIWslEbD0dYrpZ+BV3WHF94Ya0X7/LTFfJp3Rny69 v4AMA
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-41-ardb+git@google.com>
Subject: [PATCH v3 18/21] arm64/xorblocks:  Switch to 'ksimd' scoped guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084708_301618_22D24CEB 
X-CRM114-Status: GOOD (  12.30  )
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
2.51.0.710.ga91ca5db03-goog


