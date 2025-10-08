Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A91FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyDqe41TOpzGrced2VguyWuuhzoYjsOPlRjpRYq84qU=; b=vj9j/XmuDmSRbi0Zqn5pGi84Ui
	6CJXbayXa9Pmmt4ptGf82y62OCgTD9pIhc6xEDbphc1LkSvLO4v1vHYWuqkeIrnPKWKcP+SibGL24
	Z6JlMTZ+KKGzEOhSEeFa8u178M07coasBxKLfjF68HrZzN/2KwZShAJVLjQ6/eWj2oPNrdlKCp3Bd
	s4UnEUBr6xvmbH+gwPh/Si90S2hnTV6nbQbhCYSSjY+QChzaYVoBAinB6D0OjKyHp2s5fzFsmJjbY
	EL+ihk6KSoTk4Eq+7E8JU0WlUkQpqrkPo0Bclya9sjNSZt72S5UbDRVI8V+4zx1Rmwx0l5O3Pml4N
	FJhU2jPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNt-00000004Bx8-23uL;
	Wed, 08 Oct 2025 15:47:21 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNg-00000004Bb5-3dqC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:47:10 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e41c32209so70265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938426; x=1760543226; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyDqe41TOpzGrced2VguyWuuhzoYjsOPlRjpRYq84qU=;
        b=N/pgtre/jzwMEi9zJCu279/LgUfd1XorXBnvbpIYPY2jAl2IuxjsRfQjrlOj5Gvu3n
         U6WWHwLrWpfnca1mREc9Bn9bQHZL0Cf3/kJFH9UdMZCk8dCNPSiKsPtvrGMYQo18KAIY
         lT2WAlvBrqmOMiFjlS8lohsi5b+Hjmfi42hcNRntSejWa/9gD9CU4xvbjAvQBlw5QxFO
         LndWTBBWo+UtsNuY/1KK22WeT6gOtNa5HSyGapDmMtsaXRDCBqCQzMIQIjYvp6xDOCpj
         s+B9qfEn6VIkipSdzDSQuYFd+Z3yfNd+bK+T9XmS7aDjpln5MziX+RNUZrAc5PbTKaBo
         3TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938426; x=1760543226;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyDqe41TOpzGrced2VguyWuuhzoYjsOPlRjpRYq84qU=;
        b=F3l80bYXzmSGzvFusext7hMHkPXgwFJG0HXRxAHJx60BKqJB+kw3GS531pvwy8Bk73
         SXbxW4sC6gfvoPVc0s6YgUKgIqwBpTlqETOzo30KMLj/ZsTgyplzOii0bv2WVF4yqdxg
         gPUxYJWX6btZLcXy8+48gXv3FR8ff2KguWVnNbEMUS2xJJYrSUVq14ZmjKyyY/2JqdOw
         ujhgORj6AuU/lpcw0PbtCtIAlgU0EfR4Qfbuy2AZTPHaA7GmUYc9OPZlxw3qk9a45v84
         UEbjS073godOVLa5ROnkw1Yg1FLLGhSrB9QKeagMOJEvp1EYXJPU2zfVjMx8EUGanAqB
         mPwQ==
X-Gm-Message-State: AOJu0YyebKeAxxx+dev0+l70QrgEQiRhjU7wxBVrcADuptlL9e/Ao9jJ
	uQPLZr0YRgZl7/XtCuPlcGAdZlVMBgOCvXiGVkZ9O509m7ECD6LDs6F/rNQ0a0C0SSeH11Ykl+8
	nzEoVfMhm24sK1LdIi1o3fXDucrzBntIWfQE8C1gbLRmB7aat2wPWZU8kyMIilSvFaxsdxiyLxE
	MYZIlGS7qeh1IJlvHT0b9FdHcEqMIS/1Ea8anxCqo/EVPY
X-Google-Smtp-Source: AGHT+IGd+xyyENe4mDMwHsq1XM4LCrOZp0Y90ZGldhJ1LzDJeD7pXJXrRWavBZZTJfyTw+krJ8EAav3c
X-Received: from wmjs21.prod.google.com ([2002:a7b:c395:0:b0:46f:aafc:e6d4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c4a8:b0:46e:4921:9443
 with SMTP id 5b1f17b1804b1-46fa9b1b277mr26777065e9.37.1759938426503; Wed, 08
 Oct 2025 08:47:06 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:53 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762; i=ardb@kernel.org;
 h=from:subject; bh=LscVi7axqbts3F3wdJxDdLq4C5QXUNo3h535UnzCneo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZe/By5YdKnzyPLFhZtfvlkqQJPIGL7q0zd1kx5X1Om
 6tMZcC8jlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRGUEM/0Mi6397J6ztaDx5
 4LfWJuaoVCufzUVPp960Sz/e4/wj6h4jw8XefzPlvzT+lC6UnnrnMc+9e7+mPeQ7s8nt6e9pZ/O Zr/MAAA==
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-42-ardb+git@google.com>
Subject: [PATCH v3 19/21] net/mlx5: Switch to more abstract scoped ksimd guard
 API on arm64
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084708_992926_3131C10B 
X-CRM114-Status: GOOD (  11.40  )
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

Instead of calling kernel_neon_begin/end directly, switch to the scoped
guard API which encapsulates those calls. This is needed because the
prototypes of those APIs are going to be modified and will require a
kernel mode FP/SIMD buffer to be provided, which the scoped guard API
will do transparently.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/net/ethernet/mellanox/mlx5/core/wc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/wc.c b/drivers/net/ethernet/mellanox/mlx5/core/wc.c
index c281153bd411..815a7c97d6b0 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/wc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/wc.c
@@ -9,6 +9,7 @@
 
 #if IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && IS_ENABLED(CONFIG_ARM64)
 #include <asm/neon.h>
+#include <asm/simd.h>
 #endif
 
 #define TEST_WC_NUM_WQES 255
@@ -264,15 +265,15 @@ static void mlx5_iowrite64_copy(struct mlx5_wc_sq *sq, __be32 mmio_wqe[16],
 {
 #if IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && IS_ENABLED(CONFIG_ARM64)
 	if (cpu_has_neon()) {
-		kernel_neon_begin();
-		asm volatile
-		(".arch_extension simd;\n\t"
-		"ld1 {v0.16b, v1.16b, v2.16b, v3.16b}, [%0]\n\t"
-		"st1 {v0.16b, v1.16b, v2.16b, v3.16b}, [%1]"
-		:
-		: "r"(mmio_wqe), "r"(sq->bfreg.map + offset)
-		: "memory", "v0", "v1", "v2", "v3");
-		kernel_neon_end();
+		scoped_ksimd() {
+			asm volatile(
+				".arch_extension simd\n\t"
+				"ld1 {v0.16b, v1.16b, v2.16b, v3.16b}, [%0]\n\t"
+				"st1 {v0.16b, v1.16b, v2.16b, v3.16b}, [%1]"
+				:
+				: "r"(mmio_wqe), "r"(sq->bfreg.map + offset)
+				: "memory", "v0", "v1", "v2", "v3");
+		}
 		return;
 	}
 #endif
-- 
2.51.0.710.ga91ca5db03-goog


