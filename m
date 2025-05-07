Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7A3C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8kbahxvpfkE5SUIJ9O+RAhHkMsjfPizkD68mJarweeM=; b=NFqmc0CMBzyfMaNJr+vj7p70vw
	fWHfoSXUAP9L25heEOU7QGXXtQh/N9amdwQeo9y5cJ3v9X/BjDeI/xpUoR2otS+rZO5BVQJ4VjZm+
	hYkDKHo4uXak9b4wwQERktqJNj6FZ3HVaWxFq40I6nE+PALbtTkyZARbk2D8MUId35rYOixS8OHeg
	f2pgCnZDyY0KfYedxhHH7+ZfawIm51tyHXH9JXjsx4+zjoywcjLzGe3o7736VV+DkWmei+NZQaint
	vLSh30DWAfeMw5DZX3Q1vxt9h97YIHp5pgwsguIFofMSAnp8w8GfiPVDvG9sf5+mc4TbaNsn8WmNs
	aOJ7ZklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCg74-0000000FrDo-1fAQ;
	Wed, 07 May 2025 14:51:10 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfYQ-0000000Fj5h-41C8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:15:24 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30ddad694c1so74074171fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746627320; x=1747232120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8kbahxvpfkE5SUIJ9O+RAhHkMsjfPizkD68mJarweeM=;
        b=BJjRu/4HdrubJZhbnQYM2X+95iJ4vGeXWPbBk/HrLBRXkTL+dmTvAN/WO859m950BE
         zQYUAm/zgt4jRV6n19vZw/I4ofFm3mtUXrcgmMv89PdvmAubjOUPMpRI3x3SWgfC90Ne
         T75DxXSE5Zvzl5t6mEsiGxTbqKMSg2nKYiwZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627320; x=1747232120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kbahxvpfkE5SUIJ9O+RAhHkMsjfPizkD68mJarweeM=;
        b=iAJn+KDHsNdWhSMXfZIsiIBBU07cNhErV/etolsx5l8EPV/nVD0igDRB0sdXX/msuV
         qz8hSaSf8DOAWhve+EUjRPiawdRgSGttPafg/+9Hj5MjTg4IwZnKeLi6n4DzVfKJ7Fz4
         zwMFyzwUgBlW9LGmBMwOICUh08oBbF7tN4o12damQIU+fcLPFSGr9EeR6nw6yjL1DWX8
         LWbz5MWg62sBoKo6rf+ksyfRmNKrLxn2u5EbvVT8GUYYrqEGP7bcD6jATleCj+MjxOEE
         mFGZvDh/lHwzb+FtYvAXzU4vyyUVbiPdgvVF/QCmsTzMdEGesM9g/b53xRxgIAr2vQse
         gRcA==
X-Forwarded-Encrypted: i=1; AJvYcCVIs4HX/h+23bpn9NT71nQg8o0QmNtCtZCUjA4ZMFq7akY+IhHjbaqbKgPrOr8jv5HBMU5DN1aeZ/Qz8Qj4rcsu@lists.infradead.org
X-Gm-Message-State: AOJu0YzHSDRf1mWK5QcIOSXVmGfrkP3a2ABOjr6cuxrFtaVr2l0e+b6p
	ks+XPMroD7eX6a8suW/IzZNJS++Hnr0TBLnLg4wAT8ulfRSmcny2Gl+L1my14PiLBb43ImD6JhD
	E
X-Gm-Gg: ASbGncsezc5YDsCvOEqj2lxbewQTZvagUm4B6xr95aYrP+6BM7OI2lDeY4euGTCxuHM
	XgN11BCAEbWdYvrFq/5NfUimJC+Je+2mmHJi4zrt0gJDfcAT8kpIeBJy9gsv6QjKaJBbiecjINc
	n1LTkGh2AlYRyzzz/Bxk/VKGxyqjhMwfP6SufsxpEVjRgAttcnOY4Lfzi4I0KKkoHYyPNadjE8W
	nvsNq3MqTmKI0jI592Kdx5XfQpOYM+bcd8jh1TFBJsSpeCSAgK9ka0xWCjKS4ANbmi/3faHaRqK
	tMUPjPihwkArUNlygSPCKIa0doQTmSv8c4uIZ0i2rmQtv05+ZhIWc8eMSyAYobcAy2exv7d/JLN
	uw3kS/9VHgo6uhj1Zu3kg+Z9JTZYS7g==
X-Google-Smtp-Source: AGHT+IHdlj7CpNVBpX0ik+NG/wdlK6dMWu7TW5P7ZwM+3Yc0y5PuGMTHr+/cHr3uiayAfwmPefwgnQ==
X-Received: by 2002:a17:907:2d23:b0:ac7:4d45:f13e with SMTP id a640c23a62f3a-ad1e8bc3151mr378991766b.13.1746627310389;
        Wed, 07 May 2025 07:15:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c02f3sm927944966b.92.2025.05.07.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:15:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: mxs: use padconfig macros
Date: Wed,  7 May 2025 16:14:58 +0200
Message-ID: <20250507141504.1332054-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_071523_000310_C4715D2D 
X-CRM114-Status: GOOD (  11.34  )
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

Convert mx2{3,8} dts files to use the padconfig macros defined in
mxs-pinfunc.h.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts    |  6 +++---
 arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts     | 12 ++++++------
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts b/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
index cb661bf2d157..613f13b6c8a8 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
@@ -93,9 +93,9 @@ MX23_PAD_LCD_DOTCK__GPIO_1_22
 						MX23_PAD_LCD_HSYNC__GPIO_1_24
 						MX23_PAD_PWM3__GPIO_1_29
 					>;
-					fsl,drive-strength = <0>;
-					fsl,voltage = <1>;
-					fsl,pull-up = <0>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts b/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
index 0b088c8ab6b6..fad08f6c008f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
@@ -83,9 +83,9 @@ hog_pins_a: hog@0 {
 					fsl,pinmux-ids = <
 						MX23_PAD_GPMI_D07__GPIO_0_7
 					>;
-					fsl,drive-strength = <0>;
-					fsl,voltage = <1>;
-					fsl,pull-up = <0>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
 				key_pins_a: keys@0 {
@@ -94,9 +94,9 @@ key_pins_a: keys@0 {
 						MX23_PAD_ROTARYA__GPIO_2_7
 						MX23_PAD_ROTARYB__GPIO_2_8
 					>;
-					fsl,drive-strength = <0>;
-					fsl,voltage = <1>;
-					fsl,pull-up = <1>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_ENABLE>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
index d004b1cbb4ae..f170df37b3f8 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
@@ -102,9 +102,9 @@ mmc_pwr_cfa10036: mmc_pwr_cfa10036@0 {
 			0x31c3 /*
 			MX28_PAD_PWM3__GPIO_3_28 */
 		>;
-		fsl,drive-strength = <0>;
-		fsl,voltage = <1>;
-		fsl,pull-up = <0>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
 	};
 };
 
-- 
2.43.0

base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
branch: modify-mx28-pad

