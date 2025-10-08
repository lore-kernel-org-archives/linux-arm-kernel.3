Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A5FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rx/I2mYB3NrCk/vXv2cfgvi3kC2D2Tey/+p9VMElDFg=; b=MgH/GAiMUjy+U2xECx0UKRkllw
	v4uXOK7W46QjYHCiDh0DaZggeXaT0GhhAy60vOhb6/bay9ciX6zC+C+CKb9oUBqDaBA0MTNyqYIXh
	7XxOP9MgWtQXus642bTKfp6g0d/GqtS8wnEJ8DF5kSmpsNY+Z9MpFYHiUU2L9g+5ZrDiPYWyhqKL/
	UmsVltreBS9n0NXGXGiZjRqf1PrZPjj0285eqD7V37dPGJ3n9fKtjrdB2xYWTVIpEV+PndbfOrKs8
	j/SjgK9Lt2fRlwK79iSnV6C0sjWr0SBwVtN3CWELKg/qP9qktcA5+n6mD89AGW+1Pa8Eg0eRr5huB
	4Qq19GlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNq-00000004BtP-43mk;
	Wed, 08 Oct 2025 15:47:18 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNd-00000004BU6-0mJ2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:47:06 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e4335fa87so28945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938423; x=1760543223; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rx/I2mYB3NrCk/vXv2cfgvi3kC2D2Tey/+p9VMElDFg=;
        b=QnR9jEjW7I6722yT2UJVAOplnj9Pghej04VwVndvFT3SlgYn+T4aWg/jWxKE9aP0nq
         EmKd1HcpH/u11q/fHdtLAZzpD8o06d5/Vi20i1WfAMAsVm0UOr+s0FVkoVltMx4Q17RW
         M4qA9xk6KisnZtFBS/iaPovbRODhaeCqSITeZ9DUR4hd3IVB6vjtsarZezQ+wFv4lja1
         Q40ThX+IzKheMUds+/iHTNSZ+WN2fEhXdUBRBybRtAgmpC6kmKBqGdosbAYuqeh9oBUJ
         QYyAGrpBAWG3fA/9Nyex/RJnyzFO8D43Pues39UKLIPAI3sctvQ4L5C3hHTU5Wt18axG
         ucVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938423; x=1760543223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rx/I2mYB3NrCk/vXv2cfgvi3kC2D2Tey/+p9VMElDFg=;
        b=rASr3Y8HWueFh7TStQXiWt2HRFMPXH55PYNGNpa1dyG6zi6QDwX8JMMxo5tmAGTMwV
         wK0djX6wPLe6UtghQGsf1uVQUWNiIprPJP0Vv8kK87gnw9l6VNIpr9m7aczmcDGSpkHo
         AlAlUgjx1J/0bxIipMxQoUB1pALwvPCNSLW4oug8c7XHmuAa1ZwH53rQBr68qkYftwxQ
         zYLJfNtPhuMNT7innqeirM9AvjKCcq4U1cvrRbdHbrSE3o9hrxhB2iC8Gljjto+8XHD5
         9pACdHHezjk76S0Cw5WpBKJP9Z9Ut8fNCZ3JE+wyE+Z1B9Yrsvfvvl0Hh84LUdJVYkzm
         M3JA==
X-Gm-Message-State: AOJu0YyrxoxqME2Q8r35ThPWRWeiW3jSJZUJnl5ye14dihey0dyAu6bO
	NlRBQRBdv/k2U31v9AfWYhl3CbaqD+kuoroHdWpFXtQOm6fvXXHYh4avCP+nCNas9C5ZrSBaFyk
	5LIO+CqkUVPD8xeWAX8GzdZ1NWpXoPhxDCQ8Vma0GWvrwiQSTWFJwWIBoH3RoaPt1eb6jLFL8VF
	Ag0R8N+BoOSP7/0PGJ41Cj0X2CsKXBygoIx2/F+ln8hNrV
