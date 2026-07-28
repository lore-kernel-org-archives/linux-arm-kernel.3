Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11882C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GG3gQXNZg4KJgPZln4dmN7buJq42W584sGfTmqCRugU=; b=wWHgJVvlRLe5VBJmvBjX2bdXKj
	jMKoqDG9PP1xnjXhwvL/k7KtdJxCQAKAJsdqb8Sr0rX3oX9hpHWZKKugJS6HojgntFY80H8Rtmat9
	nQVsGKG7hCh80oVaG4D7J0QF9+VGnvYbnqL8fnLLrelSrS2vBmOmz28gEDhOkB6Z8p5qDMfuJ0rMZ
	ga9+x6k4Xy3p/1mmLlpI/38ogv6XoOINlnXjUkJ1QvLBx3XqKF5sJNKB7qyv2hAU7EULiJV3+YGAY
	KHOL+ZM/vtZ7+gV7GcgeH7rIJQF5VfQvafwupm9PjUokQlWV4h5Xs3OFhhJi6ae95Ultul67WfJxz
	PlBZn8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogN7-000000058R7-2udz;
	Tue, 28 Jul 2026 11:53:21 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogMz-000000058LG-1wLT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:53:14 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260728115310epoutp0461862752a844a9e8e6fb99dd26a395bc~GcfLdLUcG3060130601epoutp04B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:53:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260728115310epoutp0461862752a844a9e8e6fb99dd26a395bc~GcfLdLUcG3060130601epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239590;
	bh=GG3gQXNZg4KJgPZln4dmN7buJq42W584sGfTmqCRugU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GzEA1RdHJLtS/IJI21XlNSmDLU13Bj/BW9CFSjxs9sSXFH/U0FIv/ZpcYq528/hTo
	 ytvz61KvCFxEcwvBk19o1TJquTlGPG4xbdM9sdfDWTp+DYlzQUXHibv3qutT4/zS+B
	 P3M2+z4Pm2FVeTdNWypQcEydx5mF2OwE7GtqGTuw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260728115309epcas5p1121bdfa96758db06c4042e6b801acffe~GcfK2lhRW2742927429epcas5p1X;
	Tue, 28 Jul 2026 11:53:09 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4h8YkX4LC6z6B9m9; Tue, 28 Jul
	2026 11:53:08 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115308epcas5p12e93dfef5637137f3ed159ebc2e9bd8e~GcfJgBgLe2742927429epcas5p1S;
	Tue, 28 Jul 2026 11:53:08 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115305epsmtip1128824a6f7f1d4afcf2a461a0c9588f4~GcfG_ARpZ2207322073epsmtip1Q;
	Tue, 28 Jul 2026 11:53:05 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 07/13] arm64: dts: exynos8855: add cmu_peris clock DT nodes
Date: Tue, 28 Jul 2026 17:41:05 +0530
Message-Id: <20260728121111.2077860-8-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115308epcas5p12e93dfef5637137f3ed159ebc2e9bd8e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115308epcas5p12e93dfef5637137f3ed159ebc2e9bd8e
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115308epcas5p12e93dfef5637137f3ed159ebc2e9bd8e@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_045313_665847_2226187D 
X-CRM114-Status: GOOD (  11.94  )
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

Add required dt node for cmu_peris block

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 0053730b3e01..a8f5ff0a7f1a 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -141,6 +141,19 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		cmu_peris: clock-controller@10030000 {
+			compatible = "samsung,exynos8855-cmu-peris";
+			reg = <0x10030000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_PERIS_GIC>,
+				 <&cmu_top CLKCMU_DOUT_PERIS_NOC>;
+			clock-names = "oscclk",
+				      "gic",
+				      "bus";
+		};
+
 		gic: interrupt-controller@10200000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1


