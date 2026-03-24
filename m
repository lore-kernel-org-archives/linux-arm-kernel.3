Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE2FEC0F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOUVvE5FNmjkaySdFPrc+7+hSpPNsoY2HaGuj8AkFfI=; b=VNrrV58c9NCVI9990Ok98XWbPB
	rKsBz1as3RLJ79T8zoYjWIfZQFlZfCKXP4+hACFpsgoSemHNm7Zt6r+QcbQLr5NMJjQ1RtkjziPjs
	s2hqIrLfhXqSDUIHI9cLsuYj33Sd2E3iBo5gtIcBdM7F0U1dBMgKES7v/iylv7NqAW7AtWlmk86Gc
	PpWsNWMl0trcevENHNdt/wz4A3ifxzFrZu94757cvO7Mqrs581kXofBaxlC+WVJlc5yfgAhEgdHlL
	RG7NXMIHhXoIrSSaviRXXLYqEOcTZnaZfBSTjzIbOlrWkF8XhiF/1fr2cZ7WrMR1FMGIYPaAtAswn
	H1SmjiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Tp-000000024DF-2EZT;
	Tue, 24 Mar 2026 18:27:53 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Tm-000000024Br-3QZQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:27:51 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-359fea895b5so1045813a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376870; x=1774981670; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOUVvE5FNmjkaySdFPrc+7+hSpPNsoY2HaGuj8AkFfI=;
        b=F9ULGKOfw14I53yAHd1IczI5lX9NUd3EWMTlx8wfgtrekuMfZnE8Za7oFr12gwJD8G
         QBAkjqpTNZ8wQu9iSvNcDl8G6HVQdFSWpGasDLs894zw2MCVbFJW3jj3eXr/+EJzAmsY
         HkrCYgZOtDzIsk3ER5z4nFPRuGW+Id/AbuccjJNbaekjpDhsia72TAf3L1eQVp9mjU/g
         pziP3BVmEsExJiRkdhf4/t/oYz5cO7CKu+tdPSPVPVHvLE9kAQJ+vnj4/KK14VH5A3FT
         PO8DN21rn2d86bG1BB2gSwKtSczGBNbxuNpa/0YGAgv0cXz5oyWBKH7giJIx3YdXZ+6M
         +GVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376870; x=1774981670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOUVvE5FNmjkaySdFPrc+7+hSpPNsoY2HaGuj8AkFfI=;
        b=o3qXBo6K7l2Lt26hAm3pqkQSnT9UnT9wsnBAiLaPVrYUGVxJTv8TCJzk4j4a0PbH2T
         lftQYCmTQlewkar7SXvvEDXij0+zYHNi1eQHTURHaOtNEwm3zTudWeuHYBtkcvbm9vqg
         ytiniLx/NbyWDqFZwO5q8Y3w8vxY0MdAgaM6Xr9bC0zm2vO1tMBOWDYHH2Iey6nXersz
         J5Yv4rn5B93f9HdLBBLamkKpesiTTB75aDpQTLMr6wMPmOC7UOy3IAy/nGXcFIzZnwwp
         SKEKZaYDMhIJGTUObYANImOKZ7CNvaIKVip8Cl+R4i5jggGI7zb9CXyno2l6k443dJxn
         DSEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8pOZoFHzk7niff7pICZwL98e6sm4wx5PzujQLIF/U5FPPy8ZKt9pT1VyuhVcZj4q1qUZQ6Za4V6DWngaQpXzi@lists.infradead.org
X-Gm-Message-State: AOJu0YyEtrj8p9ZVc5YYdphWVNpPHYtMnekZBRnGo0f5/B4j6gbs/APK
	9jzR9C32XTXymkIjiNSrq+nZygkqDTPlzZCp+XDvBkbBtrNVo6Mg2iOV
