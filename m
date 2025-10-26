Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DF7CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dGAlA6xEEpg5Sg3NpocSMWJ7GFQOTpi3dlaTTRDDDLM=; b=tXyVjlrZtzGn/b0QFg3H6EPKoJ
	iZ1uNyrOB4zq0cZYNpBdE2DFopbUrHgMtmIVe7io90cEhpKoNzTuz6/ah+wFPcGW1kPjSA817CoCv
	PFKqQYIvMeNEuUDAI+vOt7bsr3FQWUNgIsAfiKyUanDonCfbhA920xcLGp4eBiaMApFiW6phnMBdt
	i3W/+l3qqTATypvmpAjZUJmLCSUecLVHctCdleHI4iw5JgC7wBFoVaVLH5TuT+HTL5ZIwiYCgCdTu
	CpRNlkU59zcN9hYkFDOm2GKAmnj1rpOkkw/sncrxd3JhO+8AkbEBkzLyu6So7KAFbG1zDJb8p/Ovv
	nkOFRCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6jl-0000000CgK4-3njF;
	Sun, 26 Oct 2025 19:49:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6jh-0000000CgJD-4AqC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 19:49:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-475de184058so4167085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 12:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761508144; x=1762112944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGAlA6xEEpg5Sg3NpocSMWJ7GFQOTpi3dlaTTRDDDLM=;
        b=QwNGaCeRn3+r7WM996ZO7ZdBC+4EoPKzdmlwdedhM6QUiezlcV/1+1b5qs/XsjE0Gu
         fmkWDdQpUXSnufLWF/v4ytz7VuTFW9bZmWnIII+c0JageqUfxVrMcIRpWP9joqTm6ZY8
         UkrRt4UgUyKDjxz9u6IXfLy/mH3W4rx8wKAkOiQwiTWQHmVcsXQfmoMVCfDnGYVWLQHd
         hs65E9a1Lw/eYSIqGqyL57bdYt1AjAYO7lQwctYjVQq4Br04Xu/WtNUS4I4s6d//E9/u
         YDK2PWiH6bTUUzooDfQLSer9Jr9dnniDPtHJfqz8Aoxdl2HbmAMKtw/gfbpajbb4PiMA
         Z9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761508144; x=1762112944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGAlA6xEEpg5Sg3NpocSMWJ7GFQOTpi3dlaTTRDDDLM=;
        b=lXSfB7d4DOu7FuBftFOjrtMBVCO08CyS5HfbrvWRzOIzzt1N9jmnWqjFVJFED2HNYY
         C/awbjombPnncRp3d4k15pk4qqXytY6F6pY73p72sV2QhSUnQK81cw2d9alcEWsj72/Z
         rwatdO/S0lsZwtSTgjrXonHChlZlqQSCCaqsOVgC/fR86eBJTN8pT6BUqHgweW8IIXFP
         iKMSwS41tbRJIhVdrhbl2TJqdpEU/gdd9N5O/AdZL1qoesQVzQsb508GZNa1Ooyulk4m
         wFnRBaNu87nvqdhBG8oQY2oYEMYtgvE0qH9yrlcKXrKaw/C+d7fRbFLgwKNzlWFZBjv/
         QdpA==
X-Forwarded-Encrypted: i=1; AJvYcCVnhINqTynpDMMIwUQ2tZtHtE6dkJa0AmiiZUuchFEAelut2mpGUn6R/S43xF6Im5T0qYTxA/uEafvBIT72Mr3e@lists.infradead.org
X-Gm-Message-State: AOJu0YwOh9GAcGH49Pz/OGkPZO547E7IQNOxy7tKLf9laDNw9Wy8ixDc
	JjEtqrDU2uWGUVjjtfSUENgl2uenDb+BGjqCjwU/0Pkb++xb/sZfVF8v
X-Gm-Gg: ASbGnctf635iJ14PDkg9QiCPcKSO9b1rZsk3SWq6L8wYBehcvjbkHIPyzmC7xDIv+n7
	DbvN5Ski6sVJQNBA2lJdnNTEpd7n3Q+3Mq/7utL8ewUknzKlJp0eH/opOgNzQgvvbDtI9OGeikF
	PaDGNiXW7+XcyHYmH7pHRPdEqDJ9v3Gv6KylbBGXuwK5SEDYG4DBqSaO3PcUMcnxzYAvwtx6Uc4
	QRjUVVUf+aRfEAezPOplvrPOT7ZPy7Y5+UykIT3HcnFuNf6hCwlmXA22xNKsjPiJhDBB8LfaoON
	fs+B+g5nuNadTTEcekxjJ1O5kQBWyeJl/A0SIq7+UoPlGXxUlO6XXE4Ir2RrJtewQGhui1GLYTv
	qedMXNKi39cZ94BWt3QWXHr3wd+5lfBODIptp8joPva8mUKlJQv5vSXo2f4+YzebXR6g0Ch+YkQ
	o8AePvClJ9HIgNcw==
