Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ECBC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ptAg9orO5fF+L/3aFSkOdsrGnqlEF75nAhw/Gbt6Hf0=; b=I5QzfOTeFtVmGl+05RiMjkNsPX
	g0DEwYav6tptYuh0E5eR4CghjWr7zsoBitGPa1/Iu0qR3RaFRUzW2/pxMmHf1EirkfnsMhrNy3YnH
	w4HiJ7kXdBgKzron3nD3R3M8+PALw5jY6QtE93rwYKcyQa7CZ2Wvmndx4kfL9B6r14pd2/5+2Yh+P
	fxn/ADMYauttY5L5a8oo9hfznOZRXFhdqzo59di1qLOS6cX4aHxh6OKGwH9f7d60y3QMMcS74IeFQ
	W3YK8o5Wi9aKRPmbMxO9g9wUdPymdyUitsZHDQWViCoQMB6klCxGHxeE7EbwQVjPSbI8R7ETOBcus
	l5xgxeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxObr-0000000DLen-3cnM;
	Fri, 21 Aug 2026 12:44:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxObq-0000000DLeG-1Ljz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:44:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DD4A60008;
	Fri, 21 Aug 2026 12:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47231F000E9;
	Fri, 21 Aug 2026 12:44:30 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: at91: main: Drop unneeded cast in at91_clk_register_main_osc()
Date: Fri, 21 Aug 2026 14:44:28 +0200
Message-ID: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

When assigning a non-const pointer to a const pointer, no cast is
needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No changes in generated code.
---
 drivers/clk/at91/clk-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index 6074ed2a16cede94..77f905e57e1ab4de 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -170,7 +170,7 @@ at91_clk_register_main_osc(struct regmap *regmap,
 	init.name = name;
 	init.ops = &main_osc_ops;
 	if (parent_data)
-		init.parent_data = (const struct clk_parent_data *)parent_data;
+		init.parent_data = parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
-- 
2.43.0


