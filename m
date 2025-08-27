Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E53CCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 05:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGTk3Wm4FgeLO1LcfvGq5xnHmbsU4cVvWOSH+YZEQMY=; b=yO79fSSzjil2b0BVdfzwa6mm1O
	nnkFvwwbZorpPGT6rCqwzbBSKge0ErMOJlQYyEvnDcH9gIYQJYriiQUIjZoi3C39p87sOlJNNEQ/W
	0JFh/kx3J0d7+SDn5zREIJqpPJAKGJonwtBqXilONN0QgeM/mleHQw46x3T4cwkCT8pJjFOjH9G9b
	Fe1u3dOzUB7Xqpy9I0zAjBVSroSdtjLfNvcJdo8EGnTcT6fGOt4KR+Zg8MYyHnEMWFuj3KXc00PeO
	6eh8xH0x22t/4iYCvX+QXMDKhQaElidJzQFC1yDe4DfaQfg4O14kEkgaCE1dWnMcaOJ2lxeq1XuJv
	9homoX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8Nh-0000000E4pR-0AuL;
	Wed, 27 Aug 2025 05:07:33 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8Fe-0000000E2yk-04sm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 04:59:17 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250827045907epoutp0348d12f8f85aff5457d667a8791c279e1~fhvCiabvg2001020010epoutp034
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250827045907epoutp0348d12f8f85aff5457d667a8791c279e1~fhvCiabvg2001020010epoutp034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756270747;
	bh=tGTk3Wm4FgeLO1LcfvGq5xnHmbsU4cVvWOSH+YZEQMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f+UvqjMlha9M9x/2elF5M2d8zrBXWZkLEf7232JtiBqFYTPMSdjaGY3tuZGIRdTZE
	 m6eR56jXr0D9Kh1M2DoysDMZecUD05HFv2183pWnYpVzBodrMFMv470exSoDZGmwP8
	 +zfL73ly5LC//Eu1c/D3URAU+lS+0TT2KHf2D9lA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250827045907epcas2p2da1a021d41298a66065a5191e3dce0cb~fhvCA7fHR1733217332epcas2p2c;
	Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.68]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cBXPQ4FfLz3hhTP; Wed, 27 Aug
	2025 04:59:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250827045905epcas2p3a52debf186f41eef08e6d0a351d80476~fhvA2c-hA2756227562epcas2p3T;
	Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250827045905epsmtip2e74a3e3b66e327ddfc875170a9ec110d~fhvAwZKpe1437614376epsmtip2S;
	Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
From: Kisung Lee <kiisung.lee@samsung.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Mauro Carvalho
	Chehab <mchehab@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Kisung Lee <kiisung.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: exynosautov920: enable support for scaler
 device
Date: Wed, 27 Aug 2025 04:47:19 +0000
Message-ID: <20250827044720.3751272-4-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827044720.3751272-1-kiisung.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045905epcas2p3a52debf186f41eef08e6d0a351d80476
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045905epcas2p3a52debf186f41eef08e6d0a351d80476
References: <20250827044720.3751272-1-kiisung.lee@samsung.com>
	<CGME20250827045905epcas2p3a52debf186f41eef08e6d0a351d80476@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_215914_548684_30768009 
X-CRM114-Status: GOOD (  12.73  )
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

Add the Scaler Devicetree for the Scaler present on the
ExynosAutoV920 SoC. The scaler provides hardware acceleration
for 2D scaling up/down and color space conversion processing.

Signed-off-by: Kisung Lee <kiisung.lee@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..e3dad683fa36 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -26,6 +26,7 @@ aliases {
 		pinctrl5 = &pinctrl_hsi2ufs;
 		pinctrl6 = &pinctrl_peric0;
 		pinctrl7 = &pinctrl_peric1;
+		scaler0 = &scaler_0;
 	};
 
 	arm-pmu {
@@ -1504,6 +1505,27 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	scaler_0: scaler@1A830000 {
+		compatible = "samsung,exynos5-scaler";
+		reg = <0x0 0x1A830000 0x0 0x3000>;
+		interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>;
+
+		mscl_qos_table = < 0 800000 800000
+				   0 663000 663000
+				   0 533000 553000
+				   0 400000 400000
+				   0 350000 350000
+				   0 200000 200000
+				   0 160000 160000 >;
+
+		mscl_ppc_table = <  12  496 470
+				    16  374 342
+				    24  303 288
+				    32  189 188
+				   100  479 436	>;
+		status = "disabled";
+	};
 };
 
 #include "exynosautov920-pinctrl.dtsi"
-- 
2.25.1


