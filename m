Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D22CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tniivSBTBfHmSVBUMCG/poEjwuMIXoYdwTE1p96lgEs=; b=Kb+HoDN1nk4gwje0XQ+yiTRB4Y
	KhuKjPijNNPdvNlQRH4GwxNSZAf7lT+6kNoNP8zkebTZ0+VbMPEbT9tR7zQFzc8U4rQMXa5Mmmt0k
	uAHX5ZhEg4IaNlCdy7kCpWI6HUpDXY6LfcQp70/o4BQp6U1QPTQ950D4ZeYx5PQclAimvgHzrKlET
	gSbVR9lIbGQGDOxcXVPIEP3WyfSLBxaOtDKl8Ia74ezbh1cAz86VCjqZuQPHjT0VSisnavi6vw+ca
	cBTWgyP33P/JfESjj+/REyD/Q92UDyvdtPgrhp8mWR6vEjWpGcnl3NWfZnH8V+UA9eJ+0XKk1k/y/
	RVS9mF8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9oC-0000000Bd9Q-0iFA;
	Fri, 12 Jun 2026 21:53:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9oB-0000000Bd8k-0fJ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 21:52:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7CAC429C1;
	Fri, 12 Jun 2026 21:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBA01F000E9;
	Fri, 12 Jun 2026 21:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301178;
	bh=tniivSBTBfHmSVBUMCG/poEjwuMIXoYdwTE1p96lgEs=;
	h=From:To:Cc:Subject:Date;
	b=XTPbg0tNroWotaCOdjMyiUYu7nMJ1wfEW1nerXr9C/omILHm+zRKuN0iuC/mFgE87
	 sriKxkrC1QF2sr4L7zVzz5MdmkkB10K/oMpDm57EI68j2BLa+NGxHauq+zUBxSdGju
	 odRHc8JOMmjRKiJlfTTo8U+UEXBy1J/CS31BRcYAadRHLHTLQC1qq/6AvxAL5ILOZX
	 /1vpribp1D4lCBDA2xfGaa0aJL0yOTnXxbrvFAgrPsvwT/EGGxSf9dXhUSmTtjNgZm
	 51wVvPGCA7l8R+bNdonDQimGXlOg/7eiaLiLGF6qOxsm/n90ZCYi4MSUINDvtlhROx
	 8cDokE2KpZpvg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: at91: Read "reg" with helper
Date: Fri, 12 Jun 2026 16:52:51 -0500
Message-ID: <20260612215251.1888345-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
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

The "reg" property is an address-sized DT cell property. The AT91
compat clock parser only uses a small bus id from it, but reading it
with the u8 helper does not match the property encoding.

Use of_property_read_reg() so the code goes through the helper for
"reg" properties, then keep the existing range check before passing
the bus id to the clock registration code.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/clk/at91/dt-compat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 5d543e807843..dad26dd5e71d 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -2,6 +2,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk/at91_pmc.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -217,7 +218,7 @@ CLK_OF_DECLARE(of_sama5d4_clk_h32mx_setup, "atmel,sama5d4-clk-h32mx",
 static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
 {
 	struct regmap *regmap_sfr;
-	u8 bus_id;
+	u64 bus_id;
 	const char *parent_names[2];
 	struct device_node *i2s_mux_np;
 	struct clk_hw *hw;
@@ -228,7 +229,7 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
 		return;
 
 	for_each_child_of_node(np, i2s_mux_np) {
-		if (of_property_read_u8(i2s_mux_np, "reg", &bus_id))
+		if (of_property_read_reg(i2s_mux_np, 0, &bus_id, NULL))
 			continue;
 
 		if (bus_id > I2S_BUS_NR)
-- 
2.53.0


