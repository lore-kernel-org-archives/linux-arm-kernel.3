Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC00BC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 23:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/8tm57BNT3aTGO875q1dXTe4xQHMiaxLYJYyXeBXMI=; b=y3OZAkfG/NIEW+Wq5C0M3YUEDQ
	woQbBx0hBqKvNRYJpPL7jVHLAdpv3dkWP4+0soDyvlObjyhgRVRQrh8gRmYnGxU+8/uqB6+YMnsmj
	1nKMx/kKnOrWTi1sv1Ef/1oHmf+LTGQDbnkB4dqG717ATEUItgtOe726t2rxAo/jKPELXQC3IWqaR
	8tGhEMzG+2tjZFKr9PC2rGcOLrUvPVZhmE4b1JqWnlyKDyuaeI2DF82Dr9VpUMoYPirM2RbABnP2M
	qNeal19o/WfWjLEHO7BgfZ0afEpvghxiLocYB04HfrpkvN4WJgySxcxvWEhWyRLvyUWK+Fk5u/bTQ
	heLnSPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9t1Z-0000000COBx-0dU9;
	Thu, 24 Sep 2026 23:38:45 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9t1S-0000000COAO-2EAu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 23:38:40 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so150746a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 16:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293118; x=1790897918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/8tm57BNT3aTGO875q1dXTe4xQHMiaxLYJYyXeBXMI=;
        b=rrRCg7+L0rpPhyaQk39URdHPbS7qJwIKLR5GY9XgEGYeJgibHhDFugykPKp4StvXBH
         ja7qtWEqF1h9Df8ICxa3qvV69BW5SsiRgWn707vXNV/b5sF/mPrBNK3F8qyT7OPU6dfb
         yjBQ/2zefdwG6+p94fqdCYsln2a0nq1JR2Ad6quTNT55cqvBc1+PIQ9Sy5QFwgDRS/oV
         6vE3vhjfvjdcZPab4SaWCUG0IiDcyyRuejNrvwWy5WJH4zaY82a7o2JCy8Fi1ehRyFKS
         eWH1iDB8ayujwG7utkB/jCeOh8VMCtsDK6SaNki6xRSy6SbOGo9Bm/IVnv/Xnsbu09Pq
         tBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293118; x=1790897918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/8tm57BNT3aTGO875q1dXTe4xQHMiaxLYJYyXeBXMI=;
        b=AnbLNcFnRhV7ZiiQemXQVnHKaSA5z2ML9Hw2Zvvlb2J4anllZd78r11pfZHaAKJGlt
         U6OgmH5qojnUiHrqKEdJLBta59QO9u8T8kHDVuSc/dWz1kg+W+Bxhy/od47Is16HrH3d
         3dsn3SnvU0Yp5jJox577RrhhxKYhvqGPkNImVjeDefCX4+EPCH++74xHxMYvuN63VqIl
         rd+rTDX+v52SmkMK+bUeByhqYf9cJs2e56pV4DyfxciWkNkxxlopcfX8OzJlVJdn78UO
         6idD7bnTSNLkTTzAN8qB9GBd4Ff4AN6mgA5jXmoc/w4I6xX3g/i7qLogWJfJyEiFsutP
         +Afg==
X-Forwarded-Encrypted: i=1; AKwUvBxMrM02YmtGcn+pQgb+FDQcCesRbIjQ251Ph6k+VHGJn5bwlg1FWXokmbyJfCOQKhxWignjsh28q606tkXSdC6h@lists.infradead.org
X-Gm-Message-State: AFuF++kMXoKGG2Zv29UWcCcK/OrXafJw9qlK24Ki1eOF7v6Uef0e5n93
	pevAyVua6cJrx+fQn9OXhxaTzdugITd5CKoFGDFPjF+kcI0hnB/2DOy7
