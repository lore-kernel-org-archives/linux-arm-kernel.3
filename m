Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B8ACDE017
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 06:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGMyiWLHd227KG2Ilbq09nuik7e49nTUOKDH0Fh1doA=; b=IJopCuHbrsdM0i+uOPhl+KGhCb
	bam8Mf8xZA++5eqJaIZoFj3MbpMiFzZKtNabc68qUyYtezppzA003Hi6rv0+Pth3L/bHtEZsyJWw8
	ZCitiZFocCghd3qYfeqhUvbZuR6UvqCFmv7p8DKq9AtAPKPVzzFMk4dWt8VpEo3RbqFV5Z05Xp8V9
	EHusFwmqQhy4/5KXZixI6IHKQ1O8LctWr9u39+0XObfWOtrzmlof8sp7baaNbPgdpQyg3U9+4JhNJ
	A8B+vfn3yydaZHrcjqQBPevC2GKSen/jo6Y5u3T0r9lx+De5LWqfaKKvgU5O9Xtk684k6hlDQdiiA
	LBd/7s4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnmV-0000000BhaC-0ahJ;
	Fri, 14 Nov 2025 06:59:39 +0000
Received: from mo-csw1802.securemx.jp ([210.130.202.152] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnmM-0000000BhWP-3PCd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 06:59:33 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1763103550;x=1764313150;bh=YaJyIx3BTM6PJFfw7uMgpOvCW7UERP6aBJv3zzwB6Uw=;b=eJ9
	iISBNfHn9waddM58TVg7uBYBAmVKb/OVA5E7Z16f34ZaOFSHAoAupaCmqRsv4zgaMNme6RyBnv7rK
	/D1HrbYK3us6n0Ipy57F4yaIzXEPyE+VngyM/w3jyBFROdEOC3XH0QbX46Vsf5LloxgV0ZNRwqZ7j
	QAzmjdEl7qtdBtGGLGHQDERk/fTAu6ATtMXScx/vCZUQLc6UtZT6SDaS7MHien4r1RSS0M6gePRuL
	eicOgfkgxr7ymYspke5V5v7WannW4C3SdER1JSUgtEOvVc1Pw6NpVgWeGYa1nQ0euHTwNqReLXHms
	u8ONiwDE8wPUaV+CodET6gGBeX7BUDg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 5AE6x9N12206956; Fri, 14 Nov 2025 15:59:09 +0900
X-Iguazu-Qid: 2yAakGMojjjxMf6t5U
X-Iguazu-QSIG: v=2; s=0; t=1763103548; q=2yAakGMojjjxMf6t5U; m=G8E2yk525ojmYKyw2eN9CDf8Cr/CmjUVM/YdQ20WOvk=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77KR4My0zyPZ; Fri, 14 Nov 2025 15:59:07 +0900 (JST)
X-SA-MID: 54822484
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH 1/2] clk: visconti: Do not define number of clocks in bindings
Date: Fri, 14 Nov 2025 15:53:57 +0900
X-TSB-HOP2: ON
Message-Id: <20251114065358.854817-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_225931_160882_B35CE572 
X-CRM114-Status: GOOD (  13.09  )
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

Remove use of TMPV770X_NR_CLK.
Instead, define number of clocks inside the driver directory.

The same for TMPV770X_NR_RESET and TMPV770X_NR_PLL.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
 drivers/clk/visconti/clkc-tmpv770x.c | 8 ++++++--
 drivers/clk/visconti/pll-tmpv770x.c  | 5 ++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/visconti/clkc-tmpv770x.c b/drivers/clk/visconti/clkc-tmpv770x.c
index 6c753b2cb..94a736da6 100644
--- a/drivers/clk/visconti/clkc-tmpv770x.c
+++ b/drivers/clk/visconti/clkc-tmpv770x.c
@@ -17,6 +17,10 @@
 #include "clkc.h"
 #include "reset.h"
 
+/* Must be equal to the last clock/reset ID increased by one */
+#define CLKS_NR	(TMPV770X_CLK_BUSLCK + 1)
+#define RESETS_NR	(TMPV770X_RESET_SBUSCLK + 1)
+
 static DEFINE_SPINLOCK(tmpv770x_clk_lock);
 static DEFINE_SPINLOCK(tmpv770x_rst_lock);
 
@@ -234,12 +238,12 @@ static int visconti_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	ctx = visconti_init_clk(dev, regmap, TMPV770X_NR_CLK);
+	ctx = visconti_init_clk(dev, regmap, CLKS_NR);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 
 	ret = visconti_register_reset_controller(dev, regmap, clk_reset_data,
-						 TMPV770X_NR_RESET,
+						 RESETS_NR,
 						 &visconti_reset_ops,
 						 &tmpv770x_rst_lock);
 	if (ret) {
diff --git a/drivers/clk/visconti/pll-tmpv770x.c b/drivers/clk/visconti/pll-tmpv770x.c
index 8360ccf88..a2208c5fc 100644
--- a/drivers/clk/visconti/pll-tmpv770x.c
+++ b/drivers/clk/visconti/pll-tmpv770x.c
@@ -16,6 +16,9 @@
 
 #include "pll.h"
 
+/* Must be equal to the last pll ID increased by one */
+#define PLLS_NR	(TMPV770X_PLL_PIIMGERPLL + 1)
+
 static DEFINE_SPINLOCK(tmpv770x_pll_lock);
 
 static const struct visconti_pll_rate_table pipll0_rates[] __initconst = {
@@ -66,7 +69,7 @@ static void __init tmpv770x_setup_plls(struct device_node *np)
 	if (!reg_base)
 		return;
 
-	ctx = visconti_init_pll(np, reg_base, TMPV770X_NR_PLL);
+	ctx = visconti_init_pll(np, reg_base, PLLS_NR);
 	if (IS_ERR(ctx)) {
 		iounmap(reg_base);
 		return;
-- 
2.34.1



