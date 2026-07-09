Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3C1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=; b=trbkpq2Apfbd/XsdugoH1WHD7X
	jILOPrT4uHeEWspup9RKvkC0O+HNrjFq7dA+2GxitCJq550Y7XdVOzvHxs/hFzzVNWYriYrGY4jdp
	JMj78uUitmtdDxUtUuYyYtKltHht2c7e5TJ8hPE5qkCsiPutOhbQtoVKFqs4SzEgA35eF5IVdmaKg
	9VfxhNwwcEn8Rt4jrflAp4WDzMQ77XWQYmIcZXifqfU8yLP47eVbISgr50gGhU1kypg/G4Fjpr/OJ
	3O+swOgL3uY1fHP1PvAU2dnFPj6ddZB8lUCJOYLgdwVQtGMhx/dWfqFkPVFU8SuBYlJFqBJvU36HX
	dtTCJz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWx-00000001qDg-0nOl;
	Thu, 09 Jul 2026 09:58:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWr-00000001q4P-0taN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:58:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2caea3f742bso8771765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591128; x=1784195928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=;
        b=YDULfuhBvOo5RCecSwshpOhnMSp0pbW0fWI2GsQLBvzA+y2egfItl6uMgLoTeykAxR
         f0pKPETACUwgQcJwSy1TAuL8aDRIFDaGhi/4jTyUf+bsLj9Om0TH4e55Jlzp1fSjddgX
         VIWoDAqaJl5E7Dvot/F8eRX+XJjXtp8cewPCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591128; x=1784195928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=;
        b=AsCGXg6qUfrEFthZLdzEFrkD6FUI9EKFFCIZ9fnMAzkvy6htypQHkIAVsHzx+XdWLS
         m3qcl9rTY9eRt9KPaVF4ziw7F2gtscXA5JUclfnzD3RZShRPlLtegZyBLP0/7+QPqHm9
         N6+OdtxsWnAGBUVxHk5JKwUOcrFaboDrFdzIt2oh1g0x/HDq1yJP8K5N6GTh6HKlBcCn
         16c1JMIxopIYErBEkfUSQUmiF+5CY7GJcCpWnf7jIoWa4MwkSLaGxgvBnGK5OrmT/9T6
         s3U92DWfXydNbd9Eo+xThPXEbrB5aesXlB6t1MBA6upQMH9AoQPsSTeGtlgXbnBwS932
         eKwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdP655Umt4dshvJj8djKKeN//ZlXF/08zngg0Kt93lYPScHheU0d04mCXeAtYRbVfobisyohfcUo5Dh786eEWP@lists.infradead.org
X-Gm-Message-State: AOJu0YxtPJbtdATnRbzHIG2i5wLmNI6y2TefKXSfrPe+64uOPR8nBQxY
	48otTZzv2XFvIexoztOtFN2iKRIJP/d5vdkKGrQcJESqFUmwMD5OmjtYJcmF2jAbrg==
X-Gm-Gg: AfdE7cn4zkhnFNDvD25nGTJno4Ipao80ATgjdddEb+KLktIhH6+McLFROLZBbZ94xt/
	+VA8+WOAzCc4nxaGizn54hw5kia8ENkMqklOOZnHe5qGq0Oyd0wftI/fd9XAh5aUmeY7LwAdrQN
	ESmu+2pANvkC0ENpCzr7XgnunerKkxURYS59y6ZOVMb+eeVDUa7pg1SgR/5w8vmTEAofkjI21qZ
	VnCmqD02KipOXV/M+UieWksMx1lZjur3rPvznztrEwobuLud7DVz+p+KhwaVCnBUTs1FPFKhWxV
	K5vp7l8UC1YRHRwh/2bDaZQ1ZFZGOzRcIhzZW7ZBW2rkk9oAg31F9La2uoXa/X8nZttiRIOKrJ5
	QfkdWxj7YA7BJjwUjqw5sKxJgTKwxAA4UjWC+sxkBLYhQ1LDmIpcAxvxV4a5/fjz9xmfoc2rjoo
	2dnQzbNdJbh5LR7RZXKFYhwDi/1ankRV/7o4lifjNbgF4e32rJmSthSAdCAOo4jJsTWrv5dg==
X-Received: by 2002:a17:903:17c6:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2ccea480bdfmr74905205ad.32.1783591128101;
        Thu, 09 Jul 2026 02:58:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:47 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v4 13/14] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Thu,  9 Jul 2026 17:57:18 +0800
Message-ID: <20260709095726.704448-14-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025849_299016_A0402CD3 
X-CRM114-Status: GOOD (  15.25  )
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


