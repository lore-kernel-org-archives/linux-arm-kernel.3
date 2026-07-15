Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC45C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=; b=hTx8mpPhPCIgkgTbzETREDM/zA
	S/AjHDErRWcgc/LQjzBLZ/neJvNEOf3AJVWd2AR2vm0Sorr3NNJ7qdU0D7NCkP+nVJmmQ3c8bhpu1
	mHx+iKxf3JY+CUygdJ3tnnc99KY8hxGdz98uDk0nFw0BlXIQgcm+MIgvFYRrABr3oyw6GSBueCab3
	XoiQPpylf2U1QvnKG7zHXWY+SPckHrinBcDxwQuLDXZC5BO+1hU6HHJ6WXKDq3aiLD+S4F4f1jcAn
	H+nw5RJ7EEZ/JCOZ7HNvdy40D/V+OWanSEM6g3DDPovRo7/hBC3epp/IIku6IlN6+Bv+Km88j1ocE
	qvPiQyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvPN-0000000EF00-37hB;
	Wed, 15 Jul 2026 08:56:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOr-0000000EEXS-21JO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84874b52eabso2544123b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105729; x=1784710529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=;
        b=nxCXfGjhT5YIIr5R5nW21+2NW6MSnCu6M1XF5eNXS2ms9agjADs/LWO2GY834YY7Ce
         ys8to8ccq2UGqHl3pxptvHzO9Ayi1MPIP4L9Y6GRt6lN8nO2RZrkmiUtDacxvIwoaAFd
         DEDB0+/y6eMnnDiVrywH1Sv4KueSxK+rn0vcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105729; x=1784710529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=;
        b=Kv1EZsXwwAekWbDHkiH3I7JYA2zZaG2Telp5FiM6n9rcA/gKiVdYHo98Jb/njN8lye
         2o5Fn8+bpXdiec38/mXeAJiqywc2gi7gJqc4vNVt6MYT88mlnq5NgIOdp+fZV1lUM3Kx
         s7LVQw6hWDA7QI9463imMEnjELxyqfEDMRh/AMlbJqHKj3N2jLcFptt4jcM+coXNKrut
         zzRcN8W4SA9C4aWwm+AbU1R1l0byk/RcsvvngfOtMx/EYW7yVjcVe7jmjLrPZrVwFLHg
         Ww9noschUTJ+VIyuX9QWwtO5vly5snwEUMDqc74cuCA1gTQcml36J3APAiVYLD+bsHvU
         Fdlw==
X-Forwarded-Encrypted: i=1; AHgh+RriR0dQUigjd8ee8ckmC35k8XIWWv/1qkaLS2EwO5Zhmz5ok8y8RwE2WHLc8HUE9dRE1cr/ctVQnLcOaW22sptI@lists.infradead.org
X-Gm-Message-State: AOJu0YyxHQyNNW78XtveCwPxfiET/JusZ5Lzf/vU5tDFN12SVCIbAEkz
	obNLBIH+Fu+ovtukdQFle5ddurMd1Yx1nP2+PuLsZ4HiXOsDUy4ooESFkbcVUGwnDg==
X-Gm-Gg: AfdE7cmImtLwV6dgVIlSomJz0PGXysyGrnu2aQamB8/5El9DdyimSqutO/VvVH+1v6T
	XhqRHxGAFTJehvrIm3/Kr1ASjj7y0IN8LNRm48F0zYQuTNVq43Yg4G+JcWI4Mf4fxwQhTaq6lnf
	3mjZhxG3yFCCIlvt7ViZsjQ9Q8zhn8WWendZXkBOPmq06z01tzim/zJn9LwtTZ6OcuUztvl2shr
	h45oJMYGPFvH5HaIHYBD+sU9YF5mZq5VsXZZxXsKRT2kp29dq33eo/1ARBcCBqgQ8gkibK1VQRp
	66t+35j1p9KBHjMX+5i1kizD77zWZGTnC9fl3DJYQdZLY8ptKk6jYBf9eVML+Aw0rC3T3caMVSk
	4xrzwml0HVeZVN7s8Ncz7XMF6LlnM6y5RCm9hul+39mJOemY/djlIcfUU/wuNbXCyOnfMv6liBh
	3WMPjcRQuj1kU42t5Z3ZM/jOS05TLP/+dJrdJJqV9y8HwplrST8eA+Pieqme3U2oFf5Ntcv4pee
	MFaojN2
X-Received: by 2002:a05:6a00:23c3:b0:845:d284:9e11 with SMTP id d2e1a72fcca58-84889756a2cmr15382339b3a.56.1784105728841;
        Wed, 15 Jul 2026 01:55:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 15 Jul 2026 16:53:45 +0800
Message-ID: <20260715085348.3457359-16-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015529_550719_7997C1FB 
X-CRM114-Status: GOOD (  15.24  )
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
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 +++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..8d4cc30d91e4 100644
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
@@ -1085,6 +1126,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1685,24 @@ &xhci2 {
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
2.55.0.795.g602f6c329a-goog