X-Gm-Gg: ATEYQzwPOARI1EJAOHqokYu0MQpnOLDC2bArWUf+Ebes7q2pbJBJzMRHsrLk2wT57es
	G+ghVmYDGPkH2xM6FABJguQlFFrbCmPxxXTOB41qwxUhyQ2AGq91ZFJqDswjUOeJf77S/f1N2pG
	+FPeGrYl+oEkQiFmV4/XkqtT06ZlyLWSMcMLRE3UtH/LNFFwWbpvgt3QFWDgYc1kD/cXi4PhSh8
	s9tGFUdl3G4cU/uuqOqmUJ6c/RXwoJyfOKYK9IhIT2Vi//ro5Stx58Q6dVK5akQTI07pOh1vj/k
	l6G8IZ5KKLVSCrqCi8+bSa2h4S6SlFAqRB2RNNTLd7iRQD67pw7NwMW1TOewsN6AV/GCYpiEz7q
	cNuRX2aI2vxnXzFD2MXr4UE7for7MKk28R6uYU6gOYE4nxg26i9skqbX1nOXCu15z2i6H/G3XSa
	POz1CicJVIDFN5jhYalaQxuKdbly2rg9geo49c
X-Received: by 2002:a17:90b:1dcd:b0:35b:a656:a60a with SMTP id 98e67ed59e1d1-35c0dcf48dbmr341601a91.8.1774376869963;
        Tue, 24 Mar 2026 11:27:49 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:49 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:52 +0530
Subject: [PATCH 04/10] i2c: stm32f7: Replace dev_err() with dev_err_probe()
 in probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-4-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=6197;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=s9JDU7GcgsnDDFXsrCxagGOfCSdKXg3wGsXTsgZz2H0=;
 b=ah0pTzAjwcV8FwCOGin97Y4dMl89Nw1GTUGKElGrgDchfwSWIGhdZL4fJM5yOH/LB2Vze2ERu
 5pFUk9n36AADxerpZp4V7L4H+yM/I6gEVGRW6UOTZNuNCinHlE0yV/c
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112750_870499_F8D87CB2 
X-CRM114-Status: GOOD (  14.58  )
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
 drivers/i2c/busses/i2c-stm32f7.c | 78 ++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 70cb5822bf17..e7cc7f0fb56c 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -481,28 +481,22 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	int ret = 0;
 
 	specs = stm32f7_get_specs(setup->speed_freq);
-	if (specs == ERR_PTR(-EINVAL)) {
-		dev_err(i2c_dev->dev, "speed out of bound {%d}\n",
-			setup->speed_freq);
-		return -EINVAL;
-	}
+	if (specs == ERR_PTR(-EINVAL))
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "speed out of bound {%d}\n",
+				     setup->speed_freq);
 
 	if ((setup->rise_time > specs->rise_max) ||
-	    (setup->fall_time > specs->fall_max)) {
-		dev_err(i2c_dev->dev,
-			"timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
-			setup->rise_time, specs->rise_max,
-			setup->fall_time, specs->fall_max);
-		return -EINVAL;
-	}
+	    (setup->fall_time > specs->fall_max))
+		return dev_err_probe(i2c_dev->dev, -EINVAL,
+				     "timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
+				     setup->rise_time, specs->rise_max,
+				     setup->fall_time, specs->fall_max);
 
 	i2c_dev->dnf = DIV_ROUND_CLOSEST(i2c_dev->dnf_dt, i2cclk);
-	if (i2c_dev->dnf > STM32F7_I2C_DNF_MAX) {
-		dev_err(i2c_dev->dev,
-			"DNF out of bound %d/%d\n",
-			i2c_dev->dnf * i2cclk, STM32F7_I2C_DNF_MAX * i2cclk);
-		return -EINVAL;
-	}
+	if (i2c_dev->dnf > STM32F7_I2C_DNF_MAX)
+		return dev_err_probe(i2c_dev->dev, -EINVAL,
+				     "DNF out of bound %d/%d\n", i2c_dev->dnf * i2cclk,
+				     STM32F7_I2C_DNF_MAX * i2cclk);
 
 	/*  Analog and Digital Filters */
 	af_delay_min =
