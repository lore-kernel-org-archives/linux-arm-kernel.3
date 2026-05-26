Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5668CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 06:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9pfIt+I8Gc7ZeOBqbNyxrbDCdJLoJqdT1TG1Fhf5apY=; b=VpqxIRC8v+Oc5WqpqoI9o4/Ao4
	ecFlzchaq4fLOFXrblJDz/395cjS8NDrULVc0DbYhlKfq/r8mulnWvC6cBhYIFYrhT7GfzDYT+W3i
	m5AzpvG8xx5t40vSTiur4ALdZCWYiSPaxEm33GDZpeigB3s+EJSc3Gwt3WA6CoolEIokSIf29xgBD
	KuDASvnQ/DWuMM8Y9COGLNxQKif88JZTut8noUv47LYLQYPGubvAfH/9MrkKBLJTBc/sxbpBRHsvZ
	x9Dm8qQ/o+hY6wNVupcmGnw86w9SWleiIkW6z6bKFRyHCzqmws+JVu5e1Z69C3d7WqHcLOwouDaCP
	tN+p2JAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRl2w-000000018ow-2bu0;
	Tue, 26 May 2026 06:13:46 +0000
Received: from mta.al2klimov.de ([2a01:4f8:c0c:a5b1::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRl2t-000000018oB-1Fiv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 06:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=VQwPEACzLrn3
	sirzJhEJwSUsl+8N7bfQkDfoCfrIXz0=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=FR8Xwd3eL2vwsAGnlMaWeh4Pljo1eFEpKwrdVXr2zBe+tBwPVlcp
	mTonJL/JmYeGMORZCri1YG3pqVj6EVS6xsEA8781MGkjt8XDD0UMnu2mIjXEEXrHmPkyS6
	ocDt4qaBdmy0HAnYvsstjWl+hey+lNaRkdK3+9saOdWlFq5uEs+jSdyG9WHDWO4YoqjrQc
	dNpTUGEA5/q0W0X73tNez3OsC9Vlcp4jnGCFgD0CpJAImYZwrheab5aP6y5oyymfudXkN0
	o8rSEC3hZiiiximX46wwBuc1GrLQz7U8jDEIoMwIIMaHSUikav/jz3hqIkGSiwMM9U7UYf
	KyxST6KZeQ==
Received: from cachy-ak (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id c93a46ee (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 26 May 2026 06:13:37 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clk: samsung: exynos5410: fix refcount leak
Date: Tue, 26 May 2026 08:13:12 +0200
Message-ID: <20260526061321.6123-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_231343_711804_ACA0297A 
X-CRM114-Status: GOOD (  11.52  )
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

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.

Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clk/samsung/clk-exynos5410.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index baa9988c7bb7..0cd9b0392cf5 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -269,8 +269,12 @@ static void __init exynos5410_clk_init(struct device_node *np)
 {
 	struct clk *xxti = of_clk_get(np, 0);
 
-	if (!IS_ERR(xxti) && clk_get_rate(xxti) == 24 * MHZ)
-		exynos5410_plls[epll].rate_table = exynos5410_pll2550x_24mhz_tbl;
+	if (!IS_ERR(xxti)) {
+		if (clk_get_rate(xxti) == 24 * MHZ)
+			exynos5410_plls[epll].rate_table =
+				exynos5410_pll2550x_24mhz_tbl;
+		clk_put(xxti);
+	}
 
 	samsung_cmu_register_one(np, &cmu);
 
-- 
2.54.0


