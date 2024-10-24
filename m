Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9ECCFA456
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnCDGJfcN3PLmfYBMIFGhUBG768VdNHJJP6i96p6xYA=; b=35Pv6JlKbvJUSdcB0CUHqT7qjk
	RZY7aslZE0Qzgln+mS/ompcjLddPiguhgyzpP3Lb/4pc9V4UD+BNYSVMTlIEV8kSqtfbzf1Cwmfuj
	ph26FtXbUMLrYZakKAhcidmgbj7aMEkhoRXJOIjG562R9cGoa/VDO2oE/YVIY3jzeFnSTmw1FCwOd
	YjlAVQLJLHK7jAaL9zIurVPGioiCqYLzYMytImIByBiUWNZ2Lml3mIMp60SEX1AelllB4iTzo1II1
	9Za/y2vGifq7OBCXEqwpPXGx9bpL2I7OMCjjNrBqWUUeLPmXQk1w+AymNDP479xDUZfYh6gSPsOEB
	QREiRTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ugm-0000000Hb6Q-0psV;
	Thu, 24 Oct 2024 10:03:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uWE-0000000HYcx-3EyF;
	Thu, 24 Oct 2024 09:52:40 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so457206f8f.3;
        Thu, 24 Oct 2024 02:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1729763557; x=1730368357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnCDGJfcN3PLmfYBMIFGhUBG768VdNHJJP6i96p6xYA=;
        b=Czxv3cXcIQR561Iqh0W8VqU3DUexIq8jL36ZE/MMF43AFjnDSG0uVOkK26KFTiytUv
         8NF+ifLDPSBDVKxTlzqZv5LSUujW7P5md/2jyIGOcdo0NTK9a7Aix6F0tTU3aucLLgmq
         t4Eo/usZ54b0X6gyqUytsji5FiectMpPFbuOfX+WWxz31tkx8fEiaF0wCax07iwala/f
         LYYlqZvylZ9lQKz/XVQjK42DTMl9GNZhe765BNS1vLnRdnXNCGTQQcj9a/Waow8AYLSP
         hmKuT0qKpIFUcbGTxB7PM7jUR8YZmOxUMbKVqTXFTFLc0PCRxJY/xIO8LdFJC+p2ujhm
         03Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729763557; x=1730368357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnCDGJfcN3PLmfYBMIFGhUBG768VdNHJJP6i96p6xYA=;
        b=W3DjgmD6HCGzcLp/10lybfU/WvZhZIMcQjqEzLxvYjw/x7ILw5+arZwTUOFW6ERNTY
         ckMis+Nk6/6ioLWPLl6ZiRuUnCkLMb30FkkujDTFyTNDZpozrPviF2d3YKD22JqXTBon
         OfEFeVVYpQ/F2q0pSFQmh0hNcOATZJYYr7nn59VODl0E0JG+LbqO0aU2kKJII1U0BPZF
         C+35v409AQj4Dto0SEn0r3G8EBclPkGJ7iltuROFQOmd1SEsUT6/dymZGbnrkB2ZRrfp
         LUzrF4s2eAp03HpRM76JG74s02UQuDV87qKIAkXPYmS/wXH9dknL4CpWVmLbRdhyuGmj
         acmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9h6Rat9QedvO80mCY0Jvx4NHvNw8niKSE0dzZuia4g0ZqBH5mZ/HN6B9xQ8N3Rm6QCb58v11wd8apv5og7Pa8@lists.infradead.org, AJvYcCXzdEfs5+0G1dnMdkOrYtR8i2WY5QXOtCUq0A3gSyGV9sxgpsLtw4E1BPVz3pSXd/8xOdEfgKDOxpBeNVzL97w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGyXi8JXYg0nRUATvGISvqU6VCMeMEdivrarqvZYLDe5BdI0mM
	LEOmsSnaGa3TdYYew1tzMKytM9IF7dreoY3j9Lr76S77qi+xr2Q2
X-Google-Smtp-Source: AGHT+IHOGIh30cZeVBaManyxCwsLnI9f8EReanEFaNeNhbdtE6TT2V9YrSK8ERkjOnhQ6SSbt3KcFg==
X-Received: by 2002:adf:fbca:0:b0:37d:377d:c7b0 with SMTP id ffacd0b85a97d-37efcf0699bmr3536455f8f.18.1729763556938;
        Thu, 24 Oct 2024 02:52:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:1587:1e60:e265:6c8b:f62b:1474])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37ac4sm10996286f8f.6.2024.10.24.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:52:36 -0700 (PDT)
From: Cenk Uluisik <cenk.uluisik@googlemail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] arm64: dts: rockchip: Add rk3588-orangepi-5b device tree
Date: Thu, 24 Oct 2024 09:50:22 +0000
Message-ID: <20241024095038.42079-3-cenk.uluisik@googlemail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241024095038.42079-1-cenk.uluisik@googlemail.com>
References: <20241024095038.42079-1-cenk.uluisik@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_025238_838414_5E3B37E3 
X-CRM114-Status: GOOD (  15.45  )
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

Implements a slightly modified rk3588s-orangepi-5b.dts from the vendor.
Unfortunately the &wireless_bluetooth and &wireless_wlan are not
implemented yet.

Therefore add the sdhci alias to be mmc0 on the rk3588s-orangepi-5b.dts.

How is the Orange Pi 5B unique?
  - the Orange Pi 5b uses combphy0_ps for the WiFi.
  - the Orange Pi 5B has GPIO0_C5 hooked to BT_WAKE_HOST.
  - builtin eMMC storage
  - ap6275p Wifi module (like the Orange Pi 5 Plus)
  - builtin BlueTooth module

Signed-off-by: Cenk Uluisik <cenk.uluisik@googlemail.com>
---
Changes in v7:
- Set sdmmc to mmc1 (because this is now reverted in common .dtsi to be
	mmc0, to avoid breaking changes)

 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 11 +++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts | 19 +++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e641033d2..2e485553c 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -160,3 +160,4 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index 5ef0ccfcf..0573b8f2d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -400,6 +400,17 @@ &saradc {
 	status = "okay";
 };
 
+&sdhci {
+	bus-width = <8>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	max-frequency = <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	status = "disabled";
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-sd-highspeed;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
new file mode 100644
index 000000000..d21ec320d
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-orangepi-5.dtsi"
+
+/ {
+	model = "Xunlong Orange Pi 5B";
+	compatible = "xunlong,orangepi-5b", "rockchip,rk3588s";
+
+	aliases {
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+	};
+};
+
+&sdhci {
+	status = "okay";
+};
-- 
2.46.1


