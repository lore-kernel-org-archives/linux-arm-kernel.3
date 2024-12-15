Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66E3E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 05:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKFdza2xHFDC8vmuSIt7kUvA8GVJhpwFBfkUic7sJXg=; b=h+brlioR1Eyp5utHjbuV2ygw2S
	oEdCYz5x0y7hApUiShUXbSv4w4wBj87od5vXzsvXG/a593ud3uUC84V4X4Yo60KHtFLvjGRGKAzJ6
	R2MNQ7dzuNVa+EtCRs/hpmUgmpnshyID9BGdX2RmKaCKYZob0IOqU/skJBW2BX5v+yS2E2uBawx8Z
	O5UvBZhrIGSPtw0WDchbrnRV/99UFj3MxBqmlGB/V90Q/NKJ3DyuRLE8UvuMevIc2XYEo0c/0e8g6
	J6YEgJ39+Fi1MJgWJRfktiIudHMvQkWoog7COCLOgT94n8ey4vMZ9X85BV1++0QFf27vYkk8KlL4j
	XnqPVZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMhNY-00000007SG9-32GS;
	Sun, 15 Dec 2024 05:41:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMhJO-00000007Rjk-0C9k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 05:37:03 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2166022c5caso23703605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 21:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734241021; x=1734845821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKFdza2xHFDC8vmuSIt7kUvA8GVJhpwFBfkUic7sJXg=;
        b=CmE4cLUxPy5Sb3v3oHly1wutpC19nUjmLTJp5KH63NHqhTKmmpguB0LDA6OTeEOYK4
         pbJvyhfuQRgiGMLgiWAxE3Rg+VtJsJi1TXoMwf8ZibKorRNrhJtIBbQ55bFhkrLxhrSG
         BqevO+lPJDvztb/N5MKq//9h2bxO+mlmJ+KQE6dQJxof9fyDLd5iPeApoXTyh6ypzNW6
         QtODCNUHsj0uIl6qfEDoFcqF8TlL7tTU2033VmBDGHNygesiueQhZ/dj+egftQsE7hw5
         4kxGu7a2eqb3wEJ+cX9ksvOlftTJMqUIsuWJ/ElIvU+G+i7EqX2oBJnusnKQ3B4hvqJk
         reoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734241021; x=1734845821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKFdza2xHFDC8vmuSIt7kUvA8GVJhpwFBfkUic7sJXg=;
        b=tcfdYFv+CC9zcC/5Tq7CTV3QalVzEUq2fOepaEmmipGnzSpXg4WI52t6Fkm79GHd8a
         ujdZgdCeGDxuOCRSqRvrgSHjKX26ADnvi6AXSL6Scs0IVL8aK48n1y2h5YG8WZsaKfb1
         20pLIVXIVxriAg5NQbokbajzWkSYwdW9c9gdcRGswMvw5Z1VKdWUFVb4Y7GD6F7mkygI
         BnZHPW+8DRzMiddB0tUJ/D5Z4F8gAIlgmU4yeF+n/IkCaFdBFCbCN363QeTJ88CqQbVI
         yQBsDbJPrR8Nx3Ri+W0+x8ZOys4pAv8hNA4TeJb0KGbNtZy2c4rcLcJOfVpQ0ikoSJG3
         dmRw==
X-Forwarded-Encrypted: i=1; AJvYcCVx8KiE45sEvu3tEtUl2rUFQepoefYNmHkItMdxlPnFDtfgbBhX/1PBbVT/dD0IrMqQfPlVLYwEAXHhe6K1NMBK@lists.infradead.org
X-Gm-Message-State: AOJu0YyRB3ELEFEWCxfrXYuBMf4YfyJPWOpS87hutWknucpku8sxi5hJ
	feKcbAXLx7XvO8t3Cw5zvmuXCs5K0n8nh1ShlRGE+D8xkvJriQti
X-Gm-Gg: ASbGncsQcMGWG8e9bL08LN7ZokPzCoVdV1JEqE3IAE//++R43BZXqB/AIJ4zZfnTgSE
	qjkLzfWASrttfFheE0rl/SSwfGg7l4JSpXIcJ/djBYpxULdNGUmIpvruue9Ex12Qnkw+Rg/OPPP
	NIjkBeW+c+kCX87tJucVBJ1qwE/0jKQswNOQkVUFm/d28c2u/8E4SSYohtzk4uPXAwmahk4dMZO
	uC+cOeTJp4BZFMk5+67wM+pFoP8Usxj4aIjxmlP9xIHh/dPjg==
X-Google-Smtp-Source: AGHT+IEEzrDO6PorFmWAnRKn8AWTVLTL53SlxdJAzLW6ec4NvsVjzDB2vdV68Sh9tldHOdGI/Sk3FA==
X-Received: by 2002:a17:903:c10:b0:215:7b7b:5cc9 with SMTP id d9443c01a7336-218929f0ea8mr107798965ad.22.1734241021173;
        Sat, 14 Dec 2024 21:37:01 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fa1cf8sm5729803a91.38.2024.12.14.21.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 21:37:00 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 3/3] clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
Date: Sat, 14 Dec 2024 21:34:59 -0800
Message-ID: <20241215053639.738890-4-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215053639.738890-1-anarsoul@gmail.com>
References: <20241215053639.738890-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_213702_146883_83BAB3DF 
X-CRM114-Status: GOOD (  12.83  )
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

Force selecting PLL-MIPI as TCON0 parent breaks video output on Pinebook
that uses RGB to eDP bridge.

TCON0 clock parent will be selected in the device tree instead.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 3a7d61c81667..cc8de0bfbc67 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -534,12 +534,6 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
 				 0x104, 0, 4, 24, 3, BIT(31),
 				 CLK_SET_RATE_PARENT);
 
-/*
- * DSI output seems to work only when PLL_MIPI selected. Set it and prevent
- * the mux from reparenting.
- */
-#define SUN50I_A64_TCON0_CLK_REG	0x118
-
 static const char * const tcon0_parents[] = { "pll-mipi", "pll-video0-2x" };
 static const u8 tcon0_table[] = { 0, 2, };
 static SUNXI_CCU_MUX_TABLE_WITH_GATE_CLOSEST(tcon0_clk, "tcon0", tcon0_parents,
@@ -959,11 +953,6 @@ static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 
 	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
 
-	/* Set PLL MIPI as parent for TCON0 */
-	val = readl(reg + SUN50I_A64_TCON0_CLK_REG);
-	val &= ~GENMASK(26, 24);
-	writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
-
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_desc);
 	if (ret)
 		return ret;
-- 
2.47.1


