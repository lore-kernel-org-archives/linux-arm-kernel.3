Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5449BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=; b=c+e1MKg7ekREqfOBX6O+E8R1uj
	GFr7kV3ju5Qc6I4+rLpBgTYeKZC74xZubU34oUOKHY1E4ISw+omFDEepSOCzwE/71JcRxKcuMkMOO
	AP5+q4iFsCbWdMaWxqcK3uf53G3qGPZXaF3twQEdMxR0w06ONI6Hveq5yraNOmjBwaNWyCMfMvZZo
	BCooIOM2J6bAWmZCia3wtOVK8FWnr7FZ2zjG5+m26lZ5IIoXGpOPjd9flWXWg37mRSgWbR3qyypUA
	l6GOJ9KDC/XMULKoZPlCWozqkEddyk4pkRI3/O/MZcvJKbfxxO4Rg7Fhh/Ed2sPqcetwNL/KObfix
	Vj6vxJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMc-0000000480y-1jJB;
	Wed, 29 Apr 2026 19:14:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMZ-000000047zK-2ozy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:14:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-483487335c2so1181015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490062; x=1778094862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=h+iPdMrbnOrjrWZBymDI9jt0oFt+aeX31JoL73EUGt4G+LW/9+NO7KNQw5NK9ck/12
         TQielAG4sCo82PYqzfOo7FedZR3zKG4J7mULEohUoqhLHC51cE9TtBRV+v0GMWOY9n6d
         cJGKqwh6FVxbecIIfOzkmMAH2i481dC/Ljkl9gctTjMz+90EhRQURNqgFMm62iinTBCf
         EgH8STlNbhTEktQB97auprnE0tHF9a06aHWCnqB5gEAO8AOsl4eteHU/OZfvQc8XTLT5
         rOLlaioDvGmKOWn+2CaA7YefQuVty9LC2aK4BWZ2XyGkQ46ANpmHuq6ym9Uz3VOdCujb
         wNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490062; x=1778094862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=jN56Z4nDX0zBDsYvKMp9KsrzDHM0hieaUUjzBQVFa7BJI/bAFEJrdPDC/AEZsPCsG+
         tZ2PfMgdv4IbPQV+Omk0e1fZIR9xXT1zfqpPoXTeVVkqBD+GK3GDjNsPW4e+VYbx25oD
         oD1Yd9rvyD739uVRqUu3UohMYq1M41c9NHPZ5adNOtJGJjOpY2T+/g/mv4rSBwXUp9bu
         PuY5ViQQ35y/Lv/Kke3K9lF2clcXFsH0ZM3aTKplo4p+2en8yvg57DVUpRVSE4VHkbgI
         8Cy9MIxJd6LhmhXImv6iqx800IUr60Pr7T0yHQrGe2bNtcNV4jKtAM4xgznHHXs/b9jd
         Ey/g==
X-Forwarded-Encrypted: i=1; AFNElJ+D/Rz1POvzKzSFVN3bOEQS5t8lzt1dzLRCe7mkxgpLspLMtB+MIm94rnosuq7NMJC6C6CGwuLQV8wOW1KW2gtq@lists.infradead.org
X-Gm-Message-State: AOJu0YxRnwKa7k7vCkBUe4alt0Sa1Tm9CgP/s+KNSAdupjHvQvjF9dVQ
	6FubPmXyK4XSFdNIlMj6dJmqCUi2rXDiC3CFhZD0FyxGewAtadsd0/d6
X-Gm-Gg: AeBDieuWfpw+mb6Nnds7xoEtAqtB6ghyn1wt3f7tiI+ac9hqBGUZOXnUNAWIVhu/oem
	AufxvHsbEinkj9wXiwJVVlp0xjTdZdcuar7jSfxJ6TPUxbZGThtzvs/QTlQHp9RjcKVsX0rOBaI
	dTKi2bk95DUNQTcn7Hl/h3ja0cp3KuxulLov3M2POri51MBGbuayux5knAZ7Oyh5uOQPudJvHsi
	oAMaPzPki9QPuj0FZkU0SSYHe8y68tyiW+8jB/I0C2jLQsRSX9JEYX/cX8U4IuMErCBTK8NCw8W
	1mVFVuxkl3SDHMYJ67ib7ciB3ukUZdufEmiT4aWUaxyVpffpVeWtf4YFbQRDDQpZImQM576arjo
	61yTVtmB5QbyFHfBy1aDfGt7Mt+lNc9jKjUccSXyOQJYax+T6WsPXlW8I7T05rSPM4eNM4y0jTI
	1fF0NRfG8WzVOS2pkknj8TpQ+mG59Q0oGWtPxJYc4wbndcz8QcUK90kA==
X-Received: by 2002:a05:600c:3d90:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-48a77b1781cmr145135425e9.17.1777490061506;
        Wed, 29 Apr 2026 12:14:21 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:14 +0300
Subject: [PATCH v7 3/6] ARM: zte: Add support for zx29 low level debug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-3-b432e00d2db8@gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-0-b432e00d2db8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2630;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=M2o/Qr31tdSVgMGK7MGptHsdQ8CYwaC7nU5G71DmAdM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1uHld2kPX/8v2HJbRvy3ZwFQDa0OSTcuv+
 3Kf5aBkmCiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLcqA/6ApdrD8oX5RPE4JAHnJAWFBos5HFL/o2
 XpNBXS+K9DRL+91EY4to310L+6z8TQUfVqrk6vT7uP51Htp4rLo/uARsSbhPjQy1cNh3ao1SJDE
 QSKaiv7L6V28sOG3uZuFOr8tv0vpjoIeYnquTU0Gatryy6thQB8C/MkegTMkAnAC6cxYcHt8OD/
 b5r0sKjrMOJW5th8V6XCxmGEM284cWRjPuVCrhHf7+hBLRzu6eyMJITtCVq/PwWc6ORnu01LuEP
 tFBEjZcpB2AbeDG+Jadntjmrnnlw8UYCHth1SgL2z6Dp+HIqj4xUPu+cLoZiY/QpDHqW5bNyipa
 IrwZqC5FWMt+sSEHGAeTOaLIlgvbGgFrVX00vAk0llThQglR2tPjYi7LxhoF9w2OOc7DhaGD2uB
 vVM2bxL0GQxUB+O1ksEb4lW/cuySwq9iTj1xmwTncmyq/YtwpXrLybTkrMx6/Qg4ThWwsZqNnn6
 irosXvwUcEXciS1mNGEz8hhwrVmFo4y8q/vyn+TV2GMeLIH+lqeg+v2aC1JlY6mgqvR3y9LGLxB
 huWQ2AZwCam0n0gUIZj7xS+yXFhQTxgjPGbMsjhGqVh5leaw4Rvft7M/rnjjBbQOy3ALyM8WkJy
 8A116eIV8pRrCb6eTl0JrllUjOb02B99OzBB0OidNpqj3+C9ANvw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_121423_753181_200BF09A 
X-CRM114-Status: GOOD (  16.21  )
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

I am unsure about the virtual address. It doesn't seem to matter, as
long as it is a valid address. This address is based on the old removed
code. Is there a rule-of-thumb physical to virtual mapping I can use to
give a sensible default value?
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
2.53.0