X-Google-Smtp-Source: AGHT+IHxjRQnRW5DZRFV2Qwhcw+akufX9vynEkSIauiFSd7fK9owVylMsihE4r48/PVg7PHb0yVz6Q==
X-Received: by 2002:a05:600c:468d:b0:471:95a:60b1 with SMTP id 5b1f17b1804b1-475d2ed6e11mr100007385e9.32.1761508143555;
        Sun, 26 Oct 2025 12:49:03 -0700 (PDT)
Received: from orange.info ([2a02:8010:6606:0:8fa:2ba2:6886:7fe4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd05098dsm45244265e9.5.2025.10.26.12.49.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Oct 2025 12:49:02 -0700 (PDT)
From: Hugh Cole-Baker <sigmaris@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: pwm-fan overlay for NanoPC-T6
Date: Sun, 26 Oct 2025 19:48:40 +0000
Message-ID: <20251026194858.92461-1-sigmaris@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_124906_077001_8C37CCA1 
X-CRM114-Status: GOOD (  13.90  )
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

FriendlyELEC offers an optional heatsink and fan addon for the NanoPC-T6
and T6 LTS. Add an overlay which can be applied if the fan is fitted and
configures the fan as an active cooling device for the SoC package.

Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
---
FriendlyELEC heatsink with fan addon:
https://www.friendlyelec.com/index.php?route=product/product&product_id=305
Vendor DT with trip points and PWM duty cycle values:
https://github.com/friendlyarm/kernel-rockchip/blob/4944602540b62f5aad139fe602a76cf7c3176128/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev01.dts#L75-L90

 arch/arm64/boot/dts/rockchip/Makefile         |  9 +++
 .../dts/rockchip/rk3588-nanopc-t6-fan.dtso    | 78 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-fan.dtso

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4cd8ef607f55c..7a67b68a6bb03 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -178,6 +178,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-mnt-reform2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-fan.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-max.dtb
@@ -271,6 +272,14 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtb
 rk3588-jaguar-pre-ict-tester-dtbs := rk3588-jaguar.dtb \
 	rk3588-jaguar-pre-ict-tester.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-with-fan.dtb
+rk3588-nanopc-t6-with-fan-dtbs := rk3588-nanopc-t6.dtb \
+	rk3588-nanopc-t6-fan.dtbo
+
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts-with-fan.dtb
+rk3588-nanopc-t6-lts-with-fan-dtbs := rk3588-nanopc-t6-lts.dtb \
+	rk3588-nanopc-t6-fan.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
 rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
 	rk3588-rock-5b-pcie-ep.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-fan.dtso b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-fan.dtso
new file mode 100644
index 0000000000000..08c4782fb4148
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-fan.dtso
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/thermal/thermal.h>
+
+&{/} {
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <0 35 64 100 150 255>;
+		fan-supply = <&vcc5v0_sys>;
+		pwms = <&pwm1 0 50000 0>;
+		#cooling-cells = <2>;
+	};
+};
+
+&package_thermal {
+	polling-delay = <1000>;
+
+	trips {
+		package_fan0: package-fan0 {
+			temperature = <50000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			temperature = <55000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan2: package-fan2 {
+			temperature = <60000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan3: package-fan3 {
+			temperature = <65000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan4: package-fan4 {
+			temperature = <70000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&package_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_fan1>;
+			cooling-device = <&fan 2 3>;
+		};
+
+		map2 {
+			trip = <&package_fan2>;
+			cooling-device = <&fan 3 4>;
+		};
+
+		map3 {
+			trip = <&package_fan3>;
+			cooling-device = <&fan 4 5>;
+		};
+
+		map4 {
+			trip = <&package_fan4>;
+			cooling-device = <&fan 5 THERMAL_NO_LIMIT>;
+		};
+	};
+};
-- 
2.50.1 (Apple Git-155)


