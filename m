Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848DACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FhWp47bs3reBDPv5Eo8/YKbhWPmlo11aWHsEN7F2Pk=; b=uGFlf3wOMXVp17FCHRed64SelX
	CbJZZjnoUKwrZvGBKuPc9BBiZE3nW4nNYeC4ruml2OHqtAwE370OBIN7oFJmxL4Uk3JVG6rJcCucW
	vjGC8q1EtiQcsi4E2ENfNfoyyCnd/9iPJrMwbJqzcHGpQG6CZUg9+8mvsxyYer0qjUgdLJpdDI677
	qt9qtlnHrc2GelwL4uM6znmCantgF7aXc7ECBz4rRcYZWvYY8aJ473MXcRzjWpJMzR2rwJval8TJd
	kxBc7rdb3oI8LWUtDSr37QnCr6eeOckFu1DPJ5fHk+UFHUIyqBrmdpoYmnwzPVxl3tgN1caFEvJdJ
	1KMoN3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zU-00000008yuX-0Jln;
	Wed, 01 Oct 2025 21:04:00 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zR-00000008ysS-1i0H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:03:58 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e509374dcso968725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352635; x=1759957435; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1FhWp47bs3reBDPv5Eo8/YKbhWPmlo11aWHsEN7F2Pk=;
        b=GXgJ8KicCSv5eVlWE1DWq+TxKFNc8G9+bfGQvIy3n1ZP8ya2SXKnOW8YDbdrvuS9/l
         +2um1+t4a3jBBwwmSAbFHt3DjOtXuWiayxXWiwfC5Osk2Jg796fiJxqvhXZow4KKu4LH
         q6cDd8Rt4YX8oJkOm/q+r+78nsyMi07Qtx6YJIwRZeRJFd8nw7bwwBxTWSPgiMARvf1I
         McOGG3CnhYg+sHBeJVgr3Jm25WgmVoFU4q9+PT9aI+ve2Qr+nM94IzkxHYjiYNRS4DXw
         bt8wHem37TIuJcU0W75MMKoDIEgNfcLhyERSc3UhpiC6hO/AjfqKcWMl87CaPMm4TeIg
         TC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352635; x=1759957435;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FhWp47bs3reBDPv5Eo8/YKbhWPmlo11aWHsEN7F2Pk=;
        b=Jzsqui4m5aqzgCcBhbGyEBjqU2aMt9dk4m9ZKwi90Elxhm8qUQ1CAp0PBCZ2Z0eYDz
         Ac1NFcVDtlS0UkC0lsp3c9H2tNqrSI5MGAJKnvfr5kill91rDt7Z4z2tXitBI3nLA/Qs
         YQCiofbZQXbYxPA60FCs2DgOxd8JEMnDU/H1fMGkY6thyI/3clyDMs/GElTKVcupxjVl
         F1dC0RkzkaA+0TN52Fq3SOIftzjsgces9geqqUSUjKEpj11C8TgEKDXCAW+E7jYIvAhC
         ot0fsRT8KAFi8i/5Xwlf+uQkS678BrYlXi4cTi8NddanRF08yRAQmpgmNAs3lx0SupMo
         6OtA==
X-Gm-Message-State: AOJu0YyatmOzMt6OiPlq8prQwgFV1zjeFLG5ziMwiTBO/B4H+2fy0SRk
	ZpVFUjVUYURw4aey8mXVvxwX9amEJL/2Ln22RZ0KXx9pjWtyupjz0f+swLJ2wBEblgFsBP6/RY4
	nn6gzptw9WAgzarMQSqLeh6SYljiMjbYP3i7xgxNSfAdC1ePoHvQAYN8w1o9/3CGcAyEZYoMaAh
	Wz5WAXgpdUAYFbL7/8hEWcBNv/VzjSgfjf1gddPKU1If3s
X-Google-Smtp-Source: AGHT+IFI3zKtjw3viIN28FavI/x8N6Vmi9ld+eUE+6cV0FsK7qbWev2ZSe6+tyHLFwzSdNJeSUW5izog
X-Received: from wmpb25.prod.google.com ([2002:a05:600c:4a99:b0:46e:2f1b:4ceb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:198b:b0:45f:29ed:2cff
 with SMTP id 5b1f17b1804b1-46e613dd3femr38614835e9.35.1759352634802; Wed, 01
 Oct 2025 14:03:54 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:05 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=982; i=ardb@kernel.org;
 h=from:subject; bh=o8h5bq3OJmsWnm3lH4s7jaZZXCXhEjYAKa43aK/6n5k=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutOs8NmwfJZcsl/9bfHnC3QmpN39NV4vzcFjwbPfeO
 t3Zis5KHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiMzIZGX7UiG1UelXjuaJP
 p+dWpvAZjY/Rm7RvvhI8tKggf5JM6BmG/1Wqi6y/rcu5rndMTeJ40MRrHqvufL95KeRz6py6z7d PufICAA==
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-25-ardb+git@google.com>
Subject: [PATCH v2 03/20] ARM/simd: Add scoped guard API for kernel mode SIMD
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
X-CRM114-CacheID: sfid-20251001_140357_452757_E7648B7D 
X-CRM114-Status: GOOD (  12.35  )
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

Implement the ksimd scoped guard API so that it can be used by code that
supports both ARM and arm64.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/include/asm/simd.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/include/asm/simd.h b/arch/arm/include/asm/simd.h
index be08a8da046f..8549fa8b7253 100644
--- a/arch/arm/include/asm/simd.h
+++ b/arch/arm/include/asm/simd.h
@@ -2,14 +2,21 @@
 #ifndef _ASM_SIMD_H
 #define _ASM_SIMD_H
 
+#include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
 
+#include <asm/neon.h>
+
 static __must_check inline bool may_use_simd(void)
 {
 	return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && !in_hardirq()
 	       && !irqs_disabled();
 }
 
+DEFINE_LOCK_GUARD_0(ksimd, kernel_neon_begin(), kernel_neon_end())
+
+#define scoped_ksimd()	scoped_guard(ksimd)
+
 #endif	/* _ASM_SIMD_H */
-- 
2.51.0.618.g983fd99d29-goog


