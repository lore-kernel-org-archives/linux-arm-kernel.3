Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E227CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZjO/7aUY2BQ0jofA/G8I/j0xLETJuzN3cVoRjzP220=; b=LkuF2t+lwfZLQ5juBVm2mzxwjK
	akpm0YQSCQJEfbZpsvlWBMu0rCchgsyoS6ekrgL27+9IUjmohjUhWZzJ/BMqnEo6ps00bMpqrL7UQ
	ZidhS/1OiWv+SjLSVuWWYArS/gQaxAXaNFPNCqmGUV3QO36q9rVZzTYqb93x6opzLKwTZ2hlekkso
	RRc/sRrWZYwZsz7H2eNsK5MbNHMvuS1h6dhcY+jTA4YGs8Xjsg+s6m9efxZorqKq8iTC/vfMbC4kM
	r4/SjTRdFOa0KdESfwG9ayKpB1E4Y/1P93M7dRX+4XfSIXAbUdFC2XUYZKLROvEUH8u/fJnAX0Qd7
	XtrJe+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2349-0000000GrxC-2kIg;
	Fri, 26 Sep 2025 07:40:29 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2345-0000000Grq0-0m7Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 07:40:26 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250926074023epoutp032bacf1a4aa50c1f33247d668e33ce532~oxSZmnQzk1448814488epoutp03P
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:40:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250926074023epoutp032bacf1a4aa50c1f33247d668e33ce532~oxSZmnQzk1448814488epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758872423;
	bh=aZjO/7aUY2BQ0jofA/G8I/j0xLETJuzN3cVoRjzP220=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lAgR5Ux2j98meDZ1r60coZPkzQ9W4ZHeb+8/Y68Lb1BIKsfQHVGl3UGkbr/RAHj4w
	 UkQI7PIN0at7S4pa0qcsGdqIGueLk4AaYH64/msi76VS/wMCYPP2fH9bZ7q/Z3mwFP
	 WLTBkBwjMgB5OuibxjzfYbvxVdzK+/46+6S1TiOI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250926074022epcas2p387dc5ee0d8c4676e7236c804746ceeca~oxSY5OMK61530715307epcas2p3q;
	Fri, 26 Sep 2025 07:40:22 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cY2Yd6GH7z2SSKg; Fri, 26 Sep
	2025 07:40:21 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250926074021epcas2p36a8dc02c84c9ca11e2318a1a8931d68a~oxSXvVrYl2057720577epcas2p3b;
	Fri, 26 Sep 2025 07:40:21 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250926074021epsmtip2d9a38292d8fdfabc0655d0e0ed648b74~oxSXmH4d41194111941epsmtip2r;
	Fri, 26 Sep 2025 07:40:21 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org, m.szyprowski@samsung.com,
	jh80.chung@samsung.com, shradha.t@samsung.com
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	sh86.bae@samsung.com
Subject: [PATCH 3/4] arm64: dts: ExynosAutov920: add PCIe PHY DT nodes
Date: Fri, 26 Sep 2025 16:39:18 +0900
Message-ID: <20250926073921.1000866-4-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250926073921.1000866-1-sh86.bae@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250926074021epcas2p36a8dc02c84c9ca11e2318a1a8931d68a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926074021epcas2p36a8dc02c84c9ca11e2318a1a8931d68a
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
	<CGME20250926074021epcas2p36a8dc02c84c9ca11e2318a1a8931d68a@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_004025_550732_B997BDBC 
X-CRM114-Status: GOOD (  11.33  )
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

Add pcie_4l_phy, pcie_2l_phy dt node for all PCIe PHY instances
in ExynosAutov920 SoC.

Add HSI sysreg to control PCIe sysreg registers.

Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..9e45bfcd7980 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1021,12 +1021,40 @@ cmu_hsi0: clock-controller@16000000 {
 				      "noc";
 		};
 
+		syscon_hsi0: syscon@16030000 {
+			compatible = "samsung,exynosautov920-hsi0-sysreg",
+				     "syscon";
+			reg = <0x16030000 0x1000>;
+		};
+
 		pinctrl_hsi0: pinctrl@16040000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16040000 0x10000>;
 			interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pcie_2l_phy: pcie-phy2l@161c6000{
+			compatible = "samsung,exynosautov920-pcie-phy";
+			reg = <0x161c6000 0x2000>,
+			      <0x161d0000 0xb000>;
+			#phy-cells = <0>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			samsung,fsys-sysreg = <&syscon_hsi0>;
+			num-lanes = <2>;
+			status = "disabled";
+		};
+
+		pcie_4l_phy: pcie-phy4l@163c6000{
+			compatible = "samsung,exynosautov920-pcie-phy";
+			reg = <0x163c6000 0x2000>,
+			      <0x163d0000 0xb000>;
+			#phy-cells = <0>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			samsung,fsys-sysreg = <&syscon_hsi0>;
+			num-lanes = <4>;
+			status = "disabled";
+		};
+
 		cmu_hsi1: clock-controller@16400000 {
 			compatible = "samsung,exynosautov920-cmu-hsi1";
 			reg = <0x16400000 0x8000>;
-- 
2.45.2


