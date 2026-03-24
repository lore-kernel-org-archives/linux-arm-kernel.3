Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AD9FEC0F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jbYoDFFKwnOMKQiaSrjwW8IJ/VZkZBU3IOohjNwPSU=; b=Zcji2pENOxkFRdAWqczydpWubW
	GWWGI7+8NWC/F43U+Rl6sJrwfplmb4K/DlOw8yGn74E4kK5Unw6iRSazc5DB8LJinhLrG1KfqpCLr
	2ge7WkB3qihHMmA+kXzkIxBWNnvwmW6W3Er21noTU3wWCwOGJ79POtWMCMjNCIXCgFT9kkmWQuh/O
	Zprc4LsIY9mDJQoLjJzoYtj+CRHXLVGvwddtuqRI2Jz10bnBtboH23nMNPMribS4pYxQYJQuc+zys
	g7tSqRzR5MGVu4X2EGRw6nIz2He79jXfCCl09VOBYop/v01coBWwnLsnIqKpPvnJEAS/FHqa2ke8l
	aJ+g3zlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56UO-000000024Wj-4C4B;
	Tue, 24 Mar 2026 18:28:29 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56UL-000000024UY-0bJ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:28:28 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35b95e21ccaso84675a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376904; x=1774981704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jbYoDFFKwnOMKQiaSrjwW8IJ/VZkZBU3IOohjNwPSU=;
        b=eyQY5A2iJn1AzUwFLlEvbRVHhzejB1sc6qZd6ieNcgU3vsoVgpvk6uo3gQaZULAMtZ
         EFvHz2qtZ8ax0qhk+RKU4RM9E15Ra5gzRrWaZXZgx3eRTB+0TeiKeosoGuYuny8dtJmL
         dLIGzrLFrlRWAEbZRU7JmxnPA8X0kySJ1oafkLsUMhY6St9R5ae/Tao6h/+oAi9CWtV1
         5s3HWzX3WFydrZEb/54By0Ao3s6vmxcydbDtpMx8I9c9U2SyOfUQ20WCoeEXG+IEddWq
         2tbcd7kdmkVJXkukgqvmmWfUPBvqk26J5sAe+ESu8nzoyJ4UwiChZJpWpIlKCsFzvtPW
         Yo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376904; x=1774981704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7jbYoDFFKwnOMKQiaSrjwW8IJ/VZkZBU3IOohjNwPSU=;
        b=Dc6sLTisTDwXsDbTl50sBAmXfKybVjKjeTpbPwWyUSvpUKtt87adbgNfvLbAP95vuo
         hDkAHicB/OLK1vL6qeF8/cl3b/Eu4buld+9BQeBuLOdchQrzcBHL7t4vflozY6BqkYXs
         ujqBOBvoPQyY4DZXFM70/sqagT5ZtL47Dv+XUC1YE1FJqQbGiJw3vaRzUUXh865cCqbI
         B200vpSPAiJMrTrLY+W4Da6U+aTOgWvwaL58H3rD5spB68/u4wj2clscncI7r16DyXxr
         RSmUFC04QM29aSZ4JZMYhVOoEm8KODqIpgb5zNJ27HUr38cZrHz4sbbo2cxN4vY1s/JJ
         n5LA==
X-Forwarded-Encrypted: i=1; AJvYcCUO9lS+y1Q5p98bQ8BCH3d37jo0woGeaCpq+oIStvk6YtefMyaG73aHlYhjD7u/uVIzXUNFxeQ5RuUJbIApemm/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdr/xsRibx6DUWiF1JCXM/Xvpw8IirHqMU911LD9WsY1VleJqI
	XXKmvHRUtmgjoqaVHCVzNCpiFyRQSMgToBlksfpI/z7s/dIZtJJ4imMG
