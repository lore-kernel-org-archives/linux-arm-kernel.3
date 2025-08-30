Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACF9CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYWRz20Rmvhnac0DS9sDWqyczHi/Us3clZQP6R0KXd4=; b=ZCYLZsjcRhpmWXEM3hnEHcniZo
	+/cxjqOlPzhivzJ8Q+DKCk92bjTIoDwn3w0e5217DkMGEEBrAFjmE400ynS0jNJlGTpK5pyLrm3/k
	M/Ys7lLg5mp2bjFUmYh+1A6WIVyhY+5+ljcry172ANvyYyybR9f36furIyGn7H90McZEXJixj2i01
	iy4aOey2M3s37yqGM5pQjMgiJ81S7/BbgqZUbktJUFa/H8+Ex7JOoOrbKI+YdgEjXHByRCt190qw3
	og8LOKq3+ciRHxUpEvQUzARQUbgH81IMMl4Fby8026hhLTwrHHsH4WlLk+Tr/09/knLCx1MnagjGE
	coitNdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPVE-00000008FG6-278o;
	Sat, 30 Aug 2025 17:36:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP4t-00000008CWe-1U4X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:09:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC009601A3;
	Sat, 30 Aug 2025 17:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B991C4CEEB;
	Sat, 30 Aug 2025 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756573762;
	bh=1ZGcBxhR574KIHzPTRucl3u543FWRbkCW4Ao9ObAk1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vI83iiQZBW4XV+q5tHTOwmQ1UKfYiLXsk0MMtdOuCQ9ZbneFFI3fw89x+rrjWm42X
	 QxJVdB+b/kND+DX3O/zobvZZ6DgTCvc5nqw7dRXvYknALf8gHzwb8b0KDAM9oRbXp8
	 DTM8frvOfBj+awY3OsDoQZjOJeQDbnTxXIpbco6C3SrQtYEcAsNXwzLiVIQHV6VcWl
	 B3qDoc+ODPjbq/o6YT4lG+uj2LNChj9BCdBR5I8IZPHNT4BFZpC2vEUPdZyrHGX2/h
	 vgJ23Gx71wOtQK5AphGRUjaFMkE9RjX0/eztrdX79rkAD9Y4RHtXX8nE6c8o4lHtvc
	 rNCtz6f+mL0TQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 6AA495FDD4; Sun, 31 Aug 2025 01:09:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] clk: sunxi-ng: div: support power-of-two dividers
Date: Sun, 31 Aug 2025 01:08:58 +0800
Message-Id: <20250830170901.1996227-6-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830170901.1996227-1-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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


