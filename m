Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252C7C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 18:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRDYJHHyH3j1YjcQkf01ypzJlaSwq1OAM4tqza49KSI=; b=BBkc4/PfMOqHxNtmy6ByXAs0fm
	uiS4UdGITci/n5r4WNDvKVAInJ7tGVIZBjtS4lTekXALLHEyNEX/RfLUck4fTbGpVi7Yta5vSi6Ru
	rKiZzki86ax6kQSyQcnRQq+Vudorl5Yizp1/jdAjg1gj/6f2jUiHbH0QhAOmtvNBMyIJyj7cBYsCK
	mu8pzQXG851dvG81A0x6KYb7rM/sI8CjxN1a7cD+8MLRPomWMQ/KkuhdHHx7/SXm/M9qhXGgDRQAV
	XyVt7+8+DUCAQsaT/jY1kBpnR8RbfORpcs6jsi4H4OiFGWhCxscOYhPNxojwD4x7mWYncRxL9MmUt
	urVN3i8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvJVn-000000045vv-1XhM;
	Sat, 15 Aug 2026 18:53:43 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvJVl-000000045vL-0FDB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 18:53:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ceeee8c46bso4845535ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 11:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786820020; x=1787424820; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRDYJHHyH3j1YjcQkf01ypzJlaSwq1OAM4tqza49KSI=;
        b=cX6XnLaRlgXd0HqH4/rtRI0IvM6jqzB0CcY5YIS/8z/DVmUFKccpsYU7MyHSZHRGrz
         6R1rtj8qXRvlfChlmzccwYQvmVvlBCuHQJtHhXUp6EGz6PcbDHvct4XhIfpapU+YVcGz
         l+0a9AiLxdX6ebaMv9YQ4C4p+fZ3+sqRVLgDWOZSsdb5QnUXMAYduU9J5DSDjXK0/L7w
         2W7n42szY5ILNCBQSiFqLSpjR+6koAbhna/QmBt3MJcSLydlTomO1hG+vNEx8opJm9Is
         xyjRAg+DkV49TnSD4/N0lMEmg0uGgpFUFu/QPvWVc9fV6bhKqPvVm9uWp6Z2H2j0h0sC
         jjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786820020; x=1787424820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRDYJHHyH3j1YjcQkf01ypzJlaSwq1OAM4tqza49KSI=;
        b=jV7acg6wm/Q6EQBj/vcPdWRyzSqLDji4fleTPSuoTCflRz4CLkzkTL6aUFrrhoumHJ
         5i5nEDXSGjAFh92By3Z9Dwak2FcK+kzYbNZmRJyViETDRsXksVZr9Bckoyv/Tgro3MB9
         rDwRZw94s0i/g2vomLG7jpYihwtkjKTHBuIEYQuK2MemZJeA9e5W1Ntc5FsnoWH8EseS
         Zf/yAkEngtLL5lyWlZzUN6ct0rhuplTdE50yMDZfqW5ep6IDw8kk6+gYLmTDBQgnhwwZ
         D+jHIDsOAH2Bv997HsPIidyNPYqMz/qTAY+Vb9rUsUYAYxN2u3MAQOj83XM1d2L38i9e
         11EA==
X-Forwarded-Encrypted: i=1; AHgh+RqaKXFJ6soJYv/7iocokkaJqlwmXeQ5p9etd5zr2hwJPAxFH0aSoEJSqcfP9cl4pr8pe2x0UtHGJrYu9sSQR15q@lists.infradead.org
X-Gm-Message-State: AOJu0YxbXNIefdWZLoZNfnUqWCQqYcks7+wZsw8E4wLQjVWYRaY1Rhn/
	5WfL8Zl8CZOItyPmyUa9kU7Y1XLv+fzvybslrumxeP/a7D/VheZDVkAZ
X-Gm-Gg: AR+sD13uTfMfUJQYoAozTS6qtgRsBreULiNjmFygv/D7E8+NWiUR7yKApRdGymtZIV8
	ZMCEgJx8jUdxEHr2es4Xl0peCgpO77f5d3bdFutQUNI1xD3H7xcHbnM25L5zjiS6mPsZ9phEVQS
	KL+p7ltaC10iMnM21uC1SvEsBw6PhclS23rqqi8NZTVnJGixAo0viiY0GrVTB3egLH/4P6EAhS2
	3bhA5lIHlPOQgHdjElf8v/arXnsPjLZNN2gKt66IOfSMGNEqAvYbRAQnjTMzyF+3ZLJh2VCPN8D
	XN9WV6YRVBaU5IYnJt/+MqyvJDasa8ls4L+hue/D5SLEv8LHNDOX/U3f4J1SKP5gJ4y9dKlfkwQ
	Dp8utZdgCZUKWnjKkEm/ERB9jgh6t3TQfzXVS/AnrWju/M8uOko0w3d6D3vzZczS3fyhkmq8j72
	O4tTuDOxdrkdBMYRrT+gaDLoTgmRReqfeI/epdMpl9+0exTiFHaFehSEe0LKMhZ7/0KvNIFNQc
X-Received: by 2002:a17:90b:1fc8:b0:38e:7069:7117 with SMTP id 98e67ed59e1d1-3933b50729fmr11479035a91.0.1786820020097;
        Sat, 15 Aug 2026 11:53:40 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e5cdfsm19289125eec.12.2026.08.15.11.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 11:53:39 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 16 Aug 2026 00:22:59 +0530
