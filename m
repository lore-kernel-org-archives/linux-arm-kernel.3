Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448EAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 07:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIxbJ2OQHNBv+4wB0JZ4sOT/J/UNSOHviGNvJzFTzY0=; b=0bpDLgFwrWpSvejNWenZsMtAyb
	tM49z0/AHnEVUAFfsn1OzB7sxoqLD1Byf/Ttd+TEBfQo0Nu2rqUz/tmhiSeFoLlUC2nzQaQDVEcIL
	OPjPcxnxR+N7KjnjkJog52Bt2je9zp/OGgEmFhbbbyr4BJ/eP1OPRwzVBhaA2yCaeQCcFglSDq1rp
	RhiJTYn9CuuVjEsIalr0HFvnalB4pPK+prud6W4XO71PhRcinbq6l0GNC3PxXFKsoD9nCa4QMbezw
	+QrM5mHhXd2rcdUajpi8k+RljeCVmhKhQnbnaOg1waos2lnjZuttXRpupq8IxIvrD8kU3jxYFmzfN
	Ch5Ir18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTyro-0000000Efhj-1sBy;
	Sat, 04 Jan 2025 07:46:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTym8-0000000EezR-0jzI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 07:40:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-216728b1836so162350415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 23:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976447; x=1736581247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIxbJ2OQHNBv+4wB0JZ4sOT/J/UNSOHviGNvJzFTzY0=;
        b=PwBB4SLyPM9LXEHdoX3Z1MhSPCHWOYmrhz0iAgigtYamkdIixQGYzeyKvo+DI1Ealu
         cHCTXPKR7CcA0lxlWazazD5GzPDgPFDNkqsJQR2lijv52YVHtgmnagdRONUYU7IvRsvg
         QkSxB24ROAJ6lPSP2SmW1ogd2ZmHz/UlPGBCLVyF/KFM8s7lvX7SjtxgZYNFJiT7VPIo
         ibcnw5RrwYU5Jf5nOH6rrZiBEDCloRdLSLXvuI+d7x+4bIHrozcEXp2FiPXR5yyLvlUO
         SpGRCH2JexFNfqdqkQHVmMfKIrctsQkKLJNXrG9hAIrA8OTOjtKIbTNS+F6sBaAvZMA/
         m19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976447; x=1736581247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIxbJ2OQHNBv+4wB0JZ4sOT/J/UNSOHviGNvJzFTzY0=;
        b=JldCVtf4/LGZ0cy/3fGnTC9MvX2FD9GZhW0GBDbLn1Yp6UvPPONvJCTZD91k/TNcz1
         E/e9C5k3XcGGM7qZV+o9qgBfAF4kbGHUBAUh50a4RTg9FKBx3VrTxzLhwL1mvwN2tRYE
         4GcrCEP8HvnKYEVKp/m8biHePbgr6AN32EV+5rh9PlFakDQdXLfHLToFv0l/t3rsMRoV
         p6945ghKJrAxSn9Uod6qROupZVCvt3KQQ84oherQAj7+Vk3f8on36XxTlkGuW6G5O+aM
         JHntnbz8LYehbXf1c0PJDzHxAUrNRlzGLitJnw2zHpdIz0ZL9BhsTno4ir7frUvbbvVf
         Qc1w==
X-Forwarded-Encrypted: i=1; AJvYcCWgfu4vKhaYkdqMBpAbGg5sj8yNIGrGBEILDBtczfUWsMd7zZe5XeGPlhWI59x+NdYBxOpPCCKbbMQ+PxUEdlNG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy92PGLD0hshc428c3pGALFDmEgYci2MsnWLsTfUFWcHZKAnl0a
	6H4qc/K5iLvoY1pdPhY3EAtcTIKul0E8JclZroqy3F0Q4SY7B8lp
X-Gm-Gg: ASbGncvhTIGXasBJxQCVVkUqeJxYCAeyCq01n1VFj1iWg2IgTOrWHYnf7M40su8SutD
	jOUSD6VpXS0Gu8amV1QlrlwI6CI2tMdsBb9Wl2savTWgjUygKmm9FcXcJUYECgGlAs54+vd/M0V
	ievaChsWXSLnQTee9043VkM2IxnNSmAPpOHx2L0diz1foUYdS2nnQl5dBSlVqrBNKYQKC17TP6B
	7QXA2SrzAOioKnIRF4wPIUxrgvyWMQuLlVg8VrhJxyfCpfXCg==
X-Google-Smtp-Source: AGHT+IGzouKoKcczOFE/BlEmlBfzMQU1FzvtTcHjF3vHVcWHcn0aI0SCAElSuL8sd9OBoHBrGue/Jg==
X-Received: by 2002:a17:903:2449:b0:218:a43c:571e with SMTP id d9443c01a7336-219e6ebd140mr793188505ad.28.1735976447244;
        Fri, 03 Jan 2025 23:40:47 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:46 -0800 (PST)
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Stuart Gathman <stuart@gathman.org>
Subject: [PATCH v2 4/4] clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
Date: Fri,  3 Jan 2025 23:37:00 -0800
Message-ID: <20250104074035.1611136-5-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_234048_213051_FC7A45B4 
X-CRM114-Status: GOOD (  15.80  )
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

Stop force-selecting PLL-MIPI as TCON0 parent, since it breaks video
output on Pinebook that uses RGB to eDP bridge.

Partially revert commit ca1170b69968 ("clk: sunxi-ng: a64: force
select PLL_MIPI in TCON0 mux"), while still leaving
CLK_SET_RATE_NO_REPARENT flag set, since we do not want the clock to
be reparented.

The issue is that apparently different TCON0 outputs require a different
clock, or the mux might be selecting the output type.

I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
to the same clock rate and flipped the switch with devmem. Experiment
clearly showed that whenever PLL_MIPI is selected as TCON0 clock parent,
the video output stops working.

Therefore, TCON0 clock parent corresponding to the output type must be
assigned in the device tree.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 3a7d61c81667..ba1ad267f123 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -535,11 +535,11 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
 				 CLK_SET_RATE_PARENT);
 
 /*
- * DSI output seems to work only when PLL_MIPI selected. Set it and prevent
- * the mux from reparenting.
+ * Experiments showed that RGB output requires pll-video0-2x, while DSI
+ * requires pll-mipi. It will not work with incorrect clock, the screen will
+ * be blank.
+ * sun50i-a64.dtsi assigns pll-mipi as TCON0 parent by default
  */
-#define SUN50I_A64_TCON0_CLK_REG	0x118
-
 static const char * const tcon0_parents[] = { "pll-mipi", "pll-video0-2x" };
 static const u8 tcon0_table[] = { 0, 2, };
 static SUNXI_CCU_MUX_TABLE_WITH_GATE_CLOSEST(tcon0_clk, "tcon0", tcon0_parents,
@@ -959,11 +959,6 @@ static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 
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


