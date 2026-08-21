Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05261C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkd+0RdHsO5QA+60GBu0G5Q3cvUYdTT6EfmHyWjm0Vk=; b=DYbd7i/3p0hvZkqfImExBxxQGU
	Erzuxgfl/g6dXK4agwNIk6hAiiUK07ks8XBJwlQ/ibsvkr7tR9Ii5bvYK+Bbv6t6Tzh++Lgp1mnJX
	w4DTynnv0y+rgqc4X+QEODTFn3E8FWxWsfcVPCqyVCJl8lwYoqcrDMEDS/rQp6tY9swmKm5i6f3Cw
	vVRlgFakAp/z+h+tIKmQaQE/ZvtAk+gIvW8U3LIubjTlk89w44IO+pSkJ+JhKdYVGLI8EPK0TmDVB
	eYR/IhbaBjFhiCaDTACw9JYfWC2ul3JfG0fn/oRVxnABfEAaBCzfgrlYEs3XQSvaid6UJ+TVc6olv
	l7162aRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMAI-0000000D1w3-1DgX;
	Fri, 21 Aug 2026 10:07:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMAC-0000000D1sg-3sYr;
	Fri, 21 Aug 2026 10:07:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61FFB60DBF;
	Fri, 21 Aug 2026 10:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A865D1F00A3E;
	Fri, 21 Aug 2026 10:07:48 +0000 (UTC)
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
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next 3/3] net: phy: air_en8811h: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:07:32 +0200
Message-ID: <ebafac1803ee032ebd544a6ec5a1608c5630d81a.1787240118.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787240118.git.geert+renesas@glider.be>
References: <cover.1787240118.git.geert+renesas@glider.be>
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
---
Compile-tested only.
---
 drivers/net/phy/air_en8811h.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index edd49c193e476838..d1ab8744288bba0c 100644
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


