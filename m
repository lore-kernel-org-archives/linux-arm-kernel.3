Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FC9CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//v6/82RkqjQCguIRc8t+FdPVtsIJvFDXM0cNoEMOXg=; b=rIYpZ85IqfSTX/TPMUbxgcM/AP
	tBAJYFJD4/aSyoGd+o+GQ7jHFHtZCb43yzfGUfys/d8onYPx1W8rwCxucKITJAWfCqQi968wv/stf
	w4YsJcu+sAZaZ6WmC+EMW7fldhE6fpqOUZM4HNYYjcozJwky7Z0EMXcst3IFYfqkunBWGNo4mYzf6
	+F8RSoscDqke38SLVKqOylW1+NwlpYQ/Yf8V8WruVZUM0biTFrqBr10Z+VBvtBYM4+QzP8qTGZDPr
	guLbH9XQZpg2Fi0yigqJdUwYxZ3/gSFgtM0OOEhqF6UdCJh78v1yo9abFlXT5Y0dSauiWr3Los8jA
	P5TGdn7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVq-000000076Js-33mS;
	Wed, 10 Jun 2026 08:42:14 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVo-000000076GK-30VL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:13 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c8585c51f1fso3064153a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080932; x=1781685732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//v6/82RkqjQCguIRc8t+FdPVtsIJvFDXM0cNoEMOXg=;
        b=GKTQ3TfhvH5iKWtFenxCFN3ykqEfpymyZ8kifkovnvtA92Wk4bJ9eXgWYJ6BakcRv/
         8U2L5r8YcownTcORCIPFfibMnk+i4YULNL7xaRyMo8ypYrZswHd2DB+qF1FXj/PnzioU
         k6/ZfsTKbmGLRTHXEuuKzNuMxqaAnNKTz1rjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080932; x=1781685732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//v6/82RkqjQCguIRc8t+FdPVtsIJvFDXM0cNoEMOXg=;
        b=dhBr2aKc9b+tsnjDwzlzIEe4/eenCDyXq3rLRwZu/M0oJ24YdiGvy1baymMYpj8Xkv
         8skZqPbDaVOY1LpKTdA4nhmUpGBO5YRnmiA9l096f7mNPv4ZMjM9Fw30aHV2gLyrfBm5
         u0tFi1koXXvUFgiA2S8k0ZyPbog5ZS953D9O+wehd4JRhPWnoaimMFSfpoFhTblSrYcd
         efTNV5XLnGdM0gy3/dkqK+t1q4TZA1aSrEXfOQUGSaihfyQmgpjCxWgd7oiZPjz1Ib0f
         +a70+MzqNt2tN9EYQYdLibob3h1YRyMh4kYU9L1XtZPcszNmiKNHN5/+GTXzj3J50QIh
         bjng==
X-Forwarded-Encrypted: i=1; AFNElJ8HalcE80J+FieUjNvIq8xl+oAreaY0jN3C96kpLxJQKZz0/pMjP/LG1E3pMQj0JNbWk5zq5+omqsGFxtG24JGx@lists.infradead.org
X-Gm-Message-State: AOJu0YygXhVk+q2P4Gez8YOthERpVKHeFrlMeYo3mwrcDmUxJityIhop
	WLffRGJiu2RXyzMCz8U5ARp896xr523dfwUCjyytt5krPABaiHraHasHt6sGH6lOaw==
X-Gm-Gg: Acq92OGTZZn7D6VG/w6CZQFCEvyOA9oR65lFhvUievIEZadSvPwpzFpN549VAr7pXGT
	hgYz3KECVFwbx5d9ooTIkaRfmDBlgoxDSnGbHkAAKFwDyIldLY6NOLLUXKh5eAlmFdRPPpIcGoW
	q1iKvcM8/v6IQ5use/oWkpy9ZgZEjPtz5rwRy+YRJNJu1ymUbwTPCwJ7zvmrPzd9rC9cWN8Lhec
	P6eoAny0C8OrDtBotEd8OU53lgwpHFgvFPEmLGU6v/vSKzuL0Mp/2lJXestEE2NFKklCzUyINXf
	TD/pu6Ijgl1p6WnUvyOF7XFOtjq9saQalHp2SlKAC4XkpstAgCW8cChnTxudALv9Ys+1vFK8f6p
	dJAgjqVKmKi0K1IuUl44R+Z/j3qMVHhIn+zBx8Qm46mj8xlVLXXInpFRmZvJuipuKs720vW+WhB
	mVgqKiNoRgfU4rddw4ZBNsXHpafxYTBo2PygVSFJW/S2CkMRNh04XS6ygmdentfdzpyob59sSr/
	y3G5P3bBM0n0aVGXg==
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr217649415ad.7.1781080931995;
        Wed, 10 Jun 2026 01:42:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:11 -0700 (PDT)
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
Subject: [PATCH v2 12/16] arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
Date: Wed, 10 Jun 2026 16:40:46 +0800
Message-ID: <20260610084053.2059858-13-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014212_759155_737AC86C 
X-CRM114-Status: GOOD (  12.72  )
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

The MT8192 Asurada design features a USB type-A connector for external
devices.

Add a proper representation for it with a node for the connector and
OF graph connection to the USB hub behind it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 74 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index b7387075cb87..fb4d92750770 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -292,6 +292,32 @@ sound: sound {
 		pinctrl-24 = <&aud_gpio_tdm_off_pins>;
 		pinctrl-25 = <&aud_gpio_tdm_on_pins>;
 	};
+
+	usb-a-connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&pp5000_a>;
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
 };
 
 &afe {
@@ -1702,11 +1728,53 @@ &uart0 {
 };
 
 &xhci {
-	status = "okay";
-
 	wakeup-source;
 	vusb33-supply = <&pp3300_g>;
-	vbus-supply = <&pp5000_a>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	usb3_hub: usb-hub@1 {
+		compatible = "usb5e3,620";
+		reg = <1>;
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
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
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
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
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.1099.g489fc7bff1-goog


