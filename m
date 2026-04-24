Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0FDFED3CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=573CRmgB6fq5PrzKy/43avbctK1Ja6gf0rG0MtvqmBo=; b=k+jvFOyL8mAXJdfh37NFGNSn1S
	h6GJO0nWRiBg13TqG/q1K5HCWz9pLH8Ezakw4tqqWB8krXgaEA/o6Pc3S+VWoCc1QY4BsGaKVdF5t
	l1X4J6GB3c78TKHZdUNejPINbC1GGX9Dy/GoMDgMwpei5hcH0++kuxZ4I2c9yjIFGMAmVy+X+wGvK
	c8AsLYj9MDtLDTc99F69XBRWAf5c13nj7ky5i4i/uEmx/JKVINmEUraQE+tdU6mXWs1bNEidn+PHv
	MyBnXiK93iHTB13MpiWSrbd9BKtgP6a19iUEy+15Evm9wwWH3Mv2kJ+NnGUA7VxUTmQrvzGrja8M1
	7wTLfjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHTb-0000000DKHR-2NxV;
	Fri, 24 Apr 2026 14:25:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHTY-0000000DKGX-3Bwd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 14:25:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488ba840146so71113305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1777040746; x=1777645546; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=573CRmgB6fq5PrzKy/43avbctK1Ja6gf0rG0MtvqmBo=;
        b=WpYW7lwzix1/XvEatWaQuzpt0ZBy55C4JDbKIi3JNAdOiRnT7FLNbWQCq+HIqjAD68
         kMRPiicgMJNptGNXlL7QzyVD+MiWAxtV69qhvUpdmn3mhligfI6pTSn+Xbm2ZEyAo43x
         zLzPUUUtPr7M56T5WkAbuILr1S1+0OKKL4QeMcAvgRlSeQLjW3B9gySH2epDG0U/SYM3
         QnLZX5ftmyovbW0/EzQJgqBktGEqYaWGesIniMPhj7/4YdrfR0Us4AM546BsLbIwXrax
         MY1rEZPrMJpBIRWYVbKpRqMH0NXTy9BwXHV2qgiEonIJN+QvlN4v9YPlbg8bTAQ8hFT3
         gNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777040746; x=1777645546;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=573CRmgB6fq5PrzKy/43avbctK1Ja6gf0rG0MtvqmBo=;
        b=ZtkuasmqZUUjbCHrcxgb9f74BNVOu1hl8U1ab/z70ks0q8u46cF6Z+i8rkVJsFte7v
         KJl2rBTP6GPq9P/4Ahaalb8k990c2aLaZQCujCnrIPNJQ60KRkZKl4IpMeczBVStDdLw
         12fOiOZgLwGe2GxyqkG+zW2Iphyy3OaCTtpwbVz7c6sx/3NIjvc3rhfz7AI6CTkRdgyS
         1YXAgeaQqvgTmA9OHvplNdlc27eDGcfiiCHqvkBCsnpSBLbhczzErP5Rnm5nqlgo42tT
         QRlAxnKJkY44dQwWoLlmodrcNTfdzXKsYz+wgzV9+g0GHiAx42qyWVRX7ehNIrHkORzV
         4juQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1/acbGehSIRR6O33T1wrb+p9gTeqqjEthZOw0GGa2T7aHC47wEPXja6jjJOZOKMbg28egxuW+Ud0nBjP+g/nh@lists.infradead.org
X-Gm-Message-State: AOJu0YxdbwoG0f9Q6sChFuNFihi2EBxlOa1YPoDaM22RtZHgoTj0ui3a
	afYStZ1bsqv+JnlYG/a28FCZlEiOFf3LlLakdHiEui68OPxVkbODzHxjUB7pLeX5D2U=
X-Gm-Gg: AeBDietKpC6TONJxFr2Lbg3/3fQ/oj5e7WIGz+MHbVu967Di1eVz5UFARNQACn5XzWl
	SG3Q4faYMNutTBZINhkRrhczXjIQGq+yn5532sJO5zpwBXl2kLqWZBjR0AFuhi9ZamrU+uvx9Bu
	ixGPk0A5+rZTJrzAqPfRsAcOnqJMKWdW9WTGcn7NpEYZC3ue96+m+8nFgDQrvdV1MsaHItoiWNe
	+27FMV4XJaFDrHDI+hax0bRk+yQ3BLeuhcfKS3SM+OpOc92fO4Ub7YQYP6hTcQF73tRmR4UNXt3
	4eHp+/xJbCqe3gJqBjNqq9H/Ws3k2uJhpdahiyBM2I5/ero+/2N/qggUwa8c09f5B30UZZKyiLc
	ZD/zuICJienDpYxQVOJxaDDPZZ0bvjsn2GHanhzfjvZDtrE+3ZXKi+rq/zr+G+QYkEXXJgf2+/J
	mtvP0ePyeodpCcaXD5rUoUbM6nJQH6r8YapSmTSDxgijugS7R4deJuvLE5BzIbcgtUI5hD5tka6
	qe4OjL1O/50Zobtap2S5yMVSy8=
