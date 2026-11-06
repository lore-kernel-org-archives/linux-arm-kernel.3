Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AC2606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YGWiZV68;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=UmF8bcF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tcFiQk9INcP1NyiO/VB8I2WdTS9SqK6ZO3Kat/I+crQ=; b=YGWiZV687lt2so
	Q+/JFdkOsXD+rp/pvMy+xT3jKiXnUSL+nHwZ+JHIQysqvFC57WL9vmlmrA6Yt+mhWYetrl/ck8d4P
	kBcUSv3LCM6lObBXrMF42S26z8tLvAZfR+CBM6Bn9xLy6/HFoGTSPFqQ228NILijpsNkBBHL4+92h
	kI8WAW6Uogs+Bld0fMAh2/mwuD4IK7tyxCf+jqCfezl3PeH3qmqadwhnbcvuCx8BvU4raqOrItohL
	0ARlr2o4fISRpRreeQq77J9dUTdndnQQYW9RLM0s89Y9F9WpiGZvirZ7dRUhQmPYAzQQoy2orqJAM
	gEnWTNpyyxKgh0OCyKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTk-0000000C0Wu-2OM0;
	Fri, 06 Nov 2026 10:47:28 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTZ-0000000C09K-2bzm;
	Fri, 06 Nov 2026 10:47:19 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07L1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:10 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07L1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962030;
	bh=tcFiQk9INcP1NyiO/VB8I2WdTS9SqK6ZO3Kat/I+crQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UmF8bcF1e1gKyJgQXP8empdFqOyOuLai7XBv+uhWBnnSA6fBJJ4q/L/CQDcT8P1JS
	 T9EaiOHxI3Q28di/59Fo14aWXU2MLypxBq48S9khE8HlAR2/GvRDCPGljeNFEgwgn7
	 FHT1lB0anQLHGRYlWJ7QEG4D2jrFuivTkTbAzl/E=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 06/10] arm64: dts: amlogic: meson-s4: add the CPU thermal sensor and zone
Date: Fri,  6 Nov 2026 11:46:55 +0100
Message-ID: <20261106104659.54656-7-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024718_008966_0C358776 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Add the CPU temperature sensor with its bus and functional clocks; it
reads its calibration through the secure monitor. Add a CPU thermal
zone with a passive trip that throttles the GPU, which shares the die,
and a hot and a critical trip. The CPUs can join the passive trip once
CPU frequency scaling is in place.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 69105c8abf12..1e8b845b80c3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
 #include <dt-bindings/power/meson-s4-power.h>
 #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	cpus {
@@ -748,6 +749,17 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			cpu_temp: temperature-sensor@20000 {
+				compatible = "amlogic,s4-thermal";
+				reg = <0x0 0x20000 0x0 0x50>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_TS_PLL>,
+					 <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 1>;
+			};
+
 			eth_phy: mdio-multiplexer@28000 {
 				compatible = "amlogic,g12a-mdio-mux";
 				reg = <0x0 0x28000 0x0 0xa4>;
@@ -1025,4 +1037,40 @@ emmc: mmc@fe08c000 {
 			assigned-clock-rates = <24000000>;
 		};
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&cpu_temp>;
+
+			trips {
+				cpu_passive: cpu-passive {
+					temperature = <85000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu_hot: cpu-hot {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu_critical: cpu-critical {
+					temperature = <105000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				/* the GPU shares the die and the sensor */
+				map0 {
+					trip = <&cpu_passive>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT
+							  THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };
-- 
2.56.0


