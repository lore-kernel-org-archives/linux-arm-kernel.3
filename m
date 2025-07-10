Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3BFC83F20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=; b=hOuD0oEazGjnonmMNWO2CjHx3A
	NrlP49niV2zIWJVr7fvtssrGFEomoPb6G06eAgilJsu6r0z+jtmCE9Di/53VAggjlBdiEStTKQua4
	CHHKJ7oXCsLOrWLwxHEKTuInHUVU54otBwEtkhtveAGf37bHewsNCFVIIqo6BWy+Ukn37xQv6oTE/
	Ybshy+nSK+XWa7SdbMLfeMxIHG5oblOYuB1YDPpSSpykzLlL+i1WDcMz/5fCYmZWe7WX8cUYW1IXI
	2y+DAost3Gv2HecOaI6qRfS/Yk9Yp2Ed8iw84/QtB070D5UxdjjOG01CLImb/4csAQlFRcqrOdShO
	47xHMR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHo-0000000Cyon-1A9D;
	Thu, 10 Jul 2025 20:54:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvJ1-0000000CcME-30nd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 17:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=; b=Y/EDJ9MgLFldUVzcYnABXT2uXH
	KNI82CEkf5OzZn4UY3hrJ+HakLatv12tsjxnzxG+7gm8EKeVOSjIDab3iR1lasp2L4/Ub3NHgBEpg
	HWEqI/q3XzLIYX83c+kGxpSSfxzx/r/Z1+3LZbLHT75mw2pdjEYHBUL02OhqKsgZl0zyXpi8AZ0Z2
	bV/D87s3q36SDK06XkBd23YnDsFJ37MgsvprTroCi13kNQBWElGX4qwccHbS016aWKGVFpXzTm7RW
	SGAS37fY0axuYwPTHgzIFUi03eobriwtBytKZqbFO3t+bqK89w20Gcs2AU+oXVc1ynjOyTuoV7oZw
	fgMPOPbA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvIy-0000000960E-3Ror
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
	b=THsnD/UA0hn3cdsOaaayeVsUI/I7PyBZoNLeexfE7Ix1/Ezhzc2P7lFc2zjkmxESmSf6tu
	AsYRJ30KYZKxYjzg/AcTYqrt/nvtIup50+S2gdA6i68A9hw6YAZSwK6BWEdMax69xuNkB8
	bTkykjp5jRN+RTZdyTAWSyQeZ2XzY68=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
	b=THsnD/UA0hn3cdsOaaayeVsUI/I7PyBZoNLeexfE7Ix1/Ezhzc2P7lFc2zjkmxESmSf6tu
	AsYRJ30KYZKxYjzg/AcTYqrt/nvtIup50+S2gdA6i68A9hw6YAZSwK6BWEdMax69xuNkB8
	bTkykjp5jRN+RTZdyTAWSyQeZ2XzY68=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-gsvTq2FuPXiBM_8PTDoxvQ-1; Thu, 10 Jul 2025 13:43:30 -0400
X-MC-Unique: gsvTq2FuPXiBM_8PTDoxvQ-1
X-Mimecast-MFC-AGG-ID: gsvTq2FuPXiBM_8PTDoxvQ_1752169410
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d44a260e45so225833485a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 10:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169410; x=1752774210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
        b=THjAFrx9l6JWc0qPCNUA/jKCyg4IkCiEESCTkkEw0hzMa5mZlkwduD4GeMTZCQYRl/
         S+u2uC6WVKJ7kMPCjBi63uCBsgnPkaVhu5vtVJO9Dn8S9gAdcC1fiVmHiy3VG9Kd+Ew+
         oGJcLCFVjUtLTmYxUnCEWk1KgpJtJyqYtSDhGdOdDA3ihPV9GPamP36Dh/mTv+8dF+Kj
         17DJ1eMFtC52Y1geFFUGLGW3quzMXevZja5S7VnRXQFdJHAHxpbIygN8C9L8af1/W+ht
         6WtP8FJ9fPogN7UlmzXhrQmYVWgPsz8gGmT717b+QDn/l2uIxFAqVxp75myYTYlqzXCW
         1dug==
X-Forwarded-Encrypted: i=1; AJvYcCVcvBlEgxMbxgPuehNilwlflnKfj3xBgFdlOj4myGPM+AoN6YgZV1z9/2wzZws5byOey2XOWcOfwwiC3O/WHaiX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt+uyZaV0PMX6g2SR8f4sRuFPn7JC8PK0epxWH3/QfDvVU1JfU
	rXtRxZK26ppf+nEjfWfSOMEyHeYbvqib4ADV5JHM1Zn3GSy0PyyVdqLIYOc7npTMmVO9B/bK+21
	qzlRm1/ideTQfrD8tV6KkfnkcfFTRdO9RNoRYt9S06T8+dSFjM/cEp/P4B9YHa5bgfbYC1xB36y
	1P
X-Gm-Gg: ASbGncsUU6cAO/GwmQUrEF5E4h/h2dmVexcj50FDjZ2KQ3G/cXs+2Dk4D76Nw4kIaN/
	UsRQgTPR49QANufSIGez7W1ejMe63mfcjLCucKiS0pHTjkbmyNdHhgLQVu/zocUaHr6hnxcTtz6
	RAXoIyca9uhI/+E1YeeLprIT85SH1Rr5keF7WPboCWAS2E22i2IEp+u36UVTsTd3HazAKMrcrjq
	NwZPqjiCW+2DBTRAV3EvEWg+H4IGya5KheCazwHdE9vtmiqN0X8e283Vp/KKtUMaCyBeGhdWoca
	BDCE477hAlkQwkkcYZ7/F+OQXPAvjBa+LR7Nz3v8E4aiUx8juS0eUV6Gob1g
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7dc97da02f2mr646710685a.9.1752169409721;
        Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtGRA59X5211+zA6+bTuLexmbhranU9s00ouhgxHCHsr1K/Q7uZzJEn/YRVuxvQ5eKEuxqlg==
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7dc97da02f2mr646704785a.9.1752169409169;
        Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:05 -0400
Subject: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1532;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MIrYQUA+EZpetvGrGMmQ8oMPGqbTBnNzDewrKD2iOsk=;
 b=xNXPieWXOwE6YijWTJ3taaQPCPf8/+I1K7+s2EiMedGqecECqqLSQTFSwjhrnG/onGaKSV32p
 isG7Au5aNEyCqmbZJtcC9vC7jvxXBrzxoAluzBC1poKDa0ziZwvE41x
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9CjB8U6XkgKRl6pLQjffbQTQcTphbVPHGhSSF0HRmnI_1752169410
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_184333_108419_36BA8653 
X-CRM114-Status: GOOD (  13.62  )
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
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index 83c8781fcc3f6e1db99cfec64055ee5f359e49e5..6ba6bbdb7e05304f0a4be269384b7b9a5d6c668a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -373,12 +373,14 @@ static unsigned long hdmi_pll_recalc_rate(struct clk_hw *hw,
 	return pll->pixclk;
 }
 
-static long hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int hdmi_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
 
-	return pll_rate->rate;
+	return 0;
 }
 
 static int hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -402,7 +404,7 @@ static const struct clk_ops hdmi_pll_ops = {
 	.enable = hdmi_pll_enable,
 	.disable = hdmi_pll_disable,
 	.recalc_rate = hdmi_pll_recalc_rate,
-	.round_rate = hdmi_pll_round_rate,
+	.determine_rate = hdmi_pll_determine_rate,
 	.set_rate = hdmi_pll_set_rate,
 };
 

-- 
2.50.0


