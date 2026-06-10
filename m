Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88903CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvuoLRCQSovwiopZEvbdmvmPWRVQtE1B+7b6jjVlfrA=; b=xFr1+nsJ+jIL/ST8Kc0i6UEV35
	wjMviiOnMkJg5uoT9TMNgHIAgaZQhggImFGlaRhXdN6ItawEd/2NWk8k74XB6fvvCvmOZQkJoRPJq
	P9pnSYNVmblwAkb4YJZkS/aaI2oueNbL9L8AkZGQOsl7zpZJEA2ICf9iiMuf6qdDyZ3ovz5GIqu8V
	W4KrVKwhlhua6DxKGkkor5nR1UOJ8KNZpK7QT+aWz3KeRVU+fHQ3GBUcjM8w+Vv1kYNK9c5MQndNs
	av8ikxsdVTXx7eo7Hg0OnoJXdyjgbxkBs90V/PW7iGNfDLU1y+0HqurpsIq0A4USA8voHAwOqu0/m
	NRsSTzcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEW4-000000076cs-3Mov;
	Wed, 10 Jun 2026 08:42:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEW2-000000076Yb-0Cme
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0c3184c71so50121715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080945; x=1781685745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvuoLRCQSovwiopZEvbdmvmPWRVQtE1B+7b6jjVlfrA=;
        b=freYqJer+HzamFinyKPp8gqfNv3GH3JaDVn+ZHdWEQbKOscGny9JnfE9zUen44aHtA
         6AEzagH9uqqRaVRUsMsJubcqx/8zwIytS9QM4SQYvueWu7110Ql4dfdefhi9Yeb3DKrR
         DSuWp+SSkb6EgirOZzk98S4sZc2K2OCn5Uq/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080945; x=1781685745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bvuoLRCQSovwiopZEvbdmvmPWRVQtE1B+7b6jjVlfrA=;
        b=sDGHz+3A1cbeY0VhjRsuw16bZite30yC1Wsk4e564fswhekiM0x0w0qi61SAmt9+Om
         EO7JqBRrejt5pdBPazQIiD13A4NghYsiUfpSUm9rBnuQXbtzk0GerDzlBPHF/Wa6Tzfv
         pNHigkgiNIOD5L4S/CTZa7RAngaeZWvzeyXfiTI+ZqGqXms4/5UAoXSPgljjDcf1pYy3
         /cOxF/vy4OjyqPaHO8XxLs1KlUBD42b5XKlvGakj2WZ2W9GHpCsNlkrRuzH9/dShxvOx
         ohCRPvfImoLv/nSx8zKlucjHM/CidsXzksTxKFkaTpFQKqH+PZPiukTlPO/dPolCjVF3
         YQUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fHk8BYDhqc9+3+1Wo6ZVZ/yxgxUDzDgsGpCl3QmC4hZEX5SpuEKbJMnlFct4bA/aXK8vKWx5v07iqYS4hrhPy@lists.infradead.org
X-Gm-Message-State: AOJu0YyN5wCFdrWZhRDISmtV1yWJS2AKuiVOFDn06yDonGWFZvN5PSsZ
	3HXB6MOSCGEmEylUaxEEp1Oay6/vKUgQ8D5y2NjRUGFbJ5TOa22QfDg/QyNNrK7N8Q==
X-Gm-Gg: Acq92OHR5vUc2R6SYWv7D9nSo7w2kRNboN5YWgqT3z3NhFwNHoXLy2/jW374A0LR3tg
	xYaH05iRb2p1qC/3RuHyU0M2gmtGLzxUgYcf+ZN9tQSefYJ6nEyOHKqguOfxwMNO+H6vgp6HcVt
	ZhKyjoOcIPSWA8GnKCxGNDAUJIR4PycjRCcpteGEgfn9zdYp9GS3TwrbD5bNA/+ft9+lX8tC6DR
	/19Xry6CEkbUyIP0QxfAh+OFXFjc3fV+iNzJcQGZPdcUS9DyEH97YmwTJvjT6rZl/VkanWRIyXw
	YNhNXY9J8D6BQH41vqbdgAQW+WJCfObYCSkG007RbKBU2AKPoDI64jWfpMHX2nmZKHh0qKYTags
	nk78py09cUYM+BnburDUD3iotZovaeBwoovcQtGabY4JLlB7+qBZmSKwrw5MYG5bAJoXvBG3Act
	ufXBKe+nWL8d/C8Cia5XZXmmil9yq8+dsR0M/JxmyGETdzdq4i53HzSmf2/+6F5aFgIzqCM2cBD
	4RnZq5WO5GE3nQmYA==
X-Received: by 2002:a17:902:f543:b0:2c2:27be:39a3 with SMTP id d9443c01a7336-2c227be3b4fmr207662865ad.29.1781080945255;
        Wed, 10 Jun 2026 01:42:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:24 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 15/16] arm64: dts: mediatek: mt8195-cherry: Add USB type-A connector
Date: Wed, 10 Jun 2026 16:40:49 +0800
Message-ID: <20260610084053.2059858-16-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014226_094695_0B754C42 
X-CRM114-Status: GOOD (  13.01  )
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

The MT8195 Cherry design features a USB type-A connector for external
devices.

Add a proper representation for it with a node for the connector and
OF graph connection to the USB hub behind it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index c95a54de3567..8a21a8b996df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -153,7 +153,6 @@ usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
 		enable-active-high;
-		regulator-always-on;
 		vin-supply = <&pp5000_s5>;
 	};
 
@@ -267,6 +266,32 @@ tboard_thermistor2: thermal-sensor-t2 {
 						125000 44>;
 	};
 
+	usb-a-connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&usb_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_u2_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p3_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_u3_ep: endpoint {
+					remote-endpoint = <&usb3_hub_p3_ep>;
+				};
+			};
+		};
+	};
+
 	wifi-bt-connector {
 		compatible = "pcie-m2-e-connector";
 		pinctrl-names = "default";
@@ -1672,13 +1697,55 @@ vdosys1_ep_ext: endpoint@1 {
 
 &xhci0 {
 	rx-fifo-depth = <3072>;
-	vbus-supply = <&usb_vbus>;
+	#address-cells = <1>;
+	#size-cells = <0>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	usb3_hub: usb-hub@1 {
+		compatible = "usb5e3,620";
+		reg = <1>;
+		reset-gpios = <&pio 84 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_s5>;
+		peer-hub = <&usb2_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb3_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u3_ep>;
+				};
+			};
+		};
+	};
+
+	usb2_hub: usb-hub@2 {
+		compatible = "usb5e3,610";
+		reg = <2>;
+		reset-gpios = <&pio 84 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_s5>;
+		peer-hub = <&usb3_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb2_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u2_ep>;
+				};
+			};
+		};
+	};
 };
 
 &xhci2 {
-	vbus-supply = <&usb_vbus>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
 };
-- 
2.54.0.1099.g489fc7bff1-goog


