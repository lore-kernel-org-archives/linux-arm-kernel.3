Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652E7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+Ey+YDRVZYAvBvERTk45tShixa+dIt05SCjUM3q1Qk=; b=eyLvpITOdg8or/9ksXsJNEZN+0
	iv+zSlT/veIe9miK4Y285MXmzbdhuxxhNvTK0btUBytNUgpO1bw/0Er3WWdDTHS/EjKgRoyXX5244
	TVP2igUU3d+PTLwZEa8B1Iz+ZEg0Jrboul1XaRfojE1fotU6gwzS1sIpyv8et/TitU3IOxh0RbmpO
	vB+QxZbH4bbP4JT5DcdY3/QrmWlgVKwckWzSIC+dB6YjbWqCpIOHPPLnyIWIiI4rvuGIRsVXE2/EQ
	RLE+y+8x9sstfwPT8PRKs8vY5I+4aAkosMUEYARlZXVRdG+LPo/pzLh7G5rVV1SB+a2W0o7U1Lkw5
	o4QMncNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1Dy-00000007kF3-2YAr;
	Sun, 12 Jul 2026 20:56:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1Dw-00000007kEg-1O7f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 20:56:29 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso17839535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 13:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783889786; x=1784494586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+Ey+YDRVZYAvBvERTk45tShixa+dIt05SCjUM3q1Qk=;
        b=GPrT4UO33KKS5qKptXaegJKOPQf86ekF8u3POSDpTUhCu4XCWzEKF1AHrWItTzpGQJ
         kvu9ZgJ7N4DaWKoEiPKHujwZC0isg1bbvq5TcBy5iO/nujG+Q6OpJ+rQhzcrhbf0DCu8
         wlY3+VRHRpC60ibya0YL5gv3tI0gLh+gAGb+fJBG6cq9itKAZ/Y940DHiULz/DsfR9sl
         LWDe21kX1UqJ2MdIEQkZf7kuVMFCtjCodAqt2f2mm9N0WuuiojxSzFzDmJl+gPNYU6YU
         Cj9Tq+OM1oYlAqhKNMKCQzJf1JC3bvOnRrLlKdPpdZ1TLfvOG8vUmB42yZ0UrjBtZ+xx
         PzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783889786; x=1784494586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+Ey+YDRVZYAvBvERTk45tShixa+dIt05SCjUM3q1Qk=;
        b=OH1lfjXYdhCx94mNdSzWtxRPHbY/Mrgi6IxlFWF0FrS0xoUNS2C6ZVmPpE8+1Lcn7V
         VTgdfGZvcoaBAA+BlZ9AVUs/zJKT0CYWzCM04cm0I3W0LpRUvNTahm+C9P0wC/+tchR7
         Z37Ai1GgR1IBx5kexzbeX1d6bkNMFE3TGrfci3+Ih/Dp55Z5+ntbwnY1BFO6s7jLb9TC
         hlqu/UpXEFtqKZnJrbHmGyOVzD10RBQlPnUcFKyCtgy4ev0vKx2Yl07d6r8bqg0jVgn7
         T783rTDZwgp5fZYOjyCd0s03i9Zoge7QXp6qnxc02ITVl+ZhltyPWlRuxP795T5oXdl0
         zRwg==
X-Forwarded-Encrypted: i=1; AHgh+RoX7T0fBOjAplhNQAREZxeEO8pTMBRq0YLDBrlRAjwWiavcga4PNo/mlI8mhRM8FJdJjjH63PES2aIeFWD10f8u@lists.infradead.org
X-Gm-Message-State: AOJu0YyHzqZr/XFeSJdrf5KXQB6TvkzP/HnpfYzOGIx+kMsHZ8cfoH0s
	cGjuY8ZpQpxoROWcpVJNcPhr7c+5uWt0rMS2zjBzmAq0mAzhJJ+wN7ku/hRLbuQq
X-Gm-Gg: AfdE7cl1iel1OONClvUGT0SgcypA5UcK/5A5qgP6l1q4pGSsuKOQe9SC2HvptgwExbs
	jU0ok/ktwRR4IsJIj7faJk6YOIvzBig8UadEjTkL5x3jPAh/DMmbU0ZzVGtxIA0kRqVGHkP0dwM
	0UON/ndqJCO1vqt9EXRHyLR+ygpMpw5j168l/4JAI6TcxadKRBC6jBuqn4hHdDrLH84SL4kK429
	Gcw0IgzmTL1E637rzVQgUqdVUHe39VKMLWwlMREPRLyP/5Z1DaRbfc8rgGJ5e0BXeJNcXtzORZG
	g5AfRjwrF5hwF+x/cX1tUTgjZ3ZXi2/CB91YGlbqutC1PtQwDzQTxG5X0+fQhevCdwCN0e2VbMA
	UyOW2TQaTPucqdVZc/XXQeRoVJqgs0A5oKRzNQ6XV0O1ZOgiUuF/fZur/DdV1KfLbl5s8NaHXDN
	ww1nGc8f9XpaF9ehe3qusKhJTXyhGJae1Xp8yYP+Ze3Fcbc/nQsRhlFdA1LmprNEu2F2j2lfx7/
	Rw/1Lg0jAxljQJ42SIpK2TqAZqrRxKSXjQuodzqNgp5wmFJvM6x1oeR
