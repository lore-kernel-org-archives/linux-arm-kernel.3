Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D052CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 19:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=; b=ZKA/bDEWyYrIauD8jDzpzquVPo
	9bizpRVzPKac7AIVYEyfQ9G3qFBKmTCTX8s2/ojKr1zRnOGO1ITthlFK072kMNIznsI8F8WektTmB
	X6ks5xXfxLaZIIjwRC7cSddRmCY6RsHEIR81Mrrlk078PnGlIKGYokQ8G7p6fvSl9L1yiXNgfmAJb
	z3NhZAaycHThZO5n91maR4nqK44mWIlCkg6KsG/bJCAp2cuZTOLrDey3Rby43ac6X54G+aA2L9bXk
	2ftmgKe/SLr4qVDBaa49tbhI66LklbtRFE3d00Mp+Sumh0u46FDg4GP9w4O44sYwIxAK5sBZIFcPH
	Bu+ajSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0Y-00000001t2q-3WFu;
	Wed, 06 May 2026 19:34:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0V-00000001t0x-20WY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 19:34:09 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-44c350a5b87so49417f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 12:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096046; x=1778700846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=;
        b=iDVE9di0agLQNijnyoFVsbCp2UdLubSDWLXZEQINnvr5y0VTK0CaeYl3GrRYDLq95V
         wFwRw97tsWHJuyb1UDnkKuoOT9sm8Bf5YirOuPmnseGsetyy+RxIHRz+WbQJvW+dA3By
         bx7VtGZxjKoFD3ZzTgvIDtwTuAaqL7u3a4O1cs8ew/jgLNqGwiu498YiK90NIYelu92J
         LnpDT3nO3Q1hH2HobwFKvbAbOpHVk0vyHt+SnSVh/5zr7W4JJ/L6g/DVlaGJfldqPC9p
         QTrl1CTKqSivOaGLA4JMXru0rESd5HSnwkMuyzNWgB7qiqW50LTlSEwW81vnXID5J4un
         jZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096046; x=1778700846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=;
        b=Xh/3gWipSpIIAnemng6nCKUrTdNb5BWw4f67i2wdg93z+iZoHL5feWaeJLZNd+EC2o
         AvGFdMWx1UATe9+P0m2OjvhKPxy/8z/6zIztL8W576Bn2g9+Us/JcgPtKLeF3iaWTXZE
         5KYDwLw20bMVQgVKSyNLjfjHt5tHe4fjJa/sS6ryFBwZGuLmpbJbHHxt2pm6l3QjWqtG
         ygfl5aRWFmWWXrjCGt+3mik510QYzqhSt7yAuatS6w5ltKth/it8W4q5InIYjCCVBSQE
         mb7YuiPlOu7NGZoZ3km5m1V7t0Okc77CaClvs4phd9e6gp+Mnb68Z7oLD+0cfJ8EKET5
         FaKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YFbSRLDUVpwkU/Yt3vhP0rdcRZ+0KrQVJcndMGjScOUEzmQTLTxXJPgrUAoe2JvEqp8NE0CjV0AhTNaocfoA0@lists.infradead.org
X-Gm-Message-State: AOJu0YyTvY6ywBf41J9Hw588BmbuX5A0xCxTaN/xFYiyGAOe9pq+VZpc
	s5AKhWGBIaarhbsqtRd78f5pXarRmJyEN1Rq2ogPE7ZqmxB2jBoYay/7
X-Gm-Gg: AeBDietRI3mZy3Zogpub7KI3I4zljHpwbJL8cETcgi43iinhAMQwJITNAIhqHMKngvs
	UlT2ceFjKjqk5NwARjQvvGAOI1j3HljCdN0Uec4cjRxnLOEmCygmEKsAhAVmbXA+Dw/6dWvnibr
	YY2GyN6vk7mhVMQgWPOSbiatBuHXSyNy01WTqX8s6Ak2uSZ241tEsR3OHS10WRBKn1eFdgZrRJI
	jJYXVSHNecnJx3TLVCh1nmyhi/pymESGOEFeBNmAXIG6OqmGovlYDa4VAQOjHz0xRuYc88G4u2e
	QGNQ3JbrplWju/v0hdhHKwhEzvBJk6/7nslfesTjtZFvSghl0i312KZ02ZVDpfXFzsq057tutRJ
	8Myb+QubtvIwLyIWh4+DqUZ0CKDRR/iJEA5vwFLqyMWIYCVqGYSJMq/KGJRXSUT0JRR9gMe0u5q
	0fkvXTzLBAX78FiN1ieexsHqW1xptBkmom7PWGoEJC1q4=
X-Received: by 2002:a05:6000:290c:b0:43b:4982:fc73 with SMTP id ffacd0b85a97d-4515c57465amr8159966f8f.25.1778096045780;
        Wed, 06 May 2026 12:34:05 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:05 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:20 +0300
Subject: [PATCH v8 3/6] ARM: zte: Add support for zx29 low level debug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-3-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=fcg5dGJNBAQyU4b2cL0nA3wqgVJTqz/EfkeGsaL9qZo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eWHMnqBAGLcyW54UYM1CAyGLQMWIHuikrQl
 y0IeI0wWVCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKoNg//WNV3zil9essnB/1w2NGojHfI3ct0p7k
 s7kK2TKGuBVgMsUetJH7xCF8c94Nm2AUnnEPsAnWf2ORenjfzAdvqtuDTw7JbVtCCtEoMnm8JwF
 GepqzU6j4p4z9t1hiNP615EHi0cY+N435sJnmOvXK/+WPKwThqx7rCFaakJlr4TdvuxULALOOXx
 pdqSI0dvr8DzynlLLQyc6nPmm0dGtNAZ31NkyoavEiDa6CnoZJtovW4U5OPyp4RS+NNHj+Et3ln
 Yw1qcLBkhYr3KpmzA/qxpFUtgrP1XOxuJweDcPJT0RB9I3UBl/1HpTYmt4uNEIB6QuwDaV1yjI3
 XWPKMwZ4NjPb1uuM2Y+ioJTzAxewvaXU0R1WTmsnnOU3U1qnvqfIpnIcHhP1c6kQi+IXnNyAAnh
 /TBWYv4ajE5JdtAAr0B12Ordg/FiOMm9DfDnhQnlNUaM564a93xn1iMFnH7df8Rk99mIL3kwiEf
 p01lGtGtq+w6+I0gBaDGzzgur+b5yxijspBSodKyeddnGLtUiT05+yWRkvPSJ5fUeasctGdRBQm
 O8+Dx/rgTRRYlBL+rOf5UeDw1v01Jd9dz0HokUTWomjidhZBzCYQCQjeWHWw0e1zxzPPJgugrwD
 ZHx/OHabjruoyJ6LFV/e9OCJiEfpbi+049Ae3I/wZKG+qjcNqHbc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_123409_519547_BBAFBAA6 
X-CRM114-Status: GOOD (  17.40  )
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


