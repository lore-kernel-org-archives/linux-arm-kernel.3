Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9BACD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 01:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y90PwL0QS9idwkbU+p6fvn1xsZQeFD4fHqK3QAm6Tz4=; b=a9nTX6jIj6CjhUrBvnMhpIcmLN
	zevcS+O0GyMQTN5M6B/GCCAZoN7YBHk3LLXo537AV+g9pb+0eJV4VKl2gkdJFI1aoYMmXBCQ88FZG
	OiR9fnS1mDYV2J9t30t4k0EzCA9oD1XoyC/tdB6jQToTy0yNkH1KQiEbKXAQWrRrsdW/nql6n+l9x
	FXNjdXoLbYgWNPLvr+tN2rkj92LNhG+4uP5TECwYhqAbngMd/o//Wz/ZpJc/mhhgvSxCP1A3z3jmW
	Vn/D3S7PBQtUs/pravWgKdE1+w+iHNZunoh3ldhdjhGWjLaANASqpFQu/gmxqNVZ6eds1S2L2bGYB
	bnr+oHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMFF2-0000000Bx8L-1Qqz;
	Mon, 11 May 2026 01:15:28 +0000
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMFEu-0000000Bx7T-3mqM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 01:15:24 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4572377eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 18:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778462120; x=1779066920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y90PwL0QS9idwkbU+p6fvn1xsZQeFD4fHqK3QAm6Tz4=;
        b=jinInHMdaO2zJ9PQ3UMIOQtlVTjomlpOCD98J4HjZWkdg9H0ONGVMTwStKFMfGyBdL
         ORb1TOeLpX2M22TwYcwwAdMMtEB8qM4PcsoJgXzZ1gSA8bLaRMa9ycbdlqtyBl1Nng8L
         J5m2cnQrX+LwSiNY3k3iCcxy1Krk4jpRwriEk3akNp975SEritihircbFFKiCBOLcdyQ
         mQXjgl1Uiy+pgTQt3/0IAXxxWd3Dabc5Nq4GTebLRj8XJOuvHkZyhSnR8HtS6HnLRnN1
         e2lGTS/kiQzN6cbyaOAch+u3lJ3l+2Yw2pdYyFSRgz5cNBOqV7kpjNAz4kzIQYarVoeF
         eYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778462120; x=1779066920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y90PwL0QS9idwkbU+p6fvn1xsZQeFD4fHqK3QAm6Tz4=;
        b=Y8WlmgDKqqEeLev3/Z34hayToEKAfRik6jaRRyhNhMlHy31ZGGSl9rjzNQJ04/BcNw
         RbqZwPNz39TNySc9OdQzvxxH3NFVuicGcz6S6B8OGSjmRftP/bILUgjDh6zA+SKimbpF
         sTWGaYMTttmGbZZ4eE9eYmgqNlzeVyjsCeq0/MY4xb/QVFX/C7+bM93niRReDZmfgBBR
         4myuyWD+nYujuDF/P5oIKVsZ2HjgeO99hiF8byptnlE7h0B77ZXAgzYqpdHw31FK7Wx9
         V0rBlZ64imTgsdPu7i3XCMAi8xOE9uNSMjHWK34U+pGr3YWKbE6ctPApk93UGoOwk3zP
         danw==
X-Gm-Message-State: AOJu0YwPGfB3CZu1C/PXkV2Lp7eQ0f9limRbRUqvIpKAJ2Xa6oH47LrT
	yrskVksidZ/+Ziy4nmPaBa6gez++QSZ37QY96Lh3Io38Wj83oDrGRn+B5imWaoXb9y0=
X-Gm-Gg: Acq92OEIjov22oMV72i+IxRqNMeH5v2a87mmwPsHB5HBewDoKp7+0tu52UoNvhBuzxd
	xLuoSQAXIvU+0czycfYQp7865lT1uDizvAH8K6J8wAZKbFNrK+LdWZ0l0lzVHItMmWYhvyQnyEd
	QLa1wdM0uwl4tjCb8CCYDbiyLpnku/FXl+MUtTyW0qpFMbchhsqIhvMXPHz/WfdJsC94PKFKFJS
	/wLX9wR+shuBhU2DJa2pzeK3RukVaa2KEVxDWD+UOeWnjPtLQNoEdcWC5eoFpQ9b2+9m9c/gLD0
	a+ecgCFvst8IUjRVJCisTcZS+8KLKW5CegI5AWwuvKDLRLY2vLtIdJU8ZLE3P6wjz5hwo9racCk
	GePV03Ewl6DKSqhPJ8Bu0/KHnSqo+HpgjmX4HWI8afV0dITaqcPD8gB9CWXWrABrAL49YmwegnT
	9IR6aeBTv+sKjC1JiysrQyTLHtoHajCetXD4srMnBlb8b0Wjh7cwN2AbwYiXN7WqZs9fwAanwoZ
	yISUA5W8B+WOe/Ml7lbboqrB08x01/cZPbDfMQQsZZKAACVhbWHzxbZ5BcGqitglJ75uvpH59yx
	e5RpnVPsUxCjRjlBbLw1SKAuDIXK
