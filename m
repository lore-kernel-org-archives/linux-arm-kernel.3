Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33428CA9ED6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEUI0qMUoX7WI41VkLWV4LHhhLkoSphEWPjNV+Kx3hQ=; b=E6KR8H8lKGSfkljaw9e7Bdx9G/
	q3C8533IMdccY1iMOEVjURtTVH7544IqRFy2oVW+8AwM9u9RsXyZClv3fMkTNiTpuw4wDO7JOg7PL
	63zuL3ee8BN5KUsspRf611XYEPKsWVaZV3ZHC4C6dLEbMXvdGmuy4noUwbY497djwkBudqs1b408S
	lwBP6IJSNahndrxqLzsUVMjQxeoozm+Lt4y5npQABx8C/n8rDnL9WywpBKfy9HV9qZDxjVMVrvE8d
	8chcOWcoxcSZpmk3LeZL8DWLophhu38LBwFSvFxSvEFXhUx0BzAhBnQInm1sTXD6zIXdYCtnefhs+
	bCrASAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9YR-00000009jUY-1YW3;
	Mon, 12 Oct 2026 06:30:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9YM-00000009jSy-4Ard
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:30:32 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2df982e04c1so7849985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 23:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786630; x=1792391430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEUI0qMUoX7WI41VkLWV4LHhhLkoSphEWPjNV+Kx3hQ=;
        b=HDr5xGclcGSEPGAfUl0CZreUMHwETKl61LARidE+IaytiBrfK1BkjtRp1Ux+ERaz2T
         Jut9qfvWLHfOtfr76qqUpQjpSciDZ+rW7tHM1LponSvsJX0Xjmy4AJS3I83wDdoTYyDs
         n5FFLGAEJ5CZfuy73g61TtHItVkaaKebbLM5OtmwEZ50wiIxSku/sDNvaG4f0j6Xq2dk
         8UNFD7C3hfFgXTMXxP1cHjs5Vj38qFQUk1/5CJe34xMx7SIKxoomfmy5XgrlN+vJYMlm
         NsfMwS0C2KEtYcwGnv1hYr/MUc5GM1TNmjOJeSNF6yOX8YGE9wgHO/esm9+4Um5AUCG2
         rrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786630; x=1792391430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEUI0qMUoX7WI41VkLWV4LHhhLkoSphEWPjNV+Kx3hQ=;
        b=Ka7v2yODlUo2mh7hfMtAwrvSx2qCTEprN82Y6PkPcHqiIAK3G7w+FSbq7qZi380n6w
         mWtw8VHEiY4qGMnU51ciwbZ/S9g5L5oEGlaE6oRup+nAZ4/DaUyuEAJ7A48CMP5+S6ic
         Nm1yCuf8PAZidcCW8obASFAzDYbCJ+W00NEEY9DK+76y4kuhhSmj7nwZVm5ZpBRCdo8N
         lLSk4Zx4yv1FOKci1T44PaJV2iLxnGAhGnvUcpec/8dK52ByjlpgTdGWCjrI6GmInXI6
         ijDuYnwkLjDz/RkdZwa/9YHuIbHAqxjIvMg8F2j89ys6KzMbtuUtsoyGlB+yHPzY++Jn
         Tv2Q==
X-Forwarded-Encrypted: i=1; AKwUvBybBp0WmBZRmwAodnQTbJPcNAKURMSjpC3bCdM+50OHSLq5ZtdPf0xDDXe4ogigj79N82MY00othQY+8S35G693@lists.infradead.org
X-Gm-Message-State: AFq9FYJF2xMUeiEFvHoEgfTg0V0GliLAEXWUJz5NeY01Fs2t5Oi5sLuM
	1bO/O+leEboRUfbtcPBKtWWq1yrPEe3ZqumL78H/zi88OBLYD+yEzmrV
