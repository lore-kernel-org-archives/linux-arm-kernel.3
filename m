Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733EFD2FED9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 19:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trhYDRLNd1mcypxSueVtoLyrXZwE2OL4ccVh/8DdH9I=; b=mRvSjKEcrYMe1QZVnbFvSFeI1J
	dHAvEeQTxNvez4G6Gz5HSkyk+7CFcSmWdZwK6gX8QxIfvwCKhxDXOUW+VMFRBt/PdaeYAm5P5emoZ
	IAwVjhab0w4LuXKfNJf06q648J3WEg/mf8wTQIfxFqVuwHLdF/Df/HwC4CVKh6BCAsmMD3TMwOpV5
	q4VK4oF0AoCfCzPUsvAnDSlm0nlI3XGg3u2zZAi5Fo4W4QELJmHbZoZLmwBhq4R++vldK8t/PRJRt
	midppqEPIXaB4309VYOr+RatFpQSNJjtNAyOFNWrOZq3JdLwWGaHb+IHh8FO+g/zVItT3QZwU1Kyi
	OcU2i74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYL-0000000Eu1e-3E2e;
	Tue, 27 Jan 2026 19:16:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoY9-0000000EtwL-36BY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 19:16:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48049955f7fso52832945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 11:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769541388; x=1770146188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trhYDRLNd1mcypxSueVtoLyrXZwE2OL4ccVh/8DdH9I=;
        b=Eja+taqE2pz7X07TKnOdjohRD4W2QtLqr7STXcAjxOp5j6o94fU4Ysy6U9Bg8ADSKs
         tw47FkboD29HKE7MO7zKEtvpOXJOsHhemK+gvsE3suiCfCZWMALycm452cdmDNvjrtp/
         2tlaFA2N5bn8AmbFhXwBjw8/FgQiGz0I4lRAvPQbUW5nMKAYj9MJ8EanaDolttXqQcS0
         bGHZU/TLvGvYUV+HK9sokGwF9ymxrVYgqjJRywUvRvsTC8iPHefMhIaSQONXHnGiAb+2
         tSVqZKCJQzGccQpE/Jwc6vruT3aRlIAvwHXKzMGMPTdm3onzjp6mXq1zCEMxqoyt8MBh
         Covw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769541388; x=1770146188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=trhYDRLNd1mcypxSueVtoLyrXZwE2OL4ccVh/8DdH9I=;
        b=JCj+sEMLbSC9G0Nr5L5FgtohqPXzT130xPWgZguJV+mcmmxWXrzP5wy4NKbYgzNMPS
         nqPTtaQ4LejumQjoWpsh3vyj72PfdZJOnpJ9QvRapLO8io4ST0WVq2s82xLRdfHLksxD
         NLT+KTMfGbUE++m1nbvddbFLUNVzkK2Ss2l7aQUEGYNKUWyrROJwZ1kDxZxq8pxNjksc
         7NKvYhHeSuI6WI6fsmzlbJsed+29v4IdCOw8ZB4QJhb3g97gfJ3F0gweiov0TuJhFDa6
         Md69Ud7yWBAMapeRVekzIaQYIM7apIyT32Wpe0qDpvJNQpXkERXjZdmQZ6RIbkaJJmCU
         BxKQ==
X-Gm-Message-State: AOJu0YzkDbwwGOjL69dP3aeQu+/b2HpUG/xXiEUG6pOk5mE53XG0lp/j
	zmeJ+tssJyk8ACB4+W0dr++YuAkEd4L2IwA4IuuVTuVv1yJHcsC1G0Kf6TGN3Q==
X-Gm-Gg: AZuq6aLMSH5Pf1G+14+yD5ls45tZ4t9FmRniopi+icjcJwylZxSB5ZMDbY7RFlyzIen
	3lCniAarIQQAMJcb5YKmsGwzTUzOqN/EMPHCA0MFuJf8A93f59ExDqa20Mu+H1EYxGaQzPdVReV
	+whk9M525gyQ/7/M0DbdYrNdBl3hBKvOAgn3guPH/Pn1G30QacBoBdGqVD+4j1RH9UfqKdWh5uP
	PS42gxIlhnu4vwYPSn47wnVrK6IQ2I4Qt7QZpQyoAYgGURkp0xWrJUvEJUy72nHseE8l4VPLiT0
	drUzX90Z+R744yNqCjSDI7YhhtVo8moOmvUWR8nvBgDGrbFQGpkZ6sYvqHQ3UnvZwojju3QHIT3
	ocmW1g1JLtgQ06KA9kWMIiLNnUhJqJ+ERASA2yI8GyhdT54ziCYICXMPVVZRqGGbCluqeyJ5H/w
	92MxOzwPhGFDG4py7iAu4I/jkzywvaSZxyHO0=
X-Received: by 2002:a05:600c:8b13:b0:480:41f2:b212 with SMTP id 5b1f17b1804b1-48069c5556amr31668405e9.25.1769541387712;
        Tue, 27 Jan 2026 11:16:27 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806df6056esm931525e9.2.2026.01.27.11.16.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:16:27 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/6] ARM: zte: Add support for zx29 low level debug.
Date: Tue, 27 Jan 2026 22:16:14 +0300
Message-ID: <20260127191618.551317-4-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127191618.551317-1-stefandoesinger@gmail.com>
References: <20260127191618.551317-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_111629_796830_AC9D3CC2 
X-CRM114-Status: GOOD (  11.89  )
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
---
 arch/arm/Kconfig.debug         | 11 +++++++++++
 arch/arm/include/debug/pl01x.S |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 366f162e147d..d09b8e7150af 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1331,6 +1331,15 @@ choice
 		  This option selects UART0 on VIA/Wondermedia System-on-a-chip
 		  devices, including VT8500, WM8505, WM8650 and WM8850.
 
+	config DEBUG_ZTE_ZX
+		bool "Kernel low-level debugging via ZX29 UART"
+		select DEBUG_UART_PL01X
+		depends on ARCH_ZTE
+		help
+		  Say Y here if you are enabling ZTE ZX297520v3 SOC and need
+		  debug UART support. This UART is a PL011 with different
+		  register addresses.
+
 	config DEBUG_ZYNQ_UART0
 		bool "Kernel low-level debugging on Xilinx Zynq using UART0"
 		depends on ARCH_ZYNQ
@@ -1545,6 +1554,7 @@ config DEBUG_UART_8250
 
 config DEBUG_UART_PHYS
 	hex "Physical base address of debug UART"
+	default 0x01408000 if DEBUG_ZTE_ZX
 	default 0x01c28000 if DEBUG_SUNXI_UART0
 	default 0x01c28400 if DEBUG_SUNXI_UART1
 	default 0x01d0c000 if DEBUG_DAVINCI_DA8XX_UART1
@@ -1701,6 +1711,7 @@ config DEBUG_UART_VIRT
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


