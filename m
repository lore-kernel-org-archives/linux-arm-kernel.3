Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA88C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=; b=qXTmlwojoEahJ5vPPTOvIJ/j/Z
	cnbroV5cnKoZvmiC6sWvfiTtHoqCFB0CIoFhCDukBy3p4N4eQHhXdw6CCMZXF021tiBlSdRar2bxz
	9LQ4ueDAtM2MVfhlWEDWVSzYVPmHWnnwNarIhrNIKseCaPJynCAO4aBSL8iJfE2PfmQozOvXjuyvO
	/K9ZbSEZJNjD3kp0K7kUq9ppnyCvKEqafXQwpslZPFd4eA3C/VI40RDfM2xZj1UuFQy0fjIW4tclr
	DDMbXohldsQ2bC3FvVmh9gZfaO59vYJHq7A4UrlD8maSLnMGsEn1S0c6mrqVeBVU7je+7ysJhE3CD
	F2EiyWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHn-0000000Cyoh-3Fjd;
	Thu, 10 Jul 2025 20:54:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvIz-0000000CcLr-3K8g
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 17:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=; b=E0m9w4062FtuHTxGyol1SGe1Je
	lIxBQnuBOFYkGFvyxtbHn03k38W5m/kaeZXar+pD0K77vQKLHy5k5Px2gtcJBTp6XtVkdBT3WEoe/
	RlcwDnRw/rjQsgy2atPj06nID+YYuaM7+0kZ+hWd019xoR+1QLkSAaxCQRRif3543aiRMH7xMPe0C
	zuqCrWqhSKNruKQp1BZlv1pM7gujsNb/DUGiIuxqF+oAwCoBLPiV/InyBYqJm6naftpQSU2sya0kV
	MOEyUb4mqnmuOb6YXMhFf7ltjTTFMdt20i6KPzI/CosIDScL3FixuZAEYIsXfVdUVN4YZ+VRb/p4c
	BmBcMJ5A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvIw-000000095zJ-3RTG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
	b=Z6C6+DUg4w1ugVrWNW9WD7XPladdxlXW0J91egWhoYSpM9Q4ezFhvOUX6fcnXk00TKHtDd
	6as/n6Q2VPb8Qk+eMAqJnuc+p1QNa1nZfytaHXEqQBCQ2SfOY00LSvzY0hFPAldqbNWGzC
	URwibWZiy3br+cSDhFQbudAzUvI23pQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
	b=Z6C6+DUg4w1ugVrWNW9WD7XPladdxlXW0J91egWhoYSpM9Q4ezFhvOUX6fcnXk00TKHtDd
	6as/n6Q2VPb8Qk+eMAqJnuc+p1QNa1nZfytaHXEqQBCQ2SfOY00LSvzY0hFPAldqbNWGzC
	URwibWZiy3br+cSDhFQbudAzUvI23pQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-jz_q7TRZO8isdWYD6hu_AQ-1; Thu, 10 Jul 2025 13:43:27 -0400
X-MC-Unique: jz_q7TRZO8isdWYD6hu_AQ-1
X-Mimecast-MFC-AGG-ID: jz_q7TRZO8isdWYD6hu_AQ_1752169406
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb3466271fso23953906d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 10:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169406; x=1752774206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
        b=kIW7BwUWAWhbzHFxN79jbsL8BJmBH5lIffbqQie98ONFLEewbs9VMQ7ptswpJt1p5x
         QdCn3/9at/l6NkpP3yLT1l1h6VENHIiE8pA78TjMVmI8qqhxz30pmn7qTAvqGZOh7VGV
         rLaGZX4cM1h2vdYbOK34uMDooKcTZtmVintT1xYe4K9bmxukmFBH+Am89aMBa/s3QLfg
         val5YLkmP917Zju7ScbSoiwlRjssjK3jRbAWPWgBE7LH/gfF3UtF29G2m90maGzOJQfD
         vanNksEAeFAKxmitfIsuYkVHEGCHerVZknMhEghklYfd+XKjkJMl2Xhq2HXJqFUqfZAa
         M1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj3mB2TeAPuPAWg0rZL1eX+VdCwyt+pchEi5pgULnt3qPAo/u3IS8BahoBURpKtV5lpDxJbakVgmRPr0DNdvqg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5EOdx+bMgyX9+p3rbUDshPemGVZTl+0uYJp9Kpk6xfAIX1aGk
	KeLkAweUUeG9KsOSAmqMmPYtIjygFYcNPUzNBC3FoT63gvhsZ3U92wIamqeq+gYVMotlrl6p88t
	xT2QGjGLypv3KvTgQAj9hYHbXttljfyRiiLnBNTLQmXCyxhG065O+3/b7QfGPgiaODYTc2wJoJ2
	Qa
X-Gm-Gg: ASbGncuSiKuKJijfatEQv3XoKnbirO4M3U+hC6hkKnI5yPjzzj6JnOjB/S3YFBc4Tgs
	MT63n984HDD7OdGWFgZagikHevncqByiotD6XPTd2nTMOn3u+V46c0iQVAWxfZN0gJNx7aKWz96
	cw7fkVnOlpNgnd2ZV8tpV6lYiafUs9/ttgJgm0npkGBtkeP4mbNQprBZvd47KmTtzTUmmP/d21c
	rnU3t9R/Tyu1KbdkvFgSR/40kSKNoVCR3BPNjUGSp8PrzOVVWL2PuL/iOFv2o+Erf8b3Tq/bYT0
	9HOQ0iWPNNZrcSga5yfIy9u3UBs58Tb9K2uIuSDdgi1qHi52ag8/sQZX0Jn2
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id 6a1803df08f44-704a3f6fd62mr2495986d6.14.1752169406574;
        Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEttkcpvpmW8n4QYixl0+KFt8qbGPFK3Af/cnV1daIlslvCn8CNttD2d7VeOQXKfYZa2Tsq5w==
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id 6a1803df08f44-704a3f6fd62mr2495446d6.14.1752169406197;
        Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:04 -0400
Subject: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1612;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=0XNjSSy+sJ0lfEyL4cE3BgJoCrdQCRO7x73pTQQcP6I=;
 b=96LRUEONivujwIpqQbr8tblgDkupptPSSepp1EfUIk95IM619emUTpzW+J+hude/MQ3kCg+HA
 3yXQuBUEDwkAc7M+xiKSzQ6eV9m9VE+WhiAmImR5xyYrk63QkNrzyzs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HG02736YgIwYbhNI3cTDsqLnPau3cXFApiG-JYiYRDs_1752169406
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_184331_103910_08B19BF3 
X-CRM114-Status: GOOD (  14.03  )
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
2.50.0


