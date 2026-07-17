Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ACDC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxMkzfTuRNAdYSsxT6YGmZwozzVZOIfJAMqM6UE3eUk=; b=ackP3BA+wMiAz+CMD228UzItHw
	IariDdQXYqVLaoa4n063j8ZzCHecAksjswyQWf44fHw2hpICnaLzXkjLRofp0CFmwLYHunwd/84MS
	aJWMmtOvuxIjpNzjJ0/uPBktD/d1idZvUGlJfOKvnLZQTdwC2yT7CQXRJIPo/nigiXoFOoJXO6/C7
	xqn9fNME3gbs2qqiQbyqXV755iEoTsQxPGh0stb+OYA5lXKNVAeqPhpcpXXZkK69SE5rlhiOiAWjK
	mLpUIEZCKIVpnIjH0B80Wx2Uu5zziQ4KJgHjTwRlAbIox++cWzqLOC2kSdTBfY57ak5YbCGvNo2q0
	4G3OGmZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkRC-00000002bQf-2PE1;
	Fri, 17 Jul 2026 15:25:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkR5-00000002bNK-1dKl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:25:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4084354f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784301909; x=1784906709; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxMkzfTuRNAdYSsxT6YGmZwozzVZOIfJAMqM6UE3eUk=;
        b=lBIXDJuyLPVW6jBS5yfWi24AiFYfing3A2a2Ykx/2mTGg16bO8Cp+uHuXsmOwEcNt0
         UfDWZQuFcwVvKahme9EH9LMFW8zYOPKH3zfbqJtPg2KIVHONnSDsqBjhrsdevpRF3zZE
         ZELF3Rp0gouB2zmgpqUOlp3CwjfksKqrBNpSjGOGIl5pJqt+OfCy2oPk0qSxt7X/Z6Ok
         qLFDJUgsa20LNLLzDnLiiHvgRhn8UbewAFYgyu1xiCxpF9VD7avRz+ZT8OfyDbZZuZNT
         bUW0P8KMTB2bEnI/bnnzbVqAuFAbWUmpQ2sFmYSHwb6nOVoIsS/Z2md/6MhZ+smMln5s
         Ggug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301909; x=1784906709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxMkzfTuRNAdYSsxT6YGmZwozzVZOIfJAMqM6UE3eUk=;
        b=R9XTX3dC/HdTjnuGqA+TUxgux9xcDP/D6+fH7n+gXlSbCQ+3TFl3OtVVH+WliJJrmM
         wEF1FAVuSqneevSrAKbhT4RfKLH93yAXwVu6nqQfkbsBxCE3w3L5Pl32mLGEWszyOBEh
         cieOiY1iXTmg5O1OGhOztBqGVeX3G5SHQzM48WmtvXi2Xjk4lHhcxxsbyanzq5j4yQY5
         OYD6fKY2NfNHNJXbXil93gfpT5l6z4tDJ0SrTLRVPz779gw215M0ULQoIHsnNUGwsH/P
         J8T4SbK1Nis9KpjXt/Pc13F98hxthMK4M6FZf6rrBqOUK/fY+iREXANN9hhlx8qcoIe/
         tavw==
X-Forwarded-Encrypted: i=1; AHgh+RrjF5EY/WFUtxjoy4n+qUXLuycRNM5rH2XuABMlyA7/GY+0HsdjORNA/gbGQoIPN316pw+Hk+q7XSakzoiduSPi@lists.infradead.org
X-Gm-Message-State: AOJu0YwKYg7liJHL/jQMQRg/hX4LtDX1jgkBJmTI6ARNrL6Xf2MHC0U0
	+ucEr74seqRHESPXIYj4cEUmD1C2m+E10Ee7EZTUa+iutWBFJ92lPlIuOz1JRuFyjA8=
