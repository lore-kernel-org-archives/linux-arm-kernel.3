Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890B4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dv414bGDQnZQWPdCPUKgAm/zu4pr7ZCG/CuISlW4utQ=; b=YPd1yQ8ns0GpXBQ/cH5AL/xC78
	Y9py7PzrZ+/F8aeWqACI1tHFoVK4JImvzoBZ9FclrSaGL+6ct/hVvVOFhxRzqIf+waMkozgga/bhe
	4ZOBLxY10hDFGn9nH3iJs663KuOP9r7ROyxTgJ8dyABiWKGOzaVYKdFUT5pwEqoM7PfTB9472W3mt
	+n7BIms3tDS/B2jSGrMfgxbACwKuhvieAvmwIl0Q2DDuCZC7PQtmv2tsmENkoZtl9v4vQhOO6SKml
	MrhHI2SRvuNL6UApmdGh+JWPMdKi8eB15ultDAv7obrlk8to/mk+FySxTt/oXbIenCohPjHetzDvA
	qLPdEQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFDn-00000003Pkc-2uiP;
	Wed, 26 Feb 2025 11:04:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEoO-00000003KQ6-08Cd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:38:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B3241C0A;
	Wed, 26 Feb 2025 02:38:55 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 650C73F6A8;
	Wed, 26 Feb 2025 02:38:37 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] clk: sunxi-ng: mp: provide wrapper for setting feature flags
Date: Wed, 26 Feb 2025 10:37:33 +0000
Message-Id: <20250226103734.1252013-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226103734.1252013-1-andre.przywara@arm.com>
References: <20250226103734.1252013-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_023844_117966_543B2701 
X-CRM114-Status: GOOD (  10.68  )
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

So far our sunxi clock instantiation macros set the required flags
depending on the clock type, but the new "dual divider MP clock"
requires us to pass that piece of information in by the macro user.

Add a new wrapper macro that allows to specify a "features" field, to
allow marking those dual-divider clocks accordingly.
Since the MMC clocks will be a prominent user, combine this with the
postdiv field required there. Users who just want the feature, can
pass in a postdiv of 1, users of just the postdiv can pass in a feature
mask of 0.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_mp.h | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
index 6e50f3728fb5f..1da1dcaf62ea9 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.h
+++ b/drivers/clk/sunxi-ng/ccu_mp.h
@@ -82,18 +82,22 @@ struct ccu_mp {
 				   _muxshift, _muxwidth,		\
 				   0, _flags)
 
-#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+#define SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(_struct, _name, _parents, _reg, \
 					_mshift, _mwidth,		\
 					_pshift, _pwidth,		\
 					_muxshift, _muxwidth,		\
-					_gate, _flags)			\
+					_gate, _postdiv,		\
+					_flags, _features)		\
 	struct ccu_mp _struct = {					\
 		.enable	= _gate,					\
 		.m	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
 		.p	= _SUNXI_CCU_DIV(_pshift, _pwidth),		\
 		.mux	= _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
+		.fixed_post_div = _postdiv,				\
 		.common	= {						\
 			.reg		= _reg,				\
+			.features	= CCU_FEATURE_FIXED_POSTDIV |	\
+						_features,		\
 			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name, \
 								   _parents, \
 								   &ccu_mp_ops, \
@@ -101,6 +105,17 @@ struct ccu_mp {
 		}							\
 	}
 
+#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+					_mshift, _mwidth,		\
+					_pshift, _pwidth,		\
+					_muxshift, _muxwidth,		\
+					_gate, _flags)			\
+	SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(_struct, _name, _parents,	\
+					     _reg, _mshift, _mwidth,	\
+					     _pshift, _pwidth,		\
+					     _muxshift, _muxwidth,	\
+					     _gate, 1, _flags, 0)
+
 #define SUNXI_CCU_MP_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
 				   _mshift, _mwidth,			\
 				   _pshift, _pwidth,			\
-- 
2.25.1


