Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35E5C98332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 15:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HXbMRgIpW1xfL0vVAELOv8qR2MQ01942FUYAID9kA8=; b=ZaM3QB7wBuHAQtc1LKUZ/Pr/xd
	qIWEKvCE5Cp/guX4WtXyfgZvS36my5thi/Bo+c8dHEnTkpY7lotxt0YY2/rNTSJ1foi69mdoVVbZg
	FFh6Anqi7i52pK+Fy4aezsiIGaalAjyVpssXQrckG07Rc0tEgUgNHabRubX0TvXq+K8aeVfk3V2um
	35GT2S+QQctnSNKSvPLkER92k7ybfnfGTZmDz3FvHhtsXFpQsWbc6fd2kbOx/xVZsC6sP5yFks1+I
	doznpRFhH3waOM4W/0R7iPhwwiAzcnEHsDUl0pYhAN9/4kEFp/k8V07+bArc+zlXDI1btHeLzHQtu
	bx31RB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqXQ-0000000GUYv-0fSF;
	Sun, 27 Sep 2026 15:11:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqXO-0000000GUYQ-1K1P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 15:11:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49e73611928so21071085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521892; x=1791126692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HXbMRgIpW1xfL0vVAELOv8qR2MQ01942FUYAID9kA8=;
        b=YmjvXxnf/xo9UbAZsB6yisGOBIbkfd6VJAPhqD9cO8mch3sTtdLAuqtgENVqdj3JkZ
         AK7AmH9xbCfu2SXyXnKZFKYw+EmKuq9yisbqQ9+IEQnkySqoLkIpZEdzWNYryI5xARyU
         khrw8Pin1Qf9lmTYUETJSl8oQKJLH6mIOMaLe1NvOOfnftH+9ze6cyUSU/GJQFP/Y1Ln
         f6fH1vmau5yzNPW//9CRDso5MGjc3236/twHchHxvaoELeN4WKKXcDBSoxeEdpO+vqsL
         PmphaDaT1BfiFLbeeUOAHhVFztgrdzcEl/0aSfcntS6q2X79wEiSTkT0tRprpcb6S6iv
         Nolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521892; x=1791126692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HXbMRgIpW1xfL0vVAELOv8qR2MQ01942FUYAID9kA8=;
        b=KUt+2/sZ0YI0eAUtG1z2k+4Dp8jR1aiyjZf0NFZwZ6g2Uu6K52kRIpC7ikSdjF9CbT
         PkVbgoXIjWfSIbQ+UIP/p7e65ga6JM2sJzSe/dkB8uxVocA0HbcXHtBj1eHQAkoC+Js7
         0hp6RD7BOHRooSCDA/HSs5yjWuEb7EO1F3ep39DqgnpDgT5bDziiHHNtO6rhSzmHJMTV
         /L3wxwDugX0A/sS3b+5NFACwE1/r7La9quRlxiKlpZD3aiVQWhYrqWxNrfv8cZYVdziY
         ODKWue2KAq/cMpLwrhxgS30eWPup3g6OnVrVOBF9YEhlhmP83F1jbnaqaTLTqkVsigOe
         6rlg==
X-Forwarded-Encrypted: i=1; AKwUvBwj9J0kdw5C1OidKdDazIugznY9F1ColNiq7J3UpOlbI/dVZmxGgOl9eVSQptEncvXSxRzDIS0BAuW1MWwPnpAV@lists.infradead.org
X-Gm-Message-State: AFuF++k5hFH/IJz8AwEfutU+H4eTpjWuVKMeJf86CmSWfGpem4LnsaEr
	1rnHfCQAoPuxvHny9lbhPuPrNQHErQvygvsj+DG8/A5j0OLlL9OcmRe+
X-Gm-Gg: AYBFou2p/irDIE0p2YkkFj1a87nLn9HRlLRxzmWFhR4kkpWNH3bho1K0SjqWyGr0Id+
	B1VNm3Kv/QqnI2cy2jNEExehuWQzzmpX6lxEymj4IeYXGctpVpHEkkQJ/kV+keDdw8/hT87hggH
	BAGl29oB45HFd0wemtOc1X/1g2DIjwHiq7PbL/DGCrUbtO37tqVudQgfA1UVYXwD1LlwisZSQRK
	J1IprkdlKYPIjl6ylZKZ57T8Dkckuw86NNQJUDr7PqeDAYVABqHkXnzlbcxu7OeBr6wwQSXX6Q9
	auc2OXKvNdDipoEsb0r7TtIk8ZE4xwc49pTtsvTYqguuVtOMdZ3mBkayyqrIU5YNsD6VdzSDAt7
	i1owr4vmjLBsUhZGC3m4DfGlU7yMH2oycWrY53Zt8Sm1wu3htV6Tj/kSLBNxlrWgNd1BY1+KffX
	W49QGtOdqP6e0wir91JCtHVLwffxkEt+rIQvH9/ioeOTKuiQPmPOzqCNRd9FLAnLkwnrrH53D10
	840c9HgdIFR58oAECxGDHTHr78JsEiw
X-Received: by 2002:a7b:c314:0:b0:49f:bb49:9cca with SMTP id 5b1f17b1804b1-49fe66cf67amr152831735e9.5.1790521892183;
        Sun, 27 Sep 2026 08:11:32 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:11:31 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 01/11] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:06 +0100
Message-ID: <20260927151016.186493-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_081134_386552_A6606C64 
X-CRM114-Status: GOOD (  15.58  )
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
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        |  1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 88 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 134 insertions(+)
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
index 000000000000..8983c6d2f362
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,88 @@
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
+
+/*
+ * mmc0 and mmc1 are v4p1x controllers driven in the old timing mode, which
+ * needs the sample and output phase clocks. mmc2 and mmc3 are newer blocks
+ * that do their own delay calibration and have none.
+ */
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
2.53.0