@@ -567,8 +561,7 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (list_empty(&solutions)) {
-		dev_err(i2c_dev->dev, "no Prescaler solution\n");
-		ret = -EPERM;
+		ret = dev_err_probe(i2c_dev->dev, -EPERM, "no Prescaler solution\n");
 		goto exit;
 	}
 
@@ -624,8 +617,7 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (!s) {
-		dev_err(i2c_dev->dev, "no solution at all\n");
-		ret = -EPERM;
+		ret = dev_err_probe(i2c_dev->dev, -EPERM, "no solution at all\n");
 		goto exit;
 	}
 
@@ -674,11 +666,9 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 
 	i2c_parse_fw_timings(i2c_dev->dev, t, false);
 
-	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
-		dev_err(i2c_dev->dev, "Invalid bus speed (%i>%i)\n",
-			t->bus_freq_hz, I2C_MAX_FAST_MODE_PLUS_FREQ);
-		return -EINVAL;
-	}
+	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "Invalid bus speed (%i>%i)\n",
+				     t->bus_freq_hz, I2C_MAX_FAST_MODE_PLUS_FREQ);
 
 	setup->speed_freq = t->bus_freq_hz;
 	i2c_dev->setup.rise_time = t->scl_rise_ns;
@@ -686,10 +676,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 	i2c_dev->dnf_dt = t->digital_filter_width_ns;
 	setup->clock_src = clk_get_rate(i2c_dev->clk);
 
-	if (!setup->clock_src) {
-		dev_err(i2c_dev->dev, "clock rate is 0\n");
-		return -EINVAL;
-	}
+	if (!setup->clock_src)
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "clock rate is 0\n");
 
 	if (!of_property_read_bool(i2c_dev->dev->of_node, "i2c-digital-filter"))
 		i2c_dev->dnf_dt = STM32F7_I2C_DNF_DEFAULT;
@@ -698,8 +686,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		ret = stm32f7_i2c_compute_timing(i2c_dev, setup,
 						 &i2c_dev->timing);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to compute I2C timings.\n");
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to compute I2C timings.\n");
 			if (setup->speed_freq <= I2C_MAX_STANDARD_MODE_FREQ)
 				break;
 			setup->speed_freq =
@@ -710,10 +698,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		}
 	} while (ret);
 
-	if (ret) {
-		dev_err(i2c_dev->dev, "Impossible to compute I2C timings.\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(i2c_dev->dev, ret, "Impossible to compute I2C timings.\n");
 
 	i2c_dev->analog_filter = of_property_read_bool(i2c_dev->dev->of_node,
 						       "i2c-analog-filter");
@@ -2175,10 +2161,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	setup = of_device_get_match_data(&pdev->dev);
-	if (!setup) {
-		dev_err(&pdev->dev, "Can't get device data\n");
-		return -ENODEV;
-	}
+	if (!setup)
+		return dev_err_probe(&pdev->dev, -ENODEV, "Can't get device data\n");
 	i2c_dev->setup = *setup;
 
 	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
@@ -2279,7 +2263,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 		ret = dev_pm_set_wake_irq(i2c_dev->dev, irq_event);
 		if (ret) {
-			dev_err(i2c_dev->dev, "Failed to set wake up irq\n");
+			dev_err_probe(i2c_dev->dev, ret, "Failed to set wake up irq\n");
 			goto clr_wakeup_capable;
 		}
 	}
@@ -2305,9 +2289,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->smbus_mode) {
 		ret = stm32f7_i2c_enable_smbus_host(i2c_dev);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to enable SMBus Host-Notify protocol (%d)\n",
-				ret);
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to enable SMBus Host-Notify protocol\n");
 			goto i2c_adapter_remove;
 		}
 	}
@@ -2315,9 +2298,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "smbus-alert")) {
 		ret = stm32f7_i2c_enable_smbus_alert(i2c_dev);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to enable SMBus alert protocol (%d)\n",
-				ret);
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to enable SMBus alert protocol\n");
 			goto i2c_disable_smbus_host;
 		}
 	}

-- 
2.43.0


