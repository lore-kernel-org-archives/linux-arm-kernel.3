Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D407C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=; b=tPuHg3hRb9lTq3EKunRDaKeSEr
	yDEM52tUuj0kjnaTFVoaMstEeznxQJMohgnhbVKuZxjWwJ2+eKJIJVdEugOooX1NfwoeYQYBnKRZG
	1g1vq/44cTkT0HqTHy/5pZlqohLHpY6SjAefaJiRBGsPEFAoo7UesB59rvuddPYdmBlxUrwu8Agss
	655IREFw33xBjDXjy0agK2zrWEjm8v+BnPVjYrLzV6bbXilF5JhRevRdaO4y8Q6sxXs/V2G5bLsWl
	7pAluUIkhGvkBih0g/BWjkcVXl6mawQkRjFlrd295a2ANWji7A175dBRwfflQRnQnU0AQUGHjnrPu
	t4IZweDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQXL-00000007UAN-1ac6;
	Mon, 11 Aug 2025 11:17:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQCx-00000007Qiz-0DGk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
	b=jISHvdsYD6jcN7/wvI7KnETLgeVyEt8rq00LMA7opD7JpD2RNXUei2xFUrah4/AXn3PIje
	4Z0tMauhQi5rYOvvK/NJ4HFUmbijTJGASrzoMMYJtMnOy2xOJ7ZSVDfFdznWiJoB6PqGOs
	nDuX7zhdhWOU9VJoz+gIpKRtfCnCIRw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-f4VQzm65PkG7qApt9apJbw-1; Mon, 11 Aug 2025 06:56:49 -0400
X-MC-Unique: f4VQzm65PkG7qApt9apJbw-1
X-Mimecast-MFC-AGG-ID: f4VQzm65PkG7qApt9apJbw_1754909808
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so971949085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909808; x=1755514608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
        b=dbqKK922vORXqm1Gy3AET/xGsmhvhatN7pSv4p64R5wSke9m0sFfDBXKPS2qnR9OR8
         KIucAUinsKO4M4YIoDNlskC5pSSBc3GOsNu4yX3SDGElPVtWJsjPJ4BE8J30QYzcpAJC
         WHC+wcujUjdUxh41ogyrDaxnyOog0IQwO8YoX4w3XJRjpqYRVo3jmav4mS7Ht9I6QInA
         BZdDBR/e9WlXEssF823/M/fBo9JJq1KKNp9dikVBDWCqy7FYnRC3x6mqUNOLt3HIDKW9
         AFHAYMcSWcZBqPGaUNwtVD4YEFrcV7Re5mlaixLkk9E3RWBiRJlD1T+T3plt9XHcUc9x
         4FRA==
X-Forwarded-Encrypted: i=1; AJvYcCUC4vDMc65izD/g1Pm6dSxGU/AJbv+CSHH8P+8ih2lJYpWJ1K0mRnNuzVVX7QJ6oTG7tK0Dc+yPojYLDhyPgvHU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0p3UrCGAEeoFWxhVmTdHthHLxKEY6LeT8Q6445bbDZDX8QzqG
	FaiDB4Lt/g9LcPxRDZECt/4GGOC9LFCqa2c0NsLFd5oRUwIevKjk0r7+wvY61JpL7BR3xuQXZ8g
	J5neEDe2CN0HttYYBKA8SJy3yy3iU2NJqXg1uX96dCTFEfmAiNVAZeyyuXGmA7AOF7EnXLPCAx5
	CE
X-Gm-Gg: ASbGncuhfSkZBTqK++kQ+kW4ENdg/yws/9yvZo+1q/phr1DtH+WM/OmZWKRvCikmrfi
	dhmLnCOeUntzFtCHsZcSJz5BTe5sS00WWxTmX6CsAEErmdO/XlWOmGoGkb5h4tKiI2OYSYP3mmF
	jUJPr7laO3HngKvjhJGKhZgl6sDw9nTqVqQIatc7OFlFhVvntC56s3vMCCWij/24/X0NqHaZfXa
	D9zz3bPHpYwQYRcgkm6T73HdMc4z2N3aa41jW12rJQq4kY5h6hyxpjWxeUTYcrB1EyRtSIUC9Kr
	ZgAjMy6S2wvmDWS6+XmVsx2zqugq2dFUtF09OtjBmwnTEghG7S+xSVsuHTmZ4OGryyEr3VIBX9s
	ZUPc=
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id af79cd13be357-7e82c75b89cmr1125685685a.34.1754909808546;
        Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhnLELhezGJADLmdApayEoevKdtEKOKSDSvgPhqkzq4hJSUIbUnZL0k2iE8nto9nf3DAncrQ==
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id af79cd13be357-7e82c75b89cmr1125683685a.34.1754909808062;
        Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:11 -0400
Subject: [PATCH v2 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-7-4a91ccf239cf@redhat.com>
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
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2162;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=juKzshMtQ4DF/h+L6Akp+woYewfsK6BXt/oa5cMlZgg=;
 b=srQL2Syf3qoqHVxtrhYtzT2hxKDJiG2H0/4WtgjDA8OLuly+icCFFE04ANS8bywbgRo5Semzj
 RZvKazBg3coDcnWyiIki4FOxz5OPAdab1K8jRW40iEHpLbopisMgRC3
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T0BMhyF_-9T2CwbRXc9sQudrrVyo_fflRf0htj0533k_1754909808
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_035651_168044_E735A4B4 
X-CRM114-Status: GOOD (  14.91  )
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

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
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
2.50.1


