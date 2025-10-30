Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFDBCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tPbQqMIhSr6O3bhSUBYsPWZBJsuNCJDVVpT6zmr8+4=; b=1ohjn0DEAQNY6+LypJNc4NxgnW
	lRBC1Apidk1vyQGvkOGo9/+up0hfpXSw0HckNxlwYcUSOeiBHn2kdiFguW2/ttSrCLmrqZq6Es2jm
	elNFDf9dEpMQn8aFrONfXH4mNB97EoNWtkXGOC5J/lPVa0r7iEVRGjVXged57HGVPDqlUAOyfaRtb
	kZVV9FO9KeqGHF423jv2GbvP8as/QKbg0vxctXZ19CV5C4hUXRPNCKXS/ScdCzTx/Yex8wueScsiZ
	w931AKG6PVtBJYYdhmtPJLeh1IFrsngoKQ3/FAay69FLpJUsYnIQMGESn0eOJHIIn/8ibtHCZ6+jS
	urQTd4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOog-00000003q8J-0FBY;
	Thu, 30 Oct 2025 09:19:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoS-00000003q1C-1G76
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:19:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-475c9881821so12539715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761815959; x=1762420759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tPbQqMIhSr6O3bhSUBYsPWZBJsuNCJDVVpT6zmr8+4=;
        b=bxAA/IaXvwmwkfsGDmE4Smv/79lqlZc2mOTNsBvbCRLAm19ZjY/uK0BSaTA499poU8
         xPuWkt/RjtdqzMacCYU7W3xj7G9F38m0ah/NfEFKrS9TyyLJSEGSxc+rt4811Mg+bb/N
         zrj8i0J9TNGMh/eKVIorAI2w5iIOD6ri0BdWzlW1uu720Q9PmCw2JaGlDky4RbTQjE5e
         YScnpExHCzXGzCHyi+WDB/LXFlOa9IXpSOijldJxYn4xjpHAz174vSYUeKKE3neiLn3c
         8d1McR4j8mgCHwywR/Z6xvGm39l6w9MuMGG/HPJeU8RHk0QQgmAkgVl9ijYFhsoT0iWq
         Ri9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761815959; x=1762420759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tPbQqMIhSr6O3bhSUBYsPWZBJsuNCJDVVpT6zmr8+4=;
        b=W2rAUjwgJhpqSaho4XDzRuYRdRviJJF0QZ9bmnYzUBe9UO1rtSIz8PDMv7HXR71pOF
         j2BOkQHvdKkJSvV/26ZloyHUUquNxIJmwwOmlmWgJ/omawbBLgEIxygWwbR+yBSQ2syP
         h7OjQRIrmOKfGPMkTZKkCrhmPavCJu8Agwd2K1pqr3/rR5uwUwQqiAIZwv/JTGkK9Mrh
         2Vm61PexlsRWqEpVcYJJTOFHqEKO04WqqI0ZMLz1ZS4zgZdrifEkw+FwZl2xJ0EPZNKw
         Kh1Og/sRCC9rFAzXYIecNTZlqY1QMx8eVPRzHwXxyXak2F6R/9IGKcOL8xeBWH0DPtaI
         uxxw==
X-Gm-Message-State: AOJu0YyY7WCk6e8e+JixWez3BdJ0kNClER49vLy1v/0nxzxQwu38OjCw
	f8KhnLIs1Et1dttHNLQ66XQOJN63o82MSTaU3mRm9ZMYRUunXlDguvQkBE4i6/Qs2YA=
X-Gm-Gg: ASbGncuYTDXVA35mc3r9Em2xX1Sbe4pi0ztfvxrfe+jNmLmHfEtOQenD0PGSPjGcNzy
	+IaGYS2chrKE2EVTWtoKqewEiJjyZ/aI6YWZCsYf737pSg5Tq//AO5FFxXxfMPTlDklrdPMoH5N
	Q5/LqgJ1eUZpesGuEYoxYfTXb69M4F8wR5pJ0d+ILKHEnQ6zibn6kYyYz3pjxGqjO2bu5pfdllb
	cklRNGEUVATGzU1uGGpm0tqMDuAigjuHFTpUGHnj1Ne/osty0xGxQ+fd4YP6vVhfSjprv+GHnXT
	jijOqmzDI4BsYUdNOspQw0Ji0OpOwr1TDW8uj3kqO8DiA8YrAjN+rigxPqocbftY0wcd/Cb+PCo
	mE1HpoJtJEV2UpR31IVsSkSNvkDPGzZ32yfJAtaQZMwro25ebLZ+o2dP95nN4ndv4JbprCF/9DH
	6d3yNQ8lys
X-Google-Smtp-Source: AGHT+IFcE9q/kyflF9AMCkU9/dO/5fz26ntsTtcUbDvLfoDxfh/eegwIiNQAhehq4TE+V1RtsJ7O8Q==
X-Received: by 2002:a5d:5f47:0:b0:429:8b4a:c3a0 with SMTP id ffacd0b85a97d-429b4c0f3f3mr2278972f8f.2.1761815948696;
        Thu, 30 Oct 2025 02:19:08 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477184251c4sm66858255e9.1.2025.10.30.02.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:19:08 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Thu, 30 Oct 2025 10:17:27 +0100
Subject: [PATCH v4 5/6] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-topic-am62-dt-partialio-v6-15-v4-5-6b520dfa8591@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3575; i=msp@baylibre.com;
 h=from:subject:message-id; bh=DlDTQjPaKp6J+FVUMs+te99gGVccW2aVrvQUcaozCNs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxm3dIV/ZtySxkD1Na2iyvHt+1lYdc7d415fazqpRsXp
 KyEd4t0lLIwiHExyIopsnQmhqb9l995LHnRss0wc1iZQIYwcHEKwERm9jH89/HQeffVbPm8N+lC
 Eo3M0ybf7jdPF1n4Vv3+GYWYfSLXnRn+VzJXzas7fD8rKi9885dFyUunq2yqTy/nnXj/rufFSQu
 SGAE=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021920_385322_88AC5917 
X-CRM114-Status: GOOD (  11.34  )
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


