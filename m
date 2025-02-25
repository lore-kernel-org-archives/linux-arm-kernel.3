Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0906C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iByPpyU+f6q9fpMqiXBgPWh/Orb61g/26dgeOYhx3TE=; b=nZZD3PrwPaOjXZExkjcTMOmv5L
	qP8u58zaq8Qw1UAya8t3Gqu/Keh7+qAe2/SeQg2gXPHNy7zTAFGoCJ9m4LsIpkZy5laDmbn15d8uN
	bKwf9hL6f2S4eF3PSOybPdDWstZDp/Prl23zIgJ8To8Q6iGav2yx8DVIYAPFT8KgspMeR1ycB0mlo
	CcIXaswMrfBmtnddb2KKuumXCnLGnMJ0Xot+5TnPBs1m8EJVr9RWrWeVOrp707BD8kJqc3yl41avg
	ejXwREqO9vdNg4NYPfuIkmRxr+Lz2seKBQIrsVy7osl4iT9SkteSP4YTaGxhs5GnWqPxhQOrsI9Qy
	Qqb6ZnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx3-00000000Feq-1llE;
	Tue, 25 Feb 2025 16:38:33 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuzV-0000000HNSM-1q4x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:28:55 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250225132849epoutp018734c52fc4772f95e3cccf83aa859ca0~ndo0zz3SC0547905479epoutp01V
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 13:28:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250225132849epoutp018734c52fc4772f95e3cccf83aa859ca0~ndo0zz3SC0547905479epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740490129;
	bh=iByPpyU+f6q9fpMqiXBgPWh/Orb61g/26dgeOYhx3TE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fT4D40XodcGQ/BInDMaUUgZErfU241Aet2hS1Uwp4kCQIg6rIfJf/b04N/xoWnbJb
	 62WqRRSdLXXBhqzbQ1Ma0quw8bN3akubgpkOLVQF3wErsGwYUJJnR4ybKzY2Rk7YIx
	 nPa4wF/yuCnfHr9TfOc7j6WOfEA3aAm3EF6vgv/o=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20250225132849epcas5p3122a8cb82b3aae631e363ba60cb98475~ndo0b3sgd1848618486epcas5p3_;
	Tue, 25 Feb 2025 13:28:49 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Z2JMz28Qsz4x9Pw; Tue, 25 Feb
	2025 13:28:47 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	47.45.19933.F85CDB76; Tue, 25 Feb 2025 22:28:47 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250225132447epcas5p4576a3dac624edbd5edc0a047e008de05~ndlS8_KGV0676106761epcas5p4k;
	Tue, 25 Feb 2025 13:24:47 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250225132447epsmtrp131ecfea8029ff60e824f546e6ae84125~ndlS8LYen2478624786epsmtrp1q;
	Tue, 25 Feb 2025 13:24:47 +0000 (GMT)
X-AuditID: b6c32a4a-c1fda70000004ddd-64-67bdc58fb93c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	FC.DA.33707.F94CDB76; Tue, 25 Feb 2025 22:24:47 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250225132441epsmtip2e358945fc21168f55389f2090fe7b0b9~ndlNcADRW1998219982epsmtip2D;
	Tue, 25 Feb 2025 13:24:40 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH v2 1/2] clk: samsung: Use samsung CCF common function
