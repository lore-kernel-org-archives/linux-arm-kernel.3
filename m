Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422CDCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mUYvVlcUBSwWZBJFWnNGNrpggANoIhFSdXASL63NW/Y=; b=456lIVSSAsgidoucABtZpnyv3W
	lQ9bQKaC66N33CWrcntPic0jvw3J4Tvi1hBDQwlpdOFRr3Mkls+EYTSBHQ55CkrSODWcO5CKfuXoc
	4Tmmtj96/tBIkkXU5IYR08XoO2k4DuB6LXCCtlTMHZpzHN8cxRKkIw05Ft+9xo8zK71OiqTcUtGvM
	Hl6iHiTSMo6KcwGoJBqJsWN1iVTIEOpXc1ptWdwyRyXfKEEdRKWDIqdOX5RuaFmrKSSpKBMqmKz2D
	M+v1+gPbhn7lbi431kN5QFKtHS7p4KQjRPZYDOcD7n+EVDRZlf90MjRUCJM0Aaxz9l5SjIPn9qyuV
	kHs+zavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGeTi-0000000DqrH-1M7g;
	Wed, 05 Nov 2025 14:27:14 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGeTe-0000000Dqqq-38Q0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 14:27:12 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-594285c6509so3688176e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 06:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762352828; x=1762957628; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUYvVlcUBSwWZBJFWnNGNrpggANoIhFSdXASL63NW/Y=;
        b=zNgRAF2spghvGvNjWBzWZOUbO1xLenM1EfwTvlTRhL+NTO7fOateowEzpJA2kf5rNu
         o1f3tCeDmW462fzfAgGifGKzaTNCTCPlNqAoXTjO/ydJT93XSt6fW3LCUsKeNlzY75UE
         Xzr8jxOHYoKum6Am4rdMX3FnjhWqGQ1+cOUeM8fPUCLmyCa4+Neya4wR1q74W8VemGzN
         6X20LHkbCrMBwS3E/aEN0AIKM0fNBIs8P1ILlnbqcIcNJ1ZY07xUMtycL68um/4Oi2/A
         B2NkAQBxxtWrxvQxSXOeh/lswQ+U5hvsMpdH4SJsnk9YquKEmY9hsJpKFcNmaE6r4sW8
         qH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762352828; x=1762957628;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUYvVlcUBSwWZBJFWnNGNrpggANoIhFSdXASL63NW/Y=;
        b=o34JHfJx4FIgpThmxubT0WIjWj/eRGusMStNc8czHKXSA7J3AtNKtgT6s/RJq8/CGr
         blTrGph8z3+wjsiaLkyi2iCsKKTr6efPSXw85p5vpnVcMBR6p+voQRMC6KUQHIKeRR2L
         1CE97BpUrImEFBii5OArMkFLJ5QaxqlBW0DbMyQuSVUbKfdbLJcDGLDc/cbCH/tgDMJl
         1uAYeZfcwcFnGDbQ0YIMpBiHaROAZ8Pf/zBe2UYweptK7012vkSdFOzl36nTYPrnuiS+
         Qkipf6YBHfMJ4iLyyIRVf6hMBIEP3ZqlJYjY7ZglZZXRKaUwgUL0vF1UdGsuF18AuLTJ
         fQbA==
X-Gm-Message-State: AOJu0Yyqnym/fRc/DQF/nE0OMT9k88Jw3gINskUijz7ZhVIjie88OrEF
	F9cTKcNSHFEyPKhMYtWX7UKCzEqLeCM718bxEqJz5zg51b6FMInUv095mlnfgZZ/fXAGUN69d5s
	KUcJFguWBmw==
X-Gm-Gg: ASbGnctde3iNm7UdGtFXCLJfORGAp5yUhbUbtHJ8ECNFJTOXnKNkejpQVcJBI/JwSH6
	ESKPybYGP4n3IWMwYDq6+ts589eNOgu2ZCVcUGFhmxPptqTdN6fvCklj74yaMQGHx1xIJE7qQVa
	rnzbwDz9G+44V8Z7aBVcnfLQMWerE9Tpr8xbq8Lsl3GEgHHAuPC0aDb3qBOuNvA/UoYDT6ZAjz5
	ICXkWEIs+VNkcJ4bHc4T5cvkEEJ8buIHpEUX0LwaZjRf8MCaFSGTwAxQyqHXiYLaDznWLH8Az22
	TlSz5uhJ6gMBNMuYjT4Zzpocqil3/tk9kXqs2nGY5RCS1og+gUpfG7W/bBHIvy9mMO5eGXsB2NT
	5kh45z1CUQDMRmkYY8rtqzwyMODVu5LEuLoudL8g29NHEi8idCo0J4Pf1I/5UkthFc7dEk2HQzH
	liWFhCnwr/cMjE/hM2BEip0A==
