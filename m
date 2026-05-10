Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8646CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 03:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fk9eeAKn3FhBbqVLjcl9tAfYozaTPwOkZxBuF5GgNhQ=; b=jOzYRCJj+AqgCsp6rDkb0a+pkI
	blmlh8BKWewiH1CfD1FdGtxa8JBZMH1Bezk9xr76L0H20jg/ndwVUXNQUVO7PO623ubJ+et8DAVn3
	Lmn7RebPqZcsvcfC1m4OHvTn6dT2++/ktaOjlMVtyZmYm9TiMj12r7nyT804/PDO8LZTz3IFlnC7T
	ExjTYs4MDt/QLk+nWG+aq2JTxM/KdE64WZClzH+8exrSnQxDrJtEIVsX3sUqz1aGoLcKEXycTZsnl
	NVnx5k1BLCuG7yYFQeCvVMP/cGItILzRuTByXZimpoaa1xIISmWC3a8a8X0VUnajHeCov8kY76xJK
	2fYjA9cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLuZX-0000000A3j3-1V7A;
	Sun, 10 May 2026 03:11:15 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLuZT-0000000A3iW-3nA7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 03:11:13 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2f30a4601bbso3387306eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 20:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778382671; x=1778987471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fk9eeAKn3FhBbqVLjcl9tAfYozaTPwOkZxBuF5GgNhQ=;
        b=NIww1JVECFk7ndNhwkIkr5CGkDwIgNDDCHenxYztslkHoMDvQM4FeqrbLvYRSkJBye
         GSpey51Y0r2p6QskyODTKOIfjzvJ/Bksu5zFjkiOloMvMnH/UsyIpzHH2Nbd9AyAMRwb
         wukZs0c9Pe+SeqbNCyIiDdRtBhDad9dsGV97mteTGGIvrJQUK0zWR705gwyC7XKay8nu
         EUgEidYxxbmhkbWmtfmsgS4nkpC+NqjK+j+xT5phK5u1ax0pZul9SHYIsJu0p9ioeRMf
         11m/+Z5INAZmuxQ48SDkuU1B8qrApjjDEmkhHpaFvWtaFVJXVyTm+9/NaMy5XBMQAsSl
         hhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778382671; x=1778987471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fk9eeAKn3FhBbqVLjcl9tAfYozaTPwOkZxBuF5GgNhQ=;
        b=aGVPhNcWygWo5LakltXabNIkqua1YOkPbU0MyUCB5nhWczoLL7w29S1tQhJiqVcfbm
         i9RSONl1WV6f8Ss3VselmvO3ITRtVJhDL4SPbht7wSLYb0s4nJpjz4TDbIQG4qf3yYEb
         SaBJGS61+nifI93qgemUiF4fxiYkK6UzaaGZ+yLGrLk8e6Z4zhGsEMeABx/JCyr3Q9fi
         vWBb5FjmxvYJg2dRHbAl5KreKpxC6sst6XxKNpt84Mc6AtAP9zoN5ba7HK6mFmoV/5I+
         IDJLi25ANuwdUthKi3NG4CB+Yn1itxBUlTgA6pAOG99vo2LLjX4cCp3TcMaFz/iREgga
         06zQ==
X-Gm-Message-State: AOJu0YxlyGmGq3dVHpFuMcUDHjvLzeZeGwZauCvWoZCRxNVRmP3yir56
	h9suQz8gbYVqRKkt46uFYXGVKc0R2QpOqoJnELskFGWCsh/sRJxy9u34hUdf7XvShVc=
