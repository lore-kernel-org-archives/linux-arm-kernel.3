Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6FFCD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 02:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uiw4dfVso5LxmsbsjDCVaXWxJMKOvjbT0biZwMj2I3A=; b=c3QCLvMUKfNhwQvH2PewADUvpX
	TfoP/LyxNhHcNybik1G4IIobQMfXoGuVtHXs7io4VjVkidwnOfn0qSi+CTLTF2njtg7drcj+stLNK
	5Ux4vpuJRsDluiL+tE0GC7DclNrXw8YbhNgbNXDOnoHqObnlenDG5bwYxJT3h6l3yw45LLY6Mm3Oq
	xEG+BfVqbehLZ8y//ob0DsVTZI8jyGd9M0LVKsyemzT4LYkrhX+SygUCgbSxIOoMgDvo778HutDko
	3qOSXEM0swbP3sZSxHVCqPBQwBhB0a/wSTuT0JE+3dNQ0W8bE67nCI40dzfpt6W3U7Sm5jJ5RjaYU
	mSjMZ/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLuL8-0000000A2iQ-35Aj;
	Sun, 10 May 2026 02:56:22 +0000
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLuL5-0000000A2hr-2MF0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 02:56:21 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso3835920eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 19:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778381778; x=1778986578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uiw4dfVso5LxmsbsjDCVaXWxJMKOvjbT0biZwMj2I3A=;
        b=Jt35pGu0/uW96pWytaR5Gc2IAf8ZBeKUos1OoI7X16IQ4WNUtgcUOiwqMSiXWuf6YT
         xnzdXb/VnNQY5bWblxlp5062STwpjQpZRseR5mFqAX2WwaGY7ntkSH8d+7rE+0foo2K6
         Al7Qg4fmXVmdKZI/mm8uqXmpzsEqxoGNkEbk6/NyW2KAueYYj0JrfF8/MWgS2uxqAAPP
         LlPbtkno29of2Vmxm/rh2E0CQIFS1UDaTXWykrWzWE0R0cO7tOCexzDsIS73XPpFfxk0
         TxsxsaBv6bknn3pYIUA9x4HLskxhkwsiHQZwgIHo0pP9LUsia0EjWwlzb/3MzL+NJrf9
         rmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778381778; x=1778986578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uiw4dfVso5LxmsbsjDCVaXWxJMKOvjbT0biZwMj2I3A=;
        b=dNX9lF33Q3S5qYvc8ljlD8uNirNiyDB6u/uaYrexwEIRQJpPzPZAb2KLno9si6CImS
         wbrD/dRsrzWtJGaKEUxA1VaDDXsnurVNGf10iY7+TxMekuLJPzwpTF4NqUB/LhRXlxeQ
         AbW1G8ifLPf+QF1ko1Bkk0MuiAW8z/j27ii5+QfeIVUt9+N0PDLzCePlUDYzyPGAL0PF
         aC/YNn/xmun/7EmLy8jEDRa64H7+uYl4nFMGJ2wSlxX8XhLDaMZ+Tu8AqE0r5dFx2Zua
         aGgMF8cL728bimooSIV35p1RNdp/Mch4zgCS4G1QrM9zSSBxZrvsdQ7/vzzG5qrdoTUc
         jLPw==
X-Gm-Message-State: AOJu0YzlZfY36VetxrXUfSFULGEqj0SV096NQVK4gZcBDVXifmeJKhPs
	+OdQL4ZfAyZ5T+SJ6KObTDp1M9XOjFWW4xC619qGw4jJJ43+F8WoOMLHBYgn/Z94oMM=
X-Gm-Gg: Acq92OGI5BBHKCxoU2EYlM8dvTKL0A2wS6OtWKSNMzTkCIyaQLyZbR3lz/KHCgRh6JP
	8w/E37hWwMXDqn3zEtuQx09ZnxIVTlAD6w4OFpdBBADKNXAuT4mVCFVioQFciVmxw2zYP2MmGyn
	nx93/SK1KYsSHMiKg2B0EKpfznHj62dLBMmsKsi1lXxUv8KSiDRHlluJGlxZSGyBKdh4My6uBsj
	yv+aTnIayCE8q3Y11zgfEfnanqAWkSaOx26i3mpTj2zsPftnhAybqlMAn7CoeCif7Sr2ownYB5K
	ONe33GgB140gibTodaNX5WM+9lzlo/cX+eH53YiI7cYEveRY48MTgaj8F1vuTEDNxxhxL2vMBHG
	R2fP+ClLcJAuyH4UIwnF6XaaJi5dnA7PMBsiHU4CUkT4mCUwsixAzZhDJTj7YTwiL5WJ9SFq5RQ
	mzVmWk/VRopyf6TaH9/rENZ/l15hB/VrNGZ6nzfs2H6AxEQZwBAdmCXD0FxNQstJYo2nnlOKnuf
	ouzrx15pgJ8HWBmFBVe3Z9mQc//rE/OZ8sEJji1+OSp2/O4gQniPCFq3xpw+tN+SHg60XmI2ic1
	ycGL+wY6CdVu6BE2yg==
