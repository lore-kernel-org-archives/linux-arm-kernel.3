Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF464C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaPay1MzqaydVLYCPFc19eHuG2b1zJCo3mT9rCzo3yU=; b=QQTh5ust7OC1kIqfJ5c3agnca8
	MZwGjxvEMUjWp2L52Q9II9oYNqzo2ueuB7Q6LS7ohcQZtnZJz76URyEoCTH131SvNg6PcsyszPFdf
	fV49f/ZzbkrnwjnXpJ3SPDkLgcgcZhztR0mztwfAUidQveL2OY5jnUsKrrtQdkSTaG6nwnD0xZ7KD
	dtNJycXWcvnh9zdhQsoQeU1AO7SNwVUNntsPRBkjbMwMDpLUahkeAwdn8PhbKEr817YZT4IB5s2c3
	l9Ec7WcpEcoYP7aIdhWriS4PLiMMhZFsQx2CKPKNL+Q9D1X/Dk42wp0m2fOUhJlWWFpUsmDMLE1Kp
	W3IUMjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mfb-00000003vGz-1Dt7;
	Mon, 21 Apr 2025 08:38:27 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mJL-00000003sDn-3V4Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:15:29 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso8488279a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223326; x=1745828126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaPay1MzqaydVLYCPFc19eHuG2b1zJCo3mT9rCzo3yU=;
        b=dhrtrpoxR46S4GdG9kAPmGejOci+NKzavstib1zktzJhaq45Q8R1N6YkVDuiQWUOZb
         s9r7s9kvZt4zDje1OxGgkWHvtguHz2VAqxtcy2K9mrRCIh3blAGBCK9j7VUiJ6oOlFG7
         bfiKrBktH/6AGALfhGspYrQ7cAe7DHzP7DLN0kT0fDUpTkN6cEGIE8dHF3U+1EklDVYu
         liRVNrecZEVqTQilCkYJCyx92fCz42b+a7K41N7YTAWBGjWubRDkIEhYsPWed1wYrjqc
         m/ojqKhW1fQgK+aM8uj8l/PlhvmF0B90R7tNAunarg4DrS6e5rjr8GKZ6FQ+tUuM4oRN
         jwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223326; x=1745828126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaPay1MzqaydVLYCPFc19eHuG2b1zJCo3mT9rCzo3yU=;
        b=PY3g8p7Oz/JmGCNmkMvX0xl/p88MlNIX6qs+EBFJxzBcc1tLll02M91852pDv0CDOl
         7cnM8m7+7riDNVYp3owu358y+xrxr12869MilV+ilRUpYGIgn4XaPqwnBSr+KT9k3OO8
         s5v++dk8bZtLMRjTITAncfzO1lLf99Whu2MPYPI2FYHk8U5E+qsA9XjTaG90lr4Igs09
         m3CdBha75CXNrKYrt56AiO9BBcVQ83X4+cpzSLm8mHwYuPSKasaXTMX7P+T0suJwE+iT
         Ij3GqJfu6gIN0VuqwpjLiKRmKV7hyJuvrtZnfGz1xkPYq40UxFs+BZXNp74KPtNdTSlS
         ch2w==
X-Gm-Message-State: AOJu0Yydlt/xgbWqMm2RGBYXM9BhCl3RbPCwhzjkVE8FrlPhUBe/wrwO
	rctLsz6kwhHoIt/rRtmmgZTLgl1fdY+p93gf5KHVjl8JY34C65Axupho8N3L8nU=
X-Gm-Gg: ASbGncv4e9Erc/Fc1SRogdnCdBehpvXcJ5rz/as0wTV+F6D1VMs0ov1aD4RzV7U3Sqn
	tLAa75wZOEUTVUMre35PXeBiA1gmH7DxJuad+sAZAEjXWpLKnhDnwVbLrpH3uGji2C81s8oiQpJ
	iPu3m+yWY3izLS9JGrtOQjz1ZvHm9phocXVjZJZWJuYaERaguPYpy1u3N7+M4FTBaHcLUPedP4F
	2OE1cHk24qrj9lvecXsY7/O5pxoisAWVs9sGQ2xY6/2AVL6n7TevLf5WErRPZeMVqIf+2P8o3+8
	Baf94eSGft4ryu5TPJjVUjEp5X6LX7LFxrM=
X-Google-Smtp-Source: AGHT+IEz6OK/0SCaGlQ9/V1Qao7LcZ09YwhvCsSG50Lj++vLPxQthtcW3aF+/ToXm4oiTAZpR60XDg==
X-Received: by 2002:a17:907:2da7:b0:abf:174b:8ca6 with SMTP id a640c23a62f3a-acb6eeb62cemr911809366b.27.1745223326485;
        Mon, 21 Apr 2025 01:15:26 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ef45784sm469002966b.129.2025.04.21.01.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:26 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:25 +0200
Subject: [PATCH 7/7] arm64: dts: ti: k3-am62p5-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-7-6ced30aafddb@baylibre.com>
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
In-Reply-To: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3129; i=msp@baylibre.com;
 h=from:subject:message-id; bh=MJ7GDc2/lXPzcfIbuMIl/StTi8QjW73NVgG9fDDiuKg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf31bXE577XuvUtH/fe6/uiUHZrFwOk3MktddKnbhV
 M4cdqmOjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAbiINsMvpp7gF09t7dl1HW5z
 /jBwjTm4tOtItMMcRdvP3mnKZjvYGBlu/GmOdiypMTU7GLH8kXjVzCm3pp+LEhM213qxIdym9i4
 DAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_011527_888777_D75302B1 
X-CRM114-Status: GOOD (  11.06  )
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
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index d29f524600af017af607e2cb6122d3a581575ffc..35b950e444353c416e33344dfff42e2edeab3aba 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -683,3 +683,79 @@ &mcu_gpio0 {
 &mcu_gpio_intr {
 	status = "reserved";
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
2.49.0