Date: Tue, 25 Feb 2025 18:49:17 +0530
Message-Id: <20250225131918.50925-2-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250225131918.50925-1-v.pavani@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmum7/0b3pBivu8Fo8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WG3lfsDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpMyM6Y/Na24Lhyxc4zd5gaGPvl
	uxg5OSQETCTWbb7L0sXIxSEksJtR4vXi46wQzidGiakNx9jgnEt7drLDtCz9MJ0ZIrGTUWLi
	1/1QzhdGifYL7cwgVWwCWhKrpy5nBbFFBI4wSfw5kQpiMwvYSayfOhesRljAVWLhjGdsIDaL
	gKpE15+TjCA2r4ClxNWlV5kgtslLrN5wAKyeU8BK4tqPd+wgyyQEvrJLXL68AOhyDiDHRaJ5
	pi1EvbDEq+NboC6VknjZ38YOUZIs0f6JGyKcI3Fp9yqo8fYSB67MAZvCLKApsX6XPkRYVmLq
	qXVMEBfzSfT+fgJVziuxYx6MrSSxc8cEKFtC4unqNWwQtofEk7VnGSFB0ssosXTaW+YJjHKz
	EFYsYGRcxSiZWlCcm55abFpglJdaDo+z5PzcTYzglKjltYPx4YMPeocYmTgYDzFKcDArifBy
	Zu5JF+JNSaysSi3Kjy8qzUktPsRoCgy+icxSosn5wKScVxJvaGJpYGJmZmZiaWxmqCTO27yz
	JV1IID2xJDU7NbUgtQimj4mDU6qBiTvj2TvZtzzGPuGLNyWdZjc2E9x05bBc8sF+V4W/RzxT
	js5eUX9I7o37Az7PORpv9T4cDfd/GbyizirBfyarXv41RretzOWzTjo+jK0PX3coj3/uHLsV
	Bb33Vmgf7RJuDeHlZzisFhqtoXZD5SHzp0X/DNl7uDrvLQ5Vnve36vJkT9k0t8sbX2o81fzn
	Ul60xHGusKnMh87Gpmb/PToxc1X3bC0Xb3WccmIBa03M5HlSVtua1/688OlJ2y/DyEAXC/8d
	b5eKmGtpxOhU6rTYNfoeFF0ilZbZu57Ta7uA6OIpFa/OdjSkm9hI36lXEtHsC2VP+Kj/4nLh
	3fjmX4xxLTPu7WZQmWVtvNf/5VwlluKMREMt5qLiRAAXegEaEgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCLMWRmVeSWpSXmKPExsWy7bCSvO78I3vTDXZf57V4MG8bm8WhzVvZ
	La5/ec5qcfPATiaL8+c3sFtsenyN1eJjzz1Wi8u75rBZzDi/j8ni4ilXi0Vbv7BbHH7Tzmrx
	79pGFosNva/YHfg83t9oZffYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJzcksSy3St0vgypj8
	1rbguHLFzjN3mBoY++W7GDk5JARMJJZ+mM7cxcjFISSwnVHi1qGf7BAJCYmd31qZIWxhiZX/
	nrNDFH1ilHg7bQEjSIJNQEti9dTlrCAJEYFLTBIHjjwB62YWcJC4ePYJC4gtLOAqsXDGMzYQ
	m0VAVaLrz0mwZl4BS4mrS68yQWyQl1i94QDYNk4BK4lrP96BzRECqjn0/RPbBEa+BYwMqxhF
	UwuKc9NzkwsM9YoTc4tL89L1kvNzNzGCA1YraAfjsvV/9Q4xMnEwHmKU4GBWEuHlzNyTLsSb
	klhZlVqUH19UmpNafIhRmoNFSZxXOaczRUggPbEkNTs1tSC1CCbLxMEp1cCU33NN7tLXuAdp
	8QVmKmeE0yfmz1/yO2rqR97PNTHxSe/ybhzsXHez2TkqRvVLSMGTBGF1pvrjJtN+sYQlzUze
	/ouzZMqDmKnJdT6KcnJd04Jz/BWDz2+/tGgpzwKnc6VmXD+qNE6Z+RhemPKIe2fxKw6FRQuZ
	ecUvnajYWVwfmLVqlk+KyYa+WpbVqt171mr+XLPvhbtY2s006euXfnrVMS/3re+UPFiVF37O
	lNnr2ZRJ7ArKEkwHdKY4Cf2QZhfZf8DnWliD8JlZ5vKvVi7Se+l7SPqZeYh98J3U04luC4JW
	zb+xYVHZc5Wb955s/NC4V4dHc89SHe77+bXi7s8XXH3cUiHx6W3zllnXJ7crsRRnJBpqMRcV
	JwIAm5Z1MscCAAA=
X-CMS-MailID: 20250225132447epcas5p4576a3dac624edbd5edc0a047e008de05
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250225132447epcas5p4576a3dac624edbd5edc0a047e008de05
References: <20250225131918.50925-1-v.pavani@samsung.com>
	<CGME20250225132447epcas5p4576a3dac624edbd5edc0a047e008de05@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_052853_793723_A9D55064 
X-CRM114-Status: GOOD (  18.42  )
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

Use samsung CCF function which registers multiple clock providers using
single function call samsung_cmu_register_clocks().

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 78 +++++++++++++++++--------------
 1 file changed, 44 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 16be0c53903c..ca5036ba45b9 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1269,6 +1269,45 @@ static const struct samsung_cpu_clock exynos4412_cpu_clks[] __initconst = {
 		CPUCLK_LAYOUT_E4210, e4412_armclk_d),
 };
 
