Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB79BFEC0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alJwQhTp7nkw0Ib79edmwantLXplbDvUqq4BVXNADKE=; b=gWto4L1OFCLGNTC8XCMDEvVFCK
	YoTg/kad8BDJ/1gLe65PAW/P8bkouAtYj+4bTeEE4+6n5wFqjtK6OOVgTL4WMRsqopsmS2+Fc0IKq
	C24tEvJg5oEyXeqT+EeLZNPgblHPmD8hVKjuYNe76gh0lb87BvgebVTt7NxYtoQzsVsNhyfJCOvJm
	5llmZuZV2GysCfOBADB3EH5jN17A6ymlSstMCut7WW/eQWPTwdyRbbbdeMS0pvc3sSccApMT/qdVW
	hoL6gCG0XDM9xU7htwrOSuo7si4TcWQMDdCU8PibET3MpUXlGa4XeLL2Rum0EqxjrD4Q4H3Iz0t0r
	WpAK5SEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Tg-0000000249M-0qsz;
	Tue, 24 Mar 2026 18:27:44 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Td-0000000247c-2Y8D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:27:42 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-35b88a4f123so69533a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376861; x=1774981661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alJwQhTp7nkw0Ib79edmwantLXplbDvUqq4BVXNADKE=;
        b=LanE54qR6T31IOH4XOziZ9+QxIxxiuR4VNLjkBNmLMMkmvGLdqkISSPcNT6J/uF/pp
         vuzVm7v+opA2ib/z4hmwAFwFZ/c5GZyj+Xq2kH7Z/BZOxJ1Eyi81clhnuubk5Rts/6Ih
         CGX0X3RpzomN0VS2bxOWEWS/dvNUOrn/aIaSayldAQ/1j9q7FfZkUAMTZFsU3aWS6IKk
         DfPF8SX2BCMylJ5X7eqs7jMrkDTuFu6fkaomF9D0lYMeEPM1HTXm6JnV2480ndz41Bnd
         MUH6XnXYJwKYgAJKs99OlZasFN6fOqvJ49k3LV4r9mom8/kNo3X1+2Oh5HKRrVLn6cUm
         BpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376861; x=1774981661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=alJwQhTp7nkw0Ib79edmwantLXplbDvUqq4BVXNADKE=;
        b=jHx59JRP3eE73KD9S9iryP6PV5RYgGS+zHhtPuLAVq27kuah0vOxcs0ZJD44oXITSz
         KsyGdj1ZtsaX2Sz1+LPi41lR7cqbnsBhWvTUs12c+b5fq4CNqYGD3ofVR1Txue9Dn8wX
         fE6mN5RJaHj2oYjCo7g6/I5BivfQTuFDCVaXjco2rcEhtvOlnFLb+UJ8Nnw5EfRfmICF
         Jh1Q2Z2QgKI+18Zq4yv4lV8Gfk2+W0zE5KzFzsO4j248pNOTHnefW6GYjbOOvZ8bujgA
         kdgIgy6d+ljQ92mH54VPAS2N6ybt1kPG7/wqnISAAGMLKUOCoyhxVxfMRx3FBrmXw/jZ
         ANCg==
X-Forwarded-Encrypted: i=1; AJvYcCWLEfoyPguLT9Yi7WJBnsfDK1SwCHitE4TKtMZqXGG0e0ptbsZRJv7RJh4ypcHGaGqaiaZdrG31Yd+DIAUPP8tb@lists.infradead.org
X-Gm-Message-State: AOJu0YxO2cACDpOYRJvIZbe+XsNH4FwUika78Jazb4fxWPCQRWCY4K1R
	xoKyhOKujQvEIpJEj61OKDM0YZihWSX+1XA/41l4BUw07cQkRsOaOnk1
X-Gm-Gg: ATEYQzxcULnU70VGhNCSi17C4yuqqygVP0EFWGehGW1PLnrpW7havq7lvMig1fCa1oM
	h41pttFnXfMu+GM3L8EiJQ5J6gC0WoJ6bvouu4aYXbX/JeCJNTNsU7TKPbYko/lwExSjo703SKJ
	/e/W7FDl3OJ/MuTy8YgRpft4eDzpjJ/YHf/RdGaWwAmMw2nNUvg51zdNDYbHL3dwrlnZOuH/G3m
	8+NOn3RCnRN3Rk3/9AjtXAinQkZbm59Dj2m6V1lm8QITC0rGmgXJ1MPKqdxLzzy4z3/fAw8Es8W
	uyunYGtd8OL+S4jwBwTkv8gVWbRllq1FAbxeYvsQMCuk0rDt78ykz6zTq4tLG6rXQJwS5b0fJhP
	xAVHMDUkazcUqjSpuVtdGOUV6qm4cSyCT0cNKI/CIg+tV3bc3QXDkDUIx2FvFnD0TMNywVW3/MS
	IEFwzXWpiT8v85SiG3d5o5IVD8GQ==
