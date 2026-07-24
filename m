Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0185DC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vmy1hUJRw3q7Ic7Vi7VoynD2pQqL5T8Kb7uNyjYlj78=; b=zLyf6YfdWDrm23P2n/prauk1YL
	HscyvCepvbOHRADKTWcw1hPW5yYt6v3uPjbiphm7QhrG+2xwg+Ihq+VO3glxyzhYI9HmSemMhZQss
	DnIj+nQP1vR8A6iunrG1NIWMYbWYCR2+W95rGQU3pEeBs27nsmXu12Z7jsmtrsrr2hJV16IBK5i2n
	6Dlw+ad226naZxBJRNw9MYlFg3t96rEpk0dnroAugRAm8mYZXEamuOL01m4j+VzSecq8p4FRoGhRW
	795cYNZYFI/FnEoLEXlPxENNodPTOujV4cnH7EuFnu10XTp2QTeJSj/M3vAQaZlUkxz8uhpA9j4WN
	/x121o2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpR-0000000FuFQ-04vZ;
	Fri, 24 Jul 2026 09:04:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpM-0000000FuBC-2fOW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:04:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so170726f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883859; x=1785488659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vmy1hUJRw3q7Ic7Vi7VoynD2pQqL5T8Kb7uNyjYlj78=;
        b=jMQhZlaloFVc3nMSnxAg/Us+8deC962hX5bLHYd8aQFZUnj2vENfBBE/1GB6u4HvQ2
         8T8yu1F/SU2Ebqpdr4la6akRmpt6dZyL3dDaNIFWRiI+Z2OswOK2rl58NWhh8m93glh1
         XPgV1rHC/paU4HtWjysjikxtH5g+tMiIkMj+0QkdeYihsl7E4Dw17M3nmi+XVVKKUWRt
         hPd9K4vzFWbYOcRYrz/pa20i4hJqznCAOl63j5Xy4lpasG/w62QIVDeTLnMS7vdlVl4w
         Eb2iB5fHKYN1I1JW0RHEiTGg/fmIbLVLrgsaK29JwBrDe0OCLYitqo2S1f8QuL0Vp9H5
         3J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883859; x=1785488659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vmy1hUJRw3q7Ic7Vi7VoynD2pQqL5T8Kb7uNyjYlj78=;
        b=aP3QWNECgR8innmqVVmdbU7oeGOjbNWOLTSyfutYmA0rnFjqFB2tEvBmCIJ4P1MzAK
         D1f8xhdeEx3jEWykAUV9HWS6rAwR7TOImCNu2DO7+SM3j7JLMpLorlXMLNcHsWcNPlWG
         JnwqCaOJJJxIoO88ACJIz1B6MPuPM74hdyt0tw4vYqf162yF1Zu1zJ7mbM0hD/X453Cb
         PULol9dCr4qb+h1St8gWk6Li1mKTsylzgC6hDfgCnIOShR9HmQg9bkcdJjGDuIqfVM9A
         IRXhFRgYOP8EGp/5sZcOP+iD2kQ5aR9t9sXFI7To2DJyXcZLFnMwtMzEYUcMK52B6Izv
         5P8g==
X-Gm-Message-State: AOJu0Yxbeo4CZza3LkjKRePEq5+cMLc5XRBcTnEulk/Z/rWwi54uORBc
	58pl5mJAtjc+sEo17+dQllhlaeu+0JFC6Ds/Dl+s9hj+NwDPcc5AweOXORx5rL93xjc=
X-Gm-Gg: AR+sD13CI3wt3acb44Oa+6cgnO3/icakafWe2WlJZfNhe8vrKmesGeEVxUkD+oZ9p6H
	nuTokaq1KzqBMOWT89mvgSzfgnj2fMk3ReSPFCRpP8b3XlEzZ7mwWSuZK+SjG1K4jZ8IL4b6tsl
	M/leH+1N+cqa7TcVjGgT9y1gq9glmRcy5iVfjeRNW/5T5WnW5TQafKCVz+oDfvBV94v+TzfTkgn
	qTyC2q6lXeK5Q50ttaVgZFcJPcDeO+2TSdRzYY0FLTpTTt3NGwIyPeyePVQUlbQou9wtoc1/aKR
	/CsnkdDcL2qYKKzQGfHq7yPdtQW+ln30FZeVADwgBTitodJzuvMq8a0h1L7x791Bi0fAVrWAEey
	RQYPuHKd9oYJp2phMmUNwwba98pVNAOi3ExUBVJG23eIxQsKL5WTN/031Fr52GoMOolJxRt/pvZ
	6s
X-Received: by 2002:a05:6000:230e:b0:47f:7b85:b883 with SMTP id ffacd0b85a97d-47f8d761973mr8352142f8f.47.1784883858984;
        Fri, 24 Jul 2026 02:04:18 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c66cebsm21940318f8f.30.2026.07.24.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:55 +0200
