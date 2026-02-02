Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EC0E73153
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5htzmMZnoeY2yIF5viAB9yj8dKEIv03rbGoWVocn2jw=; b=tqqM2apvf0tBor9PJs3/+UlSrV
	1Y0WSLP/AhP6ZMSNKmcAc60Q/txOQuIyzmtNDXjC5StKyWBSbAoqPhV7dkD+8R/6dP+o7xsaIncpL
	Nhm12dqkTPvoka2iMWLgJeT+EIZZdpfo4ESF2Biv0ncKcQfhcuXHebf9y4ED74IFmMVFgVLTor1Zv
	+N6O+e4+D55bzp3bpc2s/784BYbZ6IQ/VrHvG1+i4sQUFyHe3jLbO8j5dw7JnP9VQNAmJgx+Wkxod
	0LDAK/MS2YViOgUkWhmsWjGkdKZCccZcBjUXfJ44hXYyqi1sI1E7V+zkQ3KoyWbLz4vBiqo2xeWWH
	UWqi1CeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr2V-00000004npQ-0RWp;
	Mon, 02 Feb 2026 10:20:15 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr2S-00000004nmo-0m7L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:20:13 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260202102004epoutp0142cef1e2535fad201cdc448df00a3881~QZrpUwjfT2808828088epoutp01R
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Feb 2026 10:20:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260202102004epoutp0142cef1e2535fad201cdc448df00a3881~QZrpUwjfT2808828088epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770027604;
	bh=5htzmMZnoeY2yIF5viAB9yj8dKEIv03rbGoWVocn2jw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A2RJO0gqV8m6L+htvPr6ahwCgTAiKZOCIDaSSTOoGayI75IQuI8Vb/sHM+UH3xqRz
	 YllWK2cxMW+GyvGZGOW2MYr0NwbLX+T3MeVjh2871VX4rbUCc2iLI2FgJ66Rw4yXL4
	 1GKqObqTjZm3TNkHMygFBn4If+XGxosewjXxsrnk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260202102003epcas5p295ecbd8cdb3e834b93b90dc33f446d56~QZroy1Hdn0827108271epcas5p2W;
	Mon,  2 Feb 2026 10:20:03 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4f4N0L3WnRz3hhT4; Mon,  2 Feb
	2026 10:20:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260202102001epcas5p4ebe15ce1cec50c6ca024464ffdbe9d79~QZrnUgw2Z1862618626epcas5p44;
	Mon,  2 Feb 2026 10:20:01 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260202101957epsmtip1e09470b86119a79abd6a8782573d0112~QZrjm2sU61774317743epsmtip1T;
	Mon,  2 Feb 2026 10:19:57 +0000 (GMT)
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
Subject: [PATCH 3/3] arm64: dts: exynosautov920: add CMU_G3D clock DT nodes
Date: Mon,  2 Feb 2026 16:05:55 +0530
Message-Id: <20260202103555.2089376-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202103555.2089376-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260202102001epcas5p4ebe15ce1cec50c6ca024464ffdbe9d79
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260202102001epcas5p4ebe15ce1cec50c6ca024464ffdbe9d79
References: <20260202103555.2089376-1-raghav.s@samsung.com>
	<CGME20260202102001epcas5p4ebe15ce1cec50c6ca024464ffdbe9d79@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_022012_437569_DC8C6779 
X-CRM114-Status: GOOD (  15.11  )
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

Add required dt node for cmu_g3d block, which provides
clocks for G3D IP

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 02bf2ca52fdc..0bf7c4cb9846 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1473,6 +1473,19 @@ cmu_mfd: clock-controller@19e00000 {
 				      "noc";
 		};
 
+		cmu_g3d: clock-controller@1a000000 {
+			compatible = "samsung,exynosautov920-cmu-g3d";
+			reg = <0x1a000000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_G3D_SWITCH>,
+				 <&cmu_top DOUT_CLKCMU_G3D_NOCP>;
+			clock-names = "oscclk",
+				      "switch",
+				      "nocp";
+		};
+
 		pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
-- 
2.34.1


