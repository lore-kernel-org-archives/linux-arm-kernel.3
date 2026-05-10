Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407FACD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 03:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k6rTrBmT6FLZY33HULT543YLCfwvj9/dpCgMERdcga8=; b=3Yqdx3oLM1QJ9FiYDmh/prFN5X
	4STYSvzBL8eCJcKGk5DGm94mCkKG3l391bJHAF7ax5NsoNAk5UOSFJgXujTxdxN6k9s0adgvOs+8c
	mOtsa7hJlVLh4NwrK+MzxHoEUrDF99LhCF96AyS1RH6Xl9BpVPYTqkVX3hUovnaJLXWAs4j7sfKwg
	n+M8axBG4uBa3i3KI4FpEG3wDjsgVVGf1UocJMm/d2Fxv3/OubTDgbBp6UNWlfx0o5ah/LZkhg9FX
	YMJcq0xHyH335CvXbvZsBhQN3fhk88mZstN6MQFMFIZsYphFK/EFMu3/inwX2U8u8pkV5Xh1iAtjs
	tIuNT5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLv8h-0000000A6eB-32hS;
	Sun, 10 May 2026 03:47:36 +0000
Received: from mail-dy1-x1341.google.com ([2607:f8b0:4864:20::1341])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLv8f-0000000A6dc-0fVg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 03:47:34 +0000
Received: by mail-dy1-x1341.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so8340417eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 20:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778384852; x=1778989652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6rTrBmT6FLZY33HULT543YLCfwvj9/dpCgMERdcga8=;
        b=IJVVwRoH6mx2a50feiUAlif0/pe7GIZUejPozwEHUiBJLuJ2Eo6nHNSglOk9RobRjd
         8fl6B3F/fl0wQBzbokVMYHpBALPfF1URTFcxgGOelWL3gRe0zxu/31PiOYtSw5xGzgf9
         q2Uwaw6U/NzHMUARDSymPGmRX1nqo+FXQ+Y6EiNlnp96D4bED39xYQiz19Y3+3DGxvuK
         U1IzXR6Aewmn+gKSaEnoMy3on40DP+KW/fA9avUaWvd3dvUz1A+FWMQJqGIK5pJuaOtX
         xF6DElzyO1qU+f3YAcmBEXZqjuEtF6UpNu/vqwBZoLb+0PEs+z+MXRGLOMzhM0jbNo7o
         HBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778384852; x=1778989652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6rTrBmT6FLZY33HULT543YLCfwvj9/dpCgMERdcga8=;
        b=LmBJt+gV922HQYswUUgy1munkKeLsD6c7nXPFCqS4Vp6JIsqhXosoX4ab6BSxIkdI/
         2Hwo4/vV1I1Fnbbd/lWpGtFn6gvk7kyVv4hDZqtjmiH+55yaEtwLJWlomOPBwIitJ4xE
         oVCfDbAjO71v6WK2yvGb97Chc6KN1zD1gI5SVxNuxC89/elcaTJ8kawBsbuc2tb2jyY4
         dIfP3Ns0YP+Lt/T4r6e7MuRK5NlaqSvQWBH3jbwEaswOXl3j71aeupRWwYsDAVhy8VWl
         GHcp/0nVdKCs+I1sUBdpPa54JWP+3Wmj4rzDGMU2XfzyrxQIOBUDwK9dltIHB/gJkGbH
         JtLg==
X-Gm-Message-State: AOJu0YylvZF2lgFlyaI/7RMcCWS6DPS4DQOX8N/ZK01NCH5Jtf+OHatT
	SASxB9PdVfJwbJci6HnXSRhIkAJF1sA0cgTWnJyqdolbdOxcvg8nwi/Sjvqd977iV0c=
