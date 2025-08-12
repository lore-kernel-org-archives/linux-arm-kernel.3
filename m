Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF138CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKKPbk2zjLmByP+VE7hKfl8sJvKaWXdOt8nmsyt9BjM=; b=JrDiwU9td4zS52dCJ6FlVrjW6l
	K4rRX6nQXjzASJNVEM7Fp6TYEW+fae4ngvy/qcVvHvuIfgASGJwhyGjKEOtR7AX12eDj5ljvcmLJd
	lFMUCR+hMFTAmNTA/TWUtqgSt1cJ4SRcDgnNmMlao/RXuO3ZrEsZPfAnlW/dZ1UfMZDrZCiaV8xLN
	PGRRe4HwnJp1YPksBsv0Azky5E3Wyy57Jy5G8TvZftflepD/FPi6LIw7yRVnaq9+qXmQOYnzhaq8b
	rvmSeTnGEh6Hz4eIWiGen9i8DTSIebveH8sDoFHiNwEbYADsC0oiIzL9O/DF8hkgnFyGxrzXK72A3
	RY7zovqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIe-0000000An2D-1Hyj;
	Tue, 12 Aug 2025 12:40:20 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull7X-0000000ALmM-0Iex
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:16:42 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-615622ed70fso8392349a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990197; x=1755594997; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKKPbk2zjLmByP+VE7hKfl8sJvKaWXdOt8nmsyt9BjM=;
        b=o7jrBkQHQXIIcxfSF1h/YCV+8nP98PggnmktOXtmzHRZveWq1TR4Kmbo8ziRyfI+PG
         DxZ1PQ3mRtz5tZGukNEfoXgK+/Gu1fgHsPTT7trHKdh4ARjSQ6BaTjNFj7WNtcfoLlhk
         snf9Ao+q/LLGbChEwn4BRcSupEYpdkPZ8Fb5Zl11cRqCZd/bcZzfSkqPG59MkqkRlrhe
         WiKjbAmd598jh7YQPW4eo1KIquyTRvfLJBa56dFRQRxOXUuVm8hEea+FdAJTHOB9p7WG
         cIJmMlrbUMsoWve8CjkrZqPFrhimRASl9tKvKm6NkcJBdWtrUiYM0Gu29jzOKlpvKU1q
         ggHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990197; x=1755594997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKKPbk2zjLmByP+VE7hKfl8sJvKaWXdOt8nmsyt9BjM=;
        b=SCCxnvpm6DtCvhJ3FRpweXQZKP4DjCr0SZd/fCIbbyfvFuHACPVjdbL3r1rym2vsBq
         pdYPO1ug7u7sM+bLh8FjdZHUTEPg79ye52QHGbG6iPhizWsY+sIrD3gLaZrVfxh2jBEi
         f70txvIBsXL8dOXQ0HwJ5CGp9AFAg+9wVRTGCAYKRYidJwpBBb28vTU3PyWcFwhIeZTj
         kOvU0MzOi5kdC9uCLyGcmgTFh1/9gybEjyw2Rbz9caED12anDWlhY4Tp0SrpJigFx4IB
         XeIN/OATZKaKvQj4zcZ5RHHNubBmRoodhtYGT2C3UGQOAsC/EtvVMGOntQOhC/iJvEdp
         4Nvw==
X-Gm-Message-State: AOJu0YwWec3aucAM7ApWRMVjMNSjSsnngpBqZR+DJY63jm7IbccpPx5x
	7/x+yWLY7KHDVDemfONC2eC6qaTL4llBjUhO7BcZOG/FEDrp/2tkmIjfhqQoCcghAZ8=
X-Gm-Gg: ASbGncs9iHl//XM8ZiKkwj8Z54fRlUCM/B1elHMsk5UrLYf91dFaiDXjlrZQgFQ3d++
	ezPDfONjxp/xBrbQmUIc73OwcJSqf5i03a2Qk0wXy/4edq/rQEK0hXlCZjKFebNcAba4CASMvGE
	qr5ZXlwWUas7u20DHH+KSHwVaQBZoTxePnsgzx0afaK0e/3YD2Wg7x2KJyK2MJe2RSZUU50JS+V
	5POlHlpQ9dVyKhr/n0yPOP92CnfzqQHrU+aAuGS6mjDyw8viVrtl0tJ6xEWTgrzbm4xXSbJpIO7
	yJOcc1JAZNX/9FqMs4nRvbkLCOPKkHWOFT2Hxed31DX9l5vHcWWGQ5jmsCV6QfoJTpkZfLVS4kW
	M+ScfalSGlrQA9wX+YA==
X-Google-Smtp-Source: AGHT+IEgkIjROZI/Yz+CBqPaPHop4dqppzi0LKkPjz7/zfImtMWZEtkEpTDytLSR1EZwKCTNbupqMA==
X-Received: by 2002:a17:906:794a:b0:af3:7645:43e1 with SMTP id a640c23a62f3a-afa1df5e53fmr257639366b.17.1754990197493;
        Tue, 12 Aug 2025 02:16:37 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a0a37a8sm2181325866b.40.2025.08.12.02.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:16:37 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 12 Aug 2025 11:15:25 +0200
Subject: [PATCH v2 6/7] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-am62-dt-partialio-v6-15-v2-6-25352364a0ac@baylibre.com>
References: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
In-Reply-To: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3528; i=msp@baylibre.com;
 h=from:subject:message-id; bh=us/rMp3k23RwZc1Qh9H3phEU99cwVMWCdJeqp4TweV0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZbElvJ4dv3vD162bNiPfXcv6vSzKoYDvBoiQQ3HS4e
 3HFeUnZjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIpVcM//QaP0od4jj67HkJ
 77x78qH/AxdUxy+/8yXNW/VIf/oWi1ZGhpns8zijFqz8IX83+uV/ZicR7RdXmAur7ype7dsvPfH
 iLk4A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021639_118724_C39B9AD8 
X-CRM114-Status: GOOD (  11.93  )
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

- Combine k3-am62a7-sk.dts devicetree nodes
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index bceead5e288e6d78c671baf0afabd1a9aa23fbee..55cab49f26382f08e2cc93d17afc424af8c59caa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -257,6 +257,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
 &wkup_uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&wkup_uart0_pins_default>;
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	status = "reserved";
 };
 
@@ -450,6 +454,42 @@ pmic_irq_pins_default: pmic-irq-default-pins {
 			AM62AX_MCU_IOPAD(0x000, PIN_INPUT, 7) /* (E11) MCU_GPIO0_0 */
 		>;
 	};
+
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
 };
 
 &mcu_gpio0 {
@@ -935,3 +975,34 @@ AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (J24) OSPI0_DQS */
 		>;
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

-- 
2.50.1


