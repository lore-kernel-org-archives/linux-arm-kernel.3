Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13A8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aprxRbYtZUgT14V1ldVJXfUniZKweln6d8PJOcyQRPI=; b=O/MoOyvB4VaVJgxxnUWv2BUxoG
	kdhrSR1FHlyyRbRz3lEtqMmixSnrV/amXCLSWQHlHjN+0mUcKfTm0aoBv6QpU3leX2IoGlCjnOsm4
	qdR7Pg5RagamJxBW20iCH91qWCbW79zlUb3B/jvUJeySlTAZWWrQ6n8MMUX1g7ZllMM0zBC/5GkLC
	fJtSZEIU6dk/Y6ljtdODdgRhE9h97x4V1qXypmn2bYGPQm2C5W7J0QPnHP2KmLbdKmmyYbuk/kBTS
	SSS+VRFodSU6wmaPDUWDU7KX8e5VNkGFTuN2GFtyi0GgcFOf/fxXcPYyV+yAEJWfmUwJCPD14WngJ
	AM8sa0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fFt-0000000FGhX-3P9p;
	Fri, 18 Apr 2025 06:31:17 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5f0W-0000000FEjL-1xo4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:15:27 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250418061517epoutp0474cd600510d4b16f7e7be32c36093485~3VRI1Hsi51837718377epoutp04Y
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:15:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250418061517epoutp0474cd600510d4b16f7e7be32c36093485~3VRI1Hsi51837718377epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744956917;
	bh=aprxRbYtZUgT14V1ldVJXfUniZKweln6d8PJOcyQRPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l96kI/HA+/nGMwQgnhxnCS7ssD5dQcb8Mw7wNakMgGjrCVNkRo6B5fXbBjmz5/BnI
	 oN8wHDSt0+8g7qoOjtdXmYA8qBP+BHncD2Ld/9zlefUPvR7xRTJ6qQV43eW7LOxTHe
	 oKSJTqcrbgEhUJvvtAqVJ8hXkfLxdGBl35UBN1/A=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250418061516epcas2p28e6360f3275261b0a94b81b5b23e5b6c~3VRIGdylb2985129851epcas2p2v;
	Fri, 18 Apr 2025 06:15:16 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.69]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zf4Hm15wzz3hhTQ; Fri, 18 Apr
	2025 06:15:16 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250418061515epcas2p4b57102967b07d665051a6297ab451a3c~3VRHC5SAh1705317053epcas2p4G;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250418061515epsmtrp2c0ae88fd3cdaf7ba493614b214ef55be~3VRHCAeOk0714207142epsmtrp24;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-2a-6801edf39277
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	03.69.19478.3FDE1086; Fri, 18 Apr 2025 15:15:15 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250418061515epsmtip1f43ce5fffd017095a3771ce1c5ea011c~3VRGwVB420416704167epsmtip1w;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: exynosautov920: add cpucl0 clock DT nodes
Date: Fri, 18 Apr 2025 15:15:00 +0900
Message-ID: <20250418061500.1629200-4-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418061500.1629200-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWy7bCSnO7nt4wZBhcnCFg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji8Xk42tZLZqWrWdy4Pd4f6OV3WPTqk42j81L6j36tqxi9Pi8SS6ANYrLJiU1J7MstUjf
	LoEro312F3PBEY6KafcvsjUwfmPrYuTkkBAwkXh7dzt7FyMXh5DAdkaJ93fvsEAkJCQOz5jA
	CGELS9xvOcIKUfSeUaLt3wqgIg4ONgFViU2/5UHiIgJvmSSW/z/ABNLALHCaUWLnGRmQGmEB
	L4m3K0RAwixA5dvfXWMGsXkFrCVWHNnKBFIiISAv0d8hARLmFLCRWLpvFhtIWAioZOGLOohq
	QYmTM5+wQAyXl2jeOpt5AqPALCSpWUhSCxiZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIE
	R4VW0A7GZev/6h1iZOJgPMQowcGsJMJ7zvxfuhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe5ZzO
	FCGB9MSS1OzU1ILUIpgsEwenVAPTumTp1X+CLvr18N/Uul3Xp/n4z/8vWvKN8ck+Z06K68/Y
	t527au8v9n7LwnNtin8Mt7Z31acxNpid+zh5zQOn2xOfXmMR2ZV0jPXI9/6/z658vSQl+urS
	pxV2Sptj0kRqPBgT1CbO2d8d9biwfvvT4zP4NZNNOScFXVu+7TqL/k6ZlTUust7m2V9WXEgM
	PqF59sLrZd8O1vHd5Y24cm2PKUty94rjXk2F/YcuXxG/byd7efFxBtPNFoenZ9h0f7v/PNBn
	yt6S8rS89vNKmfbNfY2r0z+Y/PkW/eZFpe2nOamnr3xZHJP5ck/F4469f1wfht1eLJclZvi/
	/P+SjQXzD/K6uLZ91V6y5kaAd+VDQyWW4oxEQy3mouJEAL/9fE/5AgAA
X-CMS-MailID: 20250418061515epcas2p4b57102967b07d665051a6297ab451a3c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250418061515epcas2p4b57102967b07d665051a6297ab451a3c
References: <20250418061500.1629200-1-shin.son@samsung.com>
	<CGME20250418061515epcas2p4b57102967b07d665051a6297ab451a3c@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_231525_241155_5A1437A3 
X-CRM114-Status: GOOD (  13.60  )
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

Add cmu_cpucl0 clocks for switch, cluster, and dbg domains respectively.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index fc6ac531d597..d1528633adfe 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -582,6 +582,21 @@ pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
 		};
+
+		cmu_cpucl0: clock-controller@1ec00000 {
+			compatible = "samsung,exynosautov920-cmu-cpucl0";
+			reg = <0x1EC00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				<&cmu_top DOUT_CLKCMU_CPUCL0_SWITCH>,
+				<&cmu_top DOUT_CLKCMU_CPUCL0_CLUSTER>,
+				<&cmu_top DOUT_CLKCMU_CPUCL0_DBG>;
+			clock-names = "oscclk",
+				      "switch",
+				      "cluster",
+				      "dbg";
+		};
 	};
 
 	timer {
-- 
2.49.0


