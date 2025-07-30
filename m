Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA7FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 20:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRV/p/LfMjQVL8Vp7f4I6Y+3ln23q8MmT2AnWttCTvQ=; b=PvmjWuhHSGvbEt91ekh1T1fjMT
	+Wnm4IKuGK594Y5bM4E90mR3T/uSMzB0IRQkpmmnWG2dff0D/kk5RH772jFmBnl05PFQExkb7Rn+/
	8Q0N0FAV4lkcX0oHaVm7Zb08g/CGNYvtILpUq/1qhGzkE+VDrrX4tx/kd0v8l/vfQc715lQ9Km+qY
	SFPtAzkXIpnJtw6pKKGQwx8aRJaj3c8Oh0O5Sa2Nh+Pp/1gZQSVPZhk1sdkGOJAyfby2GDeDgYQ6t
	wYCIxSp1hTNCZ8TT+9htzlRN/vrMYYk1PawhofIaeyQ3vCHbPBHVGta7ahwgpswbOmaud7VvF68iL
	fN13/Cjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhDAs-00000002MTa-29Vl;
	Wed, 30 Jul 2025 20:13:18 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCrQ-00000002JdV-0UBU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:53:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b780bdda21so135904f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905190; x=1754509990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRV/p/LfMjQVL8Vp7f4I6Y+3ln23q8MmT2AnWttCTvQ=;
        b=Q/1jAg/cR2RoIvknVLReeLNacpxOi/d6qbwFvVi+mY6AlHXv05VyTekgizHFHj4alL
         GLcf0UmlYcK226+NF20DQYh6U7SMkON89Vwcwc4OjQE2K0HrdlYuUddrVYVgXr/2ZPGh
         rEPU+LSGqJ9THWpnw0KshmrXuNmPxOJ+mdpcbGxGMh8Opu0nSswermp9/j290dUqTGDw
         UDr/JdzqyOYaR1TSuA/QkMrcXauoJxKjcyEYygv3Wu5pcV1oNpHBRQzGjSIVYi7sRlZ6
         MKx1dyj396FUbAn+IWUfCWiqNBuP4MtGN0yWD5uTasxkJhNqQk201hvpYox8yrkH/VH5
         Fwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905190; x=1754509990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRV/p/LfMjQVL8Vp7f4I6Y+3ln23q8MmT2AnWttCTvQ=;
        b=YNgFOMfypKfysP6dCF0vo8wwNpN0WmQeWgvU86xQG598GI+Xn0FDRbBO7uyxc67ykC
         CsJeJbL+eV8U6GEHMtkmBhMGxJgctsR0AS8J1Na3iOf4Aq7oCAzU1BCJNSOmUNKJ8LtM
         +1IWM/7bQiZZb2u4PEsxu6DiZfFH9K3Qzh1lzrksOUs4Q9De14JOE6NJFJfAqRuGaBXg
         uVlyeKa6/rhXaHWQj3mes3sc70XhPMOXrC7lHMenzScTXsKcksvVX1DtT14z62YmvB1i
         6qj7ddRrObCGjsU1uiTdUPgzDQ7d3KAGxFEjNJ0bjrps07fL7M30O5swP2YrOkVbfRog
         Q/MA==
X-Forwarded-Encrypted: i=1; AJvYcCU4EzrjNRoweOvceXRuzoL/QLDEj8AOsydrd2y9C/Ua41ldhPavqPjEp6Vl6ismXJY2rWMUUoxLCshlmRtLeC4G@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9b2jRjcEF59EVFGOud/z2hIqMdLfZ07VyP+2E1Q2CFWQrEcYO
	vAG2Jx82gHHM6nyNzt+J8NjZ/Z27DBIYyDgUHUF9oAEJA5iEKIdTpEgRkjMKDFe5/0U=
X-Gm-Gg: ASbGncvvo+kbAjLbY47p2stugw4V5/0f2fs0+iLK5Jjsi4lwiMBgocIzdDWei581yFV
	VN57ybl7V7nTk22Akuzri6rkF5xtcYFwDKb0/50EBY1lbOTafW969EIpDDofWm7BhkQwMkJfy//
	P+L3HVqIR3n3rxNF5dgx7XIJQmzFZCeZOYflmMIEYTZrZBeEtpY9Jir3bb5UHfMi+D/zlq+6g8Y
	L4s9pY+kB1Hl7eV9NCExvCTT5r+bjTtjX+avCyNoEpKdI5znNHYKqiNBGKgCjhFzrHAYm1i9YAJ
	FCxCAvzLjmqOGPU24qjxHMYLD8mNHNnrKvqIjh5vBQ+2yg1prNFIcNCAktPqS1t1KLTijiOLBFN
	mrLsf7EzxBbHjiYoRAnijQgVPOrLs78MEUjNvMU7+vfjoZqls
X-Google-Smtp-Source: AGHT+IHoW22IWQzWG2jTmsD5K8X0np0CnF0fBnETsAeghpGo8KlFwVLAjLsmEoVsuIGvC5ZXjhu4SA==
X-Received: by 2002:a5d:64e5:0:b0:3b7:94a2:87e8 with SMTP id ffacd0b85a97d-3b794fd5810mr3799184f8f.18.1753905190439;
        Wed, 30 Jul 2025 12:53:10 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:09 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 7/8] arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) description
Date: Wed, 30 Jul 2025 21:50:20 +0200
Message-ID: <20250730195022.449894-8-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_125312_160588_8297F232 
X-CRM114-Status: GOOD (  11.32  )
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

Referred in the documentation as the Software Timer Watchdog (SWT),
the s32g3 has 12 watchdogs. The number of watchdogs is designed to
allow dedicating one watchdog per Cortex-M7/A53 present on the SoC.

Describe them in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 96 ++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 77ef75bad4be..dabad071bf81 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -670,6 +670,102 @@ stm11: timer@4052c000 {
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
+
+		swt0: watchdog@40100000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40100000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt1: watchdog@40104000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40104000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt2: watchdog@40108000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40108000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt3: watchdog@4010c000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x4010c000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt4: watchdog@40200000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40200000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt5: watchdog@40204000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40204000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt6: watchdog@40208000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40208000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt7: watchdog@4020C000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x4020C000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt8: watchdog@40500000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <40500000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt9: watchdog@40504000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40504000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt10: watchdog@40508000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40508000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt11: watchdog@4050c000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x4050c000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.43.0


