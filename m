Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30268CAC596
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYWRz20Rmvhnac0DS9sDWqyczHi/Us3clZQP6R0KXd4=; b=hSyGWDg/EKVjNca44VAz4xSkRa
	DWbPbbm+wNPDbXT2b2mXEG5J179e2Iqsodp6ccduB1uM6DcoLJrpak6mg/YRkySvILlyFBQDuQVs8
	TMosa1S9ZGcJVMrHaf6kKSEkvYklkZ0bLyToWKoRulc1S9Lt/+PkyEnJE2ToHeF4j8/zEmXhVl1WI
	oSUDjutnCwPBsg0oYggqJ52XXQDGI2CMQQFdKCGSjUpuSyMrORqo0BO+Cpr1/hYlWTSLnMZ9pvn/V
	oSC9OEptWlospjjUJ+c7YwmI9Wgcx3Q25G1pBzzftFQsGF3mQaC7ICAARcSJ2ye1CJd4at9XCcXrk
	OfcQUxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlOC-00000004Xo6-11eI;
	Thu, 11 Sep 2025 17:47:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlO7-00000004Xju-1Tve
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 17:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15A1E44FCA;
	Thu, 11 Sep 2025 17:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52A2C4AF0C;
	Thu, 11 Sep 2025 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757612835;
	bh=1ZGcBxhR574KIHzPTRucl3u543FWRbkCW4Ao9ObAk1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G2J++6ObT+/bFDQ28j5g6wlsxqMCaur8L7DjvJqCzgBwC6+uusKH7LTfD2NtlJj0n
	 W/A/v0Bp3yX9pIMzVTkPgsPGCrkWHTu22zxh8EeHKai/TDNsZwp5GzGS0GpX+lm5GS
	 CMY2pRnHv21ccTJqlK7l2fMrLdklCqugP+qtxucZLR6Gf8g3+dvvH/+ZW84R8qoi0H
	 BRbqznKQH2GaQ03OFf1Jwa7aEmSwYHHvXsmYNUVRdsV5SUIJ6mZi+svyEYhDdGtS/6
	 flH+GhAei8XQ9+jGf2OK+Xwkx41OsSU5NyYkWAkTqu6NrpVzCiJWPeyTR9C1aO0ldK
	 qdGWVVJmbxt8Q==
Received: by wens.tw (Postfix, from userid 1000)
	id E8C225FEE9; Fri, 12 Sep 2025 01:47:11 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] clk: sunxi-ng: div: support power-of-two dividers
Date: Fri, 12 Sep 2025 01:47:07 +0800
Message-Id: <20250911174710.3149589-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911174710.3149589-1-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_104715_412278_F49D6543 
X-CRM114-Status: GOOD (  11.93  )
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

From: Chen-Yu Tsai <wens@csie.org>

Some clocks (for timers) on the A523 are mux-divider-gate types
with the divider being values of power-of-two.

Add a macro for these types of clocks so that we can use the divider
types instead of the M-P types without an M divider.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_div.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index 90d49ee8e0cc..be00b3277e97 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -274,6 +274,24 @@ struct ccu_div {
 	SUNXI_CCU_M_HWS_WITH_GATE(_struct, _name, _parent, _reg,	\
 				  _mshift, _mwidth, 0, _flags)
 
+#define SUNXI_CCU_P_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+				       _mshift, _mwidth,		\
+				       _muxshift, _muxwidth,		\
+				       _gate, _flags)			\
+	struct ccu_div _struct = {					\
+		.enable	= _gate,					\
+		.div	= _SUNXI_CCU_DIV_FLAGS(_mshift, _mwidth,	\
+					       CLK_DIVIDER_POWER_OF_TWO), \
+		.mux	= _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
+		.common	= {						\
+			.reg		= _reg,				\
+			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name, \
+								   _parents, \
+								   &ccu_div_ops, \
+								   _flags), \
+		},							\
+	}
+
 static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 {
 	struct ccu_common *common = hw_to_ccu_common(hw);
-- 
2.39.5


