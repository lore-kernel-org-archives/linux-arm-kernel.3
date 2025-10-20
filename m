Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B054CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCbONFN78XpgRKAC0O9n8v5Ot2s4SJuk+oXKqyYYcm4=; b=dVcM/0yztr9pCVATmEfCeL7YYN
	1Rfz59YWae2vs65ZV8WnvktTFPeC19q75HDrcgtkOgBBoNALfZXaQDrHZuJXz4aQQsbp07yxHq3Jc
	TJpgcnunzIGer0jhwbdjhtMwVYFKx+AJDEr/BUc3bD9fQpzuyu9gxPvam+CXR72cwoEDQ19Ozlza3
	BtlwzvCgd1uAkuMumB8OEwMIpQtLWKI6KQGsW37bwvjgz7UgItVxtmxy0Y5RLXfK6AqC6UeWNyM6y
	aqvaVtpb8SdPuOrB7Or3VCjM/GWAfY4W8JlpyBnovqItuLr7srkgfZCt3PdpnQE4ZrrmN/jcQ4qKq
	GuSVN3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmOa-0000000CdLG-1VoJ;
	Mon, 20 Oct 2025 09:41:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmOY-0000000CdKf-2dIG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 09:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OCbONFN78XpgRKAC0O9n8v5Ot2s4SJuk+oXKqyYYcm4=; b=V3EG08CkYR+gSgjznUHXHfVJo7
	LQRg3ZhF5R2myH03Xl9K7PNei7x8YU3MxiR8ninAs/lyGh0cCE9RUZQL4nZ5qGqxfwu2Zwsj2+A1Q
	M3SuLLJxeVmURSO8WRkH43FNOkJEYw3aZ0FRQtR8N7Zmj+DlfjDdvZ/BRmJAEEWzWhXwMKwl/b3IQ
	aEa4ZkDtMJ12eJVvsTJJut2TCMi3+zCB24l9iIjKWgUFpN3tosS+kQtrxOHXUq1qdbhCqksUSvChT
	ZgYH2DRn4R9MKQ6WOP5ehORFBV5Q7wr6ApR0WwiGAMBASFj82qTiLkeKDAM5mUEduM/yYJAOFtxVk
	OONWcSyw==;
Received: from thorn.bewilderbeest.net ([71.19.156.171])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmOR-00000009gLF-2gJe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1760953240;
	bh=OCbONFN78XpgRKAC0O9n8v5Ot2s4SJuk+oXKqyYYcm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aptjzpRbLNK18PePpTlYK3Ta3tm2B6yYpVnLCfkvKXEfjhNNsUocyvhpodPmW0RkQ
	 XbIVRPvkYeiN+LQR7b4xuv9p8RAWaVVuvm4PvRXEdlpSb/YJmzRcAGorehH7XYDEdi
	 Oc8ODPoqb2YI4tkvMxpHazLfnCJFMCt6GB29oHdk=
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:713c:eb00::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 94B0B1BF;
	Mon, 20 Oct 2025 02:40:40 -0700 (PDT)
Date: Mon, 20 Oct 2025 02:40:33 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Tan Siewert <tan@siewert.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add asrock x470d4u bmc
Message-ID: <c6ee0814-1d36-45b5-8598-2a30efeee5a5@hatter.bewilderbeest.net>
References: <20251011112124.17588-1-tan@siewert.io>
 <20251011112124.17588-3-tan@siewert.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20251011112124.17588-3-tan@siewert.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_104134_046578_20860E92 
X-CRM114-Status: GOOD (  15.57  )
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

