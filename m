Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDBAC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgPYwUz2C3jq2K678fDOOKopXFthUCF1z0KBZvQ8kgo=; b=RkFwSyMPBhFTeCuf/O0Ic3e9jx
	t7a0iHQKrDfODEh0sHzbvHndLiYcxRiQoIV5B3gIkYslUCWmkwFivjSsXWkHEodzzSpMSuTOkXKMl
	3U5eWcKMgh3NRBxguNNw+dL2EOMCzZI6yYuBEYt9N/EyqhkdfaVV295mVmQELyc26xwZkxczjGn+r
	RNHFTCzswLwuw9JNCkBGFg88g67FrRAo8UwizXqA+cGfKW/Mt0usgWvWHB2BCEOoEKQAhG53JrTPn
	IXql2Y+w2qNLfBEi/oyGKTxwu2BTVG8ewHsTqHnT3rHY44LOtMrfsBU4fh3yGEAzybwNQIXsHw7P6
	yL4Efz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsWW-0000000GtvG-29rE;
	Tue, 25 Feb 2025 10:50:48 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrf2-0000000GhoB-27QT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:33 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5452efeb87aso5417847e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477331; x=1741082131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgPYwUz2C3jq2K678fDOOKopXFthUCF1z0KBZvQ8kgo=;
        b=pb95KdxV7x+jLXqjtKdGQlmH/NQuQtT6zkWTGFJUJ/IshDg5IZ5cuN1GLuvFyxX6KF
         Ca9r9xboVIfnw2E4kWUiQ7vvVAt+Fhi4unuzwjDTuCYFofRjygvL+X7rIx/dHbrWURea
         KSX2T3u6bB1cpfdXAe8gQ0peTNaVCUw6vwTacvmNr/A+cqqRgoAPRMK93cthoiAIrwJT
         n2EDqwlgyaS+KYmtwek20mFH7BQdBZ1VPvg8iqEqR2EMd+0hQImPvhLUqLQGbUF4XBQ0
         fNML/K2n4otme/hGlbxut3t0jwfeV9dfyNQ6p9QiEeZ6YxMyC8Mf2xYswjnGX9U5YeAp
         YyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477331; x=1741082131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgPYwUz2C3jq2K678fDOOKopXFthUCF1z0KBZvQ8kgo=;
        b=dnYUM4639z8jvPELtAoMX7UtwDogM6sjk6cBIPGzWRYamsjW4odkSZFm8xIu+KEryv
         iNfKV3XhHrIlTVw1PyAyNjOQv8Fg4VSYWOX4NeEwzi250EPJPyE/2pnHc1G2OfxD2kBF
         qrpvvBtVFDeJC9C49Wl3b8SHgmIu4wl1R7KeypnKeFYL0VEeVrNhO5K0hkp69iaEzSuv
         zzB671UxFVtRBgl+nSuKVmomxrYKiddaw5mcqZ0nqsEBwP5AZe0tjgM8AMrUcBXC9qZp
         BEMvnw2j9DGlAp6IdJAcsy0QzC0pbeNQzW0IBPVhjZygJ0Ddg7O51fJicxglby9R6oNd
         mQ5w==
X-Gm-Message-State: AOJu0YxL2ApCjs5VTIxiKg27SXwYabfYL541tX7KiDv8FleY8DHAGidv
	Er+QImqWHV29yVbRF1F6t7guRboZuE189lGtSNV6l8iqQoscZn2PKOpnjHEfJjA=
X-Gm-Gg: ASbGncsHaonazKzlRYgJIZOBVGO0nAn6zGT4r2jeC0NQrzAZSGTyZnNdgFnjj/gUFFW
	1hcU/BjubN7aCz55gWZQ/zy/I7mrIFlRSQmzdIoymhwgw+pDk9dw6Pv63EB/shZSIMVdGOfGpkf
	8MSxM82r2B9Bgq+M23C4kxx/hVHoVqXoDSjt/qUNR9zCIC0vTmfj8iwXF+70SIklnVdE6zdxJbe
	q79RY5NHMT6uZP2O0QYlh3QAkqn00uSBnUiEbQxV5GIZ1dDYS6zznSuNb8p8MjMnvdDDLIQRaA8
	maD8BFhWWpeSzif/FD+rZDhG/UF8Sxz3k5XR
X-Google-Smtp-Source: AGHT+IHrYBKEgwrOsqtabCf77riVA6wTLLPZltwvy4MPKuhYyJsmmbuvXTyEaXfB9oGzNDCBGFjJZw==
X-Received: by 2002:a05:6512:3093:b0:545:2f9b:7589 with SMTP id 2adb3069b0e04-54838f79d15mr5814906e87.50.1740477330711;
        Tue, 25 Feb 2025 01:55:30 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:30 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:14 +0100
Subject: [PATCH v5 27/31] ARM: irq: Add irqstack helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-27-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015532_549178_046978DD 
X-CRM114-Status: GOOD (  14.91  )
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

Add a helper to dispatch IRQ execution to the IRQ stack:
call_on_irq_stack() so we can explicitly issue handle_irq()
on the IRQ stack from a C program.

Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/irq.c | 6 ++++++
 arch/arm/kernel/irq.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
index e1993e28a9ecfd80b55b2677253ac582467e6c14..f99d6b24d8ff56f901e4a817c61a1e57b7e532cc 100644
--- a/arch/arm/kernel/irq.c
+++ b/arch/arm/kernel/irq.c
@@ -43,6 +43,7 @@
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
 
+#include "irq.h"
 #include "reboot.h"
 
 unsigned long irq_err_count;
@@ -71,6 +72,11 @@ static void __init init_irq_stacks(void)
 	}
 }
 
+void call_on_irq_stack(void (*fn)(void *), void *arg)
+{
+	call_with_stack(fn, arg, __this_cpu_read(irq_stack_ptr));
+}
+
 #ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
 static void ____do_softirq(void *arg)
 {
diff --git a/arch/arm/kernel/irq.h b/arch/arm/kernel/irq.h
new file mode 100644
index 0000000000000000000000000000000000000000..80dd5bfe6403d68fc62fab30666d5645748d329f
--- /dev/null
+++ b/arch/arm/kernel/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+void call_on_irq_stack(void (*fn)(void *), void *arg);

-- 
2.48.1


