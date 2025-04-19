Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA532C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfgswIG46fDfailpV8Wq3k2rCv5IayqJioTZZoftrUM=; b=y5nUsxrU8fKHM82KXwUjGVrsFE
	ZBaL3aDM86ZF83NDiA+oQ5uQI3tbKwYzrXrIoIE0VM2m3I3dVCKMlP3ptfuzMsuc36R8DVt3psoLn
	Ct0wL+OxF2PA/BnYXE07tG8QddyhhD2A2tCPO0eQ/nlC3fqM5dhAGjOp+MDklv1tDU4E6FHtimB0g
	gtDY2rE1UGtVgtwbcQwVrHgAvqfUNaxApJXfsN6qIYfF73T/W5mmGT8YhsdMthl4bKCwU3XAs5D9O
	jWutaAyuS4BhMZOv2B5r69rPj4T+bYS3u3hRMDiFhkdLIazyo+wq3TeNmPQb6VER1QctlOiB87KpX
	yrw0iMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HdG-00000001xuI-23sR;
	Sat, 19 Apr 2025 23:29:58 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnZ-00000001svD-1hRr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54b10956398so3477019e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102192; x=1745706992; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfgswIG46fDfailpV8Wq3k2rCv5IayqJioTZZoftrUM=;
        b=Y4b81BPRQ1Kp+nq0ktCSn/3LRr+ltppXr7Auc9fBc9mDvtQtxgVLrmIXK95f9/sLFI
         1GyHJ3ZgBVuK9Zauy+0d+nljTKppIfMljJGdpdDvdWRiMpFcy4DZdgbG4TuRMUsMzghA
         oOMEHzM83d9DQITYdRMoL+L8B/QFClAX8ZQBJqls2krDutEABx2XGOor51Sq75iVlJe4
         5aFC5dzn4bj+zIXEM2/Li/5B07UtbhC3IDwe2zGAr4E4UXt7qSOOlalSRgeH9YzoIyHl
         d3e+tWfM6rkYIFvUaLVOblyAcuUfRtOpwuUa6HG9ems+a/d9/JYlwwaecffX4H4RTMe2
         kZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102192; x=1745706992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfgswIG46fDfailpV8Wq3k2rCv5IayqJioTZZoftrUM=;
        b=miKnTPnxmCfiJdwKPTKm+iALHwFXLX/p0YwzGzqXBJCGbm9QXXKFu71rtgvD6MKdSg
         ABoXSLsOcop4TB3cxaXLuXziCj9xJh5oFmdtkE4pEDw99p9jm8JDnWEypogWsxRza3FV
         auZ7Fx7Druq+/acuoPy6fFTJE21W6wesBSZyjcrEhCqCjhwRP5LcIhRUS9+AvWBWOiNd
         D4AchX9dB4MFozuSaUx7Q/OhpBp0Mc60EtSmr1hedO1tk5p5euCx5/25R5341mvE6RuW
         3Of3kEp8PGl0iQevRP44fmW44FuT/Ev8OonlV7uuu9gIAHNrj0vTpTAFFpwnngFp70LG
         cW3w==
X-Gm-Message-State: AOJu0YydBw+afBV6NM7mheaedFkGT/+APDsQYajgZz9o9QpCe5xSA/q2
	yY1TRi1tJ5W3yyZp+iJP26nof1jgeI9Qx0HvqtJq0ZPTYOhvbFH9vAqQ73U+/cc=
X-Gm-Gg: ASbGncvEA2IPCziJ3f2fWfoYbwXFMdSesK3n27baOlFDoxRHequOF/r8fo2EfPmpQzd
	7C5B7WB3bGhJbbxNkFC4tDCrvnOw6PWqHKTtBT6bJG+tgl9X1EYYJLCRoNUEQucK9jM4gq9sySI
	LCZ6YUZkpiUslq/M6wkX5am6bJQwhWP36ZpbhmX15hKCV0IBpk6x4C033PVnpENofTtfzeiqi/j
	12/1yoTdliel4pS1153m1mAWDSdBO7mEmO6DP83ZZlWz5ZPVbgQ5M2uDAD9Qr3qcWx3HcSn7JZV
	44ylKv3Am5qdldMNiIYKGOZ6XCoBgeD/bDxO2O6EEs7U+36q+P8=
X-Google-Smtp-Source: AGHT+IFfnhm1zNJreqEht0x8JKUibYOmGfzmfZxw7zoZa+K3UUB1bVa8BYsj+GgIiEpufBRw+Qi6pw==
X-Received: by 2002:a05:6512:a95:b0:54a:fe25:43d1 with SMTP id 2adb3069b0e04-54d6dbc431dmr1799555e87.10.1745102191927;
        Sat, 19 Apr 2025 15:36:31 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:14 +0200
Subject: [PATCH v6 27/31] ARM: irq: Add irqstack helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-27-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_153633_449317_710D05F9 
X-CRM114-Status: GOOD (  15.65  )
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
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


