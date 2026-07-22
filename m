Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14410C4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unyjlYSQAHCuBkgYy9GiPNfKBr8X4sZKbeG1doQS/7s=; b=EOb9oOKTc72S0UkNojplwQa1z8
	T3KFGvs8Y4nKYySmcqWDwKv2uk6HZ4Dl/e9iwqTIAyOzD4WMX8mtsur6hv+6uLVfeACHypNMCM4g5
	sRZUPOT3CYu/tt9hsDrn2r2EzodWw0wJLx8kqKVme2hR4nwTz8v3/p5xuPjyYE0K4g77/zOZ4W44C
	hOpkPelYGpVHoLFY/2dHXPYV07TlHIoaeqIMcJSAmRTHwGor6x2u3aiSvtS1EbmKy7OvqVCLWrSqa
	o3ppjmibIivJSnbPLjaiL6MPv85G6lPFNZaIwhqB9p81gbkVhIGazaoqDWmg4SWrEB1IqYeFVNVvH
	Vo0tjMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYFY-0000000C4Zv-1sWi;
	Wed, 22 Jul 2026 14:48:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYFQ-0000000C4WH-31JJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:48:37 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f633e6058so5099505f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784731715; x=1785336515; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unyjlYSQAHCuBkgYy9GiPNfKBr8X4sZKbeG1doQS/7s=;
        b=N/coZ8l/D/epA9d95SU0uQJpPGe3sy8a3+XO4hfnh9K2zg4c0asYRC5tEnAH6MU1f2
         OMbZHfPn5xrKKvDz2yrIudbLdhv3KUCaZoE8557obdtYX6uh97G+qRRSocvU4B25RYqp
         PVzlOKwyhNMrvoNfPLxNwJTuGgAs1eTskxx4oVovfuu+0RtbjspUDChsHFqmFT/uA/iu
         ufE7YtVJ43JKL7yZGQi2KIW5Wc9asbF39m7FFPzCUnTud7pq4/WeV4oCE2v4wCrMH3/U
         GWnVO5kGEE1WBprqW2PkrJJvCJ9xQKwD/TmYxDW8KZaCWgDmA7xprMN1Q5hgqCB/Ea9j
         sySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731715; x=1785336515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unyjlYSQAHCuBkgYy9GiPNfKBr8X4sZKbeG1doQS/7s=;
        b=hpGACP29VzzPDDOtdL6+koA4PQEaKJL4ysktTge/gyUJ5PhpHKBXWe4soh9hJ/tDJx
         jeGtkM/TLQsFn97Oa3TggvzhQ3QdQre9SPA4KAG1i5RMZgzHuVjkLykjeU9vX2Pqy654
         Kb+QPeriPO8t52YZtxGhSHd2fEcoOhjMsgG8nAEO8YSF5kUb7L2oc/RqIrc7YQvOFFKC
         g68dAGGzxFQlaorPrdKogscTy0tYdfj1VVl5E/xAOsp/MK0eFJzaICLwy6zjMRIUrNMV
         S1w3VoHqSuMbaSVveuo9hySqj7jAbNW7isvsq3X00JWpYPsZI9dDpCuETDiTpv5UUGiZ
         zJIw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+rMxY40CS+7D/0fQBHfxtTRmpoUzI0dCFlalMq2TwovZCIc/M8MJ0Z1Vs7HrAvaWMuK6kr/RGJAIEiVKtD1RJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yww9liFVxQnaUy1kqT+AUPahgTP6y7SLv3k0kiiIGhnqy1hqcT5
	qXUNTecFOjScrJJwBS1664VHNfJdAt4hx9ehNSMy8P/+0qS1xUgO0NgCqk8Md5XdGK0=
