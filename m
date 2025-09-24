Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201E1CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8cxVw/7cCYHvLHRmPD20gr9/jU6KZGxeKnW/6kPkh4=; b=VMZ03r5dkFIRLi3m3QR8TtuRc6
	eSc7/7xNRH/9g8SsAmLgOWY7xUJNwTPe2LrrAFhSbSbpLx3wFlw6HMaBBHJEyyVe8rgvBocMkuD8b
	Z5dnxfLvmkFEl8xGT5C9xfeaDBF5ZC5k762XuLS+ObpYqu8ilgrgHQUK72TbGrgtMbUNuJVVolISw
	7vyT5d31Jj9cghNdwQsPvWzf3ADkGcpjYqFMLg/aI5OT9xLa+ur/NkXcva+MLHtLBtPS0M7vpL7vO
	aYLs2VFSrHd4f96IqXMsXMR0RT47A2qnryiKve68o4Cp59qL3RblunxyOrdzHAyw2W0HyNoqJZ7R+
	9zla5FEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RP6-00000001FNV-37oF;
	Wed, 24 Sep 2025 15:27:36 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RP1-00000001FCf-3NPV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:27:33 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b2d1072a9c4so261927766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758727649; x=1759332449; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j8cxVw/7cCYHvLHRmPD20gr9/jU6KZGxeKnW/6kPkh4=;
        b=LFJsKjH692rA9gQcvALNfRGt3sHnsiCcOjX708S3lXeG+pLeFAy2EyF61o7HFAuvTk
         yMBVe/Ltwuqb8rfy7ZC60YJgWMAAOvpkuPR0U49SUuKp0Qg2fQPI6wXL9zMZu4xHhFdk
         SCNl1EG2mBDiwqQG2LvUCvokfr0r5irAPH0S6sW/eeFczTaDFWbqnCy/ikAbyxLNec8X
         q4kMMzMwpwuxT6ukXWSRv0d72/Hzl7zO3poYACDog3uqFGLBDnm+ug3aGcijjkWfm5tX
         w5nrmA9L8xOCxO8d5nfoHrYXEmRSVjsy7sLQJ9fhNcFGl9H6jxDwAG/w7m0xYc0KH1NS
         as/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727649; x=1759332449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8cxVw/7cCYHvLHRmPD20gr9/jU6KZGxeKnW/6kPkh4=;
        b=tss2tgskZFWBjIe1YXjnyMTh+xa0/s8LzKvQTs0QQKqscuQV49TimNCoO8f2SFtklY
         kMEvYrzWJLf1utZYAs6PkOR1391C99Enz7MuWxZdYos/p4WDDKRVefGqhso0uVGngGI3
         XonOKDQ0g1oO8xF3dSTrcCswUAqkx18zIFklyZk1vIqj1NLJYdrsNvrczEhHlv4pi43S
         YLg32kAQDopGTlvRmqIa57ue/t3OtfxlRx3VwmoYBWIkv5oryPm8KyCjQhlvbFEn5UW0
         bBMeUzVoRN17xzx/lVOif/5h1Y4F40rZ6TgKf9MB73OlkoD8praoM0bQUaid2oinx9C4
         iYTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyiI9I/O79gI9XnJ+3e4KE0BCheb0aK6fMdEvyUvngUbolS3z1fZzeVummdDx8xVnZ+LZAE3REXHuExaqynJnv@lists.infradead.org
X-Gm-Message-State: AOJu0YwwjoduN4hOlABtVJ+l7WSDBnZnMVLozuSTcVoSPbgjH9eeprrP
	TBMgUrxCg69ZZ4VGIOcqgZjWd1GlUyHPGLBoQsdt9ZmU3KkmJ71+qAttojJjEZb+B4KDqC9xEA=
	=
X-Google-Smtp-Source: AGHT+IH4bVunQjsBO/jFeFQ/40wQ6/8E/Cc61XBJcsk8PC0On7+XU7q5CsbrMyF4FwtbVkJiBxDn5Gl8
X-Received: from edc10.prod.google.com ([2002:a05:6402:460a:b0:631:d068:2197])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3553:b0:62f:5992:a64a
 with SMTP id 4fb4d7f45d1cf-634677b5aa0mr6138973a12.13.1758727649406; Wed, 24
 Sep 2025 08:27:29 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:26:56 +0200
