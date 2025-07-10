Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8D0C83F24
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=; b=AtCdSGYcJ98RXJYZFoF1uxoJH5
	+lDjdERXZ/5YRJjrF2xZnWBd50YNF0zUOCQidunz8jsvRKlXUSBH5vIwZoIL7+Rrr/8N2KK/xCFSj
	VZ/pykV7yAxqApQRNRbVw0rd2hO2J0aI7Z3LvvW0z42Ix1dOzBQh7WtZVGbhLMOF0eVmoNpIhBkyd
	mLAomS7zWTSiH+pWll/601sy/O0cPrYrL5NOrUZvyGgVMSzdWTefo2D8wt25n7EUBxxnxYmBSg6XT
	mvYMfC8Sk9QEfje1pY2HX1zlV7VNYftc40LXIikWAycNvCImo46+mtBHpfZUETStJWJAyojXP9d1t
	hEd+0tRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHo-0000000Cyow-3KZD;
	Thu, 10 Jul 2025 20:54:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvJ6-0000000CcNN-1seN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 17:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=; b=mjBCxlny36IvGaXq7HSAOZv7mh
	irEW9o7ytYJPltJjT/7I+2U7vElsh+nu469aqT0RFKPMeA9cWovJNdQwhHbkDIPZDNbMj9dLKR+o9
	jqdnk28xnX3l068uRQWthLdKPu6hJNr1vSOXW9TaFnUXFlzzJ7G6WWSUQg/3eNWMBmmK2gjOmj5D8
	yMRGHYJGWDP3fRs0I2eqBETD7chxTlWwe1tDBuOfWrio6m+y7cp5AUrejvOzKRtLy1lt6oDTGvuel
	l9MBZWSeoRdQWYfAERBC8hDJrrb0IQVyhu9yYJUHL1H80DMUZ7R9dLczokZT8JuwtfRegZKp7rStT
	kABzH0WA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvJ2-0000000961K-2b5C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
	b=MxdvLNWCCDxudfCHkneSAo0mkKlPVrzsXXgsZ7dc3gVJHi/N8MqzjIePA3bX1/WYpwBnUN
	OiibdNOZVJ5w5CTGEi08iRLSh6TSqhpydJSmxHQs/+0MINT0TEH5XIumSqa9EcpdPx+ADL
	1yY60XJYmskihHQYAYTM9NCZkGpBfMs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
	b=MxdvLNWCCDxudfCHkneSAo0mkKlPVrzsXXgsZ7dc3gVJHi/N8MqzjIePA3bX1/WYpwBnUN
	OiibdNOZVJ5w5CTGEi08iRLSh6TSqhpydJSmxHQs/+0MINT0TEH5XIumSqa9EcpdPx+ADL
	1yY60XJYmskihHQYAYTM9NCZkGpBfMs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-iYFh9uyxMvWmxoinTmE-Tg-1; Thu, 10 Jul 2025 13:43:33 -0400
X-MC-Unique: iYFh9uyxMvWmxoinTmE-Tg-1
X-Mimecast-MFC-AGG-ID: iYFh9uyxMvWmxoinTmE-Tg_1752169413
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fab979413fso20156926d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 10:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169413; x=1752774213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
        b=MvksPZKvfPIAbdBHaChnVkw+9nW5es9PdnxwHhHkZy3HYAdcHlAhDxYd2W3AHTxrx2
         c/n4RMwSZ6iirdfRh8nfrLhoyOuNgLh/tgTWoj8f7fncTT/DL2KmDTPNW6dr+jZHJlB6
         YuOldZjQS7iNh1FzXWxlzxhfKlxTT9JMZRaqoOzzx7B5Ju6hXgQHO0Le31bl9TRBkRSk
         JeXGbnen9RALgUCM8Uc+LZ5RWD0bQCkDPXpkSZhKwxO2j9dKp+SPbAUTYjcKmCbKkXuM
         BCnGK82iIWVrPxwzd9Ql3DaE0JpKe0QkiGLO+NB/NEPwz1oxg+pfRrygdh3q5hYO1jJr
         IgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWaNgFJrBeIvb1Ohq4WrguBKuSE8ARGdptNdkiHdmzF5buqLnNfiAfrBG0klWUNXD+lvhVVqDHmTe6QF/uTQoS@lists.infradead.org