Subject: [PATCH v2 1/2] ARM: dts: ti: keystone: Align devctrl child node
 names with dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-ti-keystone-devctrl-v2-1-5ab1e13c15c1@gmail.com>
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
In-Reply-To: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786819992; l=6209;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=WFjPHdh767TYAqxnbwvqJA2jUU4RF6BRsluNltVcpcI=;
 b=bhGWph23hlMaGN9uRhgEpldXPNtG3qXa5oaIk8ZucKCtx5IRwwO334TDyb7brVSWftIjDhHkX
 m5+RYSDn5QEC5Jq93gNLhSfB/5CCV1nSlnH651xZOYh1QluLaG49Pbx
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_115341_112203_5CC8BC8D 
X-CRM114-Status: GOOD (  12.51  )
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

Align TI Keystone device state control child node names with standard
naming conventions.
- Change keystone_irq to interrupt-controller
- Change keystone_dsp_gpio to gpio

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi  |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi  |  4 ++--
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi | 16 ++++++++--------
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi  |  8 ++++----
 arch/arm/boot/dts/ti/keystone/keystone.dtsi      |  2 +-
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi
index 662aa33cba11..083c94b62fc7 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi
@@ -110,7 +110,7 @@ pscrst: reset-controller {
 		};
 
 		devctrl: device-state-control@2620000 {
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
index dafe485dfe19..11b27663503a 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
@@ -121,7 +121,7 @@ devctrl: device-state-control@2620000 {
 			#size-cells = <1>;
 			ranges = <0x0 0x02620000 0x1000>;
 
-			kirq0: keystone_irq@2a0 {
+			kirq0: interrupt-controller@2a0 {
 				compatible = "ti,keystone-irq";
 				reg = <0x2a0 0x10>;
 				interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>;
@@ -130,7 +130,7 @@ kirq0: keystone_irq@2a0 {
 				ti,syscon-dev = <&devctrl 0x2a0>;
 			};
 
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi
index 4fdf4b30384f..b7a9fbd6d59d 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi
@@ -88,7 +88,7 @@ pscrst: reset-controller {
 		};
 
 		devctrl: device-state-control@2620000 {
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
@@ -96,7 +96,7 @@ dspgpio0: keystone_dsp_gpio@240 {
 				gpio,syscon-dev = <&devctrl 0x240>;
 			};
 
-			dspgpio1: keystone_dsp_gpio@244 {
+			dspgpio1: gpio@244 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x244 0x4>;
 				gpio-controller;
@@ -104,7 +104,7 @@ dspgpio1: keystone_dsp_gpio@244 {
 				gpio,syscon-dev = <&devctrl 0x244>;
 			};
 
-			dspgpio2: keystone_dsp_gpio@248 {
+			dspgpio2: gpio@248 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x248 0x4>;
 				gpio-controller;
@@ -112,7 +112,7 @@ dspgpio2: keystone_dsp_gpio@248 {
 				gpio,syscon-dev = <&devctrl 0x248>;
 			};
 
-			dspgpio3: keystone_dsp_gpio@24c {
+			dspgpio3: gpio@24c {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x24c 0x4>;
 				gpio-controller;
@@ -120,7 +120,7 @@ dspgpio3: keystone_dsp_gpio@24c {
 				gpio,syscon-dev = <&devctrl 0x24c>;
 			};
 
-			dspgpio4: keystone_dsp_gpio@250 {
+			dspgpio4: gpio@250 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x250 0x4>;
 				gpio-controller;
@@ -128,7 +128,7 @@ dspgpio4: keystone_dsp_gpio@250 {
 				gpio,syscon-dev = <&devctrl 0x250>;
 			};
 
-			dspgpio5: keystone_dsp_gpio@254 {
+			dspgpio5: gpio@254 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x254 0x4>;
 				gpio-controller;
@@ -136,7 +136,7 @@ dspgpio5: keystone_dsp_gpio@254 {
 				gpio,syscon-dev = <&devctrl 0x254>;
 			};
 
-			dspgpio6: keystone_dsp_gpio@258 {
+			dspgpio6: gpio@258 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x258 0x4>;
 				gpio-controller;
@@ -144,7 +144,7 @@ dspgpio6: keystone_dsp_gpio@258 {
 				gpio,syscon-dev = <&devctrl 0x258>;
 			};
 
-			dspgpio7: keystone_dsp_gpio@25c {
+			dspgpio7: gpio@25c {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x25c 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..4678454c0eb3 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -290,7 +290,7 @@ osr: sram@70000000 {
 		};
 
 		devctrl: device-state-control@2620000 {
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
@@ -298,7 +298,7 @@ dspgpio0: keystone_dsp_gpio@240 {
 				gpio,syscon-dev = <&devctrl 0x240>;
 			};
 
-			dspgpio1: keystone_dsp_gpio@244 {
+			dspgpio1: gpio@244 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x244 0x4>;
 				gpio-controller;
@@ -306,7 +306,7 @@ dspgpio1: keystone_dsp_gpio@244 {
 				gpio,syscon-dev = <&devctrl 0x244>;
 			};
 
-			dspgpio2: keystone_dsp_gpio@248 {
+			dspgpio2: gpio@248 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x248 0x4>;
 				gpio-controller;
@@ -314,7 +314,7 @@ dspgpio2: keystone_dsp_gpio@248 {
 				gpio,syscon-dev = <&devctrl 0x248>;
 			};
 
-			dspgpio3: keystone_dsp_gpio@24c {
+			dspgpio3: gpio@24c {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x24c 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone.dtsi b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
index ff16428860a9..20596fa446b9 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
@@ -93,7 +93,7 @@ devctrl: device-state-control@2620000 {
 			#size-cells = <1>;
 			ranges = <0x0 0x02620000 0x1000>;
 
-			kirq0: keystone_irq@2a0 {
+			kirq0: interrupt-controller@2a0 {
 				compatible = "ti,keystone-irq";
 				reg = <0x2a0 0x4>;
 				interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;

-- 
2.55.0


