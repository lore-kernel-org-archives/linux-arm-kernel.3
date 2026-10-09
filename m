Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3453CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWkaG3M1ybkYTdaWSTR7V1saFfsOuJsMAGwFO7f5RRE=; b=UNnELWdrGWt2bqKIVTpt751vMd
	sYGe685JUxdmE4Ic+Vg9Dj2cH6bZfZ/3t/DI9aiA3/HcV9REZprN6xViacJq77uH0aZ6rsGP07xS2
	79gymWJNxvUP7ZWU909pv3Fr0WCOzUYAbmlBw30kAykNbz4YSK/qRaXrDTQjLy44zmXMKb/G6mlli
	mag9bh7SMi7KSzQNGdyxvOSFuq2tbgqN/papPcy+IicSnpuY/dT1LDx5aHgZytMYDgBfHdZZw87OJ
	v0ZcZEkgU0/dM0fUfYt/6spky7Bzr6uHaee5jcaKlG3N4pyDZjkxlEdVexpfDl+yvxeF+FuZI6wvx
	Nq4+EKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF91S-00000006Cw7-1yaP;
	Fri, 09 Oct 2026 11:44:22 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF91J-00000006Cgh-1zTa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:44:16 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261009114410epoutp0223110b850fc64beb2a94f59772c93954~c2dKw4aYk1721317213epoutp02g
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:44:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261009114410epoutp0223110b850fc64beb2a94f59772c93954~c2dKw4aYk1721317213epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546250;
	bh=tWkaG3M1ybkYTdaWSTR7V1saFfsOuJsMAGwFO7f5RRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=axMGCz0KPCMOg2qWrGHwIcVhpJZHz9Q/SVZYIROa1TLWNz5EyBe4U6xDsAmt+XfOa
	 euYMy4i9iIofjZdeOhE95tSd+0zrVwsU1zrzX8aiAFmkYHhLOZkZFSSlYbLVNk8iu3
	 RX3LBA9/yz5R+5r6J2JzMbiKwxz722WsfoDGr3O8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261009114410epcas5p39115d141968c5104cab01f9d308c96bc~c2dKKkU020308303083epcas5p3G;
	Fri,  9 Oct 2026 11:44:10 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j1Q4T0wCSz6B9m7; Fri,  9 Oct
	2026 11:44:09 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261009114408epcas5p343508b4fd7022f917fcdda74e58ab154~c2dIWCu-C0308303083epcas5p3D;
	Fri,  9 Oct 2026 11:44:08 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114405epsmtip257f486d0868423adda5142a5b734251f~c2dFmPQOI0916809168epsmtip2e;
	Fri,  9 Oct 2026 11:44:05 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 13/14] arm64: dts: exynos8855: add cmu_hsi clock DT nodes
Date: Fri,  9 Oct 2026 17:31:36 +0530
Message-Id: <20261009120137.2801911-14-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114408epcas5p343508b4fd7022f917fcdda74e58ab154
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114408epcas5p343508b4fd7022f917fcdda74e58ab154
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114408epcas5p343508b4fd7022f917fcdda74e58ab154@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_044413_861848_E7800A81 
X-CRM114-Status: GOOD (  12.17  )
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

Add required dt node for cmu_hsi block, while at it add
sysreg_hsi node which contians bits for DRCG and MEMCLK
which are used by clock driver

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index b461de6a7548..3dd7a4c4c609 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
 			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi: clock-controller@17000000 {
+			compatible = "samsung,exynos8855-cmu-hsi";
+			reg = <0x17000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_HSI_NOC>,
+				 <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "ufs_embd";
+			samsung,sysreg = <&sysreg_hsi>;
+		};
+
+		sysreg_hsi: syscon@17020000 {
+			compatible = "samsung,exynos8855-hsi-sysreg",
+				      "syscon";
+			reg = <0x17020000 0x10000>;
+			clocks = <&cmu_hsi CLK_GOUT_SYSREG_HSI>;
+		};
+
 		pinctrl_hsi_ufs: pinctrl@17040000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x17040000 0x1000>;
-- 
2.34.1


