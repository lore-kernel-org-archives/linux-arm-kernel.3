Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158E2D12D5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 00:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSxjwG6onMgErgSEDcNFeXF11zUMnfmNgkeok6smJlw=; b=zGF0ByBYlU3shUbb4L025ogl4l
	SUied6UqKa5aVT4W7mlKzYlk7UZXyiwEh084KiZHIrJV+mCWQABIQ+6oaMVj723Jwq/QkRJ9hN1y+
	vvRzqwj7XIWEMMVHKimonHj6qGcoQHPmZpFJXuBeEyoy5KPpJYyoBBwZtHG2CBQ8qhK1Hma9OxqBi
	U9iU6coRQDuneUkyW/9yFGXFnGU1M3kK2eAu2iq+OOtSNof1amDTpNdvJbjrNUdW1SrcW1SlGo+fP
	+5D/zivoqdDeQQeXBa36W8ql0qeLLsEX/bw8lDatVKCVaSwcgFO6CuwBNLdrpPVzH2pLYYsTgjV6L
	fDP8cdYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIcV-0000000FxJ4-143H;
	Mon, 11 Nov 2024 00:49:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIaf-0000000FwtT-0Jew
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 00:47:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0A621480;
	Sun, 10 Nov 2024 16:48:04 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B79663F66E;
	Sun, 10 Nov 2024 16:47:32 -0800 (PST)
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
	Icenowy Zheng <uwu@icenowy.me>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] clk: sunxi-ng: mp: Add SUNXI_CCU_P_DATA_WITH_MUX_GATE wrapper
Date: Mon, 11 Nov 2024 00:47:16 +0000
Message-ID: <20241111004722.10130-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111004722.10130-1-andre.przywara@arm.com>
References: <20241111004722.10130-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_164737_347077_BA6476BF 
X-CRM114-Status: GOOD (  10.60  )
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

The PRCM CCU in the A523 SoC contains some clocks that only feature a
P (shift) factor, but no M divider.
Treat this as a special case of an MP clock: by forcing the M mask to be
0 bits wide, this always result in the M divider value to be 1.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_mp.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
index 6e50f3728fb5f..e235fdfde2d36 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.h
+++ b/drivers/clk/sunxi-ng/ccu_mp.h
@@ -71,6 +71,24 @@ struct ccu_mp {
 		}							\
 	}
 
+#define SUNXI_CCU_P_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+				       _pshift, _pwidth,		\
+				       _muxshift, _muxwidth,		\
+				       _gate, _flags)			\
+	struct ccu_mp _struct = {					\
+		.enable	= _gate,					\
+		.m	= _SUNXI_CCU_DIV(0, 0),				\
+		.p	= _SUNXI_CCU_DIV(_pshift, _pwidth),		\
+		.mux	= _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
+		.common	= {						\
+			.reg		= _reg,				\
+			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name,    \
+								   _parents, \
+								   &ccu_mp_ops,\
+								   _flags),  \
+		}							\
+	}
+
 #define SUNXI_CCU_MP_WITH_MUX(_struct, _name, _parents, _reg,		\
 			      _mshift, _mwidth,				\
 			      _pshift, _pwidth,				\
-- 
2.46.2