X-Received: by 2002:a05:600c:8b17:b0:493:f750:f7fc with SMTP id 5b1f17b1804b1-493f8837c34mr65544465e9.35.1783889785897;
        Sun, 12 Jul 2026 13:56:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-112-249.95.117.pool.telefonica.de. [95.117.112.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f373csm519430965e9.14.2026.07.12.13.56.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jul 2026 13:56:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH] ARM: lpc32xx: only run arch_initcalls on LPC32xx hardware
Date: Sun, 12 Jul 2026 22:56:17 +0200
Message-Id: <20260712205617.44944-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_135628_409963_73871E59 
X-CRM114-Status: GOOD (  17.27  )
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

lpc32xx_check_uid() and lpc32xx_pm_init() are arch_initcalls that poke
LPC32xx-only registers (the CLKPWR unique-ID and the EMC control
register). Since the multiplatform conversion they also run on other
ARCH_MULTI_V5 boards, where the access faults, e.g. on versatile:

  Unable to handle kernel paging request at virtual address f4004130
  PC is at lpc32xx_check_uid+0x2c/0x9c

Bail out of both unless we are running on an LPC32xx SoC, reusing the
machine's DT_MACHINE compatible list so the guard can't drift from it.

Fixes: 75bf1bd7d2f9 ("ARM: lpc32xx: allow multiplatform build")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/mach-lpc32xx/common.c  | 10 ++++++++++
 arch/arm/mach-lpc32xx/common.h  |  2 ++
 arch/arm/mach-lpc32xx/phy3250.c |  2 +-
 arch/arm/mach-lpc32xx/pm.c      |  3 +++
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-lpc32xx/common.c b/arch/arm/mach-lpc32xx/common.c
index 304ea61a0716..50b91316d553 100644
--- a/arch/arm/mach-lpc32xx/common.c
+++ b/arch/arm/mach-lpc32xx/common.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/of.h>
 #include <linux/soc/nxp/lpc32xx-misc.h>
 
 #include <asm/mach/map.h>
@@ -106,10 +107,19 @@ void __init lpc32xx_map_io(void)
 	iotable_init(lpc32xx_io_desc, ARRAY_SIZE(lpc32xx_io_desc));
 }
 
+/* The arch_initcalls below poke LPC32xx-only registers; skip other SoCs. */
+bool __init lpc32xx_is_present(void)
+{
+	return of_machine_compatible_match(lpc32xx_dt_compat);
+}
+
 static int __init lpc32xx_check_uid(void)
 {
 	u32 uid[4];
 
+	if (!lpc32xx_is_present())
+		return 0;
+
 	lpc32xx_get_uid(uid);
 
 	printk(KERN_INFO "LPC32XX unique ID: %08x%08x%08x%08x\n",
diff --git a/arch/arm/mach-lpc32xx/common.h b/arch/arm/mach-lpc32xx/common.h
index 32f0ad217807..d00b6761796d 100644
--- a/arch/arm/mach-lpc32xx/common.h
+++ b/arch/arm/mach-lpc32xx/common.h
@@ -17,6 +17,8 @@
  */
 extern void __init lpc32xx_map_io(void);
 extern void __init lpc32xx_serial_init(void);
+extern bool __init lpc32xx_is_present(void);
+extern const char *const lpc32xx_dt_compat[];
 
 /*
  * Returns the LPC32xx unique 128-bit chip ID
diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index 66701bf43248..b1ee31b9d2d2 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -76,7 +76,7 @@ static void __init lpc3250_machine_init(void)
 	of_platform_default_populate(NULL, lpc32xx_auxdata_lookup, NULL);
 }
 
-static const char *const lpc32xx_dt_compat[] __initconst = {
+const char *const lpc32xx_dt_compat[] __initconst = {
 	"nxp,lpc3220",
 	"nxp,lpc3230",
 	"nxp,lpc3240",
diff --git a/arch/arm/mach-lpc32xx/pm.c b/arch/arm/mach-lpc32xx/pm.c
index 2572bd89a5e8..2ad2b2d7cd72 100644
--- a/arch/arm/mach-lpc32xx/pm.c
+++ b/arch/arm/mach-lpc32xx/pm.c
@@ -122,6 +122,9 @@ static const struct platform_suspend_ops lpc32xx_pm_ops = {
 #define EMC_CTRL_REG io_p2v(LPC32XX_EMC_BASE + EMC_DYN_MEM_CTRL_OFS)
 static int __init lpc32xx_pm_init(void)
 {
+	if (!lpc32xx_is_present())
+		return 0;
+
 	/*
 	 * Setup SDRAM self-refresh clock to automatically disable o
 	 * start of self-refresh. This only needs to be done once.
-- 
2.39.5 (Apple Git-154)