X-Received: by 2002:a05:7300:f191:b0:2ed:e14:42e6 with SMTP id 5a478bee46e88-2f54b06824dmr9904299eec.31.1778462118094;
        Sun, 10 May 2026 18:15:18 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm11906158eec.2.2026.05.10.18.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 18:15:17 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jiri Bohac <jbohac@suse.cz>
Subject: [RFC PATCH] ARM: move reserve_lp[012] handling into affected machines
Date: Sun, 10 May 2026 18:14:58 -0700
Message-ID: <20260511011504.77760-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_181521_061830_C073C1D6 
X-CRM114-Status: GOOD (  29.30  )
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

arch/arm/kernel/setup.c contains code to reserve lp0/1/2 I/O ports for
machines that can't possibly have these ports. This code is only used
by netwinder and footbridge, and is small enough that it can just be
moved into these machines. Do so to make the setup code more generic
and the machine code more self-contained.

This patch is an RFC because I'm not sure if using .init_early is
actually necessary. I did it to match the place the original code was
called as closely as possible. Can anyone weigh in on this?

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/include/asm/mach/arch.h        |  3 --
 arch/arm/kernel/setup.c                 | 37 -------------------
 arch/arm/mach-footbridge/netwinder-hw.c | 48 ++++++++++++++++++-------
 arch/arm/mach-rpc/riscpc.c              | 30 ++++++++++++++--
 4 files changed, 63 insertions(+), 55 deletions(-)

