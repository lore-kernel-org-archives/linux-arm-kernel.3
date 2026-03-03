Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708CBEB3649
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 01:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJfO34USsvCpv1UH9qU1hYEgkmphxj2R3COc9IPiZ2A=; b=e6oXug+aUPK2TgEnFRdmhYzOti
	hsOFvRHLjCfWyQ7SxS09eD8y9UsK90LxtjfmV0UvSFmF/rq8ZLz0FNCGTBAcza/x3KjRcCJPyD8TY
	jf0tfrxUAz7zgV5wothcSkT4YIul7KwWMijZpY8o9gTIY+pJPpCfD3oNVXFhwANyu7BSmtoME7gc6
	SMqf6dM/9qPd519p3uGeSWsD7gLzKovLGzHGzGsMgmi7/5V89UgnNhoA1ZnKlnd4lOAOCeSss9c6b
	CvGr2Hj4Q1AA5Vmc5rDBlYuh8Th3UmxilaxaWClrrGd4Q4JSYV4tQL1V3vENyAhIO49BYjKV7s+iR
	miejRDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEBQ-0000000EIjg-0D09;
	Tue, 03 Mar 2026 01:04:20 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEBM-0000000EIix-3glm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 01:04:18 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82746ed8cdcso3102687b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 17:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772499855; x=1773104655; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJfO34USsvCpv1UH9qU1hYEgkmphxj2R3COc9IPiZ2A=;
        b=i6tzsqFMOk0T2icnjPQLYkEFd/iRYllSxgtRwVd26NaasO7eGTcizHh6t/K46iiLf3
         Ldud/Hh20Kitop85f9b/DYXkXZIaJQkVkevY8mDErveKH9QvvLTNkvxbBPSi/zm7XKDV
         0wWqZBtMbsahsWCYawltPlfq6xTYEroAvfjdv8NQbepSh7hDpBi6AXm6nLu+8sjLrES8
         Q0vha9+fNyhn1rMJa6GlNoLP8/NldNNMG0RVRhxt7Qsy+1SHJJsJylbyMHNI3S5XiBq9
         aBvt8ROAEktDxX0df8MmAv8Orb0Mina0zrl62Sfkggvn6kUsPq69z6UTSmmkadvmhOl6
         CBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772499855; x=1773104655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJfO34USsvCpv1UH9qU1hYEgkmphxj2R3COc9IPiZ2A=;
        b=v7+3DEvwQhCVAVdrIRTVjlgSz0rag0KImb82+Y6xNOwA+O8Y8Dq/LwUm3sYqWZPt05
         oO2vyzz5w/+qDcd+Tsws4ykPpanJfmzxYxK/y+/bgQPIPBSHqTdKEhofR/ugkcP8oUaY
         0IXIx/Ti8OwbYQW8CAeMhox7zy4NhLj8C8G1naDpbPwsDRDdIHzmOf7k9xswHvPupq8L
         wUsrsG7p2P+KK8FesBUOH9hR5iRNoil3QIgk8eyYH+QUZshx1XhJbS7ZNKHwxLgvPMaq
         93rZ7hK0bPqblmmezF+odMr+XHSpFE1DGQF3Ms8wNi+CyCFg3MUyjbQUjX0UkY8hMH5J
         3n0A==
X-Forwarded-Encrypted: i=1; AJvYcCVOOkzQgUkS4IoGBhp0tSLhn14l/0ZewYnnhyFL8WPph3T6Pq3tLXFaOqi7kwN1HIn58kQVvTpAv3t6wFO/3GNS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6pUde3DPqxKcRpWJyqkWEV9cyTG4OtWovROJMmOHZWuVl1uFv
	MnzOqTfcT0+dtaY+i/vhlSJHm0HM+DMcwcnzBzs9SLIUxmjsRyLv1RTZ
X-Gm-Gg: ATEYQzzntl664FXiJt9aeE9+AYxVCfOGADbJm+H2k+YBJU7w1WpLj7JOakDYwjALh0K
	KJ3qCptZOUfzZ0M8g3NsjyNFgyljQQH8L3N6PTV25Aj9KwHr/XfNV1XAALLkGCXfs9dAVfHgqJj
	fnAP/BkcGWSmpoDEv9p4VBMTsaJFyCzcNlQdeY+gnIsfVpThGj5nwShcTq2Jq3fSOsG0oG9p14P
	rRpw6MTI8/J9hWh3+MHWxF6HO1tPvxqBWmkpYJ5ouqCbUQcTKYVRQ05EYvuTtl+yDopMRBdHo2c
	88NJrSFodPOrDBP7k791cSjNopHHuMDKLG+kTIUUpi5xHUsjhWPBPyv4ey9VoS28r410mwtd8Ig
	NCNvVJfTayOKiDZ2U6V3Gc8EQ4BBhvT7JYiq9mfT3IEN2OMN4Pyy92Q/6OfZKvUyEvQYOTOOppj
	UujlG3tqaGoMrvy7/BR3q88g==
