Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB958C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=003i/GX+SMhbEk8JM6zOLdGB+5OhPHak3AuWaDpYHh0=; b=qXmhnPZ1cU6ZVFLJm8sTgmmpj/
	BCIwN5F3cYYdrcu5y2/eblGnX8/P3mNy7SzT9vxytNl7UX0dtwa7/yMTE8nQXhoTR3q1i1DUIWsp3
	8N7Brz6bfv7giNkygNw+WDE9IBqhZta1TIEQP0jLkKmTf0a/8betQJtb/Jq8dyviSmMDqDm0JeaUS
	tC/Huzcajo88jlmRNfVt+HzdosbN9Lf26XAUWHMkw3YIqt1bQZXjqafxV4hWNXtsUoJ1JZ5G8a1fS
	Y0S9/GzcDpN88Z7UPYzr3hr6bUSxKIQlalLZ8IrhHEBxbmiiTlbrLFNKI9blHUttZLgcUkQtOY2pw
	Z2tg8WAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAPo-0000000DSAf-3Bzj;
	Wed, 30 Apr 2025 16:36:08 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAHS-0000000DR4X-1nOh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:27:31 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3912b54611dso3842727f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746030448; x=1746635248; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=003i/GX+SMhbEk8JM6zOLdGB+5OhPHak3AuWaDpYHh0=;
        b=H3a7RA/TJXEzE2qN8nRr2SuZjHZzBRnXXIw0+sw7gIg38lSMSz2+mxhXRCqVQi1Vo6
         Zc9eNycpTSyoBG67drAEascTVaVE1nJ398sPxql0qr8NyUXXjTwKHWcZBSupYi6yLqeS
         tMCU5Ltav/Vx2HsCJJ8mEC/Y28BP6IRd9gHknCrtSfJtok6bFzAXxsdvHgdGTwGV4dTM
         5dZ+U0QSbxvW6WsPnJuI+YUyqQXD/NOMqEFPrL0bN4Dd7iBdbgDT3F/bd9dO8IS2hAr3
         4+kmWN4TBTgTi2YIL5k9yXuba36IrIuff9rnOBvElsW5w66OVzMpigfArzXLxTZ5V+SQ
         UCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030448; x=1746635248;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=003i/GX+SMhbEk8JM6zOLdGB+5OhPHak3AuWaDpYHh0=;
        b=qfS8mrDHMw5Krb68YUc/pcwkw8y8lz5fByxC74NhKYkniuQZTew9EldX0EHm3LN0ll
         kd2Oe/KZQ5Sy9iDg3/izGyUujlbwdYCVlv2pvm/Wd4qDKXVmy1U5Em/8o80PuQsrK97/
         lLVmRnUHw0eROwWlpiIWcUwceaebyL/WJVK6rlYfGCGe3jO0jPUuw55TQVQzzopfUKQ2
         N0Hg8idWtbc5VWacGglcGDqijZ0F9TbgY73gy+RHnwm3qOkyZcNfuhzn4G8AI7u9FKu/
         EOgjeLicG/VAB5lVkm7CDcrjvh40uKpWfIJGjwkJcr6PrY+yQqiVYk8+LIZxiqAn8LwG
         tMuA==
X-Forwarded-Encrypted: i=1; AJvYcCUTVOKFZQt2jKnFdmaOGovDSvGVF0KLD/XXTcDNWCFLa6qkFhfcOhFYss/YeB9NG+RUdpbHlhGrShKC+k3ccrsV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3tH+Hn1sOfvkWObvPQUPvb//A6aD9iRYJCcbXe9JJmWKYGr4W
	YzE1mJNbrKiBOzCNoOvtltQBlry22CNEHBaNO8VFtyXnftWDZD0eirA33pUOTl3b7YSsgxI8anS
	IO9QFqIfmXg==
X-Google-Smtp-Source: AGHT+IFmvlkwLxNmZ9CSFJVW5lMLHM9FQhYVBrEhGonj9gK38XYoJ6Wzk9kIHfgZWiH30GqYlq6Z8FTj6W6gdg==
X-Received: from wryv6.prod.google.com ([2002:a5d:59c6:0:b0:391:4999:778e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3107:b0:3a0:7af3:843f with SMTP id ffacd0b85a97d-3a08f761185mr3815578f8f.19.1746030448153;
 Wed, 30 Apr 2025 09:27:28 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:27:09 +0000
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250430162713.1997569-1-smostafa@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430162713.1997569-3-smostafa@google.com>
Subject: [PATCH v2 2/4] ubsan: Remove regs from report_ubsan_failure()
From: Mostafa Saleh <smostafa@google.com>
To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, 
	ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, 
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas.schier@linux.dev, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_092730_465871_2876DCDC 
X-CRM114-Status: GOOD (  13.43  )
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

report_ubsan_failure() doesn't use argument regs, and soon it will
be called from the hypervisor context were regs are not available.
So, remove the unused argument.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Acked-by: Kees Cook <kees@kernel.org>
---
 arch/arm64/kernel/traps.c | 2 +-
 arch/x86/kernel/traps.c   | 2 +-
 include/linux/ubsan.h     | 4 ++--
 lib/ubsan.c               | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 224f927ac8af..9bfa5c944379 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1118,7 +1118,7 @@ static struct break_hook kasan_break_hook = {
 #ifdef CONFIG_UBSAN_TRAP
 static int ubsan_handler(struct pt_regs *regs, unsigned long esr)
 {
-	die(report_ubsan_failure(regs, esr & UBSAN_BRK_MASK), regs, esr);
+	die(report_ubsan_failure(esr & UBSAN_BRK_MASK), regs, esr);
 	return DBG_HOOK_HANDLED;
 }
 
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 9f88b8a78e50..4b5a7a1a8dde 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -351,7 +351,7 @@ static noinstr bool handle_bug(struct pt_regs *regs)
 	case BUG_UD1_UBSAN:
 		if (IS_ENABLED(CONFIG_UBSAN_TRAP)) {
 			pr_crit("%s at %pS\n",
-				report_ubsan_failure(regs, ud_imm),
+				report_ubsan_failure(ud_imm),
 				(void *)regs->ip);
 		}
 		break;
diff --git a/include/linux/ubsan.h b/include/linux/ubsan.h
index d8219cbe09ff..c843816f5f68 100644
--- a/include/linux/ubsan.h
+++ b/include/linux/ubsan.h
@@ -3,9 +3,9 @@
 #define _LINUX_UBSAN_H
 
 #ifdef CONFIG_UBSAN_TRAP
-const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type);
+const char *report_ubsan_failure(u32 check_type);
 #else
-static inline const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
+static inline const char *report_ubsan_failure(u32 check_type)
 {
 	return NULL;
 }
diff --git a/lib/ubsan.c b/lib/ubsan.c
index cdc1d31c3821..17993727fc96 100644
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@ -25,7 +25,7 @@
  * The mappings of struct SanitizerKind (the -fsanitize=xxx args) to
  * enum SanitizerHandler (the traps) in Clang is in clang/lib/CodeGen/.
  */
-const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
+const char *report_ubsan_failure(u32 check_type)
 {
 	switch (check_type) {
 #ifdef CONFIG_UBSAN_BOUNDS
-- 
2.49.0.967.g6a0df3ecc3-goog