X-Google-Smtp-Source: AGHT+IGgGXd0YwsnNbBmOjS8U85+nouh42Fv0MQo/IxganC0g4CIjlugauCG5GDY/nU4c6gjRWBTho+b
X-Received: from wmvy7.prod.google.com ([2002:a05:600d:4307:b0:46f:aa50:d706])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5028:b0:46e:428a:b4c7
 with SMTP id 5b1f17b1804b1-46fa9af2ff1mr27394355e9.23.1759938422874; Wed, 08
 Oct 2025 08:47:02 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:50 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235; i=ardb@kernel.org;
 h=from:subject; bh=jIptOtZmKOCZwDiEu+JvA9/u7XRZR8J3wVrBatzcfYQ=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGjmh0uhjRILxkNErSHRqZl7bCOk8F2GbmbuEihaJS52zdYRB
 4h1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmjmh0sACgkQMG4JVi59LVwfRQD9FKpH
 Q9qKX3oWwmzrLHOlLSPFAhIUtqFZBlk/vuE50v4BAPJ2xQQvHPUUD1P6GRLlf3WTDIgb0IKpfQw jPHxyFbcH
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-39-ardb+git@google.com>
Subject: [PATCH v3 16/21] crypto/arm64: sm3 - Switch to 'ksimd' scoped guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084705_308476_184BB93F 
X-CRM114-Status: GOOD (  13.06  )
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
 arch/arm64/crypto/sm3-ce-glue.c   | 15 ++++++++-------
 arch/arm64/crypto/sm3-neon-glue.c | 16 ++++++----------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/crypto/sm3-ce-glue.c b/arch/arm64/crypto/sm3-ce-glue.c
index eac6f5fa0abe..24c1fcfae072 100644
--- a/arch/arm64/crypto/sm3-ce-glue.c
+++ b/arch/arm64/crypto/sm3-ce-glue.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
-#include <asm/neon.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sm3.h>
 #include <crypto/sm3_base.h>
@@ -13,6 +12,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+#include <asm/simd.h>
+
 MODULE_DESCRIPTION("SM3 secure hash using ARMv8 Crypto Extensions");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
@@ -25,18 +26,18 @@ static int sm3_ce_update(struct shash_desc *desc, const u8 *data,
 {
 	int remain;
 
-	kernel_neon_begin();
-	remain = sm3_base_do_update_blocks(desc, data, len, sm3_ce_transform);
-	kernel_neon_end();
+	scoped_ksimd() {
+		remain = sm3_base_do_update_blocks(desc, data, len, sm3_ce_transform);
+	}
 	return remain;
 }
 
 static int sm3_ce_finup(struct shash_desc *desc, const u8 *data,
 			unsigned int len, u8 *out)
 {
-	kernel_neon_begin();
-	sm3_base_do_finup(desc, data, len, sm3_ce_transform);
-	kernel_neon_end();
+	scoped_ksimd() {
+		sm3_base_do_finup(desc, data, len, sm3_ce_transform);
+	}
 	return sm3_base_finish(desc, out);
 }
 
diff --git a/arch/arm64/crypto/sm3-neon-glue.c b/arch/arm64/crypto/sm3-neon-glue.c
index 6c4611a503a3..15f30cc24f32 100644
--- a/arch/arm64/crypto/sm3-neon-glue.c
+++ b/arch/arm64/crypto/sm3-neon-glue.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2022 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  */
 
-#include <asm/neon.h>
+#include <asm/simd.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sm3.h>
 #include <crypto/sm3_base.h>
@@ -20,20 +20,16 @@ asmlinkage void sm3_neon_transform(struct sm3_state *sst, u8 const *src,
 static int sm3_neon_update(struct shash_desc *desc, const u8 *data,
 			   unsigned int len)
 {
-	int remain;
-
-	kernel_neon_begin();
-	remain = sm3_base_do_update_blocks(desc, data, len, sm3_neon_transform);
-	kernel_neon_end();
-	return remain;
+	scoped_ksimd()
+		return sm3_base_do_update_blocks(desc, data, len,
+						 sm3_neon_transform);
 }
 
 static int sm3_neon_finup(struct shash_desc *desc, const u8 *data,
 			  unsigned int len, u8 *out)
 {
-	kernel_neon_begin();
-	sm3_base_do_finup(desc, data, len, sm3_neon_transform);
-	kernel_neon_end();
+	scoped_ksimd()
+		sm3_base_do_finup(desc, data, len, sm3_neon_transform);
 	return sm3_base_finish(desc, out);
 }
 
-- 
2.51.0.710.ga91ca5db03-goog


