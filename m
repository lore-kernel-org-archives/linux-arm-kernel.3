Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41130C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cdt1dFPAQC3KfJYerMZNMs9WcRyMdKt8cJfu1JXIZ1I=; b=txdJz5VymeBwzULIxtwsVu7PCN
	1n6OU8QPcRXy48d57IzoaQP+4QgLseH2PJi1dZLngo6Meu9rk93VN4kddcuVfkjKd+geG6YwCbBPs
	kjaBJ5BiibsuWp5/XPQVzXVtXdqu8zJYm8mtb83NY2II8eDm3mX+8Li9ZvVL7yCeuF8BX8AlzjpJC
	Edcex6122BodX0a2FZyPhR2xWYk9yEp4QrYZorsRZvPYftE9UzyWxwywzbt36/nJVRtX/fAD4/z4m
	eKBPTeQN5HkN4SFQazjKQKhRyO9Fk1v/ejcwRcZk80nbK4WrNNMh75UY0iGAi8gDq89XdAPdJdifp
	+WKLkybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKza-0000000Cpq5-1YlS;
	Fri, 21 Aug 2026 08:52:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKzR-0000000Cpl8-0z8p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 08:52:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CFE561836;
	Fri, 21 Aug 2026 08:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55311F000E9;
	Fri, 21 Aug 2026 08:52:37 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] soc/tegra: pmc: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:52:25 +0200
Message-ID: <70aca0e57b9900db051aade5a1af2e42c4d30ea5.1787239869.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787239869.git.geert+renesas@glider.be>
References: <cover.1787239869.git.geert+renesas@glider.be>
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
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 41ed716d5857317d..c42e28fe2b8b0ff9 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2694,7 +2694,7 @@ tegra_pmc_clk_out_register(struct tegra_pmc *pmc,
 			   const struct pmc_clk_init_data *data,
 			   unsigned long offset)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct pmc_clk *pmc_clk;
 
 	pmc_clk = devm_kzalloc(pmc->dev, sizeof(*pmc_clk), GFP_KERNEL);
@@ -2752,7 +2752,7 @@ tegra_pmc_clk_gate_register(struct tegra_pmc *pmc, const char *name,
 			    const char *parent_name, unsigned long offset,
 			    u32 shift)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct pmc_clk_gate *gate;
 
 	gate = devm_kzalloc(pmc->dev, sizeof(*gate), GFP_KERNEL);
-- 
2.43.0