X-Gm-Message-State: AOJu0YwyXkjGh47I9BF6iJlb2gwuoH2PDjqEQGwPOB//3bJj8OORuM4G
	Oskhj3OSCauCybEnH4jj4nIGItP/HfQ51z1/F4WPpiviSPmdqhMjPnnQDX4VB8T+N1LMtsSHD6s
	ETN6u19Mo1/Kmx0nFrY03V2Gl3mk1s1al6Ip5iBnSLF82gcARtsIDabIjSdqtsW3pIc2HeHedQz
	Yc
X-Gm-Gg: ASbGncu0YbkWWzaa+Pb8RGdIwsNULkgfWKyB/plJ0ce+o5VQiKkU1xYN6Rlo/RGGbBS
	9PJQb5mKRIeM4djxFnprEZ6SHjKDfL0PyDpDWW8evd0AEzMZlguX6+nXZuTguYSVJouGw32etH+
	Zt33xambfscUN3bYwoQglScgot2pIObwJ3FIkPxMTE857Yaa8U/i4TCMDniiSHDC4SEZ7f7jFzp
	RhIfTSuTB7eHHoF0AT1kgTZCtgzbApaz2y96Cqidqf/00R3dzZMH7nNwJ48dy9W4pruyzla8/WM
	07CweKJvAxO2RG2377bWTWtVK/DWX+rj8HpBJT40KppHz69Pdzl9i68WV72p
X-Received: by 2002:a05:6214:5d89:b0:701:775:70b8 with SMTP id 6a1803df08f44-704a3a4449cmr3580646d6.38.1752169412758;
        Thu, 10 Jul 2025 10:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpu8L3YGRW12uiQDpOxMNgeR30Y84ZsZlrx/wXIc8LbcnhH9LwZm0nYnuoy1dfBl7P78vOQw==
X-Received: by 2002:a05:6214:5d89:b0:701:775:70b8 with SMTP id 6a1803df08f44-704a3a4449cmr3580236d6.38.1752169412340;
        Thu, 10 Jul 2025 10:43:32 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:06 -0400
Subject: [PATCH 5/9] drm/pl111: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1663;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Uzde4F/sfQBVHQNcjDIBT9HB34JjyGuqbe7jNdblqLw=;
 b=0pYUMWvjxgx4WfuoWRCVGEVL5ZYYPMN0neD5N8OcfZKIHag1vghAK3SLtnfFRHjfYafmDTVi+
 fTHFTPespiOCXPSLsOLNifbUMGk0HbP0Ww4Oh/+lSRoq6wnUOICkRwy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 19NxquQdcSB6A9aJll5SPh7o8pWxqKEIVAG_GaHu4P8_1752169413
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_184337_173063_8E01F558 
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
 drivers/gpu/drm/pl111/pl111_display.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8bb42116ac382010829e333edbf8f..6d567e5c7c6fd559ba369a2761d3c402a14c6fe4 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -473,12 +473,15 @@ static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int pl111_clk_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	int div = pl111_clk_div_choose_div(hw, rate, prate, true);
+	int div = pl111_clk_div_choose_div(hw, req->rate,
+					   &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long pl111_clk_div_recalc_rate(struct clk_hw *hw,
@@ -528,7 +531,7 @@ static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops pl111_clk_div_ops = {
 	.recalc_rate = pl111_clk_div_recalc_rate,
-	.round_rate = pl111_clk_div_round_rate,
+	.determine_rate = pl111_clk_div_determine_rate,
 	.set_rate = pl111_clk_div_set_rate,
 };
 

-- 
2.50.0


