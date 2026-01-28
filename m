Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EA5D46BFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F9HezMKTEaGVPPyjWsbKZwsTZraFwywQfjSl+q2oLo=; b=Ooq9EygxQ08n9csbwS4fVDLh1B
	cdd/G6uJIt0MKm7EHrRSI+9AovuEFm0ghownS4oLkc43UEbgl4Ieb2Qz2HezhIfDnuwH65Axf0lWu
	e8yaDFN+xyDYNhW7gGraoJ6nIQSv2Xfe/Va5ETCnPCKAQSLyqR7R+3zkFIPd/Lwi8dEzLyHPecQcP
	nwYOQNLmJZmee51FLDEIWvYyqx5DwbQrQAD57OHGfgO8eqwCRL2rG/Dw5xOHZeReeM2RwAZxIrLRf
	3QHig+rL/RwpuqpKip03pJyMcmjCkLUVXEOxoaSumL66e2LbpA+AOVbjScxR8U3rl1fePxEURlZyT
	7RbfnHIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCG3-0000000GmGv-3rpR;
	Wed, 28 Jan 2026 20:35:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCFt-0000000GmBd-2HZ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:35:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so216225f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632511; x=1770237311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3F9HezMKTEaGVPPyjWsbKZwsTZraFwywQfjSl+q2oLo=;
        b=XEHq1sYohJv5OVVmfm7bmjpAiUczFAI3ngMIVV8m2fLeN/qwKhfsOmnkkaj4uG98rR
         RKqbYz/GnWaPa4iOCAINt0/pqIFTfLVhMAZzqzF3v/3dDxeLzLIa+AEVoLNIqYfQbcJR
         iQyKhI7c01xpdN1b20iEihP9IHCH0LVFyg8vE3mTA8QzRdEyerVhZYa9vYy0o0rVhZAD
         avgwsT4/8crdSupTKV94h+ppZtba16BuneQvoLc5wkLuEzxjJ28jrHtzcvG6P8PiUWi4
         WKwz0Y5tbM1wqQwXRVWt6K+GqfBuzTcB3f/HHe9Fc4swUZd6HQc3eJ1yse0OnrmlaICt
         NS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632511; x=1770237311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3F9HezMKTEaGVPPyjWsbKZwsTZraFwywQfjSl+q2oLo=;
        b=Mraz2Joq4PRA2yq/rbofNQ66oUCZVHnU6MEGBh9kC3x2VnNU1zzcZ0u9D/q8OVFGGV
         ShSHzzpQMfM7J7VKXG/XbcqOND+spBMUW/j1er9Mu1jEUqBwI49QoXibVnSDGB/mA2up
         772ZTZoWFDJ+eN/tYL+gufnEsGG8SuNuUVVc6+A2nBQy2P3tXtX9ymAKomXAfmj7eyLC
         RUgN5+GCkZa8kjcmVoqhEJp6QDsD/6XV0kUI6gnR8OU87NmC/khDzgZTpw68IN0tjAvy
         MmvZRUw60/mAmAcc6U4mJ3gWMP/WPnYOK0fHHDqryiY1TBmWoTO2qQihAmEXX0vhFjmm
         aH5A==
X-Gm-Message-State: AOJu0Yx5yOcr42/3WfwkeZPqhkwnONjAQ1++us8SKDqv3blE+PyxcYbe
	iOF9dC5wA2Dt6rNsBqdR2/MHLxU77ZIxEioZLEmsK7mK6xfrkn6X76UxyQtbbomx
