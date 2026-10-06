Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172D9CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 18:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ar/VV4eH1ZqUnOwlJtczVgmAE0kD0KjVUmWIjZnSdG0=; b=XF9h9/nV25hOkJ7sc4fA3rypST
	l5tcw7RaDYeTmlimTovlNrm3DncdST18gLgsHD9yj2Sj7+6SCwOGHp2U3dcAgfO4hqZFMO3zdmbns
	luXZolUDT5PZn70prQNHi2eIxCnylcGMk8abxcwkd0iaK+IQrWx0mOeLxE/83mC/Z2uxswLuuqK/I
	MZDH9I8rIcEhFdi6KPTUD3EFkDKUtWBI39lY4dc6gdupWgFprwCQ+uJt6vgW7Y20ZCGrpQaiyLPkj
	UT+cFSy5Qia5p8DwY1DgjE7xEBHaMiEJ19kmrUPWF1/a14EpLrvQ0PqQRCh5ftgBIeV8d00dWAlC9
	tvklbYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9jY-00000001FRh-3iB4;
	Tue, 06 Oct 2026 18:17:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9jT-00000001FNQ-1wI5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 18:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9524D60A57;
	Tue,  6 Oct 2026 18:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A8A8C4DDE2;
	Tue,  6 Oct 2026 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791310662;
	bh=UzEBDEHfVy+WOuCFAGaEOdUlg/RIHGHpxjp34Z+HMMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bsBIvG6dzQgQpG+Q3sfS1LIbl8Wf72SuoWPl9k3MPaNkLXnwNMtcOTonnJBp5g0fy
	 BK9pJKCSAwNmTTetDHw48nnYgxBVQS0df4x44hCjW13GK/u2yVzhSVb21vk6EsrQ/A
	 cCvtbQSrs3Z+OeRKVmxKaz6xWjOS7ARSBlmlUg79wVWy1HzMh9DNRsOeiiNLiY2eFj
	 fRAFNzRJoUp5pKrf08qoTtrBPafaU4ptvCIOHSR2iGEpWJ0sN5N6Uda7I/VM9ZTAk1
	 yRVzlJRJFs70gsHnH+k57+bUTBLhJqiTeXuJgkyqR14+TCXb3Trbt8mOZV5u1/RnCQ
	 sAvOIu48XhxCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1817ACA5FED;
	Tue,  6 Oct 2026 18:17:42 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 21:17:43 +0300
Subject: [PATCH RFC v2 05/10] ARM: debug: Add Cortina Systems CS75xx UART0
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-cs75xx-v2-5-b7d6e1e24d44@gmail.com>
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791310660; l=4427;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Zo/6T8SKoOQQ0VdBYBvVe6/uEblGio9R9J0RksxWl1A=;
 b=57P8DUUB2CKtTxHhNyjw6mPJNPx/hQpcLVUVjPMVMm3RXtxcOMya2uqCo1Z0SrCSo9DAOnPQj
 gMVxmWbYCCAB5H/ur1OwsXSHmdVxKwOvqAQE5E5bngjk8F7QU3ct55f
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

Add low-level debug output through UART0 of the Cortina Systems CS75xx
SoCs. The UART is mapped at a fixed virtual address by the generic
debug_ll_io_init(), so no platform map_io is needed.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/Kconfig.debug          | 16 ++++++++++++++--
 arch/arm/include/debug/cs75xx.S | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index abcf14f1027..c43fe288b98 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -308,6 +308,15 @@ choice
 		  Say Y here if you want the debug print routines to direct
 		  their output to the second serial port on these devices.
 
+	config DEBUG_CS75XX_UART0
+		bool "Kernel low-level debugging messages via CS75xx UART0"
+		depends on ARCH_CORTINA_ACCESS
+		help
+		  Say Y here if you want the debug print routines to direct
+		  their output to UART0 of Cortina Systems CS75xx SoCs. This
+		  is the console port on the Securifi Almond+. The UART is
+		  expected to be set up by the bootloader.
+
 	config DEBUG_DAVINCI_DA8XX_UART1
 		bool "Kernel low-level debugging on DaVinci DA8XX using UART1"
 		depends on ARCH_DAVINCI_DA8XX
@@ -1531,6 +1540,7 @@ config DEBUG_LL_INCLUDE
 	default "debug/vt8500.S" if DEBUG_VT8500_UART0
 	default "debug/zynq.S" if DEBUG_ZYNQ_UART0 || DEBUG_ZYNQ_UART1
 	default "debug/bcm63xx.S" if DEBUG_BCM63XX_UART || DEBUG_BCMBCA
