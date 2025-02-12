Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BFCC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IJUdaO+5dTLVXPMwfcKz8isZKL74F9HfpoDdIYxpPA=; b=4u/FqDB+zR1O8mZo5zYA+Shlua
	3JOrXralEJOJTqJySeSt3gEtJPPnBbflCrNfBg0EWp+pCEmAGFXuySzQ+ucCa6JreP/M1/iLEItzg
	4Noo1sSArZKsGmgxKjBQiKjZf2yroupwvMKZzG1eqOS5O7g6OyHHPDsqdhECY8ygC/LmPTsg0ZqkX
	9YhjoZV/CkfPUxWH+UMIsGILjLcniLva4IPRY7239i33teGPSsUvWLG7BpyHckoujFi83elzTiPWr
	sFBvU+N5dmXeKJFoAVsCePky42hWSpHqNAeK75NT1YcibvJpnuqvz3A5WvU1dMQnbKMq3kDuuUG5z
	ejRAN6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiArh-00000007A8k-2a8Y;
	Wed, 12 Feb 2025 11:25:13 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApg-000000079am-33nU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:09 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5450475df18so4526475e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359387; x=1739964187; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IJUdaO+5dTLVXPMwfcKz8isZKL74F9HfpoDdIYxpPA=;
        b=ntSEU8/rxrSe/YTfU/u5jJa7OxVG0biyY190Yw2lPHq6Jx2IVH/PGt7Q/A/p66Nvau
         1dupkbR0O2ZFFsyfrMUJ2GbJ/S8ZPHW/3ocMFvjR7E2S3nHMgazJByt5pQjRsjFHTfqO
         zsUa4w1ZyQjN9fRhjXTqcl8rEmgQIW6/EOkeMNCk/4RXamfixywasuJujvcVqEojorXk
         OyJxzSFF9Qu1dQT0El40/FkKrem0aDMwMnjkK5p2vS/jTL/lSwqz8UROy6saCmS9kvqd
         DdbpaA3/sZWl6aj+uDYgotwWT/4sYQKETgaMjSdnO7oI6fMUpfMRtdgO+ifwpIJBXrRt
         +gGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359387; x=1739964187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IJUdaO+5dTLVXPMwfcKz8isZKL74F9HfpoDdIYxpPA=;
        b=cKjCNsTbz3A/TsBHHeaSq7KJCXfdfVGw91sxWJhvbte8naJcEe0czrnkeksQJmgPyN
         JaR/EkD4tQWtRyORqULYvaIo4A92Tb5J8naYuInu0DBdNFaoimfvT6HCUjy8NmBKQxwP
         uVeCF6Ikls2Qr8F1x8I63xiIozQiyNPjBfM5cI4VyTLlj+a3vGVVn99KWmW+KResWf/H
         fCO/e1tZxFanxwFZSR9ZyBjZ/eaQwmknrqzkzGXjTafqHPPaTB6sZgMZaCEyOo11aUgY
         ZqeeADoz+PpTA1HabmTXQPx38uyaiKlJs/UqR6Zl9GSoTzfV5D/bj3h82rhTozm+o9fx
         Wb8A==
X-Gm-Message-State: AOJu0YzczvbJpYq/5+gSAZbUtZmGrPOQzCIKa6Dz0sn2WdGlOHQEe3Ix
	kIvw62cPuFbnXPryn694sKe6xrDCA0W0NB1vY5dclfEXQqCskcp52bl0XRYw74U=
X-Gm-Gg: ASbGncuj7IVKB6Jwm9pHaO5Ie7IrlvGcbXeVZUGgba8tGWv+DON2sgN76qtr0tCjKSO
	kxmp7SwQQFr0hln+dAACYP7aEtBSqrgQJNZyxVdz3FeG/xs6tQr2sifSrOwxHHj8pOG9mrlx+uM
	K/UJSwlHuDU76w6ClUqbH1yLAWI7UA7N3tJ4+j0bbKPZ0Nk6MmZWZ9/Bn5Bwa/HxUbpzBXfaBa6
	mRL327o5YeGJsrcIkEBkjNdtLKxhGy6l+b7l21WgKR2tY0XNATeQIr8XSjxlSkeZfIjAx53goDv
	yWMYdwBpM3g9Nm7d/YAsO8o2/Q==
X-Google-Smtp-Source: AGHT+IGpPfdcv9OC9/zIBoroOvzjRg04ZxGmAWsM7JxX7mbT/ANhbd0eNJDQrR2b6LwjPhGzC4w9WA==
X-Received: by 2002:a05:6512:2809:b0:545:6c8:94de with SMTP id 2adb3069b0e04-54518181238mr925712e87.47.1739359387058;
        Wed, 12 Feb 2025 03:23:07 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:06 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:22:55 +0100
Subject: [PATCH v4 01/31] ARM: Prepare includes for generic entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-1-a457ff0a61d6@linaro.org>
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
In-Reply-To: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_032308_803304_DF8D34AC 
X-CRM114-Status: GOOD (  13.99  )
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

The generic entry code needs a static inline function for
regs_irq_disabled() so add this, in further requires the signature
of on_thread_stack() to be __always_inline so add this as
well.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/ptrace.h     | 5 +++++
 arch/arm/include/asm/stacktrace.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index 6eb311fb2da06fa393f8be7caec8d997637a88b2..a01c66f0ad907882af2a383e53de8aca68c551e5 100644
--- a/arch/arm/include/asm/ptrace.h
+++ b/arch/arm/include/asm/ptrace.h
@@ -52,6 +52,11 @@ struct svc_pt_regs {
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->ARM_cpsr & PSR_F_BIT))
 
+static inline int regs_irqs_disabled(struct pt_regs *regs)
+{
+	return !interrupts_enabled(regs);
+}
+
 /* Are the current registers suitable for user mode?
  * (used to maintain security in signal handlers)
  */
diff --git a/arch/arm/include/asm/stacktrace.h b/arch/arm/include/asm/stacktrace.h
index f80a85b091d6c4ff365e15ae7100af1c3aed597f..815b5f256af164daa053f3bfd6cb2f54042a8d2b 100644
--- a/arch/arm/include/asm/stacktrace.h
+++ b/arch/arm/include/asm/stacktrace.h
@@ -26,7 +26,7 @@ struct stackframe {
 #endif
 };
 
-static inline bool on_thread_stack(void)
+static __always_inline bool on_thread_stack(void)
 {
 	unsigned long delta = current_stack_pointer ^ (unsigned long)current->stack;
 

-- 
2.48.1


