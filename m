Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6928EC98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrjq9fQeRRT3Dkn6ja90PvKLpuXI2Gg2RkQogJKUx6w=; b=WrI5yXCOEbpfof0n7lV73hdl3f
	TeJsny4ZdjLfp1fat81sA/ddELTBuUNCg8nQbZKfQsh5aGkpEo6EBUznDlvdjNUU0HPI5MukawBjf
	Djhez9YBCk2eqAIwkiVf0BAxSk4/XmVZIT0knYhnc0ZWhxQOB/p1fY8vaqmGUVirCfilW70kh8Fmi
	9SeygwCYUdanURV58GHrjDPSDA6d1+e8VDC9NKRET+hV/e3SFALBVdUXOWIui1g7LGR8Tr06oBmLC
	ZBQxSUxxRAO3VAsLg1n6G2OMbwxqUhuK+BY+o0fxohplVWkXmNCfObj+KRhYpS1/lWDxIdlk70zcE
	pv4UNRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dfd-0000000AFWq-0kL2;
	Thu, 24 Sep 2026 07:15:05 +0000
Received: from mail-ed2-x1e.google.com ([2a00:1450:4864:33::1e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dfV-0000000AFRX-1l25
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 07:14:58 +0000
Received: by mail-ed2-x1e.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so2479022a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 00:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234095; x=1790838895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrjq9fQeRRT3Dkn6ja90PvKLpuXI2Gg2RkQogJKUx6w=;
        b=QXXktA3d0OjjEpmJeO2C0+6dy5jexIGsLeF6E4LAsRL8dnZ5KV3cJpzMpzfCJoiEsH
         TUmMWXnWlg5I1dq+E2WREA9Hd/ZJ8kqruqU3VZjfh9CHkVqXmS28Aoob/g2QuwzmlQKN
         Zy1VdIPuFZ/+drVgL3tEqZofWG+8/LLK7BZJnJruS4z72ATm/7qvWJpgpmhhTKgOdbPy
         6M8Z0ZCs/CDvycXXGa6Td1ZClp0BJHK6zuIdMYDt5GeJfydkPXiEX7HvAP9WfL4R9BE0
         1svypFhjQy/DgZRYptMmDThj7sXSYI84F1FeHIZXF8JGRtVMuMv4jX14cWGqLonk+sYo
         i5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234095; x=1790838895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrjq9fQeRRT3Dkn6ja90PvKLpuXI2Gg2RkQogJKUx6w=;
        b=p/gkb0A2YLmhQ0XNMZ8S9r7lg/GgUn0vYTFXpSQWNGYRdNk3ZTTsBMAjYp3yusSk1I
         FHeJLhfUTsTs2CGGQ0Jv6hr3y3tChdkgyC2QzOkgz5jgEHfWqexFs1F6N3McM1pd1X6R
         Ew/v0q7h1TggALUXN65EO+nED9ZZ85efCtL1qOtkjgqM9i2Rlrux6L7kcudJw59pv/+c
         Zco18gDnKAg55ePT1m5pdtx4/2U3iIEQE1muaTA6qEXvvCgMXSWwx+to5qlUc/QoqPzi
         pmLCDzGqHL33wXpK5qX9duSYoiBJobUeFiKB1KJ5ZoX/BAz75cUlshoOq1uLja70FnbW
         XsnA==
X-Forwarded-Encrypted: i=1; AKwUvBz4vefuHeDPh9ivnTdxNXr3tjnCLuBOig79On8Lp7JlpxrGTeMP5Nri0p7J6Q9ci5QKdXgXhD0+kqUmTxFoV4EC@lists.infradead.org
X-Gm-Message-State: AFuF++nv+nFObMkhIl2SMO35If9hr40QAPmGmvJeGmjGozZhVKggiSUk
	+RDMVyGGqANXn4+hWALPZTtQANn3VvuCjqBfQ0gVOIDzKBj3XN64Hw2uD5EC/dYIfRg=
X-Gm-Gg: AYBFou3LPxDg2u8Luk9HMDHamqDjHrinzCLRNCANVGcuOIybdVC0uuuiQDNpctldNz2
	xYdhhfBLrabyZieJfnvzyfh1feXmE/WoyggFBkZn3VNYMy3PFMz6x+vz54QV7okYRXOTDOO/BR8
	aDpkE+IQ4yBrYLGdkIm1CE6FpsNxrhZMXEgKZCtHbDoMI5M6xgcCEt5xYuI5lLqsf6J9u1oy44r
	p404lzg9JOXlx5U1pXNrz+VJM+di0Tj9acWY1LGdgug8X/NwSy/jdxX0IM1RRGj98ft11dmU72D
	XHjbHmB4CGHqTCTPOyNAj7mQPmGpBO02IBXUgJvpt38QtXuYkND35U4mEjZ9AtLCRQzlJlNteun
	EOLaGBHlbB1zKBMP/mXK/zCwdX04+XNraOYjzZ7d5HLZIC+CPLSZrwEtJIjC7H/MI+sMfUuUOk5
	nu2UrIn2tzZWaWyoKpCZHtWX+iaCgxpN31xM9FWczMLxUPXrlsFQcpcM/tfVDzMAaPZDvdksbee
	ZaqoXZ/sBQdj1fvcQEtv6JHs27s9GJJbH8b8/xEKjRUbzc=
X-Received: by 2002:a05:6402:1599:b0:6aa:936f:5d2c with SMTP id 4fb4d7f45d1cf-6aacc83e324mr889306a12.23.1790234095400;
        Thu, 24 Sep 2026 00:14:55 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:54 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:45 +0200
Message-ID: <20260924071445.441822-4-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924071445.441822-1-adam@wermuth.pl>
References: <20260924071445.441822-1-adam@wermuth.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_001457_474276_CBDB83FD 
X-CRM114-Status: GOOD (  12.42  )
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

The ROCK 3B has a 2-pin fan header powered from vcc5v0_sys and
switched by a MOSFET driven from PWM8 (pwm8m0 pins). Enable the PWM
controller, describe the fan as a pwm-fan cooling device and add
active trip points to the CPU thermal zone:

 - 50 C: fan at 25%
 - 60 C: fan at 50-75%
 - 70 C: fan at 100%

each with 5 C hysteresis. The existing passive and critical trip
points are left unchanged.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 908bb4425e81..815f67988ab7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -24,6 +24,14 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	fan: fan {
+		compatible = "pwm-fan";
+		cooling-levels = <0 64 128 192 255>;
+		fan-supply = <&vcc5v0_sys>;
+		pwms = <&pwm8 0 10000 0>;
+		#cooling-cells = <2>;
+	};
+
 	hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -200,6 +208,45 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_fan0: cpu-fan0 {
+			hysteresis = <5000>;
+			temperature = <50000>;
+			type = "active";
+		};
+
+		cpu_fan1: cpu-fan1 {
+			hysteresis = <5000>;
+			temperature = <60000>;
+			type = "active";
+		};
+
+		cpu_fan2: cpu-fan2 {
+			hysteresis = <5000>;
+			temperature = <70000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map1 {
+			trip = <&cpu_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map2 {
+			trip = <&cpu_fan1>;
+			cooling-device = <&fan 2 3>;
+		};
+
+		map3 {
+			trip = <&cpu_fan2>;
+			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
@@ -708,6 +755,10 @@ &pmu_io_domains {
 	status = "okay";
 };
 
+&pwm8 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8>;
 	status = "okay";
-- 
2.43.0


