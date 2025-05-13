Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99511C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 20:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=juaG+AmbI9q0dBfqd6nXXGHR850jBoYkaw6Nn2riiLQ=; b=FiYwKP/4bcUEqC0HDSN0dCBjB6
	qM38EzF/6Bjy7BazcP2U2cRZOGHI5LnZ2ZN6Pc3rEth5iu2T1WfbITnkL5HBnXBrgvLt3/YXffbyO
	xrKcZdVdAKO4ooEVtnx0cn1kofzSfX9HfDP8YnWjFVJ2Dfae8GQt7QqG/asyFVAKPCgHMninZuskq
	5jL4qFnM1E7sBZduzYSG4x6jCsV/jQtJHxpHDptdKN50V0WMwEOHQ5gHXdJ1zglZViuHn+3MknzRd
	WMeWabvlApEVfUtrrunU2ZfOwrm83BArncYN/rchj/J77R/4mxckmhErvvuM/Ie9D12LQDi00L0bV
	lAlEkReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwRW-0000000DV9V-2VCw;
	Tue, 13 May 2025 20:41:38 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwPN-0000000DUgm-34ft
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 20:39:27 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1043769166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 13:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747168763; x=1747773563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=juaG+AmbI9q0dBfqd6nXXGHR850jBoYkaw6Nn2riiLQ=;
        b=Kp7ceZLVXJTVQ+b2j58kSYvQeP3NW0XaNkl3gJOROTJrQ3NzO6lX2Ob+z94WackLRG
         qR+WPViVqHYMZ09ikl91J3KgffkgfwZ+ltni48/laJrXt+h22Oc+buTxWxlT6qWY4tQ0
         JOoi5IkqosQgFJnfl9PaQ65Fec9VgPC5Z5Na7ihGQ2n6F4KhkX/BzY8m0psUf7OCvenE
         xAr3mjrNRLA4K84bo5eWmpVdCJSV056MwpyG2arJWzivmReHRQnd9pJ/1KwGlPlqHNoW
         gBUM1JdSrMSo9JZgq/VrYYuEqGqdYczdSF6QAu/5qXRs0OGHG7w7TFfuvqMmnhjbugPU
         DUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168763; x=1747773563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juaG+AmbI9q0dBfqd6nXXGHR850jBoYkaw6Nn2riiLQ=;
        b=KJmuejG3uOSNNKpnpNEBP8M8mnJG53TGxgVs9mgqga63uCF3p877yrB0TW4n6fLNu0
         /HXQPJLZIYyZUp5wiz5uXnvLmrhckobnleNzK9xy9sTcW+Q7sBywuqkWCLXE4TanMPsP
         DpZCj7KZWOCv5wvHvzcir83ziuICxBzD/3X0+rUsM7CWuW+f85Ow2hmdRmR5nmPwdsLd
         lgXvdz+vRUrc2aQ4aWweg5cu/IR6NeWzn76S0jncIYCbhyf/6yRdJ7kYGBZKrMsvbqaH
         uUacXLTCCCR0ToBdWEEdMUEnH/PCkcLINYNBPhOusj1k2vaOcylarDc+b+0Sy/2JGkUH
         Hsjw==
X-Forwarded-Encrypted: i=1; AJvYcCVlEYnI8Tk0OFe2vi/1KvIayyNZZPV7HbPqRDMyYYV+w8T0nK9cEKT4NCGgv7r+0Dko0BlB2/GEBPW5m0ed45OP@lists.infradead.org
X-Gm-Message-State: AOJu0YwuYjnAj97Z9mtTMkDybGPqgEcczp6n+aTyqmVae+XVxZ/tfY+9
	h/uXZ9wawnhZsr8G2Ghbfrluz7dsq+aWNaBGHGRd55i5CY3tREQT9d9dSJkLcCA=
X-Gm-Gg: ASbGncuNyJONYJF+X8DPaLgZU+O0M46BPSSNvarFMnkATkchrnZvWONgh9n4h9cqVCf
	OYONG/mZivwIigaW6Vn+RyKayxcDN/NQmGQOoCSkTHGw7EIyU8v5cXeHjWzm9GTjbUxlfKxbKb+
	N3YsalXja0f6NZUYU1O0cFRmYjrKnILBKbsLSxqgiG5n3prCzvzyEGZiPW+/iheQ+tpnN3KiJOi
	tbp7nDsWt1ihXUi6ihNJMVTKUDHaXXD4T5sNSaSeJ8+6WFNJEjsrAsQmS+KEKEnI2lHmEzFIvxD
	vn8COg7VTpJHo9SRxGJTrKps3lLgw9SvlBOkzNd/D4tmMoBuUOQh6Vvs
X-Google-Smtp-Source: AGHT+IEWi0WXmXZATUkUPYXouuDIbFY4Wie5OHgl0qQme2z1Ey//pJl2AcKhRMhJ30qxF29lDPOGiA==
X-Received: by 2002:a17:907:7f93:b0:aca:d5a1:c324 with SMTP id a640c23a62f3a-ad4f6f2d088mr92332366b.0.1747168763600;
        Tue, 13 May 2025 13:39:23 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad2417f2341sm558309166b.19.2025.05.13.13.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 13:39:22 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <chanwoo@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] PM / devfreq: sun8i-a33-mbus: Simplify by using more devm functions
