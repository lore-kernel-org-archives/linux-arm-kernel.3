Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539A7C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgPYwUz2C3jq2K678fDOOKopXFthUCF1z0KBZvQ8kgo=; b=m6mvK9ikTp2TMDCkc2B5ozrv1F
	5BA7i9FYTCjDUqzXEGyXnq3a4mLELbXGK9cfRv/K/uezPhVYwRXHunnGq7OlNJll/sF+v52aCiHBQ
	6gY6uwj0KfRxJeYM23HqHSFW8SesbiHH0mG1W/N514LNR7IttB+8QiofvpKX3j8WQNCF/3N8G1/p6
	V2yfXyrAy2vLwo5ILTfE1Clw3B9LFOTKn5W/69nSeyc6bV9i+4I1y/s74o+3417eSvUDOTAZ9381/
	OT7BnwSqNaOHmriCk1x2xCkb6uXFzkN/hhwDzRWDU9U3+cX7jN+kKVrgDqOnR1CAynsE3Yh9Iz3Qp
	RU/9CtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBRw-00000007HY7-1p5S;
	Wed, 12 Feb 2025 12:02:40 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq7-000000079kc-3yPv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:37 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-308eebd4938so31230691fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359414; x=1739964214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgPYwUz2C3jq2K678fDOOKopXFthUCF1z0KBZvQ8kgo=;
        b=ImZVcorrhG6j8oIOb52Ah0vBD0Sw9kBwVnbe6jrF/A/xnalwAsD8gzORzkBw/1s8qP
         MgmykK0F4VIyYjfBURdhOd7y8Ip36MQyKFfVat6MkMLVUURI3cONPv/gVBXpaxx6lA3L
         6sBiaL3Y4Q1xwdQdB4ARSFze0wPLbSz64zXdgBbYqkWTkjNvpsugXAErj81dMNwijZaw
         YPfJsW8eiVWljG1hIBoSPicyOJmGzT4ZWYUPwvA+EWSkU0P7EupKAX3/jm51esvkomUT
         a4wpz1tpJeqY/2PMuy3Y3x8CFs8GV4WBt4zsl4zNCKRszVvnU/ZPBjx9/gcP2uRkqpWl
         Jtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359414; x=1739964214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgPYwUz2C3jq2K678fDOOKopXFthUCF1z0KBZvQ8kgo=;
        b=vHlZOkaYuMaP3msI4mcoiSI5E285pC33mFTAkq/gzqmrT6rWV0zyT3Jh7VrWkL0i0N
         nHY8J9MnK9fYi2dbVqGPEb+/GI5ekfmPq81IOe+cIWNsk4VdDkodAJ6JFJehl3kyHsad
         U66bi0uRjSaQ/rwEcNFEa/mUyamouUiLkvYGcY9Vavawv3f6C1sf5daEWASOUiXxZ1VK
         LwUN4xtbr672/s/v6IkgWqmnp4XNR7JndPy5Nd4tJlegObEut7FkgeIi/OmTRdE7L82V
         MexKlcLya/inclbm2PmuDIC38RIIdKNUzCfbQQePCKP+CzxmLtKuLPGATmEwv2yGbheL
         XhOw==
X-Gm-Message-State: AOJu0YxJDaT/1ftAvx5EM44ZtC3PnZksXmqebFaD4nGNtp/e3gZrznBK
	u7WHIKHtGyhM6BsqRSsubjqyBvoVcopB7O7jkOS1THR+NSSXnCXHTBfLrKr29W0=
X-Gm-Gg: ASbGncsBehEv1LSSpxyJ1p13EG6iSyXburVXWXhtCR4Skn1C4XI9fwLjmRpt2tG6FfW
	Nn0XSyb9XJKVq8HMoUexdER2ql4eDVDWM2wdj707LOqkuzsLjzuJeSXj2teXjIZ/ZQzwtFVWaEh
	krFZksSJ13MXkbzdGzL0ff+NjdpUc/97ZngQbGHnXMYJNW//RWxu8A8Jd48Y1SDaT8b9HPPxMnb
	R532Q7fkLyDg4ACzjKDg8MHbjvVGDvnHGqwABrVC5PE0/z1qQhF7fWL3+96a2REF7NtxGkAT4g1
	p5knqOaVGYBHhuKpYLbTQezUYA==
X-Google-Smtp-Source: AGHT+IGF2XSQHUsYlAH9QvRI7MOgHMAfLQ2S1iDSbZ5eNFwUYo7EQJgkizHhQjqYAo/v6F8JXXJM2Q==
X-Received: by 2002:a2e:bc84:0:b0:308:ffa1:8915 with SMTP id 38308e7fff4ca-309037ac73fmr9166291fa.5.1739359413983;
        Wed, 12 Feb 2025 03:23:33 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:33 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:21 +0100
Subject: [PATCH v4 27/31] ARM: irq: Add irqstack helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-27-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032336_035908_B6E7F243 
X-CRM114-Status: GOOD (  14.85  )
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


