Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BA6CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x8toXQoMnFvquaDgnJ+GkHe0JMDPrO2jJ2prwKygxE=; b=K+3/lQmJx/yjdUfxFc8FYDY66a
	h63T5IRihIAGTO8odGIh2pZdRAnoVU10D0WLZv//jGKGlR7Zb5+SRF/iolcflcKVKdppLQh3MqEwJ
	zZCnOguXSek/jocHo2CsPQ/fi0N0jLPpVfOG6p/ACsgUBbA14EePvuu31Oc4C5tZ3UCUPtcosAv51
	YJ88V8e08vJC9L4+gLdrStzSgkuw/v8bDAfikpiwhF33Vnol5imSQqvwATxfT8niMgVZo88n6Oj0y
	g1/4XrzA5yn7JLXWXiKcIGEEXXJds4TUSBQ7VDVZRlC+C/6eRYsyMm0Ulg7Zmvkrk5PBR/IFx9UgP
	VdxyqbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtrE-00000009psQ-42YJ;
	Mon, 03 Nov 2025 12:40:24 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtrA-00000009pnR-2154
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:40:21 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b64cdbb949cso713868666b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173619; x=1762778419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4x8toXQoMnFvquaDgnJ+GkHe0JMDPrO2jJ2prwKygxE=;
        b=OtGDgJ/asTb5BUHgKdPeD8gPl4FPAP81pTzzyAXPHyjBSVPi95Pe11xUbKft27NK22
         TbZuBi1+6A3oQE0pGzjnfRRXPrYvxpZ9ok3m9Joj5gVFosXyfh1039cJ9HPB4TF63N96
         lMBS4kZndrssTIpJHU0jBmDP5ZR9XBTs+yAefG/dSepBVzKG4MU/lMX4tr/brVz7RVux
         bg/bwarsdqPTAHrWl8Yk8gz8byMLY55VDumUbUbU3dAow7PhTdnnXIpuBnMy20/XN2X/
         zJRFQYyJ0TywrMI1Pz5K4TZ4Xh4ESkk4sWV3OPpEunpVHd6TDCIcrQnOc8MtxdyBCzvF
         gI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173619; x=1762778419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4x8toXQoMnFvquaDgnJ+GkHe0JMDPrO2jJ2prwKygxE=;
        b=RyMKDMHMGQuccgyx8rVTvKmXRFdqR8NAFUaXmtA5RxFv7IVNvr0ORrbnn/U45NPFYt
         8c3Zn9uK2NgKJzSHeE+FhYiqO1gqVFfnl4wNzY0ImwsKgx0VPRIYMGiHQwbRKKHPEwZR
         KNtLY+STV0agaQJ68TPHEpp81yJFFZu9DzrPkElWjfrFc9lCRtGOHOMYoRk00XIrd1e2
         IloeybvfRa0Fk4wqpOru0/9fr9b/zfGkUWRI2GzRT0MrAsCis2PW6DU4YTvBI8EtGiKV
         kiG1EJ3r3WC2XnLSy4TUyu2TFn1CefSh+bEAXyR3mdpP9goYxengDpqr3e8GsEjxnq8M
         tWkw==
X-Gm-Message-State: AOJu0YwaNuVKtImdDL/Ev8/XwO6PZdVSLdZ2L3acsYzxn6n3acXyJse1
	gwXn1OY84ZQhRtwYgaYRuTQwm8vGaf6z6rnOCKZBbn2mb9ARB65bgrQH0f0oDGXbfxo=
X-Gm-Gg: ASbGncvdfJcHBlEIU+t1PvUDXdjH0M50Tk6P55qLKodKEeZiY2zG0t4KbHNNtyDW4h/
	JB/ErBmIyPdbhVDkhf9MhfNtljA5PspU9FmjsL5cJvLatjrb0nkt5s4yKn/FHhD93PsEb0OLyI4
	rhkjjOTLo+xjaEthtyY5Ysh6YHreHWleIulJALVyKvO7La8xiwGSD2eeUp/QlBl29KzlUX2RVoV
	62ZrVBu9rhinB3rZnlIz0GQkY2MVuBnXcSKknJhbBq62Ty7tIiTMd5Q/G9JMnG8iiajS5MS5iKB
	HRHXXmgnj4GzVpl+ns+syD884C6Dh/I4mPgaM/pj8LiVj2izoxSjx/LLNG7HbSTUkxn7nNzfV8n
	Xxcag/8T9NnO8/JI/S+Ib27eZBZeGiVLNTIuVzELV2Q67rNUAz5O5KgOhaUTlHXfdupm/rOw=
X-Google-Smtp-Source: AGHT+IHV/4ImtALhytuKHNJv14h0KzIDzlo+tB1lyxS9YabYqtnsudfPUUOoQRyLSp22oOCAqc45fw==
X-Received: by 2002:a17:907:1c94:b0:b4b:cb5:133a with SMTP id a640c23a62f3a-b70704b9243mr1143893666b.39.1762173618456;
        Mon, 03 Nov 2025 04:40:18 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b71012241a7sm254039766b.14.2025.11.03.04.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:40:18 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Mon, 03 Nov 2025 13:39:32 +0100
Subject: [PATCH v5 5/6] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-topic-am62-dt-partialio-v6-15-v5-5-b8d9ff5f2742@baylibre.com>
References: <20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com>
In-Reply-To: <20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3535; i=msp@baylibre.com;
 h=from:subject:message-id; bh=HUyVsZ1Uo+y8zY0jQWgZxPIdkvaeFXYf2apVmFo9zRw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyORfPc0vYtnOlx/EXs80U3apNyJ379LFi17yrPjdbYg
 wYyErO0O0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAi96QY/um4cqWLPPF59cht
 8/85QjbWcze7ql6usnZ+vnB70cqN13UZGW6suePT2S/SPP+G86x9K7hZ5t1dzbX0yJ39OlNaU0+
 xW7EBAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044020_566131_74E4D818 
X-CRM114-Status: GOOD (  11.10  )
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

The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
powered during Partial-IO and I/O Only + DDR and are capable of waking
up the system in these states. Specify the states in which these units
can do a wakeup on this board.

Note that the UARTs are not capable of wakeup in Partial-IO because of
of a UART mux on the board not being powered during Partial-IO.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 69 +++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index af591fe6ae4f0a91991d2904a9a61905a0eeb614..b61370db6986308ec97983f796b993a26debcabc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -233,6 +233,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
 &wkup_uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&wkup_uart0_pins_default>;
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	status = "reserved";
 };
 
@@ -426,6 +430,42 @@ pmic_irq_pins_default: pmic-irq-default-pins {
 			AM62AX_MCU_IOPAD(0x000, PIN_INPUT, 7) /* (E11) MCU_GPIO0_0 */
 		>;
 	};
+
+	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_MCU_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_MCU_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62AX_MCU_IOPAD(0x038, PIN_INPUT | PIN_WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_MCU_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_MCU_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62AX_MCU_IOPAD(0x040, PIN_INPUT | PIN_WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
 };
 
 &mcu_gpio0 {
@@ -852,4 +892,33 @@ AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (J24) OSPI0_DQS */
 	};
 };
 
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};
+
+&mcu_mcan1 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};
+
+&mcu_uart0 {
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};
+
 #include "k3-am62a-ti-ipc-firmware.dtsi"

-- 
2.51.0


