Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE5CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=; b=RNs3lHYMlr1k/9KWR/th2NoQjH
	saQqCJVPAMsWj0eCwLpJAezxmExVR/XLE7u3O19WAi3umUgxDrXT8ciYRrtvdT3gJ/QuoLMOAO6qo
	mP8OGFRMOCh+CreKeLPsx2MxtgXP7cE3n04UdV7dN4xuvLsC/h807HhLG7eA/Fr7j7Ii/X0ZtUbMo
	SjPIowSyv4QUyccpIZDtJaRFs4YlfdjHD1hUa9BZZ/GeUBC2d6dsJuoy2AOXO+pt6jaHRuD+iDKrH
	ESaw86j8SzmQQkMYIbmw3akJVxn2VaLJJNDvFLzRXM3w4eiiG5pgaGYbZBxY4EuQiKT15BaZBRWwe
	CL2iGWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHm-0000000CyoL-2teV;
	Thu, 10 Jul 2025 20:54:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvIp-0000000CcIh-2IQN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=;
	b=B+6OjqfQc7p8lwXolVXwYI/sb1mmSew49ZKRY/KEFppN5CIQOX2tXqR15/HBHj8Iyhiy/w
	zPjmigVnLuQuNw8K+YqgZwb4FkLf9h76UTuRQVA41ahpiwjgsdo6BcLdBctGGtqYANHUlm
	R6LGc/pNG5eddjJzwH+hFdoOer6ePn8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-huyc-Jr6MnCL4YTQdK3iZw-1; Thu, 10 Jul 2025 13:43:21 -0400
X-MC-Unique: huyc-Jr6MnCL4YTQdK3iZw-1
X-Mimecast-MFC-AGG-ID: huyc-Jr6MnCL4YTQdK3iZw_1752169401
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb5f71b363so20699376d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 10:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169401; x=1752774201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=;
        b=w5oy41Imt1di7IXNgDAmGI3NqF8gwbH8CAzBikQAqOWk7Nmv5T1RQcA2VUNXzWRcS5
         S4mhK2s7zdwPjjFMzxk+P4bNw85wm2DZ4qodASrjr+crq4Lp1mPX6Fc5Ms6mKX+jOICm
         /cwLWzGw0fz+VPQoYW5qhFeFCch8UgICdeQhhf0cuItvyoMI0q1cm9FHvKVlVOPnMeww
         C6W41DUrYWISWz4+CAY8/Da63EVr3+ydLt0thbzPXW1RK6TvWoJ3WUncKNmvCdHrzmEL
         I14oN3nRJfUrDaD0rjS69gxSI0lN1wB2GfI4LoEOISbCrnX+vb80Z7ZHsqtxNKcUt8gZ
         k6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCX4I5O4ST4eG80VSbbCW+htCb0OEbEBiLvCIHeWBUnEV2LBGTvdgla2Cj/El5ljxg+cTByxNot2dlKJdNEGKw9J@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9CGBqZUJq5+RtEX8W9Sjjj1Rxod835lFHbtbq4lMSouxmyWRJ
	GEgmOOSz5IZOWefiept9XIAitZKgfh+IiAEJ947sckbhR13op5Lx2dMd1W5SZ9xpcJIWePp5zQX
	je8doTYhMhtZ31oP//YPbN//K8TcOZMM5S4GFAqQggYFX/tL+Kiryf1zefd+KxRf/Xt6tPzCjKi
	TL
X-Gm-Gg: ASbGncuEfdTh6mfUDDCK15oMsLzncTdky1w6lxZ2X9UbO2Q1D3JKuFxoRpS5d6SWxq2
	OdNHG5zFNLgfXBOQZ/ieDEHWPTq6vVW8osZJLfmU40P4LFzvVLEWpJpMdujv/M2SPs9MM72GjG/
	HCrV1nV9n4AWVXdcuWTQzcON9lJi8WiLdWbAo+VuPCgoAJOregROUb/iU9dhDNWxZeBP511+ZtL
	SRtD59XFFM6/bjd6Zpv0xJmyLjyjjLFxQfzCL4RVrrJUbhdwJUnzOGyWeP43k7xkfGv/SYLEWpH
	1PsRVhsp9+7ghBfnZMU0Xh6A3ZmkIA8ROvpZqtwrOhVLYH0+MW3lZHFqQFJL
X-Received: by 2002:ad4:576f:0:b0:702:ca9e:dba6 with SMTP id 6a1803df08f44-704a40f3f86mr2464496d6.16.1752169400811;
        Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGneFeZHD+R2IlA/RJ8povEc4F9IjcKH8Fgp0p4dCYgtfr/rKSizrHDLTlvLp9E8FfSRTeZdQ==
X-Received: by 2002:ad4:576f:0:b0:702:ca9e:dba6 with SMTP id 6a1803df08f44-704a40f3f86mr2464046d6.16.1752169400264;
        Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:02 -0400
Subject: [PATCH 1/9] drm/imx/ipuv3/imx-tve: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-1-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1689;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JMQuzI07hiKrV1ATnFggAmht1J6rMxSCqpxpi2ExgQM=;
 b=2cWi9RxWr4DG/uT+Adfe1rLsJLWqf/HsK4V1CHvsD1HqS0tzYLionTpIhnP/uRurPd7gfFmll
 2lm+LwJba1xA78TVoaKVn+hJWZX7dEn9fhckaPz4uGeZs+gsOpWRugK
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BHoTGPTKCGW7eCaTsxqGkLmZjKuVcEgc1OTecUs5AAc_1752169401
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_104323_668375_C394B684 
X-CRM114-Status: GOOD (  13.64  )
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
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index c5629e155d25aef5b43445bc18c6c90039c99974..63f23b821b0be66a8e8a379e1375ffd98552e72f 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -368,17 +368,20 @@ static unsigned long clk_tve_di_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_tve_di_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_tve_di_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	unsigned long div;
 
-	div = *prate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div >= 4)
-		return *prate / 4;
+		req->rate = req->best_parent_rate / 4;
 	else if (div >= 2)
-		return *prate / 2;
-	return *prate;
+		req->rate = req->best_parent_rate / 2;
+	else
+		req->rate = req->best_parent_rate;
+
+	return 0;
 }
 
 static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -409,7 +412,7 @@ static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static const struct clk_ops clk_tve_di_ops = {
-	.round_rate = clk_tve_di_round_rate,
+	.determine_rate = clk_tve_di_determine_rate,
 	.set_rate = clk_tve_di_set_rate,
 	.recalc_rate = clk_tve_di_recalc_rate,
 };

-- 
2.50.0


