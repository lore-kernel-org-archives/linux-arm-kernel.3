Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4022FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=; b=VC7Z32gYrG2bFPuu4qxlfw+XK+
	bP0oj8RNPIN4MqP5ujAmSbs5i8XmpkUWvtFhIY2xXCbAToyaIg7B6Q7Zazhax6595xvOhbXqQxUCW
	TqaNa2J3jlokE4XY+guR1hsxiU87CbjfRBiqQ8khQVDSmiFY2Tu7o7X6y29C9Ua2w4ZwdZTOHFc93
	XDCc/Ef8xMOhFmoWAQMdBtIQ9ecGS0bhdg9VpKK+3XZ5AbxuheDiLGTcSRSKDW/NSj6QQuDBDeA8W
	On1UgNuzTpy2Nx9Pp+2MQ2FNPqbLU8t0tsg9A03LfQCDK+5OHPCEazSzq8/vj0H1yQYupi4Wo8qn4
	duG1O2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGy4m-0000000FVyO-1rN6;
	Sun, 26 Apr 2026 11:55:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGy4k-0000000FVx3-0ZAO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 11:55:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so45513935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204500; x=1777809300; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=Dd/jcM7tXlpxZcNXPVIVZdZGRJi5cLYDd/p+by50zzVkub89B5gsdkwFDqYi+vgIG0
         U53sj/XmXDWYla2129gvvtUX/+tklw/V2m9Qi+8iunGLJNTCuMFlhMcVD5XDWIgV0znZ
         vJwHqNAUkuoY4N09h8tt/iYylWDLV3cvYRZLTF4tPzaPuJ5UmYkAiFEX/7YQ2wyWHQtw
         bLavBkqnEsnqNdDJ6rW+9HbekCLCRuc1A3OHjplLCg8QMF5SfpQZ/01zbtXgnS039o+g
         Wu9hhedAEwNPOnwSg5BGxd5b8BHXjdO5yEJKV2NT4uVU+4QeM3CKu2/Q5E5c/9AN+VZe
         U7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204500; x=1777809300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=I/0/L1ODV+lINbdsBs0WtuNCE6V/n9KRoIrVGIUgEvLDGoDP+tYx8lrdQt3jEV+PAe
         FnPwHJbm5Un9oTQmYzWAtmBEp+GKxhSl3FTl+/z671Sdeh0b91Qj6Jo0WbY1NzvXleTr
         2FsAN6lX2voZnzpdJELKnDBU60BFu7P+g1HmpAKHS8mi5YewznsrDEA+x4kNVWHqV3GJ
         qPqFeJxfAPaabUFbmxpaJRBIPHrMtdSZDxt0xPkez562vXlJPoXhuZRHd7NfSDcQt0vy
         TGqJsey3S34uE8BgmAsicnQ2pSbO5W8YzpxlHMy3rFHtGFJ4NeHeZvR1CCkuZAaJpNZt
         TstA==
X-Forwarded-Encrypted: i=1; AFNElJ/NvWnEdyu8ytCpEU/wXslWjrVmfOAN/B3ejNIj9g+dRjUPKMxU0RJDBqCHIMU4+xCn8yZtOTE8hL0+d8wN8WI2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+kmL0OXbOePzcHg+wGFoAD9RaWlEwjEBOYaVyYfo+po9wWJFJ
	EBZXPpRP3Q//o4HxmHpnHQvNYWjgr2tEjNbUQBAgvfB3ozEHtDa87A5C
X-Gm-Gg: AeBDieu+4QfeOYZnElZbnacytSkVZOaiip386tmSgd5ciCzmtISd4zPd25dgQ7/xhJf
	6AlZT0TvfrCpmDBVt05IUIykfIJ0ijoUSGyH78AKJBvNdZGYuUVj+KE7uVLvSOUYmtzlBRvW97+
	R2K9XWvav7rRN3GMWpUEb8H8f/6UTXG5oRVjSIDVDxRORXUFlWMQ12cIBURGD+zv0oCipycvNwU
	Kjkl0JdviSuYVFqFtJDEozdV2SIpAiTG/fJn2oMYTDdBsuQFuSbzgouVcRG/w2hgDjq2y+vUVIY
	4eJUvqNDDuOpLINQIqSjorxH4xJoT5Yx9UfFXRYtRxpBULl3SmYAdch6La+ns65MGavhz4JTvQG
	pBWg+8O1j7g7SDY6jbJhA0zrNjsyNkVncb/kqQFborr0gZ/y95HFKc/ZwBVJCsExWr2y0IK/Gq+
	sH+0hkBpbAkkslUCpziDnCupmsy5te+iDAXs4foykR
X-Received: by 2002:a05:600c:3ba0:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488fb8b91a7mr505266375e9.12.1777204499997;
        Sun, 26 Apr 2026 04:54:59 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:54:58 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 26 Apr 2026 14:54:16 +0300
Subject: [PATCH v6 3/6] ARM: zte: Add support for zx29 low level debug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260426-send-v6-3-d49efa72bb09@gmail.com>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
In-Reply-To: <20260426-send-v6-0-d49efa72bb09@gmail.com>
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
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+JzGxmOauk8aKEVxmo6rh72jTY/V8V4KqY
 rsSLPEGRV6JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ21A/+PDdEZrFyDSxgwC3ikMTxEDtoXKJ21YF
 T4OgfXM5uzdBNtVEE2VXmoT8+onMkZ6FOHlCLXWOdi6tGbLpetAo6nyajSoscloMOPmDx6lDq6X
 NZIhU2RHcHS/AD09GyHqMtEGLfLMvphbRcDKIaiB6NNDLqnqidMr20pUDuZ5Pem3+0swtV/+o8x
 FnlitxZw8wAwtDKEvqr0/vzWmTLWUX2L8cf7EI9uTXmeDCYVLHgegg6v8QzxM/vnegDEuB1TVaV
 1yaVEyP/iZircjTa8uyt8CGGDcr0yJF2ikPhOEzJ8QC+GyeEqnyyykpbJ1r6kxCY8vEMcjGuPpQ
 liWg/2byZsoC6P+NQjfLd+ZFWSs5nV1TnNl05wdY8Vrz3srEYpV9TKmnHXi42R/riC1Qi/A1ark
 GFe/vhs+/1MWvXpYF1t+OSfKOFMlSO7xi3C8ecuhYbB2pDHPaFrjZNmK6eF4durdbCwguTDiKlI
 QlTBsIBIh2NqiAw0yqfYaTeCXJ9YmSOfXbBX7xqcaHaxVKobWvpBAixMWbb7G+1LF8Jong2SL5I
 2Q2HjehVhCFhqHEu6XiILZXXO/Bp4MA+ZZ6sx7A6UTDOF28td6/0oroVCFayKelST8ScOAU2c6L
 d/UKHI8icsM61yMF+feTpybi09g0e8+C7uMxKegPyWlWDNKSdApE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_045502_203644_94FDE64A 
X-CRM114-Status: GOOD (  16.03  )
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


