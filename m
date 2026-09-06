Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10A9C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 07:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kwa35a71ZPo+sybP/X3LF88saD0zkIeKsdxVVsoYRc=; b=O2+OL9W781l++aK7JD74ghlnBb
	KFH/d6K/fFGAo10HNVc9OFVn/5E0jUq1m4DkUZKVshmv6E4QmKSyEeCvHew0k26x1vsCLG0//qDhR
	K8z1YXzgbEKGwSFD6P6INPj9HWM2Cyh3EpbAn5gt5jl8y4QIM/brqYydnBk5f1KeK7102N3cNWy6J
	hHKZwU0Nv1KTDNzyUpYljCKVgn0zZwBI0qKKU2H6tsFngkpjaC7MpBu9ErlTIopcxRM1ZY/PN6u97
	w6ysAiWuRu0368eTyLhFnYIH+Q4yv60nYUf2mS4blIPs/m51Rb8Jw2LhPtwsTSa5iimP2EZjFvCin
	g5QsvyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36yN-00000004nCy-2aB0;
	Sun, 06 Sep 2026 07:07:27 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36yL-00000004nC2-05to
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 07:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788678435; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XzkrWwNXhmHhgXTfmUzzt15a2E9fsLY2rFdEk14IYJI1gEKvNJPkVtIsizH0TwtE9qWQReSsZ+8nBbaS7oMCbPyEio6q+4Pi7lmDNH0NXMivtEX3kwAvwL9JnSj41zCnoWJcuJhFqC8uEChVzHA7kuReaC3XOIQKtOSBB6PfPOg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788678435; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5kwa35a71ZPo+sybP/X3LF88saD0zkIeKsdxVVsoYRc=; 
	b=Jz1o7dVcwzHVVyFhgrRFd4dl7kHH0eUMXpa8gjr/V7dBUEF2J8J3UkG4Xm48mmTn5s9Fnf0lDW94qtkmfXJJXj5n6Fdg4M8AH4poDJLTIjVVc8CEH5z57XZ0zQyTYLTUYPMn679PnbJTC+ByiGu5XDHv8HQdYJnazae9xArOU0c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788678435;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5kwa35a71ZPo+sybP/X3LF88saD0zkIeKsdxVVsoYRc=;
	b=e4GZpIUNO+9/o7O7Sj/ffZDp183c2wndBjiT1qSC+s71d1S+UViWzJrtcMnzheJ2
	KYiyA6eptpPPqoAV59FSz0+d9ZaXMwuEwpdz9kbmnwgHQp50dip2qwzwLuOhEz63hyJ
	hjvVI8z9MZ8cxnb5+Q+3paaTe3togU8ClJ7ot/40=
Received: by mx.zohomail.com with SMTPS id 1788678433543920.0568449569804;
	Sun, 6 Sep 2026 00:07:13 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 06 Sep 2026 15:06:38 +0800
Subject: [PATCH 1/4] clk: sunxi-ng: div: Add feature support to M clock
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-sunxi-clk-no-p-v1-1-cbde21c9fe69@pigmoral.tech>
References: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
In-Reply-To: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=3rliFb59kMUShQX5C/SuuQHnHhhNnJ/BJJbg/03BpRA=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLmCnLcyTm2+cFksZqfO+8eV1sztzjZM3mL6nKz60c1a
 xOSdkz27ShlYRDjYpAVU2Th8hf/Z63D8+2IQOt9mDmsTCBDGLg4BWAi1RUMf+UNLhh8YtTMeXhp
 8er8/4xZeiv/hYcJ276cubDtb/nuBG2Gf8pBl3J5DiTlq2anXV4RynN4H5dTvGf3BKFlukc8L+T
 e4AEA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_000725_145855_86D13CB0 
X-CRM114-Status: UNSURE (   8.62  )
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

Add a variant of SUNXI_CCU_M_DATA_WITH_MUX_GATE() that accepts CCU
feature flags, such as CCU_FEATURE_UPDATE_BIT.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu_div.h | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index a30a92780a05..6d3541a3b519 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -212,16 +212,17 @@ struct ccu_div {
 	SUNXI_CCU_M_WITH_GATE(_struct, _name, _parent, _reg,		\
 			      _mshift, _mwidth, 0, _flags)
 
-#define SUNXI_CCU_M_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
-				       _mshift, _mwidth,		\
-				       _muxshift, _muxwidth,		\
-				       _gate, _flags)			\
+#define SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents, _reg, \
+					    _mshift, _mwidth,		\
+					    _muxshift, _muxwidth,	\
+					    _gate, _flags, _features)	\
 	struct ccu_div _struct = {					\
 		.enable	= _gate,					\
 		.div	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
 		.mux	= _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
 		.common	= {						\
 			.reg		= _reg,				\
+			.features	= _features,			\
 			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name, \
 								   _parents, \
 								   &ccu_div_ops, \
@@ -229,6 +230,15 @@ struct ccu_div {
 		},							\
 	}
 
+#define SUNXI_CCU_M_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+				       _mshift, _mwidth,		\
+				       _muxshift, _muxwidth,		\
+				       _gate, _flags)			\
+	SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents, _reg, \
+					    _mshift, _mwidth,		\
+					    _muxshift, _muxwidth,	\
+					    _gate, _flags, 0)
+
 #define SUNXI_CCU_M_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
 				  _mshift, _mwidth,			\
 				  _muxshift, _muxwidth,			\

-- 
2.55.0


