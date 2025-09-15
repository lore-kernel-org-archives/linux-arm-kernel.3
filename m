Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DA8CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5Qx2f0DAcTaHN6YlDlV7lx8gsTEB7rVcts4fMiiACk=; b=N8q/i8SXX75FTH04gxLBld0PU1
	FXhjWfriTmFNB0gwyTMiHf/6tOQUSiLqMa09VCyQrB19ePWFJe7W+D4A0jkDbfIuRwXRXmyKrTI73
	4O54kRPgWrzrZSqBBiiLGDio+TklIkyskjizNQC9HSMiqrvZmaRR/QjXNLjsEYtXjzSu8eXZOYuid
	7VxvrEAmRSIMErEclX/7F92wX30iKnwS/2w/MNQ+gq6iRfZsqdOo6YijtF4e8+g90s2ppjklPbwX2
	/zgOM/D6y8i+Gd5/4CwNJxg/z9LgywBu/N6s9ZqtwyUNTNwskr/dcZh8yNCEilTl6UEt+EhnIIcdF
	nZKeOV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5m5-00000003Vqj-20Si;
	Mon, 15 Sep 2025 09:45:29 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5m2-00000003Vn7-2Qj6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:45:28 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250915094520epoutp037fa260171376a89a6fb1e7a9948b9437~la5WlkVMo1047310473epoutp035
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:45:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250915094520epoutp037fa260171376a89a6fb1e7a9948b9437~la5WlkVMo1047310473epoutp035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757929520;
	bh=h5Qx2f0DAcTaHN6YlDlV7lx8gsTEB7rVcts4fMiiACk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cTJSmhRLMtP8b8BOGBcMx2tZ2tOw+fUh35mjxm6zUAfliXjVXn+slfGJpNm9rpksG
	 vxmAAoeqei4OVjFdq03/UvywCOsZmYg0FsMYw7SGJ4lZlbMHxNDDencsh2noerd3oE
	 z7tXwGD7m0UyM01lKgeQ3Fy08ofnHfmY2gBnSc0A=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250915094519epcas5p49dcc9ee8e9c917923c7bcfd996043832~la5V97V5y1185011850epcas5p4F;
	Mon, 15 Sep 2025 09:45:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cQKrt2nS9z6B9m8; Mon, 15 Sep
	2025 09:45:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc~la5UiVNol1637416374epcas5p2o;
	Mon, 15 Sep 2025 09:45:17 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250915094515epsmtip24dc5a7988d4add454ce9185519ae6d2d~la5SLhp3X0834508345epsmtip2S;
	Mon, 15 Sep 2025 09:45:15 +0000 (GMT)
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
Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT
 nodes
Date: Mon, 15 Sep 2025 15:24:01 +0530
Message-Id: <20250915095401.3699849-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915095401.3699849-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc
References: <20250915095401.3699849-1-raghav.s@samsung.com>
	<CGME20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_024526_935379_AD5ACEDB 
X-CRM114-Status: GOOD (  12.29  )
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

Add required dt node for CMU_M2M block, which provides
clocks for M2M IP

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..d19d71faa6f8 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1454,6 +1454,19 @@ pinctrl_aud: pinctrl@1a460000 {
 			reg = <0x1a460000 0x10000>;
 		};
 
+		cmu_m2m: clock-controller@1a800000 {
+			compatible = "samsung,exynosautov920-cmu-m2m";
+			reg = <0x1a800000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_M2M_NOC>,
+				 <&cmu_top DOUT_CLKCMU_M2M_JPEG>;
+			clock-names = "oscclk",
+				      "noc",
+				      "jpeg";
+		};
+
 		cmu_cpucl0: clock-controller@1ec00000 {
 			compatible = "samsung,exynosautov920-cmu-cpucl0";
 			reg = <0x1ec00000 0x8000>;
-- 
2.34.1


