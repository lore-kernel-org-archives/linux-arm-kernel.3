Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72097C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGdFgKVHT5d7trumovJAx3ZEYhB41GpI+KF8NOCrb0A=; b=Y/rTIs8Da97XSPG8k/wrZ2Z+aU
	SVvdZvCIqQ18heGmrkPXXgj88xXCNkjR5fvhRFj3BIm//2JwSzaWQkFseLD+yM9pWp95uH6P3F1hY
	cmPLOypYCxWZaIsARlJ4aonj4SmJTM4mGhp5HfK30k5Na3wWokAJtOdLiVk3aQo5PEI2J5zGYNSS+
	DWlyV4j5tED7LFXXYtbdpUod2+YvfmuUa9A37Dd67/GeG7yqzZ821p1xQnJN1DVWoZvnvgT1SzcxH
	PjdfNjP7UWQOih9mnUaCzzA4hICoPO2ixPtlEpLjXsJVPeZ2iWNjM1xq6Nmmfgx94TiIvYV/3T2lz
	N/FDd11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogNd-000000058lF-2wIB;
	Tue, 28 Jul 2026 11:53:53 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogNI-000000058Zy-1LP1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:53:33 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260728115330epoutp03459735e4b7c9cf6f54a8931bd66689dc~GcfeI47WA2105521055epoutp03K
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:53:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260728115330epoutp03459735e4b7c9cf6f54a8931bd66689dc~GcfeI47WA2105521055epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239610;
	bh=nGdFgKVHT5d7trumovJAx3ZEYhB41GpI+KF8NOCrb0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l7+siXatWjNuBiOmvgGysgieqTaqhy+0Hwezvdsy7Zqt7pALfKvJf3yz2t5LNDSHw
	 reFIYsxUXLDO7ra/XwYVK9i0G+hmpHqyL+LYQVARuOyNjLwLtMmYhQpH09QpLklBTh
	 UKWgmofSf+JPL/pDEoxSB3s6rZ91yjKD1dV/gA+A=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260728115329epcas5p3421e42f3c745c65280f1c24dfd7e9df6~GcfdPpHlm3026330263epcas5p3v;
	Tue, 28 Jul 2026 11:53:29 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8Ykw1Dd7z2SSKd; Tue, 28 Jul
	2026 11:53:28 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260728115326epcas5p333e4a5d4d0777a1d064565b5c2c400d3~Gcfa3a2wA1872318723epcas5p37;
	Tue, 28 Jul 2026 11:53:26 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115324epsmtip145b72fcbda2f5a399b462edbb25a80c0~GcfYapAD32235622356epsmtip1i;
	Tue, 28 Jul 2026 11:53:23 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 13/13] arm64: dts: exynos8855: add cmu_usb clock DT nodes
Date: Tue, 28 Jul 2026 17:41:11 +0530
Message-Id: <20260728121111.2077860-14-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115326epcas5p333e4a5d4d0777a1d064565b5c2c400d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115326epcas5p333e4a5d4d0777a1d064565b5c2c400d3
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115326epcas5p333e4a5d4d0777a1d064565b5c2c400d3@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_045332_520403_EC58EFC3 
X-CRM114-Status: GOOD (  11.82  )
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

Add required dt node for cmu_usb block

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index ad66eda62e31..040ca9afe8e6 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -179,6 +179,19 @@ pinctrl_cmgp: pinctrl@12030000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_usb: clock-controller@13000000 {
+			compatible = "samsung,exynos8855-cmu-usb";
+			reg = <0x13000000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_USB_NOC>,
+				 <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "usb20drd";
+		};
+
 		cmu_top: clock-controller@13900000 {
 			compatible = "samsung,exynos8855-cmu-top";
 			reg = <0x13900000 0x8000>;
-- 
2.34.1


