Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5622DCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 20:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bnf9sV68B7jkZZZAWFvdhLXnESO2rYVBlDigia/2LrQ=; b=p3xpEiK4lBMZZuLgnIVv/FRjO+
	Z/7o975Y/wDfCTfIiUTurMtM3V8gidVVDOI+bT4Q8ptPsQrlfFgUOWSg2CsM4RUaob7eb3tipIsR7
	3wyw2Bl1eXMNV9Dto/xBtZBhss+le8iDYR4CVtXDpVM2Z9HIN9qcIJDbju8rWKXoejU0EfoWFP70S
	/2K2oD685OzdOM6h6yumZNSreHIJHCRAbvhXJAOsJE23pQ3BpGUK7YLg91BEugl0jeO93XVehhs1H
	L9AWlpHFfRPN3iPTTfr0V+05/6gzoOp7nHTW5BlbnAf9bHyRBPk5UP/9L2y0mO/hWtisUx7eFpp5v
	hWjK7CUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRybp-00000002wrI-29n6;
	Tue, 26 May 2026 20:42:41 +0000
Received: from mta.al2klimov.de ([2a01:4f8:c0c:a5b1::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRybn-00000002wql-09s4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 20:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=xPJm8fGfxE42
	Pzfa4WxRQce3kxEQReqDCeHFRJtXUZE=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=aIsLNngtHgasmh4xTzaISRu5wq9PTcVvObR83qSDN0uSYvLU7jaj
	7oUe87jdBTXERthZHOzD0iVZ9XKM52hXw1Y7K8PZKBDDxIBJ7TrxF1TAbnUe57UuNuNtev
	Ud1fBjxBUKitI+SGr97QePwKdxv9YbhtthGgGTmo4Oa6eBfADKkDQC04z/Ydp/v/ROBsVr
	VNSclkN2On4H1kN1b7V1cqJOedzutFfK85Jrp4/29r59Z15xFa83PoF4u/CQKAZka8S2pn
	RNjyQYrdvrAsyA2HT7JYPEIbzFKDNC+N8l5WLFWJLNp4lYMd17TLzJeunNnf1fEW4uoQiG
	hv0fyY3vDA==
Received: from cachy-ak (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 50619732 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 26 May 2026 20:42:35 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/MOXA ART SOC),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clk: moxart: remove unused variables, fix refcount leak
Date: Tue, 26 May 2026 22:42:26 +0200
Message-ID: <20260526204227.23181-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_134239_381969_79F1D958 
X-CRM114-Status: UNSURE (   8.53  )
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

Not only these error checks are redundand,
those of_clk_get() return values weren't cleaned up via clk_put().

Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clk/clk-moxart.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
index 3786a0153ad1..40663ef3ef0a 100644
--- a/drivers/clk/clk-moxart.c
+++ b/drivers/clk/clk-moxart.c
@@ -17,7 +17,6 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
 {
 	void __iomem *base;
 	struct clk_hw *hw;
-	struct clk *ref_clk;
 	unsigned int mul;
 	const char *name = node->name;
 	const char *parent_name;
@@ -34,12 +33,6 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
 	mul = readl(base + 0x30) >> 3 & 0x3f;
 	iounmap(base);
 
-	ref_clk = of_clk_get(node, 0);
-	if (IS_ERR(ref_clk)) {
-		pr_err("%pOF: of_clk_get failed\n", node);
-		return;
-	}
-
 	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mul, 1);
 	if (IS_ERR(hw)) {
 		pr_err("%pOF: failed to register clock\n", node);
@@ -56,7 +49,6 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
 {
 	void __iomem *base;
 	struct clk_hw *hw;
-	struct clk *pll_clk;
 	unsigned int div, val;
 	unsigned int div_idx[] = { 2, 3, 4, 6, 8};
 	const char *name = node->name;
@@ -78,12 +70,6 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
 		val = 0;
 	div = div_idx[val] * 2;
 
-	pll_clk = of_clk_get(node, 0);
-	if (IS_ERR(pll_clk)) {
-		pr_err("%pOF: of_clk_get failed\n", node);
-		return;
-	}
-
 	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, 1, div);
 	if (IS_ERR(hw)) {
 		pr_err("%pOF: failed to register clock\n", node);
-- 
2.54.0


