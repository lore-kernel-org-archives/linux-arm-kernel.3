Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613B7C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkTkC1l251bvUW6Wv/xTLd5HH/z3uzYxD3i6DfSUpQU=; b=Pohl6EdiN9Jy07r/fHLonOY/FU
	Wwjrb5I2K3++NLjSBnThk0QTbHHwoyjOYkJCPzyyxVdhf9th0jR81hcmDNifjzZClY77t6rCLlEMe
	M8WcL7fIVsq22l3on3dBVN/Wem+Ys4QkfBx2Xtza8ofqhhYaMIezMYLaJxGBvvXIR77jbve2JQBIq
	Iv6g8L3UCu7FB2Ewdgm+83ZwZfOQSb6HBZXUAtXNFAn6YLr8JArZzuBj9PX8g85nbfU6p26raICzi
	abNIgWwmF+YSwl9ayiLdoPGqwTyOI4hXb83qjFmK4yQfGbNzZ1cUSA/bs+r2gfeude9e9jrmIu7GY
	L2G/afEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxM7G-0000000D0go-3Dog;
	Fri, 21 Aug 2026 10:04:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxM7B-0000000D0e9-1dD1;
	Fri, 21 Aug 2026 10:04:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB67460DBF;
	Fri, 21 Aug 2026 10:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D948F1F00A3E;
	Fri, 21 Aug 2026 10:04:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] media: samsung: exynos4-is: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:04:30 +0200
Message-ID: <2cace1b92cc8333eca63874de17dd5d5b1f9e5d6.1787240035.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787240035.git.geert+renesas@glider.be>
References: <cover.1787240035.git.geert+renesas@glider.be>
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
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 2e08c4435859e8d2..638babf52822113c 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1313,7 +1313,7 @@ static int fimc_md_register_clk_provider(struct fimc_md *fmd)
 
 	for (i = 0; i < FIMC_MAX_CAMCLKS; i++) {
 		struct cam_clk *camclk = &cp->camclk[i];
-		struct clk_init_data init;
+		struct clk_init_data init = {};
 		const char *p_name;
 
 		ret = of_property_read_string_index(dev->of_node,
-- 
2.43.0


