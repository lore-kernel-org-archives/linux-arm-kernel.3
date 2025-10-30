Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDB7CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8YyqJ4Mpj+JrYYcigX07q99vEPrtstJUifgILYXIvc=; b=M3QQ1ETKPfkyDm0aTMzer0K9VP
	zaypq4pZolS8OOveneAkZjVbCuaCV4BUViubUb0/ohDl3AHOwwgThYIEgr85xQ1zj1mdGl1ITocLe
	KBQHnGJQC7++MrBHZhkXmtU1OBLRJ85XMJS9a1OD4FEsFrb/IsWFQkJAWHwfsJcxfuh2PSMU5dnam
	5RTY+bOGdMTaepcj7KgIqjbaOL5RPfXCoFtSXBNaU7Re7EDqJBYpZhzbuF76Z8aJ4komJhF4PnegX
	tLurGCHAV1tFJyDJ5IVa0qdcgrdQ1rdRCo4XScUD7JDzRO9SWXBmTz28Gu0C2nMVqTKVUc+PGgHUr
	fywAixrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoQ-00000003q0Q-0oqB;
	Thu, 30 Oct 2025 09:19:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoH-00000003pxS-0m0r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:19:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47721293fd3so4916165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761815947; x=1762420747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8YyqJ4Mpj+JrYYcigX07q99vEPrtstJUifgILYXIvc=;
        b=oEzv83vNutQ3JzRSqtCgmd8kxIygDu0o7IOujSAoYDZh3dNXYRY8tu7k/dJivJkq2o
         cnwuO9F2JURun4oiyyQ97RB1WrU+HECmo2a4mCunBEXrWGY7LBWVHXjX2fNOT+1EfgHD
         miOrIXWbYBVbgnuq9R9tih1VLra2CukrTM1z0MkjYlpefmljy7U53jVE0meJ/1NamfU+
         h9Jnb7564NHIZo1/fcmBFtKc0VbNAJkNjL0QmzwPwb6wldynVESHjUZ5C+2dJsofLaod
         BW3xKTh/XwjP/rpZAqx+fqnDaaxKaq32peeXBKnd1HgFpU3sZn9hzQGkTFZeioPZeQUC
         6NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761815947; x=1762420747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8YyqJ4Mpj+JrYYcigX07q99vEPrtstJUifgILYXIvc=;
        b=ZsapXI1xPpHFFAQYRV3xteEZ2UFaHiETaqTv6MFNu5RK6zf5B5woPEuroR4KigWlzn
         tlN556krjAWvMvraiBn2qreK3LIWtcllAkoAYTkB9ORAr3N6NPMGfuKtjvnn18o/lN99
         3QISyx2pNQe7fpl+QqLKE0mZmJmuL07Lpbj5Z2N9OsCRiVg0FVs5idxSaGrLaWRwEIH0
         EuJn9WcHzVRq89Pu6bWPyQrrfJeI1vPMFR501TjDU7p/M6caeY5FFVQ2urcp1iEwIFFt
         lsll1Un7Ur+it9Yiqx7D1U12ak6ynkwW1ckp4O+wZcRtOBfgznGVzjlSVze+Z/dPaQmW
         FXUQ==
X-Gm-Message-State: AOJu0YyBdKT30KUPpyZuOv05wVLIN1UaQjQjmXqE2yLzsFQ5jaOBnACt
	qCOIG7JOFG9fGYi8uTBt4MxQVMxiXrt+OalrSXWGY+gVxyj2sDRE/jA/WnQ5wIcGDbc=
X-Gm-Gg: ASbGncu6NKtZmLjdj3j2801rYW7+M8FKAkLEO5WDmb+OezCTARVriJzeoAmmexrBpXY
	yIrrqtoVjz9/7wVubPRYN4WEBOh7q4C9C7pGiKk0PIfBK7WyNUuBlYZTcmRlN7GGjvVsNj0REC/
	JQAjXzMbTv0j3+kyLTcRKVbkYVOfGgiabaBmRGk8It7XfU3VJsf9RD++1MctFjYQKUpq/mm5Nit
	PjSbRpiq7sTeRB+UBxxAQemL+y8EiQTCuTDhdgLDd3+hmVZP8hJfs12k6d5aKjDt6ajMepMYmvU
	GsfvRCwJ3CdzEjYl9zpBrQgn6Cs6ftvRiwbA5I85qdZZaKGgWce236DDZv6aohZRU6GPrhaSDx2
	zREzGvCy6zYJ/Dz+AntifRrOvHYICYWtjXcPybFXOHxoaVqerGlulvotnv+3auiA028MtgeQQbV
	edf0dHGncC
X-Google-Smtp-Source: AGHT+IEPj3CdqUuwMe/T9kfHnMLT0T0FRQZVC1TZ7tdmbBSLK4nCwkdMUM8n2LwuCMQiZxEn5qcu3A==
X-Received: by 2002:a05:600c:1554:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-477262ab666mr23564875e9.13.1761815947299;
        Thu, 30 Oct 2025 02:19:07 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952cb7dcsm31938479f8f.11.2025.10.30.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:19:06 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Thu, 30 Oct 2025 10:17:26 +0100
Subject: [PATCH v4 4/6] arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-topic-am62-dt-partialio-v6-15-v4-4-6b520dfa8591@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978; i=msp@baylibre.com;
 h=from:subject:message-id; bh=My+67m3RKIYhTGgscnRK/PbLhWzY3WuuDDNXstUgd64=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxm3Tzz3bOtZvp0+92u2iM5d/Km8811q6LXq29Xyk3ZH
 7WSXbi4o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbSmsLIsOP1d6U7R2Umbjzu
 4xXyLt9smZGbxJFJ766vz52ZqqOu/IqR4dJ+zUWNqusndSS+PLtH7aaXQsFLrasuf1ed69vH8rn
 4KRsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021909_259919_DDDDE13C 
X-CRM114-Status: GOOD (  12.46  )
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
of a UART mux on the board not being powered during Partial-IO. As I/O
Only + DDR is not supported on AM62x, the UARTs are not added in this
patch.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index ecfba05fe5c273c671cd0968f3eceaf54d22ac7d..cb63db337b2bc4c83b48dde693b95dd9fd93cd26 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -276,3 +276,63 @@ &main_gpio1 {
 &gpmc0 {
 	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
 };
+
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
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
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
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
+			AM62X_IOPAD(0x038, PIN_INPUT | PIN_WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
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
+			AM62X_IOPAD(0x040, PIN_INPUT | PIN_WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+};

-- 
2.51.0


