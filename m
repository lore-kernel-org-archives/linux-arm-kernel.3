Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE00BC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwb6sfk/OTplMs5Q5TACguVNBchZ6pfP8g0wZXekkjI=; b=3W60iAMoFx2xqvTA25Az0jwA3p
	2DI9mwU0r1GTWn0pHkHx51sTS5HtNPZt5y5UPjskhCWdCexvE/fyGdmx7DHChJYp385mBDA7ViMnT
	4EGnr6nf2jJ/QPA6rZs6dM6J3Ml/xNbvzSCgefH1EN8uOzFsqf/JuVcsPvqSSIj8rp4Y8cUPAwqES
	5pkji4Yu4jG5rjHvH93s+bCvv+8dYx5WFnuBZSz/KLrSM4sYchVXDS4CHoA2EQhs/4xAxxQyaxEPa
	LsghO2p0kO4/dxUdp8jf6oa+7iEXrxmIDr/iFSO0mkK8NM6MTIEgX3Z1+9+N5vV8w4/IdRQyebcmu
	xY0f/rOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KV9-00000005YZZ-0Iad;
	Mon, 28 Apr 2025 09:10:11 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K9J-00000005Vfl-2MrQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:47:40 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250428084730epoutp044d4b7c8cd9779e177268d10f8d20b91e~6by5Z3Fvv2679726797epoutp04R
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 08:47:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250428084730epoutp044d4b7c8cd9779e177268d10f8d20b91e~6by5Z3Fvv2679726797epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745830050;
	bh=kwb6sfk/OTplMs5Q5TACguVNBchZ6pfP8g0wZXekkjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FtWP69PJmEYKxMEkxF1kxz7LVhM9oGKF/8DK7HZxgvOkQQn+FgQlnsEqCW+06W4j+
	 QncPE5D44wKiI14CIwxC2fcj1V1yCgejGmAnGsDExLnZEuKODA9U7oyubL0yXCQA7Z
	 jewE/aGHVv50mBWmEAq6RSSXS1kD8znWW6QTX86o=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250428084729epcas2p47daf637f98853b875a65d0910ebc72e6~6by427dZC0662806628epcas2p4z;
	Mon, 28 Apr 2025 08:47:29 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZmHBn2n6Mz6B9m7; Mon, 28 Apr
	2025 08:47:29 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250428084728epcas2p1d293e6a40eae00465c6b2f5f037dbfef~6by32lK6f0605306053epcas2p1q;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428084728epsmtrp2bfe7deabe0f8a74a1e52e70d4ff5330a~6by3zmG6z1061810618epsmtrp2G;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-cd-680f40a0f99b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E3.CF.19478.0A04F086; Mon, 28 Apr 2025 17:47:28 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428084728epsmtip1e211e99deb8a28118667e82b210a4aa5~6by3m-rTj1942219422epsmtip1H;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes
Date: Mon, 28 Apr 2025 17:47:21 +0900
Message-ID: <20250428084721.3832664-4-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428084721.3832664-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSnO4CB/4Mg857ahYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYjH5+FpWi6Zl65kc+D3e32hl99i0qpPNY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3
	S+DKeHFKqOAtV8XOxslsDYwnOLoYOTkkBEwktl15wQRiCwlsZ5SYcNcVIi4hcXjGBEYIW1ji
	fssRVoia94wSb59kdjFycLAJqEps+i3fxcjFISLwlkli+f8DYHOYBU4zSuw8IwNiCwv4SPyc
	f4UZxGYBqn85dxIjSC+vgLVE+95yEFNCQF6iv0MCpIJTwEbi/MVONpCwEFBFXw83SJhXQFDi
	5MwnLBDD5SWat85mnsAoMAtJahaS1AJGplWMoqkFxbnpuckFhnrFibnFpXnpesn5uZsYwfGg
	FbSDcdn6v3qHGJk4GA8xSnAwK4nwVhnwZwjxpiRWVqUW5ccXleakFh9ilOZgURLnVc7pTBES
	SE8sSc1OTS1ILYLJMnFwSjUwccwMbN6nXyM22b21bF/slWcJqkIfWn6LXFGtk431+ZlxxTgq
	SeGu3LqzDWkvVvQd2GG7dt8LX8VC3l1fQ6R+MDetelJ70M3W4dLaZ8fOMbCebPCJW/fLICq9
	abV8UF60gMg9p5UT7NytV657mya18LhK4p7pNRX7nPXTjv/0qe9+/XjGWa4Nsc48fzqinkdt
	Zrc4IvS8zO2NZl50yIyvb/3eJPjoNjgoXlmQZsp07t7sVSbLVk1ZvHH2mQJtRalJ7nsv3eDQ
	PDIzQEJ2tglvvvKyrme/9bfEGZecvrfhlskW4XAD+bTGNtmiAJEnnhtqTSzcVLzEeg5ba1yT
	fNlSvzdGxs/J9Vxo3oW0Je+UWIozEg21mIuKEwHpfgtO9gIAAA==
X-CMS-MailID: 20250428084728epcas2p1d293e6a40eae00465c6b2f5f037dbfef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428084728epcas2p1d293e6a40eae00465c6b2f5f037dbfef
References: <20250428084721.3832664-1-shin.son@samsung.com>
	<CGME20250428084728epcas2p1d293e6a40eae00465c6b2f5f037dbfef@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_014739_030898_A5BE1382 
X-CRM114-Status: GOOD (  13.88  )
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


