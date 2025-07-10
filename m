Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12152C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OrtVi+H4smani+Wxuj7rrrlvdLEKHZeWuJz/QAEtZ0=; b=Gs1fJciVecoD9UCSVxiptkm1mh
	QhNQQyVgnDACco7kJ8u4vQQooOmENvS4Csy5iw6aX8+kOPsfHCBcYcwJaQyjEC+zehzhOWfwXGBX1
	PoFBM8n6SfNpi8WU+MImnJGbBqT0F1A2caxXBEklh4/s8k+tk3YKrmBePkmV2owmYQ3eR/mqagvT8
	aUPFjWrz3pzXbxtJHtKf6rW/CRTS1jQjonJnTOnneUlxb/DWaLkXNugZpsapxBuVxiaFEDWYDQnZ0
	FW0WYhOrZHSdeEcomM06aERBHVvC/+mHJnRLa9vxklByvBReBgX9nUem/y0gLukceGrtCUTAePe0y
	LThx3GFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHr-0000000CyrO-0NXf;
	Thu, 10 Jul 2025 20:54:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvJJ-0000000CcRB-1wnC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OrtVi+H4smani+Wxuj7rrrlvdLEKHZeWuJz/QAEtZ0=;
	b=AtA+jzFujAbd0pOaVCoVvdyfnqAuJgBh+MfCINJ3ZY2pG0/14uR2UODuIhegUmBc7VKtBX
	VfqkIN+U1X8DUohRzQEP+VEcwBHiqdjDTdpbvfTWe4pO21CiikDtVU5PADNWm/CF+70UF1
	8XJxz6IIjG/aY4mYwzDGOwyw9DGFfwc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-29tqx_QLMWmageH5oHGVCQ-1; Thu, 10 Jul 2025 13:43:46 -0400
X-MC-Unique: 29tqx_QLMWmageH5oHGVCQ-1
X-Mimecast-MFC-AGG-ID: 29tqx_QLMWmageH5oHGVCQ_1752169426
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb5f71b363so20704926d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 10:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169426; x=1752774226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OrtVi+H4smani+Wxuj7rrrlvdLEKHZeWuJz/QAEtZ0=;
        b=nRD9mRDLAfVmLByoCYBnsJGqqlEgoZemq0QrCNWiEPYscI2EwW0hriV3h2+GP4iBeW
         FbNAjxdv+c0ueNuDkMnrATdfIBttFXiqjYA28ZiitUFd7Xn6WFlVinYCBGffJcyOJg9S
         i8RxGG9cAZOxqwWjCmmLOZqRHQmtdEmfkytkeGQPeAfm0mCbc+jUwMpmTgTHhnQBlgXC
         NaT/T/3p7p5OpH84/le8kiPdvwBbcWw0r/gsWAqbEhVeu/c8YIcA0/8IiIbnlJ/3K8si
         Y5KyvYm+zpdxH8BpLIpYr5CDu4RAg/YW8RdIClPzhF3MQWCxx6akrR+sVNHOgezCGMQm
         jhHg==
X-Forwarded-Encrypted: i=1; AJvYcCUurQHrj3N0wjo7fIjjsGWZTVLpZWNIjO+cj3ffUpa5BepOzgHAHNvxujCpd4aXM1eRf2S2XE7k8e92ovwVCr40@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9POCc8jOR0HuI1RkJzYcgo20x5wfFGxg8tHb/tzzSFc5/xq6J
	DgDcmWFyEJ1p3CV+8RU+iBgxCUGCK6O2XHvQG5xOm31xM/xyOQru2FJ3i6Yv0TRm/xv+tsvNx3+
	WvHHGdJJMZfwWhDwgbOG5Kc/VbsIlIwp0PT5qg8Vc9clwGTTwRodRrCQ+6snDoqQjJYYWyouqwi
	iw
X-Gm-Gg: ASbGncslHS/EZ8cjIuWJm5+XHEaLbazxG/L83Ioy9CkauoPiwJ+JzJbyHWMH4jd5ccz
	b4cr284VqnQme1WZQJ0z/CB4Q3jwF0pJsYMwGlLUn7CdlkbOuYd9svf0ml9Tdh4e3/MI2yyoiYl
	G/FqcnnOFdQ1g2I0f8HvcYbAHzEQMdYSY1A2Glvw8uAeSe542mdjMDa+1d3YtUNKO900C1jsoAT
	F6v/xTlaDTMDqnmk92owxeh3yXlw4ellouFVZpwVQI5GWEXfhMGDQteaP5ecs0mNk1m20Kd7Bt6
	0+cl0LVxae7OcPzfhCCdf5NxEW5e+/HgLh1eaZB0kdEGIABBt0BfL6W7aFC4
X-Received: by 2002:a05:6214:5d0a:b0:704:9bc2:be36 with SMTP id 6a1803df08f44-704a4083bcemr2613626d6.7.1752169425778;
        Thu, 10 Jul 2025 10:43:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxO+/+2HUAUPTiUYztt/lC4Yi0Q22OZoIfFBMZk64H2H2sqirYgZh1L3qOGgIkQVmmCaX6kA==
X-Received: by 2002:a05:6214:5d0a:b0:704:9bc2:be36 with SMTP id 6a1803df08f44-704a4083bcemr2613296d6.7.1752169425386;
        Thu, 10 Jul 2025 10:43:45 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:10 -0400
Subject: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2262;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=xPkagiW22ryYRgcFeUxKsYb4R3sx64zzzkaF7TIS6rk=;
 b=l1P9iwEOFZ7iseMUGqrDwyTv1j/GS/74kLm+7ZgYbXOn1R2j8JwTxirCensojfrRCiquhbnNY
 RQW74FdbQM8B7MkeQZA7rAthmyuLBvNMin91wee7+2bXtn9fga4VsSS
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _jc43uq4HOqluynz4W3W5cMS2t3vE6VPGPmuG3ROE4g_1752169426
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_104353_618444_37A052ED 
X-CRM114-Status: GOOD (  14.30  )
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
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd654f395ea85ad914588c4351f391..9b85bf512d4c81d0a12e8cf726d5d5440343519c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / val;
 }
 
-static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int sun4i_dclk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
 	struct sun4i_tcon *tcon = dclk->tcon;
@@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int i;
 
 	for (i = tcon->dclk_min_div; i <= tcon->dclk_max_div; i++) {
-		u64 ideal = (u64)rate * i;
+		u64 ideal = (u64) req->rate * i;
 		unsigned long rounded;
 
 		/*
@@ -99,17 +99,19 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 			goto out;
 		}
 
-		if (abs(rate - rounded / i) <
-		    abs(rate - best_parent / best_div)) {
+		if (abs(req->rate - rounded / i) <
+		    abs(req->rate - best_parent / best_div)) {
 			best_parent = rounded;
 			best_div = i;
 		}
 	}
 
 out:
-	*parent_rate = best_parent;
+	req->best_parent_rate = best_parent;
 
-	return best_parent / best_div;
+	req->rate = best_parent / best_div;
+
+	return 0;
 }
 
 static int sun4i_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +157,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 	.is_enabled	= sun4i_dclk_is_enabled,
 
 	.recalc_rate	= sun4i_dclk_recalc_rate,
-	.round_rate	= sun4i_dclk_round_rate,
+	.determine_rate = sun4i_dclk_determine_rate,
 	.set_rate	= sun4i_dclk_set_rate,
 
 	.get_phase	= sun4i_dclk_get_phase,

-- 
2.50.0


