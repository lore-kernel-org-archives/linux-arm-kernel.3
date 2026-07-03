Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66F9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=; b=eJiHGR9UlGGzkGr7uZ30780Rul
	JRX6bn1mLbl1NEkWUlskW64SO4pIWC0pWNmXniVrNw4s54pVzP6DuBlWKS0PdfWv0ym6JJ/Kz9N32
	bMyDff5pbmFbDdVnM42TChFrkd9ygs5yNC9JUUNfCptqqvDdoo+JzUS7DiPGciUxlSXTkxz7GQUoj
	daQGQbugb8cZkxKek2mJdDkPhArKdUuJXzXcpRCSYUe9Bgv0rk6NHQnk2BCmUfCk2TV3Dkp18uJbh
	Vpc6jhxJ0vZrqXwsl6Hv7H9ydNIl8D1JrFrl8aeYUe1ilaqHWgOCPfvWP3nZoPySJa3pmlcIx8Uuf
	XgIXabmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbhB-00000006lwP-2qlq;
	Fri, 03 Jul 2026 11:04:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbh7-00000006lrC-3QoT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:32 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cacf197759so6079515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076669; x=1783681469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=;
        b=GjBseLXFdMknKp+OngGjPULrK01erKWsSbmg7K6mri1bFaGLBwZBC9pbl11CF4iQAC
         hAxDnxGVtwtTqXBRyz8iybFnfqalSOokqwy16QR/0Gg8lKCLkCBIIVTy7giJKbJO3siM
         HRexnk2KzNMHgvYacamHHFuEdQG06Cmqa2FgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076669; x=1783681469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=;
        b=o6er0VSNiQOwPKQ9dbGeyebueSCOh2Atn8RH7/ukDxXVyFd+pOOQIx4pCD7LLocszs
         2elfwh8tiRIy18Cg61c8IPEG3XZFDbrQqskbHEmY4gTNjeTvtE7cfMST+tm6aDOthDhw
         4mihC6Qi36ZDBru/mg25/1/f1hVPX4jjs+ruLCSGSr7UC71zrYpRkTe03Db/Z1l4IKLx
         2Pk0uXbDQ4KGdXhFT37hExr9gEbc/9JLPWXvHE5B7JTH/sHxUWv/6uXo1DVPPmwM0l+j
         MQgvR8T5WLQ/WlJ1RfuvQD72oDBT0QaBzDPsvBQVFmlmyKfJopVfliVLysZrwrmttZW7
         upQw==
X-Forwarded-Encrypted: i=1; AHgh+RrHS0hFlmL4j/ZZPxmKaKk7psEqzqJAyJFaegUvSK+o3bhKUBzTO25purTSip9Q6xJ+xMi2v2rysjBX2f4f8uPT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0kbc/j4GwuQtHME7v/bSXA7Bk3+5T3MPnjMAYoVHHyNWtBju+
	Cel1QpQkB2PNuBOgYw415Mix5rZlEdmEOEklbeCyw1OVNBDdwno5o8ByoQm0AEN1Nw==
X-Gm-Gg: AfdE7cm9Tw585j8ykI7eJlQHJQOmw7BPqaeqAFMZWY55SLmHR+NNHJM96I0xuMDz43S
	wbEELRcwkKAOsdlZRNgi1QKqREblOL+NALn1qSb6KHTMJPt/qAOJZorozb395WLZ11B15myRUpe
	ppKnG1nBHAXvPt5d8LqeVDtfMT2tcbYpixfV1167/3gtA0hx/AuB3fmOyEXuU9DtdRviX7gwnfI
	UDqnNzP64XeDK/ThdJMsjJRfO8CcG28r0pc2ElMI4IIjpzKWdk81mH7gnXnfoS29aUB2murVA8A
	Udy1UlISihreDhJ+mtk2ilYnY5Dsdn0yPaBsheKUZHzWYY5uqST+dE2yUujFMLeG25xdhehgwoK
	yTisHvzOT+E1BR1i17gJaPtt/eOJonuQL+cnhiu/rEbFwBWHLmNFPH6e1KOuZqdtDTYeaXCDPm7
	qP0YHegw9thCpv0vKuzTLdJ7aZWp9gt76f3WCEYPsslYLEddPFo7L5b5cI0FPbH5Tbf73ibtgo1
	KACxC8i
X-Received: by 2002:a17:903:19cc:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2ca911ddec4mr103561175ad.30.1783076668529;
        Fri, 03 Jul 2026 04:04:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:27 -0700 (PDT)
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
Subject: [PATCH v3 12/13] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Fri,  3 Jul 2026 19:03:13 +0800
Message-ID: <20260703110317.1283411-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040431_195860_568D3192 
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
2.55.0.rc0.799.gd6f94ed593-goog


