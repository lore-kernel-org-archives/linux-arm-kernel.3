Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B343FEC0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWQFrxeJ9xbwYy1VhHH7N7bPolG8RRVJqSZfUbUVPdk=; b=msw4zhcB3ZVlZjhnuOQhkvhUH0
	yw/UPN+gcXhc5WQubJF23u6wtaFudCacoYzEFWJiY1/DayxbGFu8pgqH4KCDEq0R/nlkEMjxJ2uYh
	faZnacAc+Q1he0cnKmddNNuYLmIpid6D9S6Pgq3hKpKkmuSWXWgOEZ4X+HG+xN35vVkqEbnCtr9vr
	XHUWmwabudNDbRjQDgNEORSWuRYSroNYJK2O0ScMHSfddmpbjr14zJZcfTFf/4dzZUowuS8vr45l+
	GxG+NRnzsAqAO5S0ROnF5sevKHmA6fCC+jCgEOW9sOBkTuaCpX6o/NFZJiaKiBNH3ZkGnb8lq2BJ9
	Iw40NgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56UZ-000000024c1-1O2f;
	Tue, 24 Mar 2026 18:28:39 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56UW-000000024Zr-2J5s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:28:38 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c7393c6832bso1899474a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376916; x=1774981716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWQFrxeJ9xbwYy1VhHH7N7bPolG8RRVJqSZfUbUVPdk=;
        b=oGeXDgas1SvElJdosi/7tvhpuTASYJSbnndoYI5r0tg9njoqNeygPa7w6CIneEydmC
         df1YdvD3x18z9Oh0ihfAZKLLlbnAKP6oxwnNsccN0cUB9DqEfiMFoHYyYdUqUMHR5kjr
         IqqwyzRIPZrOS3avmibd+ZUZkEZfzF2a2qo5Z3xrsdvab84sgVKNhCIwILZ03PI9R4NV
         5DkhMS4ZMgdfHX9TVQHb5IMLkto4uQaY2BgK33gJtyzQknRtBQAmBhDdrPIR1Z3bfMf0
         8Pge8Ho4SChCO7464SnIxc8djILSuvM6SAODIA3nc0YH2ZIzrYg/hp/n9l5oRx7DLYmt
         lLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376916; x=1774981716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pWQFrxeJ9xbwYy1VhHH7N7bPolG8RRVJqSZfUbUVPdk=;
        b=Xw7OPX7MTw+FwOBKeiBo1o7+33nlLW96ADQ2yoDC2SGBk6dI0VFsVWIgdOSU6XQMDy
         GfIUCs2pogz8XGJJdhhjjOwKkmhBwZ2VnroE9irOFUMTrGcIDE2LmF8mh3AhnQB+XM5d
         rsmytSWeTBh4InrVHHNwnknPoDczfXL9ZtHt9tMkiQf1O2GO/OlzURNssqbIPb+xP4mG
         NGJ/qatu5S3PNHAGPbA1r8iR1M2yXs5EWWexsBCHv6WLWZGqi95HFFWDJ1ZPosTvvLw+
         YKL6XyXedj0VLRh3hn0pv8vriDpQ8T7KydywsbS1Vah5/pNMG3cdyvbiXBfzdcSXcsfd
         HdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW//XKAHzBZLPehW8Bv8w3EnvqlIA0KRG0hFN/PMDet5BiKVsFTbCBwxdjnopT+j43Qvm/enWCPv9grsWS+YJhP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1rtB7i5H01foBsendlU8rt7/3Q/J5DJs11B9o2HOMDHx5CDZy
	dc3VdC4RZa2iqBp7DWVPBMVNjYT/KvrjSW7RwnG+LgZkktcpYWmVzZ2dJGLj5jIND/s=
X-Gm-Gg: ATEYQzyuQPaPPUYC9iWg0yuXxGZ9bjwiQ6pP06m2NvrXwKbsiPEMody6TxW3z66/EEx
	lh7tgqEytNSM7UiUhUVPusuzaO3RjfaLwbfq0i/B8rDXYNUS28PEPOp6vwNBOsXrmTaRId3BZXi
	kmm/nPc7hQmdgAPDIHJr67zCzOGVXya4GwqdJa7/yk+GGUzIagdL31BTUMYHO74pBBCAZu4HArZ
	r5d2MBoP/vQ58jDmqQA4SAKa1ngKchawPs24JJT2Cei4gyDvApHCYb0SOxxmPfRS1K7qT+ZeSh2
	hGpdpR7yl7VLUPwh0JUzhXBJE3tN2grc4sTyHYciD6yCjRx6lmImT9d8nI8IBvrtJ2Iv5xGssEO
	jADH/JjwGba1cbZ1z2bcvWVAB+jlt04L5cvRfyRHQ3SjKBSO9WDMLCJURWyymNmGQnvfmZk1NNa
	GpCOYMfWNUnnJSljHhwrNPyacW9A==
X-Received: by 2002:a17:90b:17c8:b0:35b:e555:f19 with SMTP id 98e67ed59e1d1-35c0ddc5abamr302415a91.25.1774376915602;
        Tue, 24 Mar 2026 11:28:35 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:35 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:56 +0530
Subject: [PATCH 08/10] i2c: sprd: Replace dev_err() with dev_err_probe() in
 probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-8-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1529;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=ASHKLgyhVdhgUS0PF+wcYp1muqF4w//oNCLBXZkcUHY=;
 b=hXROFYzb3OmT3cxRxEoFIuEeGuiZJd8xLM4x0yhyQx4WWK4SUYX6zSFRnwpUkd47L0bbPAvtp
 mE3F0pCOHTsA7C6xaX1n86n4DvW3PrzzB2RQAlr/W45yvtlvUvwnwXb
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112836_683494_8BE3405D 
X-CRM114-Status: GOOD (  12.33  )
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
 drivers/i2c/busses/i2c-sprd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 1b490525d8dd..7b321a956fca 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -469,11 +469,10 @@ static int sprd_i2c_clk_init(struct sprd_i2c *i2c_dev)
 		i2c_dev->adap.nr, i2c_dev->src_clk);
 
 	i2c_dev->clk = devm_clk_get(i2c_dev->dev, "enable");
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(i2c_dev->dev, "i2c%d can't get the enable clock\n",
-			i2c_dev->adap.nr);
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->clk),
+				     "i2c%d can't get the enable clock\n",
+				     i2c_dev->adap.nr);
 
 	return 0;
 }
@@ -548,13 +547,13 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 		IRQF_NO_SUSPEND | IRQF_ONESHOT,
 		pdev->name, i2c_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to request irq %d\n", i2c_dev->irq);
+		dev_err_probe(&pdev->dev, ret, "failed to request irq %d\n", i2c_dev->irq);
 		goto err_rpm_put;
 	}
 
 	ret = i2c_add_numbered_adapter(&i2c_dev->adap);
 	if (ret) {
-		dev_err(&pdev->dev, "add adapter failed\n");
+		dev_err_probe(&pdev->dev, ret, "add adapter failed\n");
 		goto err_rpm_put;
 	}
 

-- 
2.43.0


