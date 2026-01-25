Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC59E63CAD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZxocYBmRzY7JkVMi8gSJcmXEwv7uEau4/9ve17+UI4=; b=gE7C2d4D9xKbghrx1Lhavtuml0
	kmRmXbpoPY/I7G0UkbIgyS1Py9L6XFmJs2Mi2hNc1JjUEqEJGldqsGw0hYggA6z3lEw2YLyJ2zJnl
	f9GfQ5WyGn6tX6u0g4A+Z6obKXS7+gmSyfWfCyg8x2ho2fevpbJJiA9YPZML1SAWAhP81EkxsQN8Z
	wpMup0R53vXaLsOClJ1ziJnPs8LDdGFTdy8qDpO8gYZZmxpcyFj+JYtktrSHAIvXPzqmGzgQKpcWF
	DYDLrPZ3a/UIW5fspysFD+u3bCnm7sO8/l3atCdvrwsPUF/U+pTfvca1a1qEnfRbFTrVMzGq52lwo
	mkajYnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3BU-0000000BKPq-2Koy;
	Sun, 25 Jan 2026 16:41:56 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3BR-0000000BKO4-2krM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:41:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29f102b013fso34591525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 08:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769359313; x=1769964113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZxocYBmRzY7JkVMi8gSJcmXEwv7uEau4/9ve17+UI4=;
        b=XP6ihMpPYVIi+MDlLsOYpI46ms1IY4Dtrxg1C9hQiD6L2rNlwTBQs8K5+HLE7lVntV
         lMhjLoUUJ12vhFDnfFs2706dH2WUvrpRylfGlvz3/ZLD2OEIqqj5y3oE35tyS6RL/ePK
         eTgKDX06KLZXyq20R0a3PFBgctXRP4X8JIWKmVnDREp/Cy0enC7jkKgXaLkBfx6I655l
         85DQMakXzAHkwYIvT7yndtRaObRKYOMLNvuWSWedcR0qsnC0MANXrI/ut/OIDeLQfByH
         FJh/osxuMKWx0MituDtE8UVn5E6PNY4a5DAPrDEKs0/zDIoVAQ0D5bO98Q2wWwfXIPBs
         LVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769359313; x=1769964113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ZxocYBmRzY7JkVMi8gSJcmXEwv7uEau4/9ve17+UI4=;
        b=mQ6zAERHk78cbXt6TVOgTmONU8WFQLk+1ScKSq3RGQ0cPuvHSNw+jUw4PodMvGgKWi
         Ah5DQ2kZ6Jgl+HknuzAE21wP7H5dqrCU0OX3f4/NFWcoH+XjUiZFU8ttxoX1BV7SzTze
         9LSIunb5DsrHUUR6HTBxl9mx/3S/Mt9eD3lTDce3H+qfwRnn1wq2PgsliIAR/FiAxunb
         fFSXOfJVYrQTv+vgAmVRthY7kXlkH6sZEfLq5uPiipUkKYz+G/IpT0LMW6gT3bcX/laY
         YezpmYa5rdwIy5eM0oiwB7jaTdEm6WLguaOxTJaCA5wDyXwnL4BuDBZX52Cqji5gh3Q5
         iEGA==
X-Gm-Message-State: AOJu0YxfaDcVTWr+ux6nCHQJXuwMX7CyypgKru9uX/yDmIQr6T9EDQbN
	DJcxP0UZWK0wcOi8AUJ/W3Ld7ELS45NGugVT1Qwbp2yE77Q5ulAQemmy
X-Gm-Gg: AZuq6aLZZDpr5EybuPXM8b/dGYp9uibOWfdKvGyoHI9hw+fODZS14BiSzvu0Z7bipUe
	V+z/XnCnh8/CE8R97p1/ZTwfeVx/x3WBm7tE48W7sI+JQjSm7uYILNw3rkB/pVqj9jvU/u4DR2o
	wjhIxDebyaNwr77bPBSdI+F00y8jyIxWzFsDvCj+P9evXQo+wchUQ6QuOUkbP31I1HmLIpR/y0j
	gL15w7Wl3GWSP2wHNXoqMR7EGuH8zagV53oYRb/GAFg1L8pawBpwcaOEsezwblv4uR68e3jtUTc
	9mqCT4hlI2j1L3zzUp8qzT/pze8StoiX7Pdz3ggnu1Iu0KLr/HEjzZndB9/U3gutxe7HLCyuONr
	SWrqqfYCeKa1EGOiiqxj1vDrhgoy5YTJQC336zvV2LINO/1to7LDxO8xprfBrTOiGHH8/f+74/Y
	wIol9ZcKQi2t9ijhJWYcF0HrOFLBiziU8=