X-Received: by 2002:a05:7301:4b15:b0:2dd:5641:ef2 with SMTP id 5a478bee46e88-2fb4bdffa2fmr1772510eec.25.1778381778302;
        Sat, 09 May 2026 19:56:18 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm9796267eec.10.2026.05.09.19.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 19:56:17 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH] ARM: riscpc: use iomd.h everywhere and remove redundant ioc.h header
Date: Sat,  9 May 2026 19:56:01 -0700
Message-ID: <20260510025610.216819-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_195619_636544_AC511A21 
X-CRM114-Status: GOOD (  24.55  )
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

The <asm/hardware/ioc.h> header contains a subset of the definitions of
the <asm/hardware/iomd.h> header, just with different names. This is
because the IOC chip (used in 26-bit Acorn computers) contains a subset
of the functionality of the later IOMD chip used in the Risc PC. Linux
formerly supported 26-bit Acorn computers, but that support was removed
in commit 99eb8a550dbc ("Remove the arm26 port") because it had
bitrotted to the extent that it did not even compile.

Adjust all references to ioc.h to use iomd.h and its constants and
remove the redundant ioc.h header. Also correct formatting on
affected lines and remove the now-unused IOC_BASE constant.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 MAINTAINERS                               |  1 -
 arch/arm/include/asm/hardware/ioc.h       | 69 -----------------------
 arch/arm/include/asm/hardware/iomd.h      |  2 +-
 arch/arm/mach-rpc/fiq.S                   |  4 +-
 arch/arm/mach-rpc/include/mach/hardware.h |  1 -
 arch/arm/mach-rpc/irq.c                   |  6 +-
 arch/arm/mach-rpc/time.c                  | 18 +++---
 drivers/i2c/busses/i2c-acorn.c            | 18 +++---
 8 files changed, 24 insertions(+), 95 deletions(-)
 delete mode 100644 arch/arm/include/asm/hardware/ioc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b865ad67fda3..211cc683e25b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3398,7 +3398,6 @@ M:	Russell King <linux@armlinux.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://www.armlinux.org.uk/
-F:	arch/arm/include/asm/hardware/ioc.h
 F:	arch/arm/include/asm/hardware/iomd.h
 F:	arch/arm/mach-rpc/
 F:	drivers/net/ethernet/8390/etherh.c
diff --git a/arch/arm/include/asm/hardware/ioc.h b/arch/arm/include/asm/hardware/ioc.h
deleted file mode 100644
index 6edd27fcd048..000000000000
--- a/arch/arm/include/asm/hardware/ioc.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *  arch/arm/include/asm/hardware/ioc.h
- *
- *  Copyright (C) Russell King
- *
- *  Use these macros to read/write the IOC.  All it does is perform the actual
- *  read/write.
- */
-#ifndef __ASMARM_HARDWARE_IOC_H
-#define __ASMARM_HARDWARE_IOC_H
-
-#ifndef __ASSEMBLY__
-
-/*
- * We use __raw_base variants here so that we give the compiler the
- * chance to keep IOC_BASE in a register.
- */
-#define ioc_readb(off)		__raw_readb(IOC_BASE + (off))
-#define ioc_writeb(val,off)	__raw_writeb(val, IOC_BASE + (off))
-
-#endif
-
-#define IOC_CONTROL	(0x00)
-#define IOC_KARTTX	(0x04)
-#define IOC_KARTRX	(0x04)
-
-#define IOC_IRQSTATA	(0x10)
-#define IOC_IRQREQA	(0x14)
-#define IOC_IRQCLRA	(0x14)
-#define IOC_IRQMASKA	(0x18)
-
-#define IOC_IRQSTATB	(0x20)
-#define IOC_IRQREQB	(0x24)
-#define IOC_IRQMASKB	(0x28)
-
-#define IOC_FIQSTAT	(0x30)
-#define IOC_FIQREQ	(0x34)
-#define IOC_FIQMASK	(0x38)
-
-#define IOC_T0CNTL	(0x40)
-#define IOC_T0LTCHL	(0x40)
-#define IOC_T0CNTH	(0x44)
-#define IOC_T0LTCHH	(0x44)
-#define IOC_T0GO	(0x48)
-#define IOC_T0LATCH	(0x4c)
-
-#define IOC_T1CNTL	(0x50)
-#define IOC_T1LTCHL	(0x50)
-#define IOC_T1CNTH	(0x54)
-#define IOC_T1LTCHH	(0x54)
-#define IOC_T1GO	(0x58)
-#define IOC_T1LATCH	(0x5c)
-
-#define IOC_T2CNTL	(0x60)
-#define IOC_T2LTCHL	(0x60)
-#define IOC_T2CNTH	(0x64)
-#define IOC_T2LTCHH	(0x64)
-#define IOC_T2GO	(0x68)
-#define IOC_T2LATCH	(0x6c)
-
-#define IOC_T3CNTL	(0x70)
-#define IOC_T3LTCHL	(0x70)
-#define IOC_T3CNTH	(0x74)
-#define IOC_T3LTCHH	(0x74)
-#define IOC_T3GO	(0x78)
-#define IOC_T3LATCH	(0x7c)
-
-#endif
diff --git a/arch/arm/include/asm/hardware/iomd.h b/arch/arm/include/asm/hardware/iomd.h
index 53006ba5350f..e3f130345ebc 100644
--- a/arch/arm/include/asm/hardware/iomd.h
+++ b/arch/arm/include/asm/hardware/iomd.h
@@ -15,7 +15,7 @@
 
 /*
  * We use __raw_base variants here so that we give the compiler the
- * chance to keep IOC_BASE in a register.
+ * chance to keep IOMD_BASE in a register.
  */
 #define iomd_readb(off)		__raw_readb(IOMD_BASE + (off))
 #define iomd_readl(off)		__raw_readl(IOMD_BASE + (off))
