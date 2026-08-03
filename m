Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86295C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35MPZYKLCACvIdbhYzSIWcM8WhL87zoy/9oei4fzDb4=; b=uYd71Et6/iT9LT9PZVa74rlUIz
	jKHT3+FeQ9pHH419QTUehEy5YeYm3g+erHfpT7udirmtmVIsOJVYaG96QkcGoaax5x58iMqoun9B3
	jTRoOy9CODO7ybhvwqE9eIvoi0AWn/JkOswUKbKqsEOvzOJQ44BPcwAwINK7RdNJc30GnbM/we6qE
	9OEb/nBegfS/oZVyrFExg6u7JtEOl07GXHmFAhmlUfZzIiC9x0aEreNlTiObrRssEDbLw2JS4Qo8e
	2g1ewFSny7MDgS4it52YVmb3Zl1A9QTSlR2+x7NBjQ21SvEmuwIGE8dpqV35CCtHYrHibCrZDTpxU
	y3rgrcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUf-0000000HKUY-0J2A;
	Mon, 03 Aug 2026 14:18:17 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUb-0000000HKNH-2ACA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:16 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2caea3f742bso34951355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766692; x=1786371492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35MPZYKLCACvIdbhYzSIWcM8WhL87zoy/9oei4fzDb4=;
        b=cfy7WyX3q5Byrl6DMZONIHjBjqb/PmDv79jy9D5qyrwZcgXXzpsjKuFuX8936cQFsG
         boWhrGERJrQyHeSLZn2qC12q3ve+ijC/bdslx6accDZlsi3aUsnZQ1HMcOZ/Q3rZoU5y
         i9DF4tVZGCDdhhaS5TT9pM749l8iqSQYnqSH+Fi7p61dgZ2+hmlamgTAuYX7J6SJ2BmY
         reBxr2Wv0G0rWdaFA8L91bv5pFVRKqRhV2FQKBE/Ovun2oTILTP2fdzkb/gyLrkn4Sd1
         jyUV+TgxWs9pMO6Nx3eOpzJeHW1gCWWrsINL+hEB9xYDyOQpf6whD/4vsDClbolUWdai
         KUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766692; x=1786371492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=35MPZYKLCACvIdbhYzSIWcM8WhL87zoy/9oei4fzDb4=;
        b=H7Ctopl4QL8cWTI4Iwb53C2x1kbDnmpiWYggGQki+Rs2srW1c8wLePUza5aAwA8S/p
         X3g4BSc/Id6uZF0rl/n4m+o7k+doUU7yhUp/RkWm4sNkljiJYmV7+u7CHZ9EenoafGoJ
         5Ts2KKvMb5ZnaIWFGugWbeQZq0y7/7hvseRoWO9HXpNlCIqVvyyNQVpqFU8jnLYFXlK+
         pBsQd7l4lZ05IaRH0tzWOI+6kyQVEBSPbfRDnZV5A6UmMRlJBfCUWkFPCuiIvAFOJPet
         VTGCGQGlU8YpIJtjYwp9McrSSykmg02xGqjeYBGEP3LbMLDL9/dnBv9VFIhZDEiQaKbl
         Hd+A==
X-Forwarded-Encrypted: i=1; AHgh+RoIqgnR9P1po8jYkrQBgs1Fc4zEA73FzqF9eQv1Q5vyiKoioL2lZlHXyhAZ4DjcowGWil7+xeyn/Topvt9n2eiD@lists.infradead.org
X-Gm-Message-State: AOJu0YwbtZgThR3q57E6Xm1OiIMWe9qy0bLzWEGufz5D79W6r18YlIhO
	sLcnWNdyPKOLIPc6FNXNSsZ1V4UKfezzWdx20e0Vz5nwDu7ZdvqAVrGZ
X-Gm-Gg: AR+sD10l77a5e3G5xKN4XXj0XAmOmVinFucDTuRh2dfpqnQtEohno28N4e8zPTK+zZt
	JI99ACsbcAq16B+6XWc1hC05mEXQqMP04Mi3AWnjnKvdkxVLnHOXHqqA/URnV+NJd9hq3HNSOfX
	giFCogmQhZmI4XakSl51Y41l3uUSJmOBC+1agGU8XLQ7TRzVgf41lvXnXuq718zF2/fJAbc+Po9
	HPBmVvCo3kK6XrVcCyANUwdIdclhLFPJJS4PMxqSofxdcQ7LzYEmfjds9CQlpLIcHvmzb6cucVq
	iHu6kmqTdmkQt20XwyUgNTuiIhgqgaTdG9Ph9VnOPZRmF1B4dZrFgry7kDYf+Ebn57pnLNHTN9X
	+HLTknz6XsnA0VoFw72DMJAqXarobbtnbpT7WapPwO5WphvantRB7ivE9dY1g1v67WZEqRorn7y
	7MD30alTkGGa/n4ymHmQTjRWsl6HSt7rpkWdDZZvpq69ta89m2JEOnPnSPaRnIvqCCCOGn4oIjK
	x8px/1XbImnbbzpIRdR3A==
X-Received: by 2002:a17:90b:3e8d:b0:387:e0cb:c8da with SMTP id 98e67ed59e1d1-38fbc57a3b2mr8948527a91.35.1785766692243;
        Mon, 03 Aug 2026 07:18:12 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:11 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 10/32] clk: mediatek: Add PLL support to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:37 +0900
Message-ID: <20260803141659.559129-11-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071813_567068_AE1F320D 
X-CRM114-Status: GOOD (  18.39  )
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

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to
support PLLs. This reduces boilerplate code in apmixedsys drivers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 19 ++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.h |  3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 8148c21e6099..c3369a04cdec 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -20,6 +20,7 @@
 #include "clk-gate.h"
 #include "clk-mux.h"
 #include "clk-cpumux.h"
+#include "clk-pll.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -486,7 +487,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 	/* Composite and divider clocks needs us to pass iomem pointer */
-	if (mcd->composite_clks || mcd->divider_clks) {
+	if (mcd->composite_clks || mcd->divider_clks || mcd->plls) {
 		if (!mcd->shared_io)
 			base = devm_platform_ioremap_resource(pdev, 0);
 		else
@@ -514,7 +515,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
-	num_clks += mcd->num_cpumuxes;
+	num_clks += mcd->num_cpumuxes + mcd->num_plls;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -522,11 +523,18 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		goto free_base;
 	}
 
+	if (mcd->plls) {
+		r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
+					  mcd->num_plls, clk_data);
+		if (r)
+			goto free_data;
+	}
+
 	if (mcd->fixed_clks) {
 		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
 						mcd->num_fixed_clks, clk_data);
 		if (r)
-			goto free_data;
+			goto unregister_plls;
 	}
 
 	if (mcd->factor_clks) {
@@ -630,6 +638,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
+unregister_plls:
+	if (mcd->plls)
+		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
 free_data:
 	mtk_free_clk_data(clk_data);
 free_base:
@@ -668,6 +679,8 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
+	if (mcd->plls)
+		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
 	mtk_free_clk_data(clk_data);
 }
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 02fab4b166f2..b6504b3e77ed 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -23,6 +23,7 @@
 #define MTK_WAIT_HWV_DONE_US	30
 
 struct platform_device;
+struct mtk_pll_data;
 
 /*
  * We need the clock IDs to start from zero but to maintain devicetree
@@ -254,6 +255,8 @@ struct mtk_clk_desc {
 	size_t num_mux_clks;
 	const struct mtk_composite *cpumuxes;
 	size_t num_cpumuxes;
+	const struct mtk_pll_data *plls;
+	size_t num_plls;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.55.0