X-Gm-Gg: AYBFou1mKXZs3gRLxSWVeW+6YoFxKuZ6Udb9f5p76oLb2kK1Py8QGr3FulVblKr+4bD
	4uebmUN/tui6Ijabj3nCzjx+bcUi4JN6kRpxgyPJfo+P9WAeMMa/vzMQZmzd4dSADyElJOblnMB
	heeMn+9FVyjqPe9Mp1bd2aEvHCFjvEzxD13baV/txr535FodtgW1tNUfT7XgK2WE9sTi8m6/I1j
	Ro9d6jR38vc7kQGMPkCBUw7Zcrdj3PENcBtpEAGE+oCERdlwEnBJ2oyuCf+qq7nmoGux9CcOesa
	iPOz9WnxHBi+SfWohHEuDzXb3BQt6Axgx6igT00uN32dKKY2qnPkl+Kav+lSZfYXrnh3Iu6jG+R
	vd7ei6D+LN0rEK3k5Y2sJCOO4FM/cbpt8Vc2DKgt40LbX7MBtMCV4TNdrbTLE37sGLYsgE/NEn6
	GcVhkXiRw++3e4KpdFF//atT2v2BnriVV25xaCcY+6IknSV7VNbf+bzUXxKPcuvDJ0E9NxaBh+w
	i9162yF3lEy4m7l1qOSus3ZaOxtP1EckEwQpPhRSLommCG67P5xPTizuF264f8C81KzYmmMh88=
X-Received: by 2002:a17:902:ebcd:b0:2e2:c773:a37 with SMTP id d9443c01a7336-2e842ab68c7mr74795165ad.16.1791786629963;
        Sun, 11 Oct 2026 23:30:29 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm39071745ad.66.2026.10.11.23.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:30:29 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	arnd@arndb.de,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 1/3] clk: nuvoton: ma35d1: fix parent lookup for clk_parent_data entries
Date: Mon, 12 Oct 2026 14:30:18 +0800
Message-ID: <20261012063020.3331443-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012063020.3331443-1-a0987203069@gmail.com>
References: <20261012063020.3331443-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_233031_285846_181B59EC 
X-CRM114-Status: GOOD (  12.49  )
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

The parent tables were converted to struct clk_parent_data with only
.fw_name set, for example { .fw_name = "hxt" }. The clock controller
node has a single "clocks" entry for the external crystal and no
"clock-names", so a firmware lookup by name can never succeed. The clk
core falls back to a global name lookup only when .name is set, so these
parents are never resolved.

As a result sysclk1_mux and everything below it (hclk*, pclk*, and the
peripheral dividers and gates) stay orphans with a rate of 0, and
clk_set_rate() on any of their consumers returns early without
programming the hardware.

Set .name as well as .fw_name on every entry so the lookup falls back to
the globally registered clock of that name. .fw_name is kept so the
tables still work if clock-names is ever added to the binding.

Fixes: f50a000b4219 ("clk: nuvoton: Use clk_parent_data instead of string for parent clock")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 260 +++++++++++++++----------------
 1 file changed, 130 insertions(+), 130 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 9f65d0623517a..09e6ceeb2c556 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -63,298 +63,298 @@ static DEFINE_SPINLOCK(ma35d1_lock);
 #define PLL_MODE_SS             2
 
 static const struct clk_parent_data ca35clk_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "capll", },