X-Gm-Gg: Acq92OHqvfgvkM3QmCxeYN3y4dfvMZeCqteElmLmx0YTK84zAazNlQz1lghFCNTfG1Z
	WeiRrhE2JGs074Zl03Js4RvB2i9rewq4zf/D4iyewHvOV9W7ei0930jIvE3b0Jy1qPZfpIqB84z
	A/Vpo6GgwASIqGnI/zT0OXGZZWFVbmqXMKG2SmzJ2LOuc0sP4JK3MEHPlqYDK3R0lbE06s6qDKL
	foRsD6RblUbCLVLcKu8EZYZ6VWxHiD/mUtbg0XQ7NhM2EbjgRpLw5W2zgwr3iRAyNVfZxDtPAIF
	rA6UmWvhTFw0eTOOD36brvFzfKj5v7MWeLgAHLUA3B9ToHp0ClaZj5vV3Sl7YDKq01hvzXUZAb4
	grGxPO3dgGoWdG7lK86sDeSt5WXDgdJSkWp53DsN9cBvyAkWRJUPEVl6ZJgMT86UF0alo72Wddm
	k7zMKdvJIGCd5Z6CNaUHZXhEbY6FkjTVJghjw9e/NGR7F/bX8jc6IsrrgsOD55vAPvSHDVwtSMF
	5prm0sowLUIlPaCAJTcP9n2AS5piUMOODhvuLiItxkMRa1o8cTQuKBJf03ZdJLuOvltvzfDBmWq
	fjnI9LRwuqoz6+/IOxsMYz4/Z7q5
X-Received: by 2002:a05:7300:818d:b0:2e5:8ec2:82c9 with SMTP id 5a478bee46e88-2f54b57e91amr9832824eec.26.1778384851712;
        Sat, 09 May 2026 20:47:31 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8884750ffsm8368768eec.19.2026.05.09.20.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 20:47:31 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] ARM: riscpc: convert to sparse IRQs
Date: Sat,  9 May 2026 20:46:38 -0700
Message-ID: <20260510034652.349166-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_204733_257406_246F91CE 
X-CRM114-Status: GOOD (  17.78  )
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

To improve future maintainability, change the interrupt handling for
mach-rpc to use sparse IRQs.

Since the number of possible interrupts is already fixed and relatively
small, just make it use all legacy interrupts preallocated using the
.nr_irqs field in the machine descriptor, rather than actually
allocating domains on the fly.

Several files had to be adjusted to include <mach/irqs.h>
explicitly because it is no longer implicitly included with sparse
IRQs.

