Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B6EF94CAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrKQc7l+XFg4iIUWlxu0BOHb3VOIwsvvvVOXDcvZfFI=; b=VBdPocCfRf5I888u9s+ZKF/lpB
	yuFqCbI031yB/ED6VXM5VRT7bMIuBrL7whYpNTnVkJPYDgOUER4EHQDpiNEkpLbSyNRp8QJ7NB/bw
	cjoDoU/tXmTA84TSIkVka14m+aNye69eltdTzZT4Y/iBrNkT4d+t6qIg2N0nMJ9t/7btLUfsiUc8V
	D367b7q9fcf5tl63TTxwcJmqy+7o2UQQzbCB2Y/D5lYcMuKNWo+B7qrTKezKOE5vJtQC5OafICJv6
	Awf5DT3ngzZZewO/7qNMsT5f2hIVkCwQQmF2frgRIsJ3yQr72SoohTW157xClnPRH2H18uWHokOdd
	M69O8gZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHdt-000000097ra-1Acu;
	Tue, 21 Apr 2026 20:24:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHdq-000000097ph-00jb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:24:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48896199cbaso47871875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 13:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803056; x=1777407856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrKQc7l+XFg4iIUWlxu0BOHb3VOIwsvvvVOXDcvZfFI=;
        b=hXd8UqGhMzLP2K6cwWm772vDr6j8oUcTy2Q61azPH4TP+8noHiFJGSHbM7LQ+51Lzk
         f5pG5exuEOsYm56vcVjEHATkoIlb14EeXt4MgysdCl9flP9AELONKd+iEUlE6/+ETHY0
         b9NpPyfJu/Y9iSRHK+Xby5F3OF99OOyRdXKwt3uWxPLN5KtS834De2gxiLISnmPePrUw
         rRfeX0phDfi6MpsUheYuqObEHveT5ZNPIlP7OBWFNBMXfattknFEOdrDC89u42lAmVOW
         acdlCklQtowINm4fFiXwKqOH9fioEQ+OyCRAQUa4h5b7f8a2oBUrD+n4H1Pp6DJtb3yw
         XbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803056; x=1777407856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hrKQc7l+XFg4iIUWlxu0BOHb3VOIwsvvvVOXDcvZfFI=;
        b=Huu/kqsJNbRa2zfeXkL7jSf4SidPQNtmL7bLS/wAOyPoBkxNSGvsi6sYHRrA9x+3fZ
         X7Mq5oaSdXLZdRnBm8XdsuiQLHDlOJ6TcO9ftJSh86XXd+zibOAVkfJxfqdOUx1T5bQW
         4Xl19YXxNY+7/cB3SZQzQN7Y3z6YB5lh4F7wvMnbV+mYUPkwQ9QF/T5ukQ1ItlyD4QrD
         d5A4eA5p2m/kp3fXRbSPvFHIWUjAJNfJJTr2pjxauykXCkl8Q3a0mQAISX7sZCDMLqHl
         nxS+SC2idPGUcKSfRvQz6VyZNnOtrZYnO4PmH7yCM+/vnj/4s7f+id+8A9fgzp8mclEv
         jaVg==
X-Forwarded-Encrypted: i=1; AFNElJ8PiZWNuQDA2vzYW2HKEYWWSHcpjwTpywA0JontGlWPs686mPgwsBcrjWfaB3HMywqsRHf8FVw86JFaXotllJ52@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1BGgft9Z5rtDLVF1G3927vp64GQ3ud/E73OI8+Sbq4CPd2VVI
	nID1qhnriPB7RY2r5HG08HjGQwQ7p6Jyz+M0myo/gejbRKc66RZq4o3s
X-Gm-Gg: AeBDiesu41Fimiz6hvbC6uLcU506lIe6NvdshiPVJnb5M2Mgz5Vkfoj78ZsIv8w4ggL
	+ISs2b+pKAvcbTwvdgOeIO4gi7QmlhCwMJi0R5fqpV1r6Tdfwb60Ygt4odiYuzPqAmkXcvudHTk
	CtX5XTBcuQ/anbiGRe+SLaFw0MOZ1Nr1I/AyHON7LxamyusTAkTRQhWjkve0NJM6IRKgRZw5YlI
	DFq6fRNSxyAPqMdqPFe9eNYgPpDhI/t6poDe12H3wQT6FrkDQ0OwDP5eC+fkJ9FKiSxb64Oei42
	CCqqU8MO3OXglcanI5iXawvDSRCcBMauX6/gHfdl0zmD3+EITMZiYfWyY/EOahuva3XqR/sdniv
	ZKPWX6cwC39pjrkNAhZhvWfYMRuT+7eed4ZObuMXk3w0Z+G2T/1I3+/9MUy0BXWcCyGoUrr/0AS
	9y6qnniTdoeFWDxjLdF/8HnI0FfYYvVlUZywDpukypeRpO
X-Received: by 2002:a05:600c:3f0c:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48a563cd16bmr52543355e9.1.1776803055952;
        Tue, 21 Apr 2026 13:24:15 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:15 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:12 +0300
Subject: [PATCH v5 4/8] ARM: zte: Add support for zx29 low level debug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-4-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2584;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=bcZL6JaMJmYjP1GrCucF3MvLsGgnYnN6AERlSCKFxuw=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zX4XZpqJm/bAck0HkLxUrrrjMXwXBe3jhd+
 SHDrsE5S+qJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJOKQ//cKJXPZhc6xj89Aoz835lqG/ynjMUHt6
 m+E4crpk2fLayoYewo/esnT1CN+EW18PmLWs2kxLtjPm7ivJsdINaSAt512JIMU+6Lk7RBB8ebq
 oQJiAjOmKStP5gNkjU1Uc6Ul98pwLsp/0nypp4W5wU6txNObDrPjy0YFxviB2gmzw0Qlnz+o7QZ
 gP2OP5ZOgnakYatT+mw1Fp7HxBEp7DkRBlnnsYzI9mIWqlrAJrEuW178f2GPHtb7SQ9WEmRgOLJ
 wAuR+UDtQ9QDLSRlx5ZLPsWRMDzcPJikQrqMnPUydkKOu6N/2s8XLrQANMzUFDt/Q5IepmjVcUL
 R8mIvJ2+AQNHo6GJ6BKEb0z/eeKZjymfS95I9KB7dr5ZehhWMmqu5VBxCjrTkJtW0osneBBCqPJ
 UJLk0Air00jviSGTxAQf/WTGI+bLFD2ETmiTG/sJdmtEQdPxRjp3kuhyTLMj8rYdcpKUJ6P9Gpi
 OkiPaqH5p+TiWQEQNgMJI16HYEwrHAmk1GJef/Adw+PX0Vb3AI+egyO3noWsqj+3ZwIigHOg0k0
 ATBaLiK0NtV1enGb6UP4wCPfXGpJZskWqSZk/2djdGBcDBhfuF1alsUWhz5wljPRhCFXFzmZ4uG
 NVms2xfe3dKoVbBFPyIkZi83bhOddBLuLbZUK8/QJ+sSTN9XrxEw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_132418_074720_1F94E360 
X-CRM114-Status: GOOD (  16.55  )
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


