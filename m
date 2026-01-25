Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDFBE63CAD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTnxHq4NFRumQo/SHU741WmHOHpkH+oyQ4unpkNu0b4=; b=K2DMQqf2G89drdkL/v9VRDA4W4
	zvsAiS5AQmxmV6EwWUK8162tVXffgRQTUTAazWvvcHFIq6iBm/1aOAUDACPZ4J2ntjpFIo3kW7UdZ
	p4o9/f04FKFMD10OANv9ubaPeSuRoDlfUtnzalJ4fcjADIpzvvRQR+pyW/sq+IqY+rVA+y3VwFAvt
	oWV1PPtldqvA3OC81YrZ29LmOFmS2wZg3uPA2NAi5EpEUq+QicbitwEiUGCHZOKR++Ki9UK+eXoqK
	hGECMJCMyp1XGxMbhr896p4ZQsNyPwRH+sAOA3ITgIsoZv3fXX33O+bx3e++E9l6YpgyBM6B3wDDn
	z6UISpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3Az-0000000BK8I-2i6z;
	Sun, 25 Jan 2026 16:41:25 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3Ax-0000000BK7Q-3bhc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:41:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a7bced39cfso42741175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 08:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769359283; x=1769964083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTnxHq4NFRumQo/SHU741WmHOHpkH+oyQ4unpkNu0b4=;
        b=PPTiT98g7f8U0019wVKJPYL4SmMVIwyBm8aO/Xhq5LtBqfiat4webaoVRGX9sjezbA
         WOAxWYKBUVPA8cw5Llt8Y1lQ5tT3uONQVB0LCk6wCR58w95YTUULmBGjxsmf/TK1CBBO
         pthUmwIeQAqR31C5TUcQn32Opiq6CSjVrIjjylJ5yUTnW5tO1/htnhpDmkYrIQ1KTvel
         WtGhAbi/TnE97vbPI69uzX3z3CqZJO1LJrkesaqab0jPYZMTn8nOLxURI2BDQr3CSbAm
         NpMkrmaH24EXv5C0vgWSdtLtK3IsiAW96tM+rVby/eNxOheqc/6OkR+ZHa6t+uNlTuHk
         txZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769359283; x=1769964083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OTnxHq4NFRumQo/SHU741WmHOHpkH+oyQ4unpkNu0b4=;
        b=ClEu6sjHiepXGuggE8rUe03U79352yRvZjd607sIZH9sAdobAA1tAHQgJUqe44WQ4i
         77qDq8z5ckhlWwk4UkpRflPBA6T9ka3Va46F3jLmUTxHug9YUbB78KbV19SZwtOcg3L1
         K+RRwHN4wicITVLPxHL28LsJtFq713y1JzQlhe9XOeu1AF8DMpQtFMfJy9V2YbQDBA53
         pe3n91RHg9Q56HFGuuhbvbkViY6X0OsCPknfSJSqINqr11a5xf+sWS7Dwv5G0bBiyKkg
         BkIEezXNdsF9pGx0ahAjmhnQRbfzMOMqV7y8FXs8y+mkq2hwFU1BEznZNdGPg6N+R+9k
         TkhA==
X-Gm-Message-State: AOJu0YygcXDURO1yWCozv62NP+/htT8VYw4TqneyTMMzVLNcDEoijzoD
	4p9cc4fRP0n9v2w4D9lLbdiP5TzWIb4v9Fq0H6l+ieEn0VGUWdr1O851
X-Gm-Gg: AZuq6aJO4qRiuCrU57KFNNKjtFkcCXRbeoIZtue0//7UA+TmxBmfgODWkp8nkQQxYd6
	1HL6vd3XW3+KtamK5r2M4r8Mf6fEJIKt2IC3uJbNX2BNh1hn4/X2Ys+EYbNH1tNWn8o/kXMBv96
	dh+K2r1VpbSxc6OObgRI0huPiLrJPHgxeSbK7UeEYxZNX/s5KPtcW7fq+buzuIHoXJuewROLDUl
	V2MwtLmYniAoOlvZb4iF1Wz1+BgXtyqJWgJcm86EnRz8+ov/k5dZuMwhst6BZZ10TFPWOVo3GXw
	qNGIjSOxd1jMDXLdtKFo/tgnnQFkDQ72jaR9972D992n8XaJd6JKALNg5ayjtBVYAEP80Yoslr1
	mre77eHXhcJ/ak0QUKa/8XZrw109yHIzjifY226b89ndMVATsuvpO4nrcYy0/x/Uh+b8xBXVW1O
	1Mc2YgkUWMOuH8WtX29zZw+DEvrv0DFb8=
