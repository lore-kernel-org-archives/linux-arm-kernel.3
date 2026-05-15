Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D838DCD4F41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEzJ+Z0L9sJzo3bRALn/EbUhsV+JTXUM3B754yNkOg8=; b=TGs7+ECxMC1sTgNRegoKx/UVHG
	rFHjxWNFW8jtPcP14gN4mhiXRovP+oODwPS4zMlKwcwNwagT4TIihYHvR+DOYHvZydS5gtF9x/LFw
	eNaIBx4SnVEluhqA2EYu8YdI5D4eyuouvziHeJE5CpNpqwO5mAx26h/9nNU1Twmv83TXo0UM3uJ56
	L+Bz6eWzW8uKM4wr7gA9Jh/AtYYfMGm14DxavoZYnpa3Wlm10IHf4TrTo0tKZIwXCoclYitIh25lq
	4A6h60lt+3Oq0R5kXw2Lj/qO1ExTb6scJdnNwS4uhb/VrzgHN6p3wWAh9CYDQGp1so63sfu3T6hd/
	6KcZ1Tzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRU-00000007pB2-1X94;
	Fri, 15 May 2026 09:02:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRS-00000007p8s-30wQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 09:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EEzJ+Z0L9sJzo3bRALn/EbUhsV+JTXUM3B754yNkOg8=; b=h4rIMTLCNw4E/G+lTkwhHNGbVl
	4tuLgJMC98W6O+tN98KaX6ISLmgC4a41y73a1butGD6N6zhrE3uDyX2/i4tmZFVHzo+q6fk969Qf/
	L2/RRsxTeGrCMUIMhF1Y5elsyHHSqf97/XFNQqTQ5R9qFHUOjHsweLkpoWgR623Ea5AVXVtaIvqzJ
	7qakann9BQtgCp9KUSdHj8jOFG8RYUxwErn9LRMv5d0u5MIXG5cVimCgTSQW2NXvHdATY1b1MBP9t
	JeL7ZAgpKYpqPGCTuBvXDytZUieWMfjYsXILanpaU1X1WGn3KJwDzs+pLXo2cqupMzP5PWTNkZa14
	dF6vrf6A==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRP-00000004hDQ-2co9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:02:45 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso6460434a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835762; x=1779440562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEzJ+Z0L9sJzo3bRALn/EbUhsV+JTXUM3B754yNkOg8=;
        b=kSW0sLia3ZPFqxSuLLdc6Svvmk91zTaOi7wqRkLp0lDwM+QsHlSlb3XyqBiwryUY//
         Gwew27htYZqz+wDQhzdKbJsVWT4ZAorsQbfBOMA9vKFuj14/luwbB1usYniOhni2HqE3
         Z/OhBVKBAnqZRtRmRoV2RHvI+m4wVlVPInkto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835762; x=1779440562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EEzJ+Z0L9sJzo3bRALn/EbUhsV+JTXUM3B754yNkOg8=;
        b=r1SiZx92kshSk1SY+gtkaRpLXVquiELuKPF+V9AN9cWVUel40Noit2QPz1kP7KXiFl
         BRKsDO9WiJqcoD9c1zcegCi7qc5JbGbnHQRKRKfrkkOlJN30Mx0+a9jF9VqNjZ/dB6oC
         DeeMwqM2rOQAhV1Gp4UNRCPLhEe8vhd1aDJKga01hXhHM+no45HWOuUU5l2P37imSc73
         RE8daYpU6HdiHHZ6r3a16jtkkjiVySddWATWP221w6of/EKcytyWe5NbVWFE0P0XiAA+
         kdekaBn1I67mje1j4dliB/nPDQVqksf1Vp+7tso7PF5ngU+lPI747JWzfXpqfN76sGHu
         7KdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BfazvbYz21yF80W6IW7eNVMBQDqRIm/iAw98PhbgE0yiZOOMayPQ8E60OhSgOEKZ39eUPGKCwIZnkXXoRB0Lw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzry0aenujOTLMPejL8qldvzT+obscv1X5WY+1+97jBxmEiQMAk
	4LYow6/xkJfgDTly4rp4awlhyqsCXN6UudfHH3kqfAKE3Z2U5YUjTXFQ3VtCSHvHYw==
X-Gm-Gg: Acq92OGUusccwSOMX0LU6FDnJjcVU9yB1qndSWCf46FLkFNu/YdByp+FiNP5PNC5HLx
	gxoWxbkHQ5T+QZtIeLZ9aTjGXXIglA3qBUWTDoztM+hsy4OjdmvqexKfaTXoquTWei69JoeijLA
	JJa8a+8kh6l2tFAiKgEnifRzcey4B15L6om4bgEY++jbIGd33hXWz0WtuS/TBQHhoBikCKhUXHK
	AANlDw1nIzdq4fQQcllM2eFL/eO5/ymgS69ROopHkoM9u/fSWV+ewLF+z9GSG9ifrICF0J21h/b
	e23AjTpnWC0j3N69HUJJQWByM0UnfDLnBJuCVOlUA8nxcgJ7pZl+EnIYe4edP6AAnQw1CMaL1ZH
	xFdh5OJ0WWTFb0V/QJ6MCB+7E0SlGA1Ij7k+kZZkmoM0GiwlmsQJPvXZ2wSp/gP+gXmLdw6109H
	tDe2L+02IWea2t2dgX5NQyjgD2mUf1/0SUf4navVTLYpsGkvrOzgS1mWMtAsveuznX6lrWHpGvH
	uC5d+5S
X-Received: by 2002:a17:90b:544f:b0:35f:b46e:e329 with SMTP id 98e67ed59e1d1-3695189552fmr3108678a91.6.1778835761921;
        Fri, 15 May 2026 02:02:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 10/12] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Fri, 15 May 2026 17:01:46 +0800
Message-ID: <20260515090149.3169406-11-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_100244_065715_D7881D01 
X-CRM114-Status: GOOD (  15.13  )
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

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 74 +++++++++++++++++--
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..c95a54de3567 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -266,6 +266,47 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wifi_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie1_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				bt_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb3_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &adsp {
@@ -791,14 +832,14 @@ pcie@0 {
 		reg = <0 0 0 0 0>;
 		device_type = "pci";
 		num-lanes = <1>;
-		vpcie3v3-supply = <&pp3300_wlan>;
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi@0 {
-			reg = <0 0 0 0 0>;
-			wakeup-source;
+		port {
+			pcie1_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1085,6 +1126,14 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+			output-high;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1686,24 @@ &xhci2 {
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&pp3300_wlan>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.563.g4f69b47b94-goog