Date: Tue, 13 May 2025 22:39:02 +0200
Message-ID: <20250513203908.205060-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4304; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=TJafEwdeqjrP6AcWhb1FzDP3OG9jHCSl2xxI4+oU+mY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoI63sY58Twokv5DGNH6EVESTwuHi9qJrQuljDW 0TZ/o6436uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCOt7AAKCRCPgPtYfRL+ ThdmCACTnKilk91CPrcwCCc8E6w6Qkeu1s7JX1d7nbxmop8SKujh1EkNmq3VZsh6Jmr/lrNMsq0 TFJEt8AsI9PDKE8pgk/O0HnavuU+wFSXMqkXvfho7F/bZ3AH0YqB6FzcVQTq2SdjR/fdfYedDAN xq5za9VcjV9tJsNETgJBu4lk1F34qD5+EMsTcWU3zInCUMoiJjsvox/8DV/olg3mWnNDgbiZPbr 6FfbQaBKYIais3/ScGfPoThGaKJgqhNGJur1JjCHlG4tuO44gtIcd4lMg5gDiiuj+ox/6MqCxUy Q6n84JggAIId8OQOhKXPjNL9k8hlNKcF5kcVyRqNgrwaAkO/
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_133925_904057_67520B22 
X-CRM114-Status: GOOD (  19.46  )
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm allocators for enabling the bus clock and
clk_rate_exclusive_get(). This simplifies error handling and the remove
callback.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

On Wed, May 14, 2025 at 01:25:51AM +0900, Chanwoo Choi wrote in the
thread at
https://lore.kernel.org/linux-pm/CAGTfZH2uk-6-R5QNZwsssQ1UtnqexKeo=e=SsXB26NMwqf8c9g@mail.gmail.com:
> Instead of fix-up patch, I'd like you to send the v2 of patch[1].
> [1] https://patchwork.kernel.org/project/linux-pm/patch/20241111112237.336310-2-u.kleine-koenig@baylibre.com/

Ah, then I misunderstood. Here comes the requested v2. The changes since
(implicit) v1 are:

 - Fix the build failure that I introduced by forgetting to add the dev
   parameter to devm_clk_rate_exclusive_get(dev, priv->clk_mbus);

 - Added the Reviewed-by tag for Chen-Yu.

 - Actually compile tested. I would have sworn I did that for v1
   already, but that is proven to be a perjury now. Don't know how that
   slipped through.

Best regards and again sorry for the mess
Uwe

 drivers/devfreq/sun8i-a33-mbus.c | 38 ++++++++------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index 7c6ae91ede1f..4bd5657558d6 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -360,7 +360,7 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->reg_mbus))
 		return PTR_ERR(priv->reg_mbus);
 
-	priv->clk_bus = devm_clk_get(dev, "bus");
+	priv->clk_bus = devm_clk_get_enabled(dev, "bus");
 	if (IS_ERR(priv->clk_bus))
 		return dev_err_probe(dev, PTR_ERR(priv->clk_bus),
 				     "failed to get bus clock\n");
@@ -375,24 +375,15 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->clk_mbus),
 				     "failed to get mbus clock\n");
 
-	ret = clk_prepare_enable(priv->clk_bus);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to enable bus clock\n");
-
 	/* Lock the DRAM clock rate to keep priv->nominal_bw in sync. */
-	ret = clk_rate_exclusive_get(priv->clk_dram);
-	if (ret) {
-		err = "failed to lock dram clock rate\n";
-		goto err_disable_bus;
-	}
+	ret = devm_clk_rate_exclusive_get(dev, priv->clk_dram);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to lock dram clock rate\n");
 
 	/* Lock the MBUS clock rate to keep MBUS_TMR_PERIOD in sync. */
-	ret = clk_rate_exclusive_get(priv->clk_mbus);
-	if (ret) {
-		err = "failed to lock mbus clock rate\n";
-		goto err_unlock_dram;
-	}
+	ret = devm_clk_rate_exclusive_get(dev, priv->clk_mbus);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to lock mbus clock rate\n");
 
 	priv->gov_data.upthreshold	= 10;
 	priv->gov_data.downdifferential	=  5;
@@ -405,10 +396,8 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 	priv->profile.max_state		= max_state;
 
 	ret = devm_pm_opp_set_clkname(dev, "dram");
-	if (ret) {
-		err = "failed to add OPP table\n";
-		goto err_unlock_mbus;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add OPP table\n");
 
 	base_freq = clk_get_rate(clk_get_parent(priv->clk_dram));
 	for (i = 0; i < max_state; ++i) {
@@ -448,12 +437,6 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 
 err_remove_opps:
 	dev_pm_opp_remove_all_dynamic(dev);
-err_unlock_mbus:
-	clk_rate_exclusive_put(priv->clk_mbus);
-err_unlock_dram:
-	clk_rate_exclusive_put(priv->clk_dram);
-err_disable_bus:
-	clk_disable_unprepare(priv->clk_bus);
 
 	return dev_err_probe(dev, ret, err);
 }
@@ -472,9 +455,6 @@ static void sun8i_a33_mbus_remove(struct platform_device *pdev)
 		dev_warn(dev, "failed to restore DRAM frequency: %d\n", ret);
 
 	dev_pm_opp_remove_all_dynamic(dev);
-	clk_rate_exclusive_put(priv->clk_mbus);
-	clk_rate_exclusive_put(priv->clk_dram);
-	clk_disable_unprepare(priv->clk_bus);
 }
 
 static const struct sun8i_a33_mbus_variant sun50i_a64_mbus = {

base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.47.2


