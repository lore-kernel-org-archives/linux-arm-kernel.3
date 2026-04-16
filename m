Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D66F8D778
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 20:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSeMkiWEZl5lsLoSz5tNKqauPZwfUQxEknHNAlawPhY=; b=0Guy3g+7IJtHENaEdWy6i1Fijr
	ckczDvTd3zzCqKYb0tBsoWJxgywykAdqQstTZBUVZlSkWjuvEJu9XrM560Q35iGUezPthzsGNgFlw
	4eSFkhvtGh84YmO95zGoA4w+TY2+l6wYho7/IaRpE9qHGLAKb6cPatwdcd8pWBdqrbo9HwHyRJCDx
	PRb85iEQNeIMgJxHyUWcTis0dyf3531IHaQEbhEMs9+ppsGEXmZnzRzlj67o2oFX5ltkv4gJ/1Hlm
	mdiP6YAM6sG3vla5GyG7roUTrs7Y26X/zN/YtVAhigaUNGxKlLqrfvx8wN+BjkDaFxOCxxfBLdnwa
	wrZ1y8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBo-00000002y4G-1RSU;
	Thu, 16 Apr 2026 20:19:52 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBl-00000002y1E-3uE6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 20:19:51 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43eada6d900so1925941f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370788; x=1776975588; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSeMkiWEZl5lsLoSz5tNKqauPZwfUQxEknHNAlawPhY=;
        b=c/91kGGXwyYHkaCceGxiKOGLfbftfaqb7acu2fuLW+qOvZ7sLB79X+lndDgxqwN1sl
         U0+WLMeZvcfu+stKWFcsaUVAO+hpvSDuMN8fagdlfT5GuJAjs9nBayKGicOFBqR1+swk
         fANY2r+vNTfLY4kAyxYsqQYdpmDiNrG3VwjhtNTTBAKDzCT8nniSsr/pAwGMieOC9jXj
         p2lZwOuZM9mY9hLa5XGxcF1x/HZ3L8mYIDdzRoJPlDpNOhfdg/K5yPLiBmeAtwkStdVW
         cUanWhOHcjFLe7I7TBuvpGxRirhuhwvSFb8wgZoyG3+CczAtObt+6MLV64s/5uoQLwjb
         +pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370788; x=1776975588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wSeMkiWEZl5lsLoSz5tNKqauPZwfUQxEknHNAlawPhY=;
        b=rQsona/Lko5u3eyGDKplYlMOMysi4gWz0tygcrWUNFUTVkKQDZnwR0+WBK9rc4DNys
         +f7EqvwIfkTSUq3OOlho8j74EebRnsYyDhmekRGB2fXSxZUaZAYjlILBknco+vwt1cA/
         DvhAYiJs2uFZvi21FyFDUy2TptxcXU7DvGf6WSJ1UBZFdQmiNqvxm/MhZD0DrSrRpVgV
         zHRxd2Uz0lGpvOzNurg4nUglWTndYc0/XXHHkRR1zQ1WABnb72wu5TjFL6k3QSkimfTA
         4kYdOzmDWnUPn6NsJWQ0YrqmWzzN2Zo94aCafRJVVVufv8muzRp5mA9H0Njc8SvwAQgN
         twqg==
X-Forwarded-Encrypted: i=1; AFNElJ9kki0aJ1UogAjc1tYoY9WNZwfShFEnTWxthSGU/e4XEGmnbN2h/TAXwtXezH5zPjOX1h9kG9Zdc2SOSF48XVXL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8gyN62aeZV0SmkZZh6bCvfGUr3TJ8ReAaroWU1B+hWhp7YWWp
	6nrAZVXAPmtvvlKLQQZduL3bV8v075lOf0UmmaHXj6UjXKG+UDrdLFf8
X-Gm-Gg: AeBDieuvU5fvRYlLOCgjCDVXkiF9ipr0TYtSJj9Apz7md74BvKHLLwIJVL9xlXEiZAB
	n8dF2U+nD791no6ti3v2+Wp+EAK7fojxMpJzNP1mw+/i0BATUJ0VcFqCdIGS+O4xUpNF7yk1Qun
	h3JH6UvApdpphG2GyK9Gg6XuxSfdJw4gI798ErzSGGSCbo3boyxg+ZNQtGoj3HFGf/WhkiT3Cnl
	O4dfJ/b8lpdfQrV84Cako+FlBRWfDBugHkKtUwPoxavSGNm+tz1qNiJTfGFcNvtPpYp243QpuUA
	DFTW/r1lGmm3GDS5BDvdJ7RPb5ccgKlinqfu+9XhLi7hBpdyvURMH8NlRqcTIgB9GEX6ItgqNP/
	K8uCV+MKrFvfzHGEtUEjWw3vDVRpnU5xoODGYNmKUAfE7DCRedagpHft8vbgeJrOp0yojlInILM
	ksRB7nX9X7tinwlZrU7oNWDnDnUKnm2adSLkCxxI5wbpUTtlaaj28jdwpV
X-Received: by 2002:a05:6000:240b:b0:43c:f7e5:817a with SMTP id ffacd0b85a97d-43fe1195921mr1194343f8f.19.1776370787861;
        Thu, 16 Apr 2026 13:19:47 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:47 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:12 +0300
Subject: [PATCH v4 4/8] ARM: zte: Add support for zx29 low level debug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-4-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
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
 bh=ZNDyS+awGPYyhYY2wqVY+4vd+g5xgcLu7pSNmzdrdY0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLRqhlAg7wWpuO7UM+dO5wr9IgPxdFB5P+5
 vUoUcclmM6JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLfbQ/+PTMWmPt4g6u+CTBldAZiNn549W+zIJW
 BmndZJRxXguEwhB3ZX5goKPHuPssJBq3rhN092lxHwvSXn35vpbcrGYbUf67MJ5ip/WEDtGJGZR
 2dCHfqfMl50SVl3FTA6qG7NvCBLpX6+ebr9+sPj0FV+k6pqPa98rK20AayB5d9TFT6gXgMNLvOs
 EGFfO4dkY2x/ARGjoK6hjhY6XhW5b5y0wb3krGYlJIzeyJu1/XT/yzFIRoqfFhAZ782Y2JsKTNs
 nwm404jlvcFrzBq0jHUUfW9gChxUN/JXodBTzlI6NxJJJIaN9IulGto94+7tGMcU8WK39Osegr8
 /G0nIqXZSFxtJGXjvelY8VcA2HatwQrZTgl5o0jBTrnJ/Pzm5y5ygNajb4BXVG88keAEzy6f7LJ
 gZl9dln23feYfIxn/+zNLAyYZGCI5j2auIhw0JiRpak9JTKgq89kOxKHfG4mubeepSn4AVUdq2f
 y44Pm2yK435+ZjyXoiwBBAZgz0wzphkmNAaagpOTM1A5eZb2wAKrK98gOR+npXoHaLVvGVmRfxa
 BVVrkRIfMit3Cb634TWiCg4kTPIBUHVGzKDHBpzxZOf52kOEir2VQszoar6+Xo6V4SHedZA+bNC
 iwy8mTcnO2zYDwCHJ7UdHGd9q3ZzWP45Bw8oVWlGPlnYehptsOHc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_131949_998681_43E68DB8 
X-CRM114-Status: GOOD (  16.14  )
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
2.52.0


