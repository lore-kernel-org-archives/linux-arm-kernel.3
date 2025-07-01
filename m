Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4168C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10CrkmTgSLJik9iWvWlZ+JkbkME3c/v672UmzhYnHoI=; b=ORdRQdQLjHcoxF94uayeXsSMFk
	k61SUW/jPKLEh1CD1DgZNjP3xPalnmsxYn20eMoTDnCxr6HMvf8fgj/yJ4IYFmPFzfpaGbWSLksQr
	QmKzk+zk/KBlmvPuD3Y/IhLcwoINH6Z41u+AM0yegqB+aJqWeG6OYgD8+yIhMvwk3IhtGpyhYRMha
	ZprBxcpRFtE7kYLgZjP3SGVEDGZkENI9I9sNGmUZfCtqJuqcpeX/HNuVVaG+y8ys+bsJ6UNz7VNuy
	7nYar5wr4jU/eQni2YQ0FxBzV5B6ZbaUX0wH3BuZ2L4UbW3PQFkiDxjgTIK2lHKVFdvACBF2InU8D
	/59lMlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhWn-00000006ZLN-40G5;
	Tue, 01 Jul 2025 20:24:29 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhQ6-00000006YJO-44vB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 20:17:36 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 583081F0003D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 20:17:33 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D7ACBAC9686; Tue,  1 Jul 2025 20:17:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 4E39AAC9687;
	Tue,  1 Jul 2025 20:11:34 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 4/5] clk: sunxi-ng: v3s: Fix TCON clock parents
Date: Tue,  1 Jul 2025 22:11:23 +0200
Message-ID: <20250701201124.812882-5-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201124.812882-1-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_131735_164621_5EE1F784 
X-CRM114-Status: GOOD (  14.14  )
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

The TCON clock can be parented to both the video PLL and the periph0 PLL.
Add the latter, which was missing from the list.

Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index 86d933d1ac72..52e4369664c5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -350,7 +350,7 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
 				 0x104, 0, 4, 24, 2, BIT(31),
 				 CLK_SET_RATE_PARENT);
 
-static const char * const tcon_parents[] = { "pll-video" };
+static const char * const tcon_parents[] = { "pll-video", "pll-periph0" };
 static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_parents,
 				 0x118, 0, 4, 24, 3, BIT(31), 0);
 
-- 
2.49.0


