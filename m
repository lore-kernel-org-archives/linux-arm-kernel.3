Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5594CA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hJ0aQ7fGA2QuLMADJWwMmxygYV3IJuA53iBt1oJi10=; b=SDHp0EmNKQRipABYJsnvjccNEs
	WZd34u/+1dhiZOzM2kAF2EUhiRN/T3MNy2EFKEwB9a77VfnbI8OjOrbrK3foY+8z0mxm31LqnHi5H
	dfEN0grU7DCREvz0+dVDbLQ16NInHwzJM+QeTPg27iIpkkIkPKn0vjUOjQEc1uoUWqTBvbY+3rgEo
	xiFEKbEYyld4V2S54UlSZR7tW39YuwqJNuFJlCr1KSYRdWItLbbdkB5n+eIbClHqH8xlqJmGpZNDV
	EdtOXHaQqDOMZ4SmfaC/9BGhtzHJYxBn7J8gOFMxLKLPi5/5T44CoH84pelMskXAvb8ShawjsoBlM
	HVIpXy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF91S-00000006CwI-2T1U;
	Fri, 09 Oct 2026 11:44:22 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF91M-00000006ClC-2E89
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:44:18 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261009114412epoutp02d565ea9005c2112758841c7aaaafe30e~c2dMcMU4j1702317023epoutp02m
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:44:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261009114412epoutp02d565ea9005c2112758841c7aaaafe30e~c2dMcMU4j1702317023epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546252;
	bh=1hJ0aQ7fGA2QuLMADJWwMmxygYV3IJuA53iBt1oJi10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fiVbMIVa3Ma/tz2VhuqO2sCI+rdS29HR+sYxNC4l4jC/TJu3+s+zM1p5GryzrzYo1
	 JsAWjMsArlIAp/Ga+ij+/zV7HfIgY0tf5O+Rtjs7IrtLO4yGtkj3OhlGj/eZfwH/Va
	 6G1a81mxJUuor005q5vXEr7Xgmfsif1Ng40WBMdQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261009114411epcas5p499467c7e1fb0dc01cbf0283bb3f058ad~c2dL8dGJe2750927509epcas5p4S;
	Fri,  9 Oct 2026 11:44:11 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4j1Q4V6lcZz3hhT3; Fri,  9 Oct
	2026 11:44:10 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261009114410epcas5p3eada00785bc52c029f42c47ad6222466~c2dKeoqQF1310413104epcas5p3O;
	Fri,  9 Oct 2026 11:44:10 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114407epsmtip201bed821dde3adb3153548808e14fb5c~c2dIKg65-1160511605epsmtip2T;
	Fri,  9 Oct 2026 11:44:07 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 14/14] arm64: dts: exynos8855: add cmu_usb clock DT nodes
Date: Fri,  9 Oct 2026 17:31:37 +0530
Message-Id: <20261009120137.2801911-15-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114410epcas5p3eada00785bc52c029f42c47ad6222466
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114410epcas5p3eada00785bc52c029f42c47ad6222466
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114410epcas5p3eada00785bc52c029f42c47ad6222466@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_044416_992574_9D91DCEA 
X-CRM114-Status: GOOD (  11.88  )
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

Add required dt node for cmu_usb block, while at this
add sysreg_usb which contains bits for DRCG and MEMCLK
which are used by clk driver

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 3dd7a4c4c609..dcf1e58c6367 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -192,6 +192,27 @@ pinctrl_cmgp: pinctrl@12030000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_usb: clock-controller@13000000 {
+			compatible = "samsung,exynos8855-cmu-usb";
+			reg = <0x13000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_USB_NOC>,
+				 <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "usb20drd";
+			samsung,sysreg = <&sysreg_usb>;
+		};
+
+		sysreg_usb: syscon@13020000 {
+			compatible = "samsung,exynos8855-usb-sysreg",
+				      "syscon";
+			reg = <0x13020000 0x10000>;
+			clocks = <&cmu_usb CLK_GOUT_SYSREG_USB>;
+		};
+
 		cmu_top: clock-controller@13900000 {
 			compatible = "samsung,exynos8855-cmu-top";
 			reg = <0x13900000 0x10000>;
-- 
2.34.1