+	default "debug/cs75xx.S" if DEBUG_CS75XX_UART0
 	default "debug/digicolor.S" if DEBUG_DIGICOLOR_UA0
 	default "debug/brcmstb.S" if DEBUG_BRCMSTB_UART
 	default "mach/debug-macro.S"
@@ -1632,6 +1642,7 @@ config DEBUG_UART_PHYS
 	default 0xe8008000 if DEBUG_R7S72100_SCIF2 || DEBUG_R7S9210_SCIF2
 	default 0xe8009000 if DEBUG_R7S9210_SCIF4
 	default 0xf0000000 if DEBUG_DIGICOLOR_UA0
+	default 0xf0070110 if DEBUG_CS75XX_UART0
 	default 0xf1012000 if DEBUG_MVEBU_UART0_ALTERNATE
 	default 0xf1012100 if DEBUG_MVEBU_UART1_ALTERNATE
 	default 0xf7fc9000 if DEBUG_BERLIN_UART
@@ -1670,7 +1681,7 @@ config DEBUG_UART_PHYS
 		DEBUG_RMOBILE_SCIFA4 || \
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_BCMBCA || DEBUG_ASM9260_UART || \
-		DEBUG_DIGICOLOR_UA0 || \
+		DEBUG_CS75XX_UART0 || DEBUG_DIGICOLOR_UA0 || \
 		DEBUG_AT91_UART || DEBUG_STM32_UART || \
 		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
 		DEBUG_STIH418_SBC_ASC0
@@ -1708,6 +1719,7 @@ config DEBUG_UART_VIRT
 	default 0xf7000800 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART2
 	default 0xf7000c00 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART3
 	default 0xf7020000 if DEBUG_AT91_SAMA5D2_UART1
+	default 0xf7070110 if DEBUG_CS75XX_UART0
 	default 0xf7fc9000 if DEBUG_BERLIN_UART
 	default 0xf8007000 if DEBUG_HIP04_UART
 	default 0xf8009000 if DEBUG_VEXPRESS_UART0_CA9
@@ -1772,7 +1784,7 @@ config DEBUG_UART_VIRT
 		DEBUG_QCOM_UARTDM || \
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_BCMBCA || DEBUG_ASM9260_UART || \
-		DEBUG_DIGICOLOR_UA0 || \
+		DEBUG_CS75XX_UART0 || DEBUG_DIGICOLOR_UA0 || \
 		DEBUG_AT91_UART || DEBUG_STM32_UART || \
 		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
 		DEBUG_STIH418_SBC_ASC0
diff --git a/arch/arm/include/debug/cs75xx.S b/arch/arm/include/debug/cs75xx.S
new file mode 100644
index 00000000000..967821add0c
--- /dev/null
+++ b/arch/arm/include/debug/cs75xx.S
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Debugging macro include header for the Cortina Systems CS75xx UART
+ */
+
+#define CS75XX_UART_TXDAT		0x10
+#define CS75XX_UART_INFO		0x18
+#define CS75XX_UART_INFO_TX_FULL	(1 << 2)
+#define CS75XX_UART_INFO_TX_EMPTY	(1 << 3)
+
+		.macro	addruart, rp, rv, tmp
+		ldr	\rp, =CONFIG_DEBUG_UART_PHYS
+		ldr	\rv, =CONFIG_DEBUG_UART_VIRT
+		.endm
+
+		.macro	senduart, rd, rx
+		ARM_BE8(rev \rd, \rd)
+		str	\rd, [\rx, #CS75XX_UART_TXDAT]
+		ARM_BE8(rev \rd, \rd)
+		.endm
+
+		.macro	waituartcts, rd, rx
+		.endm
+
+		.macro	waituarttxrdy, rd, rx
+1001:		ldr	\rd, [\rx, #CS75XX_UART_INFO]
+		ARM_BE8(rev \rd, \rd)
+		tst	\rd, #CS75XX_UART_INFO_TX_FULL
+		bne	1001b
+		.endm
+
+		.macro	busyuart, rd, rx
+1002:		ldr	\rd, [\rx, #CS75XX_UART_INFO]
+		ARM_BE8(rev \rd, \rd)
+		tst	\rd, #CS75XX_UART_INFO_TX_EMPTY
+		beq	1002b
+		.endm

-- 
2.53.0



