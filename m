Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF70C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDTw1FI+W/Y9cT55g+yY0SwrkkeoLBsD7fCNgsbbJ7E=; b=kYRitl1VZaKW7R9ghCulXN4Mqq
	boe72qipWEinGd2Dk5Ex0JSfTVZbQ8P1AnY9Z2gCl+QZZNkhb2lgR6WcyQJN8GG9/5BPxId/hm+Jd
	jVtiQ7R9nx6QOsvIB1i3DJQdjfIlXuVImgLQ8yBRaixm3Kc8QuIO9PF/wrgMPvIugW3Ystj3iMbz1
	XgkNE0jA8Xqqkj89qcG6Q+WyPTx0Md8LDmlPaLuG5W12recGr3x7GsgiNG53hmXuRX8VspZw44KzF
	GwUWuQL6ncl8OjzI/PW/Pq+K7Avy+ESYmmn4J+pD02s6cHiKjOU+R/aNMeRm9ID6NbQ1G86EGtGLY
	beE6FzNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlcC-0000000AQ54-1D8m;
	Wed, 19 Aug 2026 19:06:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlc9-0000000AQ2V-0jOX;
	Wed, 19 Aug 2026 19:06:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99EE561878;
	Wed, 19 Aug 2026 19:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADE91F00A3A;
	Wed, 19 Aug 2026 19:06:10 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tero Kristo <kristo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH treewide 5/5] spi: amlogic-spisg: Make sure clk_init_data is fully initialized
Date: Wed, 19 Aug 2026 21:05:19 +0200
Message-ID: <9fb35ae0aedb7a6db0db6c78a8193c7602dd9d44.1787165329.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
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

aml_spisg_clk_init() fills in init.parent_data, and assumes that
init.parent_names is NULL.  However, the latter in uninitialized, and
thus may cause a crash.

Make sure all members are fully initialized, to fix such bugs, and to
avoid future breakage when converting drivers to a different method for
specifying the parents.

Fixes: cef9991e04aed330 ("spi: Add Amlogic SPISG driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/spi/spi-amlogic-spisg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index afc8af04638d3b6e..9049a87e9d0f2df6 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -636,7 +636,7 @@ static int aml_spisg_target_abort(struct spi_controller *ctlr)
 static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
 {
 	struct device *dev = &spisg->pdev->dev;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_divider *div;
 	struct clk_div_table *tbl;
 	char name[32];
-- 
2.43.0


