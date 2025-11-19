Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4CCCF31AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcQiGlovkeFcjFc5JZjlVmKquIqKzeXBNrL2Z5Uqv8g=; b=lmeg1LE13HEgGFe8oIaLvRVyTZ
	idM6ODk3GcyjN4l8e4uw4ruln6bL6uyOsnnUN5AhpEHtixeX1ksJwnJUKBNlmkQUic080wP+SGV3w
	iavrp88j3G6nrzxKdfprDbXhmnmRXhHXWfk8RhBBphpUjbLYoL1Dxz5q3fDDi+CWzlZHFtHySwswg
	gBrTbjvezWpM1DSFKounRj7W2yqJbzdoX4SR+ysIOmux1oyQajJ5B9wSiYbra26cXXDMVgOg0Z3hU
	LWUFeDKpo5j1gugZfr3+UWZvwNCXuVrrXJw3i3O8Dcmph1O3gPbGGJYZlfYTi6NFMFSuG0IDLnWaS
	OSpR1OBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgXL-0000000330J-02g8;
	Wed, 19 Nov 2025 11:39:47 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgXI-000000032y6-1epR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:39:45 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251119113938epoutp01e13b6d28d7d83d6b7026684f77060fbe~5ZYtw0bdz1952319523epoutp01C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 11:39:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251119113938epoutp01e13b6d28d7d83d6b7026684f77060fbe~5ZYtw0bdz1952319523epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763552378;
	bh=CcQiGlovkeFcjFc5JZjlVmKquIqKzeXBNrL2Z5Uqv8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E5MA3Nybls5NWTKxKJJrK7YLDq/pPmKZ85LiwBgcVMNz8qRbMADITrqCUt6vFIpL+
	 8PH3urBGxw53s+Fs93APcFMVzCNdBNslCUEN9zpZJNBHcidoOPeVyQrmfx8Dqsp8FT
	 dMSaR3ODckgopnJwd2hB2frinp8rFGgzGK+fX0dk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251119113937epcas5p43f50181cd74baf3daf44533219033400~5ZYs3nd322804328043epcas5p4X;
	Wed, 19 Nov 2025 11:39:37 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dBKJm5DwVz6B9m5; Wed, 19 Nov
	2025 11:39:36 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251119113935epcas5p33c4cac5a961ce334bde5988ef74b09ed~5ZYrC1mxs0938209382epcas5p3B;
	Wed, 19 Nov 2025 11:39:35 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119113931epsmtip1c63488c77b1b53387ef8149f3ec9e37c~5ZYmxJzlr0166601666epsmtip1U;
	Wed, 19 Nov 2025 11:39:31 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH 3/3] arm64: dts: exynosautov920: add CMU_MFD clock DT nodes
Date: Wed, 19 Nov 2025 17:17:44 +0530
Message-Id: <20251119114744.1914416-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119114744.1914416-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251119113935epcas5p33c4cac5a961ce334bde5988ef74b09ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119113935epcas5p33c4cac5a961ce334bde5988ef74b09ed
References: <20251119114744.1914416-1-raghav.s@samsung.com>
	<CGME20251119113935epcas5p33c4cac5a961ce334bde5988ef74b09ed@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_033944_602392_DFD5D1A0 
X-CRM114-Status: GOOD (  14.71  )
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

Add required dt node for cmu_mfd block, which provides
clocks for MFD IP

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 6ee74d260776..02bf2ca52fdc 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1462,6 +1462,17 @@ cmu_mfc: clock-controller@19c00000 {
 				      "wfd";
 		};
 
+		cmu_mfd: clock-controller@19e00000 {
+			compatible = "samsung,exynosautov920-cmu-mfd";
+			reg = <0x19e00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_MFD_NOC>;
+			clock-names = "oscclk",
+				      "noc";
+		};
+
 		pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
-- 
2.34.1


