Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B9DCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiTeXl+x5pBEWbWX0P2zjZwUjWiuBSWxNfYNiAcr74U=; b=Ddh5z75HknvTYrvP55U2P5SUsf
	kPgavOUURQz3VVQHpivq3Xv6Nw7UXLDMqSCp+fWY5UNN8jaOrExOYjwbNHOHZbahLro8HzGqSSmdU
	z0IVZNML/KyNGjMQ+BQo8/jTo5zCONnwbuAQrwZkr5srWTq0B2ZpduEQ4TxdUC65Qw2NRpU4Ub6Hb
	Gfy1s1TxBzJwvJc7/BqM14/iJiaJt0dPt1hVxnWTo3YzMa4tnHY5nLmC0pBucvHdh2maNs6kU9zy9
	oaUee6CZr45vwvbzExnQfCEmVgQTqshxqLJKrq1oKEAWZTyUM2OVgPZLLMRzyYmB6ady3qzyH7VH6
	nt2gc+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCxU-0000000AAJG-1KaD;
	Mon, 12 Oct 2026 10:08:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCxS-0000000AAHz-1Fpg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:08:39 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so13821065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799716; x=1792404516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiTeXl+x5pBEWbWX0P2zjZwUjWiuBSWxNfYNiAcr74U=;
        b=Xp+5CnM4uSaIk0gvV5WRkuIrO4pnOwx7sSRGdfUr3uyNGgaOLwG8d2YkFFh3FHzurG
         32FWi4MVdUSm+mAcitAjId8mOwd4/1TVD0zj5tHPcA4Zeq1jbkPc3P+e/S+pdWVJhFsG
         ao2B2jTOt6mlvQHHM4ziF/Fx0R831Wa62uez6M9jdZszbewOMDi58KYhxFxPgXq4PfyW
         /wjSprF3wn/6FLOO6+Q2mS5RLzam3S00rdwXKxBJm7DJdhEPLN4gJAaUdqMj55F4h/nW
         3Lcov7iFK7rAXi0OYCpCJmHtDVjKqdC03IZmEKx97e9EjYKvWOspg9WyR/fSSo2b3ZU1
         vlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799716; x=1792404516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uiTeXl+x5pBEWbWX0P2zjZwUjWiuBSWxNfYNiAcr74U=;
        b=ph9fkfOgmAgSl0Ijy+OlvJba5K909W6Heff0LzhxPmlQZ9rmpANkjnolN8JC7Zq73x
         vVXCluWGUJu7QhfzP4mSXAoIsz15Caz5kuGbQ4B8uU9n/Uhb3Fbskuw82ZsA8Z7zM+ZE
         EGP1v/EFrTWMtu2n1a3Kk9bpBIYnquRGnSL9uOwyeM2fdEooYFxDd2xs1awktcFhUMEY
         eqtK07XNlj2giLROd6CwgGHo9CW9Fb0JKlRbZYnB/hljMlUvdbKdmMHHHyA/0JdBYPpn
         VJXXabuu46clY3JhCFfBYyOK+Ey8oVlRZ6GDTy1F1YJpyr8aVqbtQlZbF/QbqlKee3uK
         Nneg==
X-Forwarded-Encrypted: i=1; AKwUvBxaBhFPVwCoqzZ0oMbpMmJ+GWScoSXlLGZ5xL/CTtvrBiJuT7Bk0qjaMhjPnQm6SwZeqzFmr0WJZO/EcKTsTYYz@lists.infradead.org
X-Gm-Message-State: AFq9FYIlSZ4NcysU4OLJgc1gD2NrAqh6YdYs5c5laDEU03Upg5aCpou4
	RV0XfHKyMDtH0rcaE+3KO6xXwh2XB7yPi7my+Ocl/xZTEtct+tDelXg6
X-Gm-Gg: AYBFou2eFZUjqX8zO8PUTaX3U92kUjwfRCPBqo/UVFv5CveL8FIDQdbIsQxyLrwMYM7
	mbO7Ce4lfxJO5hr93hfLVMIYnlO4sRBV7FFyWQsKJ9dD4cXjhhzxuBpRPOd+dOPcgAj5ZyBJbwB
	uJeeRnscwgBzb61s11PlaqG/USzLgOq8afNTwuaizgqP2VxzoUmPKsIUHO/C0RxYO+bw+e/VJbf
	HGtF9BlZOAuiSgoCwg5hDcX2v60KkYTlrfgxfASXnrDiRHY0NqtQyCgPgZA9BReYw53R8uGEjM9
	wbpckGSLxQIgK7I4s4nbw9jdavmcrVPwwdln0SKkDaPFDFlve/wE7h61zGGRLWPMT30m+qHXPhS
	a3tXkNSlLoE5Xd2IHMNwJ0/FSUcC54o0y9QsJoXyEZyL91XSG/B9V292M4dyykKNBzDrXVL4Rx4
	Y448+whKcUoq2nI2irtiXewhE6zeANYBkfQVBTuNxEDxRWgOSMDAuNFWdcciJIz3azjVjJWY9dw
	cWurxKGfUuLUZpT4uHrDjMSVI8EX33A
X-Received: by 2002:a05:600d:8488:10b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4a190780997mr105769955e9.31.1791799716489;
        Mon, 12 Oct 2026 03:08:36 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:08:35 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 01/11] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:06 +0100
Message-ID: <20261012100816.331033-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_030838_365781_62026F08 
X-CRM114-Status: GOOD (  13.94  )
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

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
Its CCU needs only the two oscillator inputs, so it fits the existing
schema without changes.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        |  1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 82 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index 1690b9d99c3d..cc3f62d3554c 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -28,6 +28,7 @@ properties:
       - allwinner,sun8i-a33-ccu
       - allwinner,sun8i-a83t-ccu
       - allwinner,sun8i-a83t-r-ccu