X-Gm-Gg: AYBFou2rk5/CBDA0QvTXtp12yb+yuK6HoA2jeMxCfnY1cyr8JXwNjlacN+2q1L67Uik
	A3Rk2jGda4KA6FYtme3k9A1K4+pfJckT9DG/rRPq9MCXYkr/XZvxlauJwhja+Rt+0Qeg2ah/I77
	jWp+UZ0wwJG5ZeSsCnesHl3yAGq22oG5RwAd4Eivrh/ozotLYmL7T2OaZbKOkaLR8PgUPicKg3P
	okvT9q+LJGI7JnRxJrPOgWgKnjf5aC8feLLS+GllT9AlXsurtxQlsQ/s6t3SOVDHF65ndHOL4qm
	ZungSj2IkzhwsdkGs3j6lg6dOa8jGf6MCHW72dkOI3H/s8hCoKMc6CeRPIdHpvEbReNWgvhoOh1
	xBejkuKqXxbNXfR/x27mLsegl2TvdUJCpI1bGWE2ta4gQYkxnBeujrEJtbLHOvoAdoi6kaL5qpo
	UKtq7CiwcWZtOr/MDj7pI01Lef5smUbRTCCIo4yOiOgwtB3dSvFJUqZgBm2SRyyBEYq31RDw9GP
	Olh3rUsyGWqCqQhOb1czbhBFdht58ljbT+4doGRtpEszBtzK9wK10YVMlP7Bi3uWq65dkJoLW4x
	Ukn0zzD+pzhf7KfSR3+K6Kr3u52jMz/3wqGdRBS860qN5oNkFurs8lMlTlk=
X-Received: by 2002:a17:90b:258f:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3a0982a7f75mr2180909a91.0.1790293117765;
        Thu, 24 Sep 2026 16:38:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b7d11124sm1307931a91.10.2026.09.24.16.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:38:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 2/2] ARM: dts: broadcom: model USB VBUS power with regulator-fixed
Date: Thu, 24 Sep 2026 16:38:31 -0700
Message-ID: <20260924233831.127617-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924233831.127617-1-rosenp@gmail.com>
References: <20260924233831.127617-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_163838_607380_2759E532 
X-CRM114-Status: GOOD (  11.77  )
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

Replace the undocumented "vcc-gpio" property on the usb2/usb3
controller nodes with the standard vbus-supply/regulator-fixed model.
Boards now declare a regulator bound to the chipcommon GPIO that
bcma-hcd used to poke directly, one per power rail.

Polarity is preserved: rails that used a GPIO_ACTIVE_HIGH are marked
enable-active-high, while the Buffalo usb3 rails keep GPIO_ACTIVE_LOW
and rely on the binding's active-low default. regulator-boot-on mirrors
the rail being left enabled by CFE so the power line is never toggled
during probe.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 +++++++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 23 ++++++++++++++++--
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 23 ++++++++++++++++--
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 12 +++++++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 12 +++++++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 12 +++++++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 12 +++++++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 12 +++++++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 12 +++++++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 12 +++++++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 13 ++++++++--
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 24 +++++++++++++++++--
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 14 +++++++++--
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 14 +++++++++--
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 24 +++++++++++++++++--
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 12 +++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 12 +++++++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 12 +++++++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 24 +++++++++++++++++--
 .../broadcom/bcm47094-linksys-panamera.dts    | 24 +++++++++++++++++--
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 12 +++++++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 12 +++++++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 12 +++++++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 12 +++++++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 12 +++++++++-
 25 files changed, 341 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