X-Received: by 2002:a17:90b:578d:b0:343:e2ba:e8be with SMTP id 98e67ed59e1d1-35965c3c945mr12250080a91.10.1772499855342;
        Mon, 02 Mar 2026 17:04:15 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c49eb5bsm361668a91.11.2026.03.02.17.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:04:14 -0800 (PST)
Date: Tue, 3 Mar 2026 09:03:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 0/3] riscv: spacemit: Add ethernet support
 for K3
Message-ID: <aaYyUAaz7cSnBXl9@inochi.infowork>
References: <20260227075718.2243818-1-inochiama@gmail.com>
 <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_170416_932212_064CE462 
X-CRM114-Status: GOOD (  24.28  )
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

On Mon, Mar 02, 2026 at 08:08:59AM -0500, Emil Renner Berthing wrote:
> Quoting Inochi Amaoto (2026-02-27 08:57:14)
> > Add initial support for ethernet controller of the Spacemit K3 SoC.
> > This ethernet controller is almost a standard Synopsys DesignWare
> > MAC (version 5.40a). This controller require a syscon device to
> > configure some basic features, like interface type and internal delay.
> 
> I don't know how we can accept this when it can't be tested since it still
> doesn't come with the device tree nodes. If you don't want it to be part of the
> series, just share a tree where this code is working. There are plenty of free
> public git hosting sites available.
> 

It seems like you have not read my reply before, I was forbidden from
opening other's patch. So some dependency can not be satisfied. For me,
the only thing I can open is the ethernet device node. The other things,
like clock, pinctrl and gpio devices. You should collect by yourself and
I can not provide.

Here is the ethernet DTS patch

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b691304d4b74..1dfeef564ef3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
 
 / {
 	model = "SpacemiT K3 Pico-ITX";
@@ -24,6 +25,25 @@ memory@100000000 {
 	};
 };
 
+&eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
+
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	mdio {
+		phy0: phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
new file mode 100644
index 000000000000..aa8e7cfd7efe
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K3_PADCONF(pin, func) (((pin) << 16) | (func))
+
+&pinctrl {
+	gmac0_cfg: gmac0-cfg {
+		/* Base pins: - Used by RMII directly */
+		gmac0_base_pins: gmac0-0-pins {
+			pinmux = <K3_PADCONF(0, 1)>,
+				 <K3_PADCONF(1, 1)>,
+				 <K3_PADCONF(2, 1)>,
+				 <K3_PADCONF(3, 1)>,
+				 <K3_PADCONF(6, 1)>,
+				 <K3_PADCONF(7, 1)>,
+				 <K3_PADCONF(11, 1)>,
+				 <K3_PADCONF(12, 1)>,
+				 <K3_PADCONF(13, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		/* RGMII extra pins: add on top of base pins */
+		gmac0_rgmii_add_pins: gmac0-1-pins {
+			pinmux = <K3_PADCONF(4, 1)>,
+				 <K3_PADCONF(5, 1)>,
+				 <K3_PADCONF(8, 1)>,
+				 <K3_PADCONF(9, 1)>,
+				 <K3_PADCONF(10, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		/* Optional int pins */
+		gmac0_int_pins: gmac0-3-pins {
+			pinmux = <K3_PADCONF(14, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		gmac0-6-pins {
+			pinmux = <K3_PADCONF(15, 0)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 6cc31e94c13a..066006826e92 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -437,6 +438,112 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		gmac_axi_setup: stmmac-axi-config {
+			snps,wr_osr_lmt = <0xf>;
+			snps,rd_osr_lmt = <0xf>;
+			/* max axi burst len is 256 */
+			snps,blen = <256 128 64 32 16 0 0>;
+		};
+
+		eth0: ethernet@cac80000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac80000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC0_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC0_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC0_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <131 IRQ_TYPE_LEVEL_HIGH>,
+				     <276 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC0>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3e4 0x3e8>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth1: ethernet@cac82000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac82000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC1_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC1_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC1_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <133 IRQ_TYPE_LEVEL_HIGH>,
+				     <277 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC1>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3ec 0x3f0>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth2: ethernet@cac8e000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac8e000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC2_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC2_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC2_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <130 IRQ_TYPE_LEVEL_HIGH>,
+				     <278 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC2>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x248 0x24c>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
-- 
2.53.0

Inochi


