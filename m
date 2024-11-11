Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09944D2E9DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r15fp6TOLoxxUhTToaZ5PCMMfFRPaQfw/v7oNpDzym4=; b=TJnCw/mDHh2icm7pQNyInqX0kU
	3IPqp2aD8ShQ3rPqlkj2sVZF4xKu/9ilL2j4T6UZUidowL/GMvQVykm8m0NIiK6aBIiYZ95bdUohP
	viUUxtr0k0Zsqr2JbuYmAJYmnOL/Tw07FYZjsnsLKsKnW25L3h/q1Xu+pa1FYIxp0zCnAzRRVlWYR
	18IvMopAHaxUrDrKlvAKSUxJJbVoiJVmGDhQLNWx6+uip8DBL1Yh0LZ5AhGEYwEPcHLqRSjYk2jEf
	q+dFun8U1wLxmGWFK2jiX2nNRQAMM8EB6yEQexvSi20hQp2v3LENrYa8pycHgrcrRmuypu5o9jsya
	Q4k/7S3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASZr-0000000HSGa-0lBw;
	Mon, 11 Nov 2024 11:27:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASVJ-0000000HQw1-2XTP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 11:22:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d462c91a9so2726076f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 03:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731324163; x=1731928963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r15fp6TOLoxxUhTToaZ5PCMMfFRPaQfw/v7oNpDzym4=;
        b=ngUfKEob5LUPok3wiXwtytDdXSIQFfYSWxzZrCHjsN5xcFaABIFCOtUV2nz7KNC/Pr
         BF+rxJ+C6lKwY6P3p0xtF2od3t2Ku1nJmLPc7pEtHpEQcefqB7rhVYL9oYH9+bwr9kC+
         IsCCBbqUX0+aHhewZX+/26ADST2z+1F4ZpGglOXeczOr/DW0siZzs2nI8pKhcf766J0d
         QVwzoG3f/kx4XyZ6S0T+5U9XRPkNIEDYnFTqA9Re8WzlmaEn9zOtExCt8mydhc8uSRbo
         5HzvWfUve65ONnfxfPKWjINNwjpUv1EWcyGGXgaXwFyEWbEYoFF3zKq7fSlLPcyPmmlr
         0wnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731324163; x=1731928963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r15fp6TOLoxxUhTToaZ5PCMMfFRPaQfw/v7oNpDzym4=;
        b=HdM+5SaJPmaUa+m6aO13o0a6zCD2a6mJ+6s9ZXtmOXHtE++n9wG2OATAvAq0cbiHHP
         229ufkGQgi0lVZxpU8Ob30ZaeEUlAGuJgHmkAZN5qqxK4d8sjdCiMjq0HKew41I8wbP4
         6g0wd+6t42cHBWYvC/0x7oFBZ7bxbrOkUMugBRo11UgLzze4SoaxsuaGOdMYKAS2E2B8
         lS19XdVDz3Z19aWu4mV7oAQ3x4Q6DIN4s28qPRiVsB7iTtTZ56UM78IvEFxgwJLJHA9s
         4K8gV7qJyrMHZ6ZsG4dUaFreq1woyb2lg8n9FjZ+LD0M+4/MvjkXYMbtiILK5rzztmZA
         MDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl65hDADHjMdf+JOnL2fL6txGQfn+kdKFaLIQHAylrA1S17GxaIG6SPSX4RKFpCN4kHBex56cxo8ZOnarTLuAw@lists.infradead.org
X-Gm-Message-State: AOJu0YyLleGavAhrB9Q6283ABMdA3WewEoCZc3ctbRJYoaCZtlArkxi4
	uFgR3giywz7sZww+seqG2MvufrlJAxu4ne/7YmbzjzMmYpVc3wYH8YLzEkEyTOmOIhFjHcp9aww
	6
X-Google-Smtp-Source: AGHT+IGflZEXP/JVJEfxJwMnj4NDWxpO4U33EWb9Gjbu/Uy04kSnSbAmH7N8NQ7ot39D/FsHYvNz2Q==
X-Received: by 2002:a05:6000:1543:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-381f182e8damr10825440f8f.19.1731324163396;
        Mon, 11 Nov 2024 03:22:43 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970e18sm12550504f8f.10.2024.11.11.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:22:43 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more devm functions
Date: Mon, 11 Nov 2024 12:22:36 +0100
Message-ID: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3290; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=FK4ixumk7uIFu4HoD9RKoP3Fky2rGGbSMcVJmfmJaxE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnMej9tGYutcJk0Z66Gb2L70DkS0eDqx3OEWRcV HW1ZB/UODuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZzHo/QAKCRCPgPtYfRL+ Tli1B/43Y9j/Yb34j2TVEDZ32am9t3NigQmtFIu52ikB0nMkeZGexX1amtgjCdHOhrmUOqy6dO7 yICIA3vjmKXSlgKyHuXraCV4bQ78s4RxlWvwOmxg69l827la7WkkThrNLv7gQ25P2XJdZbIoJke rRNrk7iV4kSZKkj+rmRS7bBh+R+1T+Plf6Cp8OFcZPmkcTfyEytVexghYJT9g0Sgt7RKKO7NMIs Y55HxP/TJfYWR/+qek0gwIMzubeFkkiOjqTh8+kmT+gadN7nmFRIwf7JcddYwxebyXi88fl6e17 Q7gz0pLMcUY70QLr+yppkWNuwj++V7kdY/T9qVB4HVGyIzpY
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_032245_675437_689BB62B 
X-CRM114-Status: GOOD (  15.29  )
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

Use devm allocators for enabling the bus clock and
clk_rate_exclusive_get(). This simplifies error handling and the remove
callback.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/devfreq/sun8i-a33-mbus.c | 38 ++++++++------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index bcf654f4ff96..5b630c6e602e 100644
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
+	ret = devm_clk_rate_exclusive_get(priv->clk_mbus);
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

base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.45.2