X-Received: by 2002:a17:902:e841:b0:2a7:8088:371a with SMTP id d9443c01a7336-2a845312f80mr19771165ad.35.1769359312856;
        Sun, 25 Jan 2026 08:41:52 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97667sm70633225ad.56.2026.01.25.08.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 08:41:52 -0800 (PST)
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
Subject: [PATCH 8/9] ARM: entry: use enter_from_user_mode() instead of user_exit_callable()
Date: Mon, 26 Jan 2026 00:40:15 +0800
Message-ID: <20260125164016.331257-9-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125164016.331257-1-qq570070308@gmail.com>
References: <20260125164016.331257-1-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_084153_707121_7753D643 
X-CRM114-Status: GOOD (  12.69  )
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

According to user_exit_callable()'s comment, the function is obsolete.
Use enter_from_user_mode() instead of user_exit_callable() to pair with
the calling of exit_to_user_mode() at returning to user.

Since enter_from_user_mode() is a inline function, add
arm_enter_from_user_mode() to call enter_from_user_mode(),
thereby replacing user_exit_callable() and trace_hardirqs_off().

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 arch/arm/include/asm/entry-common.h |  3 +++
 arch/arm/kernel/entry-armv.S        |  7 +------
 arch/arm/kernel/entry-common.S      |  6 ++----
 arch/arm/kernel/entry.c             | 14 ++++++++++++++
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/entry-common.h b/arch/arm/include/asm/entry-common.h
index d34c80d4b32b..0158a671d4fc 100644
--- a/arch/arm/include/asm/entry-common.h
+++ b/arch/arm/include/asm/entry-common.h
@@ -2,6 +2,9 @@
 #ifndef ARCH_ARM_ENTRY_COMMON_H
 #define ARCH_ARM_ENTRY_COMMON_H
 
+asmlinkage __section(".entry.text")
+void arm_enter_from_user_mode(void);
+
 asmlinkage __section(".entry.text")
 void arm_exit_to_user_mode_no_work_pending(void);
 
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 7f8781666a44..083782ef8180 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -403,12 +403,7 @@ ENDPROC(__fiq_abt)
 	zero_fp
 
 	.if	\trace
-#ifdef CONFIG_TRACE_IRQFLAGS
-	bl	trace_hardirqs_off
-#endif
-#ifdef CONFIG_CONTEXT_TRACKING_USER
-	bl	user_exit_callable
-#endif
+	bl	arm_enter_from_user_mode
 	.endif
 	.endm
 
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 108b77e2b405..0556d01ef55b 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -181,10 +181,8 @@ ENTRY(vector_swi)
 	zero_fp
 	alignment_trap r10, ip, cr_alignment
 	asm_trace_hardirqs_on save=0
-	enable_irq_notrace
-#ifdef CONFIG_CONTEXT_TRACKING_USER
-	bl	user_exit_callable
-#endif
+	bl	arm_enter_from_user_mode
+	enable_irq save=0
 
 	/*
 	 * Get the system call number.
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 85df47b5c359..0438e1b7a704 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -5,6 +5,20 @@
 #include <linux/irq-entry-common.h>
 #include <linux/kstack_erase.h>
 
+/*
+ * arm_enter_from_user_mode - Establish state when coming from user mode
+ *
+ * The calling code satisfies (arch_irqs_disabled() && lockdep_hardirqs_enabled()).
+ * When the function returns, the state satisfies (arch_irqs_disabled() &&
+ * !lockdep_hardirqs_enabled()).
+ */
+asmlinkage __section(".entry.text")
+void arm_enter_from_user_mode(void)
+{
+	/* arm32 not uses pt_regs now */
+	enter_from_user_mode(NULL);
+}
+
 /*
  * arm_exit_to_user_mode_no_work_pending - Fixup state when exiting to user mode
  *
-- 
2.51.0


