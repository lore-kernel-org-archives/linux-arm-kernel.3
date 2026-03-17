Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBA5FD875A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wlZZWFuDFZY5bBtJez1qRMxaOgMw8oBWK1n/kXNB9cM=; b=G3ejGn7YuyHVUrFyr7Tsajx3tH
	cvr+Bmx/Fykv1NyqQuzj+nMT/8nia8z8ujWL5BJrsJQHRho1rMFHJk/cJ7OumrqCIlWsPNl/5nafd
	OS7leDoriujvZqB58qZ6sDFvJ/Vr2tFU3J7hpgTUdbfZfLSMbN3CuqGmbvzLeSAAtq3hb9OLOTieF
	npZv7SoJ6Z9ViTQsTbnx9zAxenNIXHKOh64v4dkXpbBeabaeSUi3wKN1Hx7CazNP/WEmXOQ9UaKl7
	BAXqtBu+0VHO6yJr1xOuTGmXD+n+PfpvFa51jTceTbstxWiZJmCgalq3XTLRoK59g8PgUhZG0Rd2b
	7DrrDARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TP1-00000006HxT-3Pe3;
	Tue, 17 Mar 2026 12:20:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TP0-00000006Hx4-0CYg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 12:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wlZZWFuDFZY5bBtJez1qRMxaOgMw8oBWK1n/kXNB9cM=; b=kgAdP7Lm3ysm5n/kr/Fm1wezCV
	VrgZZnrqDksnAv/aWjg18tHHxL5xxB+TqzZCNJE8507pTRv34tjConOvwsS4FxqiHBCovU5M331gq
	XqBtDxSTQigfNm1uIMHesr5r7D2w7fpplwLkZWbYJP92h/hflnYLxvw+L7zPQPy0j4JGzS4jPv93I
	kIkJDQVNsOK0ZgMizksYBtO9TMO8pHa396QLllYZF5Q2r6azpyYkuxY+H1/9Umik4MO/CgpEOFcdU
	uFCwtYwKB8y09I7ZoTdbhC2yp1E8h6c1f8or2/fb13Wm1XNOdwHqNeybtoqkMFs0QGWmYBO2h2vpK
	Zhor9JYA==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TOw-00000008wab-0lse
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=wlZZWFuDFZY5bBtJez1qRMxaOgMw8oBWK1n/kXNB9cM=; b=gPw2b1rSiBSdAmQO+g4Nd0EhJY
	yox/CA6IKOxuL8wzbLjVm/9949O9O5ij0HULXMVxerLWPPWQ8kdaxgLRIfr7Ax1P3d3J3xsJRBAd8
	60sxMkkWTfC1s69iW6tRtbA4EZBHU4kT2QNfumC9VYhd4fxvUVPGimTjsX30zObJJ9fD8jSE9Rsec
	Mi0JIRsBrdfp6dk3f425kkhVSpe/KfOzmP1OnHZQzE2zBjyhUqHKNgvjtVAnjXz9EZgwUBCNi/4Z0
	Wi286HLlmfsLXnYK344jJmcccG06vHX0OiSRfVKez4ywlB1M+2h87alPR/vmiohKbsp3T+58Jqtg2
	VqbrNaDw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2TOu-000M22-0o;
	Tue, 17 Mar 2026 13:19:56 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2TOs-000Gx7-2x;
	Tue, 17 Mar 2026 13:19:55 +0100
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
	linux-kernel@vger.kernel.org,
	Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format specifier
Date: Tue, 17 Mar 2026 13:19:52 +0100
Message-ID: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_121958_306763_9FACA828 
X-CRM114-Status: UNSURE (   9.86  )
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
Changes in v2:
* Adjusted another format specifier

 drivers/clk/imx/clk-pll14xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 7552aaafc3395..39600ee22be30 100644
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
+	pr_debug("%s: in=%lu, want=%lu got=%u (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
 		 clk_hw_get_name(&pll->hw), prate, rate, t->rate, t->pdiv, t->sdiv,
 		 t->mdiv, t->kdiv);
 }
-- 
2.43.0


