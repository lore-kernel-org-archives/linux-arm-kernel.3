Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A97C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJAN7rIhmTBHo7d66DHo1t6JV1NbndkXBoxyqopysks=; b=Uvy6X5bTIJ4cn2hCcUkngLH4e1
	985s9i9YnBiRnYqkHjjJFHaDJWwbDqqmF1V/0MWBD3ZoETPVKvaorZzFOvkFdh3oZ6WMK63VnjNiA
	qitb3sSgBkcJeh60WGKRO6kmyDWb5IJFANRcCKx8KWM+pvpyGqQ6klJmIhwvFGNjcJx1Aq3AtElwI
	sQvWcZBlUfrtQtIeC/2UyPDQLM4+xErDvw01Pkny1PMNsEWNmYv1XvpuWiCuM5czPQqrE6Zhg1wCh
	xJkWXI9Jq0TgHJR4kPLaXyq4am+w7xM8tnsjvmi6bK05AMcdj7tbl0cxwdXQDrkJhgCvWtf4AMsBh
	3pslqt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Jf-0000000GsUf-3wsb;
	Thu, 03 Sep 2026 09:01:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Je-0000000GsTu-34wC;
	Thu, 03 Sep 2026 09:01:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FC31600D1;
	Thu,  3 Sep 2026 09:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB501F00A3A;
	Thu,  3 Sep 2026 09:00:58 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH net-next v2 3/3] net: phy: air_en8811h: Make sure clk_init_data is fully initialized
Date: Thu,  3 Sep 2026 11:00:41 +0200
Message-ID: <0e869f49c910ce054aa22ae84480aab69420bb92.1788425654.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788425654.git.geert+renesas@glider.be>
References: <cover.1788425654.git.geert+renesas@glider.be>
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

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Compile-tested only.

v2:
  - Add Reviewed-by.
---
 drivers/net/phy/air_en8811h.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 0eeb7b9a4e260bcb..429231949120c7c8 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -932,7 +932,7 @@ static const struct clk_ops an8811hb_clk_ops = {
 
 static int an8811hb_clk_provider_setup(struct device *dev, struct clk_hw *hw)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_COMMON_CLK))
@@ -1031,7 +1031,7 @@ static const struct clk_ops en8811h_clk_ops = {
 
 static int en8811h_clk_provider_setup(struct device *dev, struct clk_hw *hw)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_COMMON_CLK))
-- 
2.43.0


