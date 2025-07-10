Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08303C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjELThxpzzAvI7EJgV2b+8qPZQoyQvdgHTrpH+0vcqA=; b=Lx9qZhIc/ycAIU8u0S8N0UmkEA
	KHWbc52gclfIFTg5gu9U6GaNW+HzMuQiMlUXaIvUaR4MwqdLiKvT9QK+4IXLpoCuQAxSIdysmJFCX
	/H/79pKrrdmI6S7dW4Xm7qWf6KiE48bRBk54Ci3gPRRgG0bLcuLGSqzkBehIf5CeNvVAAA2j7y8h/
	Fh3AovwslUInBEa7YAOVecVAM7+8m4wGGl2g3BzulRfflAPIRD+9R3ziW0ovN6FDNYv05DojgkhvC
	LiVVyvey2+qJu9nRf8V8sKFHgfSxpYOWWblcx60KvkMcG8gNhWZg9z132HNvmbfBVVkJq3TDB5ZTA
	cr1YYYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q3-0000000DPxO-0vDC;
	Fri, 11 Jul 2025 01:19:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYa-0000000D2MJ-44xX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjELThxpzzAvI7EJgV2b+8qPZQoyQvdgHTrpH+0vcqA=;
	b=ab067+wI9d3CQw91vRWjzrehwT2zyI6XNCRfH6IXpSlwIbphGJ2sWJJGDrxjnGrF054UuT
	xoIPHk2ncJb8h7x26O0TuoTGPufYBHPbntLGLNpBxPZ2PhTlpOBo/y6S7Z8EuUjpVyQw4A
	yv721LRJQLr0eR7pr9mxuthY4GQSCYU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-gugvT75DOEGx5Uay7lj-2w-1; Thu, 10 Jul 2025 17:11:51 -0400
X-MC-Unique: gugvT75DOEGx5Uay7lj-2w-1
X-Mimecast-MFC-AGG-ID: gugvT75DOEGx5Uay7lj-2w_1752181910
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-237f8d64263so12469145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181910; x=1752786710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjELThxpzzAvI7EJgV2b+8qPZQoyQvdgHTrpH+0vcqA=;
        b=EM9BgtckkV21j7UciONVRwHTD2N1tRYpVnpjqqozTf5hZ1EGnbr6v/Mfd7LMUx0ePb
         WIwxKrNT2E+PqEk0uM93LUEfSWA3P8febNqBG5Dsv0ht7q8/rT9L6c1x8fVvlHnWEKTp
         k0oirSZaPcByLIwHHjsEtXUjQB0Hgzli/eAR3YbbAMAuJHhgjJKqQNKnoazbjcy0F/rJ
         V/aWJbsBQL2gLoeZ0ZYJJtDppyRN5kg3JE8H4y/CzwHdJAsE7ArgLt7qknH573HweYCJ
         CegdHqUNkZ2HwS+Qov5t1M5G6rQlsRPFA1df255BWQqX/BY9wjjisbiw37KNEwRtex9X
         oCUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS2ypANSbafdy8RV+E5Qy1GZJGxYcdH+8SxyBrPcI/deDLwV6Q34nffi13N128Q6CB/Tju2+zbZu/f2sx9RCFs@lists.infradead.org
X-Gm-Message-State: AOJu0YwVDZQPcTrHW2NH5M43kKsLp1IceCNUHHMMssliLUyhVX2FgA1P
	kBBYc/skxJiLs2+Cn+XlMUoIFf1GWnJMxWStXeujM3wq3tahyiY40Z0TcpWhHs+dNSrbSPoEnSN
	r0yQW5Zhtq0zAP+ATuObGeVT9p7wQoQpN8CTQWmnKOkbCdj27t65M12M91vsLRhEusFCqixJKp1
	Tu