Subject: [PATCH v2 4/7] clk: rockchip: clean-up simple provider misuse of
 the consumer API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-4-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4291; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=c/HyNkuMW4z6Zoljb6+iJsr+eONkoiQ7+lwzLTi5cS0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqBk+IBpzMF96bigh65kKM8JR3kcYzjychCK
 YLz8MopaNCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqgQAKCRDm/A8cN/La
 hTcYEACzcSp51w21pbh6PuxyNr24pZ3Nv0ktAmcU30YtrNSoWzIKyhG/R/BUjOJjBIIM5fEjFsc
 I9Ff5FAQ47iojQ4xWTuMQEcie071jy0QoM8sZvfgO3exSwBl/WWTEC9l516DlVG6FykYt/yiYG0
 fESTr3eLuPkGhtarCnMF59QHA1lB+1HVNk40mVHJ5dz+EME59MdLhbrnh435AVGYxb21++PrMvf
 fXl8QabMo7nUrBlCln+T+1yUy0aHgunlcb9vIs5Td97hFAR0L2q6tIwjv3K9bYWeYcSYrlSV9Wc
 gt5WNE/fchVqJZI0ZPhOtLKzad6Cu6aXOLhv69hNyKT+9GIwIwyK+4mw+ISAGRd8zb3vPCllp4U
 /pQ4MOOYcf6oi+Fv0/Yn3ZOckXomugCwNDcfDb/TnWO5TiUXdvF4oYQZe0C7lXTJIhFJX1zuX+9
 WoWxbbbYLUVtPOzsJhyfWuvhiMv1GGbXU7b2HIhPdIfKSWDWfQv6VnD2+xoIlyX132umga2yB2Q
 v9w5RJfsUI8Vc6vB8NBLI6MioQO8IyScg1hUX4E1jxa4XOV45O+oij5ex2/lBBPbc9Px4hdWu9j
 28R5oywcHI6hLv1xI5uaq5AXKff7NgVRPDts1XPF9B1jzy6mEX3cCtFYAE7+KpznmpEfEWXEK8b
 5KcVQbKkgbR7zJQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_020420_800904_718617C8 
X-CRM114-Status: GOOD (  11.51  )
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

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/rockchip/clk-pll.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..89a783204f0e 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -259,13 +259,13 @@ static int rockchip_rk3036_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	const struct rockchip_pll_rate_table *rate;
 
 	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
+		 __func__, clk_hw_get_name(hw), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
 	if (!rate) {
 		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
+			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
@@ -319,7 +319,7 @@ static int rockchip_rk3036_pll_init(struct clk_hw *hw)
 
 	rockchip_rk3036_pll_get_params(pll, &cur);
 
-	pr_debug("%s: pll %s@%lu: Hz\n", __func__, __clk_get_name(hw->clk),
+	pr_debug("%s: pll %s@%lu: Hz\n", __func__, clk_hw_get_name(hw),
 		 drate);
 	pr_debug("old - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
 		 cur.fbdiv, cur.postdiv1, cur.refdiv, cur.postdiv2,
@@ -336,12 +336,12 @@ static int rockchip_rk3036_pll_init(struct clk_hw *hw)
 
 		if (!parent) {
 			pr_warn("%s: parent of %s not available\n",
-				__func__, __clk_get_name(hw->clk));
+				__func__, clk_hw_get_name(hw));
 			return 0;
 		}
 
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
-			 __func__, __clk_get_name(hw->clk));
+			 __func__, clk_hw_get_name(hw));
 		rockchip_rk3036_pll_set_params(pll, rate);
 	}
 
@@ -743,13 +743,13 @@ static int rockchip_rk3399_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	const struct rockchip_pll_rate_table *rate;
 
 	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
+		 __func__, clk_hw_get_name(hw), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
 	if (!rate) {
 		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
+			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
@@ -803,7 +803,7 @@ static int rockchip_rk3399_pll_init(struct clk_hw *hw)
 
 	rockchip_rk3399_pll_get_params(pll, &cur);
 
-	pr_debug("%s: pll %s@%lu: Hz\n", __func__, __clk_get_name(hw->clk),
+	pr_debug("%s: pll %s@%lu: Hz\n", __func__, clk_hw_get_name(hw),
 		 drate);
 	pr_debug("old - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
 		 cur.fbdiv, cur.postdiv1, cur.refdiv, cur.postdiv2,
@@ -820,12 +820,12 @@ static int rockchip_rk3399_pll_init(struct clk_hw *hw)
 
 		if (!parent) {
 			pr_warn("%s: parent of %s not available\n",
-				__func__, __clk_get_name(hw->clk));
+				__func__, clk_hw_get_name(hw));
 			return 0;
 		}
 
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
-			 __func__, __clk_get_name(hw->clk));
+			 __func__, clk_hw_get_name(hw));
 		rockchip_rk3399_pll_set_params(pll, rate);
 	}
 
@@ -992,13 +992,13 @@ static int rockchip_rk3588_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	const struct rockchip_pll_rate_table *rate;
 
 	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
+		 __func__, clk_hw_get_name(hw), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
 	if (!rate) {
 		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
+			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 

-- 
2.47.3


