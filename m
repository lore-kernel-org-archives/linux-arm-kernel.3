Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8360CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8YyqJ4Mpj+JrYYcigX07q99vEPrtstJUifgILYXIvc=; b=hDIPvyea+cCh3cpxRn/0PWpx/m
	5Y+82yqgjIaJh5WBIsZQKPu/v/OrXHCluzS1rDQR9V5dxoRMe25qDUc3cy2ewFfNa+QkX6fh2BG3M
	GH4scYkhoesvPr7XKPY+hsKthmrhB22RQ4pl7if3ENZUxeoX16mNsfOAat9PwrxLewiWh8JqRht0q
	ZS8x5fRyjyEvcknBZld8rmQfflTmLSi7u+2kBFIvh0Deat0NvmYdxqDCTNgQbOUntPtUPg/s2ZuiX
	ocD2an49FGcwOs4iiO5EWoW0n0xOHOeWrygSiX0AB+puRFRHs3xar93kpavWCYXgVo4uuiwPpdItT
	wX8Ke4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtrB-00000009ppt-3QiR;
	Mon, 03 Nov 2025 12:40:21 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtr9-00000009pmV-1G3D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:40:20 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so1890872a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173617; x=1762778417; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8YyqJ4Mpj+JrYYcigX07q99vEPrtstJUifgILYXIvc=;
        b=VIMb6gOGJ6iUViqT7fw4MYMPD38r6CfS3IgYjNe/eLsNcv0OHx+LrTBsxKH2G4ckmW
         XXyM0BhWjjryO9mMIHeJtHGXgIOtAvmbJjpPAmMBahL3aLNIRxApho91WB+khlQD6/8I
         2SRK/eyvs9ywSmThSp3Hggk3/VXBw+1p1hFc4h/ta4EjQ6ZBKkkiqrhPgxRHSg82iKrj
         1NnaFSj1eYW7Ln1rPNzUQMO9l/HYGC86jTXfs5KuIwzOPJxTwNAX+WAOhbjzNuMDKlTz
         NJeJrTUaYngbhqbM5gJutMaoX8n9ShdQSqvVXUSBPKLZib/SQoJC6Iu5QiQxbRmPntOQ
         0EgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173617; x=1762778417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8YyqJ4Mpj+JrYYcigX07q99vEPrtstJUifgILYXIvc=;
        b=Cm2Dx5dhfmxV5SDYLUL4xjyivDIaT91+taGUBbGrqOV/pb4P6UM69sXf0W2vLON19t
         g/JPgm0eTbAANB/6TYtbTkOjIyd5KL7ifjhzHV8RcMVwgsr8WainA309Q1cwVdR9qJQf
         4PdbddDzamhABkJqitMXJTg9BNEGVpd93FiUg9O7jYB/9xlE+8yKIBII/TwIrIBu/Ei0
         xRZJDtPSsjBWFIkd42jETO6C7/EeA/CqfXVtyrlQwnysiPj9h7T+yLjsXb2NIiKdeIjI
         SXg2ZJmexOK9SsakhNMpM3GpFOmBv/zm4KiXQjHPkb+LzOwFyZGXphPtHiThHxPIEgrE
         UmXw==
X-Gm-Message-State: AOJu0YyorNINPSg4b+ebNQ2RMkoR+NHDzTtaktMdICxfAHtuq8un/E3K
	6PcQ8ImLenKbqaQ/MscKGRXK3j1013jIVuBtRwiDuL1XaWKJdFYiu6Rhl/EsSzwgZ0c=
X-Gm-Gg: ASbGncsnq1ZGKNRzY8xNfxYtVFgi8zg8UhGtTMfrgINdihSaCvDGhcnxXwTAb8+H/v3
	bVQ46DXwe5YcXkSSFzPC3RTf/MLYS/Ix3OEdPzJrhPv6Ft0oBfK5Ba0/ShyoqIYYiNrHgPleHSe
	vjaVZQB15npqWBh1VRk8qO2sU21JdFzS4aWWF0gsusakQH58ixMiMsDVNWkmNfDOyglFYLP1yF/
	UuXZFYxyyNL9wQYHdYNs1cexvpsyjRlYlOqF3jctn5UAflMnmE2xbGiOMrolQt8I/wEIercZwlO
	VEhXWfQMQQSK280U5DbYGdi2dkgMv5YfvC0d93QoDRI5mSdtNbWOiXYiOojzcQaf0se7ExIYt1y
	yvCPjdjB8MCzjNd5+S7R2iXCNCCck6Dneze/ESdn9xPiN1tSK1lScjxw82NQH4Cu52wsI13U=
X-Google-Smtp-Source: AGHT+IGIaEPB9InpMwc7+C802tcMPSbzxBhJrtyKVRnUVFSYpjnjRtfxcKkqDE6hgYF9CpxesRD8Iw==
X-Received: by 2002:a05:6402:2710:b0:640:c394:5c7 with SMTP id 4fb4d7f45d1cf-640c3940662mr2707319a12.11.1762173617422;
        Mon, 03 Nov 2025 04:40:17 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6407b428119sm9481228a12.24.2025.11.03.04.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:40:16 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Mon, 03 Nov 2025 13:39:31 +0100
Subject: [PATCH v5 4/6] arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-topic-am62-dt-partialio-v6-15-v5-4-b8d9ff5f2742@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978; i=msp@baylibre.com;
 h=from:subject:message-id; bh=My+67m3RKIYhTGgscnRK/PbLhWzY3WuuDDNXstUgd64=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyORTOPO5yvm8u56fd3jrNzt1YtvaaytLv2ttjODfoTd
 2cpVy8x7ihlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJCGxl+GfU3lGzrc5gTaG3
 SptW9omwRe82HUiM5auuqucqOvH8xkpGhgeeXTmbdByWnyz2KDtz+Py61TP0K3v32Rj2/0iI+ul
 6kwEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044019_556644_1476C433 
X-CRM114-Status: GOOD (  12.47  )
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


