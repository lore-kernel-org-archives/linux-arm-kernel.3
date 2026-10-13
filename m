Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FF5CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VV+eqtGB9isPBsiHWAzEEpBfNpeGwRF5PnvhKsaB4c=; b=2VZB2O9u7ZSLx7CdgOe8McJ0GO
	/sB1U8Y/8Ld3wNmkwitHuInsXFNVwD56fGoSVtVjrfgiw25e8Zs4/4upttdEzHYUDB736uSObi1Yr
	gS2oLA2Fn2VXpA3YtN78FW9fCVNveEnzXTjuEyLe35yeJutvtBMEMvi/xT+I3axhe+xw7mNqxksDf
	QvtBbnuILuP6yfuRIycq5d2UXgm09+YAZVfvR4wtCsfYjW83EpZlurzh9u8kZNxrYB1/gLiF+Fu+k
	85WKemjFk09CryYfPTwdPoejQD7V4fF3kYFbXWcHQGBfL1noDRWwx4HOK71ZgLO02YcceJ0jsoDOF
	RNDnXmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeI4-0000000DHHg-3Zdr;
	Tue, 13 Oct 2026 15:19:44 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHX-0000000DGtw-35UX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:35 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ac397836fbso825127a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904751; x=1792509551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VV+eqtGB9isPBsiHWAzEEpBfNpeGwRF5PnvhKsaB4c=;
        b=oG0A76lAAH5Z9sA+gdAur0mBiFRiGE7DssOFWGWiB0NMrmOq3pJMGeAyEorbFEngJ8
         8WC94mB0dr705lOd9djwignIAwDbvzbmuaN0xVr7Ve6OaqrRBnk3rAkajuDrUzbzfFn9
         W1Uki4IjNRn532CUCwtZ/dPPq/+mIUep6khLhFfROSHv+ajmzf7yhTVDywjmmlU6bOAJ
         iXwSj4HUGBuDIGY5H/2oG6X4dDUObqFONO0KBUjlBJb3vpjOKIQysZA2DcDMIg2fqXWk
         2xnnOtDcmss59FyqcPYGyujA5misAyylgQ/jCr21abcIgU3TuIDPGI9E53IVuJQwJRXX
         fuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904751; x=1792509551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8VV+eqtGB9isPBsiHWAzEEpBfNpeGwRF5PnvhKsaB4c=;
        b=1KUhl1fzvO5PFIkxSqLd7txfSIOIpdVLfh8iOmpid5mg9V1lM0oCAWnx6fjgkfAcsO
         QbVv99AHl+xpQhga37C5RCINkJp952XPvsIguZhgQ5zaoHDXf6/YIGDVX6qSwSUu52Rh
         cd4RI7tIkhdnGzQtMPd/cqnrWer6/H1yJjsm911ukwP4da0DIXAwXR7n1nVc3V06unJV
         01exS5tFMSohRYiCxMfvtqShAGSz8Tmqe3XSZ0jBc44o3vQV/WLlbq58cZ/R0ajYMh7j
         5CQzXHWhCBt9b5mUZ1mAiFqokr1XQa5fswFvcPhU024NzQ2V8E4iGFDkgK5Co2P1fpW9
         r0yA==
X-Forwarded-Encrypted: i=1; AKwUvBxNMk6VhfoXBlIuIc0Cyuk/t6BWLkv1jZEKBMXT30ylOpyHXnqGtquGQyLm43I5BoUyzr9MRIgdypHTcGeG3/LC@lists.infradead.org
X-Gm-Message-State: AFq9FYJ8Eaf91EU0sb9Pggy041Ri+28LnRuERGsXRc4sNQab8bxYjj15
	WZiqBRLlNnKO9lKDwl8WBenLwpZqJU2xh7V2HqTDmsmJ/lZMtTPhWq1I
X-Gm-Gg: AYBFou0dQFrjDejOoHsvlduzG35KHJYWO2UZy+Vsc9qzzXM+Ix9P+vbfMFrHLocWzAl
	nbsFcB8BoxFx2NS/phYPQphkngQDJFmGMY1fdJsCB4tTWUBMoeO6Fk9+0zsmmzfccvcklfDcvIK
	WZeAdSQIy5XEPzptx/aiOfsMre5DDJVwsQTxI3dAAUrKhCn5s7XM6IV5MLkiq4JBKWyRLzHkC6e
	N78bP8pFkeRrHHazeOUl/Y7x7dSpaMYNt6ZF6sR3kPfLIKxxHRQvKOdtfSJ3h6N/8rEV5VHOy83
	/1UtQRStHrAgf7juUA3dD+O6m4U0KGG/IxHt3uLkpymefvMN/bwTwst2gvv+kAubDXbLMXhx+81
	xLF9FDKQMIKkmulj/fIQSXsQ6cw6rw5W1eoDX877ru5aLe+ols925c6uQywGPKwg6W1w4+iZZCa
	I3O76RVef8q0bWHJxsXKv534vhIlU0DzTRN2bnP8OFCxjzma8iH6DQM1+652uipmmCPVAgFZbsf
	aJEZ3O93x2Awby/8YcMDZfJWW8jew==
X-Received: by 2002:a17:90b:1d4f:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ab3a79d9f8mr10541804a91.45.1791904750446;
        Tue, 13 Oct 2026 08:19:10 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:09 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 13/35] clk: mediatek: Add PLL support to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:12 +0900
Message-ID: <20261013151734.3177690-14-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081911_812279_2B982843 
X-CRM114-Status: GOOD (  18.82  )
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
No changes in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 19 ++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.h |  3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 004098a839b2..e06cd40d995a 100644
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
2.56.0


