Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D804AC83F20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=; b=OLt+mB873ijG0KoSc4Sqrin5f2
	SR/kEyh8Spz6bVtOd6JgQXNOeaXAh2H6kTUZemb/td/1mrHQPiKxUYpriQM18aLD3ENrFOETpxoK3
	42dLBMvq8DQZfrqASni0+NwKlMzB3olhG+xZoia4ZvqRow6s+0reclSxRx37m+qEvd6BhNrh6VApW
	U2lGA9Jq40OP2Ioa3SntPysOglZOElE4Lz0Msd36PxSnRO8nkPnwtX+wxmerCuTcO1JyMCWX14ECp
	rEE1EFOP6k8TB0+Djo+5o+JkmvRLQFC3ew81fKHZpYjdGb2MWIJdLw5c1ZUIFjn87qH6STTNv/1kR
	Vq7S00+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHp-0000000CyqV-3pHy;
	Thu, 10 Jul 2025 20:54:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvJA-0000000CcOw-3xJ8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 17:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=; b=IZK9Hvh24eqYymJY0cFloI+UgX
	O7Elyr35P4LL8Nw8Sq4SuKUFJcbZCtmlGJJe1VrB2RTabj8vVoC9fMOpr1K+/pA0/XR2cPoElXyJR
	jbHDzfZF2ZWpmSTozyaZUWNvSTJEXaGeQgUmsA35WPB1BEJ460lcs5Fzd1/LLSwjZXceBSnPlfs1D
	XOH/WBYFt14jC5iaud8a16wy1zhMugPF9QlJFlKUC3zwycVneXWpWlAEK7s1rUZFWt0XGPbQzPu0K
	IeZWtHmEIyHf4LB3klSinDc/MfaiVktCZmUhZeCBtW2n+6ugayXhyCoTGJasdguReKxHOh6A1IVN9
	5amjGFlA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvJ7-0000000962n-1Ukf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=;
	b=YL4txRn2qlhT+uU2oTv6ETRcvb01LCDFHX5+/NY8YlfpZc1dyGPCTlzsDhhYMJYi/SVjzo
	BaNVs+Ae2xknLXVw2ELsIEcpBC2HJkf+W910PPujtndnaBo0iEfPoW36/0ufl08OMarNJv
	Sz9S0jsFNViw4zqwJc/Bh52Uf2RHo+I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=;
	b=YL4txRn2qlhT+uU2oTv6ETRcvb01LCDFHX5+/NY8YlfpZc1dyGPCTlzsDhhYMJYi/SVjzo
	BaNVs+Ae2xknLXVw2ELsIEcpBC2HJkf+W910PPujtndnaBo0iEfPoW36/0ufl08OMarNJv
	Sz9S0jsFNViw4zqwJc/Bh52Uf2RHo+I=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-l6QfhAKUMEudCA6IhI9Ixw-1; Thu, 10 Jul 2025 13:43:37 -0400
X-MC-Unique: l6QfhAKUMEudCA6IhI9Ixw-1
X-Mimecast-MFC-AGG-ID: l6QfhAKUMEudCA6IhI9Ixw_1752169416
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb2910dd04so20320576d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 10:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169416; x=1752774216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=;
        b=Vad6cxWOgrs/5dlAtIDFVMsn5v/0dg0VvMnKFUNQJIdoq7rkDxjMgnbh+AMNOU/q6D
         GA/Ly3fnfgUF6fPs7tXiJrhH7FyDx818oYELtKzx4NAEXKY49/kaurndOvrIrRvRPHsN
         5rPsHZv9D9LKQoiM9XSYDgcNAvIPgWzJ98Z5Qyws72XpeDaML4KBywNl/vKNmtruTS3p
         wgk5WHC7s7LD+q1MJ7YWET1HVtVCHcNXLs6VFFxYmvBU7FKzSDcFz+9kEo5f3Ygt0Aob
         EJS/Qkp3fM5HTjkkSeHHHP1f2We44e02i+DGofBv0kWnkqLsRo3cyjtRsOkmi0BKvaAv
         9AIA==
