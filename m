Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B30C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvWZRkwj5ZFZifDJB7KBU3E1y8XyQBPZTs6Fs+MO30M=; b=j67fKFqo9sOLmUK9Odm+RJbSxf
	iOZwmmFpu915Z9d+4hgagH5as5qDujmUmTgZ9H70VpxvhZAkSsE3u5TKTlyQyHHJINK71xxkMGNRb
	yHWFeR+KZs0NN1BOMudPTa++MyWA+W69+YawBpUihim4NQKJlZnuJfYPr2BBP9PnczSuEzKX651+I
	abeGaMqso12v03rDTwO3RR0ijufWrTwqB5GOphi+qDWMuN8Hou5V+3d/NIGPtz+ru4OV784dw9aCw
	5SRTlqwU14dx5b5geZT0QpxlJe6a1x3HOuvkUziG+okkp2/seX73Bp+9pkmQ0sNpxzr7SsxSyP+HC
	31O81AkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOcd-0000000363J-2Js7;
	Fri, 08 Aug 2025 15:03:08 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOXh-0000000357w-17Dw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 14:58:02 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250808145754epoutp027074d32e55931ccfc64fd8fdab7a2291~Z0pbHQxdq0420104201epoutp02h
	for <linux-arm-kernel@lists.infradead.org>; Fri,  8 Aug 2025 14:57:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250808145754epoutp027074d32e55931ccfc64fd8fdab7a2291~Z0pbHQxdq0420104201epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754665074;
	bh=PvWZRkwj5ZFZifDJB7KBU3E1y8XyQBPZTs6Fs+MO30M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ln0yeuhNhJmjA+BqOSFETAoCJ85N/qKBQUaVTOnsJJDpiIwYBU5com9fG+E1wLZLF
	 AY9gdTiTYZIxmPeDEPO7Os3af/oyBUNvdKYkzsGaZzhuXMMS252zP3cwO9tfd4TAmZ
	 AfWCYut9LeGVE5cTNdgGXvk94M2UOlpgSu0xJ7co=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250808145753epcas5p25377633d375e26f9b62410f583ebe42b~Z0pZ5oK2z0558305583epcas5p2h;
	Fri,  8 Aug 2025 14:57:53 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bz6b44b1Bz6B9m5; Fri,  8 Aug
	2025 14:57:52 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250808141247epcas5p2c254f35146a6ea35b5c49c4316ba30a3~Z0CBUhhgv2375723757epcas5p21;
	Fri,  8 Aug 2025 14:12:47 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250808141244epsmtip25ab7207ae5593881a426a7b3625b1e65~Z0B-BJN4D1615716157epsmtip2O;
	Fri,  8 Aug 2025 14:12:44 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dev.tailor@samsung.com,
	chandan.vn@samsung.com, karthik.sun@samsung.com, raghav.s@samsung.com
Subject: [PATCH v1 3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT
 nodes
Date: Fri,  8 Aug 2025 19:51:46 +0530
Message-Id: <20250808142146.3181062-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808142146.3181062-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250808141247epcas5p2c254f35146a6ea35b5c49c4316ba30a3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250808141247epcas5p2c254f35146a6ea35b5c49c4316ba30a3
References: <20250808142146.3181062-1-raghav.s@samsung.com>
	<CGME20250808141247epcas5p2c254f35146a6ea35b5c49c4316ba30a3@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_075801_624671_A304A758 
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

Add required dt node for CMU_M2M block, which provides
clocks for M2M IP

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..086d6bbc18b8 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1454,6 +1454,19 @@ pinctrl_aud: pinctrl@1a460000 {
 			reg = <0x1a460000 0x10000>;
 		};
 
+		cmu_m2m: clock-controller@0x1a800000 {
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


