Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F77D4977B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=; b=2pdBnThuBpOiYuOq20nKm2nCkL
	opuKXj1fjSwhAKInGgrzO9K7hgxK/O6ImjPkRrggFCyo9OILh+t1+tsv5VFKq+VL1bQpitn2rbJPY
	ZowBfIZ9J9aR3XTgw+DJATWf3dJZCh9NJ651R1R3ytr4hzf7/8onTw9+Q4uJZCihvgdWtGqwyrMKx
	h4Fmdw0zo4TM3uR0RBmrBpsFkpI7sLD1SvfsOmyj9SOgDVjeINS++K1Z4I41ke0jy/9iM7jOoMi5M
	9vkfu0yOXOd6U/QB8LGXgy7c/8HZZrfdcTnQi1Dn7aMHThrdW2gv1ytYJh+4DIa0RXTQV8co9M2Um
	DjXJNBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHoKf-00000004BOP-2scZ;
	Sun, 01 Dec 2024 18:06:09 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo31-000000048d1-2Kog
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:56 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa560a65fd6so600348266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075274; x=1733680074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=m+thC7bHnzKZtuWOxVGw7qWopPSvrpZFxmMvAK8TLfcE5MHJ9q6EkVTgDm6+Aq79Gd
         /uv3FtXDY/hrNY3RAnduxee2jNsvO/eQSnNl0okfxEI/JRiD0Hm8P2fXZAPyHElkHzDW
         DrT0UiDoV04o4z2LzXt5G9YdNBi/bF4LovvPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075274; x=1733680074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=i3GX003ehwxv0NDWgs/C5fHgR6VZxvg4ynKHaVzj9MyGEXEI5mFuEIgvPt2i4mi3nG
         A35+T6LS66VUbUcqaormGNfgqlOJQ7dVSGScfG9Jg4VmVczNSbJH3/sT/1f4Sim5u1ph
         92V1LJVli/RyyoNBUpJu8atUYF8063kP19Qetg/R5VhXT26E3epWRFrndMaRXLT5fpj/
         TUVfoZXuvSG3G/PBh5xSE+z5C+ncHDG0KWZOnglPSVjms2cedkyR0Bfn4hetPwJ89xDu
         uRdoRKWKMF05CCAd2vq7/9VlUXqjOHiFYuvlENuDUSrSHFLcXacRtO20njS9tqlnGQKe
         7tyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhhfn1Fi19Kc5WVxJ6xNnLWit3guL/3zj4+cWnmpAzfrkXUvsAvw6Qy3glE282uHTXacQocDX9gSV/YqR9cvNy@lists.infradead.org
X-Gm-Message-State: AOJu0YwoR7G8z6aYJVZLIOYFqtvCIEv+YppUaHyEtQfiF+dI7T2Yam5C
	tb21Q/w6/Yip81w7nMO1OALcgcHPOHMxgvk6VIqXP7OzBK0nI3aOJO/WVnKscOk=
X-Gm-Gg: ASbGnctAfIQAyx/KrWm9/MJGD2gYyqO9Dqy1M0yhJITS3tArqeLpgaM9M7hq+3BrFg+
	q39M72t4rq8ZkRd5KjE2uJO7w04XhXhNuSWYLOrhOUGj2p2Y9gCneiMaJNDAAv/+VoC9+DRNZdl
	kjqlc3lNMpZsZFZZVWaee75vbtj1hJivqMwlir7uI4OgdIqwdUW+4Tsxf3jNWMgwhUJOiID3GTL
	NyM+FQXRXrxpOKa3B4cOPLjO67Wo0rPfhZbnM/9BECYONhmKDN7JKdTUSFDJSbSqcHeR1DPCecz
	gC51cth9uWyHbFNIzqkyGl95LdR+uNqGyaEoQ+q4Sd6FY3HP9MMqnRzTU5lhaxRUNAMf8psNZ+c
	MHw0Aw/Ub8QS/ONKT
X-Google-Smtp-Source: AGHT+IEHR1z9laXzqUjryQO8q5Ffq5yH85Q8LM2nOnrBHdiW2uHs2gYFItB4lX4kLCeuRgS8cGojqQ==
X-Received: by 2002:a17:907:3683:b0:aa5:500f:56b3 with SMTP id a640c23a62f3a-aa5945ea088mr1602165966b.18.1733075274323;
        Sun, 01 Dec 2024 09:47:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:53 -0800 (PST)
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
Subject: [PATCH v4 18/18] clk: imx8mn: support spread spectrum clock generation
Date: Sun,  1 Dec 2024 18:46:18 +0100
Message-ID: <20241201174639.742000-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094755_594076_4B9EDE27 
X-CRM114-Status: GOOD (  11.06  )
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

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 588cebce6c9d..c61368e724f7 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -338,9 +339,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MN_AUDIO_PLL1] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MN_AUDIO_PLL2] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MN_VIDEO_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MN_DRAM_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MN_GPU_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_GPU_PLL);
 	hws[IMX8MN_M7_ALT_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_M7_ALT_PLL);
 	hws[IMX8MN_ARM_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_ARM_PLL);
-- 
2.43.0


