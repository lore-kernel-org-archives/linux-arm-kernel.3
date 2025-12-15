Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6850D5B172
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiDNjJReuH+sQcPwA2otPS6JuC4RYSH/oTmgctrVOF8=; b=QOh7eMtzBoXVqFNk3vp+jg9PTt
	gwLxE6zmWILwmISP23DYXqxomXhEelTym+cCoVC9wuM3BCbVLcZ9p/IM0JqTQ5IidhWbHSPaBZLLa
	jEl/GNvzNbOW7RCu24br05HysPjJ8l0N3duow5AvVirpIQl/IVWuDtnbOP4nY0kWehU3Hjmd5MV13
	FwOpbtfa5FbUNM5tdyBICSGzAhNt8Sn6L1Q6Q2yhF9Hn/q3m4uk4BxpNoCnPVamBnxe5JqKP+ak70
	mqvrSueOSacI5PLCaJsWS8T+AFXzjuuQpUgq6CpbHnWUuwqCXM0shTOAgII26EmlE3VzM2wNLCtMm
	yjcigZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9m7-00000003oto-3MJW;
	Mon, 15 Dec 2025 14:42:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9m3-00000003ory-3dhp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:42:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so770408f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765809726; x=1766414526; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xiDNjJReuH+sQcPwA2otPS6JuC4RYSH/oTmgctrVOF8=;
        b=bpNXJQXiv17kh72o8v8d6Vi7zMcQO+UZtsd6fjeIrC1kTICHjDOjlskwRx5KvbQKBS
         tdWvJe4TlFtoQW5ToGSvDSzgqlAPHZBQwXsIDcSyivzsde6T7Qbiz5F1Mccx71EMf2N1
         6Ha0Lqm21shyMWyXI98ZyWyHdmkqf7DTO0T+T/lhKZWuU4k5eSMJe9j1juTUq/xFvmka
         blYp8ZMDhYcc4KnstXr/jyeZUl5GTX9xPWqK/eX1kLOy6lFpNOk9HUxQlFwnfRpg60vl
         +mLjx3j05hhx6Z0/QUGwRLVg+DlXt2gJiXzvt+Q4x2OE5Cw9EemfUwNz0wcRfWTmrYhV
         t9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765809726; x=1766414526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiDNjJReuH+sQcPwA2otPS6JuC4RYSH/oTmgctrVOF8=;
        b=FXIG6RhSgeP/yVFMgcPJBHEq6198Q+4KlLeMPm93k2FlO/bjWo5L5Ib5iysUj95Gqi
         Z/FT6PVUKz59BJ+VOQtNuTb0XSK3OsfqakNQ7gXfJnDPJz1Pv6exY2Djmyj1qg24aE10
         R4K3JGySS1PZOKf0FSJoeZoCLw8Dsaf7d/s1ytpL7Cyqa5C+hWqudFC5yU5WGmsAlqTW
         pr9UHxrGYxhj3NLaOOCt2Qkg+OmcC6vc571P0mpTSJ6a/+q9Tqr7SyxeieQAuOIIbRcz
         hCeDGLICIFMeLa8APbMYIu8iVoKEZy6os1tcJetNFVrK4W8sKZi7e6QHMc9iu2+Nwmu8
         4MvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMl1Q1S1lc1HEifnutU1WbSiH/r1yxvamLEDBJor1dA8ZC4hQYhIKBoZduiEkjFFw4J/ErBIgaA7SDHBDpG/EK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm/ZplONKohkd9Y6bGWdFKig/ilPFh22WI3C+y8XRoUnlGKMjo
	YeP2T8vKmGohPsyjcO7/m8iNiv8Eyo3nqXNuYPMi6THF2XyxNqUFb3vhn1sV1Qoh+ws=
X-Gm-Gg: AY/fxX79Ibdqagms1fiAw0mu5wZw4jzzBAATcRzE4/Lm2duZAID+lKl0ZMIdlA1a9ZZ
	rUpfgrGZE8ri7awP0ySL9411Xp34MMkpWae3ej387HH0tpA22w6+1OaeuY1DwOA/9dvV77WDO0v
	xces7BagcbKsGZFkmFNqRz9DpPKQYwojaYjq0ADJpjBwSg5ycmxLjlBZeUejfV8ZMso+1yUtoop
	Ypxi6jRgh5s3yMIf4Y2jSoPEc3n/9iR1lPJxS4DefVCygZT/eNpRz9gAHcyyB+9rtF/Ex+CQu30
	jKXJbT/rmxK1QFFjxEMlmktaraC5neFb60AGD3gG7r9CpdX8c8ZtMPtKI3bsFLgvDgxp2uZeJh4
	rmYGDe7G9y9ufFksRG7sUNKn+Qtzk+tuInsM4rYzchqhQ2SyRkdotVKk5b5UNp0nqz4+a96GBUs
	eSInnF1lprHNQybv39
X-Google-Smtp-Source: AGHT+IG8c3SGHRSscuhUyyGSsZusN01T0eo9ZxX9zQGjydj3gQVdrRgDNwh4QNxdusEz1PCq34CxnQ==
X-Received: by 2002:a05:6000:18a9:b0:430:f463:b6b4 with SMTP id ffacd0b85a97d-430f472faedmr8436759f8f.50.1765809725859;
        Mon, 15 Dec 2025 06:42:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b9b26fsm32113105f8f.40.2025.12.15.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:42:05 -0800 (PST)
Date: Mon, 15 Dec 2025 17:42:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: [PATCH v2 4/4] dts: s32g: Add GPR syscon region
Message-ID: <990c6317baca68b1ec0391eba3b66f511d75710c.1765806521.git.dan.carpenter@linaro.org>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1765806521.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_064207_924796_10C84CF5 
X-CRM114-Status: GOOD (  10.76  )
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

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Remove #address-cells and #size-cells

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 6 ++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..b954952d962b 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -325,6 +325,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g2-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -731,6 +736,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index eff7673e7f34..71ee1c043d03 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g3-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-- 
2.51.0


