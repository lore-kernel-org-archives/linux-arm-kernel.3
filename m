Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F6BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MuKqCTX8wUc8D0yWHLuHtbxhtT0zWIl/VKBsnrZrL4=; b=OxpsS2SCPx0oNtigme2b8scpZx
	Ou1GiCn3nJGD6ygWRp5VRKt1Ja9dwmnBSwnWi2DziQhkLg2dQH0lcWKEZ19oEeXlUYzJHsnYX1raG
	/jq3WOP1Lz3Fh1JPGtWpJkV9tHd9mGQIshlZSmhfCZwOvPa80JjmmLRcORbBHDhxURlBp7J+Y23IT
	Gj8FDNOp91ma10sDsbzQKb/ADPNTylAvexCQw2a4TknMMH5qJ+9NUG39xORokviIlTJ/pRdduPXcR
	q0NOVXzhT8OAEjlov1rtAfbDvroQEwipDouX38SCRQMJdYnOYxhIZJKGkxt+Xy9/3EWAR1zx4fey6
	+vDfktRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogNd-000000058kD-10hZ;
	Tue, 28 Jul 2026 11:53:53 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogN8-000000058QN-39lR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:53:24 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260728115320epoutp04ab52f058b674fe912c991eda76ba8d27~GcfU2bo5X3133131331epoutp04p
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:53:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260728115320epoutp04ab52f058b674fe912c991eda76ba8d27~GcfU2bo5X3133131331epoutp04p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239600;
	bh=3MuKqCTX8wUc8D0yWHLuHtbxhtT0zWIl/VKBsnrZrL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DD05TOWgEJS7Jcm6fMBwj1lZP647Wkr5GiQ/udCPp07FG71KuPsd/3UfCSWcRRJJh
	 OD3vTzIfJlUOZJrbeldi/i9CJIU7HNzRC5xGzJoNABI6s9hdD2sO4L+Za4pscp1Px2
	 1yw/XPK69dOIyUpsQJuvAWb9QuQGPOBKFtA0lzHE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260728115319epcas5p219e868ea0c3cfe9567a69bce15e8f2ff~GcfT41o4a0977209772epcas5p29;
	Tue, 28 Jul 2026 11:53:19 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4h8Ykk1T3wz6B9m4; Tue, 28 Jul
	2026 11:53:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115317epcas5p1ddf7db929ab923b9c22cf1a455edcb0f~GcfSiiO412742927429epcas5p1B;
	Tue, 28 Jul 2026 11:53:17 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115314epsmtip18673c55f782880caf86086b70994b1e9~GcfPdAe3y2345623456epsmtip1f;
	Tue, 28 Jul 2026 11:53:14 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 10/13] arm64: dts: exynos8855: add cmu_hsi clock DT nodes
Date: Tue, 28 Jul 2026 17:41:08 +0530
Message-Id: <20260728121111.2077860-11-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115317epcas5p1ddf7db929ab923b9c22cf1a455edcb0f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115317epcas5p1ddf7db929ab923b9c22cf1a455edcb0f
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115317epcas5p1ddf7db929ab923b9c22cf1a455edcb0f@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_045322_972957_17D78795 
X-CRM114-Status: GOOD (  11.93  )
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

Add required dt node for cmu_hsi block

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index a8f5ff0a7f1a..ad66eda62e31 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -220,6 +220,19 @@ pinctrl_pericmmc: pinctrl@154f0000 {
 			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi: clock-controller@17000000 {
+			compatible = "samsung,exynos8855-cmu-hsi";
+			reg = <0x17000000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_HSI_NOC>,
+				 <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "ufs_embd";
+		};
+
 		pinctrl_hsi_ufs: pinctrl@17040000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x17040000 0x1000>;
-- 
2.34.1


