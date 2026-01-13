Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E879BD2D10A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJ4qhNK6HgJCQRaIfNR/+TyR3qWODgWCDv9ZRAYBUD0=; b=L7op/25IHdVmfhbYzfhezCceNK
	e7leDof6wNsxq6+d9RsfYF4TP8HtXjv5hwP4XQnY/1p/mL9WI8qxgwKMd8k0U/5iUCruCDCs/PAx5
	H8h8lHXZ30uBCjIlAMUB6/JEZyx+PmlftGWj9Y9+FsBjUApb0hFbOUDDKgg7YQlrrZdPwO/r8iJu9
	qC1JgDYSPMgCogvHbqPNTA72wyO1qUUKb+e2zUhI7+6Hejj2z4ef7A24L9JmV4RQvf7FEGmLuRzbS
	XD2nEhyDPcpfLC9tZeLSmzBgbWE/so/6YgpDzqrmIKetmoBaiVecSezhzTlVd/pKFOkwdoU1275eO
	CK9yomoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vff9c-00000007D2R-0wHw;
	Tue, 13 Jan 2026 14:13:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vff9Z-00000007D1C-0JNG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:13:50 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fbc544b09so6068060f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768313627; x=1768918427; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ4qhNK6HgJCQRaIfNR/+TyR3qWODgWCDv9ZRAYBUD0=;
        b=tlFqj+PkZhX/QGXEzplC4fgRZtVi2N70c+o9lp/uInFGfCEbYUxmFT04bh00D7FCbf
         iLHaDXsz85mRidslz3S26fFjX5bhBxMSjUza8zP7emklJGG1pJlw7MsSc1qNVcy1f3Nw
         AedgsNXBp/xKKxdwtw/u6/yS+YLKgezGR1j1K7L2t7dMuTeZtMxAxQrF6P3FhtD7rrrk
         fMclddHY1DBpjvFBm60YfJwDtD1ieaW6HH/p3A0ZwUvZ5ozEDcBlqjZIyiYZ7t/lbI92
         3nqK6dDWyeRMDEEmO9fBI5FHJY8Gd00ESbaH7QrLFh/V8Y7ugGmw/3RYPPzB9XcaP76b
         +G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313627; x=1768918427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJ4qhNK6HgJCQRaIfNR/+TyR3qWODgWCDv9ZRAYBUD0=;
        b=fTgmxajeoIMziG2taoJH5M1cWakApGWd3nucPW9iMVXTh82vFLI/5emYFy3Ecxn0F1
         iwqMnHCQaVzT14ymUQ7z9gv8PG3Cof+yZBdUuV9R3bUst1wAawycsPWeaq2MOoKiRxO2
         SL4tlIfKmwNeOyUGo56ysLWie9psE9wBo/e44tTRPCZSHtY30aIR2ycTmJXNRH47B0Pm
         wrYbt2ASUi7JNgowrPpvdQI1pLpaKAeRScTW6VgFjhYj92JsX+ZKPc6HEhX9wrgkJghx
         v3I6xYNUon2exZn1iVkEPXRKL5OxEdLmn5KIUYR70O1xnNUHkPTtNW/6bL9UYk47T+Qd
         EEvg==
X-Forwarded-Encrypted: i=1; AJvYcCVCOuLnbEvXFqevd//K+i9C92JUIOknSzZYZk/dICA4s1GTTG5mZjQk244Mealm1aJikKIQRxXSqyNVSggUgXtG@lists.infradead.org
X-Gm-Message-State: AOJu0YySgPZWJBS+F+E5QBm22MSX5GtBrKuH/HepT/oZ7Zd4EA960wxb
	WdziuryuSNLYpRCdiBEolmXpFHALM2Wo4F1maUkP73hZIs2nAG3tI0mNxYEIggQo0iI=
X-Gm-Gg: AY/fxX7WMhfYO6adwMKovZ3kIsDGwb+9O4eqQXuXZJRRi/TYhWjvRspTz0ETXC37Jrg
	o4/C9ufUX9kydiXwS3gb6zhdvrDf32u2AbinoCDCn8UTXeBsB1CWZjaBrrzYnc7C14OCjR2/y7f
	ztZeh/Hn02ib2Yk1TXakcoxIvkcg6y5u8GHdXDTDDDj4Tzg/LSerGlstJ6uoQOlnoiAftZd8B5P
	mGPJhSdm+wM6Etfv3AGP2vv3qNsZ6HhqDEgncSPxsZuGXIG7lrHNE4mXAzFSx2LJXIl1DxHU3jS
	f3NmwdsgNgY5YE3gWnSFkKwituugoYy3BVwCh07YrcCEO3GCg7iREfsv5l9F5JuKXJc9awPMhvw
	6zQZ7ybxNfuc3hzj8thEkBeaPcXYbUY/9MjYizK2FkKmCWCblgBGpapOD9Hj40MHdKH0bMio8f1
	1M1Wi4KW0BRY9G1O01
X-Google-Smtp-Source: AGHT+IG/xqYaef47YaE40Cl836u2Tn4o2f/BCTjQwmPi7rLjNPU1ITQ1RKKteQ7YDa2akmaP7lvqtQ==
X-Received: by 2002:a05:6000:2013:b0:430:f5ab:dc8e with SMTP id ffacd0b85a97d-432c378a8c5mr27806853f8f.13.1768313627004;
        Tue, 13 Jan 2026 06:13:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm47014898f8f.24.2026.01.13.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:13:46 -0800 (PST)
Date: Tue, 13 Jan 2026 17:13:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>, Frank Li <Frank.li@nxp.com>
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
Subject: [PATCH v3 3/3] dts: s32g: Add GPR syscon region
Message-ID: <6dfabf2a1f0e6f410c92b0e24be6ff94b409d71e.1768311583.git.dan.carpenter@linaro.org>
References: <cover.1768311583.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1768311583.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_061349_130583_F629ABA9 
X-CRM114-Status: GOOD (  10.70  )
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
v3: Unchanged
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