diff --git a/arch/arm/include/asm/mach/arch.h b/arch/arm/include/asm/mach/arch.h
index 2b18a258204d..fc5abdd2fe88 100644
--- a/arch/arm/include/asm/mach/arch.h
+++ b/arch/arm/include/asm/mach/arch.h
@@ -37,9 +37,6 @@ struct machine_desc {
 	unsigned int		video_start;	/* start of video RAM	*/
 	unsigned int		video_end;	/* end of video RAM	*/
 
-	unsigned char		reserve_lp0 :1;	/* never has lp0	*/
-	unsigned char		reserve_lp1 :1;	/* never has lp1	*/
-	unsigned char		reserve_lp2 :1;	/* never has lp2	*/
 	enum reboot_mode	reboot_mode;	/* default restart mode	*/
 	unsigned		l2c_aux_val;	/* L2 cache aux value	*/
 	unsigned		l2c_aux_mask;	/* L2 cache aux mask	*/
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 0bfd66c7ada0..5416ef7b4f31 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -8,7 +8,6 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/stddef.h>
-#include <linux/ioport.h>
 #include <linux/delay.h>
 #include <linux/utsname.h>
 #include <linux/initrd.h>
@@ -185,31 +184,6 @@ static struct resource mem_res[] = {
 #define kernel_code mem_res[1]
 #define kernel_data mem_res[2]
 
-static struct resource io_res[] = {
-	{
-		.name = "reserved",
-		.start = 0x3bc,
-		.end = 0x3be,
-		.flags = IORESOURCE_IO | IORESOURCE_BUSY
-	},
-	{
-		.name = "reserved",
-		.start = 0x378,
-		.end = 0x37f,
-		.flags = IORESOURCE_IO | IORESOURCE_BUSY
-	},
-	{
-		.name = "reserved",
-		.start = 0x278,
-		.end = 0x27f,
-		.flags = IORESOURCE_IO | IORESOURCE_BUSY
-	}
-};
-
-#define lp0 io_res[0]
-#define lp1 io_res[1]
-#define lp2 io_res[2]
-
 static const char *proc_arch[] = {
 	"undefined/unknown",
 	"3",
@@ -909,17 +883,6 @@ static void __init request_standard_resources(const struct machine_desc *mdesc)
 		video_ram.end   = mdesc->video_end;
 		request_resource(&iomem_resource, &video_ram);
 	}
-
-	/*
-	 * Some machines don't have the possibility of ever
-	 * possessing lp0, lp1 or lp2
-	 */
-	if (mdesc->reserve_lp0)
-		request_resource(&ioport_resource, &lp0);
-	if (mdesc->reserve_lp1)
-		request_resource(&ioport_resource, &lp1);
-	if (mdesc->reserve_lp2)
-		request_resource(&ioport_resource, &lp2);
 }
 
 #if defined(CONFIG_VGA_CONSOLE)
diff --git a/arch/arm/mach-footbridge/netwinder-hw.c b/arch/arm/mach-footbridge/netwinder-hw.c
index ab17ba916d47..6a4f15526189 100644
--- a/arch/arm/mach-footbridge/netwinder-hw.c
+++ b/arch/arm/mach-footbridge/netwinder-hw.c
@@ -616,23 +616,47 @@ static int __init nw_hw_init(void)
 
 __initcall(nw_hw_init);
 
+/* The NetWinder never has lp0 or lp2 */
+static struct resource reserved_resources[] = {
+	{
+		/* lp0 */
+		.name = "reserved",
+		.start = 0x3bc,
+		.end = 0x3be,
+		.flags = IORESOURCE_IO | IORESOURCE_BUSY
+	},
+	{
+		/* lp2 */
+		.name = "reserved",
+		.start = 0x278,
+		.end = 0x27f,
+		.flags = IORESOURCE_IO | IORESOURCE_BUSY
+	},
+};
+
 /*
  * Older NeTTroms either do not provide a parameters
  * page, or they don't supply correct information in
  * the parameter page.
  */
-static void __init
-fixup_netwinder(struct tag *tags, char **cmdline)
+static void __init netwinder_init_early(void)
 {
-#ifdef CONFIG_ISAPNP
-	extern int isapnp_disable;
+	int i;
 
-	/*
-	 * We must not use the kernels ISAPnP code
-	 * on the NetWinder - it will reset the settings
-	 * for the WaveArtist chip and render it inoperable.
-	 */
-	isapnp_disable = 1;
+	for (i = 0; i < ARRAY_SIZE(reserved_resources); i++)
+		request_resource(&ioport_resource, &reserved_resources[i]);
+
+#ifdef CONFIG_ISAPNP
+	{
+		extern int isapnp_disable;
+
+		/*
+		 * We must not use the kernels ISAPnP code
+		 * on the NetWinder - it will reset the settings
+		 * for the WaveArtist chip and render it inoperable.
+		 */
+		isapnp_disable = 1;
+	}
 #endif
 }
 
@@ -763,9 +787,7 @@ MACHINE_START(NETWINDER, "Rebel-NetWinder")
 	.atag_offset	= 0x100,
 	.video_start	= 0x000a0000,
 	.video_end	= 0x000bffff,
-	.reserve_lp0	= 1,
-	.reserve_lp2	= 1,
-	.fixup		= fixup_netwinder,
+	.init_early	= netwinder_init_early,
 	.map_io		= footbridge_map_io,
 	.nr_irqs	= FOOTBRIDGE_NR_IRQS,
 	.init_irq	= footbridge_init_irq,
diff --git a/arch/arm/mach-rpc/riscpc.c b/arch/arm/mach-rpc/riscpc.c
index 14d78b7f9493..6d764a660474 100644
--- a/arch/arm/mach-rpc/riscpc.c
+++ b/arch/arm/mach-rpc/riscpc.c
@@ -16,6 +16,7 @@
 #include <linux/serial_8250.h>
 #include <linux/ata_platform.h>
 #include <linux/io.h>
+#include <linux/ioport.h>
 #include <linux/i2c.h>
 #include <linux/reboot.h>
 
@@ -185,6 +186,32 @@ static struct i2c_board_info i2c_rtc = {
 	I2C_BOARD_INFO("pcf8583", 0x50)
 };
 
+/* The Risc PC never has lp0 or lp1 */
+static struct resource reserved_resources[] = {
+	{
+		/* lp0 */
+		.name = "reserved",
+		.start = 0x3bc,
+		.end = 0x3be,
+		.flags = IORESOURCE_IO | IORESOURCE_BUSY
+	},
+	{
+		/* lp1 */
+		.name = "reserved",
+		.start = 0x378,
+		.end = 0x37f,
+		.flags = IORESOURCE_IO | IORESOURCE_BUSY
+	},
+};
+
+static void __init rpc_init_early(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(reserved_resources); i++)
+		request_resource(&ioport_resource, &reserved_resources[i]);
+}
+
 static int __init rpc_init(void)
 {
 	i2c_register_board_info(0, &i2c_rtc, 1);
@@ -208,8 +235,7 @@ void ioc_timer_init(void);
 MACHINE_START(RISCPC, "Acorn-RiscPC")
 	/* Maintainer: Russell King */
 	.atag_offset	= 0x100,
-	.reserve_lp0	= 1,
-	.reserve_lp1	= 1,
+	.init_early	= rpc_init_early,
 	.map_io		= rpc_map_io,
 	.nr_irqs	= RPC_NR_IRQS,
 	.init_irq	= rpc_init_irq,
-- 
2.43.0