X-Gm-Gg: AR+sD12qVMMY5+bAjgHOIBMjRavykW4v3FFRh/kAu8h4G1UO770p6Mhyhjm6XXFyFx6
	8X1O4OZOZauFA3r4Z85h0vnbdRgLO0AkCw5JCSfmswNH43mjrbARVrPacyA2GOJf79DXYJUJZ4m
	8+p2cZvsNA4+ojeS55a/SJTgbDApuTQvHPru1nhNjuayBbEEtbE4J0rvFa+tmKxt1qXpzbGngjv
	xk+i77XgLa8NEL+3BUDO/8Z5X3xX8UGTwAlfSUdhe1oCySzQw8IWlNXbQHP9/u+8tGamw+irLTv
	d2ZwMxOBWtvCHTchYLBWMyTseRvI3ZFP2+A14m9Ydyk+73EepLsCMxjUK0dh86kwDTzAVEq+ePP
	J2yQQh9zMdR95UFdyFo33L30x8neMCNGtdsSz+08RqMnRQSb5dBs4su0MBTD2yzpjlECglaVlGz
	Ih
X-Received: by 2002:a05:6000:1883:b0:47f:5ec2:d54 with SMTP id ffacd0b85a97d-47f622fd23cmr26607833f8f.5.1784731714820;
        Wed, 22 Jul 2026 07:48:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85b9a5d9sm6412303f8f.5.2026.07.22.07.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:48:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 22 Jul 2026 16:48:19 +0200
Subject: [PATCH v6 1/4] clk: sunxi-ng: mux: fix determine helper rate
 propagation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-a733-rtc-v6-1-631cca28cc9a@baylibre.com>
References: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
In-Reply-To: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4256; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=h886BmU9pfC+RezdnkZ3J5Ik53qoiogLhSBSntAHgiM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYNg6uyta/DkLplo2mqfFr0j3C/ackC1oBeDSi
 v/Kdomzy+OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamDYOgAKCRDm/A8cN/La
 heNmEAC0b7q6lwuTPE/5GdnaLgm4KEnZMK/5Ab9WcKRFsjyAkSUDgxBrsg8F0oNqu0IPjzYFOJA
 1s8fBxBfn2PRXIh3DrGULfbL+R+qA3wx1RxQmeOVIDEzxVSY4y1GTzwRWgs7IgchF9nr+YhGn6H
 bVmBqo03Aly2UteOQtcyg8QMA+Vq70Z+CfOQJ9xFbZG1jMywPFyVGfMbZKMoLwgvti8oS1fvLvU
 v9ez3PTmofHI7Yh/dqjxlPJdY8/mVI2dNm/G69mODoU69AcQOY58k20qySvdS80UX2gMI9U16ma
 DrwXV4q6/GIq7jVQpfJGXa447Q3OZsodLTXtr7ivRIxefJNwFVFTzJ54YctO8ePepKdIKVAiWA3
 BqDBFGAAFufNNjhHqzUmxgNhoScAKx3wYHjuqV2iDk18JJT4YhVXS7uGs19cq9nLRwOwD4/tKQa
 O03g+vGul2Abc8JuMNSoIQEVw5uFbfrQG6jDdFAxGo30jFWVcm6T4N9+dmMYdUPWKGALKNpO1P+
 4qVXaENjXqBtGRDiRQR+9x0QMazD2F8KGNA0+d+vs1/pJHNfbE72Zt/wkyn8FtemqP+H7U3E0ha
 CU9NM1QNRhj5ibYdPdfSn5RA5l+1ob8oqUsZvxOSt1tp2Hh7FntrDRIJHYFd3+BEJRiB5S9QCp+
 W7y0ilfnsEMIPhQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_074836_793818_406EB426 
X-CRM114-Status: GOOD (  18.43  )
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

Applying the pre divider on the parent rate is wrong because, while
handling rate propagation through determine_rate(), the framework will
likely round the parent rate again while cycling through the possibilities,
throwing away the prediv applied. This means, the parent rate will then
be wrong when the prediv is unapplied from a parent rate on which it
was never applied to begin with.