X-Gm-Gg: AZuq6aLg5rIgajMdaPlKP61z+TqCfgJYwrXzaS+vObxddKjuY8khp6/4YO/bagE+EW0
	WOT0GP/Tux/mmO2wdtEDbveNKF9hyLq/Xuoe+JcrDutyR9+VaIio6HKOvp9FRwGRUZFnKCV/G2Z
	HBPlyqbwB9v7pJbUsjc1qnvjSi/xd+kI22IHV8c4NDNLGKHcNCTsvLEG2cXuDwPpfpM2wu/JgdT
	lPl4ZtH4g4G2J0clEwKQQvOcEfe+a4uCmwizMDigkY1Z3j/67Kfxv7ZKOxNTVOfZqp1vFPsvSfd
	YTao3acKlM8oDA37JrT9FmZlPDaz93nGK62uzQjK2SSiLRL6WmU+/gRngdIFtQQGNmvZDHsiMsB
	Buwj9NfFXyNEYVflMWbWhdcvFMCh/d5GRj7zfhrvlOui/OUpjPOaEeOHnSGGskTnsncoivcJ1N3
	eFgRrrWvNvsvNNvsAiF4NQq5Q5
X-Received: by 2002:a05:6000:2c0a:b0:435:a258:769 with SMTP id ffacd0b85a97d-435dd1d380dmr7717968f8f.59.1769632511430;
        Wed, 28 Jan 2026 12:35:11 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:11 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 4/7] ARM: zte: Add support for zx29 low level debug.
Date: Wed, 28 Jan 2026 23:34:52 +0300
Message-ID: <20260128203455.38569-5-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_123513_597567_452E6146 
X-CRM114-Status: GOOD (  12.31  )
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

TODO: I am not sure about the virtual address.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/Kconfig.debug         | 12 ++++++++++++
 arch/arm/include/debug/pl01x.S |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 366f162e147d..98d8a5a60048 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1331,6 +1331,16 @@ choice
 		  This option selects UART0 on VIA/Wondermedia System-on-a-chip
 		  devices, including VT8500, WM8505, WM8650 and WM8850.
 
+	config DEBUG_ZTE_ZX
+		bool "Kernel low-level debugging via zx29 UART"
+		select DEBUG_UART_PL01X
+		depends on ARCH_ZTE
+		help
+		  Say Y here if you are enabling ZTE zx297520v3 SOC and need
+		  debug UART support. This UART is a PL011 with different
+		  register addresses. The UART for boot messages on zx29 boards
+		  is usually UART1 and is operating at 921600 8N1.
+
 	config DEBUG_ZYNQ_UART0
 		bool "Kernel low-level debugging on Xilinx Zynq using UART0"
 		depends on ARCH_ZYNQ
@@ -1545,6 +1555,7 @@ config DEBUG_UART_8250
 
 config DEBUG_UART_PHYS
 	hex "Physical base address of debug UART"
+	default 0x01408000 if DEBUG_ZTE_ZX
 	default 0x01c28000 if DEBUG_SUNXI_UART0
 	default 0x01c28400 if DEBUG_SUNXI_UART1
 	default 0x01d0c000 if DEBUG_DAVINCI_DA8XX_UART1
@@ -1701,6 +1712,7 @@ config DEBUG_UART_VIRT
 	default 0xf31004c0 if DEBUG_MESON_UARTAO
 	default 0xf4090000 if DEBUG_LPC32XX
 	default 0xf4200000 if DEBUG_GEMINI
+	default 0xf4708000 if DEBUG_ZTE_ZX
 	default 0xf6200000 if DEBUG_PXA_UART1
 	default 0xf7000000 if DEBUG_SUN9I_UART0
 	default 0xf7000000 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART0
diff --git a/arch/arm/include/debug/pl01x.S b/arch/arm/include/debug/pl01x.S
index c7e02d0628bf..0c7bfa4c10db 100644
--- a/arch/arm/include/debug/pl01x.S
+++ b/arch/arm/include/debug/pl01x.S
@@ -8,6 +8,13 @@
 */
 #include <linux/amba/serial.h>
 
+#ifdef CONFIG_DEBUG_ZTE_ZX
+#undef UART01x_DR
+#undef UART01x_FR
+#define UART01x_DR     0x04
+#define UART01x_FR     0x14
+#endif
+
 #ifdef CONFIG_DEBUG_UART_PHYS
 		.macro	addruart, rp, rv, tmp
 		ldr	\rp, =CONFIG_DEBUG_UART_PHYS
-- 
2.52.0


