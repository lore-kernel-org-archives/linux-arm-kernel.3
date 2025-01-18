Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057BCC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vDdCPdsn7drrDVs6gkBxF2bAHBnCBAUvlTFeTtU0PY=; b=rogN3GfDWlTuJemi/AOb5sBnGg
	d17uWuAzB0UQMW4h9m0tAF2hughmfIxfvwE1A4zr7//bQKXXCLU050RUhe/7AEqhF/Ll9t6KDOFZn
	fceCUgo6dUqureuinfsyF2lC4DqkHOmKhY0vK03NBpZb5caV1GC1W1AVNZnzZh5ChM/6ZKBwziNY5
	MtzlCa0L0R2lfAYg+NbEyKlKnh5ryuJGioaL5sBwj6TzGRZmgkMgF5KEKMqHR3MNiSGHP8cZgUuhM
	Z3pAhCBKMNCj8uSt57VKF1nc/XSRE4e5VfX3OJU9YjeRFSwHFtwFVlkc0nDz0Ut3uABAkfQXgdq7p
	xUumOcfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8Zb-00000002RWq-1Omq;
	Sat, 18 Jan 2025 13:09:11 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88l-00000002NJV-2Gmh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:28 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so5354483a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204086; x=1737808886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vDdCPdsn7drrDVs6gkBxF2bAHBnCBAUvlTFeTtU0PY=;
        b=Bwqy0XONc9lpdX9/om1NjMrYgrJ2TrsmY80oo7WYfly2VVtnnkCNU+qHHRR4pK+G3D
         pD5EPqMYyE5TJKGW5uEsdQKKHTatDbU+iyRZdgejn9m/dRFKUk8k7SvUwLjuRydiIzcY
         8HCSgdxe/IwINuIn51HxVpudSLIkKtM85xdpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204086; x=1737808886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vDdCPdsn7drrDVs6gkBxF2bAHBnCBAUvlTFeTtU0PY=;
        b=cXUH888HBQppf+SPNQDWjGoD+r/6MZikJICUb82oq18rOkgoAJh573NzhWhEfOiwfC
         d7OZRrHc9DGxko/9v6TsxLSRJSGCpsJ8/A1vkWsXn31usVXQz9CHwnZ7SRoKWYW2Czwp
         RQXaVNeHY4z32hcmaDR7o9gs9plNxUERrkYr9QGRJDTFNevKzJ5huRb0ojvAAUt0nelM
         t6I1yIzcBMEQ8yZUlR0GKJtK+KmUElhgR0NmOeBcRmiZYH1TSPzroeBi/W4kfaxIw2Og
         4bCGXCDfdI3Dfbqs3Vok7j3bU1FASN0wuTd/olqec15Bg/lXsj5JBy2y/msJjNX0Bw0/
         LgQA==
X-Forwarded-Encrypted: i=1; AJvYcCU1H5hYq3sa08MXaawh7aWZ/UzRV+c1+JNm294UHbw9DJV8RpLBiZAGPLO5MPJfts162eD5O1JFTsycqKXS26TJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz8Yms3100PNO8q6tcJkgJme8K42WASyqDA/hIIo+nmHyoDDoL
	3Bs9xeuSoiTBQJzEOhkNOpVL5cU0PDREp8xsGm+PS8NAN6QKoOcLQU3rNYGExrQ=
X-Gm-Gg: ASbGncvHJ+WdqrcdFa/W0OvjqI8fcfNy9q3X4pXoSbfAuEHExsDURC28ditQH/ydiDz
	tIKQYfdT6HOwb3RSA5QBBMTbU01z+q67wEZhyxgePzPKVqcBb5T11EX13cTz8P+uDlCBhnXCydl
	t6uP2hAh8hSwqhcaNBx3+kp6V7ZjxBFUppb8JxnswO73H2Ycvg5UKwXx4eyZGI9nBNsYoK8gvRY
	AQNAoiayOQfJd9MNE5z+mEo3oYHNIfjld8+KvVhUO7iHDyu+lQfmpBT0rXrRD+3ShA/8ZbeeQE8
	wJ/YrqvF6XO8agoZ5B/nZtTngJfpstWS5wd5mN9Lob5MRLKUufRAZ7IP9cZgb/1RMjsFuzhQpah
	XcTj+XpMl2Bn++h+V5H2VzqY+spU4K9UXm0rI
X-Google-Smtp-Source: AGHT+IGXzRigtXsPzj90j/78YQbLG+CGAnKWwF2PQgfEJZOtJnmpVNVhi1AoGMgITGhf4fbDGSnoNw==
X-Received: by 2002:a17:907:3da0:b0:aab:d8df:9bbb with SMTP id a640c23a62f3a-ab38b42d8e0mr535640266b.41.1737204086146;
        Sat, 18 Jan 2025 04:41:26 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 21/23] clk: imx8mp: support spread spectrum clock generation
Date: Sat, 18 Jan 2025 13:40:04 +0100
Message-ID: <20250118124044.157308-22-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044127_575818_2BB4D6AE 
X-CRM114-Status: GOOD (  10.92  )
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

Add support for spread spectrum clock generation for the audio, video,
and DRAM PLLs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/clk-imx8mp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 012cd3b52e3f..560f51d9232d 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -393,6 +393,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int err;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -432,9 +433,21 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MP_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MP_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MP_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MP_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MP_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL);
 	hws[IMX8MP_VPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL);
 	hws[IMX8MP_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL);
-- 
2.43.0


