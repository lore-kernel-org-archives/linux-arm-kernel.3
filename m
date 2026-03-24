Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B84BFEC0F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Gsg2Xtdfdl+8IY6r0o/RyYDfTlBlRsSZJpA/oULFGs=; b=JRguJeD5ReYHH8bigjEtKMHN/8
	5qeKryxwbvliKE1I73edavouYVigtTD0kUhMP9PKrcCSSOtPRu+xCJRt/dnj+Ii9vZcQl0xW6S3hB
	bIU/SftWcW+8/8zxta8RK+10PNUbORM9+nOt3+41EViwLv9kFriXqmB8rqO+UnX5HGZ082ivWHy4t
	io3RXA9T5QZhWZM/J0SenfsH3P21tdGu/UZvtJ+XiPcP84J5bAHGFempee2CNQvn2jhSZbHpBbQYI
	KT7APBBWlZLghBTpx8r7Lei1wZ1MdYwzkwBGpGWxAIWLKZC4ITSYfkPpaRYEnm8vs55Ro6C63L1Db
	EShNxltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56TX-0000000245f-19A5;
	Tue, 24 Mar 2026 18:27:35 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56TU-0000000244V-3gs7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:27:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-35bb7afdc38so849219a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376852; x=1774981652; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Gsg2Xtdfdl+8IY6r0o/RyYDfTlBlRsSZJpA/oULFGs=;
        b=o8PoHKlbCr38GSzRsvEiGG+3DEg+UFrMd/JvB3xU5jogL90jxgEUiJGLfWKgKpa5PC
         wSGi6iI+TxmU/8aZno0l/lEnz7GA5ttIyMPA7HxCHC8DbnAz8xAg0mztfIvmEGTNBAl4
         HbFYRxhtVZ1oJdV1rS29Yx8Fa1uPe/QMh+FFHEvg3aTanR7N61NC8jTItk1ayL2OoB+8
         vCvJfdLjXXgVjo3OyTbrZivcxyMtRqUnYQ3uSXQYuX9ZLlHMMkfff8pQhIPFWmmo/b5o
         rS1GILDFiZmyqyp7FUMajtOVQW36IWjpb+W9YYKjAB0qCf5b4J9MUHN0m2imh0AOHHXv
         dwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376852; x=1774981652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Gsg2Xtdfdl+8IY6r0o/RyYDfTlBlRsSZJpA/oULFGs=;
        b=UKzbZabbYPSNwn5h4Fbn+9iogqZ1EIz2RNI/d9qvLc70SgnALftfT9Ldf7FeFrq8pT
         Jub45q5Eq8g+k77j7OZb/jCsPHuzx3IPVACFK8dOXV2XsjDzvby3yanQLJOhS4lb9Q3p
         wkqRL70vBn76SlEYgHknn5PuGN0I8pfSmPKsv/HuLdqb9p42TwMGdzfI692tYRybqV6/
         Y6kXI6hZHQp/hZ4H+Bu8zkckvTTivvDZ33pHGPQt7LWUBTRTz++zgfD7Rbkxl9AGJTM7
         4p12Z75uLWNTZIJu/H3oSo8tfgxA9QGC/rPBxzl3NfJpkvgEr9s0Sw3Vqb6S5Z/hoPzR
         Yajg==
X-Forwarded-Encrypted: i=1; AJvYcCXU47ROuJ802hMHAwfM0Ip8hFqsCrHgFko7v0Da69Iu+oXGee29+YgaH/4zMGPzSydx+0rLJAxqR2lsZbilF11s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8GP3Vy8u1JWPeQhj4JmxzsBHJPfxr/C+ONGNWMzNz0DFzMHEQ
	RrnE50bgxBItetpz+9HhlCPEZ4TXbOrIVO8K/n4ash8Z+o8jsApcBKj6
X-Gm-Gg: ATEYQzxc1Pfl7hLKBtjpepIDPMmdRYeTuOaJgECOVjSNWXxxW6PpSTv77fVJNeqCMyy
	LpddXxEEW9EdMdv1q+Sw1vlmQV8cQA6vD8YfLVdszQtJwCcamr+t5oDq+RaSEGFID0ls/Mu21cg
	Z5Z4ZLFAT6pQfQUabEViTZJlSpPir468zy3OhQ1JJugN6WA+ETrikfzfJCEnXOiVsYHDFuPFAxD
	TWMV3NOvR0tTTl33WzGq7RBsGxjGJfktDbob3WDT87cdbAssGZf9rTNJ0YHo+px0nbi37yMWCuW
	pmgoLFmYVLdH862zQk1hSGMw+b6MTFH3gSktzHsS2gdkttaL5ZgXAvjY5Lru8Wkr8qlQ/fj7kPD
	1iVSC5MTUjFtCa6zqtzh2DbQAZCbvAeES35WQyfchGc+Z4Ec05p1BD3f1ftvSZNxVcQ8fxQ7EUW
	qjLuXkaOli9pbvXeH05rAB8pqTLWxssZ8E5HCZ
X-Received: by 2002:a17:90b:17c8:b0:35b:e591:99d1 with SMTP id 98e67ed59e1d1-35c0ddc4118mr351953a91.29.1774376851910;
        Tue, 24 Mar 2026 11:27:31 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:31 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:50 +0530
Subject: [PATCH 02/10] i2c: tegra: Replace dev_err() with dev_err_probe()
 in probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-2-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1910;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=T//TFybKN0iS3J929ONSQMLq+NVtMUv+4U4PajSEtpE=;
 b=fr2E/ILXide+l6/sGLPzjFEjto2BGT6qqnz9x0FPbuW7SDMBkCcBooGAF0nF3tgg5wQpoDzh0
 nAnDJBBoQYcAomrkw15oBfCFd8unXKN1lYuv+oiXhwJuhidayGEmEVJ
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112732_931636_838FB1D7 
X-CRM114-Status: GOOD (  11.89  )
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
 drivers/i2c/busses/i2c-tegra.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bec619b9af4e..51d15fca82fc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -575,8 +575,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_buf = dma_alloc_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
-		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
-		err = -ENOMEM;
+		err = dev_err_probe(i2c_dev->dev, -ENOMEM,
+				    "failed to allocate DMA buffer\n");
 		goto err_out;
 	}
 
@@ -588,8 +588,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 err_out:
 	tegra_i2c_release_dma(i2c_dev);
 	if (err != -EPROBE_DEFER) {
-		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
-		dev_err(i2c_dev->dev, "falling back to PIO\n");
+		dev_err_probe(i2c_dev->dev, err,
+			      "cannot use DMA, falling back to PIO\n");
 		return 0;
 	}
 
@@ -1953,7 +1953,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 
 	err = clk_enable(i2c_dev->div_clk);
 	if (err) {
-		dev_err(i2c_dev->dev, "failed to enable div-clk: %d\n", err);
+		dev_err_probe(i2c_dev->dev, err, "failed to enable div-clk\n");
 		goto unprepare_clocks;
 	}
 
@@ -1979,7 +1979,7 @@ static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0)
-		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
+		dev_err_probe(i2c_dev->dev, ret, "runtime resume failed\n");
 	else
 		ret = tegra_i2c_init(i2c_dev);
 

-- 
2.43.0


