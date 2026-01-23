Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7C2D778AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNmEBAcCOcnCArGc8pe5UUOL3dPUYv44y06uRTFe1O4=; b=uJ0cCDv5J/aiBwfElXxG45lGOn
	PHeIC0xWGkJ7+RgQv89+9NSR/zg66IX3b2YokY0ZF6FLReqMbglwQHVHwMVZ+zka6I0JYmhriyS5y
	mFDcDhjYgdcvbjzXYqo8cQ0spKHNJ+Ah4BPj9DErbmxuwH4q7Kg2SxaSUsSFw82t/DI2pyHsTr7O5
	2Cy9j7NEI/fFIt2rGFKosQDOahbeSi81S0ULuy0mtCR211Xsuuu1Nw9f5TLrJOH/T1mhM34Ivv3cQ
	nVtrpYiX+03tgnVudidWlWTks6fNb6wvsbES8ledV56aSY3it8wy2SUTRW05vFeHsidb22TjSgrFq
	lTg9oMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNBo-00000009RRt-1WQC;
	Fri, 23 Jan 2026 19:51:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNBm-00000009RQw-0LTu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:51:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so23445615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 11:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769197884; x=1769802684; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MNmEBAcCOcnCArGc8pe5UUOL3dPUYv44y06uRTFe1O4=;
        b=TZwmV3rfMf6P2RZfDf+hEJE4ZfQU7hENlnfDZApVHv6AbIoUhvo+fDQUSTQk+Xm7rQ
         Rz40S01+JUx1BKNVnPZIDspnnHhpQgwOL6Y2GGdHpqELWLy+32teMBDrEiPoKRRNESVs
         tsTxxOg8Yue9iO3ek2S+GhJkTw5am2W/FCXh6HV+It/zeDE6ns6lcODZkFICfD1eBgSi
         w/qXG8LBxOVjYgJ/k8rguB+8Z88Yv+xzNhQxgse5bZwZOrg6Xe1QSHJmFQXpoI2eNcSg
         7UQAqps8tAz5PidtfTthRMgRqvNnt7/9tuVi3B/fPGNBhvO83QMUyNm883yxraQbalbq
         gHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769197884; x=1769802684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNmEBAcCOcnCArGc8pe5UUOL3dPUYv44y06uRTFe1O4=;
        b=kQviIzxjl0g9Kx4mpFIh7TZ3kSARsDLH3dU7N3S0cEgw0UrWsDrT+JYEeEex9NYdew
         LPX1SJrwe4Ll5xvutU40QbwgxaX82334HQ1DMRGOvvdKxQpzwwNgN3A/JYm1UeUYzi0E
         OsXIK1PJtAdjYKT0Ma2DlMqVviGBvVEjJKvbOQbO3BL+fNoa9e1vSjBnd4qajKn0X7TD
         BJOZCSwxxO2QqKqTxMeArHeLUk/YuHqZpL6HylE5E4ao7WxD3fFdvETB1zJn/vf6TFnn
         N4wSW3gTb1jAN9ytlhNMXlPIbAAfbsA8tMJaEY1gy6tPNKnmR3pT6nuBLnMyHd1yrbNA
         T/Zg==
X-Forwarded-Encrypted: i=1; AJvYcCX4/T2CcMGhzciR8mD7cf0SWj1Y+9TZOL84aeWJHymNclY0WAHr+27cQ8VMYP/s5DvjNvRSBjILT0aFFzrle3ny@lists.infradead.org
X-Gm-Message-State: AOJu0YytqAAJW+4LCdviX0JzrdS3c7CHKvm1QGEZjIMtTREkwHJ5odJf
	h/MIlSeMxlqyfzcR1BC5ns5VKVKOMwI5oMwsPy/2HGAUUBxFRQ+roDahmJqYAvSuAyU=
X-Gm-Gg: AZuq6aJqIY8Ppl6CURsPYAS0tgJMHeF3+Ys0bSpWTAMGr6PQiJGVz+AKkUZ+f8kyXVr
	rD4YdU1p38qiT3pNL9wP/RuuU0da+eRGDpw146GTDw9vZ+t4I57OH0JEUsaGjWV+R+CzlDu9mq7
	bAHKA7r9mHlCKZC6fvaTnFOzB8tv1VKDy9UuH5C2RsIPlimh+55f00GEMjorgJUlP+Irhc5WVa5
	IbLWvY1YOOUjpGuvU5Rsh95+noarXr83QhcaUwKule1/Du5/RyNpeDlYDNhj/0qgJgigST8cN4s
	7nepVhNgTLCpUPJTRfLfS9xjqANt0i6FcmN3iUJC7C1bnAVwm9iB2mq9wkiHB1GYdMUMilfje4d
	XQYQHdKS/fo0k0imwudIyfyVUCyNaaVLLR1j4gBdXdgDc/tJi1O4On2FcsDABlyhfsaA93qc2Zk
	6tEFdg5sR6mqCivB69
X-Received: by 2002:a05:600c:3e0e:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-4804d307b0cmr68595535e9.16.1769197884089;
        Fri, 23 Jan 2026 11:51:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470bfe42sm156761385e9.9.2026.01.23.11.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:51:23 -0800 (PST)
Date: Fri, 23 Jan 2026 22:51:20 +0300
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
	Frank Li <Frank.li@nxp.com>, linaro-s32@linaro.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 3/3] dts: s32g: Add GPR syscon region
Message-ID: <34ac20223cf6833a0fe4291cfb2db5309f4e5eed.1769195864.git.dan.carpenter@linaro.org>
References: <cover.1769195864.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769195864.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_115126_138486_08604307 
X-CRM114-Status: GOOD (  10.37  )
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
v4: no change
v3: no change
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
index e314f3c7d61d..be03db737384 100644
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