+static const struct samsung_cmu_info cmu_info_exynos4 __initconst = {
+	.mux_clks		= exynos4_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(exynos4_mux_clks),
+	.div_clks		= exynos4_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(exynos4_div_clks),
+	.gate_clks		= exynos4_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(exynos4_gate_clks),
+	.fixed_factor_clks	= exynos4_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(exynos4_fixed_factor_clks),
+	.fixed_clks	= exynos4_fixed_rate_clks,
+	.nr_fixed_clks	= ARRAY_SIZE(exynos4_fixed_rate_clks),
+};
+
+static const struct samsung_cmu_info cmu_info_exynos4210 __initconst = {
+	.mux_clks		= exynos4210_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(exynos4210_mux_clks),
+	.div_clks		= exynos4210_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(exynos4210_div_clks),
+	.gate_clks		= exynos4210_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(exynos4210_gate_clks),
+	.fixed_factor_clks	= exynos4210_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(exynos4210_fixed_factor_clks),
+	.fixed_clks	= exynos4210_fixed_rate_clks,
+	.nr_fixed_clks	= ARRAY_SIZE(exynos4210_fixed_rate_clks),
+	.cpu_clks		= exynos4210_cpu_clks,
+	.nr_cpu_clks		= ARRAY_SIZE(exynos4210_cpu_clks),
+};
+
+static const struct samsung_cmu_info cmu_info_exynos4x12 __initconst = {
+	.mux_clks		= exynos4x12_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(exynos4x12_mux_clks),
+	.div_clks		= exynos4x12_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(exynos4x12_div_clks),
+	.gate_clks		= exynos4x12_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(exynos4x12_gate_clks),
+	.fixed_factor_clks	= exynos4x12_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(exynos4x12_fixed_factor_clks),
+};
+
 /* register exynos4 clocks */
 static void __init exynos4_clk_init(struct device_node *np,
 				    enum exynos4_soc soc)
@@ -1322,41 +1361,12 @@ static void __init exynos4_clk_init(struct device_node *np,
 					ARRAY_SIZE(exynos4x12_plls));
 	}
 
-	samsung_clk_register_fixed_rate(ctx, exynos4_fixed_rate_clks,
-			ARRAY_SIZE(exynos4_fixed_rate_clks));
-	samsung_clk_register_mux(ctx, exynos4_mux_clks,
-			ARRAY_SIZE(exynos4_mux_clks));
-	samsung_clk_register_div(ctx, exynos4_div_clks,
-			ARRAY_SIZE(exynos4_div_clks));
-	samsung_clk_register_gate(ctx, exynos4_gate_clks,
-			ARRAY_SIZE(exynos4_gate_clks));
-	samsung_clk_register_fixed_factor(ctx, exynos4_fixed_factor_clks,
-			ARRAY_SIZE(exynos4_fixed_factor_clks));
+	samsung_cmu_register_clocks(ctx, &cmu_info_exynos4);
 
-	if (exynos4_soc == EXYNOS4210) {
-		samsung_clk_register_fixed_rate(ctx, exynos4210_fixed_rate_clks,
-			ARRAY_SIZE(exynos4210_fixed_rate_clks));
-		samsung_clk_register_mux(ctx, exynos4210_mux_clks,
-			ARRAY_SIZE(exynos4210_mux_clks));
-		samsung_clk_register_div(ctx, exynos4210_div_clks,
-			ARRAY_SIZE(exynos4210_div_clks));
-		samsung_clk_register_gate(ctx, exynos4210_gate_clks,
-			ARRAY_SIZE(exynos4210_gate_clks));
-		samsung_clk_register_fixed_factor(ctx,
-			exynos4210_fixed_factor_clks,
-			ARRAY_SIZE(exynos4210_fixed_factor_clks));
-		samsung_clk_register_cpu(ctx, exynos4210_cpu_clks,
-				ARRAY_SIZE(exynos4210_cpu_clks));
-	} else {
-		samsung_clk_register_mux(ctx, exynos4x12_mux_clks,
-			ARRAY_SIZE(exynos4x12_mux_clks));
-		samsung_clk_register_div(ctx, exynos4x12_div_clks,
-			ARRAY_SIZE(exynos4x12_div_clks));
-		samsung_clk_register_gate(ctx, exynos4x12_gate_clks,
-			ARRAY_SIZE(exynos4x12_gate_clks));
-		samsung_clk_register_fixed_factor(ctx,
-			exynos4x12_fixed_factor_clks,
-			ARRAY_SIZE(exynos4x12_fixed_factor_clks));
+	if (exynos4_soc == EXYNOS4210)
+		samsung_cmu_register_clocks(ctx, &cmu_info_exynos4210);
+	else {
+		samsung_cmu_register_clocks(ctx, &cmu_info_exynos4x12);
 		if (soc == EXYNOS4412)
 			samsung_clk_register_cpu(ctx, exynos4412_cpu_clks,
 					ARRAY_SIZE(exynos4412_cpu_clks));
-- 
2.17.1