index f5c95c9a712e..80414c72f912 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
@@ -101,6 +101,16 @@ led-usb {
 			trigger-sources = <&xhci_port1 &ehci_port1 &ohci_port1>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &srab {
@@ -130,7 +140,7 @@ port@4 {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
index 9f9084269ef5..2823592ebe76 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
@@ -136,14 +136,33 @@ button-eject {
 			gpios = <&chipcommon 15 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+	vbus-supply = <&usb3_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
index 95ef6ca7210b..32088b52cacb 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
@@ -132,14 +132,33 @@ button-eject {
 			gpios = <&chipcommon 15 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+	vbus-supply = <&usb3_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 03d5546a147c..4c94dac7c832 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -41,6 +41,16 @@ button-restart {
 			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3_phy {
@@ -48,5 +58,5 @@ &usb3_phy {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index ad246f9a734a..1d96f8a97149 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -38,6 +38,16 @@ button-restart {
 			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3_phy {
@@ -45,5 +55,5 @@ &usb3_phy {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 2bdbc7d18b0e..7e9619432254 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -81,10 +81,20 @@ button-restart {
 			gpios = <&chipcommon 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 55f0d9e90d5f..6458b0bbda35 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -77,6 +77,16 @@ button-restart {
 			gpios = <&chipcommon 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &spi_nor {
@@ -88,5 +98,5 @@ &usb3_phy {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index 73ff1694a4a0..360237a6f80a 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -104,10 +104,20 @@ button-restart {
 			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
index b6a5886698b2..baac898761b6 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
@@ -89,6 +89,16 @@ button-restart {
 			gpios = <&chipcommon 7 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &spi_nor {
@@ -109,5 +119,5 @@ partition-file-system {
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
index 3da2daee0c84..6a2516effc07 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
@@ -73,6 +73,16 @@ led-wps {
 			gpios = <&chipcommon 14 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &gmac0 {
@@ -142,7 +152,7 @@ port@4 {
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
index b7cd2faa30ce..be6e164d1a51 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
@@ -116,11 +116,20 @@ button-eject {
 			gpios = <&chipcommon 20 GPIO_ACTIVE_LOW>;
 		};
 	};
-};
 
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
 
 &usb2 {
-	vcc-gpio = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 37593e7582ba..e0a7e9510a08 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -91,6 +91,26 @@ led-3 {
 			linux,default-trigger = "default-on";
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &pcie_bridge0 {
@@ -155,11 +175,11 @@ &usb3_phy {
 };
 
 &usb2 {
-	vcc-gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb3_power>;
 };
 
 &gmac2 {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 24ba8f8f9bf3..c46c1407be8c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -91,14 +91,24 @@ button-restart {
 			gpios = <&chipcommon 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index a4b135d37659..56d35d61a8be 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -184,14 +184,24 @@ wifi@0,0 {
 			};
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
index 5a8b2b1567e6..3c9c7ce5dfd5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
@@ -90,14 +90,34 @@ button-restart {
 			gpios = <&chipcommon 3 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 12 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb3_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
index 2d2e7e581291..6012cebb2512 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
@@ -98,6 +98,16 @@ led-wps {
 			gpios = <&chipcommon 19 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &nandcs {
@@ -167,7 +177,7 @@ port@8 {
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
index 8bf623c67de0..2e4b2f40d525 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
@@ -79,6 +79,16 @@ led-wps {
 			gpios = <&chipcommon 19 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &gmac0 {
@@ -151,7 +161,7 @@ port@4 {
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index c5099defe9f9..8cf704b3d462 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -115,10 +115,20 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
index 944d592dee2c..bf7291d98bd4 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
@@ -117,6 +117,26 @@ et0macaddr: et0macaddr {
 			#nvmem-cell-cells = <1>;
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &gmac2 {
@@ -158,11 +178,11 @@ firmware@0 {
 };
 
 &usb2 {
-	vcc-gpios = <&chipcommon 21 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb3_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index bdbd0f097925..4f965370f024 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -195,14 +195,34 @@ fixed-link {
 			};
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb3_power>;
 };
 
 &srab {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
index e374062eb5b7..c6a1d02f7fbb 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -59,10 +59,20 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index cf95af9db1e6..cf5bd700976b 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -59,10 +59,20 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index 4d0ba315a204..74c6fe007210 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -99,10 +99,20 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..8ea19bd2ae35 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -74,6 +74,16 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &gmac0 {
@@ -98,7 +108,7 @@ wifi@0,0 {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts b/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts
index 0b8727ae6f16..9106a5907957 100644
--- a/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts
@@ -69,6 +69,16 @@ spi {
 
 		/* External BCM6802 MoCA chip is connected */
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &pcie0 {
@@ -92,5 +102,5 @@ wifi@0,1,0 {
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
-- 
2.55.0