X-Received: by 2002:a05:600c:450c:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-488fb768816mr443435725e9.14.1777040746211;
        Fri, 24 Apr 2026 07:25:46 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm378066605e9.12.2026.04.24.07.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 07:25:45 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 24 Apr 2026 18:25:40 +0400
Subject: [PATCH] arm64: dts: rockchip: Add DT overlay to use Sige5 SD slot
 for SPI flashing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-sige5-flasher-v1-1-0a147ebaec7b@flipper.net>
X-B4-Tracking: v=1; b=H4sIAGN962kC/x3MTQqAIBBA4avErBNs0P6uEi0sRx2ICgciiO6et
 PwW7z0glJkExuqBTBcLH3tBU1ewJrdHUuyLATW22qBRwpGsCpuTRFlRZyz2iAMuHkpzZgp8/79
 pft8PxGwWFV8AAAA=
X-Change-ID: 20260424-sige5-flasher-e745282292bd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5155; i=alchark@flipper.net;
 h=from:subject:message-id; bh=B4aH+4KVEOwhZxypLMourPUyt/cQ+ptjIMdAxFJZySc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS+rk1zP2Ls0hTsc4Jl4n3LWTP+9DewPWa4WTBR7cNMz
 ZW7q/5rdExkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVu2MZGWZp1fSZSVi/2an6suTDN9XjogXCYf91WAWu7L6if6ZvtiHDf8fduo0
 P/9yZdOP9u/5t35adUr3PGl5y53dCQOFZyQVhmYwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_072548_837765_BCBAC1D2 
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

ArmSoM Sige5, just as most RK3576 based boards, has its SD card pins
multiplexed with the FSPI1 controller, allowing for high-speed SPI access
to flash chips. If one has a microSD breakout board, a voltage regulator
to provide the necessary 1.8V power, a 6x5mm flash socket, and some jumper
wires, it's possible to use this to flash SPI chips directly from the
Sige5 with full hardware acceleration.

Add a DT overlay to set up the necessary pinmux and enable the FSPI1
controller for this purpose. This is specifically targeted at 1.8V flash
chips, and relies on an external regulator or power supply to provide the
necessary 1.8V power to the flash chip.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  5 ++
 .../rk3576-armsom-sige5-fspi1-flasher.dtso         | 80 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index cb55c6b70d0e..ece5bdb387bc 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-100ask-dshanpi-a1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-fspi1-flasher.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtbo
@@ -289,6 +290,10 @@ rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
 	rk3568-wolfvision-pf5-io-expander.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-fspi1-flasher.dtb
+rk3576-armsom-sige5-fspi1-flasher-dtbs := rk3576-armsom-sige5.dtb \
+	rk3576-armsom-sige5-fspi1-flasher.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtb
 rk3576-armsom-sige5-v1.2-wifibt-dtbs := rk3576-armsom-sige5.dtb \
 	rk3576-armsom-sige5-v1.2-wifibt.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-fspi1-flasher.dtso b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-fspi1-flasher.dtso
new file mode 100644
index 000000000000..b2ed735a43fc
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-fspi1-flasher.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * DT-overlay to use the SD card slot on the Sige5 for flashing SPI chips via
+ * the hardware FSPI1 controller.
+ *
+ * This is specifically targeted at 1.8V SPI flash chips, and requires an
+ * external regulator or power supply to provide the power to the flash chip,
+ * as the one on Sige5 is fixed at 3.3V.
+ *
+ * Here's an example circuit:
+ * -----------------------------------------------------------------
+ * SD card slot                    SPI flash chip (e.g. MX25U12832F)
+ * (Pin 1)    DAT2 <----------------------------> WP/SIO2    (Pin 3)
+ * (Pin 2) CD/DAT3 <----------------------------> RESET/SIO3 (Pin 7)
+ * (Pin 3)     CMD <----------------------------> CS#        (Pin 1)
+ * (Pin 5)     CLK <----------------------------> SCLK       (Pin 6)
+ * (Pin 7)    DAT0 <----------------------------> SI/SIO0    (Pin 5)
+ * (Pin 8)    DAT1 <----------------------------> SO/SIO1    (Pin 2)
+ *                           +-------+
+ * (Pin 4) 3V3 VDD <-> VIN 3 |MCP1700| 2 VOUT <-> 1V8 VCC    (Pin 8)
+ *                           +-------+
+ *                             1 GND
+ *                               |
+ * (Pin 6)     VSS <-------------+--------------> GND        (Pin 4)
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	vcc3v3_sd_s0: regulator-vcc-3v3-sd {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&sdmmc0_pwren>;
+		pinctrl-names = "default";
+		regulator-name = "vcc3v3_sd_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&pinctrl {
+	sd {
+		sdmmc0_pwren: sdmmc0-pwren {
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&sfc1 {
+	pinctrl-0 = <&fspi1m0_csn0>, <&fspi1m0_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+		vcc-supply = <&vcc3v3_sd_s0>; /* Need a discrete LDO!!! */
+	};
+};
+
+&sdmmc {
+	status = "disabled";
+};
+
+&vccio_sd_s0 {
+	regulator-max-microvolt = <1800000>;
+};

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260424-sige5-flasher-e745282292bd

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


