Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81A4D743FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 17:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9fPs0nLthnmbo8a6LrEY10rX186VeNy9SlwRtv5peU=; b=hCvOn7ar9OG6YrAx7fl9he7PRX
	6tQfT0ToBgSse3KUpRuZ1hM9xbHpCF5OWjHihQ/Hi7t3gyYlgSjeXPT4L9iyS7kU5WJkZJ5H2O8HM
	tz23ha4P+KHHntkJpW9KnH3LoqcFZ5vQQuxRKtu+4Ejczui6ONkUmM1MmwNnZ+HnBMoe/RiA/yiZI
	GJIjbziJeQrQEvNAevqF239Q1Yog72goDZnrY0lAjW4+Fu9SyMYJtx8w99L1GW60pqiBhXg+FkHwa
	fdyDFlq/G301tR/LjXMPiPFsUk8gYl7s5msjtYEtinspWjjSp9xa26oBsKjSPGvqYp+fVOhcZfJWu
	dPqpD6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBFi-00000000aE9-0BYB;
	Thu, 21 Nov 2024 17:46:02 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBBV-00000000ZNw-1Uph
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 17:41:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 017F020002;
	Thu, 21 Nov 2024 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732210900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9fPs0nLthnmbo8a6LrEY10rX186VeNy9SlwRtv5peU=;
	b=Y85agxXtRhcAxZzQaTYfg/Fqro4DYf58mDGp1y2m/tvKQcRgdR/TTvqBShF6rleawyFLVC
	IL3KSEBqc9lFFlv8XSTrCWVE7Ya1BYJoyqXcfSCbfjV69dQjmX/PdKTVyRgr5zJeu7hK6G
	8QIJEAuv3qhpsSXUiv6lQXu86m7nOjj0jX/WYxZmuwglh7Xnm6RtoJrgjNEVary+Nfx2Q6
	D/XqaeYScbjs1uQ4vuWWzrVr1nPrz+Ys1W03dt9oE7tWDDdnFIpjlUXRQC1HDQ9GUDNqxZ
	iK2+XlZEwiGBprWAfMHfqxvln9cn4lB0BmnJ+r6gkj4PK7WuOPUASa/oLCCeUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 21 Nov 2024 18:41:13 +0100
Subject: [PATCH 3/5] clk: Split clk_calc_subtree()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-ge-ian-debug-imx8-clk-tree-v1-3-0f1b722588fe@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
In-Reply-To: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ying Liu <victor.liu@nxp.com>, 
 Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_094141_692779_963A2500 
X-CRM114-Status: GOOD (  11.74  )
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

This helper does two different things:
- it calculates the new clock frequency
    - as part of this task, it also handles a possible parent change
- it walks the clock subtree to further update frequencies as well (but
  the parent changes are no longer relevant there).

In order to ease the understanding of the next step, let's split this
helper into:
- clk_calc_core_and_subtree() which performs the top clock update (with
  the parents handling) and then calls...
- clk_calc_subtree() (which calls itself recursively) in order to
  perform the subtree updates.

There is no functional change intended.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/clk.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f171539bbb842f57698249a475c62f3f5719ccd1..adfc5bfb93b5a65b6f58c52ca2c432d651f7dd7d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2268,8 +2268,18 @@ static int __clk_speculate_rates(struct clk_core *core,
 	return ret;
 }
 
-static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
-			     struct clk_core *new_parent, u8 p_index)
+static void clk_calc_subtree(struct clk_core *core)
+{
+	struct clk_core *child;
+
+	core->new_rate = clk_recalc(core, core->parent->new_rate);
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_calc_subtree(child);
+}
+
+static void clk_calc_core_and_subtree(struct clk_core *core, unsigned long new_rate,
+				      struct clk_core *new_parent, u8 p_index)
 {
 	struct clk_core *child;
 
@@ -2281,10 +2291,8 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 	if (new_parent && new_parent != core->parent)
 		new_parent->new_child = core;
 
-	hlist_for_each_entry(child, &core->children, child_node) {
-		child->new_rate = clk_recalc(child, new_rate);
-		clk_calc_subtree(child, child->new_rate, NULL, 0);
-	}
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_calc_subtree(child);
 }
 
 /*
@@ -2368,7 +2376,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		top = clk_calc_new_rates(parent, best_parent_rate);
 
 out:
-	clk_calc_subtree(core, new_rate, parent, p_index);
+	clk_calc_core_and_subtree(core, new_rate, parent, p_index);
 
 	return top;
 }

-- 
2.47.0


