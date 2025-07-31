Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E13C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwFsTsG6VVVIEYXelcVJDGOE+gmfaFKEIVGQh0yHCdM=; b=rrefe17TLuv7uAttowjpjK4bPw
	HKwD2hav9RwdRt7wjBW8XWzog0pzyeuGfzbxa7XV/B1Xho0NVIdzl/shfxn4p1D4/ZBKQgFVF+9fP
	6BPLSNSydN0WmoS9EiO1cefbFhH7sKEl/c7pgX+VJkNbkm6I+y5xjDQxB4ZDzTrmvwKUy6aTlUZ1B
	Xvskn2qDmMR3ZMYdBoX/Y7PcJhnOtO2SwPEI9H5heHiVHD0PZWv96YmbYMK0xqMf5bBxQvdgaq7W/
	cEk0+LZUnBNuHhh0UIk5ilR+MrRnK6vb3Pk48Wlcoe1KmjKCVTLD8xTxiUSMmCXPNcPRWB7mggsqT
	YP75O7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUqZ-00000003vEo-1oid;
	Thu, 31 Jul 2025 15:05:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTr5-00000003lhg-1169
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:02:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4560d176f97so10014045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970518; x=1754575318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwFsTsG6VVVIEYXelcVJDGOE+gmfaFKEIVGQh0yHCdM=;
        b=A/G2Xwib57C6sIyX/JAG+YXfIrOk9TAw3b/GsR1iIK/mGr/uC9/Z8TqYH7cH5KSmj0
         FnO7tyvzasLT7TeiWPyNM3+aRmKJJkjopqK3/lrFakYMeXOXdo8iqsUH31VNgFzuU2Wj
         1eWAhwTZCKqEGH6VkBexw6UAPJvYFR5fy3QE7Zcc8H7SZR1vo6IkFGBHzZEt0CwMZ27I
         n2ss0iikLmLD5XDwwn5Sg6Qzw+BC1rOI6pAE9CiOD0eutD8fxlOtiubC3sPu/SDHntMQ
         0YTmTMpK25GKJ1eZR20+SbhLoXgQbm/tygBmcvx7JAEFpTBgn8YJi4LaZNW9Fc79BaiG
         xdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970518; x=1754575318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwFsTsG6VVVIEYXelcVJDGOE+gmfaFKEIVGQh0yHCdM=;
        b=BRXURKTMur9IEMrg1414iHPM5LWhooVzLmzdBzuCjRt8ZyrBtCQcRuYPrRaK+YKNSo
         p41LwuDaQk8GQIxHdvVseTesJbR3srmR1B7o8DUoirlq8HSOODMEpZwAUj5+EzedZ2VO
         IkBiEObbaCKamwmUpx/NSbMvUj6PT9/WZ+dxazzQ45pAtuVL5q9wHGkJuezOaAk2H29d
         oDR4geq+VFY0T/S8dTCOcqcduYCum4yyKaGWipUto/Gj1577DiuDLFmZb5moCjfISybn
         RZSYr0CsESCA50XS5VIkltWsFz008kzP/yzptZXk6MclDjCa91IlGI4SCs0zKFevBR9X
         HmCg==
X-Forwarded-Encrypted: i=1; AJvYcCVKmgoukpjsabfaF2umjfa1+lrSXG8BgXM5ofZfiaYIt1rTteX4524Gn9R8mPvD3mihy+ABxk3GRmcRmec7atIi@lists.infradead.org
X-Gm-Message-State: AOJu0YziQJDaNDtgu7lWXd2pPKzQW5IqJLnB8cfPldXS7LBqnAX8IK8Y
	nTDWs+0W9LamZdL+7osKDNEyPgw0FdLLAamlKJi+CADBSWXivK6gkVENlcjxZ7WO3xI=
X-Gm-Gg: ASbGncvx4RlLzTT5M6ZHRomBm83/do9zSV6nFoQBd7vbZ0D3ssnmMENLjw7DagGHp7r
	wL7XZNpRFAUSr43T2Z1HozPPa+SC5JSE2Vvv0U5ZnJi+H8jbWc8C6825wGcydCKp0Uk8KhmiZ7z
	KySH3PNdkzYziJEPxC9KOsCXv5OcXPOEQ7TfwQecFvbs0NhC6kHbjJg6op6ExYY/pifbD0BWTz/
	jVO+a0PtcM3nAPfgyfOiH1Q+qFYs11TqXnaIAyvSoWX225Qg91txAkdn2W3ESdONOWMEecF0uea
	+sxVdooEaH9k9zv+sEn3LcjSzXU3zfqMjoOdu+WvRwLfCBiBdjCCWzJHAIcxprC48XWfjHMoa6v
	bDTaEuB/Pj4hHgV2YnuKUO8b7I8osBjgobEkjI5x8dKpKUlad
X-Google-Smtp-Source: AGHT+IE9qKRVnjaVEgn1UAlBxYnmTqRy8r5vlmAdzB8hFwkW2dkNsNPHqiJWxr1+s5Cb5BtT0A9yoA==
X-Received: by 2002:a05:600c:35c2:b0:456:1dd2:4e3a with SMTP id 5b1f17b1804b1-4589c2b7c59mr53270125e9.3.1753970517567;
        Thu, 31 Jul 2025 07:01:57 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:01:57 -0700 (PDT)
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
Subject: [PATCH v2 1/8] arm64: dts: s32g2: Add the System Timer Module nodes
Date: Thu, 31 Jul 2025 16:01:34 +0200
Message-ID: <20250731140146.62960-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_070159_281591_A3D1E7D0 
X-CRM114-Status: GOOD (  11.42  )
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

The s32g2 has a STM module containing 8 timers. Each timer has a
dedicated interrupt and share the same clock.

Add the timers STM0->STM6 nodes for the s32g2 SoC. The STM7 node is
not added because it is slightly different and needs an extra property
which will be added later when supported by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index ea1456d361a3..1783edb81350 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -317,6 +317,42 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		stm0: timer@4011c000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x4011c000 0x3000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm1: timer@40120000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40120000 0x3000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm2: timer@40124000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40124000 0x3000>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm3: timer@40128000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40128000 0x3000>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		edma0: dma-controller@40144000 {
 			compatible = "nxp,s32g2-edma";
 			reg = <0x40144000 0x24000>,
@@ -409,6 +445,33 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		stm4: timer@4021c000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x4021c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm5: timer@40220000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40220000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm6: timer@40224000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40224000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		edma1: dma-controller@40244000 {
 			compatible = "nxp,s32g2-edma";
 			reg = <0x40244000 0x24000>,
-- 
2.43.0