In-Reply-To: <20250924152651.3328941-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250924152651.3328941-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253; i=ardb@kernel.org;
 h=from:subject; bh=VXQIH5e7qk0odJJeP5mqROl0N0Kotb4txaIG+Rdz7OQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMK75EVtWHbDBr3pDX8rbf32+8eueq4P9vfBO7u4CDBT
 UtS9/R1lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIns5mD4H32F995U74DtPb4R
 +buOif/bad73KDLz9V6OTTfShC5dbGdkuL8nPmmZs/qkfYGxy5N+RH/LWyGenmPwTlHv6edf6tE LmAA=
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250924152651.3328941-13-ardb+git@google.com>
Subject: [PATCH v4 4/7] arm64/fpsimd: Permit kernel mode NEON with IRQs off
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082731_872310_B70FAE54 
X-CRM114-Status: GOOD (  20.37  )
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

Currently, may_use_simd() will return false when called from a context
where IRQs are disabled. One notable case where this happens is when
calling the ResetSystem() EFI runtime service from the reboot/poweroff
code path. For this case alone, there is a substantial amount of FP/SIMD
support code to handle the corner case where a EFI runtime service is
invoked with IRQs disabled.

The only reason kernel mode SIMD is not allowed when IRQs are disabled
is that re-enabling softirqs in this case produces a noisy diagnostic
when lockdep is enabled. The warning is valid, in the sense that
delivering pending softirqs over the back of the call to
local_bh_enable() is problematic when IRQs are disabled.

While the API lacks a facility to simply mask and unmask softirqs
without triggering their delivery, disabling softirqs is not needed to
begin with when IRQs are disabled, given that softirqs are only every
taken asynchronously over the back of a hard IRQ.

So dis/enable softirq processing conditionally, based on whether IRQs
are enabled, and relax the check in may_use_simd().

Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/simd.h |  2 +-
 arch/arm64/kernel/fpsimd.c    | 25 +++++++++++++++-----
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
index 8e86c9e70e48..abd642c92f86 100644
--- a/arch/arm64/include/asm/simd.h
+++ b/arch/arm64/include/asm/simd.h
@@ -29,7 +29,7 @@ static __must_check inline bool may_use_simd(void)
 	 */
 	return !WARN_ON(!system_capabilities_finalized()) &&
 	       system_supports_fpsimd() &&
-	       !in_hardirq() && !irqs_disabled() && !in_nmi();
+	       !in_hardirq() && !in_nmi();
 }
 
 #else /* ! CONFIG_KERNEL_MODE_NEON */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index d26a02ea2bb9..5af3043fb0ca 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -225,10 +225,21 @@ static void fpsimd_bind_task_to_cpu(void);
  */
 static void get_cpu_fpsimd_context(void)
 {
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_bh_disable();
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		/*
+		 * The softirq subsystem lacks a true unmask/mask API, and
+		 * re-enabling softirq processing using local_bh_enable() will
+		 * not only unmask softirqs, it will also result in immediate
+		 * delivery of any pending softirqs.
+		 * This is undesirable when running with IRQs disabled, but in
+		 * that case, there is no need to mask softirqs in the first
+		 * place, so only bother doing so when IRQs are enabled.
+		 */
+		if (!irqs_disabled())
+			local_bh_disable();
+	} else {
 		preempt_disable();
+	}
 }
 
 /*
@@ -240,10 +251,12 @@ static void get_cpu_fpsimd_context(void)
  */
 static void put_cpu_fpsimd_context(void)
 {
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_bh_enable();
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		if (!irqs_disabled())
+			local_bh_enable();
+	} else {
 		preempt_enable();
+	}
 }
 
 unsigned int task_get_vl(const struct task_struct *task, enum vec_type type)
-- 
2.51.0.534.gc79095c0ca-goog