diff --git a/arch/arm/mach-rpc/fiq.S b/arch/arm/mach-rpc/fiq.S
index 087bdf4bc093..a600761c3dfd 100644
--- a/arch/arm/mach-rpc/fiq.S
+++ b/arch/arm/mach-rpc/fiq.S
@@ -3,8 +3,8 @@
 #include <asm/assembler.h>
 #include <mach/hardware.h>
 
-	.equ	ioc_base_high, IOC_BASE & 0xff000000
-	.equ	ioc_base_low, IOC_BASE & 0x00ff0000
+	.equ	ioc_base_high, IOMD_BASE & 0xff000000
+	.equ	ioc_base_low, IOMD_BASE & 0x00ff0000
 
 	.text
 	.global	rpc_default_fiq_end
diff --git a/arch/arm/mach-rpc/include/mach/hardware.h b/arch/arm/mach-rpc/include/mach/hardware.h
index 6f197706f979..22d62a198559 100644
--- a/arch/arm/mach-rpc/include/mach/hardware.h
+++ b/arch/arm/mach-rpc/include/mach/hardware.h
@@ -48,7 +48,6 @@
 #define ECARD_IOC4_BASE		(IO_BASE + 0x00270000)
 #define ECARD_IOC_BASE		(IO_BASE + 0x00240000)
 #define IOMD_BASE		(IO_BASE + 0x00200000)
-#define IOC_BASE		(IO_BASE + 0x00200000)
 #define ECARD_MEMC8_BASE	(IO_BASE + 0x0002b000)
 #define FLOPPYDMA_BASE		(IO_BASE + 0x0002a000)
 #define PCIO_BASE		(IO_BASE + 0x00010000)
diff --git a/arch/arm/mach-rpc/irq.c b/arch/arm/mach-rpc/irq.c
index dc29384b6ef8..e924c9b813ab 100644
--- a/arch/arm/mach-rpc/irq.c
+++ b/arch/arm/mach-rpc/irq.c
@@ -77,19 +77,19 @@ static int iomd_get_irq_nr(void)
 	u8 reg;
 
 	/* get highest priority first */
-	reg = readb(IOC_BASE + IOMD_IRQREQB);
+	reg = readb(IOMD_BASE + IOMD_IRQREQB);
 	irq = irq_prio_h[reg];
 	if (irq)
 		return irq;
 
 	/* get DMA  */
-	reg = readb(IOC_BASE + IOMD_DMAREQ);
+	reg = readb(IOMD_BASE + IOMD_DMAREQ);
 	irq = irq_prio_d[reg];
 	if (irq)
 		return irq;
 
 	/* get low priority */
-	reg = readb(IOC_BASE + IOMD_IRQREQA);
+	reg = readb(IOMD_BASE + IOMD_IRQREQA);
 	irq = irq_prio_l[reg];
 	if (irq)
 		return irq;
diff --git a/arch/arm/mach-rpc/time.c b/arch/arm/mach-rpc/time.c
index 9f8edcfe9357..ad93c4dfafcd 100644
--- a/arch/arm/mach-rpc/time.c
+++ b/arch/arm/mach-rpc/time.c
@@ -17,7 +17,7 @@
 #include <linux/io.h>
 
 #include <mach/hardware.h>
