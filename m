Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F90E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33vNghdTGkjvHLzGCYW2qoDNw0mlPHElmOb2schp32s=; b=jxP0IpZi77zUhahgCrxHvJ+TgW
	0SfSU8OsKCFTeB5JMfiXQ90FdRROZ0ZGvshLgBbl/n5R1FpkXdsHRNQJgpZ9bAytUHeDoWMpwOyH0
	ClvaXpMmkWL/GMSZ3WfNgJrcB9YDReeXJwltLdu3tM7duzjnJjX3hp0SmB/Dw32vBtuartN1G/ov7
	fnkTibN/GilQDM4LpMV7V4fd4DJb06QlRXcyjOWhoPScNxHqX1XKJjnv/EHy5KvaH61dt+gcVmjjF
	qsKxEivNLe3jAqsMJYWi8PmbNbN0bfUh/0kkWIeIxfLHvlGyo+90T995t4P8E3fU0OT64HQtgKRqv
	4+XqCYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6c3-00000004IDI-3aCM;
	Tue, 07 Jan 2025 10:15:03 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV667-00000004Abi-1Fjw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:42:09 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso2145121866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242922; x=1736847722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33vNghdTGkjvHLzGCYW2qoDNw0mlPHElmOb2schp32s=;
        b=SfCz5P55KdwepC/u+pO8jtOdVXJnv3SynLCDVlqN00u86adUTwR+BROW3d+3J26AeZ
         6jz5GzaMMB1L1wJL9pOSHRgp5N2r1oe5DdDuE35JveC5rewPs44SOyMMmVWLio4KCdti
         P6io/OmtddukCAonuRDT4DbmKrIyO6wBcPFvqOq7XhQnpuVwqjhfSI2AepsXlbQm+rck
         eCw1HXmbfHjDUky9GMql/3ybUSTOUgoMHRGMBnW6O9TtfetlfxoDCEZPmiB5lRhVJBFU
         jI1gDI72r+dIn0PdvYrTkea0QDscjsSnd+uXpexo/gLfzqdzV8PakUF/v4b8crAJYbnp
         roEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242922; x=1736847722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33vNghdTGkjvHLzGCYW2qoDNw0mlPHElmOb2schp32s=;
        b=HPKIQH61dic8g/4sqRTUr/H1z1WxFYaspCFlx/Tgzx3S6yA0f7D9dH8enPS3Y9YzX1
         Xfx66AN1Tk4SfXVHTZP0H7oSQOiDHdxHodnTVr0P9F0ifyl5MlXY9/l2kFiKRWxiiSeE
         PMH+wLB7mIgon/JLzyotokJWXEEy2hgkqsdq0dt4FxefiTXtNhCeYLgtDCUOqhWHkAgQ
         Ib6js4L6gdOEIWk5IL4dqSvngn31c3mK0G9iLAThLzxJEXwHHPe8Y/9aSX8pyB7xySQN
         HSSLCqWGEq+uPiwPmbZ8naj7pRhYcfn5/btKaOhsNFUorYenH/P/FgP3RZZ7OlxyJs1s
         IfIg==
X-Gm-Message-State: AOJu0YyksPKgJmnP2lV7v70+8XLBc5UyccTKqtXKj8um4EgHl9ThG32f
	M3Jy2ung7Mj7xPUROgwgZsJYMfliFE2CAWwVePlSTTyaveAlX+aGs0BUqnbuxVk=
X-Gm-Gg: ASbGncuMb3tP7meGOrs7MLxoCYK45fJthVQbXmDdJY+Jrl8xPIY3gTFgJ7ZKpeDfBBS
	Md8XbZRbrpu1RkE2SjebkKcWFNJQxIYkEnZhyhFMp89UEIdh8+WYy4zO4jv6AVIlG7q91u1erlH
	IosrXcR/w1fxa+7AtC5twVZXg2mh++WgXMVZenoyOiN09UfvVN9CfuIPQXgB3BfbewCuT2UnjSg
	pfyCSwBzx9KEWTY+gGaWksOE1+d6b58/wlYJ78CpASa8RFrhM2/TMz4D+sKXxDqXx4=
X-Google-Smtp-Source: AGHT+IEXSqMDdLWEVOLm+/ypfhPzotrgNQdcTuiEWGVxTX1sQzs6KiT8mG4S8teEme0iKBSwiJOMbA==
X-Received: by 2002:a05:6402:35c2:b0:5d0:ea4f:972f with SMTP id 4fb4d7f45d1cf-5d81dd9af30mr132628782a12.8.1736242921817;
        Tue, 07 Jan 2025 01:42:01 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:42:01 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:43 +0100
Subject: [PATCH RFC v3 27/30] ARM: irq: Add irqstack helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-27-4e5f3c15db2d@linaro.org>
References: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
In-Reply-To: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014203_355963_2E2E4985 
X-CRM114-Status: GOOD (  18.92  )
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

Add two helpers that essentially re-implement some IRQ
dispatch code in C: on_irq_stack() that checks if a regs
context is on the IRQ stack, and call_on_irq_stack()
so we can explicitly issue handle_irq() on the IRQ
stack from a C program.

Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/irq.c | 31 +++++++++++++++++++++++++++++++
 arch/arm/kernel/irq.h |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
index e1993e28a9ecfd80b55b2677253ac582467e6c14..4c1a678b72b326e42c871b994c09d1fa4b0863f6 100644
--- a/arch/arm/kernel/irq.c
+++ b/arch/arm/kernel/irq.c
@@ -43,6 +43,7 @@
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
 
+#include "irq.h"
 #include "reboot.h"
 
 unsigned long irq_err_count;
@@ -71,6 +72,36 @@ static void __init init_irq_stacks(void)
 	}
 }
 
+/*
+ * on_irq_stack() - check if a regs context is using the IRQ stack
+ * @regs: the context to check
+ * Returns true if regs is using the IRQ stack
+ */
+bool on_irq_stack(struct pt_regs *regs)
+{
+	u8 *high = __this_cpu_read(irq_stack_ptr);
+	u8 *low = high - THREAD_SIZE;
+	u8 *sp = (u8 *)regs->ARM_sp;
+	bool on_stack;
+
+	on_stack = (low <= sp && sp <= high);
+
+	if (on_stack && IS_ENABLED(CONFIG_VMAP_STACK))
+		/*
+		 * Also check that SP is inside the linear kernel memory
+		 * if using VMAP:ed stacks.
+		 * TODO: Ask Ard to explain why we need to do this
+		 */
+		on_stack = (sp > (u8 *)high_memory);
+
+	return on_stack;
+}
+
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
index 0000000000000000000000000000000000000000..c5186b67242a2976fe702154ed4f2a22eca51add
--- /dev/null
+++ b/arch/arm/kernel/irq.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+bool on_irq_stack(struct pt_regs *regs);
+void call_on_irq_stack(void (*fn)(void *), void *arg);

-- 
2.47.1


