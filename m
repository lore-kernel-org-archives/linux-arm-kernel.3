Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F8AC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOsVvv5bp7fsjHfJwgU8DZehRm4G6Pbq6a/AkRvdYbk=; b=2/xuE6PRdn6zuy1J+Jc+z/u0+k
	iup7LeSbEnPoUnslTY4fDen2lXaPst+kM6GN6TcqTjGcrTLTTSNdNdMJ7VG9laGyE0sTVqcGWsE4W
	ceR3Cv5mS9iDRM4UR3iAAJqpzFOB3USbKf5IDvf/QuWVuFSH73jUmuDoKRhUa18RI6jxsn51j4TZj
	/z8KwvWSYZo5o1D64PP4LMck+NOGeuvnIf5WKzuTYhU0HTp37X5mOHmpkGERYQMvNuN5vZ7qy+b4U
	akAy0bDBM3P/VOj1cVDNHn20VIEjwPrOiPtAxVA+zYxLrMicFh5qNKaTu86MGjC+FNSqBHkTo0X9i
	I6LxGFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLcm-0000000CeBU-1zRC;
	Fri, 07 Mar 2025 00:31:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLXz-0000000Cd55-2f9c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:26:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C1FE169E;
	Thu,  6 Mar 2025 16:26:52 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F8443F673;
	Thu,  6 Mar 2025 16:26:37 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/14] clk: sunxi-ng: mp: provide wrappers for setting feature flags
Date: Fri,  7 Mar 2025 00:26:16 +0000
Message-ID: <20250307002628.10684-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307002628.10684-1-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_162639_801143_1D36E468 
X-CRM114-Status: GOOD (  10.56  )
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

So far our sunxi clock instantiation macros set the required clock
features depending on the clock type, but the new "dual divider MP
clock" requires us to pass that piece of information in by the user.

Add new wrapper macros that allow to specify a "features" field, to
allow marking those dual-divider clocks accordingly. Also add two
convenience macros that deal with the most common cases.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_mp.h | 58 ++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
index 6e50f3728fb5f..b35aeec70484d 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.h
+++ b/drivers/clk/sunxi-ng/ccu_mp.h
@@ -82,11 +82,35 @@ struct ccu_mp {
 				   _muxshift, _muxwidth,		\
 				   0, _flags)
 
-#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
-					_mshift, _mwidth,		\
-					_pshift, _pwidth,		\
-					_muxshift, _muxwidth,		\
-					_gate, _flags)			\
+#define SUNXI_CCU_MP_MUX_GATE_POSTDIV_DUALDIV(_struct, _name, _parents, _reg, \
+					      _mshift, _mwidth,		\
+					      _pshift, _pwidth,		\
+					      _muxshift, _muxwidth,	\
+					      _gate, _postdiv,		\
+					      _flags)			\
+	struct ccu_mp _struct = {					\
+		.enable	= _gate,					\
+		.m	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
+		.p	= _SUNXI_CCU_DIV(_pshift, _pwidth),		\
+		.mux	= _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
+		.fixed_post_div = _postdiv,				\
+		.common	= {						\
+			.reg		= _reg,				\
+			.features	= CCU_FEATURE_FIXED_POSTDIV |	\
+						CCU_FEATURE_DUAL_DIV,	\
+			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name, \
+								   _parents, \
+								   &ccu_mp_ops, \
+								   _flags), \
+		}							\
+	}
+
+#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents, _reg, \
+					     _mshift, _mwidth,		\
+					     _pshift, _pwidth,		\
+					     _muxshift, _muxwidth,	\
+					     _gate, _features,		\
+					     _flags)			\
 	struct ccu_mp _struct = {					\
 		.enable	= _gate,					\
 		.m	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
@@ -94,6 +118,7 @@ struct ccu_mp {
 		.mux	= _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
 		.common	= {						\
 			.reg		= _reg,				\
+			.features	= _features,			\
 			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name, \
 								   _parents, \
 								   &ccu_mp_ops, \
@@ -101,6 +126,29 @@ struct ccu_mp {
 		}							\
 	}
 
+#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+					_mshift, _mwidth,		\
+					_pshift, _pwidth,		\
+					_muxshift, _muxwidth,		\
+					_gate, _flags)			\
+	SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents,	\
+					     _reg, _mshift, _mwidth,	\
+					     _pshift, _pwidth,		\
+					     _muxshift, _muxwidth,	\
+					     _gate, _flags, 0)
+
+#define SUNXI_CCU_DUALDIV_MUX_GATE(_struct, _name, _parents, _reg,	\
+				   _mshift, _mwidth,			\
+				   _pshift, _pwidth,			\
+				   _muxshift, _muxwidth,		\
+				   _gate, _flags)			\
+	SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents,	\
+					     _reg, _mshift, _mwidth,	\
+					     _pshift, _pwidth,		\
+					     _muxshift, _muxwidth,	\
+					     _gate, _flags,		\
+					     CCU_FEATURE_DUAL_DIV)
+
 #define SUNXI_CCU_MP_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
 				   _mshift, _mwidth,			\
 				   _pshift, _pwidth,			\
-- 
2.46.3


