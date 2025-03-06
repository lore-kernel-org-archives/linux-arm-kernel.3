Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3257DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjgCrc1CiYSLXkKYjoDdBunkgeyK0ACopuUn/gOO93Y=; b=XK7W5tw+eJ1ZfW3QMEj7JegiVz
	1EdvINSe01lRqi7El8TGS51u3v3JjtwvlvcLUsaRcLvGeJBwD6txufjbulVJXE0l3+2YC6pcEN5fS
	HhcNysWPaPWLJbAWWxlX56Z0k7Gr9d0AG1KjLtzS00UkdFtzWUqwDc6FkQ81M/5tRAXvRF4iuR8EQ
	aWJgl/XiMCWsmT0qKHHu6UfK8YFyiNe0O82bjnbg4AwLpCC5E5HrCt025zgkR+Cb3fV/3GqFTnBMI
	J5xG2jMugQgVkjHV4bunHZBaw9GjpO61FzdXB+d8+4kfg5LMluE9yDwK5cLYlhZtPe/3s2qGT17ur
	pVajivxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9hp-0000000ApxW-3s8Z;
	Thu, 06 Mar 2025 11:48:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9D4-0000000AkgS-0j0G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac1f5157c90so86825166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259772; x=1741864572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjgCrc1CiYSLXkKYjoDdBunkgeyK0ACopuUn/gOO93Y=;
        b=hfAVhSjyFZ133CfsEy23HIsMpHNChJNhgyMzrJnARx6VdQh0oFwDkm9UgJxqnoU5Ex
         k/RYQ7CNa2u2Orj2Na58alD/zZuBnyVX/NQc8DA8p8Lqzx70nxRU/5c3jTwyQeXKJ5vd
         p7LPmD9PCfKnIYv1SvgRW+XFR6FrWhpyF0WOQ6HMOT8Z0tqmfQlQJ1+mv4vDXM7dn+tD
         NLtaLMMTKvILygT9cS7l+pCpKTl5Scl+stuUPRcAlo9K5y8SoZFG1X9lfoUs6JFiWC28
         wkVwHyi3pS5fhjJt3kZWaLSdoFrjIZ7n6LYLpwhMgQ1Bhp3CHSory8q3FCDMXQ9C6RO0
         8hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259772; x=1741864572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjgCrc1CiYSLXkKYjoDdBunkgeyK0ACopuUn/gOO93Y=;
        b=Lfcgl7biCjlRfZBuzlsi0vfnPP3WyHz/L6CENJYKUjYXZAC1/gt2R+qzKE2UzQjG9j
         /HclOFMFrsKQQ47RIXMlFo6WaczP/+WMt80Ya2K/SGsYlOQwJTSwwyJJ1ZUGGfUjo4vC
         8hCOhSxiOuYFMNYiYzYNQd2MwCFgj+GDd5Xohe6h1WwcrFiHK9P/Z7DOfw3aTMzQT8wl
         aVAaI5ESsx6yPRQbK3DN9mZxqGa4+9PUZQTaUe3N4+8fhWnybm33BusdsjrIWgbHWD1T
         d1/imfNE0yMWHp/QaG1xRFZXIdvdAwOthb4TjKN4FNRp0NR+YddNGssAdWYq1/n4/cSi
         cIdA==
X-Gm-Message-State: AOJu0YyeMdt1sgNOQ4S5B2fBd5aRl4GbQDjsA5RLBf0w8fPOAzoHUZWc
	eeZr429sJiCJPOCoy6KBe4SCYfPVdowwORC7of7jvUh2CgIggnUtBFBYGYMZ0+wDpx+MkSxJj/2
	C
X-Gm-Gg: ASbGncviD/i4hRCVxMF3s1vxkv+1EFGZH8CL16fjMmvZdoeqIXQ5ABPUO0IVOEmBKZk
	WnSrMKmmDh+x9nU61R86Eq+0v/SpTLilOJFZYfWODJAgQQSIwWg+Urcc0QfwAjbhAHugY2wHmTy
	q92Y/pwIDYxDuH0pBa1qE4YIvJid1ZDKpj7EW+1E2ZGsVrlXnqqnNJcoCjYzkqiGuPZ8pewdO3R
	GYIOlS56fK8ee79Na+V1ENKx+JRiGPkdEUGUv7FsO1oYtS85WTLc6pGuOLG7R+9KS1VfE1TNisC
	KfyuHiHm6iKoZNOAqCxB+yYkL25kHceiJYskI6kzEQ==
X-Google-Smtp-Source: AGHT+IG97CEorYWv8MdBxdHawoR/D/CVLaTZdfILEdkNvt1Fn2+vDxmsARxSKsCxTfLEbIgksTW74Q==
X-Received: by 2002:a17:906:d54c:b0:abf:6f37:57df with SMTP id a640c23a62f3a-ac20e03ab40mr745282466b.51.1741259772562;
        Thu, 06 Mar 2025 03:16:12 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac23973a981sm77339566b.120.2025.03.06.03.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:16:12 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:51 +0100
Subject: [PATCH v5 13/13] arm64: dts: ti: k3-am62p5-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-13-f9323d3744a2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3129; i=msp@baylibre.com;
 h=from:subject:message-id; bh=VbF63lIgRDIHEDh0j1eHwrNJ7kNRLfR5v3SvlStjSYs=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNj9bP3Om+c6c/W0NXvezuVwKil+enfVcUPiCfG3TX
 sFdPzilOkpZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJGGQz/BXwPWbXHCl3t6Ds
 ou+51SzTF11Ycez5J8vUJ6WGSXOvZnoyMpw4YGVWf+qQtSDHnA0qLGVPzNYuj9ggMoP3gjirztz
 UfmYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031614_216549_16C8EC50 
X-CRM114-Status: GOOD (  10.89  )
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
2.47.2


