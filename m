Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6153C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A87WxXAiQihDIxMHHvJCHeK/NU1G0OES32F8q9p/f7M=; b=dDZgHVLZMu7WdVNlffoP5AzQq6
	bHONVFEIUxlxAnMJuOWW3dpvxOJHFn7hcr2dZOkeb77qmf7l8h9VqAg1Y3DHhd+1AtaJxzUfbU16D
	+zWFU0aG7ZQ33AxF3ShdczxGJudYqX1KZ9SGh/MEKeYjvbR4hTOeBsMy+FTczh+GlXoXbsF5xAuxX
	5gW6il7sVzhd7gEA4P+ViAaxvjsoLU8t/loTKLDglbyLfia/PBMC6TaVcq+7hpbrY/kAE/gMA1N2n
	L4Y8v8rv1QKmJi7uU9NSmWM++wQcUyNzjdf9ZMcJAi4kEwVjxqUWyum8Ew93NHUDE+zD9j8ZCEp+r
	DD7qm37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9eg-0000000ApLN-1aLm;
	Thu, 06 Mar 2025 11:44:46 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9D1-0000000AkfP-2XK9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:12 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso107991566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259770; x=1741864570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A87WxXAiQihDIxMHHvJCHeK/NU1G0OES32F8q9p/f7M=;
        b=fUwdaZigNfs5i1PnH/nzOMhSAP2dNwXHq2+/EZq2/F1c+reFt76heOJcoWiro6VCiS
         qor4tI8luuVRcLnehMaGngzH6qWl1nolMmHx+/FFJ0bbLuEJDw0N+bZ9rc7qGeXZ/Gvk
         sNvWbXN8iV9dKvVJvPC60ngsAOtI8UBZK7fSzNy1SfW9slKDh6/SdNVikZJ5xVWHiIga
         LXWLsA82T6Xp5lkqO58g5KLHf4fbMe4W0S7Zvdm/4bVCPGJH8eK9f3fb4v5r4sVS93OM
         sxT0xxcbK8vDySb4/njHygfJI9I2Pt3PwHhQVNW0dPUpDAH7NaDpD77YvwSBnOV1zVlh
         qJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259770; x=1741864570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A87WxXAiQihDIxMHHvJCHeK/NU1G0OES32F8q9p/f7M=;
        b=dQtpMLrAAgMk9oapy4Ud9FBxYksrsGJJfxh+WFgEvFLsFgEWA9GP34XqSz+EysT43f
         yWIBRvL2/3BgeBO5LTS7C6IZd1XPWrKll7p0/9jVRyZfJGJeIvPyi4ygq10dbmjqQEL6
         d2Pf62yliYb0xMN49pEdoT72Ku3uVjbUp1nknOhAe2295/bG7u+LpMArf1u520e9BiJ7
         78KpAiQ1DOE1OLc6EImAwH1Jh6ublytpRXDFtgFJQiGR++2nJFXh1G27fi6KzoJuC6kR
         Cp9VZKzGe/6us1KvU37yojiBFJq51DGG1oCTwHJfpb4YkSkdxH8ED0F22Qh+bL4YjD7D
         vQnQ==
X-Gm-Message-State: AOJu0YwUUsi5DR7qag/+urwtmEqydARq8x2YbGv8tD/bgsA7126wCq8D
	AEV+Bp6JqbJ/4Kgi5khvB2WJMIA/usuabJ9i/ph6tDHCMqGUXA0/ThkiPnMr2f0U8GAEyF8hV33
	B
X-Gm-Gg: ASbGncspm/TzRZNKRrYs8uZ+1MBBve7XtZOnIe9wJbmTW0im4VPxMq4GzW+GINKA8ev
	YVsxNvePZOEGRX+N6Xs7FZP7UbwR+HJNoeqLGtb/klb+YzIeGwh5fYl4JAHexXqvYz6th7YYF0P
	BJho/CEGVZnWpqSfFJU1P3vNCtIn1w/Ho/doAFIoq6N+u4o6PmKRPV2jA1SigIMzg/+9WdnTg91
	TrAK/lJhfv4NeIYU41UNu7soFPnDLyou30bN5MoNBapIXoEOJqnzUpuBN4/SAinvM/IeDWqeZSg
	yNmlVYxTfMtMqmHwf2jt80vvt9ZIhXFZnuZn/S8pJA==
X-Google-Smtp-Source: AGHT+IF+3TleQPQNdaT02wAZCvz9KEfqZLLnBNyHjof9bBJhmesmqxZ2NZ/PaJRAYALurfw6evrVvw==
X-Received: by 2002:a17:906:6a0a:b0:abf:78b6:c565 with SMTP id a640c23a62f3a-ac20d8437bamr803685666b.4.1741259769901;
        Thu, 06 Mar 2025 03:16:09 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac23988bdd8sm77769466b.138.2025.03.06.03.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:16:09 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:49 +0100
Subject: [PATCH v5 11/13] arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-11-f9323d3744a2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2946; i=msp@baylibre.com;
 h=from:subject:message-id; bh=bfpCmJTQoBzIZISGoC9GD8ed8b9ShNhE1/wdgbkmYxE=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNt+ZGvXqiuySuF3C/d/f7xAtdf+vIHAlPpYxWvnAw
 q79WucfdpSyMIhxMMiKKbLc/bDwXZ3c9QUR6x45wsxhZQIZwsDFKQATuTiJ4a8of04M35RIi/X+
 +2xs+ucJfPRZsO/nE3923X8K69q2segy/Pfp2+z7/PYK+RTvrV8k9uwqyKzxD66oLRdg/Z4nGTD
 bghkA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031611_702588_346ACD70 
X-CRM114-Status: GOOD (  12.24  )
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
of a UART mux on the board not being powered during Partial-IO. As
IO+DDR is not supported on am62, the UARTs are not added in this patch.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 8e9fc00a6b3c7459a360f9e1d6bbb60e68c460ab..f19e53efabf30fc333e3a7d9832296140642fdf3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -232,3 +232,63 @@ &tlv320aic3106 {
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


