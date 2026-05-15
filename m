Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA345CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=; b=DjJIyDP6khdA+RlNlbH+L/fZUC
	seXyCVZKmsfOp+L6Yw8mUItz+LNcQOjQvUkRfGnYLNhiEjhjYrofIc3wKb/k0kbJko6u7RR7vf0oM
	RyVSoEYCSy8/w4Bg8BeNLDBrQtFkcZ4gPLbEzC8u9WBM9ni0jYmZQSwMPUMfGLRkjl91WaixmSm/B
	bsjj2VYBscif/Hr5kafkSJH1wocFrk+DFuUQLgXzTlWsSbUYe6U43Z5o+AaDH1U4FM2k4tgZCc8a4
	ORREcrMdBy46yDx2kA5yD9oFjJGkUbpYOpRg4RRKQBLvysV1ypwWbFSkSg3M1yJ6lGzF+lneatRid
	gZzlfggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRa-00000007pKi-3Cpy;
	Fri, 15 May 2026 09:02:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRX-00000007pE8-04G0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 09:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=; b=fo8+nwvO2p4DAW6ggBLD6ON1PU
	LP2Hoonu1CNa6p/2YtGvf2WGGG5Mi+ZR9WbQYiVwvyoWcywYabG8yq7u333/1AxodxKIILsWsK6yp
	+Ad2hk725VTkcKudrSS3R7nI33GJdXIQX7T685hCpPYnP/4dmYguzXTXxCzIcR4JoAnT6QrfEsYeg
	78fdyZdUdFytb7hXFHbVlWnIFxiXDnwdnb8hjLDIX5gPz6WFlr0oCsCPGIYLAtFfoCRTElofPpglF
	SFtidI3ALrR5N/GGSTb7X/XxpTuUh+a9FQSkwBf4B8+zMLnOJpq2A1OKnshvAsDMJwz7ApqUQyneA
	eXNGPqeA==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRS-00000004hET-42eE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:02:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-365e20fe3b8so5375020a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835765; x=1779440565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=;
        b=laT+Uzw/e7PUf4vhfuRP8FHpGHzgRAf0P8NE2gVnDECk4tF1EZLwsVY07ATC4w5gzd
         3WfOh+eGAIaUIYEq0q3rP549wl//Jtya7nzHp4IfiY0/N6/5HJJIoppUDYknhnX9+IA4
         LOGpsLvy3AuKpX/sGN5rtMnhh8KlID8cGZTOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835765; x=1779440565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=;
        b=LEoggxAQCtwDR2vITMzSlZCol+/bNRApjeOJtnGoLQAFsj/mICmv8QnkuJsJ5aoA/i
         rAo8VrkltvKsPnhumXq/4K+UHouLv1Rs6pxROKopILMxotAeDqfPko2fJldpPfAPTWb0
         jb/qcEqfuKzn/0MSUQRUBh6Nk6Z54neRlFS9ccc+bl9mtdyzBhNV5bOM1FvtGJAlSB+H
         mFEBMayLsQOjwJsKoHMpPr7EO2NJIbrTXixnMhOUgyX0mGUHoQxgvCGf0CaAsKnSP0S5
         6IwZyNqZY3BE9MvLFEce3zbDPa7jk/pKfYaavmiPSwiO4MD1C/XSdXxy5Vyais/3D8LG
         HGGA==
X-Forwarded-Encrypted: i=1; AFNElJ/4vCwlXCuEY5sEh/mWtX+Ov68k4Q1epQPOOGQGdfgOoOR2avl+pr3PCN0WZbEsUX75XkEiNtFr8oBgrYmvGC8x@lists.infradead.org
X-Gm-Message-State: AOJu0YzkJbKJZo5GBj4iTcKU+Y+9g1sMNFe4RzNYLqL4zgywhqFfKS9I
	Ryr7hkxTNrm9WCKDkVKXGQald9jJqbk74tTFqQC1vIWoxnB4Ze7U0AAP0xSXM9ZJ2Q==
X-Gm-Gg: Acq92OEjinAss6VgW8XkGBlTYb3fNhloZ+OdeqrM3GUMIsLa0x4BrukP3Nx1MOGdMP7
	jiho9IZAKRRgvHbYIBW82nx8BFLynYAs+yr2AWL5RpLdKDtWoSiD6EiY3xSnrAZ6U/CnbBof+Z8
	NIOQU2mVboHJpqvDEztSDj2RdezSbbe68lur0Z1GRX0eTa2U58rKfhl8nr3iya3KbSvMSOrGrBc
	fjedBHVIMDFahJSykJPNn1m2btfWavp4d8Vo7iq8z3zqZzhtIUGF0L631idiWC0zEXnw9VRFR/y
	y4sZsS4wUMXwsW3AFtjcooLWLlmow87HLMA0t4n9913oaqxVO3WK3AD9Sx7PZtUnlRTvwHqY9Ew
	KZpo6pm/nMGpz9UWrqYVrXuicnpusPinwgyHuTpVUzKleRs/RxPDdfmer9EuJvVf4GxBFBn6Vu9
	45RYDT0jrPd6d5EDhWlV2UXYZ653nsSIFNBEA39Zt+frBx7AF6uVPoT93pixYjKEi5FJEgB/wep
	TLIzvfWXDoTcIWatOQ=
X-Received: by 2002:a17:90b:53cf:b0:366:16d1:6a25 with SMTP id 98e67ed59e1d1-369518b206cmr3162750a91.5.1778835765371;
        Fri, 15 May 2026 02:02:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:44 -0700 (PDT)
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
Subject: [PATCH RFC 11/12] arm64: dts: mediatek: mt8195-cherry: Add USB type-A connector
Date: Fri, 15 May 2026 17:01:47 +0800
Message-ID: <20260515090149.3169406-12-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_100247_475698_01EE7736 
X-CRM114-Status: GOOD (  12.66  )
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
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 72 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index c95a54de3567..b21cbe918c1f 100644
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
@@ -1672,9 +1697,52 @@ vdosys1_ep_ext: endpoint@1 {
 
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
-- 
2.54.0.563.g4f69b47b94-goog