X-Gm-Gg: AfdE7ckElTlRywlSPVhXuF9Z2KReqe+0oD1ba2tS1jbgRPE+YH2KNtV3f67v96coox9
	AHZB1Rt4JKlLhuXkSK7L6l5OAFeLuxe1q+BK44WxiTFevyzVkAPBugI7A1ipuoDT8yVypSiE41+
	cnbeqybJh5Gt2cPzzV8B7ffTPn/J++1Qwi3eaSLpGVIHWWjeKps7gr4jng/1Hys6D/mk+hO+L6c
	IX3EHgIbxnwVfzwBQ9ATKfz2X2mHdOEwKtBaPRXIlpIwsN+im63B6tmLy45tq61tkPIdYq/mA3F
	ylD0zufnr+vp891o3fJm+5Hd0Uxuw9ifgO/hE8z8Nqk1fx2sNY/VxajtwuG86O2rFIEPvN/N9uk
	WsvM0v8fkbo/fU0k3rV9xL2c9iKeO5tuUP7rm4TQHUCgXr1dcwsvoNXVW6YpoymEao7Q7Knm7+7
	tC
X-Received: by 2002:a05:6000:43cc:10b0:47f:673c:42cc with SMTP id ffacd0b85a97d-47f673c431amr1140040f8f.27.1784301909172;
        Fri, 17 Jul 2026 08:25:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e49500sm4498478f8f.2.2026.07.17.08.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:25:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 17:24:51 +0200
Subject: [PATCH v5 1/4] clk: sunxi-ng: mux: fix determine helper rate
 propagation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-a733-rtc-v5-1-3874cc26abf7@baylibre.com>
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
In-Reply-To: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4247; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Q2OlWVW2kYyvJ4ck9C1HFEDQQxKC0CvD5EifWl3TI8I=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWklMaJ5nQazW/CvZptCQwUdPHVXC+ogZgt8OQ
 joxR/uuJXOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalpJTAAKCRDm/A8cN/La
 hV5oD/9dlma9q3nUzL/D6R2ufySBp084Z81IAZgEr67zxgghSUFHEQ9bzvO/nc0VNLsU3M9IUh0
 4ZA/rOJ3oCRhfPhPx7moFNZeGHRDeIX+EPwqmmPwmtx52xUfjIJ4690J+m605pZvymTm4cY+jQd
 gceE0frmEqbyIEfu0gnDV6rq30G/RTR+dZot1y/hJxUzXOF3mNCRkPZdgYONXejfRwg1DLjVCU7
 WUgNfNii1Yhug11rQimQoyZX6GR+Av38uXBpHyyk9dNFu8zWx/yGNFjy0rS3pbeFeMPwCCzNjkS
 FWZAKrctBq+rV8TfjjkG04l6ebo7GcRWVZMhH1v05Tuh+cUwq2uVbWNBUr9tZZLeVJZo8MpEJoV
 KIf+AJ7R0G6KntjDdI2EzYv3iPhI/2tzidO4bq1N9GsO8WAruQVxS1ZvOKihwxHemA/GVFvRiJb
 3rOXM/36rTpfpNONyHxYOnBTosYJsRivG2X/FLEudqtCWgI6a6Lr0WJqcwR4MQWfXnyavgRajQV
 xDGUQzByRORUMmKK4g6jdmMG6An0wMtis3VF55mqs4XTb+ba4VcS4MqoM7pW9+No+NZpARzRsi6
 tJJGUPS3YNZFzaML2l4TXz/DDS3jsefb24rDGoAo++hpgYLMai4uKq0qeYNncyB06BqezdA3bS/
 kGIQCWWwp+aAl5w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_082511_483054_370388F1 
X-CRM114-Status: GOOD (  17.66  )
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
 drivers/clk/sunxi-ng/ccu_mux.c | 56 ++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 09230728c400..75ec3457324c 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -92,66 +92,64 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
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
+		 * This effectively treat the predivider as a postdivider.
+		 * It stays mathematically correct and ensure whatever
+		 * round() will do stays correct while walking the tree.
+		 * It may query the parent rate too while handling rate propagation
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
+		 * of the rate propagation mechnanism. Same goes below.
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


