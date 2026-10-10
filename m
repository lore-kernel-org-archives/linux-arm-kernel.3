Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D6FCA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElpMWQpElxyvYVfod7vt+zc/cJPBYXPVQKctc5VqWXw=; b=Eg/uJ7z9skDGxrHQDsYl72gamF
	2X/MC7qeMDOt+iZd7dIZFLfJn4at32iGYCFlYarmow41YC5inC/+N8LzjY0nSh7YUYaB8lZQfNI0k
	Lxlasq9rmGRlXsdOlpGO5K+ZCeg2zGulU3aiMYJmKBt9mV8cVq0gbow1RuXAZ2luPvqf1j0MQuZqC
	3escsssq4KywamQn7NjIXju9ZESRarVRYVrhUP/A5G9RhZpODSp/G2or+etxSLtI7l1uYoUkkq+wF
	vafeqTzzQz5PeImsnOhn+w/UHYtkuRgow3IccFyY09dkNJmMZbE0dPU2blPI30OaFt36IYN3oaUUl
	akJ9yEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnN-00000007sEH-1Te3;
	Sat, 10 Oct 2026 10:59:17 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnH-00000007s40-3BGV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:12 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afe75f055so482475f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629950; x=1792234750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElpMWQpElxyvYVfod7vt+zc/cJPBYXPVQKctc5VqWXw=;
        b=xcxs/hhk3HOTnoYe5ae4PlSAYqIjuB9H3jfjSiUu8sIrJwUPSbzRMXKl8fOfPQASNX
         0aFp3zfxsRQIU5ce1+i2n+eLi9hYTc6gLeodpsxqYQJU33yGNs+r3EY+NCffpFxy7sc3
         Ppwrd0QIZm0XPmSac0BLttucph7oLzMXszNX6UEsfNER8e/uua08ofw3g4Y8e0l3nd8Z
         nQPLK54/dOa0EjMGI2Ga7mVdzEJpdQhRXZ3v+yKBPHkElkAs/p4ycF/KZk/or1MPRyvx
         Kfx8cwW8fvOHITELpNfC9umsX1GVvCJq0OuJrISARWgMndpbqgSxbJcWaYGhk2345UMB
         EtSw==
X-Forwarded-Encrypted: i=1; AKwUvBwmMQV4nqvzDAnIsIRqud8eP194JHR/KHxOqIB1hTm2Ul8qJdLh6kwhsVULmxajMMm88QPF3AmzeATYxu3n519j@lists.infradead.org
X-Gm-Message-State: AFq9FYIv6w69TDg3QJaPishj0tj405UceAOf/H7SHgOW1qXMvNhp4LLe
	Q+E1UCAeZg8R3rBF36jJ7TS10wB7D7Ffp/nXNIQemQ8qkIaQ82fWI29B
X-Gm-Gg: AYBFou2aHROxIhppNeg7XIckuvngcMMWYCwC14aUkWbIfrfvEY3zp0iqEZzOQOhnRu8
	Bz35cbh+pjN31Dc9w+7WRcLs9mQYTsTxu7RD5pve/8YylqrkbLq9BPcTJg6dsJ0TJH9PriU7rpP
	cd/WnwAE450WcBhPqom2A0Yme8pjsx+CDqRreDCYWmKvQeQ20H8Zvu4t+amiwVUgQDryh+hgQuZ
	3BY5REDoprtX0qydrxM4lhpE7l4jE5LO6ekCB/ONvfni75yOYNEYWkcybBCnMcSk6Z2G5Y76s0x
	wShcZKATh1jy1QhUIlZzjVb1wsThm0TcwF+JOD5w3CG1EODTnv6lOQni4m+yNUrlMbVybII/jYx
	WVturn8yvRXFTnYSDgohH97mhSLbBFYlY09GgOHb5HrdbKIebuc+mqjKruh+TivjY57Ql2EJuBf
	hE/DB2BgiZfN2MOstTigXjtLS8hb1OtMFBdnY/Xmd2c07X2nENsBulb+I7tJzZxYdPJCt26E8oj
	+j/Y9gboytY536Nku8f6KEdl9P2i3C5NpE=
X-Received: by 2002:adf:e011:0:20b0:488:57ad:d5c8 with SMTP id ffacd0b85a97d-48dba787c28mr6104337f8f.3.1791629950054;
        Sat, 10 Oct 2026 03:59:10 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:09 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/8] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 10 Oct 2026 11:58:58 +0100
Message-ID: <20261010105900.247342-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035911_822945_BE8D1583 
X-CRM114-Status: GOOD (  12.55  )
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

The SoC has a Synopsys gigabit MAC, glue registers for the interface
type and clock timing, and a multiplexer that points the management bus
at the on-chip 100M PHY or the external pins. None of it was described.

The controller reaches memory through a pipeline stage with its own
gate that nothing else claims, so it is switched off as unused.
The glue registers share a clock with the multiplexer, which probes
only after the controller has programmed them: unless the controller
holds that clock itself, the writes are lost and the port keeps the
bootloader's delays.

The on-chip PHY follows the G12A; no board in tree uses it, so it is
untested. It stays disabled for boards to enable.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..94ea22514501 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,33 @@ gic: interrupt-controller@fff01000 {
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac",
+				     "snps,dwmac-5.10a",
+				     "snps,dwmac";
+			reg = <0x0 0xfdc00000 0x0 0x10000>,
+			      <0x0 0xfe024000 0x0 0x8>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc_periphs CLKID_SYS_ETH>,
+				 <&scmi_clk CLKID_FCLK_DIV2>,
+				 <&mpll CLKID_MPLL2>,
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+				 <&clkc_periphs CLKID_SYS_ETHPHY>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline",
+				      "pclk";
+			power-domains = <&pwrc PWRC_T7_ETH_ID>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		apb4: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
@@ -645,6 +672,37 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x28000 0x0 0xa4>;
+				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ext_mdio: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				int_mdio: mdio@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					internal_ephy: ethernet-phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.0


