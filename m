Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792F3C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IJUdaO+5dTLVXPMwfcKz8isZKL74F9HfpoDdIYxpPA=; b=I8dIfHhzP4qZ9cKZBNC1v+U3/v
	OxNy/q5mesXVnHJEjQVwhBOV1qhIxq3H5KuE8d9cAUs39rTF9uq/QDyjmG9TUiCwoEzWu6yga50rd
	iGPSbfEfFstiMDFeV3RQJzI3t9vSTpZDk92Taagrm1lynsoPQPoB2Mgl0GGpFGJ33HewoMYAkpe7q
	YstCp3SCCycuHJwgFwj75VbQnHEXL8Zw49dCLqZ/OgBiBLPs6uhWrsCwBuNhTqkY8R7JIJUNXRZAT
	7zCy8OJ5cziZmMCItchCf9PjW/v1/uBdWjbdjlegmWLwnRMzJ1KOmaUdN4WYhvRuPvWpulIca0WLG
	HfuP+qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrsv-0000000GlQ1-3kDA;
	Tue, 25 Feb 2025 10:09:53 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmreY-0000000Ghad-2MQL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54622829175so5107609e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477301; x=1741082101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IJUdaO+5dTLVXPMwfcKz8isZKL74F9HfpoDdIYxpPA=;
        b=L3athRDjhL8TJ51SJe8+Y0X48MIIbC76RaWQfYELB7JWDZZjX1nCYkYMW6Cg5ORK2J
         HusBht0MmZG4G+8X13GZhh+irm4icJ/Ox5HvIuk1EuzaXkHjzkoMXgOLRdjnh9t2dKSv
         RhIXcKxOel/rYVNRChEFTJy8h1jyy+JtAtBZbezQlGKCH94SZUgJGJdS4LYOWr1shm42
         5sXiST7sODdzfTaeqgbEG3/ZhkNOMA5fQVVOCy9OD0pW+tWXadUhVZr1hPpqAa1gnmDo
         2bxOTbjZLGwmPYHqoCOADtUxpwDTF8F9Z9pSKl/LahyMMm7o1oc/lpt9EHZhydXqfUCu
         oWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477301; x=1741082101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IJUdaO+5dTLVXPMwfcKz8isZKL74F9HfpoDdIYxpPA=;
        b=RxDECzf3gFvkT7gM343klin7KNPyQ50mrApFX60CIX4EKs3y5kUuDW1zXUCX42lNUn
         1rAvaDirmXfGSM0spk7iXQi16onVGYna5JJxtj0fUWG1b25+ZwuWeMg5msSjku7eiVF0
         zr4mpnkwMta6sredk+Q/nyIY5/b0fBfYdNVqOseegWxOqpz3rM3niBJnUVP3Jf+I1k4J
         pcMEgtxPEH9q1L9cj8WubDaovnI0tyTWdTxig1qpiw0AqegJ5h9lLx8O8aLlvtbSUDFv
         cogVCHR0StEN+j2Qr/xD+mBBDCSoNzKgK/ERaU0FzVJraV9Vwnngw0HlBBWXxemzHSRc
         yeWQ==
X-Gm-Message-State: AOJu0Yxizeak97Wnx+hF3FWrCi9ixunua0UWdMtlOEtIfNjwSwvDTL3F
	ZJ1coIz3FgnAlSXNCCt25KnkWslZmvtsT8nH6D/dm8PwezsM9QEkJR1jShgf83M=
X-Gm-Gg: ASbGncvqodm1vO6uJ1X7BbNFZT6Kxpn+hVczCiDA1FQK8c6DT5uMbk/kIvpBuNjeLzL
	sqksCpN4b7MYojAPcfdjv2lCdxYx0ZjmwR5+N6hXVSYJINVmDlq1JKZnvuLwKc89HIzNCsbtvHc
	e8N3gTsUASt+yPpVFUif+K7qmOMoBVAI6DLo4ksGcaze3mgGSxsabvOIiqmT4wOWlNAyrXCBkGX
	fDNsb/ab8RXc2pheXF6znVqwyAbkM3ZBtShJDd6RjgY7T8muLeMsWJ+t6bibBZSGZePzJvzm3ne
	SXWuaQ2ZCJHp2VpdDPC1hmY9C4Z56OLRdIF3
X-Google-Smtp-Source: AGHT+IHd+JITPLxMXULU7ZpD1f9xac7PGEst2Tk9nAmNTghxAif9Rd8qWrav88C8IW+IaffyeOes+A==
X-Received: by 2002:a05:6512:2310:b0:545:16a5:10f5 with SMTP id 2adb3069b0e04-548391452b5mr5483522e87.30.1740477300601;
        Tue, 25 Feb 2025 01:55:00 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:00 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:54:48 +0100
Subject: [PATCH v5 01/31] ARM: Prepare includes for generic entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-1-2f02313653e5@linaro.org>
References: <20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org>
In-Reply-To: <20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015502_604908_1B10E7D3 
X-CRM114-Status: GOOD (  14.05  )
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


