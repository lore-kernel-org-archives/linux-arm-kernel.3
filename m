Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CB8CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFCvTIOsXSjYhMkRl4dIW/P5UlNb2kn2VBhE2xHZEzQ=; b=luBM6puBe88LnA0T6tV0KZ8ymX
	Dl96vVrziOUxwuujgxK0HxFA/JrjAklMYZkyQ7iz9VMn/o86xCZLMcKsvsonpdXutd/Ov6wWUo0/F
	aQPYwURmA8hDueZYB/ZTgCLWwmysL6YyRY64zLD2/ycqMmSL/ntKKak/HpS7tyGTgfCXxM3bAde8b
	nSlGzVOAYfOamgU7nnBhFMD/xYhJ/2mMZXgkJbtdDBvBgjAb8HeozMdDqLxYq3Ae2EPo7T9Rj4rwV
	Hu+PLtG4G5QtXcLAGtpxohVj3y1Z9ZyUffH6qTT874kPPussJLwysa+jJ9MmS0QhSQ4V0+QGJKwNz
	qeQQMqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY5-00000005vDH-1L4v;
	Fri, 31 Oct 2025 10:40:01 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmXv-00000005v5T-1wjf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:39:53 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477113a50fcso16351025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907190; x=1762511990; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AFCvTIOsXSjYhMkRl4dIW/P5UlNb2kn2VBhE2xHZEzQ=;
        b=ZTbLTobMK6qnvk8BKfJR/PO+3uJKj9m8npiWITW74SooE6HLL5Fo8svHaYV8dKxtBX
         YrznUFf71Qdvy6WFRTsoQ783SPI6A/9KeWawU4yDkzzWt74LKAiyTxx2TydZkHXGHRIO
         tPJ4aycWliUqsOy+8dEaK03us4jPVRxw80w47i8mjXqYBd49yoChff4unceEViY+ozpO
         79Q9bNHX74xjmxnEO2WDT22NJixBiIETLSjIZzI3JqQo95W3FOXhMD8a0sooHUDRiyXj
         seBG71WwAuRBoWRRoa/DDuWLW785KfVQEr/6tKfQ61m33pOSwLoXipbPN2PpzL8pBXpz
         KNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907190; x=1762511990;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFCvTIOsXSjYhMkRl4dIW/P5UlNb2kn2VBhE2xHZEzQ=;
        b=mkReFcaCZIZxwQEB/EjP88ZEk+5ch7WUZyg3nfcakhfV1JI3nCTY9OuvEyK94UpycI
         /XQBvpwXMF0yYT/EZHuK24vKbRMyCHXXq+CZ2DfIa90r989kNpUxouxBp0KjaCVdZvRe
         Xy7CV7urhozp/n8fbUS36tzYJX8nudPhVmClHl8tIvuy+TNaarMdTh1vIZIPJExXLrTX
         Zr62+afy9rJJfXAt0bVUh4IFeW3figbTMygAeGIjaTMVyGcWUNTu7Cfc6MdFgFp5v+gY
         2pbcoQMEjlvbKZVotJywTAdFilbOzauqHp/u7m2ukDNE3OiRySImxlgP7iEmVgxTHhqO
         oLPA==
X-Gm-Message-State: AOJu0Yy09LW8ddp1dI9AwlUSyITrwYoqkjLZxSVEwuBiPuE2plyZB3Zm
	+lws7l9cXKfM08PI+nQi8vFUC+yCSvoCIrtMWe1bCFTwSVl5Xfd5F/PxsP96qKEVNolhqydFj6z
	TgORdrJsl3r2GyNQGa1sZCmM4HJl2BVxnXk6DEjI5BDh3Wyv83BexcoeUN0YZcQ9TpV/zeNDNvS
	leXKBUsXptv3D3k6TLhKDzFmaPz5FqHUDUAvsP+XkvPDRI
X-Google-Smtp-Source: AGHT+IHWFYs4QMEYXdlkbsATPtP+/gZ1YWrkitgykutzLvMorl43xTdKzAxhRGPUNTRTOeWGSSSeXYsY
X-Received: from wmcn22.prod.google.com ([2002:a05:600c:c0d6:b0:46e:1f26:9212])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c16a:b0:46f:b42e:e39e
 with SMTP id 5b1f17b1804b1-477308c60aamr29196925e9.39.1761907189938; Fri, 31
 Oct 2025 03:39:49 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:03 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=ardb@kernel.org;
 h=from:subject; bh=94iSyJlcyEo5KVonam61v2/twjbge67xOTFdxdGB8QY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4kmfrSk5Qpcfzl42UcROjqnaPjK96+1NWR7t6X8Zu
 kS0Lh/qKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPpTGH4K3/s/uZKlaPzZ+Tu
 2nPn9NXVy6bU6yrM+VGz+seS3o+/WE0YGbYbSc2X5uHX85V6cL03YfU0mwtcZ7oWJ8kw/G1SCn6 6nRsA
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-27-ardb+git@google.com>
Subject: [PATCH v4 04/21] arm64/simd: Add scoped guard API for kernel mode SIMD
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033951_821558_29E662F1 
X-CRM114-Status: GOOD (  10.45  )
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

Encapsulate kernel_neon_begin() and kernel_neon_end() using a 'ksimd'
cleanup guard. This hides the prototype of those functions, allowing
them to be changed for arm64 but not ARM, without breaking code that is
shared between those architectures (RAID6, AEGIS-128)

It probably makes sense to expose this API more widely across
architectures, as it affords more flexibility to the arch code to
plumb it in, while imposing more rigid rules regarding the start/end
bookends appearing in matched pairs.

Reviewed-by: Kees Cook <kees@kernel.org>
Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/simd.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
index 8e86c9e70e48..d9f83c478736 100644
--- a/arch/arm64/include/asm/simd.h
+++ b/arch/arm64/include/asm/simd.h
@@ -6,12 +6,15 @@
 #ifndef __ASM_SIMD_H
 #define __ASM_SIMD_H
 
+#include <linux/cleanup.h>
 #include <linux/compiler.h>
 #include <linux/irqflags.h>
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
 
+#include <asm/neon.h>
+
 #ifdef CONFIG_KERNEL_MODE_NEON
 
 /*
@@ -40,4 +43,8 @@ static __must_check inline bool may_use_simd(void) {
 
 #endif /* ! CONFIG_KERNEL_MODE_NEON */
 
+DEFINE_LOCK_GUARD_0(ksimd, kernel_neon_begin(), kernel_neon_end())
+
+#define scoped_ksimd()	scoped_guard(ksimd)
+
 #endif
-- 
2.51.1.930.gacf6e81ea2-goog


