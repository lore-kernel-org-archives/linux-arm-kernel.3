Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BB0CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEOzYQjb3bYzTT0+rBoXJ8LwprKU2LjyQuBHnHtCHRU=; b=avqykjga//r5LwnArM44asijJ6
	kEXxV1Yt2dHcOr5iKDWjZRX8XtyZbIeag3UZj6UWUkjF980dCZpcCYM5vDNhHjsx/Gw6VPS6/k6lI
	x91THi80zj1I6m5GIl5+ci0kS607veKLyE4rA3pRakV1VIZjrJ2JyNtvFZJlSIq7hNvz5rX1OBJ28
	TvEZSYdxJiEQAQ5vzkOM9IpOioR0+LifX4AMHc4iyTlYvUx8IC9MtRepUTuU3UkNTcZRO8jvIy62l
	yIlU8/cObjlaQh9NCDql7yNXO7/2LEItm/xxMV7tibyoziHnbnH3Kh0qSe0CepKYqhW+iPfT5lGss
	4gGb6Zeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtrF-00000009psz-1BYe;
	Mon, 03 Nov 2025 12:40:25 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtrB-00000009poM-1gau
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:40:23 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b71397df721so112624166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173619; x=1762778419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEOzYQjb3bYzTT0+rBoXJ8LwprKU2LjyQuBHnHtCHRU=;
        b=lp0Zx+nlLBHK9Pv08kZWmZ+GO80c2+B/VKX0GydHxjRyLgtRlXRO1xMHHb5KyrKEFP
         /WcSP9wC9bTf9pl83JXWazhdSSuF6zevKEfSVaRbYECl5L5Q6muZZsJSUSI1cvXleULz
         ySSMZ/63vIYIODpe5acN0Y+GnBFNbJFYqFLtDKpdp1Rpl21DDtlXn54hgs3aPxiW1czH
         V3DJyCTNiKQdujM/JX18iNHCComJ3pYIS9QfxAw/7Bc97YzQ7r9LYEXHMKfjsYpVABkU
         rDk5MIv1XNDIDcfE3aqi9pEPb358Fv15COz6ytyKxOr1dMO4VorRBLcIXuOE+nToDb2L
         0Yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173619; x=1762778419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEOzYQjb3bYzTT0+rBoXJ8LwprKU2LjyQuBHnHtCHRU=;
        b=hCd9CRR/Q8KmYAnS2Pz4OqMRlGNPt4eAKmHBMwE7Nvibls2qSUpWCEYNemO0bTi5LH
         xlqib1Qx1DqcP/om2oHrVx5iDZcRtk8J5gBdL8jntRRXnjF0rmPPcNobyOEEJhUtI5a1
         97E6sjfj41isG3yptxOeBwreNhmmBjcPrF849JGcywUmoZSG0JvGEFkwNsIMxIhCNPHy
         g0/85zWjRpBwj1M7m4/wKEjbr74rAQYyowNypK+dYo22s/t4KVtHF0K4hr3Ps014cazB
         xBsdx7/5TjSOBW23ULKrCa5MM5RgHi5ZIFCRr7NVdlM5W7Vc1r0QBzfK69b+QQ9AJ46d
         cOgA==
X-Gm-Message-State: AOJu0Yy4iGawx6K7Y1szI88zHaskRMoI4gHpdqzR24jg57+mFJKz8dpO
	s2+cb2W+ZkdZrMhkA9NLH1BjkYGvcGG9WTmrrjTNNMjLx6Iy9cvpVKCuGnDLI8W17e8=
X-Gm-Gg: ASbGncsRvsbNnSrL0a3Pu3wYA6W4spafv74vp6nsME6J75ggRpYaEqQ/rGnb0alnzwW
	jWHnOasQoyrTOZyJyqwamGkype7RS8OZWT0ziP15yrTO4DDZUx1VOpOEKAnwLAtsu1RjWPa5BQk
	QPcB/zFisHojxCS0GQgEl1WigwMYEWO1PizegbMCm4ZkoVY1PLrmAeMffB8ltvZHxG3KNi5Yec+
	cNGsFWC+ATZcxskeJEXLMuJOooWTZgDd2UV6NwlbGoxdVGoDlQ1n8aeClT6NHLf/Iy3JsErg41i
	e0z/afOCWug8GWiO6Z7mdVrt8sottqm+ktCE+svJ2L72WOMSfRHag1pONtHxhlxIlmRjgYtvk6n
	m4k1npls5NykK/QCQfWm60r7cJCcI2fI3cd7ueWtM/yU1pERn/onxPLu68jcyKQu8XqHLtDvu2d
	ZDEPYZPg==
X-Google-Smtp-Source: AGHT+IHn0eJ3Tu256jIPX9/GzApN5tFapxvyPCs9nNGcBmAd/Kc3dyXibpeRl/PQ7VLIbeGw643Wbg==
X-Received: by 2002:a17:907:d94:b0:b6d:3fc9:e60c with SMTP id a640c23a62f3a-b707016b28cmr1301623866b.20.1762173619542;
        Mon, 03 Nov 2025 04:40:19 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b707bf79e72sm1007193366b.51.2025.11.03.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:40:19 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Mon, 03 Nov 2025 13:39:33 +0100
Subject: [PATCH v5 6/6] arm64: dts: ti: k3-am62p5-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-topic-am62-dt-partialio-v6-15-v5-6-b8d9ff5f2742@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3421; i=msp@baylibre.com;
 h=from:subject:message-id; bh=PBPbTiaRFBCUflC//sGsNqP/r7El5dOHwJAilCXJgpw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyORYtTeNIY98i/fH75983651w+v7YdE53D9Z4567Xyu
 13NmQJaHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRlJUM/1NnpeWGFTKo3uHZ
 xPzwi9CJnOJze+z3TdAWCdbaUNR2oYORoYcxYY0F21Kr/dO+ta16ZfTm+IE5akd279pXcCDge/X
 0JGYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044021_500558_CC2B4AA6 
X-CRM114-Status: GOOD (  11.51  )
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
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 69 +++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index a064a632680ec69dba9dbe591fd49caeb9ac1111..caa2f7d97aca8a48d3f165362601ebdf41d0b2e6 100644
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
@@ -763,4 +803,33 @@ &epwm1 {
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
 #include "k3-am62p-ti-ipc-firmware.dtsi"

-- 
2.51.0


