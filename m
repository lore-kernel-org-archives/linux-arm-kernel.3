Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C88CA6009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKKIB8jplVEe3d7I5HpiWgRDARvx1E69zSOwXtBJM+g=; b=C4KMjafWkG5Ds1JyT7VB5OVLwX
	UREdzzYpmzt2tb/wn7A0tvIF+JbLbCmmJYfcQ9JB7Df7YeP++7VPXnrrctxS7Il7s8RcJ9d8Rq8+i
	GgsyqHN9KE6XTsT0pfggE68N38U0brl+6yoRtnceMr3E4gqh5CMtsKrxMxj3t1vLe26pCCGx9l8H1
	+Zw4m/7dTxL91cyRda6DAm6FwwdiNNnh+yAkFWM2J3CWlpYkJB4YG0po6s5vKpyP7NNf4yCZ/aaGp
	BLz/tG5HzACvdY7IiKHdF903KSTftIKfMLcqXp6AD6KvPIl+5V61QQXC681HjKuyBRKSV9kYgf4vn
	XGcy/kww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMz6-00000001wbd-3FmH;
	Wed, 07 Oct 2026 08:26:44 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyy-00000001wRF-0Xr9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:37 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso18185275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361594; x=1791966394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKKIB8jplVEe3d7I5HpiWgRDARvx1E69zSOwXtBJM+g=;
        b=fIZNb5RfvDZe5QN/aNtBPJ1umIY2e8SgEjimUa/gGEAp+uP6qqpxL9l/DhMp/poTVn
         lnrHE4tN+TCNhUgs7Pkg5MJBqdS1VVfcP7Fyz9jmL5nFy4CGA+K4xBvamNW//hKztfXa
         LADHdYi1BxX+ixJtvTU9OFoBLETCR2CmxAogAOD9mfB8fP62wTdahoOXn4rTM95ZgyMl
         pd0NJ8DCaCWayNH5DrURDVwfNRLipfCMc9DkWw2/Zusia3TAkXU4wORMGjP4l1gAXAtK
         GI9mW8bWBDw70AjbmctUUiuI+hrY2EQOHcgSrWX7lqJwFDYOUez86errPiYKctsLW5SB
         DJEQ==
X-Forwarded-Encrypted: i=1; AKwUvByrJSw/4skunXIg3+LwG2klELAwBJXqcXjuyGuhn1NmEI0L3Yn5jG+QK5pkRgjGO7LrMPewmfG20TZ5xPib3/F8@lists.infradead.org
X-Gm-Message-State: AFuF++nTZqBxox9NxXcrGnTrjaxVezotu3oXSjio3+9bLtLd3/XAmNht
	+otmM7igZHNI0eDHh7etUfAeT19XmMJTdcTDL4ZhKFakJXzAKcHzk7fC
X-Gm-Gg: AYBFou3qhsGlr0bswIXOUM2JoxgT7Tf6IGZ/FCPjDWeyrhyQdx1f52cvwdKm/8QZrQz
	HLs2nBFcjzoCyneRyVd3Po9KW+fvO9iFDbcVoRXYyZXROveh0eAGtc4V8fDgKad51Y4A3UrZmc/
	eEY0pJPVO2jjP9xa/4IZZrAsxYOWMdbdp+U9Bwkode5CC7gpfsRgso5uas8w6o07+NR2Gl2SiDu
	b1MTO6mfgo8iH4EFv4RNgC3pIYOMFtZXrc/CF6WbWIu+g3TrVoJHdFltBOIyCu5YKCYg0Z8efXh
	EsNNZe8cM5O550IThS58eoXi73HWtgjyjSJCK4RO9rbCjFIt4rX8idPhklPbIDZjgCCQxOBmUZy
	OH1JYFJBL6VPpAARfWMWAa7FJLesZhK8nDdg2i4LIsbsGcrmlr77BKndOU1mTM0Oqlf07BGinXL
	GpCcH5zujoQ2G1F1t9MWMXIBTHTcnZw0HhkoRI9FPktdtuNRfbpjAhhgpYKS8MB0uBe2TtKWs9y
	ybcl6HXbcJRTgv2RocqAj9qhkW0nyEp7EY=
X-Received: by 2002:a05:600c:890b:b0:4a1:7e26:9a5a with SMTP id 5b1f17b1804b1-4a17e269ab5mr38619595e9.15.1791361594101;
        Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:33 -0700 (PDT)
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
Subject: [RFC PATCH v2 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Wed,  7 Oct 2026 09:26:26 +0100
Message-ID: <20261007082627.63807-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_012636_189759_C2658F76 
X-CRM114-Status: GOOD (  14.00  )
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

The SoC has a Synopsys gigabit MAC, a block of glue registers that
selects the interface type and trims the clock timing, and a
multiplexer that points the management bus at the on-chip 100M PHY or
the external pins. None of it was described, so no board could use its
ethernet port.

The controller reaches memory through a pipeline stage with a gate of
its own. Nothing else claims that gate, so it would be switched off as
unused and leave the port unable to finish a transfer.

The on-chip PHY is described as on the G12A. No board in tree uses it,
so that path is untested. The controller is left disabled for boards
to enable.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 57 +++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..140f1836f3dd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
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
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline";
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
@@ -645,6 +670,38 @@ gpio_intc: interrupt-controller@4080 {
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
+						max-speed = <100>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.0


