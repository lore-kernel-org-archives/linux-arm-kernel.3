Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931E7C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmZ5OhIFbDNhhdemRjccJWJIhJ+GPeWDy3CnIwZY5Y0=; b=Ks2QPtpN+wTvZUrTxZfyt0SHHb
	F+TO4dYquwBnizTq3MCH6N6y9MhKF7H7XNHbpHFj/hq8Ncq1ODpcV8CAYz+cDaYTuZMOKY2qOeLhM
	aj8yqlhanU/v/bl0/0epgf88PbL+hn7okTXT5fk2TcRZee9gXPnoaAOPuA1HcP3xOJ4PftwTOvzeT
	UJ0FDGI9mCK3XIlJAd3YEkZou2aDLKOWmWeNwdblsXYV36K+d1hDplQGSaH2aWNHbeuO1IAwh+xay
	LEHEkfMrrBaxyFzM2avgv03MSJA0FvhtE2Dubza135qnDQKthCeKSiUnFG/5TJcBIkc05wJ3MdZxy
	xnNeNiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQN1-00000007SXc-0NgD;
	Mon, 11 Aug 2025 11:07:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQCk-00000007Qd9-1EYt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmZ5OhIFbDNhhdemRjccJWJIhJ+GPeWDy3CnIwZY5Y0=;
	b=UbuQMlYmTwYPV2/asD2FSXjSz1l0hyZlxDj2qQ+MZN9i9uXIzuH4cwD8p1WTaZXQrD1cbW
	p6l5aa/d4m/oPGXE7eiMB3K/o6jlzQrVNLBTOFQ/PHg8zHzRDloN0Qc8GvVAFEfPNY16Jq
	kKu4/c4JlIqdnfTzIuLnYz2yLMghqkY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-3currGc8O4GsoXaS9tqlCA-1; Mon, 11 Aug 2025 06:56:36 -0400
X-MC-Unique: 3currGc8O4GsoXaS9tqlCA-1
X-Mimecast-MFC-AGG-ID: 3currGc8O4GsoXaS9tqlCA_1754909796
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e69e201c51so996662885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909795; x=1755514595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmZ5OhIFbDNhhdemRjccJWJIhJ+GPeWDy3CnIwZY5Y0=;
        b=L+QoQfz+Y3MMU5H0HGH2u3WNQgJ7h35PMd2vo+OlBjOKjz4Si3JTPPYBjCP+GrLu50
         V05uHFikwzUkha7VL74L49FxPZhQMV0bpAv9ebw5yOfqKnkwlGGkPwXF352xWuKgIx5q
         T5ZBQDOUy1FIbjKeekUOwM29ICx8BPajdfKjyg7YFtewc65R1AfF7Xe6amghWJD6wCDB
         uIHIiaFAHiT9UL9zzrpwKlpa5REwWieweEdfR+0sS22Mc9P+P4mHVIpW3vR3z30j6DTA
         5n5yCKHD2U9JubUf1kOOkpCjptZiicdlwG+COv+SjF90fKLSB6n0S1RIePHn5Lotyc1W
         TB/g==
X-Forwarded-Encrypted: i=1; AJvYcCUf0TGicwpnTME5EyA0ttWg8yfwBp0VQ/6vaQTYK/Dem8Q8GMbdJKY9VVdN6LH0KPw0PUaV/S65H6/LZgQB1KQB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9a7+mQB6VaBVoj7KlcLucFWpKvHTonMBQHQbKCiEVWe5mcYgi
	FA16HCWTPe9qQHwo7u/cqsHok3dr/oGPm1Wrx53Cve/Pc3rhN1nIEP/DkXB40aZ4udu16yNQwhj
	tpsU7L/cOwdp2J/ZQanlLEyaeLvBMXDxd5cxLzuZAQ6DgBH3fer8LTwEZcr60M4qEVlJHW54XdK
	+S
X-Gm-Gg: ASbGncsbcSDXd89Ekp7sNcYsb7taY8g571YSSy6waGwnhRMXrTlHgzIcLyQ1LujH8Np
	6wfu2mgXKOjMw7aJdQFaYabOQO+6YAYEMuOOk19PMJWnWxvvwNGQUnRicOGdav7B/VLXJD+W7Gp
	MB8Utp2r5JvwMuf1bxhPX9s6ZMlWbGCjhZ2exi/XYfUP3/336LsTh0lT+AEkYaWzJXErZrMlbTH
	4ySKxeqaZwRR40owi/RITbmeL/cif3N6XXAnXBYMbhLqeDS4aQ1lqgAJOFTjYsCnea8ixIZci2A
	xTehMJwW3bYey7D/6MKOdvkhF5xi97vwGSYl9CjrP5Q1y8d0KRZaT2b1NQElbHaUOWKdMDqsYlh
	uaK4=
X-Received: by 2002:a05:620a:2ae2:b0:7e8:23c1:f472 with SMTP id af79cd13be357-7e82c64cc0dmr1348328285a.3.1754909795580;
        Mon, 11 Aug 2025 03:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9n70Dnsh0oekI6lYBsj+g6fiHD2aJUNrf5ZRMtmoVkJvAZxcIb6V9PGnNEHDigLw+MQojEQ==
X-Received: by 2002:a05:620a:2ae2:b0:7e8:23c1:f472 with SMTP id af79cd13be357-7e82c64cc0dmr1348326285a.3.1754909795068;
        Mon, 11 Aug 2025 03:56:35 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:07 -0400
Subject: [PATCH v2 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-3-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
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
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1737;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=QhsR7m95oQQJWiR4k5sEM+znPy8RVqMfVFdEDgPgP5I=;
 b=Yf+/AEJVSVpYyfmQu4W8WyuhOAot3PpTJ66fonHG6NgwPWqhvr62JRFBH9lf6jrYZTbKGBwD4
 RLchj5Jj8AWD0/ZZRq0fRTK+W2ARhNi43oK0yq2QvGqqPc6Fg70Vyhk
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lZ435erLvQemaXqIOQP8R0A-Da8F1X8JARljQ_r88Js_1754909796
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_035638_411346_6CBF2564 
X-CRM114-Status: GOOD (  14.71  )
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

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index fa2c294705105f5facbf7087a9d646f710c4a7fe..82e6225c8d491d44e30631cd5a442fb7c2de3f75 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -98,11 +98,14 @@ static unsigned long mpd4_lvds_pll_recalc_rate(struct clk_hw *hw,
 	return lvds_pll->pixclk;
 }
 
-static long mpd4_lvds_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int mpd4_lvds_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
-	return pll_rate->rate;
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
+
+	return 0;
 }
 
 static int mpd4_lvds_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -118,7 +121,7 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.enable = mpd4_lvds_pll_enable,
 	.disable = mpd4_lvds_pll_disable,
 	.recalc_rate = mpd4_lvds_pll_recalc_rate,
-	.round_rate = mpd4_lvds_pll_round_rate,
+	.determine_rate = mpd4_lvds_pll_determine_rate,
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 

-- 
2.50.1


