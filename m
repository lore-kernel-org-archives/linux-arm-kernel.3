Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5E7F9D0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5c0X39kIJgvBs2ab+eu1xWvpYjk33YHh9n+898v8ZQ=; b=A4pi5aCnbjBVSJnl12Pvwzsu0j
	uc38dfwex8k5BMYE/5yT7TF17R/sgCwOT0rDq4zQ1rZKjWAg2isz66dp08FeAUf1gL59aXl83OeIY
	xT9s5834ZDzvHiVUgD8Y98CXVoa4paf21BmzkE5QfdxcKbYlq3ZNJ/ai3uibt+oMwQQYb88lA+d3Z
	nBNCvV5jhT6zMtJNXQXTIqr3O2+BzRinA5H3Gyqa4ARk+CSd8S8cBIjSMSI4ZXoeZmrw64E091FXK
	s8cU1wPW+IX+bffSLE/35fcah9uRC0hH3N+ojHVOLM7B6tN0LMYb5Z/v3+O9it4V8FIvoNOseJpwW
	sRrhMNKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3i-00000000Dui-3fBy;
	Tue, 14 Apr 2026 21:12:34 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3e-00000000DsC-3JJR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:12:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43d7650202fso2109301f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776201149; x=1776805949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5c0X39kIJgvBs2ab+eu1xWvpYjk33YHh9n+898v8ZQ=;
        b=tDvk04oo/FpKrxicH8EjuOW7VbDYRkSVZKi62MgbGREDKHdHyOltmIMjBTm8k0DHAh
         XfCpNc3DbJUw4lelq51eh3Gy/3rgkArvB8uIrfk7VPBQFoSnsm3CIGhxP8hIChZEW7V1
         SB+WU/oQ3CYvO6r3TaR63a7Z5SLzgWKvljERR7rxVJAeIWVjOfg+A8CV3vTcUbQVoE1W
         Z3gSk28gRiGDPzl8cYwIR/R361rN+hV8JNWFuJ7I6UHnXzkk+07ucH6MTNySSItCytcB
         yqx9MQKRjP7tD+3CC4URIwSlNPOrwexhyonj12Ql+FaOhVFJ9U5PXxRwKNbGQJy7B/D5
         KWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776201149; x=1776805949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D5c0X39kIJgvBs2ab+eu1xWvpYjk33YHh9n+898v8ZQ=;
        b=Oc5NmKOzfxIFeD0aYkeSJGc04Rf4kDwZq36J4skdHWbCK7aJSB64V3hOIdqmUq5FeJ
         EeXiNfFF1OxDk5K+mTj3botVjVqIbrx/Gzm1LB1glnvcGpR92ZrvUaqMYYVticItpG5w
         xM40p5++s97ce0Vq/if/wgIpMeKgS5uF29mMOy/pQk+kf/MXowUkfkAs5aAwiO9AP28z
         CA8uu7sQc78dLEgNjL4lSSBjed2OFRr9tMelukzTxjytXfQmEIMvbPIGTVCZ60ttUDoJ
         ZCyFuXQnGFkDCS9VsX7TItxN8pVmMYB9Gm+sIPc8b2IOhlsO8b2R7fDi2/rcTUOB8yHB
         ZZUg==
X-Gm-Message-State: AOJu0YwWzG+C2qF83yeOK5QYDP2LODDjxiuMuqV/lvA3PalP3LE/qgEy
	cFTSj8JqPE1mtMMFkjKZVi5kyRQ1+JkPP1LYQ3dWcPHAeb7OMvqAM6AdJfiTLNVe
X-Gm-Gg: AeBDieuOS3o7ouqtdwJqb5ZQpOMirK3o0hoko/Ugc0NTpBzMY6E7ywbZyCT2hwSeR1A
	uHdxMzcBtrNwPF0owUaQ5cOABwu3/pRx7I4LmO1ALxW6qHxtX/EPnyl+NxPrHWJvcHOZMSUTXx5
	NZiGpy4enkSCQ8TCaQQ7rwgywPcHrvURWo+40YO1jqgY96Fa4jGSHOguVDIZK4AafILEb87mv4g
	OwcJs5ItoBZRl1UQx//FOxvIIzmaUVfVMfJ8ngZ/uRpZjeMahyxQvUgvCWi3N9Q4sipeA6NeZuj
	Jks9Tpd66N29B99vvf7VNZyk0nmoeIgtbZHz6fKIZ5HpDfRA8xWZedUkTezU/U2JGiV6PTOOjad
	ID3OQphD0F/3iLK3JRVpC4OGXI+OmIxd7VWMowRS+cLhHfW/BS4+y2LOLDdPglsd08g0dUioxip
	8/i6EOUiBS6dyl7I38jEk8Amjl/Pr54DT0Alidb5mPas8=
X-Received: by 2002:a05:6000:41c1:b0:43d:70de:1c70 with SMTP id ffacd0b85a97d-43d70de343amr15644014f8f.32.1776201149069;
        Tue, 14 Apr 2026 14:12:29 -0700 (PDT)
Received: from strix.doe.home ([197.250.100.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm27652679f8f.13.2026.04.14.14.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:12:28 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 4/8] ARM: zte: Add support for zx29 low level debug
Date: Wed, 15 Apr 2026 00:12:11 +0300
Message-ID: <20260414211215.152850-5-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414211215.152850-1-stefandoesinger@gmail.com>
References: <20260414211215.152850-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_141230_843800_DEE59F52 
X-CRM114-Status: GOOD (  16.09  )
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


