Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FB7C3ABA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwb6sfk/OTplMs5Q5TACguVNBchZ6pfP8g0wZXekkjI=; b=tvr6j4v44V+T7NslDxQzBGmbP7
	AQ7k+rYjLshe3uGOOz7AqAfsRGyNYV7ADA+YqHlaZkvg5x75s84KCbZf0CKGlpxg65xoqJiRPYaiJ
	+sWeth8bWcDX5aruoYvt8QdFZXhEBHAtqh9r+xTcKQFJJwCnbdZSIjJNh6AAbmek8DTbvaWSXEaaY
	Op12kZtFPlN7ksd5QSwOpl9WQ1I1XVd9IIjwOhiKwWKQPjgN/qpmNhcXDImmDoDS78HKilI1cOWp1
	7zKCAuYnwnZnEhaWleRH9dNGlqKyeTGeGvil23+iIweO/fQLo5KW2+Y2bgNIa0fK8NX19FaJZCtcm
	FmyaHA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NMr-00000006840-38KI;
	Mon, 28 Apr 2025 12:13:50 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MmM-00000005yny-10Ri
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:36:07 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250428113604epoutp03a27dc4a8a6f538ebcc41ad9337d37249~6eGEkETXQ1056610566epoutp03D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 11:36:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250428113604epoutp03a27dc4a8a6f538ebcc41ad9337d37249~6eGEkETXQ1056610566epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745840164;
	bh=kwb6sfk/OTplMs5Q5TACguVNBchZ6pfP8g0wZXekkjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lPpCZLDIff1q2oKnuSmDHtO8V42DTn+TP/uzSfVE/kKhA16aixdcpat8OFXEh1Fsn
	 72TvxUnRi54A7WjoVMAliNFPpKIDYyABzfZl/bl32hg8AUtEKink8qfsVt8MW+neJ4
	 ontBljpLB7D4nDpCZGsyQROo0RpTmL4nOlvWtF0o=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250428113603epcas2p13937f174d10c6c05cc45520937c39e4b~6eGD75Q4j2806628066epcas2p1Q;
	Mon, 28 Apr 2025 11:36:03 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.97]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmLxH15qcz3hhT4; Mon, 28 Apr
	2025 11:36:03 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c~6eGCaGrX92806628066epcas2p1I;
	Mon, 28 Apr 2025 11:36:01 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428113601epsmtrp1483b9611127238a5c9ac08eb6fb2dbf0~6eGCYm6R13238632386epsmtrp1G;
	Mon, 28 Apr 2025 11:36:01 +0000 (GMT)
X-AuditID: b6c32a52-f0cb424000004c16-e5-680f6821b457
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.BF.19478.1286F086; Mon, 28 Apr 2025 20:36:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428113601epsmtip1f20bfdd6b40288a13924357ae4dc7945~6eGCLAJIa2519925199epsmtip14;
	Mon, 28 Apr 2025 11:36:01 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: exynosautov920: add cpucl1/2 clock DT
 nodes
Date: Mon, 28 Apr 2025 20:35:17 +0900
Message-ID: <20250428113517.426987-5-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428113517.426987-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnK5iBn+GwYRLOhYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYjH5+FpWi6Zl65kc+D3e32hl99i0qpPNY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3
	S+DKeHFKqOAtV8XOxslsDYwnOLoYOTkkBEwkJu6exdrFyMUhJLCdUeLH5p9sEAkJicMzJjBC
	2MIS91uOQBW9Z5RYMv0ZSxcjBwebgKrEpt/yIHERgbdMEsv/H2ACaWAWOM0osfOMDIgtLOAv
	8fn5RlYQmwWo/tbOG8wgNq+AlcTr18fYQOZICMhL9HdIgIQ5BawlPl1cB1YiBFQy4fEZNohy
	QYmTM5+wQIyXl2jeOpt5AqPALCSpWUhSCxiZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIE
	x4VW0A7GZev/6h1iZOJgPMQowcGsJMJbZcCfIcSbklhZlVqUH19UmpNafIhRmoNFSZxXOacz
	RUggPbEkNTs1tSC1CCbLxMEp1cBkeOLauWO6Z2yq+ma0sYRtsOo1/HnWS8zWcoHAOfUZ+RxX
	Quos2wQ37V359oyt4OSzi0T5wjc90Ft40YinNWpS0L2i8mj2FkHNP3an7sXmb3i7yvJJxdz1
	S2Z4RaafuLMhu7t/huq+nWkrOGZ9eHZIs0ytL4+bJV19b/WRWu64bCn+Utn+d/a3b9XsquQ4
	vfDo7IC5Iezt25yS5nf4vGYOl9g2a89+g6eaz5zrlZeedM6buLjGtkeTIUXH7tteKc6Pya8j
	gucf63929sYThlldxezz3spJlguJdstwT5l48qeb14aVFzieL/Q8vZtnhcu0sypBhyTYg9sl
	dabJxB9em3dyuqfQO59ZN79v3btPiaU4I9FQi7moOBEA1wK8afoCAAA=
X-CMS-MailID: 20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c
References: <20250428113517.426987-1-shin.son@samsung.com>
	<CGME20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_043606_584337_E541371F 
X-CRM114-Status: GOOD (  13.62  )
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

Add cmu_cpucl1/2(CPU Cluster 1 and CPU Cluster 2) clocks
for switch, cluster domains respectively.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 9350c53f935e..2cb8041c8a9f 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1090,6 +1090,32 @@ cmu_cpucl0: clock-controller@1ec00000 {
 				      "cluster",
 				      "dbg";
 		};
+
+		cmu_cpucl1: clock-controller@1ed00000 {
+			compatible = "samsung,exynosautov920-cmu-cpucl1";
+			reg = <0x1ed00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL1_SWITCH>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL1_CLUSTER>;
+			clock-names = "oscclk",
+				      "switch",
+				      "cluster";
+		};
+
+		cmu_cpucl2: clock-controller@1ee00000 {
+			compatible = "samsung,exynosautov920-cmu-cpucl2";
+			reg = <0x1ee00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL2_SWITCH>,
+				 <&cmu_top DOUT_CLKCMU_CPUCL2_CLUSTER>;
+			clock-names = "oscclk",
+				      "switch",
+				      "cluster";
+		};
 	};
 
 	timer {
-- 
2.49.0


