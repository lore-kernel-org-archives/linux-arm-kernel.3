Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23416CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 04:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=68fzEAsJ3Cm+QlWLkcdWbs0tKgQSxg21Abj5S1Q5CD4=; b=CJIn0ipulYgO+LW0UHFDn5V33H
	uqI/ZCe1IsKVWczxxZZcNkTxy5xL4Y4mTQ3Qp6XegiSRw8fIw0RM5O5Wuk4FXqKhi/ggovtn+SRls
	EIxlk5GhgFwOPW6VSIblZiuguoyjKlg+bj8XOaXrLp016y60l8Cy6mepJ3Af0FuUYEOvFyJuYp92m
	oFFoAlmOaSCm40A+wOV+TJGW3OUkAv5DaDDrIIl4KJuiG2lZqZ9eA9pexd43tfJ2U4RmvmEqurd6p
	2mv+XWmBopsTrx9yzJpKpIm3XeK1lYeYZRH6ATMOPVGMYOM3v+QwIho//qLF0in1ZD0YmK7bcGTwy
	kbRrKOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOTaZ-0000000C7H9-1kzd;
	Sun, 17 May 2026 04:58:55 +0000
Received: from mail-dl1-x1243.google.com ([2607:f8b0:4864:20::1243])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOTaW-0000000C7GY-2nEf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 04:58:54 +0000
Received: by mail-dl1-x1243.google.com with SMTP id a92af1059eb24-132c338a537so1445485c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 21:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778993932; x=1779598732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68fzEAsJ3Cm+QlWLkcdWbs0tKgQSxg21Abj5S1Q5CD4=;
        b=o01LJZWguaze/qoMnvicizXKYjQ0KaGbdG7oQfJmq8rvHcCoCKQfid0lCatT/RvknN
         v+lAf9znRfFMvZMvef5+tYyRlxp0wMpsC5Etj3Zqa8/m49PAdVvBvOTleu8yw5CXe/g1
         13JpryVkKy5zfmkTP1q5WBhfFNLStudx1KYn8dVckKZd6OUDtFBkn6EhhGK2qThH8rR+
         iObWHLtpjuQcnbFgHH5DjRht4peEXI585rvcAbuQUWlXZpmXrEEU+ycWb0sfMc8erSov
         tpTtXcH+KyfEwIl/oA4F0SZ0ltEsnW0jzU+Q2mv6zhkfQeL/kwLUFj+CSNl3T6LvyEPe
         MEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778993932; x=1779598732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68fzEAsJ3Cm+QlWLkcdWbs0tKgQSxg21Abj5S1Q5CD4=;
        b=F6AEnstgPanDaiDRMEk85erWvX3JYoi35GIXP9kPnktV3jeCB4mE8og0gciRifABMT
         gCRuoMT3DNmhpuNGjf5FnDmKj/52IDeYPBHBEv2bWwz4d1Uyujj9mQ+4octEctCb319d
         fZi3IDASQykf7RFR97uMLm9VSr3T7KLVrs8/eNZaSgm+IdINn5abLunnH4OecXCvs21X
         HbfVSCZtqLvrRspKuc2A+3KaDj72xRPBd/Pbzudh+pEN7ds1Y0rhaJCpSnK9FWOMtqoS
         wZwZDglurOf8yfwhbPogp/mBXBt4hAH+6XFCnSvLcLKPlqC3BEY8qrfqmJL66XMq0afF
         1Mxg==
X-Gm-Message-State: AOJu0Yz4gA1+DMmAeo6GTV5rIEhWIlCU0bMwfDJJ8jjZPXfsww9XBOeR
	3xgl+6D57EZfFUeC83h9Xv5PuOFwqywUxLW78lyhKdS8QKHLXpoNryquRjZYTpc/Kv4=
