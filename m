Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEDACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=; b=Ds1PEsn4N7p0GlSYhiFUcNXWLm
	V2DIG9LL6DD+09DpFNJ1D9roEnVaHqb+UdtJIo1TrVeyZL+spiHWEkBTLsSkiG39YHjdJudhJt5iO
	cyv5ZDVoP3a/Jv2qnphmkig/UU23cu7E9fA+Rvl295hpM9tK8q3GQ5VpF7Gxlgd9kqGo3vtizqNXo
	Sc/qZDZU6xPYeTYbUrwfVdUpyC+dzctk9yRwtpIpAtYbeqHVGJK8KlMy20sAiC+ut23/ZzVLE/Acq
	CGNGVvgGZ3CW0kuJEGLuIOig0CU2eyOp7DTzJglxsSG1IcUqEiFFqQ+MqiuWlagIQbNkZSI5uKij0
	7EEyqArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHET-00000003q2T-0MXh;
	Wed, 13 May 2026 21:35:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHEQ-00000003q0D-1og5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:35:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so81264635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778708105; x=1779312905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=;
        b=iTBnDwEE2Aa+Cg+Vf/bJj5l6o836bTGSjt2z4iFF/zfs6voG9JqeTV4JXtKGHSnAr1
         aY3NBUSTnHXwazgPMJORqY81lySyW0HnpRJTSBHJngaxnMBT7igOgjw4+f3yTIj4237b
         tGU9Mqjwz27tfuCaixCm2h9yCQBLZYNxKYpXfUumsd73tEdi1JQlBETjhh5ii5gAAnWe
         k7jf7PnBq6H/txylKWwpJZZeex3W9dtIwxkAHt1tJqaM74EhtRkTNyHtbTWXt9WI201Q
         yWBT+OJtP/DcB7linsXrPDZDXPIIvx7uRfXCTn7u31CUSo/Ma67wTZo6Nmyb2UPM9Ph1
         HIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778708105; x=1779312905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=;
        b=RoLpx2Mr6GwUQ3JhnVRV5tnyZjDE/lLLUqkOLRJOXT6GIOtpeUJOylr9qN5Giulipd
         jtf9gwBFpZY6lHHQIAqgWIvVjCJ0M5m9l+Jeqvcl4ev8xRUKAA0HeSJ6P2Yz4U4NjcOe
         isU0tjyXUn/g06UvJ+58dZcyyfu7o2k8EhpeFFtB0qi+vLYSdLRF3rFEx7IaC7WBDmKI
         m59MO8I+i/VNchCh/qp/mVScypk+M7oz1H2P6XfW5RbPOPW/Ow8eMSNUfLIqyK5IEZQi
         LB9UbrbGjMbERLaNw8llrsU3F7wuyXJlxx/bJ1uUe0RV8W6dfgcfg3565G2JOx9bqoq5
         ttZQ==
X-Gm-Message-State: AOJu0Yz2fLF6UrfxcwvOEldc7qbLvguc6m/JYpfaaAm1KyfzPOVay2X+
	hCS80kC7MSTo4xt+h7ygSJEGtzxEyqOdeaLleUXMrYoXTOk/8hmrTQMV
X-Gm-Gg: Acq92OFgb9GQD34myvqvT4o9RBc/3aAQ9XNP48UGa/ynePzVvmR01vNWlUGy+iCbI8O
	Anqa9E5dB4KFWqCRLqvGCHUtzqJVmIwdjp8h3VsX5gU8Ng+cZfpNwnhBwqoHdmlN4paVYKDbUOX
	CYm0UWQly+GAzR397r4O7nFfOMftiC3Et67K27kiSy8lUBIMbT8Fr5C6dzljihHBRJFCJzBpcDu
	TqyN+HADqgHLd+p021FTSdkW0CdcatcXBAtORlse/tWUThGBT8k3JEh7PLU9jIuBwq/3BRXNRFw
	AJ9XAtTLQQ92CL0FD0MYlXk1ekWd/VZ6V4+lCEgVkgGDqOHv58cB338mVGd34AkXWdEkSV8szsq
	Fj64OTp5gxn311QukYRFMN0mL9LKNLkHsu+KoCo4q3OusPdAmT9aVQDPpSIujBKI/ybeTqt3y0y
	I0BOoGiKJjdOh0nccfHTfKfMUlVmNf++5LJYXKKW1949s=