+      - allwinner,sun8i-b288-ccu
       - allwinner,sun8i-h3-ccu
       - allwinner,sun8i-h3-r-ccu
       - allwinner,sun8i-r40-ccu
diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..c9b9eaf979ad
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
+#define _DT_BINDINGS_CLK_SUN8I_B288_H_
+
+#define CLK_PLL_CPUX	0
+#define CLK_PLL_AUDIO_BASE	1
+#define CLK_PLL_VIDEO0	2
+#define CLK_PLL_DDR0	3
+#define CLK_PLL_PERIPH0	4
+#define CLK_PLL_VIDEO1	5
+#define CLK_PLL_24M	6
+#define CLK_PLL_PERIPH1	7
+#define CLK_PLL_DE	8
+#define CLK_PLL_DDR1	9
+
+#define CLK_PLL_PERIPH0_2X	10
+#define CLK_PLL_PERIPH1_2X	11
+#define CLK_CPUX	12
+#define CLK_AXI	13
+#define CLK_CPUAPB	14
+#define CLK_AHB1	15
+#define CLK_APB1	16
+#define CLK_APB2	17
+
+#define CLK_NAND	18
+#define CLK_MMC0	19
+#define CLK_MMC1	20
+#define CLK_MMC2	21
+#define CLK_MMC3	22
+#define CLK_SPI0	23
+#define CLK_SPI1	24
+#define CLK_SPI2	25
+#define CLK_DRAM	26
+#define CLK_DE	27
+#define CLK_EE	28
+#define CLK_EDMA	29
+#define CLK_TCON0	30
+#define CLK_MBUS	31
+
+#define CLK_BUS_THS	32
+#define CLK_BUS_NAND	33
+#define CLK_BUS_SDMMC0_BUS	34
+#define CLK_BUS_SDMMC1_BUS	35
+#define CLK_BUS_SDMMC2_BUS	36
+#define CLK_BUS_SDMMC3_BUS	37
+#define CLK_BUS_SPI0	38
+#define CLK_BUS_SPI1	39
+#define CLK_BUS_SPI2	40
+#define CLK_BUS_I2S0	41
+#define CLK_BUS_I2S1	42
+#define CLK_BUS_SPDIF	43
+#define CLK_BUS_DSD	44
+#define CLK_BUS_DMIC	45
+#define CLK_BUS_USBOHCI0	46
+#define CLK_BUS_USBEHCI0	47
+#define CLK_BUS_USBOTG	48
+#define CLK_BUS_DE	49
+#define CLK_BUS_EE	50
+#define CLK_BUS_TCON0	51
+#define CLK_BUS_CSI	52
+#define CLK_BUS_ADDA	53
+#define CLK_BUS_SDRAM	54
+#define CLK_BUS_PSRAM	55
+#define CLK_BUS_DMA	56
+#define CLK_BUS_UART0	57
+#define CLK_BUS_UART1	58
+#define CLK_BUS_UART2	59
+#define CLK_BUS_UART3	60
+#define CLK_BUS_UART4	61
+#define CLK_BUS_UART5	62
+#define CLK_BUS_TWI0	63
+#define CLK_BUS_TWI1	64
+#define CLK_BUS_TWI2	65
+#define CLK_BUS_PIO	66
+#define CLK_BUS_GPADC	67
+#define CLK_BUS_KEYADC	68
+#define CLK_MMC0_SAMPLE	69
+#define CLK_MMC0_OUTPUT	70
+#define CLK_MMC1_SAMPLE	71
+#define CLK_MMC1_OUTPUT	72
+
+#endif
diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bindings/reset/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..675145654548
--- /dev/null
+++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
+#define _DT_BINDINGS_RST_SUN8I_B288_H_
+
+#define RST_BUS_THS	0
+#define RST_BUS_NAND	1
+#define RST_BUS_MMC0	2
+#define RST_BUS_MMC1	3
+#define RST_BUS_MMC2	4
+#define RST_BUS_MMC3	5
+#define RST_BUS_SPI0	6
+#define RST_BUS_SPI1	7
+#define RST_BUS_SPI2	8
+#define RST_BUS_I2S0	9
+#define RST_BUS_I2S1	10
+#define RST_BUS_SPDIF	11
+#define RST_BUS_DSD	12
+#define RST_BUS_DMIC	13
+#define RST_USBPHY0	14
+#define RST_BUS_OHCI0	15
+#define RST_BUS_EHCI0	16
+#define RST_BUS_OTG	17
+#define RST_BUS_DE	18
+#define RST_BUS_EE	19
+#define RST_BUS_TCON0	20
+#define RST_BUS_CSI	21
+#define RST_BUS_ADDA	22
+#define RST_BUS_WLAN	23
+#define RST_MBUS	24
+#define RST_BUS_DRAM	25
+#define RST_BUS_PSRAM	26
+#define RST_BUS_DMA	27
+#define RST_BUS_UART0	28
+#define RST_BUS_UART1	29
+#define RST_BUS_UART2	30
+#define RST_BUS_UART3	31
+#define RST_BUS_UART4	32
+#define RST_BUS_UART5	33
+#define RST_BUS_I2C0	34
+#define RST_BUS_I2C1	35
+#define RST_BUS_I2C2	36
+#define RST_BUS_GPADC	37
+#define RST_BUS_KEYADC	38
+
+#endif
-- 
2.52.0


