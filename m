Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8BFC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 07:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWvPATyf5us1hIL7gmSUOSuEF6Ojc1BEfSz8FRNvOco=; b=yc2QGmtOAU7sUmINR9y9ds/Epq
	u7d32+gF+M0bPEYjS5FOPT99jOLISorfy5GGFRZno82147TpmqYgQGYDZOvfZf7Jr2JBJN8PFnHXv
	ayI1LONuJxHkEiz/1C/tG7+NBeCfzeorNmFKtL3nBEsGEDQfxBOh/PDlDtCPfoLcb+gYH3oBzG68O
	b4x7JiaaXtQ+PlHi3noe4rLEEuX54tz1vVDkruLtAsEEmY7uFFCjdw+h9ySnNdEeZiJjNYuVf8YfI
	6S0jtVBMYNLruxWyucz8IMD92VnY+bRea+07vgjJ2X/HARKFHlm47kl1C25vFvgElxZdUt6Udp20Q
	Fi9sKeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36yW-00000004nHQ-14xh;
	Sun, 06 Sep 2026 07:07:36 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36yT-00000004nGd-3pwA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 07:07:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788678447; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=afaK2MXYMqtS8SZI6Kg9ssSsLA0agFwUQaXq6RY1+cxJROpV92THVde5IcObzFMigjhA3bA5XYtA6kKoCDXdPjzp1/3ykZTdSPVAJPXinbsGKVZu+62qcyVxWH/kwDIcX5AlLpMuEkOiyhdS0QuBLcDdYrElTbhRCYA0giZtzX0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788678447; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bWvPATyf5us1hIL7gmSUOSuEF6Ojc1BEfSz8FRNvOco=; 
	b=FKlYVPjfJkbMfMbnc60LSGPea+jqmrRXjr+U0cWic1Jzr/xBKMtJBI5JQFGXa2ppa5+9igRMBXh8j8qPCMtO24w7y6NZVVih0kbMh8MqFD6ahALZ2txhWGJHHe8aJy23D+Y7FlFnFvTRW5yRte3MI4kELRnERJmf3wfplIjDUhY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788678447;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=bWvPATyf5us1hIL7gmSUOSuEF6Ojc1BEfSz8FRNvOco=;
	b=oojGu83t0mtwGNGP+rwtNUwpk/xUH8xOKhcwzUylqgJglu9h6EFlj5J5xCRsKBlv
	WxzzEYQuSqRxYQY1PpdLD8032irqEm2PJWkuu8GPuMRBkns3QuGNMZQz+SiU4p4j2G6
	7zvyEMlo89VvNNei1pmdaNXy31NV39Mj9THHFXJA=
Received: by mx.zohomail.com with SMTPS id 1788678445967317.3662545271495;
	Sun, 6 Sep 2026 00:07:25 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 06 Sep 2026 15:06:40 +0800
Subject: [PATCH 3/4] clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for
 high-speed timers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-sunxi-clk-no-p-v1-3-cbde21c9fe69@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3809;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=/1LOQjYt1FbY4EQLxeXf6XqbouFzXGxErt4sP9upvBk=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLmCvJFqKw2zf+8b3HXXb7w5MoTdhyVwSquH3qUcgq+G
 nbpmG3oKGVhEONikBVTZOHyF/9nrcPz7YhA632YOaxMIEMYuDgFYCJLshkZmlkmuMTMuqBVNaF0
 uWe0ePa2Y6tz3eT6qp6xpb231RQ6zMiwblmIGpd3UvvOB8UNNq/1bpyfdvdvWF5r+Yyg3X821MY
 xAwA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_000734_005564_584C95DB 
X-CRM114-Status: UNSURE (   9.75  )
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

The high-speed timer clocks only have a P divider, but are currently
modeled as MP clocks with a zero-width M divider.

ccu_mp_set_rate() generates an invalid mask for the zero-width M
divider, clearing unrelated register fields. Model these clocks as
P-only clocks to avoid accessing a nonexistent M divider.

Fixes: 74b0443a0d0a ("clk: sunxi-ng: a523: add system mod clocks")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 83 +++++++++++++++-------------------
 1 file changed, 36 insertions(+), 47 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 9bc3ff0ab12d..0714090cc3b0 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -512,58 +512,47 @@ static const struct clk_parent_data hstimer_parents[] = {
 	{ .fw_name = "losc" },
 	{ .hw = &pll_periph0_200M_clk.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
-				       hstimer_parents, 0x730,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
+				      hstimer_parents, 0x730,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
-				       hstimer_parents,
-				       0x734,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
+				      hstimer_parents, 0x734,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
-				       hstimer_parents,
-				       0x738,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
+				      hstimer_parents, 0x738,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
-				       hstimer_parents,
-				       0x73c,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
+				      hstimer_parents, 0x73c,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
-				       hstimer_parents,
-				       0x740,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
+				      hstimer_parents, 0x740,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
-				       hstimer_parents,
-				       0x744,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
+				      hstimer_parents, 0x744,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
 static SUNXI_CCU_GATE_HWS(bus_hstimer_clk, "bus-hstimer", ahb_hws, 0x74c,
 			  BIT(0), 0);

-- 
2.55.0


