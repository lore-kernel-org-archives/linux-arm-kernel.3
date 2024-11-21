Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAF8D743CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKTy8XWO2qgziAQ1aV4BgRlmD2JBLSeCDp8Nwyzn3qA=; b=ZuIc+8yoHsAOZGtWLWh6RSq4vP
	JD6jmX2Tm2C6UcNg4LwWuQ1eykEzFDzXHzjiuP+GmxCr/nxWRwSZvKmgqhMhdRA3QPdM0/VYEJplB
	EBgEBSjsEwmYRTh+vrqqgVO1lTs6kgUlL5GmCDGSt9+uT/FVwGtH7SPILd8SwmQuF8yWhznGvatil
	wak0tjQ3cIFkHUAW0Y1Lz8GW+Ez31gzNVHjPmmaAIbREQYvgF4Ajc6UZzn0Blg2/nWRRKprpBBwEo
	bbVTMBPK5VyY6UaTibJWpVjejRnxuebaxY2j0odvzntZ6A9IFaTOUpjj3IFA5LEWyDgnaDH+3mJij
	hcYJ4hqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBEn-00000000a7d-1u1c;
	Thu, 21 Nov 2024 17:45:05 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBBU-00000000ZNN-1D1c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 17:41:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D004620010;
	Thu, 21 Nov 2024 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732210898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKTy8XWO2qgziAQ1aV4BgRlmD2JBLSeCDp8Nwyzn3qA=;
	b=RWoZGU5fJqpTbXKi5tH+r+d1vmD3mjfhf6zksxyRpNa2uNYJqMxwWp/aivD8zuRYvbeVR6
	HaBQw6HXteslHcYc5HeiakgI80i3lGL4NvA0dVR49fCXFMkNaqK2+x1vIMmPZyaCPYDUea
	EiEcuu2XP80YdISzxDRiKnFalLoPHLRrs+BPSDuUxPflkp3mdDL0rueP/9UY9TKAsH6hhh
	T3NGDcPuhqZ9mQTaTLd35fNleQXRbFnRYg12+0mlyMKpkFqtd7yXICaPQg7eEkmXvMJj/b
	7qTCJNRPyQTqux8xlrxIUqgH9YKhnerMsJ+IDdSQuq/HEUrdwwCHfsYqkgdD3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 21 Nov 2024 18:41:12 +0100
Subject: [PATCH 2/5] clk: Add a helper to determine a clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-ge-ian-debug-imx8-clk-tree-v1-2-0f1b722588fe@bootlin.com>
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
X-CRM114-CacheID: sfid-20241121_094140_493881_F51F6002 
X-CRM114-Status: GOOD (  10.11  )
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

In the context of the clock core, "determine" means we calculate a
possible clock rate based on its hardware capabilities and its current
upstream parent frequency. This is opposed to "round" which tries to
find the best parent and best rate and "recalc" which is about finding
the next output clock based on a parent frequency change.

The prototype is based on clk_recalc() which does exactly the same for
the "recalc" situation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/clk.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d02451f951cf057d068f980d985c95deb861a2d9..f171539bbb842f57698249a475c62f3f5719ccd1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1927,6 +1927,18 @@ long clk_get_accuracy(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_get_accuracy);
 
+__maybe_unused
+static unsigned long clk_determine(struct clk_core *core, unsigned long rate)
+{
+	struct clk_rate_request req = {};
+
+	clk_hw_init_rate_request(core->hw, &req, rate);
+	if (__clk_determine_rate(core->hw, &req))
+		return 0;
+
+	return req.rate;
+}
+
 static unsigned long clk_recalc(struct clk_core *core,
 				unsigned long parent_rate)
 {

-- 
2.47.0


