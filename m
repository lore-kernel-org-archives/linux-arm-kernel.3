Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1E3C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=; b=F+cgKZVraQNBsYEsw1JP3iVue+
	ZhZoprtBRa/r9qWa1N6bK/RD6qJQtjf/yqf+W9TktvqiCDWuF09zgIGTXCK6pz4DgsA7rhcyxFll4
	CRzBCBLyqbhma8tWjMaU9b4ev7vTMgwobcq2N+KRNoaNHMCIt/2Dm49RazLhogjoiMAPNC1fhLFX/
	l1K1Hk9R5lmQ5g8z1sLbgAD0Vg5KB+/K7OQu73pMpSAfel6HbF7rBv93ZzWGAtWgheqCbD1Dbb4pC
	v6ZK5OJQrpkSLNjHTUsk0/LnYQZ2DadirRXEMq8aymhNw30ROGCKfY5nlBzwQCYGgCt0r8MvVANCy
	YDyeV6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHn-0000000Cyod-0xmx;
	Thu, 10 Jul 2025 20:54:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvIu-0000000CcK0-1UJx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=;
	b=XiX+eaZ3PhVeduaWehbecBRS6NRoWfsCYaSaR/3bc/oRrAA9MyWqp/RSKtWjNRPgKvStsk
	uwAHU0e8Id1GBKl5E6NVsg498BWWxPhvL8iyISdi+5nK7TNnwbwaHDV9jGDKf6kdepcUzZ
	YKCw+3U5xCghan6YIUIoNbQSJATDWMk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-Apm1mWquN2ulnLqpa2hjCQ-1; Thu, 10 Jul 2025 13:43:24 -0400
X-MC-Unique: Apm1mWquN2ulnLqpa2hjCQ-1
X-Mimecast-MFC-AGG-ID: Apm1mWquN2ulnLqpa2hjCQ_1752169404
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faf265c3c5so19384726d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 10:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169404; x=1752774204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=;
        b=vKMwJwkmABRFD683tlJLcRSdDVExR06U2r9CROXrz34uL8a8rt12KN/ULMvtGRTBpM
         1a7coSOEl5gLJGiBeon+90v7RAgQ8ihv7ZH8H0inlkyiVJRg2djfE3JAOd+RoHzVtOf5
         Y83TvZsGKgb3Ks5LWfiHFWCe4IP32T0S4bO5bbrduD9SVTFpDiiwKEl7hGQ4MgnOCnyZ
         TH5KCWU0bLUq0KLvw0Fbhdj7ykfA4fQ2ZLFMdUzo9GSxPwyBVFqqKsq+Uk4VHXoYtDG3
         BpO+kDBYhtcWznyFA5pxW+4X8GJiKo0qy9R6RsVj0UmvnHjPdVEOcOisfvmeZlaLvwMT
         WamQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1QKfSI6j/XHSwG//HLwjt/YN/wTJbQo+Nw0A0e3jj5jX3+u3TqxEv6nWezvVBRBaPxxzprNLE2kX/jAfU2vZq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2LEMid3w/Hlt5bvwFTwPwsgfP2e0B+r7C2vCRKNBRkinKUq8d
	wmfQ5jQltTK9lTccCt0nKAHb36X/s7AyaDPvdlQ+Bv6/PBPmzV5Kqngvknu4NRp5MrlwFOHWBhc
	jH1s8uwnI8s7P01mDTrbROxMXwzl1at+o9+Ho8iWWzCTBLjIs6Fnlof5qIOAJ70h41lbbdrMhi5
	KN
X-Gm-Gg: ASbGnctD2QLMAbHe9+inWF3IEpT62x7Dy0vitGDgXObAkIbytjaX0YFM0SUfoq9OBIU
	/fXubN7mbe9GI9ESV/LUUxsCX+4B2Q9ZIOT3OzMVtkAR/GiI6nHtXYR7uLOAZIlRpxKgao/QP2F
	EX/Ai0/AYFYnwdSaaCjx4/BCzxYxHad9Ag9dz55fBvM3yOT4DdANwFi2uCKLjNoVx3moTwZ+c2l
	upr9INImxWciDq8XtKvU9oBwZbsbhpmUZp10zJ4L97/UTSBLhNSeJV95s27V6A4G+xfTijZCT2R
	TZva86233Eb+0Sjo8mp4exRGv/N8LnPitlxjJs5J68lVx0FO0DKZ94DRRSjV
X-Received: by 2002:a05:6214:4521:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-704a3b03a02mr2644746d6.43.1752169403795;
        Thu, 10 Jul 2025 10:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFibFyJAqH2Tkc8cSfyuj43nonhKwPGrbHTb1n3BZYj/b4JFbj4juY9nmJvfEsNrJfVGljjaQ==
X-Received: by 2002:a05:6214:4521:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-704a3b03a02mr2644146d6.43.1752169403246;
        Thu, 10 Jul 2025 10:43:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:03 -0400
Subject: [PATCH 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1675;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kl2qeTWYwIcCK1THSOcO56NA9jbysmHw5mNgghcr0SU=;
 b=dJ/qA0hGF/+fQfe0crsCUgeeRXp3uEEF5tBBbhlI5F6XFBRbvTidAvVYatP+DdWjLDW+J4Np0
 hf2I1m8Rc9fCuxnysHNHHy4FFC3Lx0PLz51pJGMCy+rQ/pwYO2VWCbI
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 95IQNT3z0K64A0vyQDuhiJsN_V7GQCXXIbrMXCFb5l0_1752169404
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_104328_464559_519F67C8 
X-CRM114-Status: GOOD (  14.07  )
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
 drivers/gpu/drm/mcde/mcde_clk_div.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_clk_div.c b/drivers/gpu/drm/mcde/mcde_clk_div.c
index 3056ac566473487817b40f8b9b3146dbba2ae81c..8c5af2677357fcd6587279d58077d38ff836f0c0 100644
--- a/drivers/gpu/drm/mcde/mcde_clk_div.c
+++ b/drivers/gpu/drm/mcde/mcde_clk_div.c
@@ -71,12 +71,15 @@ static int mcde_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long mcde_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int mcde_clk_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	int div = mcde_clk_div_choose_div(hw, rate, prate, true);
+	int div = mcde_clk_div_choose_div(hw, req->rate,
+					  &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long mcde_clk_div_recalc_rate(struct clk_hw *hw,
@@ -132,7 +135,7 @@ static int mcde_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 static const struct clk_ops mcde_clk_div_ops = {
 	.enable = mcde_clk_div_enable,
 	.recalc_rate = mcde_clk_div_recalc_rate,
-	.round_rate = mcde_clk_div_round_rate,
+	.determine_rate = mcde_clk_div_determine_rate,
 	.set_rate = mcde_clk_div_set_rate,
 };
 

-- 
2.50.0