X-Gm-Gg: Acq92OH13yfMJq5lVF4C51eslfO1DLNPjLEsiPsoBCWfW/4TVbyNzCz8hgDRAWBKxDb
	g0VbUPeVSesBC+o3NB4VvrF29waQTF5OS6Z23V8zus2V7y5RxGBND0WGW+Jl1AI/HcgzdNZ/DpK
	2dp5ac4hGZEhyB+tBDDYxqisLsJVDre07eE1+yXdegRneffY1k838QtcXSDoF6MKDYD/wBXLvea
	h/N6VlNmSCfK4YpaUzV/U34Jor53o4IEeAjE/aPQEiJi1DNrwRwO2h0loLcc4OynBqOgfdkBQYv
	p2XbqLnkXxYOBrlEr4ald3wfN+EL1QZlaNlPEOvA02oNEMLtk3+1XtZsYmEkK0XBW6i/HWn/1U9
	LaXo7mOu5xWEtvVyVrcd/qLEkRwRp38fLoOYbpjK3DgAKmuTA7C3HS1jjiRMoSz5OReFg5YdpN6
	C7x4sKPRE9oHIntIOSkOuntvgQMYvVJHFWEFiJkUHOrLYLLaio0jjrvGVQnO7e5xFd3x5W2GCII
	raTo8zBKYojBlmkKwpHOsBBiFnEhmrzlD9BHQMEMmeLaAevMEpSQzuNbPjNeplXyHe/n4xQqkyH
	AlKweIRc+jIWRw77RNsHiOxonpR0
X-Received: by 2002:a05:7300:a888:b0:2f0:ee2:f6c6 with SMTP id 5a478bee46e88-30262b43a2bmr5609138eec.19.1778993931514;
        Sat, 16 May 2026 21:58:51 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e6a9sm10931848eec.2.2026.05.16.21.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 21:58:51 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] ARM: Move Footbridge-specific header into mach-footbridge
Date: Sat, 16 May 2026 21:57:39 -0700
Message-ID: <20260517045804.345657-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_215852_741981_CEB25DAB 
X-CRM114-Status: GOOD (  17.54  )
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

arch/arm/include/asm/hardware/dec21285.h is specific to the DC21285
Footbridge chip and should not be in the global ARM include directory.
Move it into mach-footbridge where it belongs. It was included twice in
arch/arm/mach-footbridge/common.c; remove one of the includes.
Also remove the file path from the header (it is bad style and would
become outdated) and add missing include guards.

Tested by compiling footbridge_defconfig and netwinder_defconfig,
modified to additionally enable CONFIG_MTD_DC21285 and
CONFIG_DEBUG_FOOTBRIDGE_COM1 or CONFIG_DEBUG_DC21285_PORT, respectively
(these are the only Footbridge-related options not enabled by the
defconfigs).

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
This patch depends on my previous patch "ARM: clean up machine-specific
PCI code and move it into mach-footbridge" because it touches the same
area of arch/arm/mach-footbridge/dc21285.c.

 MAINTAINERS                                               | 1 -
 arch/arm/include/debug/dc21285.S                          | 2 +-
 arch/arm/mach-footbridge/common.c                         | 3 +--
 arch/arm/mach-footbridge/dc21285-timer.c                  | 2 +-
 arch/arm/mach-footbridge/dc21285.c                        | 2 +-
 arch/arm/mach-footbridge/dma-isa.c                        | 2 +-
 arch/arm/mach-footbridge/ebsa285.c                        | 2 +-
 .../hardware => mach-footbridge/include/mach}/dec21285.h  | 8 +++++---
 arch/arm/mach-footbridge/isa-irq.c                        | 2 +-
 arch/arm/mach-footbridge/isa.c                            | 2 +-
 arch/arm/mach-footbridge/netwinder-hw.c                   | 2 +-
 drivers/char/nwflash.c                                    | 2 +-
 drivers/mtd/maps/dc21285.c                                | 2 +-
 drivers/tty/serial/21285.c                                | 2 +-
 drivers/watchdog/wdt285.c                                 | 2 +-
 15 files changed, 18 insertions(+), 18 deletions(-)
 rename arch/arm/{include/asm/hardware => mach-footbridge/include/mach}/dec21285.h (98%)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d79275c6..37ecfe4bc4e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2811,7 +2811,6 @@ M:	Russell King <linux@armlinux.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://www.armlinux.org.uk/