-#include <asm/hardware/ioc.h>
+#include <asm/hardware/iomd.h>
 
 #include <asm/mach/time.h>
 
@@ -33,15 +33,15 @@ static u64 ioc_timer_read(struct clocksource *cs)
 	u32 ticks;
 
 	local_irq_save(flags);
-	ioc_writeb (0, IOC_T0LATCH);
+	iomd_writeb(0, IOMD_T0LATCH);
 	barrier ();
-	count1 = ioc_readb(IOC_T0CNTL) | (ioc_readb(IOC_T0CNTH) << 8);
+	count1 = iomd_readb(IOMD_T0CNTL) | (iomd_readb(IOMD_T0CNTH) << 8);
 	barrier ();
-	status = ioc_readb(IOC_IRQREQA);
+	status = iomd_readb(IOMD_IRQREQA);
 	barrier ();
-	ioc_writeb (0, IOC_T0LATCH);
+	iomd_writeb(0, IOMD_T0LATCH);
 	barrier ();
-	count2 = ioc_readb(IOC_T0CNTL) | (ioc_readb(IOC_T0CNTH) << 8);
+	count2 = iomd_readb(IOMD_T0CNTL) | (iomd_readb(IOMD_T0CNTH) << 8);
 	ticks = ioc_time + RPC_LATCH - count2;
 	local_irq_restore(flags);
 
@@ -72,9 +72,9 @@ static struct clocksource ioctime_clocksource = {
 
 void __init ioctime_init(void)
 {
-	ioc_writeb(RPC_LATCH & 255, IOC_T0LTCHL);
-	ioc_writeb(RPC_LATCH >> 8, IOC_T0LTCHH);
-	ioc_writeb(0, IOC_T0GO);
+	iomd_writeb(RPC_LATCH & 255, IOMD_T0LTCHL);
+	iomd_writeb(RPC_LATCH >> 8, IOMD_T0LTCHH);
+	iomd_writeb(0, IOMD_T0GO);
 }
 
 static irqreturn_t
diff --git a/drivers/i2c/busses/i2c-acorn.c b/drivers/i2c/busses/i2c-acorn.c
index 34bbbb8c52f6..99b6b1c3fd9e 100644
--- a/drivers/i2c/busses/i2c-acorn.c
+++ b/drivers/i2c/busses/i2c-acorn.c
@@ -13,23 +13,23 @@
 #include <linux/io.h>
 
 #include <mach/hardware.h>
-#include <asm/hardware/ioc.h>
+#include <asm/hardware/iomd.h>
 
 #define FORCE_ONES	0xdc
 #define SCL		0x02
 #define SDA		0x01
 
 /*
- * We must preserve all non-i2c output bits in IOC_CONTROL.
+ * We must preserve all non-i2c output bits in IOMD_CONTROL.
  * Note also that we need to preserve the value of SCL and
  * SDA outputs as well (which may be different from the
- * values read back from IOC_CONTROL).
+ * values read back from IOMD_CONTROL).
  */
 static u_int force_ones;
 
 static void ioc_setscl(void *data, int state)
 {
-	u_int ioc_control = ioc_readb(IOC_CONTROL) & ~(SCL | SDA);
+	u_int iomd_control = iomd_readb(IOMD_CONTROL) & ~(SCL | SDA);
 	u_int ones = force_ones;
 
 	if (state)
@@ -39,12 +39,12 @@ static void ioc_setscl(void *data, int state)
 
 	force_ones = ones;
 
- 	ioc_writeb(ioc_control | ones, IOC_CONTROL);
+	iomd_writeb(iomd_control | ones, IOMD_CONTROL);
 }
 
 static void ioc_setsda(void *data, int state)
 {
-	u_int ioc_control = ioc_readb(IOC_CONTROL) & ~(SCL | SDA);
+	u_int iomd_control = iomd_readb(IOMD_CONTROL) & ~(SCL | SDA);
 	u_int ones = force_ones;
 
 	if (state)
@@ -54,17 +54,17 @@ static void ioc_setsda(void *data, int state)
 
 	force_ones = ones;
 
- 	ioc_writeb(ioc_control | ones, IOC_CONTROL);
+	iomd_writeb(iomd_control | ones, IOMD_CONTROL);
 }
 
 static int ioc_getscl(void *data)
 {
-	return (ioc_readb(IOC_CONTROL) & SCL) != 0;
+	return (iomd_readb(IOMD_CONTROL) & SCL) != 0;
 }
 
 static int ioc_getsda(void *data)
 {
-	return (ioc_readb(IOC_CONTROL) & SDA) != 0;
+	return (iomd_readb(IOMD_CONTROL) & SDA) != 0;
 }
 
 static struct i2c_algo_bit_data ioc_data = {
-- 
2.43.0