X-Received: by 2002:a05:600c:4fcb:b0:48e:5d91:cffb with SMTP id 5b1f17b1804b1-48fc9a0f637mr70497135e9.10.1778708104526;
        Wed, 13 May 2026 14:35:04 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb1fee9csm2553055e9.0.2026.05.13.14.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:35:04 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 14 May 2026 00:34:56 +0300
Subject: [PATCH 1/2] ARM: zte: Add support for zx29 low level debug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-zx29uart-v1-1-68470ecc3977@gmail.com>
References: <20260514-zx29uart-v1-0-68470ecc3977@gmail.com>
In-Reply-To: <20260514-zx29uart-v1-0-68470ecc3977@gmail.com>
To: Russell King <linux@armlinux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=fcg5dGJNBAQyU4b2cL0nA3wqgVJTqz/EfkeGsaL9qZo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqBO6DHrxaXkARBemDDkrBXpRS3oDZcwST0k/6L
 QLZOUY6KB+JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagTugxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJwjg//XTrdw6+H+63UW2tqzNvWFZC4aWlyYUj
 gjO5KfX3MtxNMlzZPWOaHkRmJ6iIfTMtSzw0HVwWP8qpWmyauwAyXiVkiSb/cYBR+zTDOCKh8ct
 2O4/xKK/IxkSkqRJpZFZKUVxPHj96SwxDRx+XljqC2wPPlG2otentnHSTQBnME/vCXr21QqlX2d
 oMn/b3jzcNV5QL5RnBowJT0eG54v7ImmhvtP7D/NmVYP341gctaRixem8tVc5VNDcLZQCTUX6/Z
 jBZg7B5gOsBAe9367QIzSIYsIQ8mGWggHslNjUVnnCHF1wFVJBcfKFiGDa0davUavrGKwpmvLpf
 i93Rj1OnEPKMqp1LVXhgehpD4nXBFgXUSLaHSggtnRK5IdIfm9VHSX5VTGM/Gy4gSTxy70APCTX
 z0OpWcnd+RoFpWF0R2G7l07WtpRE/f1KdpogeWPz93/gK1+q9l5j6/1ar51/DFaS/ILJeQuokEV
 3uoOf4WZF24/O3/nm3WcdjLRalLqAKvDj4UWFnHVoZ7juBtaOIaP+7NMAyVduI9WJ0GnCHyHUC9
 tqjHKhEVWLebrkNuv4zFtLz5BmtgBbTyRhhGbMTJKIgdRDuMbNWq2Hy8XR7ZQpPXWwKx+VM2Jaj
 o1YS12nYo9yXnK3LtuDuvApaJ3Bb7g9H555OERinTF5PknMfisFk=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_143506_510336_698C6134 
X-CRM114-Status: GOOD (  16.56  )
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

This is based on the removed zx29 code. A separate (more complicated)
patch will re-add the register map to the pl011 serial driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:
v8: Adjust UART01x_FR_BUSY to match the different ZX UART registers
(Sashiko). I am unsure about UART01x_FR_TXFF and my boards do not expose
flow control pins to allow me to test if it works.

I am unsure about the virtual address. It doesn't seem to matter, as
long as it is a valid address. This address is based on the old removed
code. Is there a rule-of-thumb physical to virtual mapping I can use to
give a sensible default value?
---
 arch/arm/Kconfig.debug         | 12 ++++++++++++
 arch/arm/include/debug/pl01x.S |  9 +++++++++
 2 files changed, 21 insertions(+)

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
index c7e02d0628bf..9dcdeed2357d 100644
--- a/arch/arm/include/debug/pl01x.S
+++ b/arch/arm/include/debug/pl01x.S
@@ -8,6 +8,15 @@
 */
 #include <linux/amba/serial.h>
 
+#ifdef CONFIG_DEBUG_ZTE_ZX
+#undef UART01x_DR
+#undef UART01x_FR
+#undef UART01x_FR_BUSY
+#define UART01x_DR		0x04
+#define UART01x_FR		0x14
+#define UART01x_FR_BUSY		(1<<8)
+#endif
+
 #ifdef CONFIG_DEBUG_UART_PHYS
 		.macro	addruart, rp, rv, tmp
 		ldr	\rp, =CONFIG_DEBUG_UART_PHYS

-- 
2.53.0