X-Received: by 2002:a17:90b:57c4:b0:35b:9703:7664 with SMTP id 98e67ed59e1d1-35c008d38f1mr4197956a91.10.1774376860812;
        Tue, 24 Mar 2026 11:27:40 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:40 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:51 +0530
Subject: [PATCH 03/10] i2c: sun6i-p2wi: Replace dev_err() with
 dev_err_probe() in probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-3-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=3450;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=mGoeA4RoMr6oMafJS8Wz9uEiYGmdoZGvaadkVl07Ac4=;
 b=mqDXFTn7P7YKfYZq5yfTqBReywbYSNkXTrDiQ10Gxn0U4N3AcD22e4px2/bKmxQtkFRLFhMV5
 D6Rwa2VObbECiZHEiSRVGIVnkT5nDLR0wDkwvKuXdMmJb12BQQQ/qlI
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112741_659437_C470400D 
X-CRM114-Status: GOOD (  13.47  )
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

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 55 ++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..dffbe776a195 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -194,22 +194,16 @@ static int p2wi_probe(struct platform_device *pdev)
 	int ret;
 
 	of_property_read_u32(np, "clock-frequency", &clk_freq);
-	if (clk_freq > P2WI_MAX_FREQ) {
-		dev_err(dev,
-			"required clock-frequency (%u Hz) is too high (max = 6MHz)",
-			clk_freq);
-		return -EINVAL;
-	}
+	if (clk_freq > P2WI_MAX_FREQ)
+		return dev_err_probe(dev, -EINVAL,
+				     "required clock-frequency (%u Hz) is too high (max = 6MHz)",
+				     clk_freq);
 
-	if (clk_freq == 0) {
-		dev_err(dev, "clock-frequency is set to 0 in DT\n");
-		return -EINVAL;
-	}
+	if (clk_freq == 0)
+		return dev_err_probe(dev, -EINVAL, "clock-frequency is set to 0 in DT\n");
 
-	if (of_get_child_count(np) > 1) {
-		dev_err(dev, "P2WI only supports one target device\n");
-		return -EINVAL;
-	}
+	if (of_get_child_count(np) > 1)
+		return dev_err_probe(dev, -EINVAL, "P2WI only supports one target device\n");
 
 	p2wi = devm_kzalloc(dev, sizeof(struct p2wi), GFP_KERNEL);
 	if (!p2wi)
@@ -226,11 +220,9 @@ static int p2wi_probe(struct platform_device *pdev)
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
-		if (ret) {
-			dev_err(dev, "invalid target address on node %pOF\n",
-				childnp);
-			return -EINVAL;
-		}
+		if (ret)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid target address on node %pOF\n", childnp);
 
 		p2wi->target_addr = target_addr;
 	}
@@ -245,26 +237,20 @@ static int p2wi_probe(struct platform_device *pdev)
 		return irq;
 
 	p2wi->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(p2wi->clk)) {
-		ret = PTR_ERR(p2wi->clk);
-		dev_err(dev, "failed to enable clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(p2wi->clk))
+		return dev_err_probe(dev, PTR_ERR(p2wi->clk),
+				     "failed to enable clk\n");
 
 	parent_clk_freq = clk_get_rate(p2wi->clk);
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(p2wi->rstc)) {
-		dev_err(dev, "failed to retrieve reset controller: %pe\n",
-			p2wi->rstc);
-		return PTR_ERR(p2wi->rstc);
-	}
+	if (IS_ERR(p2wi->rstc))
+		return dev_err_probe(dev, PTR_ERR(p2wi->rstc),
+				     "failed to retrieve reset controller\n");
 
 	ret = reset_control_deassert(p2wi->rstc);
-	if (ret) {
-		dev_err(dev, "failed to deassert reset line: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
 
 	init_completion(&p2wi->complete);
 	p2wi->adapter.dev.parent = dev;
@@ -276,8 +262,7 @@ static int p2wi_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, p2wi_interrupt, 0, pdev->name, p2wi);
 	if (ret) {
-		dev_err(dev, "can't register interrupt handler irq%d: %d\n",
-			irq, ret);
+		dev_err_probe(dev, ret, "can't register interrupt handler irq%d\n", irq);
 		goto err_reset_assert;
 	}
 

-- 
2.43.0


