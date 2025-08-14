Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A900CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 01:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wbvZ1ekGJuwOIl7G04NQ4rzv98Rcb4Y1ERxLhOMI7n0=; b=haUTX0K88oo03UWK8bcoQcj1e6
	TPHzujy4vBfHOgP7kuduLyN7sZL0o7aUAbfMz8tx1UXpwzcp5SmCcPsbYlRJbh8SWDNk49/6nrgk3
	bhkRs6FbP4XBWqFC5Ehzn8zaHat/Rv/Fsa2c1xOsBm4XWyiMYS8Fle0Lk6KdEw1plybgpJbty68Xo
	/4Qu6l1tIkC42ZXgRKVK/Ur6ChUCNRbqYudBmi66HEnWLV1k2XSlEDavF3dejloDaImkPdjv/LkFw
	bttlt3Z2/skPaC+q3Kr3cCQm0V+kJyv2S2RY9WuNadfdcRld/e/gSbJYZOQ3mKeBCPjWUONcuVU5e
	/jLBvT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umisE-00000000zlV-3j9l;
	Fri, 15 Aug 2025 01:04:50 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umhUC-00000000nZl-3Epl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 23:35:58 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c31nw06QYz9tBF;
	Fri, 15 Aug 2025 01:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755214548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wbvZ1ekGJuwOIl7G04NQ4rzv98Rcb4Y1ERxLhOMI7n0=;
	b=vFQVFUNQIg+ezhmhzXAKC2bRenWQ6bVdP4x+8IpqQsQYCH9l41Vek1gL5H810IHElmcSKL
	DPZkKV5Zi2QfTo1omFwljuYxcIDxzCexarzcFIwucBqL8p+8rptH5h7DdwZKOD6PEp+KXH
	BZP7Cr9eTs6PVuw/9TIHhlqNMOEkzIY2+TiBWNFKCNhl2AQEGIxQO4g3z/V0wU5nB2GPXG
	aydsyChatjvziDTXN58ysQ9eUoWdZaqxwow5jJSNY8yvko0OQ5d83/1OLDxdMSkNaoymJ9
	IlgPJjsAQqbo2L3xOnm3pQPbDaE+UVPPOh5F6Ll5spgdWheeVr3aC8g5smX6BQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755214546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wbvZ1ekGJuwOIl7G04NQ4rzv98Rcb4Y1ERxLhOMI7n0=;
	b=tWV0c81nn9dTIUdRpFoitXRTFb8fiw64Kdxyb7zo1I3kzk7mF18y02YrVlgGgqUVdazU+/
	N3hQmsShwqsCa2BPlm0m6WuA9qbwOr8d0ZBhYQfOUM6syhezdl3TQZjQVRcPKaYZiHmTJe
	QF4YuEXDuyTth/CSIrpynckaUQOFqjnn4NWX23qV0ATexXXYX2FoIyTQKYEVJHS8nMFDCX
	ecIJmfnoIEUGZt0sX+8/mb/M68WSq1Pg+TLbhQCKvcm2L8Rm46jyLIVTphjiVfx/YsTkgK
	W17DJdPyciUMS5TJgV5x70EZ10VOfXflput3V7TNhn3yEDwz4FsG0RY0/FSeRw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] arm64: dts: renesas: r8a779g3: Update thermal trip points on V4H Sparrow Hawk
Date: Fri, 15 Aug 2025 01:34:57 +0200
Message-ID: <20250814233529.191874-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ro33ojtzrzd8qiioe6n1mqqa58ybn7rr
X-MBO-RS-ID: 23a44379a17920dd7c0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_163556_959018_506AE513 
X-CRM114-Status: GOOD (  15.35  )
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

Since the Sparrow Hawk has a smaller PCB than the White Hawk, it tends
to generate more heat. To prevent potential damage to the board, adjust
the temperature trip points.

Add four "passive" trip points which increasingly throttle the CPU to
prevent overheating. The first trip point at 68°C disables the 1.8 GHz
and 1.7 GHz modes and limits the CPU to 1.5 GHz frequency. The second
trip point at 72°C disables the 1.5 GHz mode and limits the CPU to 1.0
GHz frequency. The third trip point at 76°C uses thermal-idle to start
inserting idle cycles into the CPU instruction stream to cool the CPU
cores down. The fourth and last trip point at 80°C disables the 1.0 GHz
mode and limits the CPU to 500 MHz frequency.

