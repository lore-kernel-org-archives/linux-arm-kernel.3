Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7B5C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1e1sFMuanxAa+Td3a/eLs4/hH5oD3lPWfNrjvb5a1XU=; b=vZcJSNYUAmyMy1s+Fbeo+099VF
	+PXwje4N6vnSgHP0m6H7HrmzE8rIX75+KDJfAHZ/T6phkASCxDAJOTwzKhiV0vXh+gguFpbFnHtp8
	mM3DlZ7YDTE35ulEYOjYxY+6euyrCImEup1SS2XAn/+fIvl+INabiLSpEAUO4Lo+BVlN7iJSJY1Uq
	ftuqH1L0oAiVOp9VgWcznN9ELMTC70xXAMGw+djGEuTr9yGXwDs686eZ6GF1unEXyYVLaMgmhJ0jy
	t4cbduVv6bDHiJGoe3ue1EnHWDG6ZWlrXUhoUtNR0BFMpT36RBESSJMxRJvAgHNOP7orV2T4Oz/h3
	UNrZxTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQ8F-00000008ncB-12Lg;
	Wed, 25 Jun 2025 13:25:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMz5-00000008FEj-0kVl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1e1sFMuanxAa+Td3a/eLs4/hH5oD3lPWfNrjvb5a1XU=; b=h7Q/LgGtmnjIGliVlXzbbE4wCK
	lMc37CdmX5eQzcUXgLhWm5KvmN3Jok7nwl9q5k2DBLkS6QIZDeU8QTxULBnVbPqVojMrKzQsocOMq
	JKHZ7dnWoRXbVWJ43R9GhwR/92Ap5cfBoJUrhUsFNCSXuTonMEhiUDrNkmEMzcOMIP06Histn12DG
	rKsHAoTaX43aumFid5CUC/za81/kFZy8y2z+tpgPW/VNUpuG6FWHNU67LPvXHpC4cPOzgf/ji4PBc
	65l5Kz4pBoE35nBlnzyMyx3uYsJSVP8RUQMwr9VbIUOP/pDHiAIFhmZMlyufhum2mdk60kNxiBbzs
	CuHIywzg==;
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMz2-00000005lau-21H3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:04:02 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bRy822BY2z9sqV;
	Wed, 25 Jun 2025 12:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750845826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1e1sFMuanxAa+Td3a/eLs4/hH5oD3lPWfNrjvb5a1XU=;
	b=qRQjitru9tygF5Kc4su8oQAPaqkkWcc1QfYg9S6DSdAFlb/7oUiZrFusBfTLLNilECt9d+
	TcJy2QnofIu6D0jHD38sMKFUxaFmCS0uhVAT+d+lDvOZo+Uw29cuU7gFg4qi05H8kH3p9O
	YwXib4cFFonMH/VoL2IJUhl5Iw4CpY5qkd7YEPhLBX/U8y3J1TMpNR8oZCWFUVDEc1PjJg
	guabVnUOseBjrpQm0es92fcaxhXCjpCArwqXKmMwYD70H57VUl36z6qlUXNkVsgW+bfDR8
	Pehm+FBLQjfaogFCpNuAricyNZVssyOWwQwVGE+Nd2Fzg5Thz3AISMw+605dQg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750845824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1e1sFMuanxAa+Td3a/eLs4/hH5oD3lPWfNrjvb5a1XU=;
	b=PXy54VMh9zn6rwJfPg2wgjgX7Q7Lvugm4zpiUB80jiP2USoO1334J/0EMNHgJeP3osKtDG
	6ZMzhnMqZMA/AjDg5+a8ybbux5gw3a6A2+GO7yaVtcMxl/Er8q9B+ahgVvqfMYDELmSRQv
	qxN+NQB/Ox/rzSYka8ke5lJEonw3304EEdmOM5pD/apzP6h9rSdBQJcemhCQPfUbxANoHm
	eQnzLrTvsntE1i77Gv4XTKT1iu9ZgDx8T1RLO4Rw3DUh65uUExycxMDNLG58PLena3nbql
	rJj7KdxohJKBYnm7bdPSl9ave3hcFPz2oPy2MuwknVc2Nc1j8jfN3DEEq5vnug==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points on V4H Sparrow Hawk
Date: Wed, 25 Jun 2025 12:01:56 +0200
Message-ID: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jtijeqpxx7kp7ye5z1jktp1k9juo93aq
X-MBO-RS-ID: 3bfd9289a412a0a700e
X-Rspamd-Queue-Id: 4bRy822BY2z9sqV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_110400_635725_A08C3EFC 
X-CRM114-Status: GOOD (  14.47  )
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
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 9ba23129e65e..ba81df3c779d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -38,6 +38,7 @@
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "r8a779g3.dtsi"
 
@@ -797,3 +798,139 @@ &rwdt {
 &scif_clk {	/* X12 */
 	clock-frequency = <24000000>;
 };
+
+/* thermal-idle cooling for all SoC cores */
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
+&sensor_thermal_cr52 {
+	critical-action = "shutdown";
+};
+
+&sensor_thermal_cnn {
+	critical-action = "shutdown";
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
+			/* At 76C, start injecting idle states */
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
+&sensor_thermal_ddr1 {
+	critical-action = "shutdown";
+};
-- 
2.47.2


