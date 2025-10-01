Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859BECCD182
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tPbQqMIhSr6O3bhSUBYsPWZBJsuNCJDVVpT6zmr8+4=; b=zHf3+N7KgeHdFpfNaCiyqNcSaa
	zS+3gmoyM4lEaXaODj6FVRE+93YvHGu6qYIfM18gFB3LeLSy0myvi9kt8rwaiyhmahMC15d7OvHgs
	pSJ4xcThvLvzumHdTDB4yStobBs3dzb0BvPVwjmSapzG4OEcZdV87h2VApjfgNU9TU3S3zubM8USJ
	BpoO5DrD/Py5iPPhbCjrC58gswrrhyzTupRGaxQ/zKQV8lPQUF0PAxPQzSMgdt78nQH6xucjXbxIT
	XjBRpmaLqpy3pdeYznPpG8Q8sle50jGXPXSoWiZMTKUElp9A2lkWxjhRchhGaq7nP7CH+/egCArgQ
	8StSgfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvR-00000008CHO-1y3F;
	Wed, 01 Oct 2025 14:35:25 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvP-00000008CDL-0P8a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:35:24 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b3be330b1f5so864691466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759329321; x=1759934121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tPbQqMIhSr6O3bhSUBYsPWZBJsuNCJDVVpT6zmr8+4=;
        b=eVT6xBOYZqqEF8VPS7rFOin2f7Avb3zMmGcj4lykqPOe79ZgzFPEX6bjvO73Jl0Aoi
         QtPt72EI4OL9RcbymApfWgfXYoWymhk4gFNLlI4OJFxkO2kD4pJVdRg4UuZt7qzOL9Ge
         ylTiyO6blswOc81cV3TUf//81TqATFsLJv+SRHjcpTh266RM+zb2pgnGYxl7nog4DFNZ
         uJ7MzaS3kDBMDNU89jCut1utLoalY8O8iO5lfyz05V5x7S3Doz8v4YbbKDxGFdDU8n7O
         TvxDjK8k/0FIBmo9QbVHP/dMjj9RJgeujsLfR2Qb6YqrZYoiMD1xl1rrtEVeiZ04RuGo
         SiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759329321; x=1759934121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tPbQqMIhSr6O3bhSUBYsPWZBJsuNCJDVVpT6zmr8+4=;
        b=LtFbg7MnaNjnM5tN2tmmgqDyD1ye2LQO0z0pz3iTbZPIxecxiVciabrcPR0DbJdmyQ
         uCpHIVaBwZWrwao8uxMnJHhTHgAprWy2Ruf78LdiijVMUB3UKw4h1lhXCy+adympfe/T
         GTXZH2HOAMofvIOhAds4VMqJyL38Eef/F+VmjeZw3NElRFty1WIPb6NrQg/RXbzmeGqW
         Xz4WHQqpPkcjH/tuXaJW907hbR8HP6eMJEpiIABDdxZ1OTJhjQEklV4ulXv150T6RYhp
         SSU5S10LpwvJ08WEHPo2RPxbsYumH+I2SVMD7QxXnOeiWpGJVKIF/5gFKyF43EpF81YV
         vicw==
X-Gm-Message-State: AOJu0YxBWw3pg5r4Z8odgl4bYcb/oM4+hfbQWAtpLak7B6ENZGcz5dIq
	YBqL9XgN0AQ66n4PVTNpYtWiEMiKn12kALgjfs8ru9cmtVZ1o/5Qiuhz9VpAlarGeYM=
X-Gm-Gg: ASbGncsFtMnDS1HbIF2Re2TuKfyJ+NUGcbn9tSyuRWWJQuvvfS3L3L9HcLsF5xdQ8RF
	SAwPjw+fnYyzDeDw9sTmNGPIZ+1aPyD6e247r16TGEeuoHroX8T/nqwry4mDRVUqlVR2GeBz9YP
	znd9oKLkj16vgze1TTEhhqqgbaGLnkKqqD7fuNyUrYB0ifP0iyMWh/c86B5WEWh3riRP/Jiop/x
	QUhYIxj+rodsn7pTl1isgdQbH2KD6ZTWBwK7aSShTmLPW91lQTrAi4EMvs5Y8ElcwNW4hUO3kbL
	zlXLudxdAyhMVdLedSVPMkNMOE0xQAOjPENrq5t3zdlo0wKbB47rW5fD5g3z4FNOSq3GgfeHrgV
	c+es3/sJz7UCct7khMfQZtzB8lqSk9LLobSxibSEzND38L0WBaYggU7Y=
X-Google-Smtp-Source: AGHT+IGr72kB2msy16BRTUOxzq/uWEWO32FfYMCXAf2SFbCp+4xcc2vu36b8zG0v7G7YcXnejAZ6QA==
X-Received: by 2002:a17:907:da1:b0:b45:b078:c522 with SMTP id a640c23a62f3a-b46e976545amr454413766b.36.1759329321241;
        Wed, 01 Oct 2025 07:35:21 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b35446f7834sm1395230366b.65.2025.10.01.07.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:35:20 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Wed, 01 Oct 2025 16:34:17 +0200
Subject: [PATCH v3 5/6] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-topic-am62-dt-partialio-v6-15-v3-5-7095fe263ece@baylibre.com>
References: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
In-Reply-To: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3575; i=msp@baylibre.com;
 h=from:subject:message-id; bh=DlDTQjPaKp6J+FVUMs+te99gGVccW2aVrvQUcaozCNs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoy7NsI8kaIbnhnx+67cr6t0Xn5xtOA+P36106tbJPa3O
 Pv/0lrYUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABM5oMrwTzll0UE3vXm9RbJW
 Ddt2XJ8dsynnjte75rnuu9ReZ0iFtjD8Uwp8/ONYbcbi4zwXHlyL1PmpKPoguvV5ZJSXzoHFj/M
 t+QE=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_073523_173866_501D03DB 
X-CRM114-Status: GOOD (  12.14  )
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
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index af591fe6ae4f0a91991d2904a9a61905a0eeb614..8525aa5ab812c51e2d3371b39baa5e936e616158 100644
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
@@ -852,4 +892,35 @@ AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (J24) OSPI0_DQS */
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
 #include "k3-am62a-ti-ipc-firmware.dtsi"

-- 
2.51.0


