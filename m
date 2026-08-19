Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87A7C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 19:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aVbZNK2zIWYHCPumH1NM1aOA2/AMiaZqpUdheZn/rI=; b=3vMXuU4U4wOjuT/tB2lgI5F7cH
	vDGToM6R2gRxybenrW5UFqfv1EtttzDHpzJ3dj4xOL1IGSSJxTg0UIxmMW428sTKi5h3H6CKjI/DK
	xet4XbE9y+TpqgBM543yfyUdDernfzfAH7JU2eh0tInthDaWZ1gHuQnGyeM1BeCteP21Lug+bcr/I
	b6Bd6VxNHqtl46uqMGfp0bjzMZNtrYU250CAcWgZGb5xgd+EuOUFDDhNS/QSAOnYYXdMjkia5deYN
	IXZhFWGd5XJlO6Hdtrpt4FpgJsnlZqPaswiJC10pGDjKC90B4r43igJQNn3YkU/DHVteX2y9oeMQP
	Nb8Q8OsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlbs-0000000APtk-3AJP;
	Wed, 19 Aug 2026 19:06:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlbr-0000000APtB-0YJ9;
	Wed, 19 Aug 2026 19:05:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AFEAC403DB;
	Wed, 19 Aug 2026 19:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3C11F000E9;
	Wed, 19 Aug 2026 19:05:52 +0000 (UTC)
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
Subject: [PATCH treewide 2/5] clk: visconti: Make sure clk_init_data is fully initialized
Date: Wed, 19 Aug 2026 21:05:16 +0200
Message-ID: <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
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

visconti_clk_register_gate() fills in init.parent_data, and assumes that
init.parent_names is NULL.  However, the latter in uninitialized, and
thus may cause a crash.

Make sure all members are fully initialized, to fix such bugs, and to
avoid future breakage when converting drivers to a different method for
specifying the parents.

Fixes: b4cbe606dc3674b2 ("clk: visconti: Add support common clock driver and reset driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/clk/visconti/clkc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/visconti/clkc.c b/drivers/clk/visconti/clkc.c
index d0b193b5d0b35f94..4018d1298880dfbb 100644
--- a/drivers/clk/visconti/clkc.c
+++ b/drivers/clk/visconti/clkc.c
@@ -81,9 +81,9 @@ static struct clk_hw *visconti_clk_register_gate(struct device *dev,
 						 u8	rs_idx,
 						 spinlock_t *lock)
 {
+	struct clk_init_data init = {};
 	struct visconti_clk_gate *gate;
 	struct clk_parent_data *pdata;
-	struct clk_init_data init;
 	struct clk_hw *hw;
 	int ret;
 
-- 
2.43.0


