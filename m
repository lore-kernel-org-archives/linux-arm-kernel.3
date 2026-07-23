Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD00C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unyjlYSQAHCuBkgYy9GiPNfKBr8X4sZKbeG1doQS/7s=; b=M6UYwdoY4FuDoXL3CW3HjvrO4V
	wmHgFeNmIjs9pH8DkeFCGor2sDFJ1GSpq+a1Ie0dErOcJlcyu8kcQzjYdQkLvztuHZ1QOuQYZyx9Y
	WyHeaWXCN0b299W0p8Ry8ZijN3YQaR/QiAOPU1AJXVMbyDJnDZNWKleHiXVd3IuIrJ1/8YFS3npmu
	U/286uWu4AxeXeae1Y9d6VpxUANfJkX+5sNkXtiGeUKzIj30MySFW7brql9bL1US4rHmtfdD45NOu
	vRF6aGg1kmGCslhLms5BLW4IFJw5Gh97F27g9lQ42+PIWQkON2jfu67gc8dDz2UfV+CfM3zyTEEKl
	phIUlN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpuU-0000000DutD-2xup;
	Thu, 23 Jul 2026 09:40:10 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpuR-0000000DurC-3aIl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:40:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f752b3423so267672f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799606; x=1785404406; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unyjlYSQAHCuBkgYy9GiPNfKBr8X4sZKbeG1doQS/7s=;
        b=pr3W5setfLUBlIwmws5pujVQXZup66atQrOgy2qeWAHMG82hOYqc8Bc6AJTeLyijkV
         t+aFMqIVqKmg0gI5UiJXy1qMtTFjgHnF37TcX0cnHYIB9qYSLCmAq+tI6aH0d8P+ep/Y
         kCpEs17tZMuMWM8AgxsRlobgYEmGC6BB0XdYGaIjfLk+zA9fny4Vrieo6fiuMrug1TiL
         aeopeDPXHMW+KAn41lJ1c/h0v2TKTGm7N70wm4x4TBA1TXgeucZWDBR6huuFoQnmymF6
         IR4UQ3zEMoBGDmrUDxziCsYjLB+kSIlvN96oVzXDW1RDeZh42wsI8aVBy7nW4OYwKJTJ
         bk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799606; x=1785404406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unyjlYSQAHCuBkgYy9GiPNfKBr8X4sZKbeG1doQS/7s=;
        b=PLklvsU9Y+ErIOvyhr8lgQIZoCKzoHQF2vMF85YH88AHUkyG7QBlQCysVCGpSJ0MiW
         lIJcz0DYjICC6AQOMLqAqvEk3T8PGftri7SMuv3P/w0XdIDY8LzQWRUHc/MSPqHsIkBV
         TUmqNQ/2ibH7VrIJHp11m/31CbMr8ZqUQnxJF6N6ItppLLdA5wh4Cvr/c4cLhnx9hUiN
         teLdXh9byTo8+W2ciLEsoQaw8rDXdkv6SuIKqMsB/dG7Hqfq0Js2Ctz4AqtGACwEbXl5
         pDy2ctE3QKbjnT1U2GxhhIiv8iG125M29S5mOeYxOiyTKPJ37EwqI2fcrTLfqvFkMKzL
         zvoA==
X-Forwarded-Encrypted: i=1; AHgh+Rrx/cK6qmMY2arv0vNIuDrRJ54Ub6VdeOkuKU0aHavmocr98zIYcYZGFREcE7vI+EQxknqkLhs+r5OVoQA6XRvq@lists.infradead.org
X-Gm-Message-State: AOJu0YwDhZrYupWt+JjX82qzQPDpNNdEiTC75M+K/gRtNlzq61QvM54h
	7VbRkotiKC0ruin150CmxYS+ycyW1DmTwci9dXimDBPgk3FZGUT/iNOzUhyJ0KmMpec=
X-Gm-Gg: AR+sD12TWTiV1upyAX5Q8WC//hhBce/9bJP7WuEKRS8ZFdLO3hoC0cnxLs5pz/XFn6p
	SBFKjw03NSQ0hJ5O8pr4IV4xyIl7QjxtHRCO17gM+GfSDmAwrJa0JuTetPD108UQ/yXx/gG4WyA
	WTPnlO7zjkB33z3q2A1tyPd9xGSZmILJrPoKcFy9//ymyhFeu3rQqfbo+wTVbqyW4lVsiA1o15i
	muQ88YrXkHyIiyDbNQagxa7ms/cHgy4MEV3MHqb3EYOk2BNKj3FOaIo5kOgQUz7gB/01ekMVivY
	kSZ5AVTXjMXSBog5JWn/57rhPUrGubODfJgW1LNLzuBiYgkWhnZR4vj0dAgLX0dM9aJ4TbE1Z2x
	6aGSh9DK0LjVfV6tWXnvEFa47Lr8Mo6gqX6n6AzQPX6NmpDP9Cwakd5LgDK4knbKLGjafJZ3Jsr
	Xa
X-Received: by 2002:a05:6000:27c2:b0:47f:920b:7fad with SMTP id ffacd0b85a97d-47f920b8051mr1216847f8f.51.1784799606034;
        Thu, 23 Jul 2026 02:40:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c6f076sm14217165f8f.34.2026.07.23.02.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:51 +0200
Subject: [PATCH v7 1/4] clk: sunxi-ng: mux: fix determine helper rate
 propagation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-1-8fd68aab94ae@baylibre.com>
References: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
In-Reply-To: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFtpYPA3bOOb2j0Z9hzyBatcOuHwPVa9K9nD
 Y0q6zTCxbCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhbQAKCRDm/A8cN/La
 hXFoEACQiqosl4kiv5gDmdbrtXdNvJ48ZH9JDp5cPQpUo/TJyNpAMmT5sefdW4IGUWqZ+oukkkf
 Z0pS8hwDD1kwY2rHFnt+6wyPhQo4y3SOvckimSFCONLnNQEz4UbUr7JBeYrugzt6/INv3wjUdf7
 T8DBb6q3RKDzbncuWsX/QmFR5L2t92vuDCETY2IHpSI2p4S42P/XxptxLtMrkdvgM+mguKZOZ/5
 nJAB8yCq8m3bJamX/PBrfI1yGBnvMXX2zGeIQR8xU4aCo01m6v1RZrta2SxmN25uK2E9mfRSPyA
 /+Pdlnt9zSCXfBjyM34JYxaNW9y4+hfDOwY+/qQoOViGeXM9My4IG1OqeLjhsoGjEZcprUweJUT
 cwHD/uc5xbvyTsNmfnub68J1scN71a3petL9skxO6u0AEmz9MMJn6sJJTTidPmNafxpkcgfY2Ez
 c8azmoaMNZMX+KDtlDXT6LYTWBCDZbTvyVHh7Krhnlnrh83p4MrlEv68EB+c6etnC9g5uQZY/92
 tZ7rtUcBW03DB5w4mFXO+qEW4Ey1CA3UyCFcneniGBfr2w8cweBqgmUXxFnsFRoBDNfdJZz1EOX
 wqkIAohMIeAOvgigkj2icl0mrpqo/KjkcMMF+TmqHUQsYeRPxAYn/9HU2fVGNmgxeNMXB/mrUiO
 ktpwRCWZjUnHGGQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_024007_918465_041A956D 
X-CRM114-Status: GOOD (  17.98  )
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