X-Gm-Gg: ASbGnct0zrsKvuVmihu3kqCjPyhPxTwGfCASmMdWjcslZZlaj9WvrPl3xF8iToivVXL
	R2vWJUohm+8LfXSBmXV88NYH1JlYHiFbPgIwFcngXWDhYou0E8Rlit3SVgGL2OjhNYTBKFhmsV4
	005YbgHgNphTJ9YMUJ19yF2SEp6Z8p09dzpbSC5ZsGxIDti5s8T7+3jL8+mtHYoljFpR3M8iahY
	bv7gnUgLLG28twmlrdYCwuBg9w7yv5XwZoxPFNwfcC9tj1oAvtrPbj4xhcC4/d14ccUBCHUYeoB
	zIba2NdcTUo9SIIgjjsRwhquDbPZlv6M772lHju2fMiU3Q==
X-Received: by 2002:a17:903:1ae3:b0:22c:3609:97ed with SMTP id d9443c01a7336-23dede890e9mr8286195ad.30.1752181909932;
        Thu, 10 Jul 2025 14:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECK3Rh9qQPkxPSM0R/QYf7bGscsWItQHb+tVdgkQkXMbgAQUKK5B8ZCSq9eX+Hd7XEABkBBA==
X-Received: by 2002:a17:903:1ae3:b0:22c:3609:97ed with SMTP id d9443c01a7336-23dede890e9mr8285715ad.30.1752181909173;
        Thu, 10 Jul 2025 14:11:49 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:48 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:41 -0400
Subject: [PATCH 09/13] clk: imx: pll14xx: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-9-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=2836;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=aywQz3CZ88oGIjl+zurv8EjAlYsjmJHyCtCGc5sgpww=;
 b=t0asgbTbAH8KoNuVVM39DzXSGvl//TC0qYGt737gsaK5wItf91xeznIgnO8ZL9Jjocs20L418
 bxN9ze5HEUKDU6gnMLUSNH3r8xYrx3TkODx4d9fg01mSEbjxDTrtl65
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yeFMUB9TtNsq1lkENd75YfeJAdId5PMfBbZMXXZMs2I_1752181910
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141153_084558_9B649A65 
X-CRM114-Status: GOOD (  15.85  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pll14xx.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index f290981ea13bdba3602af7aa44aaadfe0b78dcf9..36d0e80b55b80385a065808916187d6d4c30137c 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -216,8 +216,8 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 		 t->mdiv, t->kdiv);
 }
 
-static long clk_pll1416x_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
+static int clk_pll1416x_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
 	const struct imx_pll14xx_rate_table *rate_table = pll->rate_table;
@@ -225,22 +225,29 @@ static long clk_pll1416x_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	/* Assuming rate_table is in descending order */
 	for (i = 0; i < pll->rate_count; i++)
-		if (rate >= rate_table[i].rate)
-			return rate_table[i].rate;
+		if (req->rate >= rate_table[i].rate) {
+			req->rate = rate_table[i].rate;
+
+			return 0;
+		}
 
 	/* return minimum supported value */
-	return rate_table[pll->rate_count - 1].rate;
+	req->rate = rate_table[pll->rate_count - 1].rate;
+
+	return 0;
 }
 
-static long clk_pll1443x_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
+static int clk_pll1443x_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
 	struct imx_pll14xx_rate_table t;
 
-	imx_pll14xx_calc_settings(pll, rate, *prate, &t);
+	imx_pll14xx_calc_settings(pll, req->rate, req->best_parent_rate, &t);
+
+	req->rate = t.rate;
 
-	return t.rate;
+	return 0;
 }
 
 static unsigned long clk_pll14xx_recalc_rate(struct clk_hw *hw,
@@ -470,7 +477,7 @@ static const struct clk_ops clk_pll1416x_ops = {
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
 	.recalc_rate	= clk_pll14xx_recalc_rate,
-	.round_rate	= clk_pll1416x_round_rate,
+	.determine_rate = clk_pll1416x_determine_rate,
 	.set_rate	= clk_pll1416x_set_rate,
 };
 
@@ -483,7 +490,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
 	.recalc_rate	= clk_pll14xx_recalc_rate,
-	.round_rate	= clk_pll1443x_round_rate,
+	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
 };
 

-- 
2.50.0


