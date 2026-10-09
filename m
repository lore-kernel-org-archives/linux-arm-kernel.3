Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FD9CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maBUpjo3g0KZFtGYzIJqew6LPOZ23uD7gqeYdMcjDLU=; b=IAWUKAtY0Qr+tSi+l47x37TKPf
	mE6wJ7b7ZzirGuxR0BS2BbmMRrnQMp6xm9PB3WA+urrEPcj/t7epR0gmPhoolWMyoQ3MbgSqjBm6P
	zFlzbI+1auOArUkqnKRyTadvRI7c8EMddHBv0xE8IxDGjQlrvfn8MuDBJE0MOtpnCrdtviEDwnX+G
	Cn4E+OmWjKR31ouufsWQQ0j31/qs//cGXwEZP6SOlOzqPQUigmoQbtGPTHQczc8XSdTySFVpolWQb
	z1lSgGNiVsz5YViFk28JCvfEunoBA0rXdwh9U+eMlshEGg6obQABoDEuzhffL7N/XXrE9fQAdaAIq
	J/YXZaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF91K-00000006Cju-277s;
	Fri, 09 Oct 2026 11:44:14 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF91F-00000006Cc6-285o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:44:11 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261009114407epoutp015f0d521ecf9512e2c6b9b2f522264641~c2dHvnbUT1386613866epoutp01l
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:44:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261009114407epoutp015f0d521ecf9512e2c6b9b2f522264641~c2dHvnbUT1386613866epoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546247;
	bh=maBUpjo3g0KZFtGYzIJqew6LPOZ23uD7gqeYdMcjDLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I1UPuJfLptsNThUe66G9Lhxp0X4WTn/8ERUglZZ5lz/3peTxTj7u2IN/Mu18D19q2
	 jtEy31bOlpBXcP2RKD7DVkZavFrFERoRFDbLDwwfPoCN2rbZtgQfDeHI42qNu1S+f9
	 izf7q+JCiK5jLOwvcF822bofkHopftchuAsussD8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261009114406epcas5p1e13e5e5ca3adb598acac01fb40c872da~c2dHSAADx2444624446epcas5p16;
	Fri,  9 Oct 2026 11:44:06 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j1Q4P71w7z6B9m5; Fri,  9 Oct
	2026 11:44:05 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261009114404epcas5p446e481d1059354d070dcdf379df3d557~c2dFXSqlh2750927509epcas5p4K;
	Fri,  9 Oct 2026 11:44:04 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114402epsmtip2dd28e66d6cbd0e8ad8e31ca5d08e9074~c2dDBJhnK3087430874epsmtip2Z;
	Fri,  9 Oct 2026 11:44:02 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 12/14] arm64: dts: exynos8855: add cmu_peris clock DT
 nodes
Date: Fri,  9 Oct 2026 17:31:35 +0530
Message-Id: <20261009120137.2801911-13-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114404epcas5p446e481d1059354d070dcdf379df3d557
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114404epcas5p446e481d1059354d070dcdf379df3d557
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114404epcas5p446e481d1059354d070dcdf379df3d557@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_044409_877790_2CC2ACD0 
X-CRM114-Status: GOOD (  14.20  )
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

Add required dt node for cmu_peris block. Also add sysreg_peris node.
sysreg_peris contains DRCG SFRs bits which are used in clock driver.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 2e5dc79d66bc..b461de6a7548 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -146,6 +146,27 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		sysreg_peris: syscon@10020000 {
+			compatible = "samsung,exynos8855-peris-sysreg",
+				      "syscon";
+			reg = <0x10020000 0x10000>;
+			clocks = <&cmu_peris CLK_GOUT_SYSREG_PERIS>;
+		};
+
+		cmu_peris: clock-controller@10030000 {
+			compatible = "samsung,exynos8855-cmu-peris";
+			reg = <0x10030000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_PERIS_GIC>,
+				 <&cmu_top CLKCMU_DOUT_PERIS_NOC>;
+			clock-names = "oscclk",
+				      "gic",
+				      "bus";
+			samsung,sysreg = <&sysreg_peris>;
+		};
+
 		gic: interrupt-controller@10200000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1


