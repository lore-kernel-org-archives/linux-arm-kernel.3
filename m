Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A3CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 17:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=; b=Vopg1h/kxLH0N6AgqDZqRGz8Jn
	JXRW41oN7+yyVp1p+hvqrWHHQ0Bd9CUr00PCEvloWJDgHBv1KRZ3dwk4HoZW823AVM2dYQrgYvDlZ
	rqSm3B2pV8CxyF/NCHSKUvYC+J2zITNq9ukro9ytSK/PUAtre61lHSHdqha60S/yAljAwsWPM8hsS
	9xiQhnIu4VHIwwPuG8qQ4hG2oO6tu1UdzZrI7p5znQIxMiOR8YCUrKyvVJiYvNBiCh9NGyKUVQWTq
	yEPSkJK/1C/zo4n/S1Q0xfjVxq4LyHOUnxNDvOVPZ+IfM2WLfCEi8eTvGsVHCuE8T3wuEgUvBMAWl
	KS+e3fDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhHL-00000007aEK-0tpG;
	Fri, 03 Jul 2026 17:02:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhHH-00000007aAE-0QgG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 17:02:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493c7902f47so4957285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783098129; x=1783702929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=T0+2q+fl49YidISh+wlAvxc0xX1QRr9diJoxhJzETieHEXwcGzuzhhQzlwBOwXe9iM
         jqCm+AnKuCecOBcn7icVexbBl8oH4lpfVdEZqf6th000SvIH4Ga2uPBahwJypVDkacXW
         Krkzsau6DwqZXWGSeH7yXoBtvZng+DGzIkm1l7DURa+RBtE1PmxAzy+58TvFXqSDgE4G
         UPUJ7OZzJPn1vrjRctKW56ybdWvklp+lmENe7gvn4ufjJtxPhN1lGJjncDuPPW8TDEXH
         mnQE2NdoCSJU3ab7/vVhuBYUVdcIWilbWR9vaaC0Aacdd3jtHOSUmn9Yo/tyuQB6JQzr
         3D4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098129; x=1783702929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=OrcMeCLF9ksxmsrWH30KPJmnmDnxRMo/MkT4g8rF3duNIO5hQpdA/ByDPKgHMxInBH
         +8mQm86BviGYX/eqFc96qyXhUHZhBtWho0FQpLxKgzPikzhmcPCDbG0pT7xW73KpX5Ve
         gLtuxFlbXTlq6vUqEDSDXWsVXjx4KR6hVDNzmBo6BWwqmBQFwQb/hZah3zmE6Pf/NwSq
         GGqP/xYjIHjow9Nz27lGOuXCnHouKskXRDkzwe/qt54RYejd3rRo00LXRYB8iF8dhgYj
         S2WdJp4T1cO1n1oxk5t46LJfoe+CjfqteAZzvyoozBwo2sXC6NFYihtgTpwBXL1lTZgM
         ctig==
X-Forwarded-Encrypted: i=1; AFNElJ/5OdGd6HG4uMXrnrZmbWpAGQygLcM2/vs2BjzlnMTbiDCXbrzre8QFLLMB9jpz1dKqQUHAJMFVxZJbawQuzctF@lists.infradead.org
X-Gm-Message-State: AOJu0YwdPdYjLYjrFRbh/B75c3QpJadUvaKy6c+gfci0NTy1LU7xCuF1
	pIkEuSxFWmiKQWnOpRZgXVl/7tkdReedEDLdM5uSyDnvmdPNJH9O/sfFr3u431Fpf8g=
X-Gm-Gg: AfdE7cmgTn0lDNWjajv3zVR/cfAcyzltay13Lzz1vFb+q2btb6nOwDMWlXZPjIE2JA3
	NA/dUOA7L2iK+vjAG7A1YUaHu5m/2sezbGDCKhbK7+VQdoKD6EFcNzmt8zuoV/XYSB3rKXDaIqL
	kV0ejcb8DcB18x12JpM++R7bzkk658ojprI2FkxDCNMMnERvEdXK3HdsVhvJ8b2aFxTxCCfP615
	m8JhLA82Yzu2N1YV8OrceaCMlxrwOjDHp1qhNlwKGmNeLfnCVb6T1EJyBi+GGnsErWVIhkJKiA4
	N+JEL19NwiKkdtGEjKfwhPtVFFtwmcbi+vcuPPW6Kj3rp5Mq1dlQg7akAzmb3/h09qHZjAa7vCH
	eH6/W+FVWf9TEuvjFDk87zO+z0QYHfFDrY+cElP2ZxoEa1wxxxZAr7v4SZ9arDkZRxMIpEHgZC0
	u+MhMmpJdUyvY=
X-Received: by 2002:a05:600c:358b:b0:492:3da4:81ef with SMTP id 5b1f17b1804b1-493d11f13d7mr1621605e9.18.1783098129262;
        Fri, 03 Jul 2026 10:02:09 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm225754325e9.13.2026.07.03.10.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:02:08 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v6 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Fri,  3 Jul 2026 19:05:26 +0200
Message-ID: <300b6fb4ba2c9399297b4bd85cbb3bc14f08f6b7.1783097764.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1783097764.git.andrea.porta@suse.com>
References: <cover.1783097764.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_100211_190728_BA5D6BE4 
X-CRM114-Status: GOOD (  11.81  )
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

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..748be8f1ee9e2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,6 +64,12 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
@@ -94,6 +100,12 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_pwm1 {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 16f5359395835..df4c2d09c8d34 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -99,7 +99,16 @@ rp1_i2c6: i2c@40088000 {
 		clocks = <&rp1_clocks RP1_CLK_SYS>;
 		i2c-scl-rising-time-ns = <65>;
 		i2c-scl-falling-time-ns = <100>;
+		status = "disabled";
+	};
 
+	rp1_pwm1: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
 		status = "disabled";
 	};
 
-- 
2.35.3


