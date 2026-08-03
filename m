Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA96C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=on4B/LfqkHipeTiwMXYITPpUbegoRxXk89rke8WT6Ak=; b=iUzvcOiaSPJGimMnFQyawe0vp6
	PzbjoocI2+TjCVCUyDc0v9BODY5mu06GHR29tTk0ieZJcffTqWGhab4s7Zd9oOMi2HWFSkHs/2amQ
	aQ4myI5PhlyI2i2s0Xc7Pz7MKZ1IYB/+k27Uac+cc3Y9ChTGLlL0gsVvrfF70gcA4YsSewCmvKNJL
	fA2VflBaVauL4EhCKF1QOKlixNySCfU33Kj5eEKgqkaV/TA2KRLDK3GHKxCMTcioQJgONA2CkXs1+
	PG99c2w3ldnK5k8h90J58mifJuu83RFOxouvL83bCmi2LqkptXBAEs+tHm24FTKNKyIwHq0u5g7PF
	o7W49SoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUa-0000000HKMg-2Ywh;
	Mon, 03 Aug 2026 14:18:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUW-0000000HKHd-3Jup
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cacf197759so49766255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766688; x=1786371488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=on4B/LfqkHipeTiwMXYITPpUbegoRxXk89rke8WT6Ak=;
        b=aU/CTWFNK0GlZLC4QAmmLQl7TVNBK2Sm/xj016LROioduLoT5+mtnMcx3Dxu5nk1q6
         fFU3ed8h0IOExgiztpRYJD64S3f7HFWoiqiB2w2WYdjNAA3dr86qI8eD65eTeqQOOT4M
         oH8AJ838LODl7/2uC4e/b+mYjIA7gZBhWY6hpPbGrpXeXuBRZw9lKQ1xUFbrhdY9Kwob
         oJJtCFr/8bkxAnl3/xQR7O6cixotKlXTlXn++PoxkDKKtisAaTFfeByAS4VRUkiW/WZJ
         rbn218m9O1osysbEE7kBsBAclZyXyc8rHQeLHYdqXpj5dZZYp2TcwMHVr/gRmCxbgZjU
         QOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766688; x=1786371488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=on4B/LfqkHipeTiwMXYITPpUbegoRxXk89rke8WT6Ak=;
        b=eeNaQiTMR4tmsiOPgI5ux00e5G7Pxy8xDXmbrq59oNZEEU2Wj6pVqy/TNfVWPPzyWy
         xp1IgrB92qX+CmSvNaE4PglyNRAYrm5tbSiQjse95Yd7DRBe4Zku5pe0Un38NilGJT/h
         T1Qapw3kJZ/2tymtyPtv3Rk42w+VK2QSvn5/KnH2vRPXQyfpLXYzWzI9U18jR9OBRTjY
         GRWK441SYMAoTl7xwVgpBCsXWA1qyMhJQtj2uWQh7CtVqG/CTY68hYJgWB8YN4XnUha/
         1DladfItc0Bajsz1ccCfyI5atMHgDzhAs91Ju/QTjSDficU1oZD2OWWNB5oStcmWeDb0
         rFSQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+fCTlMfhWHh5bLvdOmxsr0xKoQKRnlvRzJrcPbGRjTsCd8yxNua5Z4xHrCYLWdO5KTgT3aEIlj132YNMPMQTY@lists.infradead.org
X-Gm-Message-State: AOJu0YzPHUV0tOqvlr5kojurgw3oYzmfIkqp6t6PTVl9oDMYAtyIDtcW
	aF6XCz6EmofUWyUWNfty/FxG90AP1QsBhwNua4UryskVVBXKnMu2bjyz
X-Gm-Gg: AR+sD13CSliq/rJ52dSQMW0EzT1+j1zvjKwE9Z36H+nOy1RLB565XfzplwIIBa5isu3
	dRVK07WCeEPgVzeMi7KSdW69v4/vpJpCCafUtmf6JZWEW6bA1MwSGYKaOX+CcrHFSzRiurAuKrj
	/8jInCoiRUnjoLC7K1Qoin9j7bxSEEMtpH3fgI/ty/COqmWb8yMpb8RjnWk+MVJU9OSrTJiN0po
	Iv9UbJNBE6HFt3mSC8CnqXBamA2wJssHSYqc9PdLOF+ITpccOE+0dV84n/K3vcjBMy4nIstlZdC
	PUhk156NSyQJwKDXky+0qtCQfKfQ7bNiqDpK2hU9TIxz4Ky1tmtuxekB8UxAkoqd0fkw7NL/4lF
	yd+IUYD12rzvIQ9Tnttbj5P3ftnrSWDsjezReQyHU9amLCZrJgP44XmbCZCC6wjuIG6n6tBYdGy
	feXLn96qON0yWjHlDCLZ1++MSBpo5v6Bt9kKrKkzlvtLJXuxMfLUIOeo2MjxCxJCxO9Xl8jsqCy
	HGINj332ZN3mUn9l46Q
X-Received: by 2002:a17:90b:5643:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-38fbc4cfde2mr9523866a91.21.1785766687657;
        Mon, 03 Aug 2026 07:18:07 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:07 -0700 (PDT)
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
Subject: [PATCH 09/32] clk: mediatek: Add cpumux support to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:36 +0900
Message-ID: <20260803141659.559129-10-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071809_020731_80B51AF7 
X-CRM114-Status: GOOD (  16.15  )
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
support cpumux clocks. This reduces boilerplate code in drivers for
SoCs that require cpumux registration, such as mt6795-infracfg.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3dfdd3a422f8..8148c21e6099 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -19,6 +19,7 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 #include "clk-mux.h"
+#include "clk-cpumux.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -513,6 +514,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
+	num_clks += mcd->num_cpumuxes;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -542,6 +544,13 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_factors;
 	}
 
+	if (mcd->cpumuxes) {
+		r = mtk_clk_register_cpumuxes(&pdev->dev, node, mcd->cpumuxes,
+					      mcd->num_cpumuxes, clk_data);
+		if (r)
+			goto unregister_muxes;
+	}
+
 	if (mcd->composite_clks) {
 		/* We don't check composite_lock because it's optional */
 		r = mtk_clk_register_composites(&pdev->dev,
@@ -549,7 +558,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 						mcd->num_composite_clks,
 						base, mcd->clk_lock, clk_data);
 		if (r)
-			goto unregister_muxes;
+			goto unregister_cpumuxes;
 	}
 
 	if (mcd->divider_clks) {
@@ -605,6 +614,10 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+unregister_cpumuxes:
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 unregister_muxes:
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
@@ -643,6 +656,9 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
 					 mcd->num_mux_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..02fab4b166f2 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -252,6 +252,8 @@ struct mtk_clk_desc {
 	size_t num_factor_clks;
 	const struct mtk_mux *mux_clks;
 	size_t num_mux_clks;
+	const struct mtk_composite *cpumuxes;
+	size_t num_cpumuxes;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.55.0