X-Received: by 2002:a17:903:37ce:b0:29f:3a57:ba7a with SMTP id d9443c01a7336-2a845224bb4mr20793505ad.19.1769359283245;
        Sun, 25 Jan 2026 08:41:23 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97667sm70633225ad.56.2026.01.25.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 08:41:22 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	johannes@sipsolutions.net,
	masahiroy@kernel.org,
	jgross@suse.com,
	nsc@kernel.org,
	kees@kernel.org,
	tglx@kernel.org,
	mingo@kernel.org,
	frederic@kernel.org,
	paulmck@kernel.org,
	peterz@infradead.org,
	mathieu.desnoyers@efficios.com,
	luto@kernel.org,
	edumazet@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH 4/9] ARM: entry: use exit_to_user_mode() instead of user_enter_callable()
Date: Mon, 26 Jan 2026 00:40:11 +0800
Message-ID: <20260125164016.331257-5-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125164016.331257-1-qq570070308@gmail.com>
References: <20260125164016.331257-1-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_084123_897275_B843FF6D 
X-CRM114-Status: GOOD (  16.06  )
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

According to user_enter_callable()'s comment, the function is obsolete.

Since exit_to_user_mode() is a inline function, add
arm_exit_to_user_mode_no_work_pending() to call exit_to_user_mode(),
thereby replacing user_enter_callable() and asm_trace_hardirqs_on().

Also move stackleak_erase_on_task_stack() to
arm_exit_to_user_mode_no_work_pending().

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 arch/arm/include/asm/entry-common.h |  8 ++++++++
 arch/arm/kernel/Makefile            |  2 +-
 arch/arm/kernel/entry-common.S      | 10 +---------
 arch/arm/kernel/entry.c             | 20 ++++++++++++++++++++
 4 files changed, 30 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/include/asm/entry-common.h
 create mode 100644 arch/arm/kernel/entry.c

diff --git a/arch/arm/include/asm/entry-common.h b/arch/arm/include/asm/entry-common.h
new file mode 100644
index 000000000000..d34c80d4b32b
--- /dev/null
+++ b/arch/arm/include/asm/entry-common.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ARCH_ARM_ENTRY_COMMON_H
+#define ARCH_ARM_ENTRY_COMMON_H
+
+asmlinkage __section(".entry.text")
+void arm_exit_to_user_mode_no_work_pending(void);
+
+#endif
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index b36cf0cfd4a7..e8a855d73055 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -17,7 +17,7 @@ CFLAGS_REMOVE_return_address.o = -pg
 
 # Object file lists.
 
-obj-y		:= elf.o entry-common.o irq.o opcodes.o \
+obj-y		:= elf.o entry-common.o entry.o irq.o opcodes.o \
 		   process.o ptrace.o reboot.o io.o \
 		   setup.o signal.o sigreturn_codes.o \
 		   stacktrace.o sys_arm.o time.o traps.o
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 0e462bbede2f..108b77e2b405 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -113,15 +113,7 @@ ENTRY(ret_to_user_from_irq)
 	movs	r1, r1, lsl #16
 	bne	slow_work_pending
 no_work_pending:
-#ifdef CONFIG_CONTEXT_TRACKING_USER
-	bl	user_enter_callable
-#endif
-
-	asm_trace_hardirqs_on save = 0
-
-#ifdef CONFIG_KSTACK_ERASE
-	bl	stackleak_erase_on_task_stack
-#endif
+	bl	arm_exit_to_user_mode_no_work_pending
 	restore_user_regs fast = 0, offset = 0
 ENDPROC(ret_to_user_from_irq)
 ENDPROC(ret_to_user)
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
new file mode 100644
index 000000000000..d32f7be9a107
--- /dev/null
+++ b/arch/arm/kernel/entry.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/linkage.h>
+#include <linux/irq-entry-common.h>
+#include <linux/kstack_erase.h>
+
+/*
+ * arm_exit_to_user_mode_no_work_pending - Fixup state when exiting to user mode
+ *
+ * The calling code satisfies (arch_irqs_disabled() && !lockdep_hardirqs_enabled()).
+ * When the function returns, the state satisfies (arch_irqs_disabled() &&
+ * lockdep_hardirqs_enabled()).
+ */
+asmlinkage __section(".entry.text")
+void arm_exit_to_user_mode_no_work_pending(void)
+{
+	exit_to_user_mode();
+#ifdef CONFIG_KSTACK_ERASE
+	stackleak_erase_on_task_stack();
+#endif
+}
-- 
2.51.0


