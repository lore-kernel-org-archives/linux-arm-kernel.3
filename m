Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4E9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBjOTHYTAnSAYjYErf6BUa4a2uxiS8PF4Sok5L6HtX8=; b=WmKWAgd+ezPn4Q5xzy4HYNrf0K
	4gv6QgrwCVSuFcEf57so+RUfg5LtVLF48ZmB00+vHsm44NC6UQo6z6ssxYX2wZfbHCQtj3jWZN+Gj
	3fYkvhZKpmtBy8r1OaUarnzEBAniShO3wWvmvn9889ESjLaGbLmogZmGaVIG9I22ilz+eMMlqbCk9
	Q0rChV2yrTw8NaF99NENXgRJ80K8TjcEgSzNJMRncDn1ox9Dk/jBYOfvlMYTTXuIOAtdgFFpCEp9h
	PHrcqfxUMiY+c4lmWRIRbKWt/lZjUvPp+hVpk4C9hqwrX8461marA58zZFNbMqKv5UeLRbDWv8tI6
	3QCrxJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Blr-00000006wB0-3CaN;
	Tue, 22 Apr 2025 11:26:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BJK-00000006qlC-1Bkl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yBjOTHYTAnSAYjYErf6BUa4a2uxiS8PF4Sok5L6HtX8=; b=AYoWb4CDsLnixcQxaox3oof11C
	LNWd8JcO9axTZVWIgY5LrFA++oxQwzEbzk3ORvRHbMv1JUcUYE1Zg4GOFH+SDMMCVEu7JW8U81eoO
	TK8aFrVA0d840IAlWx4pN1G0rtZr2Ks5qzjXQgBKE4eoRM9PSGCvyTlv4mTOh3y2P29AbjafqpBNE
	oBldpUAc2rEJPYMM1N88iqDHBkovL1jkS2kaf4mX1D/z/VC1dZVlMYDcwEw/dC1GTmBSYt4JvADUQ
	QXrbDmSmXtBxgmWgx/+IwnnAr9AGcN9FPdpjCycwHh0B4pj20D/DpFDVhc9+OEzxfxkMpInemiMag
	ChzLfdyg==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BJG-0000000BBMd-3V0P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yBjOTHYTAnSAYjYErf6BUa4a2uxiS8PF4Sok5L6HtX8=; b=mBbu0BWM5tPNFwxLjyJKHHpDNL
	OiAIKpSUn7mcKCFTLe6IvhIq2orRmAjKFkJQWD1fKryaD7s9ZI/i0Y0OKkCJmSglFerfoxDUM8TZe
	5t3Z0Rq7IcXVvLn3hTpHbkf0rqgDV752NCl2hoC4l7wMNqd0zfx5CG4b4WSbhLSV/yHNM2cmqYXPD
	ad62++6c0OUsk90AYOGEdAQEn0dtAKrPWflMObREYCTje8tBIQ5//tU6AY+w1NzHrSQUazE/XxMrm
	M9nNK/AykrwVz7p6ag4rJebMBxOKSXUPmDt5bjZBCAYZnsJ3g9rBDG3tFUp4DOJldQ1VCPZat1JOc
	IFf/mHqQ==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJC-008kyr-2X;
	Tue, 22 Apr 2025 12:56:58 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v4 09/15] arm64: dts: freescale: imx93-phyboard-segin: Set CMD/DATA SION bit to fix ERR052021
Date: Tue, 22 Apr 2025 12:56:38 +0200
Message-Id: <20250422105644.2725168-10-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_115703_306972_71DF245F 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

Implement fix for i.MX 93 silicon errata ERR052021.

ERR052021 uSDHC: Sometimes uSDHC does not work under VDD_SOC low
		 drive mode and nominal mode
Description:
  uSDHC PADs have one integration issue.
  When CMD/DATA lines direction change from output to input, uSDHC
  controller begin sampling, the integration issue will make input
  enable signal from uSDHC propagated to the PAD with a long delay,
  thus the new input value on the pad comes to uSDHC lately. The
  uSDHC sampled the old input value and the sampling result is wrong.

Workaround:
  Set uSDHC CMD/DATA PADs iomux register SION bit to 1, then PADs will
  propagate input to uSDHC with no delay, so correct value is sampled.

This issue will wrongly trigger the start bit when sample the USDHC
command response, cause the USDHC trigger command CRC/index/endbit
error, which will finally impact the tuning pass window, especially
will impact the standard tuning logic, and can't find a correct delay
cell to get the best timing.

Based on commit bb89601282fc ("arm64: dts: imx93-11x11-evk: set SION for
cmd and data pad of USDHC").

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v4:
- no changes

 .../dts/freescale/imx93-phyboard-segin.dts    | 37 ++++++++++---------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 541297052b62..525f52789f8b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -75,39 +75,42 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_default: usdhc2grp {
 		fsl,pins = <
 			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
-			MX93_PAD_SD2_CMD__USDHC2_CMD		0x139e
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x139e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
 			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
-			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x138e
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x138e
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x139e
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x139e
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
-			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x139e
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x139e
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x139e
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x139e
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
 };
-- 
2.34.1