X-Gm-Gg: Acq92OGxYZUgSUA1aukadKrg6/qgkzcpecs4DbDQDvQLU1f+PHe2u0+7SfchoIa98i1
	ivcib22NigX0bO2ru3wPNJMZwRT3jtmY91nvDLf7vgTflEm0jVmAQ1IhgEW2gPwynw0+x5uL6WC
	Px4cUTWZ97ZujrafEUlCWcKMZVDjpnqW4lPQLmDpgSaFGw8CSd4X0J23M8WTHKbdTzxJjWM7IH2
	WUlBpjXhMn5rj6QYpsr7io75AlSehtAEb6BlRHe/vohJ8gT5SeCVzgzQVKViBP1g6BhvzjaGw8d
	V+ey6RykuIIYBVUuJNnbWLUqIEflTAWd13C9OpBnGroN+vQ8Xv6ofnYgMzKPkB2V0NwLhd6Z5yG
	PzKFvCjvgJ5fuqzh5hxARuNjbfR+51P34g2o2qfDRwSXpm59XWhsXsdRNGNu+NOF/Zd4DzEl3T6
	bqyxLuSw+dUm45nyvPv/m/gFpVS0nZBpR5cuzXtBQD6JFRg8Y0KMqreNLa9nVVV6eot34VvqE9C
	umnymsS5z9cQvPvFUqTw8dulh74MpH+9vvRZnyvYEx3nvGAZ1WmgIkjvyOLmErKv4tey7ZBbbYF
	7YWPR43VXQ7YPbCrtA==
X-Received: by 2002:a05:7300:a987:b0:2df:c5bb:3720 with SMTP id 5a478bee46e88-2f54c587faemr9231006eec.15.1778382670966;
        Sat, 09 May 2026 20:11:10 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm8433793eec.24.2026.05.09.20.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 20:11:10 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH] ARM: move Risc PC-specific <asm/hardware/iomd.h> header into mach-rpc
Date: Sat,  9 May 2026 20:10:36 -0700
Message-ID: <20260510031100.255248-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_201111_954037_36FF5166 
X-CRM114-Status: GOOD (  16.01  )
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

The <asm/hardware/iomd.h> header is specific to the IOMD chip used on
the Risc PC. Move it into mach-rpc to avoid polluting asm/hardware/
with machine-specific headers.