Description adapted from commit c78a41fc04f0 ("ARM: s3c24xx: convert
to sparse-irq").

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
This commit depends on my previous submission "ARM: <asm/floppy.h>: fix
build with sparse IRQs".

 arch/arm/Kconfig                      | 2 +-
 arch/arm/mach-rpc/dma.c               | 1 +
 arch/arm/mach-rpc/ecard.c             | 2 +-
 arch/arm/mach-rpc/include/mach/irqs.h | 2 +-
 arch/arm/mach-rpc/irq.c               | 3 ++-
 arch/arm/mach-rpc/riscpc.c            | 2 ++
 arch/arm/mach-rpc/time.c              | 1 +
 drivers/input/mouse/rpcmouse.c        | 2 +-
 drivers/input/serio/rpckbd.c          | 1 +
 9 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 71fc5dd4123f..09b2767fee0f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -153,7 +153,7 @@ config ARM
 	select PCI_SYSCALL if PCI
 	select PERF_USE_VMALLOC
 	select RTC_LIB
-	select SPARSE_IRQ if !(ARCH_FOOTBRIDGE || ARCH_RPC)
+	select SPARSE_IRQ if !ARCH_FOOTBRIDGE
 	select SYS_SUPPORTS_APM_EMULATION
 	select THREAD_INFO_IN_TASK
 	select TIMER_OF if OF
diff --git a/arch/arm/mach-rpc/dma.c b/arch/arm/mach-rpc/dma.c
index 717a81475670..238aa59612a8 100644
--- a/arch/arm/mach-rpc/dma.c
+++ b/arch/arm/mach-rpc/dma.c
@@ -17,6 +17,7 @@
 #include <asm/fiq.h>
 #include <asm/irq.h>
 #include <mach/hardware.h>
+#include <mach/irqs.h>
 #include <linux/uaccess.h>
 
 #include <asm/mach/dma.h>
diff --git a/arch/arm/mach-rpc/ecard.c b/arch/arm/mach-rpc/ecard.c
index 972465840548..27af35bd6a79 100644
--- a/arch/arm/mach-rpc/ecard.c
+++ b/arch/arm/mach-rpc/ecard.c
@@ -46,9 +46,9 @@
 #include <asm/dma.h>
 #include <asm/ecard.h>
 #include <mach/hardware.h>
+#include <mach/irqs.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
-#include <asm/mach/irq.h>
 #include <asm/tlbflush.h>
 
 #include "ecard.h"
diff --git a/arch/arm/mach-rpc/include/mach/irqs.h b/arch/arm/mach-rpc/include/mach/irqs.h
index 0c3428fd9729..738a9457c473 100644
--- a/arch/arm/mach-rpc/include/mach/irqs.h
+++ b/arch/arm/mach-rpc/include/mach/irqs.h
@@ -39,4 +39,4 @@
  */
 #define FIQ_START		64
 
-#define NR_IRQS			128
+#define RPC_NR_IRQS		128
diff --git a/arch/arm/mach-rpc/irq.c b/arch/arm/mach-rpc/irq.c
index 649d81874c86..5e3414fc3657 100644
--- a/arch/arm/mach-rpc/irq.c
+++ b/arch/arm/mach-rpc/irq.c
@@ -5,6 +5,7 @@
 
 #include <asm/mach/irq.h>
 #include <mach/iomd.h>
+#include <mach/irqs.h>
 #include <asm/irq.h>
 #include <asm/fiq.h>
 
@@ -177,7 +178,7 @@ void __init rpc_init_irq(void)
 
 	set_handle_irq(iomd_handle_irq);
 
-	for (irq = 0; irq < NR_IRQS; irq++) {
+	for (irq = 0; irq < RPC_NR_IRQS; irq++) {
 		clr = IRQ_NOREQUEST;
 		set = 0;
 
diff --git a/arch/arm/mach-rpc/riscpc.c b/arch/arm/mach-rpc/riscpc.c
index d068f5e4873d..bdad13226c6d 100644
--- a/arch/arm/mach-rpc/riscpc.c
+++ b/arch/arm/mach-rpc/riscpc.c
@@ -23,6 +23,7 @@
 #include <asm/mach-types.h>
 #include <mach/hardware.h>
 #include <mach/iomd.h>
+#include <mach/irqs.h>
 #include <asm/page.h>
 #include <asm/domain.h>
 #include <asm/setup.h>
@@ -219,6 +220,7 @@ MACHINE_START(RISCPC, "Acorn-RiscPC")
 	.reserve_lp0	= 1,
 	.reserve_lp1	= 1,
 	.map_io		= rpc_map_io,
+	.nr_irqs	= RPC_NR_IRQS,
 	.init_irq	= rpc_init_irq,
 	.init_time	= ioc_timer_init,
 	.restart	= rpc_restart,
diff --git a/arch/arm/mach-rpc/time.c b/arch/arm/mach-rpc/time.c
index 566113f9774f..02f0fd58c7da 100644
--- a/arch/arm/mach-rpc/time.c
+++ b/arch/arm/mach-rpc/time.c
@@ -18,6 +18,7 @@
 
 #include <mach/hardware.h>
 #include <mach/iomd.h>
+#include <mach/irqs.h>
 
 #include <asm/mach/time.h>
 
diff --git a/drivers/input/mouse/rpcmouse.c b/drivers/input/mouse/rpcmouse.c
index 475c3ca22fd4..cead12069319 100644
--- a/drivers/input/mouse/rpcmouse.c
+++ b/drivers/input/mouse/rpcmouse.c
@@ -22,8 +22,8 @@
 #include <linux/io.h>
 
 #include <mach/hardware.h>
-#include <asm/irq.h>
 #include <mach/iomd.h>
+#include <mach/irqs.h>
 
 MODULE_AUTHOR("Vojtech Pavlik, Russell King");
 MODULE_DESCRIPTION("Acorn RiscPC mouse driver");
diff --git a/drivers/input/serio/rpckbd.c b/drivers/input/serio/rpckbd.c
index e452ad07e2fa..7bcaed28c7a4 100644
--- a/drivers/input/serio/rpckbd.c
+++ b/drivers/input/serio/rpckbd.c
@@ -18,6 +18,7 @@
 
 #include <mach/hardware.h>
 #include <mach/iomd.h>
+#include <mach/irqs.h>
 
 MODULE_AUTHOR("Vojtech Pavlik, Russell King");
 MODULE_DESCRIPTION("Acorn RiscPC PS/2 keyboard controller driver");
-- 
2.43.0


