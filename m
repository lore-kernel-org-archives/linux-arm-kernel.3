Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D44D743CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 17:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QcSacwVpu2OIjtCo7echKG6f3TnQvVOnEK3B7CH3u8=; b=UKS2aAja7lneo1hZvZ7qr1U7+b
	egckeE7FJM64+aLVIZrNCCGF2lGdrd5Cc+nyv2Mvq0VCEXvNDsnjOJOaudjJ6Vwh5lq35j7VXEMLX
	ygZGNsJs1STK3MmvhnZc7R8hovH4ORUJdSoozVJCs7jvgya4XL+4vcKDJt2AM/NHujw4+/r1dXT1b
	HQb6C2Xxu1APSrwRMCKfho8d7Ef0xFwcbcxwK1laa3XSCih8KJjE5MAlhEYW4PPhC57tGiUtIUwKi
	W1rrdqw1LOTzcFG1wwwtZX8/nGw1MCDf4oFsprDeYti2A+MzpopVvVtmXlKuqMiiMHfei4It45DRM
	JcWE2VXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBGb-00000000aL6-2jCc;
	Thu, 21 Nov 2024 17:46:57 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBBW-00000000ZOp-2c0n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 17:41:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 268742000E;
	Thu, 21 Nov 2024 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732210901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QcSacwVpu2OIjtCo7echKG6f3TnQvVOnEK3B7CH3u8=;
	b=gpQVV3Y5DwAdSa+7rGceOvI9ECqAtPMyocg8KvRcQPA8yGF20p1h20yVBtzR84fG8ClwUh
	0I4xgOyZMm6GQNzGYZogpGCjCs6YJ8wDYl1UnCOMIDzL65A/s9ERj1nLXR45Q0V2uJfrAt
	CtdeJOAkuPUB4Uowb5Ow9nKWuBFV27oBJR+DXn1SfbAo8FxORpcH09MpzLBA54AM/gASvc
	+KIFiwh7QyRlWMBvcAvrDct8SRSN+sKjhq2ToA5w9FFbl9AnVm4I+FVUcKV7b461/kZYdw
	QOhIYphFMsAMNeSbRwnonySF58MMAvPn9qIPUSUHQaWGCRpXhJSkj/hY5pZQ1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 21 Nov 2024 18:41:14 +0100
Subject: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
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
X-CRM114-CacheID: sfid-20241121_094142_926648_D4745412 
X-CRM114-Status: GOOD (  17.30  )
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

There are mainly two ways to change a clock frequency. The active way
requires calling ->set_rate() in order to ask "on purpose" for a
frequency change. Otherwise, a clock can passively see its frequency
being updated depending on upstream clock frequency changes. In most
cases it is fine to just accept the new upstream frequency - which by
definition will have an impact on downstream frequencies if we do not
recalculate internal divisors. But there are cases where, upon an
upstream frequency change, we would like to maintain a specific rate.

As an example, on iMX8MP the video pipeline clocks are looking like this:

    video_pll1
       video_pll1_bypass
          video_pll1_out
             media_ldb
                media_ldb_root_clk
             media_disp2_pix
                media_disp2_pix_root_clk
             media_disp1_pix
                media_disp1_pix_root_clk

media_ldb, media_disp2_pix and media_disp1_pix are simple divisors from
which we might require 2 or 3 different rates, whereas video_pll1 is a
very configurable PLL which can achieve almost any frequency. There are
however relationships between them, typically the ldb clock must be 3.5
or 7 times higher than the media_disp* clocks.

Currently, if eg. media_disp2_pix is set to 71900000Hz, when media_ldb
is (later) set to 503300000Hz, media_disp2_pix is updated to 503300000Hz
as well, which clearly does not make sense. We want it to stay at
71900000Hz during the subtree walk.

Achieving this is the purpose of the new clock flag:
CLK_NO_RATE_CHANGE_DURING_PROPAGATION

Please note, if the kernel was setting the ldb clock before a pixel
clock, the result would be different, and this is also what this patch
is trying to solve.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
In all cases, the LDB must be aware of the device configuration, and ask
for a clever frequency, we will never cope with slightly aware drivers
when addressing this kind of subtle situation.
---
 drivers/clk/clk.c            | 9 +++++++--
 include/linux/clk-provider.h | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index adfc5bfb93b5a65b6f58c52ca2c432d651f7dd7d..94d93470479e77769e63e97462b176261103b552 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1927,7 +1927,6 @@ long clk_get_accuracy(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_get_accuracy);
 
-__maybe_unused
 static unsigned long clk_determine(struct clk_core *core, unsigned long rate)
 {
 	struct clk_rate_request req = {};
@@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 
-	core->new_rate = clk_recalc(core, core->parent->new_rate);
+	if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
+		core->new_rate = clk_determine(core, core->rate);
+		if (!core->new_rate)
+			core->new_rate = clk_recalc(core, core->parent->new_rate);
+	} else {
+		core->new_rate = clk_recalc(core, core->parent->new_rate);
+	}
 
 	hlist_for_each_entry(child, &core->children, child_node)
 		clk_calc_subtree(child);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 200135e0f6d00d48b10e843259333b9733c97f38..baef0b442ac1d36ee935cbcaaaa4e2d95fe7654c 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -38,6 +38,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* do not passively change this clock rate during subtree rate propagation */
+#define CLK_NO_RATE_CHANGE_DURING_PROPAGATION BIT(14)
 
 struct clk;
 struct clk_hw;

-- 
2.47.0


