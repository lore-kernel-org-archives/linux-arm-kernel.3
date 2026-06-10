Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD946CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTmbH1zLjGPBws1HWPEepttRsufOS8aO88js0ToljD4=; b=ccKM7E7BfF/S2SMCAj6jz9iUuK
	mIXFZcHHHClbnYklUId3RDKUjmYX4v6a8uPwUwJvncSj8r5EmirMcdPQLddxtIDFw5WFs9PRh4fCT
	3vWvrzHTUvVmSKSgWD1TOv0gm5qIVprEN+jNoKVFlj9hEiyrNNfhf8PP2+zlknTroVOy3GvPhE7kb
	mEv3P0IdRjIiRW0RFadNlIEp4hlktvEosf8rdkNyZysbrVStp4MYPU8E40nTrlyBXBLbxCzEvP75n
	fGem6HNSpMab1vUoa5R3Z93+y6wu2uWiT6UCsMAbpZOrdZpIJgKCMpx8WDMltvu67x8wcZ19S/m71
	dvdkK7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVw-000000076Qd-0Fco;
	Wed, 10 Jun 2026 08:42:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVs-000000076N8-43jr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so54550495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080936; x=1781685736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTmbH1zLjGPBws1HWPEepttRsufOS8aO88js0ToljD4=;
        b=A64xsGHvpJQ6S7yh6dlk+FKoPdeJGjV5xxC7Nh3vdKrA1eZXSO2KQ8Y8JmWPUmT8Yg
         R5TE1thvd6GSmaChje2cXLmydkwsatGAyp4EJn98sWcK4zKQplIpcl4IytZU/4dayl5m
         OUyobX7K5E3cNsuXufbASe5aJ3qSTH3IFMUEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080936; x=1781685736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTmbH1zLjGPBws1HWPEepttRsufOS8aO88js0ToljD4=;
        b=U7UlnUFo9FurqetKz5Ri3i7pR17cdSgFRAQGUFrYSVM+rZuvc39rl8HkKKxh/1RkSd
         6MxDQRdjvJBg8bN6td/GQ+lMzdyUIG5I2VQEi2tfBX8nxlDIhWieZXecPGtXdJVrQqAs
         +3eRCtaqGMwWcmghxNFBRDd19K1YesowZDrBfFScOVAcKUOKCudvvZrzzTtUpSdwBy8I
         cbS9Z7Fj8/WD7Le1MINoS0O9ncTRtcN+Nh++EF7mNAUdZeF0/DtTtv+sYZeJvHkr5x+f
         SWag2kknBmDJUYWf62XkgLrX5kBTWD7LRcj6qw/jeNHDuLQ2r1O+UKcGV5ubG4fpJJJC
         I3Bw==
X-Forwarded-Encrypted: i=1; AFNElJ9xTxXHrfyftEIbPIg+TW4m5ochGQT2k4sWmKnY9t2QRTYwUSIjRwZgd7nuKI0JRaRUncu4A1OmB0dN28x2FXHV@lists.infradead.org
X-Gm-Message-State: AOJu0YwL26pxEzpj12AETtXIJD4PI+rzkWILjxkleMZHcAJWE3xBn97r
	xW8lulZ4K6m52VG1kgtRd8RdPkqOAln33fpVu5LkUIXtctN+It+c0gvHBj7bE2AC6A==
X-Gm-Gg: Acq92OE6Jg8xqTpB3FFoZHlnLd3QV2HgMSi4pcl8evRG6C9PQn1FUYw1YMHN7MSmh3k
	m9e7t+rT510LHjsH340m0KGlvXId42W4kbXH6aGCyje3w1pO+EPi0tsICfOdt2XH2+f86j6rIJT
	PjVp45fK6t9R98flHvEePgpSPaKUNjLeyrpM21P1wDLe1277LOuHLxjALq5MlmhGXWZL2fanJce
	w9nhXYC38fKDH8HF1uyKEewvGs1tx+BBeln8ZK2QvYqhstCT6NXKNo4YMjUTM46qZw5c6XeufKd
	/0kxzFFJ2D7t9rl1c1gYnYS71y3Yk5t/VzcYF4fpObMvyX/1EXSfkKIJOYo05CTYXDSaM/h3jQw
	eUG2iy3CrP61a7veDSwbbwLSPUXshjQqos4mfPZx4zEA/3arS94xNr0+R2GuCZFcwlpoc9nif6X
	mbbGr7UEDInVuRestchwixjpHhBM7blUhL/K/UQrTMCGB1dr7ED9zHlsvJaom8w/sxwMhkgbs3u
	JPgQP//8d7hjD3cJg==
X-Received: by 2002:a17:903:1209:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c1e810b983mr261933095ad.19.1781080936358;
        Wed, 10 Jun 2026 01:42:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:16 -0700 (PDT)
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
Subject: [PATCH v2 13/16] arm64: dts: mediatek: mt8192-asurada: Add M.2 E-key slot
Date: Wed, 10 Jun 2026 16:40:47 +0800
Message-ID: <20260610084053.2059858-14-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014217_016212_D435499C 
X-CRM114-Status: GOOD (  14.51  )
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

The MT8192 Asurada design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller. Also clean up the
pcie controller node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 65 +++++++++++++++++--
 1 file changed, 58 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index fb4d92750770..901240384a4a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -318,6 +318,41 @@ usb_a_u3_ep: endpoint {
 			};
 		};
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
+
+				wifi_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+
+				bt_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p4_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &afe {
@@ -671,19 +706,19 @@ &pcie {
 	pinctrl-0 = <&pcie_pins>;
 	memory-region = <&wifi_restricted_dma_region>;
 
-	pcie0: pcie@0,0 {
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
 		device_type = "pci";
-		reg = <0x0000 0 0 0 0>;
 		num-lanes = <1>;
-		bus-range = <0x1 0x1>;
-
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi: wifi@0,0 {
-			reg = <0x10000 0 0 0 0x100000>,
-			      <0x10000 0 0x100000 0 0x100000>;
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1206,6 +1241,14 @@ pins-bus {
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
 	mmc0_default_pins: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO184__FUNC_MSDC0_DAT0>,
@@ -1773,6 +1816,14 @@ usb2_hub_p3_ep: endpoint {
 					remote-endpoint = <&usb_a_u2_ep>;
 				};
 			};
+
+			port@4 {
+				reg = <4>;
+
+				usb2_hub_p4_ep: endpoint {
+					remote-endpoint = <&bt_ep>;
+				};
+			};
 		};
 	};
 };
-- 
2.54.0.1099.g489fc7bff1-goog


