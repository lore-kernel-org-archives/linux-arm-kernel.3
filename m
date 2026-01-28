Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD49D46BEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 18:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkPh6rEGGj5EfY6a9YgmvYuB+fZaCezIbVUYx4CZTr4=; b=dzTjQFxSr+RdXqB0WvnboOXLpt
	a7DVE6v0ZX2cwTTN5uJDQdrUhprFmhZSVSwaOdjsqF9slkMiEFdHrVSLNJoUU1o18ghfe9wPGvO5a
	JhJ8DK9yGkAa1kBy+88oeGVhXTp8oERIRV1CO7vFtEBXoFaKo9SOOBb9WS4G2TuuRhr2Suw2JljXH
	aqMNY0bS37mhF65Lqdo5T7jMuAWasqexBPMYhJllQ2ByBO0jdgFqgLCqZxYaXbw1+s2TDyLfBbkbr
	0v5VJNT/LJiztw5USu7DjNmdr2UW9Q42H3PmTuG0TAH4WWp4nQF2BnYakvAPWY3nvGFY70/3P1ULh
	2/qmFAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlASS-0000000Gd7m-18Nz;
	Wed, 28 Jan 2026 18:40:04 +0000
Received: from sender4-pp-e108.zoho.com ([136.143.188.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlASK-0000000Gd62-2ofH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 18:40:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769625579; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KbAx9IzY0rH4cAFTkoJqpMnfyC15wZ/HtckXt5ZSLOIywlF6f4efzb70C42alVDrV8KfiK3A0GftAwqlvY2BLZXXC14TWsP80rD/32IaC6au2J6T8/Tg5K44RQdNrfBmlVF5uv+noJCIOosA9JkNFWzxRpapGK6zZNjMJ52EDog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769625579; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZkPh6rEGGj5EfY6a9YgmvYuB+fZaCezIbVUYx4CZTr4=; 
	b=RwQYRfKeJrKWZC5OiVk2X5cu16M9KcM7e0R1NcUs6np2RzQOtruFFnoxTb2a/BcZnn9ZaBTv1MhHHIykB2xvyu7U4B+JdYHSdzzqDoPsY4K+8wmxUj5rhwyWqHckZyDlpLvXTKcEZpX2zv3f5T9Z1Tb1RZrk2WlzTVYRUuGQ72k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769625579;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ZkPh6rEGGj5EfY6a9YgmvYuB+fZaCezIbVUYx4CZTr4=;
	b=IrlW0KairsALp3RcHiCJWnsIOZrLuPIuFBPhO04FIYnIXIwStOza0Rcyxl8D59ZX
	0xerhfmizOxka/AQcywYOvnnG8egqgwb6M5obCLhAMQImhYSoL/RjpbftK5fENTXAoN
	qEXyTP8XeyEXWXXtUoIJ8Bielo/N5jyBzfa6cfeI=
Received: by mx.zohomail.com with SMTPS id 176962557768244.502411600919686;
	Wed, 28 Jan 2026 10:39:37 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 28 Jan 2026 19:38:50 +0100
Subject: [PATCH 1/2] clk: Disable CLK_OPS_PARENT_ENABLED parent only after
 CRITICAL check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-ops-parent-enable-fix-v1-1-ff39cc37f98d@collabora.com>
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
In-Reply-To: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
To: Mark Brown <broonie@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_104000_693481_CF007767 
X-CRM114-Status: GOOD (  11.64  )
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

The call to clk_core_enable_lock done by __clk_core_init after checking
the clock flags for CLK_IS_CRITICAL enables the parent clock.

In Commit 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during
recalc"), the parent gets disabled before this check, if the flag
CLK_OPS_PARENT_ENABLED is set on the clock. This results in a situation
where critical clocks have their parent briefly disabled, which kills
the system.

Fix this by moving the balancing operation to after the CLK_IS_CRITICAL
check, which should resolve the problem.

Fixes: 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/r/036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk/
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/clk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 1b0f9d567f48..8f5ef9ce77d2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4056,9 +4056,6 @@ static int __clk_core_init(struct clk_core *core)
 		rate = 0;
 	core->rate = core->req_rate = rate;
 
-	if (core->flags & CLK_OPS_PARENT_ENABLE)
-		clk_core_disable_unprepare(core->parent);
-
 	/*
 	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
 	 * don't get accidentally disabled when walking the orphan tree and
@@ -4081,6 +4078,9 @@ static int __clk_core_init(struct clk_core *core)
 		}
 	}
 
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_disable_unprepare(core->parent);
+
 	clk_core_reparent_orphans_nolock();
 out:
 	clk_pm_runtime_put(core);

-- 
2.52.0