On Sat, Oct 11, 2025 at 04:21:20AM PDT, Tan Siewert wrote:
>The ASRock Rack X470D4U X470D4U is a single-socket X470-based microATX
>motherboard for Ryzen processors with an AST2500 BMC and either 32MB or
>64MB SPI flash.
>
>This mainboard exists in three known "flavors" which only differ in the
>used host NIC, the BMC SPI size and some parts that may be un-populated.
>
>To keep the complexity low with the BMC SPI, use the 32MB layout
>regardless of the used SPI or mainboard flavor.
>
>Signed-off-by: Tan Siewert <tan@siewert.io>
>---
>v2:
>  - fix led node names [robh]
>  - fix missing gfx memory region and other offenses [Tan]
>---
> arch/arm/boot/dts/aspeed/Makefile             |   1 +
> .../dts/aspeed/aspeed-bmc-asrock-x470d4u.dts  | 350 ++++++++++++++++++
> 2 files changed, 351 insertions(+)
> create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
>
>diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>index 0f0b5b707654..c601af36915e 100644
>--- a/arch/arm/boot/dts/aspeed/Makefile
>+++ b/arch/arm/boot/dts/aspeed/Makefile
>@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> 	aspeed-bmc-asrock-e3c256d4i.dtb \
> 	aspeed-bmc-asrock-romed8hm3.dtb \
> 	aspeed-bmc-asrock-spc621d8hm3.dtb \
>+	aspeed-bmc-asrock-x470d4u.dtb \
> 	aspeed-bmc-asrock-x570d4u.dtb \
> 	aspeed-bmc-asus-x4tf.dtb \
> 	aspeed-bmc-bytedance-g220a.dtb \
>diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
>new file mode 100644
>index 000000000000..e9804b0ace9f
>--- /dev/null
>+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
>@@ -0,0 +1,350 @@
>+// SPDX-License-Identifier: GPL-2.0+
>+/dts-v1/;
>+
>+#include "aspeed-g5.dtsi"
>+#include <dt-bindings/gpio/aspeed-gpio.h>
>+#include <dt-bindings/leds/common.h>
>+#include <dt-bindings/interrupt-controller/irq.h>
>+
>+/ {
>+	model = "Asrock Rack X470D4U-series BMC";
>+	compatible = "asrock,x470d4u-bmc", "aspeed,ast2500";
>+
>+	aliases {
>+		serial4 = &uart5;
>+	};
>+
>+	chosen {
>+		stdout-path = &uart5;
>+	};
>+
>+	iio-hwmon {
>+		compatible = "iio-hwmon";
>+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
>+			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
>+			<&adc 10>, <&adc 11>, <&adc 12>;
>+	};
>+
>+	leds {
>+		compatible = "gpio-leds";
>+
>+		led-heartbeat {
>+			/* led-heartbeat-n */
>+			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
>+			color = <LED_COLOR_ID_GREEN>;
>+			function = LED_FUNCTION_HEARTBEAT;
>+			linux,default-trigger = "timer";
>+		};
>+
>+		led-systemfault {
>+			/* led-fault-n */
>+			gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
>+			color = <LED_COLOR_ID_AMBER>;
>+			function = LED_FUNCTION_FAULT;
>+			panic-indicator;
>+		};
>+
>+		led-identify {
>+			/* led-identify-n */
>+			gpios = <&gpio ASPEED_GPIO(D, 6) GPIO_ACTIVE_LOW>;
>+		};
>+	};
>+
>+	memory@80000000 {
>+		reg = <0x80000000 0x20000000>;
>+	};
>+
>+	reserved-memory {
>+		#address-cells = <1>;
>+		#size-cells = <1>;
>+		ranges;
>+
>+		pci_memory: region@9a000000 {
>+			no-map;
>+			reg = <0x9a000000 0x00010000>; /* 64K */
>+		};
>+
>+		video_engine_memory: jpegbuffer {
>+			size = <0x02800000>;	/* 40M */
>+			alignment = <0x01000000>;
>+			compatible = "shared-dma-pool";
>+			reusable;
>+		};
>+
>+		gfx_memory: framebuffer {
>+			size = <0x01000000>;
>+			alignment = <0x01000000>;
>+			compatible = "shared-dma-pool";
>+			reusable;
>+		};
>+	};
>+};
>+
>+&adc {
>+	status = "okay";
>+	pinctrl-names = "default";
>+	pinctrl-0 = <&pinctrl_adc0_default		/* 3VSB */
>+			&pinctrl_adc1_default		/* 5VSB */
>+			&pinctrl_adc2_default		/* VCPU */
>+			&pinctrl_adc3_default		/* VSOC */
>+			&pinctrl_adc4_default		/* VCCM */
>+			&pinctrl_adc5_default		/* APU-VDDP */
>+			&pinctrl_adc6_default		/* 1V05-PROM-S5 */
>+			&pinctrl_adc7_default		/* 2V5-PROM */
>+			&pinctrl_adc8_default		/* 1V05-PROM-RUN */
>+			&pinctrl_adc9_default		/* VBAT */
>+			&pinctrl_adc10_default		/* 3V */
>+			&pinctrl_adc11_default		/* 5V */
>+			&pinctrl_adc12_default>;	/* 12V */
>+};
>+
>+&ehci1 {
>+	status = "okay";
>+};
>+
>+/*
>+ * Although some board flavors have a 64MB SPI, use the
>+ * 32MB SPI layout to be compatible with all boards.
>+ */
>+&fmc {
>+	status = "okay";
>+	flash@0 {
>+		status = "okay";
>+		label = "bmc";
>+		m25p,fast-read;
>+		spi-max-frequency = <10000000>;
>+#include "openbmc-flash-layout.dtsi"
>+	};
>+};

Hmm -- I can see the simplicity argument, but it seems a bit of a shame 
to let the other 32MB go to waste on boards with 64MB chips (especially 
given how tight a fit OpenBMC is getting in 32MB these days).

Could we maybe have an aspeed-bmc-asrock-x470d4u-64.dts alongside this 
one that #includes it and then drops in the 64M layout over the default 
32?  You could then arrange for a flag in the OpenBMC bitbake recipes to 
opt in to using that dts if you want to.


Zev


