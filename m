Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E56CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv1v1rCyNVZow/EufS/6YnSEiovq7wLtWvMHkvWDLt8=; b=ScjH4pGpvOlPi5JzSxmtSri/xe
	H5ftasxR0W+ODLsuT2Fu+5u3NbnlQcLN8FIz/mCY9t8l2pqFqe53zkcoPWUE08/9erxSFZcdV3oh1
	LkcvzmXR29T48Elqe583cDj84qq8917hpR/nlxzYDuhrJR35OdckBn9mjkL62pzQ0SmFOnbw4arg/
	iyZKaJvqYS4i5lL0trnB4I70QbfSdehol/fSuZ521xIaqj8Wow07cE+Ku5w5Z+01qabCk3O8oOxaH
	m6NnXRPV7TOqokbbn871nht1gL+4lXMEsjfMkPOunY3geR6f1cOZEPdMFscN+NhFLcLHcCNI7xckI
	6feJjBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOog-00000003q8o-1nAz;
	Thu, 30 Oct 2025 09:19:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoT-00000003q2F-2fc7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:19:24 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-421851bca51so685471f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761815960; x=1762420760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wv1v1rCyNVZow/EufS/6YnSEiovq7wLtWvMHkvWDLt8=;
        b=lEzTym+j5X4ICR4dleMfv+y2bcjHJ48azVZN5DW3FUtgHrY2d73LgBvETTyDdotKFY
         kSs7EUN6Bc/ePLdc4zAhGTT5q9uziD7+PYhmRzR0raC96CME9Ufzh3mObEYDZI75sDOk
         Qy7epMFKA/A230DYV+g2wp7U9M078PoRV9YI+mrehPnPazi1n70bYIU7/Z9e9gQblinK
         +jpSTyrGweNRju8DEKVeuoGQQgb6vHLd9zAkyOykEHXgeuMGPijRaxDTn+x0qhcOtaMZ
         6X3jihxK3ocGDgs7UujIqOokXsDHaULlZIh4zClmyMOpNfyOAkPMsEvaOxj2KwQCxoGf
         kfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761815960; x=1762420760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv1v1rCyNVZow/EufS/6YnSEiovq7wLtWvMHkvWDLt8=;
        b=aYe+B63Qesm3WUcg4Jh8ASb/EGqMDnFqhV+iXxjQtiVOB7OUie3d/i+GYAEY2l5yNQ
         Uu5G4Ic3cWRlDQbXb0g+hfNmOWuIihahPFFVxoM1upOqGAlCuQ/6X8MfpZNhF1XhyIxh
         XrjN6+oBe9OBgDqcvHck7cxH1Y+kA0DxSJ8ApxyUeWWmt1xqa8jJpkf5rP1X+5N2Tsl6
         e0VAa+bH/XsJEdVsnWpeY2xi+/g2APQVAH8bPyvbhQJH/YNjYBtXkWom64c/JyF4NtYg
         Mhol31B6GV8NJIe1X5vZLQWDG6tgnLN7GAIrGDJFqL3oW68Mt5QG8X4seDhUtA0wo97C
         UDRg==
X-Gm-Message-State: AOJu0Yx9VS17GljQkIM0DgPWPi2WpmTkXTvHh8iKeuA2yBxOtjFPWV3G
	HuEn0TwV4IJr5T5CVoa9Nom0XWpgpli/CQ/tF2rSd08PjXfzicJxoPDkNDRF6oR0uMM=
X-Gm-Gg: ASbGncsLOkYY75M952jya63gk+zG5xtQuWSHySJjImwhzt1ONIBrEZiHSWCw52MMTf8
	SdWkoBjP/D/2ioDiKUti9ceXwN1M7JhjBQkxD/TvcXROM4OWe0swe6GCtyQCy1MLo0mphyoAjbS
	zuZM+C/iVGDbe9Rm59lCxoFmJ4YlerohcvOeYL9wViXbEmw5sf0jvCm7UmDVzl9/k7bv4hZG1Nj
	ID1zAjnj9/bFzCWtHJ8e2/Ol8d+qfZV/BdNadBpAzveTcyEOw3k+cCUm4ComimrdszJwwbArd5f
	Hn1oPgGi3Xizd0Q6JuRKb9h9Uz4WzjrqsbcI1BMwqOblGvuKp/LZtnx3Whzb7B+VfeZkWbzEHli
	PDrFL6bfHT5doMEJKLgv0V37dCdbopAznxm0n0ebf+0Ikm5M/h1CYE6O0KTbir4lOuEZfrKFH4A
	==
X-Google-Smtp-Source: AGHT+IFFqwsdTXuFRrWP5NVqrkbjoDC7E0r4aa1TEQNijfGZoanbwnRQzyG3OWW1GIVKppxS8yiu3g==
X-Received: by 2002:a05:6000:2212:b0:3ee:1461:1654 with SMTP id ffacd0b85a97d-429aeff11f1mr4513188f8f.50.1761815959934;
        Thu, 30 Oct 2025 02:19:19 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952de971sm30461198f8f.39.2025.10.30.02.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:19:19 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Thu, 30 Oct 2025 10:17:28 +0100
Subject: [PATCH v4 6/6] arm64: dts: ti: k3-am62p5-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-topic-am62-dt-partialio-v6-15-v4-6-6b520dfa8591@baylibre.com>
References: <20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com>
In-Reply-To: <20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3461; i=msp@baylibre.com;
 h=from:subject:message-id; bh=fmSTQ+NAhyqd5hnJaZ0RF1b/fo5Oy35WVR6j4Ev0AlA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxm3ZrbPitYVvvZd3cU7/SIMVksJbTW7bU3bwXj5pRO5
 ZPte307SlkYxLgYZMUUWToTQ9P+y+88lrxo2WaYOaxMIEMYuDgFYCKqrxn+ZwtPNp19c4b7RENZ
 9zUz59fdurXgd7mzwuraX7mmZwRvJjEynA/6cnghy0nxXV9vnah+KJCu8Hv67Feii1c061av0S8
 5wwMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021923_012136_714E04E2 
X-CRM114-Status: GOOD (  11.84  )
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
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index a064a632680ec69dba9dbe591fd49caeb9ac1111..36116210fbe6111ee8bb9a1736ed02bec0f20b67 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -716,12 +716,52 @@ AM62PX_MCU_IOPAD(0x028, PIN_OUTPUT, 0)	/* (D7) WKUP_UART0_TXD */
 		>;
 		bootph-all;
 	};
+
+	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x038, PIN_INPUT | PIN_WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x040, PIN_INPUT | PIN_WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
 };
 
 &wkup_uart0 {
 	/* WKUP UART0 is used by DM firmware */
 	pinctrl-names = "default";
 	pinctrl-0 = <&wkup_uart0_pins_default>;
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	status = "reserved";
 	bootph-all;
 };
@@ -763,4 +803,35 @@ &epwm1 {
 	status = "okay";
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
 #include "k3-am62p-ti-ipc-firmware.dtsi"

-- 
2.51.0


