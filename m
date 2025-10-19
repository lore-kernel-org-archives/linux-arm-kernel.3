Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F08BCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rfk3Iz74iG04i8jgiAEKJ+IUy9T7n6c85dOHEZsHbEw=; b=4UdJUIRYynSQfbLGBOvK9MbgmR
	r/fO8mVGmHw4Ylug003nqASZVwL/VAYnfY0JyZnagUEqT8+T4JUFXMF+DhOU4Pw9RgcB+mVgt1Ztf
	h4WXNbDN2MvUAsePiyfrDjUCD6pxUN52B3ABRjqR6Rhszk02MHUQKhCUTVyglctLe9uWKKoJuWXFV
	sZjlSF5PkGDBwTgS0Y0OE0BwdLAl/POV6hgqC69O3rukCzKzHJbCovv5ufiSKdJMD6wz0dZiRqTLv
	xsR+T+Gn6JCTPEtWosMqXJmrtO/DoytLp1SaW3aao9dNu1XbZLXY8BNA1oaMMO8BZz0f/MIORdhWk
	iJJsxICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAXBI-0000000BFmR-4BJo;
	Sun, 19 Oct 2025 17:26:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAXBG-0000000BFlf-2E7e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 17:26:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-471193a9d9eso29840435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760894812; x=1761499612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rfk3Iz74iG04i8jgiAEKJ+IUy9T7n6c85dOHEZsHbEw=;
        b=awWxzAS31wrgmkbW0o7by1agU8JB4J8WkL6zKu6lvrBOFuyRhZe5+Cfui0DhTf/WdO
         /XbiIrzI1he3w2MhrrcxO/r5nOpL1febu7J3z9EtuvkeX2XPHygENQKyFPHJIpfJBwz2
         q97SpaLQ5m7BZLtgZsmfWKAAeAm6Imtv5DibDAn8JFcOBDxAz1Z4rRSFsd1y+SvK9Bmh
         vdzmrUlAO9/p73kMfi8zhgl/zAl+DjCvh4SY/cr8i4nuCKLKnpGNXyWW5y0xrU1if8VT
         tY1lyN91K83tC1/ILQGHTpMHOtW0xNUu+sY8bFqsPCjAWhGepc7cI3rxulhrx0qdbTQb
         pulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760894812; x=1761499612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfk3Iz74iG04i8jgiAEKJ+IUy9T7n6c85dOHEZsHbEw=;
        b=eeujs69tqvQp4g89aWYzANPK6kJeS7Td2TPrVBtBSYSRUjJ67gjqbcDpxphMEwyvaA
         89Fe2yOphyJZQMJot1QiXIO1Xfe/JSXZo+EfOeDU/LOHMyiuW7UA947lrcGEsMv0Nsve
         mE5nyOwrKZj6VeDIcQLOBdD/AxvBVya2Bra31z/mU0crWf66LblM+8WC+0nm7Hd0ojw4
         jA3VrkKZEm9J8LlftiS2y/Gwfqv6IhCiZ9CSqCX317AupFrdNBHoIVibjDE0WGV3dl5v
         2OB7Dl5hVjd7baVLbiXvEfXAq/VB5suQYKkcQB9gkr2jlhMx1PliKiZ7ew/ZptX8U7Qq
         oXNg==
X-Forwarded-Encrypted: i=1; AJvYcCUNV4Slleo2RD5OqY4I2nrQSCD8TEQla2pJAYdgWAC+92tqCbNAbXJJXlxAVoJisCQmNP5buae4bG2ESeF19Jzx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyro8VL0Ok3k4EqOp2UUNCXONg0Cg35DEd4RXc/+uGqxcH1d4rc
	1WND/6PenxpR2WiigA3ShjPXuMHzkqhjjKlGlUSuaZsu8xlOOzMA1DjY
X-Gm-Gg: ASbGnctHRmF8kl/PQW2/3GKC5acKBBCenPtRDdah77AcfqdP7zIWNuH4WPp5xCQ8nVR
	uxSxbjb8FqoqEBIQg2LcLJVeYtHj7+bV6casUYmQxrEIYHBI17CqbpwVfkz+cCzgDnnEUqjc9M1
	U9BUG3tqqKnsCZoQf7ywc0Gv+LiRa0fVKLstm26fjkPN9Up/urzoxxZCH8jTLGjIvg3bPRjb10B
	YYf2jWO6Vmy4xXm33UMJRSfKPLT9o1XoSHDyyjcZ0B41389TwgTexWye6FCjL9pZirkpRzuKjMc
	93N1orG3kqkRY+XnLQZKBAZb0pL8bBViX2boXC+7asS+YnS/nLSalBTngDVwZqGyqWRaeqZYqSb
	VOZlPvLKq/yhyeXlSppSIKi/kBheTV0DAUTZhJxLsaPWWe9bjHzrIayM+QZZKBnbH9hBrMKmMhH
	HFA2Fj60MIRi88oYg/jSG4z3xu7Sb+NuS4MRSJ5EXXiKpUjiQjSG0prFt+T7BelWBbcJSrFW9C/
	HVP
X-Google-Smtp-Source: AGHT+IEPw1kFE6Cr0CGLWoQL6JabKMRRHciBsQ11hcnzheTmiOhMaQJbH3sEDwu47c9YBtVmkqG8uQ==
X-Received: by 2002:a05:600c:3b8d:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-471179174cfmr75189675e9.27.1760894812237;
        Sun, 19 Oct 2025 10:26:52 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d916sm101069715e9.4.2025.10.19.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:26:51 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical
Date: Sun, 19 Oct 2025 19:26:47 +0200
Message-ID: <20251019172647.80379-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_102654_578158_6BE14B94 
X-CRM114-Status: GOOD (  11.87  )
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

bus-r-cpucfg clock is important for peripheral which takes care for
powering CPU cores on and off. Since this operation is done by firmware
(TF-A), mark is as critical. That way Linux won't interfere with that
clock.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index 70ce0ca0cb7d..c5b0d4a2e397 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -125,7 +125,7 @@ static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
 static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
 			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
-			 &r_apb0_clk.common.hw, 0x22c, BIT(0), 0);
+			 &r_apb0_clk.common.hw, 0x22c, BIT(0), CLK_IS_CRITICAL);
 
 static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
 	&r_ahb_clk.common,
-- 
2.51.1.dirty


