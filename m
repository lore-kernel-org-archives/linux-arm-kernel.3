Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD1AC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MD/Nu2Av3rMkoCf1kcmDdMh+qfX7Gu3u+XPV0sJ8QcQ=; b=l1xUFzQnRyMtXDYz6TBXflh6rR
	s7xb/M7lYzb6Uxj//5NHksaV87S3mRnnrIYBIRd803P3LzSpJYYqmmyQYt5Tl9A1iKOp3gaT7YJ3J
	eeV4eI0OGYfLZl31CALImFb2qujxPRt6H0lflcu+roPFXc42OyDSMTiy2S7HFWW4Zw/joLozk0bBF
	l3lyX8aLnTd8quT8bTx8FL8V+rjodjhUj0JvWw76P2+bjWZHZitmKSoVavznieBqbqCuAEdTLNZL8
	jtOt/NhzEgWIv8n1toZTDu8YcdwFEoURf8kiEaeUrqA1NhOV6D9t8NRIYP/0dAYaAPgDUfTwVJW2H
	064Ol2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HTt-00000001wtc-3F8b;
	Sat, 19 Apr 2025 23:20:17 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnT-00000001srp-0N1S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so2762037e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102185; x=1745706985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD/Nu2Av3rMkoCf1kcmDdMh+qfX7Gu3u+XPV0sJ8QcQ=;
        b=ZGfFrPi5pJw74Vkx5Pp6eQC5N82vx5MrXK5PgfjUilY2rvunQoXjqYpZVgm/uTrbuD
         RW8VBo1+oAjKu3Pwib5zh0Xc0naR9nJNdrTu+QBoISB7fM9Krrvc/Pk2sngx2iUzKM2q
         R59DwC/f4r2SjQU3gxc+RHbnA3AAmBSW6Jlsx5nG4Jtw+t3lLgw4BSK51lnvhf/zUHOT
         yzdw7WlcAZos+E3r455tir/0Ywh0BLrPsJDt0PDdqvOFJk00YGKWtF1Dh/xbF3rNGSpL
         YtCNPY93f6Z2Sgga8FAz5vji5bpl+LmR9iqGgohmxax0RS25yhDyZb0KnQyga/la/2b+
         6fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102185; x=1745706985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MD/Nu2Av3rMkoCf1kcmDdMh+qfX7Gu3u+XPV0sJ8QcQ=;
        b=sehLulbCpvx6fgsRbfGnqt4xUDbSZdHkP5AzlyW5EW7KVts0PVE120acNX1PQkEkaB
         Jim0+OgwAEu5ahq2x0luOSjBDM6y4vAkv8sLjIdfFyPKJzji06PYj4cJp6rRmHK/yvYS
         F0JeSqeBE4fMdaYUFdcs3bwQK9du/KihWrbWOPJR9xmJBLAUBIkM2F5bdlTe3rt+454c
         bxdDg+55++x4bDqgWhQEw4W3JbhDn0nc1DQZhYxnB/SnJbNDL1M5Jf1Mf1bC/JS4KgXb
         gfls+vQhQdF2DMmAbJ1+APyP6XcK2JnlKPEMx4x3PtEtTtopQ/GpHTf25p/EP45ZqSqi
         WOSA==
X-Gm-Message-State: AOJu0YxFnfmGRu4gtjixbeJkdLJBR3QmDAdmlmyWYnpEt2XepTHWjZLe
	Ip83pB0gH7wMrsVeJotmAL7FMcKOwX2E4ROcjX9jhDFy4GVa7Ps9KWmV6Uj8g40=
X-Gm-Gg: ASbGncsaSuGw0o9R0UtvdpM11Aw5cDEtpLrbAzEVAAx9+SMTu1PqRU8pvc63JMWBAMi
	WKPzqKzZ3knXPg1NcyuLC1xh8iEFgLFvLppXNtd3RdA5I2F2rlbqr64hH1X1IWSYsUcr1xxd0rO
	3pfgjnDUfSp882+gl9RPlmbUXP//USvxpDKimkOAh+L+u+QD80CVEuXtoWyw258BR8qTTWFe+XJ
	05j1kLJ9XeOLFIXnrE35jQ+7vCVKMBRmC3vdb0mEZ61+1KfuisPcgqXxSvi4DvQNNb9G7/7Ys5i
	w9YFF5eX9y1pyFw02yXqqP5Q6dddRmtPt8+VeEfNMyvFM7137tY=
X-Google-Smtp-Source: AGHT+IFOJZ5Y+jGQDL3SAl66onZDVj5qKLEaZqn2DNtHJeZeBNqZY7fqcX6ZDhbd7UrY2F5Kq+Yprw==
X-Received: by 2002:a05:6512:2393:b0:549:4d7d:b61b with SMTP id 2adb3069b0e04-54d6e66272emr2510712e87.35.1745102185559;
        Sat, 19 Apr 2025 15:36:25 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:25 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:09 +0200
Subject: [PATCH v6 22/31] ARM: entry: Move work processing to C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-22-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153627_138117_8D78966D 
X-CRM114-Status: GOOD (  15.04  )
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

At the end of a syscall software interrupt and every time we exit
an interrupt handler we check if there is work to do, i.e. if the
current thread (userspace or kernel daemon) has set the
_TIF_SYSCALL_WORK flag.

Move this processing over to the C entry code.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 14 +-------------
 arch/arm/kernel/entry.c        | 10 ++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 33bc9e7c5b32f62474724f1d47f97af24dba53bf..5385574c4339714f3d8b5ab6894f27466b89f932 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -42,19 +42,7 @@ ret_fast_syscall:
 	/* do_rseq_syscall needs interrupts enabled. */
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
-	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
-	movs	r1, r1, lsl #16
-	beq	2f
-
-	tst	r1, #_TIF_SYSCALL_WORK
-	beq	1f
-
-	b	2f
-
-1:	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-
-2:	asm_irqentry_exit_to_user_mode
+	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 47233804733752aef0f2fec6f54badeab18e98d0..0e3960844b94b14325eb00ce7dd791b36c43ac3c 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,10 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/entry.h>
+#include <asm/ptrace.h>
 #include <asm/signal.h>
 #include <linux/context_tracking.h>
 #include <linux/irqflags.h>
 #include <linux/rseq.h>
 
+static inline bool has_syscall_work(unsigned long flags)
+{
+	return unlikely(flags & _TIF_SYSCALL_WORK);
+}
+
 long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 {
 	trace_hardirqs_on();
@@ -18,8 +24,12 @@ long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 
 void syscall_exit_to_user_mode(struct pt_regs *regs)
 {
+	unsigned long flags = read_thread_flags();
+
 	rseq_syscall(regs);
 	local_irq_disable();
+	if (has_syscall_work(flags))
+		do_work_pending(regs, flags);
 }
 
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)

-- 
2.49.0