X-Gm-Gg: ATEYQzzz6djF+2EIzo23EdfYYpjCJFu7xmycVEGtgBqL9GNiGP4Z9vG57r9Rc+FrDuy
	sTqgvUaQeCyLBMWB15dICapam+n7rs55MkuF/WEKth02aqX1zwN3k+es+9KjJXlLLRft1UuNBmv
	UYw6wxgFMrYMveL0Fkgi9ojH9EvA6V+5GEt5ISZsRdNH39qS6D6Om9gg5rRMC2n17OciLUXpNrQ
	OVUuzJYuVa5lNBkS91HndI7vQYBV32Zqk6RCFL5uW1F4dfQVyrzdkTEkpUKWzoRBtYSxOSjUn2L
	y/+mLrgf5IMkj2KW0AId4YC0Y9BrlqJuMkToSy4CkGvHprd4acFeZM5mDsLSVZ1wbH95leIVMAp
	qfG0zbQVD1MORvNu0hexulOXKKk43/d1EXRNm2F78prXyR3mlSAA6Mx5mlj8oyMirwdMZiy8D27
	etWItsAjeooxjw1cttObYZDF4WAQ==
X-Received: by 2002:a17:90b:3c07:b0:35b:a0f0:8327 with SMTP id 98e67ed59e1d1-35c0d1001a9mr618620a91.2.1774376904310;
        Tue, 24 Mar 2026 11:28:24 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:23 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:55 +0530
Subject: [PATCH 07/10] i2c: st: Replace dev_err() with dev_err_probe() in
 probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-7-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2664;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=QTq/SsBBXUdzBzLen+lO5rBpYhODcjwD4XTKabWXWjM=;
 b=6uYv7INtZBtXz/5CGPPLnmZfr7dOa2FHZwl9/oOHXGn01WGXqmOPkElSojC2emL6vTKD8y1gU
 mA1lXC4EoXKCgHD1s/6elwyP7MOynX9ePlEaoKUiP69Jyq2pL/sIZCs
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112825_206352_3830393F 
X-CRM114-Status: GOOD (  12.25  )
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
 drivers/i2c/busses/i2c-st.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 751ea421caaf..3f89c2145741 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -775,17 +775,15 @@ static int st_i2c_of_get_deglitch(struct device_node *np,
 
 	ret = of_property_read_u32(np, "st,i2c-min-scl-pulse-width-us",
 			&i2c_dev->scl_min_width_us);
-	if ((ret == -ENODATA) || (ret == -EOVERFLOW)) {
-		dev_err(i2c_dev->dev, "st,i2c-min-scl-pulse-width-us invalid\n");
-		return ret;
-	}
+	if ((ret == -ENODATA) || (ret == -EOVERFLOW))
+		return dev_err_probe(i2c_dev->dev, ret,
+				     "st,i2c-min-scl-pulse-width-us invalid\n");
 
 	ret = of_property_read_u32(np, "st,i2c-min-sda-pulse-width-us",
 			&i2c_dev->sda_min_width_us);
-	if ((ret == -ENODATA) || (ret == -EOVERFLOW)) {
-		dev_err(i2c_dev->dev, "st,i2c-min-sda-pulse-width-us invalid\n");
-		return ret;
-	}
+	if ((ret == -ENODATA) || (ret == -EOVERFLOW))
+		return dev_err_probe(i2c_dev->dev, ret,
+				     "st,i2c-min-sda-pulse-width-us invalid\n");
 
 	return 0;
 }
@@ -808,16 +806,13 @@ static int st_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->base);
 
 	i2c_dev->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c_dev->irq) {
-		dev_err(&pdev->dev, "IRQ missing or invalid\n");
-		return -EINVAL;
-	}
+	if (!i2c_dev->irq)
+		return dev_err_probe(&pdev->dev, -EINVAL, "IRQ missing or invalid\n");
 
 	i2c_dev->clk = of_clk_get_by_name(np, "ssc");
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "Unable to request clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
+				     "Unable to request clock\n");
 
 	i2c_dev->mode = I2C_MODE_STANDARD;
 	ret = of_property_read_u32(np, "clock-frequency", &clk_rate);
@@ -829,10 +824,9 @@ static int st_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, i2c_dev->irq,
 			NULL, st_i2c_isr_thread,
 			IRQF_ONESHOT, pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request irq %i\n", i2c_dev->irq);
 
 	pinctrl_pm_select_default_state(i2c_dev->dev);
 	/* In case idle state available, select it */

-- 
2.43.0