X-Forwarded-Encrypted: i=1; AJvYcCW8LGnyjFiac6Fe+niP2qXQMypE5D6m1+Uujfjb2UIRZrHmb/N0eLw1tlOfXo86HiT3gqq5gzAyUFhSuF648QFa@lists.infradead.org
X-Gm-Message-State: AOJu0YzyThLPUzBZ/J7MnX+YB0fXI0+FvokM7tGSy2u8CNmUC4HksUlg
	9eoPhfdGZRaRffbTIeIvdR+4LMhzwEJCL3YNTtmAEqEymZIGElhOKwBI41kLfoVRpowr2wm5iWm
	nydm67ojLLl+PAwxipgfbxJM0gPDNScOdsN3UPeCD5lhhPVLfDRRxRjUIEN8h5X8djqh4JHbEH+
	03
X-Gm-Gg: ASbGncvAdEdWQ+BqAEpu8J5/1SNLMDV7zwvzAx+GHtWDxbSfwYdaBkbq0e7m7nNYj/A
	ay3vgpPhui9Umno2JbSKHxKiUKcJiuSNiScYGznr3MqNE8uFE79O4zBS6MTK5Po3fY1wd+L+/Ev
	OLyArGWvFZhu/K3qHDYyVNw1fvkCkAPjne+zSSQrhHRsgC/wKESss7t2+DA6nqPlBvFoFhFTnn6
	brSR0ImFVUOGZFalGq9xx+zYrhJIn1VCcCSPiYuYjgS3MTTh4OjfkDiDL5+FNFHTgztJoijerN+
	0GvBUoQ2wfLdb3w68s/ZZrGzFxOJqXrktEpbv6COC0AP15EBrGfPYtx+7Pyb
X-Received: by 2002:ad4:5f89:0:b0:704:7f0e:ca9d with SMTP id 6a1803df08f44-704a3885c2emr3440246d6.24.1752169416342;
        Thu, 10 Jul 2025 10:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSS2Rzm0JfKmIyrTldYCoa+GfaWxjePB16xygyyHje51M4cEE7holVyPZ8C5FzqtnGtvcUbQ==
X-Received: by 2002:ad4:5f89:0:b0:704:7f0e:ca9d with SMTP id 6a1803df08f44-704a3885c2emr3439666d6.24.1752169415753;
        Thu, 10 Jul 2025 10:43:35 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:07 -0400
Subject: [PATCH 6/9] drm/stm/dw_mipi_dsi-stm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-6-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2405;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zHcO3z3+e99osmKzMokPyvWC6/DSceppfY/05RlRXYo=;
 b=QXQyVz/ESQN/1lpuOY+kiAZj2ii+/13EpYKJAuvi9VgjSVMZZp3cWkyo089YF/6/d4LrccG+3
 IcOoOTC43L3AvbwBhN/wVyDOB1m1IcbEamuqRU2PQsvtkEzD5/kz2nO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pRnfIEMr90byuFDmlDnmRgXRLUhTq0oyNUHKKpajkQU_1752169416
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_184341_628800_82FC12CB 
X-CRM114-Status: GOOD (  14.64  )
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
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 2c7bc064bc66c6a58903a207cbe8091a14231c2b..58eae6804cc82d174323744206be7046568b905c 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -274,8 +274,8 @@ static unsigned long dw_mipi_dsi_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)pll_out_khz * 1000;
 }
 
-static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int dw_mipi_dsi_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
 	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
@@ -283,14 +283,14 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	DRM_DEBUG_DRIVER("\n");
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	/* Compute best pll parameters */
 	idf = 0;
 	ndiv = 0;
 	odf = 0;
 
-	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000,
+	ret = dsi_pll_get_params(dsi, pll_in_khz, req->rate / 1000,
 				 &idf, &ndiv, &odf);
 	if (ret)
 		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
@@ -298,7 +298,9 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	/* Get the adjusted pll out value */
 	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
 
-	return pll_out_khz * 1000;
+	req->rate = pll_out_khz * 1000;
+
+	return 0;
 }
 
 static int dw_mipi_dsi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -351,7 +353,7 @@ static const struct clk_ops dw_mipi_dsi_stm_clk_ops = {
 	.disable = dw_mipi_dsi_clk_disable,
 	.is_enabled = dw_mipi_dsi_clk_is_enabled,
 	.recalc_rate = dw_mipi_dsi_clk_recalc_rate,
-	.round_rate = dw_mipi_dsi_clk_round_rate,
+	.determine_rate = dw_mipi_dsi_clk_determine_rate,
 	.set_rate = dw_mipi_dsi_clk_set_rate,
 };
 

-- 
2.50.0