The right way to do it is to unapply the prediv from the requested rate,
which is the wanted rate at the input on the clock element, and pass this
to framework to do its thing.

Change the determine rate mux helper in this way.

Fixes: 1c8d7af61b37 ("clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 57 +++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 09230728c400..4503c9780c39 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -92,66 +92,65 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
 		struct clk_rate_request adj_req = *req;
 
 		best_parent = clk_hw_get_parent(hw);
-		best_parent_rate = clk_hw_get_rate(best_parent);
-
+		adj_req.best_parent_rate = clk_hw_get_rate(best_parent);
 		adj_req.best_parent_hw = best_parent;
-		adj_req.best_parent_rate = ccu_mux_helper_apply_prediv(common, cm, -1,
-								       best_parent_rate);
+
+		/*
+		 * This effectively treats the predivider as a postdivider.
+		 * It stays mathematically correct and ensures whatever
+		 * round() will do stays correct while walking the tree.
+		 * It may query the parent rate too while handling rate
+		 * propagation.
+		 */
+		adj_req.rate = ccu_mux_helper_unapply_prediv(common, cm, -1,
+							     req->rate);
 
 		ret = round(cm, &adj_req, data);
 		if (ret)
 			return ret;
 
-		best_rate = adj_req.rate;
-
 		/*
-		 * best_parent_rate might have been modified by our clock.
-		 * Unapply the pre-divider if there's one, and give
-		 * the actual frequency the parent needs to run at.
+		 * parent_rate might have been modified by our clock as part
+		 * of the rate propagation mechanism. Same goes below.
 		 */
-		best_parent_rate = ccu_mux_helper_unapply_prediv(common, cm, -1,
-								 adj_req.best_parent_rate);
+		best_parent_rate = adj_req.best_parent_rate;
+		best_rate = ccu_mux_helper_apply_prediv(common, cm, -1,
+							adj_req.rate);
 
 		goto out;
 	}
 
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
 		struct clk_rate_request tmp_req = *req;
-		unsigned long parent_rate;
+		unsigned long rate;
 		struct clk_hw *parent;
 
 		parent = clk_hw_get_parent_by_index(hw, i);
 		if (!parent)
 			continue;
 
-		parent_rate = ccu_mux_helper_apply_prediv(common, cm, i,
-							  clk_hw_get_rate(parent));
-
 		tmp_req.best_parent_hw = parent;
-		tmp_req.best_parent_rate = parent_rate;
+		tmp_req.best_parent_rate = clk_hw_get_rate(parent);
+		tmp_req.rate = ccu_mux_helper_unapply_prediv(common, cm, i,
+							     req->rate);
 
 		ret = round(cm, &tmp_req, data);
 		if (ret)
 			continue;
 
-		/*
-		 * parent_rate might have been modified by our clock.
-		 * Unapply the pre-divider if there's one, and give
-		 * the actual frequency the parent needs to run at.
-		 */
-		parent_rate = ccu_mux_helper_unapply_prediv(common, cm, i,
-							    tmp_req.best_parent_rate);
+		rate = ccu_mux_helper_apply_prediv(common, cm, i,
+						   tmp_req.rate);
 
-		if (tmp_req.rate == req->rate) {
+		if (rate == req->rate) {
 			best_parent = parent;
-			best_parent_rate = parent_rate;
-			best_rate = tmp_req.rate;
+			best_parent_rate = tmp_req.best_parent_rate;
+			best_rate = rate;
 			goto out;
 		}
 
-		if (ccu_is_better_rate(common, req->rate, tmp_req.rate, best_rate)) {
-			best_rate = tmp_req.rate;
-			best_parent_rate = parent_rate;
+		if (ccu_is_better_rate(common, req->rate, rate, best_rate)) {
+			best_rate = rate;
+			best_parent_rate = tmp_req.best_parent_rate;
 			best_parent = parent;
 		}
 	}

-- 
2.47.3