In case the SoC heats up further, in case either of the thermal sensors
readings passes the 100°C, a thermal shutdown is triggered to prevent
any damage to the hardware.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add RB from Niklas
V3: - Sort DT nodes
    - Update comment on idle states, note the 0..80%
    - Add RB from Geert
---
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 1f44005e1a11..75b1b789ae1d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -38,6 +38,7 @@
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "r8a779g3.dtsi"
 
@@ -189,6 +190,41 @@ vcc_sdhi: regulator-vcc-sdhi {
 	};
 };
 
+/* Use thermal-idle cooling for all SoC cores */
+&a76_0 {
+	#cooling-cells = <2>;
+
+	a76_0_thermal_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <10000>;
+		exit-latency-us = <500>;
+	};
+};
+
+&a76_1 {
+	a76_1_thermal_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <10000>;
+		exit-latency-us = <500>;
+	};
+};
+
+&a76_2 {
+	a76_2_thermal_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <10000>;
+		exit-latency-us = <500>;
+	};
+};
+
+&a76_3 {
+	a76_3_thermal_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <10000>;
+		exit-latency-us = <500>;
+	};
+};
+
 &audio_clkin {
 	clock-frequency = <24576000>;
 };
@@ -801,3 +837,104 @@ &rwdt {
 &scif_clk {	/* X12 */
 	clock-frequency = <24000000>;
 };
+
+/* THS sensors in SoC, critical temperature trip point is 100C */
+&sensor1_crit {
+	temperature = <100000>;
+};
+
+&sensor2_crit {
+	temperature = <100000>;
+};
+
+&sensor3_crit {
+	temperature = <100000>;
+};
+
+&sensor4_crit {
+	temperature = <100000>;
+};
+
+/* THS sensor in SoC near CA76 cores does more progressive cooling. */
+&sensor_thermal_ca76 {
+	critical-action = "shutdown";
+
+	cooling-maps {
+		/*
+		 * The cooling-device minimum and maximum parameters inversely
+		 * match opp-table-0 {} node entries in r8a779g0.dtsi, in other
+		 * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz OPP.
+		 * This is because they refer to cooling levels, where maximum
+		 * cooling level happens at 500 MHz OPP, when the CPU core is
+		 * running slowly and therefore generates least heat.
+		 */
+		map0 {
+			/* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
+			trip = <&sensor3_passive_low>;
+			cooling-device = <&a76_0 2 4>;
+			contribution = <128>;
+		};
+
+		map1 {
+			/* At 72C, inhibit 1.5 GHz mode */
+			trip = <&sensor3_passive_mid>;
+			cooling-device = <&a76_0 3 4>;
+			contribution = <256>;
+		};
+
+		map2 {
+			/* At 76C, start injecting idle states 0..80% of time */
+			trip = <&sensor3_passive_hi>;
+			cooling-device = <&a76_0_thermal_idle 0 80>,
+					 <&a76_1_thermal_idle 0 80>,
+					 <&a76_2_thermal_idle 0 80>,
+					 <&a76_3_thermal_idle 0 80>;
+			contribution = <512>;
+		};
+
+		map3 {
+			/* At 80C, inhibit 1.0 GHz mode */
+			trip = <&sensor3_passive_crit>;
+			cooling-device = <&a76_0 4 4>;
+			contribution = <1024>;
+		};
+	};
+
+	trips {
+		sensor3_passive_low: sensor3-passive-low {
+			temperature = <68000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+
+		sensor3_passive_mid: sensor3-passive-mid {
+			temperature = <72000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+
+		sensor3_passive_hi: sensor3-passive-hi {
+			temperature = <76000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+
+		sensor3_passive_crit: sensor3-passive-crit {
+			temperature = <80000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+	};
+};
+
+&sensor_thermal_cnn {
+	critical-action = "shutdown";
+};
+
+&sensor_thermal_cr52 {
+	critical-action = "shutdown";
+};
+
+&sensor_thermal_ddr1 {
+	critical-action = "shutdown";
+};
-- 
2.47.2


