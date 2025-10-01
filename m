Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54EDCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv1v1rCyNVZow/EufS/6YnSEiovq7wLtWvMHkvWDLt8=; b=vTCpY9Mt7LE7TowzKGLJ1Lwl8D
	iAQntxBWBEyEeBjqYWKF25KueQRlxiQcvHOinD+vltmAuqwVoTMRLFwQjUWKQifXh1vboPW2A98hf
	9h6CIo3XpADNaimOR/nj4xtf/3BK4NjD5cwJxmNPQLq21R9XWDwzlGpK1srPfunwZn+hu6jCq2Wsl
	ck+zYGokejyw0M3zrjFhlEIyCLgpLEVVu9k1e4q+zRbdjhFRC6QpdTqtGIhyrG8cX/TkqMQXLH2cs
	CgiesJqFnLfc8p7EKqkv/TdtX0iDe6VOqtw0VVU0OAevruE5WukZahKv9NY2iW2nIxnO3xF0n+vn1
	b0qxhw7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvU-00000008CJx-3CwQ;
	Wed, 01 Oct 2025 14:35:28 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvR-00000008CFT-017g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:35:26 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so318140a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759329323; x=1759934123; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wv1v1rCyNVZow/EufS/6YnSEiovq7wLtWvMHkvWDLt8=;
        b=VStro6HkxeOxVvt98p+GYdu3+3h/gqvJaxykvahsUsK4U/1gaDHyy7R+mGUtme3bNA
         Py91FgozFNZcLRigR6S5wCeNGioGgBa9dV4Q/B5BKEnAF/Wseh1EzPuP+EqYPMSb53jT
         v/ul/GGy1XFTmyfIaAC49zB4z3dY8jnYslmyYCGwUcSNvna19rDEIzaiW7ajSNrVmYrd
         qVHeDjS72bs1wYQhCC9t+y0ooLzOEvC6cAkGwxXp50GZkNNcI4EkoZeUCC3dLjkzF6KN
         YRmAJILWe12YmXhOj/oNcq81U8/q4tyzREvkC/xpvy047umQEyjguvuI4X1/Fq1jHZrQ
         jAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759329323; x=1759934123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv1v1rCyNVZow/EufS/6YnSEiovq7wLtWvMHkvWDLt8=;
        b=XK3ri5o06MmFAohoAz3oN7e6W+JySncS8WA0Wh4+U4seuyDF4lK4DD5LENqvUndwds
         Sxk6L8M8/5w+2RiB2R6//A7nyMZ2+4gJWVYk5V4QioYqUS/+qO9PtSiXXGtjvv6Y35+u
         gALZIEXps4qhFlIL9/52MlEKkIxp/C7pueUcrrriY30akNhblDh0zGgMNdCFCQdjumIJ
         x5IQR/TYy7173doeUznFtkUR3i/4wwUpm8q8VrUsop8axKZvgeg8e40ZOWxfFqMYoF0i
         4mSJgN0nZPu3lRnsZ84/IQlRb9QIJQX639SZZvo/5afdqzv+54Vv7yP29dnYQnEWH1RW
         uj/A==
X-Gm-Message-State: AOJu0YwW/SDDp+0HAEQXMRsl27jxpydFB+Kh4Ygapel2F68AZ4DA8cUE
	L7hznrhyyyCBL9dW8MfMUgrvViuFOBjQtMGIPh2YV8fy2yfOl2X+gBMlVho8FnPsQOk=
X-Gm-Gg: ASbGncvQ3l8sf7KLo2erNpcpyWpIY1lYPHnqriJ2ClkNnCA3EZ/jkdLI3B0Q/hl7C9l
	A3T0Wo3A2u5gY/QN1CMikVlC2XzOBXvKAJ2fbidq7taynW5p4MVbQnNmGCQqMw7R4u00v83lszZ
	cvL5K5KLMdpkpiUOaL/9BRGNIqkg9HUlVShbSPOOmWfL9gQP/7WYQGp4UfKZVzHJY6xgAR6FgBf
	u+GT1FxcbF3qSYcvvLLQul7E31e1BYjjkq8Q4opV8iJo4d3e5rWOdmC7MnZCchCX/OWNAtzNWa3
	wC2k40UqavYkZo6+xGtxJi8ZTzsjZGGsyTLVhbQpRZmN6QgQazv6QDjIYcSnPlwjZuFxdv3KUNj
	Do+8rOPll6xChWpBxChsj8I+bixaUak2T1DiA08tlwxNO
X-Google-Smtp-Source: AGHT+IHXTlr6hMwOEdJJpqBV4TMV8ge8bItPiUQfnDU+pVip/S84k8hnYZeWqUPXz9KdDsMvP84M+w==
X-Received: by 2002:aa7:c60c:0:b0:634:bc7b:440e with SMTP id 4fb4d7f45d1cf-63678c9f531mr3386752a12.36.1759329323126;
        Wed, 01 Oct 2025 07:35:23 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-634b46dca59sm10770760a12.8.2025.10.01.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:35:22 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Wed, 01 Oct 2025 16:34:18 +0200
Subject: [PATCH v3 6/6] arm64: dts: ti: k3-am62p5-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-topic-am62-dt-partialio-v6-15-v3-6-7095fe263ece@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3461; i=msp@baylibre.com;
 h=from:subject:message-id; bh=fmSTQ+NAhyqd5hnJaZ0RF1b/fo5Oy35WVR6j4Ev0AlA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoy7NtIOJyXa982e0NF0+aJG1Yfla+P23fDaE/LkRt2yL
 cKteh+dOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BeAiDxkZbkTyMO75rFOZcfnN
 Qk+ezG+JlVqCSpem10/tUfomHSkSzsiwrX1JX/ZhruQD7ZnJBVKno+ytZedOTdP+9JjD+9inXZb
 MAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_073525_082032_F54A4495 
X-CRM114-Status: GOOD (  12.54  )
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