-F:	arch/arm/include/asm/hardware/dec21285.h
 F:	arch/arm/mach-footbridge/
 
 ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
diff --git a/arch/arm/include/debug/dc21285.S b/arch/arm/include/debug/dc21285.S
index 4ec0e5e31704..c0eb58ba7d7e 100644
--- a/arch/arm/include/debug/dc21285.S
+++ b/arch/arm/include/debug/dc21285.S
@@ -7,7 +7,7 @@
  *  Moved from linux/arch/arm/kernel/debug.S by Ben Dooks
 */
 
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 
 #include <mach/hardware.h>
 	/* For EBSA285 debugging */
diff --git a/arch/arm/mach-footbridge/common.c b/arch/arm/mach-footbridge/common.c
index 85c598708c10..d3076bf03875 100644
--- a/arch/arm/mach-footbridge/common.c
+++ b/arch/arm/mach-footbridge/common.c
@@ -20,7 +20,6 @@
 #include <asm/mach-types.h>
 #include <asm/setup.h>
 #include <asm/system_misc.h>
-#include <asm/hardware/dec21285.h>
 
 #include <asm/mach/irq.h>
 #include <asm/mach/map.h>
@@ -30,7 +29,7 @@
 
 #include <mach/hardware.h>
 #include <mach/irqs.h>
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 
 static int dc21285_get_irq(void)
 {
diff --git a/arch/arm/mach-footbridge/dc21285-timer.c b/arch/arm/mach-footbridge/dc21285-timer.c
index 2908c9ef3c9b..f5d0024783e3 100644
--- a/arch/arm/mach-footbridge/dc21285-timer.c
+++ b/arch/arm/mach-footbridge/dc21285-timer.c
@@ -14,7 +14,7 @@
 
 #include <asm/irq.h>
 
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 #include <asm/mach/time.h>
 #include <asm/system_info.h>
 
diff --git a/arch/arm/mach-footbridge/dc21285.c b/arch/arm/mach-footbridge/dc21285.c
index 5a68b6739ecf..923c808e8ba1 100644
--- a/arch/arm/mach-footbridge/dc21285.c
+++ b/arch/arm/mach-footbridge/dc21285.c
@@ -19,7 +19,7 @@
 
 #include <asm/irq.h>
 #include <asm/mach/pci.h>
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 
 #include "pci.h"
 
diff --git a/arch/arm/mach-footbridge/dma-isa.c b/arch/arm/mach-footbridge/dma-isa.c
index 937f5376d5e7..300cdf6ef223 100644
--- a/arch/arm/mach-footbridge/dma-isa.c
+++ b/arch/arm/mach-footbridge/dma-isa.c
@@ -19,7 +19,7 @@
 
 #include <asm/dma.h>
 #include <asm/mach/dma.h>
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 
 #define ISA_DMA_MASK		0
 #define ISA_DMA_MODE		1
diff --git a/arch/arm/mach-footbridge/ebsa285.c b/arch/arm/mach-footbridge/ebsa285.c
index 1cb7d674bc81..93ab333e3027 100644
--- a/arch/arm/mach-footbridge/ebsa285.c
+++ b/arch/arm/mach-footbridge/ebsa285.c
@@ -10,7 +10,7 @@
 #include <linux/slab.h>
 #include <linux/leds.h>
 
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 #include <asm/mach-types.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/include/asm/hardware/dec21285.h b/arch/arm/mach-footbridge/include/mach/dec21285.h
similarity index 98%
rename from arch/arm/include/asm/hardware/dec21285.h
rename to arch/arm/mach-footbridge/include/mach/dec21285.h
index 894f2a635cbb..35d10e2dcade 100644
--- a/arch/arm/include/asm/hardware/dec21285.h
+++ b/arch/arm/mach-footbridge/include/mach/dec21285.h
@@ -1,11 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- *  arch/arm/include/asm/hardware/dec21285.h
- *
  *  Copyright (C) 1998 Russell King
  *
  *  DC21285 registers
  */
+
+#ifndef __MACH_DEC21285_H
+#define __MACH_DEC21285_H
+
 #define DC21285_PCI_IACK		0x79000000
 #define DC21285_ARMCSR_BASE		0x42000000
 #define DC21285_PCI_TYPE_0_CONFIG	0x7b000000
@@ -135,4 +137,4 @@
 #define TIMER_CNTL_DIV256	(2 << 2)
 #define TIMER_CNTL_CNTEXT	(3 << 2)
 
-
+#endif /* __MACH_DEC21285_H */
diff --git a/arch/arm/mach-footbridge/isa-irq.c b/arch/arm/mach-footbridge/isa-irq.c
index 842ddb4121ef..f9231e84028d 100644
--- a/arch/arm/mach-footbridge/isa-irq.c
+++ b/arch/arm/mach-footbridge/isa-irq.c
@@ -21,7 +21,7 @@
 #include <asm/mach/irq.h>
 
 #include <mach/hardware.h>
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-footbridge/isa.c b/arch/arm/mach-footbridge/isa.c
index 84caccddce44..a028920e8f12 100644
--- a/arch/arm/mach-footbridge/isa.c
+++ b/arch/arm/mach-footbridge/isa.c
@@ -8,7 +8,7 @@
 #include <linux/serial_8250.h>
 
 #include <asm/irq.h>
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-footbridge/netwinder-hw.c b/arch/arm/mach-footbridge/netwinder-hw.c
index c024eefd4978..bd21c455a495 100644
--- a/arch/arm/mach-footbridge/netwinder-hw.c
+++ b/arch/arm/mach-footbridge/netwinder-hw.c
@@ -16,7 +16,7 @@
 #include <linux/slab.h>
 #include <linux/leds.h>
 
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 #include <asm/mach-types.h>
 #include <asm/setup.h>
 #include <asm/system_misc.h>
diff --git a/drivers/char/nwflash.c b/drivers/char/nwflash.c
index 9f52f0306ef7..21ac9b2df42e 100644
--- a/drivers/char/nwflash.c
+++ b/drivers/char/nwflash.c
@@ -29,7 +29,7 @@
 #include <linux/mutex.h>
 #include <linux/jiffies.h>
 
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 #include <asm/io.h>
 #include <asm/mach-types.h>
 #include <linux/uaccess.h>
diff --git a/drivers/mtd/maps/dc21285.c b/drivers/mtd/maps/dc21285.c
index 70a3db3ab856..8bcb40489f4f 100644
--- a/drivers/mtd/maps/dc21285.c
+++ b/drivers/mtd/maps/dc21285.c
@@ -17,7 +17,7 @@
 #include <linux/mtd/partitions.h>
 
 #include <asm/io.h>
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 #include <asm/mach-types.h>
 
 
diff --git a/drivers/tty/serial/21285.c b/drivers/tty/serial/21285.c
index 4de0c975ebdc..f20c2092e4a5 100644
--- a/drivers/tty/serial/21285.c
+++ b/drivers/tty/serial/21285.c
@@ -18,7 +18,7 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 #include <asm/system_info.h>
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 #include <mach/hardware.h>
 
 #define BAUD_BASE		(mem_fclk_21285/64)
diff --git a/drivers/watchdog/wdt285.c b/drivers/watchdog/wdt285.c
index 78681d9f7d53..347cb2892833 100644
--- a/drivers/watchdog/wdt285.c
+++ b/drivers/watchdog/wdt285.c
@@ -30,7 +30,7 @@
 
 #include <asm/mach-types.h>
 #include <asm/system_info.h>
-#include <asm/hardware/dec21285.h>
+#include <mach/dec21285.h>
 
 /*
  * Define this to stop the watchdog actually rebooting the machine.
-- 
2.43.0


