Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA73D5B846
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leKULRwFrUrUHl+gqC5TSoYb0TiNILSW4aeMxjzqon8=; b=B1VI4w9vYapuPMEM9x62XFyYKf
	LGVMN/GeBAqFF3pwXBbSkGFJUzuM10WPIn45cUE07jU4vyKgO6HnJ+soPySZiZ3gfOubvjt+YzHMQ
	4+zrzx1N2TgJ+ldTndpvLdKed9PwGW2NfO4El3+CejRb5cM2EDEQZtdsbS745bE5ecJ6Xhbb3VyOc
	srd23ykgLaj/jiZvfnUDz4EJGP5I+rJ2PsN7CBsAwA1SMe3NqSCIXZOh81GC78+quto5BCg0nm/qc
	bkcu3GxVQKm1FzJjgb514dSUogz2J73j+HkQCOdcBxu4AXBRdr+ruhXwNVSjMOV+dSIiKjp4yQMog
	zWdqx8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5YTt-0000000CYiI-3hmQ;
	Mon, 28 Oct 2024 22:45:01 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5YP5-0000000CXqS-0Sl3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 22:40:05 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso48077221fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 15:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730155201; x=1730760001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leKULRwFrUrUHl+gqC5TSoYb0TiNILSW4aeMxjzqon8=;
        b=V5GOSJckJuzYIeIPkOvdHRljDMS56M/trIPEIUOxiqrE7b2JJQZOohmgPCm4vjB+MS
         f0ygIzS6tCQgzq5yK1YbkC2IHFQnJ3lNf1O/TwU8nc6BCfKrFlEN7hsW+YaTvvMKxr4v
         pWprHsJutmTaJwiIzE3Gb18dKlil3yggIWtpVTNcUTuD2OHbICkRn7AMsAcyEvBxUibT
         DULwyY+xDRy/bExyVv1/6TBoQTuDo0CuuCNIRC5+zX4h4cV9IlosxUP0xVn7yp/sAZXh
         yVJigi/WtvbLnqkGoEiQ7uj6cGbYKQ4R7NLGJR8VNTZ15uGn/r+hJIPGxDKzyNJ1d9Jc
         vMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730155201; x=1730760001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leKULRwFrUrUHl+gqC5TSoYb0TiNILSW4aeMxjzqon8=;
        b=MSiJplxvL8TQa+Q54xkcoCLEX+FugLExtSbfMlvS18MjPYpMF0GsfBUJRiffKEd42E
         atxeriqKAf7kNs1vIKTY2uSwCICjM4owEH2D15rEHjUv/f9eu+vc3wQPXNLiw5kXZm4R
         Zn2EaKNvyXDS/Lhwu+WnzkYaFN0AVpFUp3yEZJBGo9ug+eitC/gXDbmAK4Ct6wyor15Y
         lcyTFHwdjVqPTkllHuDfWEpvwOOtj9kAFq4a9N5EzP3g470Ef1qRGpchwsZhn9erdlR+
         LHPdP6it1plz/tJIbJiE6WyF+8xko78P/dhI4kh/ihb3mcFy8xqOQvXFNiU0j1DJI3f2
         +xlA==
X-Gm-Message-State: AOJu0Yx9cl1JuB9yUjsBwvIEgWOKym6B61mwBLXEEwpoyZrDOyLCHGar
	hPenNxlWeBv9efomtU+kKTyMsFMTcTnqGU/2gb164UYmF46Iszo1H9V779fM6WQ=
X-Google-Smtp-Source: AGHT+IFonm/0d6VzeJyq2z2GBjua9udVbBmqU2gCcyAAFcnWLjIbIE7Nn3A6tdQNHkzfUmh4gEGnog==
X-Received: by 2002:a2e:ab06:0:b0:2fa:c185:ac4e with SMTP id 38308e7fff4ca-2fcdc7ab519mr286331fa.13.1730155200651;
        Mon, 28 Oct 2024 15:40:00 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451caa2sm12648561fa.36.2024.10.28.15.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 15:40:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 23:39:59 +0100
Subject: [PATCH 2/2] ARM: entry: expand comment in __switch_to
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-comments-in-switch-to-v1-2-7280d09671a8@linaro.org>
References: <20241028-comments-in-switch-to-v1-0-7280d09671a8@linaro.org>
In-Reply-To: <20241028-comments-in-switch-to-v1-0-7280d09671a8@linaro.org>
To: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_154003_482283_6D5289BE 
X-CRM114-Status: GOOD (  14.87  )
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

As per discussion between the developers in the mail thread
linked, expand the comment in __switch_to so that readers
of the code understand what is going on.

Link: https://lore.kernel.org/linux-arm-kernel/ZxDh9biUbf9W8gNN@J2N7QTR9R3/
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index ef6a657c8d13..5c016c68b5a3 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -557,9 +557,16 @@ ENTRY(__switch_to)
 	ldmia	r4, {r4 - sl, fp, ip, lr}	@ Load all regs saved previously
 #ifdef CONFIG_VMAP_STACK
 	@
-	@ Do a dummy read from the new stack while running from the old one so
-	@ that we can rely on do_translation_fault() to fix up any stale PMD
-	@ entries covering the vmalloc region.
+	@ For a non-lazy mm switch, check_vmalloc_seq() has ensured that
+	@ that the active mm's page tables have mappings for the prev
+	@ task's stack and the next task's stack.
+	@
+	@ For a lazy mm switch the active mm's page tables have mappings
+	@ for the prev task's stack but might not have mappings for the
+	@ new taks stack. Do a dummy read from the new stack while
+	@ running from the old stack so that we can rely on
+	@ do_translation_fault() to fix up any stale PMD entries
+	@ covering the vmalloc region.
 	@
 	ldr	r2, [ip]
 #ifdef CONFIG_KASAN_VMALLOC

-- 
2.46.2


