Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05159C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mGHfYVi6qDm7s7G6q93buprYrMKUFRSSUos1yUz/o4M=; b=Z0+W5A7KUbKCcCypcH3gYYrraU
	qu64iVGz16unMPH4N+yKfTWrr3PAQFFa9BruKYnjpfX1HF8qNXlykpGIb8Rf/+pdqsnugMl+YUer6
	V9HUv024VMrMSv948fRzY2Sx8FygTgMvQoKZPHDuf9aoJeeBeCJ3+Laicwe1o+I7Eo0QjxnawDmzp
	elYzStPTfZKzeheaoO9nazWkD7N6WnnEpubaFZa76M5WR1iZHTd0xlKlyAAr41Lnl7V5eBNGcE17n
	vOsnHirWJc76/R0m7qMrrPsBLV83wYC6Q+2XQKlD/44Y4pGa6rGPJ2Y8atr0/5EV/xSjgjjtGaSI/
	wVRagkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMAY-0000000D25A-1d8k;
	Fri, 21 Aug 2026 10:08:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMAW-0000000D249-3aAU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:08:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5234560A71;
	Fri, 21 Aug 2026 10:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0189B1F000E9;
	Fri, 21 Aug 2026 10:08:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] peci: controller: aspeed: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:08:05 +0200
Message-ID: <48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
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

Part One[1] fixed all cases that I identified to be real bugs, in
response to a crash I saw on BeagleBone Black.

This patch is the PECI subpart of Part Two, which fixes remaining cases
that are currently harmless.  These are still fragile, and may cause
future breakage when converting drivers to a different method for
specifying the parents.

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
---
 drivers/peci/controller/peci-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
index a0c99ecf7f3805a1..2f4ea0e7d7a77dbd 100644
--- a/drivers/peci/controller/peci-aspeed.c
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -413,7 +413,7 @@ static struct clk *devm_aspeed_peci_register_clk_div(struct device *dev, struct
 						     struct aspeed_peci *priv)
 {
 	struct clk_aspeed_peci *peci_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *parent_name;
 	char name[32];
 	int ret;
-- 
2.43.0