Also take the opportunity to remove a comment with the file path from
the header, which is bad style.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 MAINTAINERS                                                     | 1 -
 arch/arm/mach-rpc/dma.c                                         | 2 +-
 arch/arm/{include/asm/hardware => mach-rpc/include/mach}/iomd.h | 2 --
 arch/arm/mach-rpc/irq.c                                         | 2 +-
 arch/arm/mach-rpc/riscpc.c                                      | 2 +-
 arch/arm/mach-rpc/time.c                                        | 2 +-
 drivers/i2c/busses/i2c-acorn.c                                  | 2 +-
 drivers/input/mouse/rpcmouse.c                                  | 2 +-
 drivers/input/serio/rpckbd.c                                    | 2 +-
 drivers/video/fbdev/acornfb.h                                   | 2 +-
 10 files changed, 8 insertions(+), 11 deletions(-)
 rename arch/arm/{include/asm/hardware => mach-rpc/include/mach}/iomd.h (98%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 211cc683e25b..6a1da8903c04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3398,7 +3398,6 @@ M:	Russell King <linux@armlinux.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://www.armlinux.org.uk/
-F:	arch/arm/include/asm/hardware/iomd.h
 F:	arch/arm/mach-rpc/
 F:	drivers/net/ethernet/8390/etherh.c
 F:	drivers/net/ethernet/i825xx/ether1*
diff --git a/arch/arm/mach-rpc/dma.c b/arch/arm/mach-rpc/dma.c
index 50e0f97afd75..717a81475670 100644
--- a/arch/arm/mach-rpc/dma.c
+++ b/arch/arm/mach-rpc/dma.c
@@ -20,7 +20,7 @@
 #include <linux/uaccess.h>
 
 #include <asm/mach/dma.h>
-#include <asm/hardware/iomd.h>
+#include <mach/iomd.h>
 
 struct iomd_dma {
 	struct dma_struct	dma;
diff --git a/arch/arm/include/asm/hardware/iomd.h b/arch/arm/mach-rpc/include/mach/iomd.h
similarity index 98%
rename from arch/arm/include/asm/hardware/iomd.h
rename to arch/arm/mach-rpc/include/mach/iomd.h
index e3f130345ebc..2a3f4a5f3fd9 100644
--- a/arch/arm/include/asm/hardware/iomd.h
+++ b/arch/arm/mach-rpc/include/mach/iomd.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- *  arch/arm/include/asm/hardware/iomd.h
- *
  *  Copyright (C) 1999 Russell King
  *
  *  This file contains information out the IOMD ASIC used in the
diff --git a/arch/arm/mach-rpc/irq.c b/arch/arm/mach-rpc/irq.c
index e924c9b813ab..649d81874c86 100644
--- a/arch/arm/mach-rpc/irq.c
+++ b/arch/arm/mach-rpc/irq.c
@@ -4,7 +4,7 @@
 #include <linux/io.h>
 
 #include <asm/mach/irq.h>
-#include <asm/hardware/iomd.h>
+#include <mach/iomd.h>
 #include <asm/irq.h>
 #include <asm/fiq.h>
 
diff --git a/arch/arm/mach-rpc/riscpc.c b/arch/arm/mach-rpc/riscpc.c
index f70fb9c4b0cb..d068f5e4873d 100644
--- a/arch/arm/mach-rpc/riscpc.c
+++ b/arch/arm/mach-rpc/riscpc.c
@@ -22,7 +22,7 @@
 #include <asm/elf.h>
 #include <asm/mach-types.h>
 #include <mach/hardware.h>
-#include <asm/hardware/iomd.h>
+#include <mach/iomd.h>
 #include <asm/page.h>
 #include <asm/domain.h>
 #include <asm/setup.h>
diff --git a/arch/arm/mach-rpc/time.c b/arch/arm/mach-rpc/time.c
index ad93c4dfafcd..566113f9774f 100644
--- a/arch/arm/mach-rpc/time.c
+++ b/arch/arm/mach-rpc/time.c
@@ -17,7 +17,7 @@
 #include <linux/io.h>
 
 #include <mach/hardware.h>
-#include <asm/hardware/iomd.h>
+#include <mach/iomd.h>
 
 #include <asm/mach/time.h>
 
diff --git a/drivers/i2c/busses/i2c-acorn.c b/drivers/i2c/busses/i2c-acorn.c
index 99b6b1c3fd9e..703b4a42f466 100644
--- a/drivers/i2c/busses/i2c-acorn.c
+++ b/drivers/i2c/busses/i2c-acorn.c
@@ -13,7 +13,7 @@
 #include <linux/io.h>
 
 #include <mach/hardware.h>
-#include <asm/hardware/iomd.h>
+#include <mach/iomd.h>
 
 #define FORCE_ONES	0xdc
 #define SCL		0x02
diff --git a/drivers/input/mouse/rpcmouse.c b/drivers/input/mouse/rpcmouse.c
index 6774029e0a1a..475c3ca22fd4 100644
--- a/drivers/input/mouse/rpcmouse.c
+++ b/drivers/input/mouse/rpcmouse.c
@@ -23,7 +23,7 @@
 
 #include <mach/hardware.h>
 #include <asm/irq.h>
-#include <asm/hardware/iomd.h>
+#include <mach/iomd.h>
 
 MODULE_AUTHOR("Vojtech Pavlik, Russell King");
 MODULE_DESCRIPTION("Acorn RiscPC mouse driver");
diff --git a/drivers/input/serio/rpckbd.c b/drivers/input/serio/rpckbd.c
index 4d817850ba3b..e452ad07e2fa 100644
--- a/drivers/input/serio/rpckbd.c
+++ b/drivers/input/serio/rpckbd.c
@@ -17,7 +17,7 @@
 #include <linux/slab.h>
 
 #include <mach/hardware.h>
-#include <asm/hardware/iomd.h>
+#include <mach/iomd.h>
 
 MODULE_AUTHOR("Vojtech Pavlik, Russell King");
 MODULE_DESCRIPTION("Acorn RiscPC PS/2 keyboard controller driver");
diff --git a/drivers/video/fbdev/acornfb.h b/drivers/video/fbdev/acornfb.h
index f8df4ecb4fd7..e65388587f80 100644
--- a/drivers/video/fbdev/acornfb.h
+++ b/drivers/video/fbdev/acornfb.h
@@ -7,7 +7,7 @@
  *  Frame buffer code for Acorn platforms
  */
 #if defined(HAS_VIDC20)
-#include <asm/hardware/iomd.h>
+#include <mach/iomd.h>
 #define VIDC_PALETTE_SIZE	256
 #define VIDC_NAME		"VIDC20"
 #endif
-- 
2.43.0


