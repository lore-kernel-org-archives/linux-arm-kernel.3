Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B876C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bmPV/FRPcATpuMXYpDJkVPaXRC/87HeVbHp/xQd4iw=; b=DA/KKXw5oIO9weUwD7XpyFIXt3
	3CuymgB4oZE5ZsItkD/JxuGKP0RsDt4VOAmOwooluhGfejx1gMAb/JR5bNSkWqc71mBWmDKhWDvh8
	Ck3FKeB2tiE0lJCQHmMwpqdK7pnuI3qUXembM2opc8hmQPJ3qgjyBjSTCtJIiJvrj5nTQEcCj6Mn4
	tBkwOa8uFL2Qp+y066V9oa4lElUM6y77JK0PmptfdmHtgstDzhGAufv8bAZZEqUyQVrgr6LwiEfxb
	DrfhnnPO8eYTkiZouxVbXpITPa2L5omvIo9ZYGuM7kQNScdej2XJubWV3V7s7/vz/OjrZE+8d874k
	NEcCrxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9gG-0000000Aph4-0rsd;
	Thu, 06 Mar 2025 11:46:24 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9D2-0000000Akg1-3ORW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:13 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so895064a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259771; x=1741864571; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bmPV/FRPcATpuMXYpDJkVPaXRC/87HeVbHp/xQd4iw=;
        b=F0SZuz+x9iZ0TFgxfF3erILbC09M5lWFt/XTcg29Vhfzhe46rVJIhbqP5a4Y7lPWqH
         UVxhwb/J95YBwFU4Jmq1X4kBkOpJplguJztgFv3PI1QjryVs39HK+zGd1u6kHfb0mTjF
         tirVq48eUjfmejoRSKkcQY1AQYaICaODF6XVKmqk0b2HuVht2BJ5QjTSXf2+RcotOdne
         dDEqW5Nq/xUiOisrwFHavVUFOXmFtUcwqEnIzkdBk9s/SDzqOnLY11Ekn/2jcr8EVTIe
         p6RyC89H7Vcgzi4remi4RWCGHkOQinWTFuY74TG3ivtC15vEDrbyDPT76DfLnyktwti2
         qxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259771; x=1741864571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bmPV/FRPcATpuMXYpDJkVPaXRC/87HeVbHp/xQd4iw=;
        b=VjjToDNoqfeItoerCWo+Bjkz6RGMzyD+agz9ZEwU61J3PUgFwZ/nrP7ao2Y80pUk+Z
         gXA6dQl1/WRjbojacmD4eaW8uK2BnJozNb5qTQzg5s/BN920Ig7rI7NYrImrMIniRO2D
         M3Uv61hvqT+TRs9GWHmhoqguJMYapMupsWCQ9lDnZs8MNdeEX0UML2mlN/h4WExExoUy
         egg+//JP/BxUxcSFnYIYCmYpsgfY58jo0P+okP8bK+H6hSUYRK8TTwooPMYjBRbKQk3d
         xfdILWkH2wiZ+FlBTP6/Br5VKJBWIpNxu3Ft/LcJ/O9fECoiW3Qe6pLJp/SxLIjKWdMQ
         PSWg==
X-Gm-Message-State: AOJu0YyBBNAooXGB85zlGtwujCGBTxG0uFeUrLe9hGrSncivn3LpabRv
	m+HCdR6v2gWz6SAq5gira7xUta2MhQPQJCIkGN0eLIhkzuToTu4k1tQp1aREtvRwLSjilGX3xfL
	g
X-Gm-Gg: ASbGnct6Uky4zK1fGK6S9fVDoFdDy/fLTg21nbMX5wJJJVqB5UyuvMt7rZ155cAYyFd
	w0IlnO4dlz3em8XJ0XGBK5j8mEkmALKuOpxP4rF944LiCFAmg7/DDA1KE3UmP4wR4j2Qdsb5SeK
	r820htNGZTgMswbmo4gVJ93tES+213oFTE3d+MZHReLw0rz9SAQFhJXyRxrEza2T8+RqZHf0B39
	HlbDHjenigapoN5atKnIQQmg5o8mkL8dizX4uwuDmv7oUCY0QWSpgOrhYmSxouuNq6gmrYxIN3H
	ezPftwTJQ/FAQmi1o0+OciytfQ8RH1VpMXeAKMtd+w==
X-Google-Smtp-Source: AGHT+IHi6H4e1zM8WhPbeq3pRF6PXTRxEnL0B0tUSBxEH6HkSKEP4U/KqR0WKz1k2tj8aWfe1ssuWw==
X-Received: by 2002:a17:906:f5a9:b0:abf:4550:9764 with SMTP id a640c23a62f3a-ac20db11abemr594377066b.24.1741259771152;
        Thu, 06 Mar 2025 03:16:11 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac2399d4edfsm78843866b.171.2025.03.06.03.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:16:10 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:50 +0100
Subject: [PATCH v5 12/13] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-12-f9323d3744a2@baylibre.com>
References: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
In-Reply-To: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Kendall Willis <k-willis@ti.com>, 
 linux-can@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107; i=msp@baylibre.com;
 h=from:subject:message-id; bh=KtTQn+xbWTvrFNJyHpQs15WQHP7pkgSdiPMOyaSYVSQ=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNj88/pN5piTHvBqxmQWKsfpTdumkPitj07ATDRYwF
 ax8UtDbUcrCIMbBICumyHL3w8J3dXLXF0Sse+QIM4eVCWQIAxenAExklRQjw5QVdh/Kq7r+WU/W
 cnrmou9X/9N89lK12n2yDzu7TnNLSTP8LzPdNbMpzuPWLhOl4InzVayfuM6t7fCd4jTJ4pjjv8e
 b+AA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031612_855397_4C9D6FA5 
X-CRM114-Status: GOOD (  10.69  )
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
powered during Partial-IO and IO+DDR and are capable of waking up the
system in these states. Specify the states in which these units can do a
wakeup on this board.

Note that the UARTs are not capable of wakeup in Partial-IO because of
of a UART mux on the board not being powered during Partial-IO.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 1c9d95696c839a51b607839abb9429a8de6fa620..724d9a6f3c575fe35496fdd9e17d6d8e33869f92 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -741,3 +741,79 @@ dpi1_out: endpoint {
 		};
 	};
 };
+
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
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
+	status = "okay";
+};
+
+&mcu_uart0 {
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};
+
+&wkup_uart0 {
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};
+
+&mcu_pmx0 {
+	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT | WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT | WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+};

-- 
2.47.2