-	{ .fw_name = "ddrpll", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "capll", .name = "capll", },
+	{ .fw_name = "ddrpll", .name = "ddrpll", },
 };
 
 static const struct clk_parent_data sysclk0_sel_clks[] = {
-	{ .fw_name = "epll_div2", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "epll_div2", .name = "epll_div2", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data sysclk1_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data axiclk_sel_clks[] = {
-	{ .fw_name = "capll_div2", },
-	{ .fw_name = "capll_div4", },
+	{ .fw_name = "capll_div2", .name = "capll_div2", },
+	{ .fw_name = "capll_div4", .name = "capll_div4", },
 };
 
 static const struct clk_parent_data ccap_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "vpll", },
-	{ .fw_name = "apll", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "vpll", .name = "vpll", },
+	{ .fw_name = "apll", .name = "apll", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data sdh_sel_clks[] = {
-	{ .fw_name = "syspll", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "syspll", .name = "syspll", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data dcu_sel_clks[] = {
-	{ .fw_name = "epll_div2", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "epll_div2", .name = "epll_div2", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data gfx_sel_clks[] = {
-	{ .fw_name = "epll", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "epll", .name = "epll", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data dbg_sel_clks[] = {
-	{ .fw_name = "hirc", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "hirc", .name = "hirc", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data timer0_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk0", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer1_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk0", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer2_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk1", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer3_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk1", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer4_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk2", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer5_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk2", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer6_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk0", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer7_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk0", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer8_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk1", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer9_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk1", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer10_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk2", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer11_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk2", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data uart_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "sysclk1_div2", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "sysclk1_div2", .name = "sysclk1_div2", },
 };
 
 static const struct clk_parent_data wdt0_sel_clks[] = {
 	{ .index = -1, },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk3_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk3_div4096", .name = "pclk3_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data wdt1_sel_clks[] = {
 	{ .index = -1, },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk3_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk3_div4096", .name = "pclk3_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data wdt2_sel_clks[] = {
 	{ .index = -1, },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk4_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk4_div4096", .name = "pclk4_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data wwdt0_sel_clks[] = {
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "pclk3_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "pclk3_div4096", .name = "pclk3_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data wwdt1_sel_clks[] = {
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "pclk3_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "pclk3_div4096", .name = "pclk3_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data wwdt2_sel_clks[] = {
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "pclk4_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "pclk4_div4096", .name = "pclk4_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data spi0_sel_clks[] = {
-	{ .fw_name = "pclk1", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data spi1_sel_clks[] = {
-	{ .fw_name = "pclk2", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data spi2_sel_clks[] = {
-	{ .fw_name = "pclk1", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data spi3_sel_clks[] = {
-	{ .fw_name = "pclk2", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data qspi0_sel_clks[] = {
-	{ .fw_name = "pclk0", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data qspi1_sel_clks[] = {
-	{ .fw_name = "pclk0", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data i2s0_sel_clks[] = {
-	{ .fw_name = "apll", },
-	{ .fw_name = "sysclk1_div2", },
+	{ .fw_name = "apll", .name = "apll", },
+	{ .fw_name = "sysclk1_div2", .name = "sysclk1_div2", },
 };
 
 static const struct clk_parent_data i2s1_sel_clks[] = {
-	{ .fw_name = "apll", },
-	{ .fw_name = "sysclk1_div2", },
+	{ .fw_name = "apll", .name = "apll", },
+	{ .fw_name = "sysclk1_div2", .name = "sysclk1_div2", },
 };
 
 static const struct clk_parent_data can_sel_clks[] = {
-	{ .fw_name = "apll", },
-	{ .fw_name = "vpll", },
+	{ .fw_name = "apll", .name = "apll", },
+	{ .fw_name = "vpll", .name = "vpll", },
 };
 
 static const struct clk_parent_data cko_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "hirc", },
-	{ .fw_name = "lirc", },
-	{ .fw_name = "capll_div4", },
-	{ .fw_name = "syspll", },
-	{ .fw_name = "ddrpll", },
-	{ .fw_name = "epll_div2", },
-	{ .fw_name = "apll", },
-	{ .fw_name = "vpll", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "hirc", .name = "hirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
+	{ .fw_name = "capll_div4", .name = "capll_div4", },
+	{ .fw_name = "syspll", .name = "syspll", },
+	{ .fw_name = "ddrpll", .name = "ddrpll", },
+	{ .fw_name = "epll_div2", .name = "epll_div2", },
+	{ .fw_name = "apll", .name = "apll", },
+	{ .fw_name = "vpll", .name = "vpll", },
 };
 
 static const struct clk_parent_data smc_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "pclk4", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "pclk4", .name = "pclk4", },
 };
 
 static const struct clk_parent_data kpi_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
 };
 
 static const struct clk_div_table ip_div_table[] = {
-- 
2.43.0


