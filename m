Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE23BC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVPLvZOYHVZcrRGfAsoGIh0GIVpV0XX6qb/79D6UHqg=; b=NKda8/tMl+JS7C1CKn5wPrFLQj
	5QsFlZKYSYU0fNxMVHuLSyOcAU0PGdAXmyIbF5VhMMYr1JPhwlvhekbtw5Kqk9d3bW07kpitOadg+
	kbZYzEblxb67Q0jtp3qZLhw0MTIrE0XRXSBHFhkT47KDgLmvCm7Y9qfG7KXJCvqogdGOl/7ORnwFf
	q54usdyR05uy8RLFS3YIAKZPAaIq6yYLmY8607mQ0wmbnhK/jaaj1nnVY0EKbYGLbaX3KLCXUuvZo
	8NIhu6bvKtiynMIdOFmD8hmTDtDd0fthOwN0441gIdlfVOSUgNnHeC8f4bQ5Fj1LiSEvp7Lst5zmG
	2+r3/q2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1HL-0000000F8eA-3TDg;
	Thu, 23 Jul 2026 21:48:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1HK-0000000F8ds-2msN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 21:48:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D88BD600AD;
	Thu, 23 Jul 2026 21:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3D61F000E9;
	Thu, 23 Jul 2026 21:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784843309;
	bh=JVPLvZOYHVZcrRGfAsoGIh0GIVpV0XX6qb/79D6UHqg=;
	h=From:To:Cc:Subject:Date;
	b=LWEnadoFJbVjQ2Q7i3foCr3AKGtIOzR+0x9MZwMDq/V3VPAhmiHuUCsbOYw6j3reT
	 aZ19GkXYemnxQaBzDiqgNtBZDCiXnz2CwbGxmxiG5EQNBCZYeUbLiUZfymwLF9D9mW
	 lSMa9fH027NT5Te5kORSE2uLIux2AXWsPAFz6nAG946FutjMwwiQs+yT3Sw0xvyEqQ
	 Qe/b1dpEMhD0mPICiPe2WSIG7tC4XOiKY4uChXdhQDI70WTyqFq4yhisUn1lUTpJux
	 kErhqF4PAbIX1KzPKTHBfbQOGArKI92XufBqge0e7c/jvfhm3HRP09EV+OKMbAv92q
	 Cqjbz47OEvMdA==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: lpc32xx: remove a few manually populated OF devices
Date: Fri, 24 Jul 2026 00:48:09 +0300
Message-ID: <20260723214809.294654-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

For a good while the common for all NXP LPC32xx platforms lpc32xx.dtsi
file contains proper descriptions of DMA, SLC and MLC NAND controllers,
this allows to remove populated device tree nodes from platform code.

At the end of the last year it was announced that this change to happen,
unlikely there are still users with such old dtbs to be affected by this
change, but if there are such users, they should update board dtb file,
if DMA or NAND controller decriptions are not found in them.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm/mach-lpc32xx/phy3250.c | 60 ---------------------------------
 1 file changed, 60 deletions(-)

diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index ddc6333ca55d..fffce1fb8717 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -8,74 +8,14 @@
  * Copyright (C) 2010 NXP Semiconductors
  */
 
-#include <linux/amba/pl08x.h>
-#include <linux/mtd/lpc32xx_mlc.h>
-#include <linux/mtd/lpc32xx_slc.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 #include "common.h"
 
-static struct pl08x_channel_data pl08x_slave_channels[] = {
-	{
-		.bus_id = "nand-slc",
-		.min_signal = 1, /* SLC NAND Flash */
-		.max_signal = 1,
-		.periph_buses = PL08X_AHB1,
-	},
-	{
-		.bus_id = "nand-mlc",
-		.min_signal = 12, /* MLC NAND Flash */
-		.max_signal = 12,
-		.periph_buses = PL08X_AHB1,
-	},
-};
-
-static int pl08x_get_signal(const struct pl08x_channel_data *cd)
-{
-	return cd->min_signal;
-}
-
-static void pl08x_put_signal(const struct pl08x_channel_data *cd, int ch)
-{
-}
-
-static struct pl08x_platform_data pl08x_pd = {
-	/* Some reasonable memcpy defaults */
-	.memcpy_burst_size = PL08X_BURST_SZ_256,
-	.memcpy_bus_width = PL08X_BUS_WIDTH_32_BITS,
-	.slave_channels = &pl08x_slave_channels[0],
-	.num_slave_channels = ARRAY_SIZE(pl08x_slave_channels),
-	.get_xfer_signal = pl08x_get_signal,
-	.put_xfer_signal = pl08x_put_signal,
-	.lli_buses = PL08X_AHB1,
-	.mem_buses = PL08X_AHB1,
-};
-
-static struct lpc32xx_slc_platform_data lpc32xx_slc_data = {
-	.dma_filter = pl08x_filter_id,
-};
-
-static struct lpc32xx_mlc_platform_data lpc32xx_mlc_data = {
-	.dma_filter = pl08x_filter_id,
-};
-
-static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
-	OF_DEV_AUXDATA("arm,pl080", 0x31000000, "pl08xdmac", &pl08x_pd),
-	OF_DEV_AUXDATA("nxp,lpc3220-slc", 0x20020000, "20020000.flash",
-		       &lpc32xx_slc_data),
-	OF_DEV_AUXDATA("nxp,lpc3220-mlc", 0x200a8000, "200a8000.flash",
-		       &lpc32xx_mlc_data),
-	{ }
-};
-
 static void __init lpc3250_machine_init(void)
 {
 	lpc32xx_check_uid();
 	lpc32xx_pm_init();
 	lpc32xx_serial_init();
-
-	of_platform_default_populate(NULL, lpc32xx_auxdata_lookup, NULL);
 }
 
 static const char *const lpc32xx_dt_compat[] __initconst = {
-- 
2.51.0


