Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA71C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCUkHqw4OIJFHYNlmvSZg7Gb7N9mp6WEkDCfyaw9PXU=; b=Y41Sj9u0nmPGouJC/XFXn2qXn8
	tJJ9WCUg1dW3TRS/U3nbXraPoavd1iizKDWfWji2w1kT6+Rm+IDb/q9oLRNuC4Spm4zn/SeGMN26h
	x40OyMNQR6Obf9daJFME6LC+pI3j/g5tpfYj1kXH3wHepcSCkrXzskV/NbNJaZFkamN0zaiESuJ9b
	NwMGMB54YaJV8o/9jWUoePfaA8GODEwlHqJSXrbOuhtGAmeTCcp+LqRZ2lPbo6OaHMFBVKzgKR8gz
	LywjIN0Aytmq5W54K8NwB3Cc3kBLYQMhUIeAiJPODdaqipqnGpJNrfxxLIbAA4W6GRYYyswg+R/Yc
	zuAC5mGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHp-0000000Cyp1-1PsE;
	Thu, 10 Jul 2025 20:54:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvJ7-0000000CcNk-3D2n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCUkHqw4OIJFHYNlmvSZg7Gb7N9mp6WEkDCfyaw9PXU=;
	b=cEL+o2GFPjSU87WtwnFzinWgOjtIJSCYPguBb9H2Dr6e92yTzZAqv3JAUZMXfJZCBxnt5I
	dxxIDd/si8xY0jC+DP9gtKCn3Pc6jRRZemCLjjkuVxqG9mnvevxFR4uUkRNaBMUpacGlo7
	uqTvfLN7Irv+DzZqW4K4kl8LQG59V74=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-Xt3EoabsOxyZYTm1kcaRtQ-1; Thu, 10 Jul 2025 13:43:40 -0400
X-MC-Unique: Xt3EoabsOxyZYTm1kcaRtQ-1
X-Mimecast-MFC-AGG-ID: Xt3EoabsOxyZYTm1kcaRtQ_1752169419
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb3bb94b5cso19707636d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 10:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169419; x=1752774219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCUkHqw4OIJFHYNlmvSZg7Gb7N9mp6WEkDCfyaw9PXU=;
        b=r3XVLWWps+k3NMeRG0jn+93Hkd2+Z0747OgF0g6Xggnnz95PH9AkCg1lqJGHWqmFna
         18G2+3sFxEwoIuDd/wR+NXbE1HyrLADVlqJ0ESSP+dA9epXPuxh5el4RMwL4X2/Uyyh+
         3aZKTdO6y1V4guLgpcGBGaSlolGtQqySFiD7KCqtDCzBbL6KWxgA+vq50KJcvOZjD//2
         kKgEAnJL1XW/cs8UgOKniAK61+tc+ykd9ABiVqBHJogJXyDImCkLkr9ihxq2qwt4a/9I
         bq+Gn5jN84XiMZyPdU+ZsKx9W5Y6tupF3WrbhkokLy4hAKPiGkAQyNxY1SSdQlV+i6VP
         YolQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9PiL0br+VntDK9Qzr+YG5XWreKULyl87G5AwU5tQEZ0uVrGuHUeD4Qwx6GV8GZw2pvgZgDgBZDLBTAwWImQBr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3sXhQ2iCmhhI/tGUOPqk1WaKp2UR1R69bwhkdSNaBhxLUM6+0
	q/b6AN255SEm7PH8jO1eSF4ny5fUFfEzxXU8MM0+OBE0rKqpr+DjljfLSeyk5dQBUnY39faf3b8
	WOoOQdqQu2Kb6pYWfmFmf3f322e355Q7UmS/vETA+EmGQLnAf312g7FUPikPNCDr/1V2l96J6eq
	YJ
X-Gm-Gg: ASbGncuaOjbluddWZQ8NYf7/kJhKN7Yzc7XcNrIsxbK1iL1kHJsgAkAeS7F/O4/wBR6
	0/AXqXox+gDxfpi1K29BRgpGsnkqo89WYDpcvidMxhU8tZVrAw3Uqy8WW2Gedh/MQeHDI5hrUYf
	EbWVysUmDq1/efPx/0jYgTxDPdRPcb6iNNZF55KPa2SmV8PrFDMIaO8BrXfwlcyp74VVKGFTDn4
	dpcNufNRJA61ZPS3ZGKqhA6KcZnRayHbfT0D6c8t99IydA+C4aaDnrSh1M8ahhY4KZsMl/VsrYC
	CT+N/3P4X+04KVPm/JpnmkOdUSt0ZOsmpFHoT6/uqY8LL8Ghf9ODNyDCRGKB
X-Received: by 2002:a05:6214:5883:b0:6f2:c88a:50b2 with SMTP id 6a1803df08f44-704a354cf6bmr4069956d6.3.1752169419279;
        Thu, 10 Jul 2025 10:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHT9fVCmhXOEcnhqu3VFHhqJP8lRdJ7DzuHPSbjh7k32ODCAsPCUcL2Z7QyeRoPgckrF6a+A==
X-Received: by 2002:a05:6214:5883:b0:6f2:c88a:50b2 with SMTP id 6a1803df08f44-704a354cf6bmr4069566d6.3.1752169418934;
        Thu, 10 Jul 2025 10:43:38 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:08 -0400
Subject: [PATCH 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-7-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2097;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=QsQxnV5P1fb5ziwiaykq6XlQnnjBowQ0Qm5g74Jm8ZQ=;
 b=Ksw8mIL+2RRN/KI5dE4mx3sGUsPAEzJtg6FBiWBslMJaF5i+drzv8/2cRkcR9a0IBfQcYS2SG
 tVJ/WPvWyYACv81xH4ZsEZ5zwtnc4MB29saRvfEdAfzM+LmC3xps5M8
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z365-IniYUy-7w0Us4AglJ65BwlXz0rr0wk1A2Xdeb0_1752169419
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_104341_880825_C31F5B39 
X-CRM114-Status: GOOD (  14.28  )
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
 drivers/gpu/drm/stm/lvds.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 07788e8d3d8302a3951e97d64736b721033998d3..fe38c0984b2b552e1ccaef4d1e589b9d86a40ee3 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -682,8 +682,8 @@ static unsigned long lvds_pixel_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)lvds->pixel_clock_rate;
 }
 
-static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int lvds_pixel_clk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_lvds *lvds = container_of(hw, struct stm_lvds, lvds_ck_px);
 	unsigned int pll_in_khz, bdiv = 0, mdiv = 0, ndiv = 0;
@@ -703,7 +703,7 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	mode = list_first_entry(&connector->modes,
 				struct drm_display_mode, head);
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	if (lvds_is_dual_link(lvds->link_type))
 		multiplier = 2;
@@ -719,14 +719,16 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	lvds->pixel_clock_rate = (unsigned long)pll_get_clkout_khz(pll_in_khz, bdiv, mdiv, ndiv)
 					 * 1000 * multiplier / 7;
 
-	return lvds->pixel_clock_rate;
+	req->rate = lvds->pixel_clock_rate;
+
+	return 0;
 }
 
 static const struct clk_ops lvds_pixel_clk_ops = {
 	.enable = lvds_pixel_clk_enable,
 	.disable = lvds_pixel_clk_disable,
 	.recalc_rate = lvds_pixel_clk_recalc_rate,
-	.round_rate = lvds_pixel_clk_round_rate,
+	.determine_rate = lvds_pixel_clk_determine_rate,
 };
 
 static const struct clk_init_data clk_data = {

-- 
2.50.0