X-Google-Smtp-Source: AGHT+IHsfom2kQ8UCVbuWQq9NEQFf8QH63oH/QW2rAqxXwnqN2IznOHIldX4zj4pC9rKNSvusWJVIQ==
X-Received: by 2002:a05:6512:3c8a:b0:594:27e9:ee3f with SMTP id 2adb3069b0e04-5943d7ba220mr1022937e87.18.1762352828063;
        Wed, 05 Nov 2025 06:27:08 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594344398f4sm1760888e87.64.2025.11.05.06.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:27:03 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Nov 2025 15:27:01 +0100
Subject: [PATCH v2] arm64: entry: Clean out some indirection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-arm64-skip-indirection-v2-1-0ea38e853b5c@linaro.org>
X-B4-Tracking: v=1; b=H4sIALReC2kC/4WNTQ6CMBBGr0Jm7RjaVKmuvIdhUfoDE7UlU0I0p
 He3cgGX70ve+zbInslnuDYbsF8pU4oV5KEBO5k4eiRXGWQrT6IVCg2/zgrzg2ak6Ii9XaqCKgS
 treyMayVUeWYf6L2H733lifKS+LP/rOK3/k2uAgUGbW1wFzfYobs9KRpOx8Qj9KWUL9QoajO9A
 AAA
X-Change-ID: 20251014-arm64-skip-indirection-4ff88c27ad02
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_062710_833394_2565AFC5 
X-CRM114-Status: GOOD (  14.57  )
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

The conversion to generic IRQ entry left some functions
in the EL1 (kernel) IRQ entry path very shallow, so drop
the __inner_functions() where appropriate, saving some
time and stack.

This is not a fix but an optimization.

Drop stale comments about irqentry_enter/exit() while we
are at it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Drop stale comments pointed out by Will as well.
- Link to v1: https://lore.kernel.org/r/20251014-arm64-skip-indirection-v1-1-f8ccfd9dbcb7@linaro.org
---
 arch/arm64/kernel/entry-common.c | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index f546a914f04174e37bf3578490545edebb66afd1..6e8e1e620221fdb3da7a398c4c4293cce1e2b553 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -34,20 +34,12 @@
  * Handle IRQ/context state management when entering from kernel mode.
  * Before this function is called it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
- *
- * This is intended to match the logic in irqentry_enter(), handling the kernel
- * mode transitions only.
  */
-static __always_inline irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
-{
-	return irqentry_enter(regs);
-}
-
 static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
 {
 	irqentry_state_t state;
 
-	state = __enter_from_kernel_mode(regs);
+	state = irqentry_enter(regs);
 	mte_check_tfsr_entry();
 	mte_disable_tco_entry(current);
 
@@ -58,21 +50,12 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
  * Handle IRQ/context state management when exiting to kernel mode.
  * After this function returns it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
- *
- * This is intended to match the logic in irqentry_exit(), handling the kernel
- * mode transitions only, and with preemption handled elsewhere.
  */
-static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
-						  irqentry_state_t state)
-{
-	irqentry_exit(regs, state);
-}
-
 static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
 					irqentry_state_t state)
 {
 	mte_check_tfsr_exit();
-	__exit_to_kernel_mode(regs, state);
+	irqentry_exit(regs, state);
 }
 
 /*
@@ -80,17 +63,12 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
  * Before this function is called it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
  */
-static __always_inline void __enter_from_user_mode(struct pt_regs *regs)
+static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
 	mte_disable_tco_entry(current);
 }
 
-static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
-{
-	__enter_from_user_mode(regs);
-}
-
 /*
  * Handle IRQ/context state management when exiting to user mode.
  * After this function returns it is not safe to call regular kernel code,

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251014-arm64-skip-indirection-4ff88c27ad02

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


