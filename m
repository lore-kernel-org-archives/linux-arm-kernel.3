Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B71BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEJSvmdRFDOzL1aucFAOiHGGY6iJAkPN4C5adgEBmjM=; b=eu/aBTp32KnEprz5lvSCceQaEG
	Nm7WDk1JCpOopdV0RpFr5Jhq7UzJWh20VRe8g0edNofwoDON1c3pZDhDm9ZKS/FZbwqiC9JRj/qdT
	24qwtYSmtUzOy8ql+NmCOHaskM8+UQHtXpmOH5bMaTeZ1VBCpcp0ZOeFPbRZ6+jrM8yeCJ9mJK8F4
	iVgZCEJpAogRccQYva1btcwUlrvK3dgHyBFmYGPEx3yP7Kl+u36k4wCDju0yhO+5MHPfgzZidN9Vo
	hrcCnDgUq1wuHU12YxW1fBwo/1RGZcaeCv2Y/aKNkHS95/z1lL+/sY/ZSI3aosggbTsIwtx2EjGfQ
	gbWO6Upg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mdl-00000003v7S-2IpN;
	Mon, 21 Apr 2025 08:36:33 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mJL-00000003sDU-0Omi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:15:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-acb615228a4so617013366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223325; x=1745828125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEJSvmdRFDOzL1aucFAOiHGGY6iJAkPN4C5adgEBmjM=;
        b=LxiHX+p0PhGRg4a2swhKJY9f+z1aRhVCVamTI15mGsO5CBQCkMI9uzFdM1GJNrcluo
         9MBwL4BuOtgfOcQhQ8uL4+IeOiKi4gqk2BgtvYx/D2Fw4zYzuXoU5V05gchQup8JA73u
         o9UussH2DUGJo26Wfjwxj6o60xi5XQH0HPM1Fb+YqUVArtfcDZFkU7Iy7MNtRHcyfgN3
         FPNCF31PKos34eH0RcH+5PuHcQKReK7yzjOKKJcJszTSqp+EKGvuCWSn99CnvwGpSMEC
         h2vXXhzh4FJbLE7PWfrNKHv7m5bXbvxnzsBgsYl03/r9Sya9D4JbLW9VyTwCXmELFAbf
         zfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223325; x=1745828125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEJSvmdRFDOzL1aucFAOiHGGY6iJAkPN4C5adgEBmjM=;
        b=bqLuhJL9gQxggyNUnE9u0Kgg34yIFlo7Fx4BHkn4T0PtgVZsoifPSVdPuWop1RYUQL
         PqzGrkNk6UOSj36XY8rqMRDPL5z4q3cR0amXr6dTlcceLBUaRvGwpuK6GBpbwUhdwG2M
         6Tn2jSK5ViPc9hJvcnATtC/al15/cH66fzDSY/61Huuwr4eV0V6ob29njeyrbvhTOCp0
         VWzDHxfef7ihrGFIazm43vkcKV2mquq0Cv9LS+EzEUTs26L8lBvHYYIiGkS+T+hn8yCX
         PffQKUhNN4pUn6foWC3A9yIz7qlhBVw2+6sYdtTVdM00p4Pj3ujwD6izi6bPTNywsEF+
         751g==
X-Gm-Message-State: AOJu0Yz58RPdcMb8/nnnKLyVeZsrbWc6KuLqXmWKSWws1TRwH/VheLl9
	YJWQPEPcuuxRyWqqqwUpk7+wnxEycKnqGK+nTDt9OtLQQdZ4BGdYHndHJB/e13U=
X-Gm-Gg: ASbGnctNnuFML58nxJvLgtHpo++tUSH/efcdml7+SlB95uDJ3p5FRhnqwKgio93L4cP
	5UKAF7VuVh+TGdsK1ZF2AKCs/MIe4y4HAFDOo9aIwsX2R2yYtcN1KCaK1qi531ZXPg1/NRdsqBW
	54JUjEl7mVQVlzNG+wfMgoqYs2Ud/TOciVC9Byci3hNTJibEb1vrN2rXrMyPsA9bQqDV0txWOXH
	6LFDuERlG+1Wbd0Htre7z0PqnZsQCKDUSj54aqG8YWFEg/jSFQLTKy2AsaVaQO9uMJanXEiP2LK
	YaClbPmwGRxgqb3d5daZ9Y+l6GqvWDUmFwA=
X-Google-Smtp-Source: AGHT+IGVk3z2U0xlHufo+U711OJEslZrNhldX39ajOT/JP2mrAwZqxZhp8lxxLXgJcXlWql7zqPhnQ==
X-Received: by 2002:a17:907:805:b0:ac6:b80b:2331 with SMTP id a640c23a62f3a-acb750d9119mr836009566b.4.1745223325308;
        Mon, 21 Apr 2025 01:15:25 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ef46f71sm471684566b.128.2025.04.21.01.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:24 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:24 +0200
Subject: [PATCH 6/7] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-6-6ced30aafddb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107; i=msp@baylibre.com;
 h=from:subject:message-id; bh=q6o+61mgCHYyj8XEYV871sJvb6B+pphkoRdS0S2i68c=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf50TZ9c8VrRe7zT1zOYtBtOeBqSWhZ2+JmPUE3zFX
 N5ZSLKyo5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACai8pORoWeWp92LeOX/3XXt
 kR29e+QvPl+nolzswlzdt82hv/uMNyPDh4M3XB8c3VW70OZ+f/VfgdaVD5RumsQe73hu3RBxYYE
 XIwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_011527_136011_C4588DE4 
X-CRM114-Status: GOOD (  10.86  )
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
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 1c9d95696c839a51b607839abb9429a8de6fa620..724d9a6f3c575fe35496fdd9e17d6d8e33869f92 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -741,3 +741,79 @@ dpi1_out: endpoint {
 		};
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


