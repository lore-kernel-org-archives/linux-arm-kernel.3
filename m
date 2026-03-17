Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DEEF33829
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CYr2lsML4xXn9xvpQyi5HYRXhtmTvzAd2XvtNHp+U5M=; b=DrpA3vWG06THTWGW/rzXtvconk
	S3Us9h58RCJizHkzXBeZxNMrunJG9ijBL78tz3OzWsclTKv+wKr9jYUEQ4ZDIV8piEhSc1DGsm85Q
	M0Fn+f882yUzVxS0G2m2O4PEbxt2iICz1rkdeQ1BZtf450JfUSeA4scg98B/0TLscfb3qkvDd6RYU
	T3ti9dNkFBYpFp5ayLrhIUT6keIPnOsGrrIjhFYSnzdj5oVG5+iDTN+055t8zhKR5vwYNmYlIFeOZ
	FOyw6i06EaiYCqrGbvXpRKxPp0Zw+Eighz9cIXer5IDcAoYdxZqX1FjYKnIDg2NNk5CuGQ7DAmk36
	BbfNqzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QoV-00000005tp5-13do;
	Tue, 17 Mar 2026 09:34:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QoU-00000005toq-0i0h
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 09:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CYr2lsML4xXn9xvpQyi5HYRXhtmTvzAd2XvtNHp+U5M=; b=UHESrOxuz3ZE4JlILpQExlNz1c
	eMFZ7Uu3l6FGm5kWpKAJeE827hHzvoPHXGeBGSn6uVh+KUslr3UcdlDmOm90Em0SpJ70kVW8Rh7GI
	LJSkQiHppJqvRwZw1J4aF3OGTST5pQ1RJ116LRtit3+LMegBrQ98OfBqKRPMV6ECTLtGnbkvxi8Ud
	D3pE7F0WI8P8C+fK1DXMen/vPaB6tbuD3J9waMmck2Ck8UFiCRmPi2R+JiGxd4hhamc0aMYDsQ84L
	Kd477G/vvgs5G6aGKUjw/yb0UhfOOwebKqoXEf0s63X4nko+eZLfCuxOhDZXUH2U3xw4SDaxCFS4F
	X777yo/Q==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QoO-00000008YPF-2DYv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=CYr2lsML4xXn9xvpQyi5HYRXhtmTvzAd2XvtNHp+U5M=; b=Y8/aI619pp3W9x2HLpKbvqAs9B
	p5p/G3+f1otQ5A+XIxcYtyS4jxQTFWupG1Ut59+s/EFnnROWZMHFC2CqNq00SdWUWIsDm8M05az11
	GrD+/pvnBJ5B2U0ts+zHuvminwHybOqsPbNtKiPBR5/p6UIS2x13c5tQUo5ZA9Rh4tGd4eFD4Dpy2
	FfbrKxYFNbzB6CkdjnAT4pwewLQFwy+vslAhdjLMSaI8jrKwI5tUWiDyLdIvGvsPjagQHx42Mzqkr
	Zw4iBt5e1qYvaUai18rJC8wqlugpZkNvGovF8d52iRDbOvfAuRGG7Y1d3Z7mUTxiKVCnbnhp8nTYL
	ZmBujQbQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2QoM-000EvY-2O;
	Tue, 17 Mar 2026 10:34:02 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2QoM-0004mK-1R;
	Tue, 17 Mar 2026 10:34:02 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: imx: pll14xx: Use unsigned format specifier
Date: Tue, 17 Mar 2026 10:33:52 +0100
Message-ID: <20260317093353.964097-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_093404_716624_749F1DBA 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

The debug outputs use %d for clock rates resulting in negative clock rate
during rate calculation.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-pll14xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 7552aaafc3395..701a7a02235cc 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -151,7 +151,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 	/* First try if we can get the desired rate from one of the static entries */
 	tt = imx_get_pll_settings(pll, rate);
 	if (tt) {
-		pr_debug("%s: in=%ld, want=%ld, Using PLL setting from table\n",
+		pr_debug("%s: in=%lu, want=%lu, Using PLL setting from table\n",
 			 clk_hw_get_name(&pll->hw), prate, rate);
 		t->rate = tt->rate;
 		t->mdiv = tt->mdiv;
@@ -173,7 +173,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 
 	if (rate >= rate_min && rate <= rate_max) {
 		kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
-		pr_debug("%s: in=%ld, want=%ld Only adjust kdiv %ld -> %d\n",
+		pr_debug("%s: in=%lu, want=%lu Only adjust kdiv %ld -> %d\n",
 			 clk_hw_get_name(&pll->hw), prate, rate,
 			 FIELD_GET(KDIV_MASK, pll_div_ctl1), kdiv);
 		fout = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
@@ -211,7 +211,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 		}
 	}
 found:
-	pr_debug("%s: in=%ld, want=%ld got=%d (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
+	pr_debug("%s: in=%ld, want=%lu got=%u (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
 		 clk_hw_get_name(&pll->hw), prate, rate, t->rate, t->pdiv, t->sdiv,
 		 t->mdiv, t->kdiv);
 }
-- 
2.43.0


