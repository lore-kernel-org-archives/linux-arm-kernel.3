Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB990E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=; b=GHPwT75f5m7Y17As+bOevcfddg
	R5ovLeEjRTFt9vshaHVR/Xv4jmKyO3/SwtzIaQ7+jQGbWEnZOdBWTVitiZMVhfdFUgtAdDGnLiJrR
	5736v4UgSIV+hZl12tOK7Y2BYgxC8QAv0e+ap8As0JygDOJl4XTJV6hW9Ob23ZZYbg+xsgXuvn0H7
	rr5yShbLV1PepqTAOKkewk1b8PqFGUyX1kjMxps2ZX3kiLH+NOlyM1ysdIM/FUXwj/6KYk49EwZ4R
	OIOYRQ7ciQEn/DRn0QYalzHHEBb8bgZToybxKdOweGEZ0mt9mFYLke3ZqstTaHl1BfanEVMoDX865
	7rOxxiQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAEK-0000000FkuN-3S7h;
	Thu, 05 Dec 2024 11:41:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9u6-0000000FgnO-0ijo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 11:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=; b=nWrcXeO5Ac7oUX8ZJQhyIOpFds
	/+pDL8STxZ8U92St2rdH7IdgXCpBznFeJyMvdthfaCyFXnNOvNr8niWRwTrcRKdEa7MADw1G4buRc
	ThD6t6Q3xgJydaPvTkvgJFjSWXIORfqQ6Zo0qNE0B1h+VQBn1AYZbOUQk3/SFDzNedS2p8N8XJskX
	/AdA2PoEp5UA84nV18L5+2QZa63gEXBx+SM9osXotJROakElJizAZEm3YgbWyHVK8/KQPqcc6pfk2
	Z7I7D48/UVVhliWfV0oNxVnXq0Vc+vdcLVv5H4uTvlg3xeWQ6fCDUdBbpF9ScSF93R1tIJ8ZdSBWU
	M5gs4Mxg==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9u3-00000002rVm-0l98
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:20:17 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa629402b53so77591466b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397612; x=1734002412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=MZNKLmToq/cCn4AoD9aQ9kR0h3ymBT12dJ2haf2sXEnBOYED0vhJhD/bY1aL15GU0Q
         Qyij/CTD+XjWuCkA1jglNZRWR/SjABsIZFdWGu2eFYTZ//dF7+QOlBzbkRbS5epWyNmr
         q0gXMK7Tw2Ao/O9AyFXe0FFCFa4KskKkOgXwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397612; x=1734002412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=u3AMK4aw3ieCHsAhZbKkqnYTFMyChdOHBJ9EoF60yb/rSNw6dOa3zeLkCuEjgAvWGo
         fSBdkK9cmynnCA4IF0rDnsJDnt81Zo+bbKwUMrEp/uEnEzdsTZxRM3qbOOg1omu7DrpP
         NntO+izf1+Z3sarafUnLZdvmGyBof7UhT4Ml3U2evmCz8V3C5IbSbptsyIT2R5dSlwRo
         Lp7POYU7ruC7bhDPDWriIgSA+iRZ4fQJz6l2xw+vD73XR+n3h8QBWrCaxxobchdX8uFH
         TrvdBk/SoBSEfSAYt/RxRMphMkcWMDe/EaPKP9UJUjfhlBLbYQ4Zio32CoGBOGdKvfo6
         KEQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0WSwqNOXL03oMEZdSC9LQ7QRPiFGVnBaJCV0fkS0xZD13uWi8FMMJVcrewZxR94g6lG3mylOOHS5wRId1MpAF@lists.infradead.org
X-Gm-Message-State: AOJu0YyVN+BVGVFgI2xKcup8Mum+aGBAGBdXRxtTrlmRXemLD+vKepsq
	i7TFQ0er/XT6gfUH5LYuNaBPSOV7wIiwlviPCvFWtwuuKgEGAvORMdqPwc5w4HA=
X-Gm-Gg: ASbGnct40mVZaBZyXgeVQgugIqxSCmTzckjL3P87sQg1Sy0R4wjbtX8Auw1MOemchFQ
	UaF5WxJC77U2/0we+txs6vUIeQNv3naN/w5ldrGqGh1UQ+RHOZbAYh39GoXu/+EjyaMqXgIl+up
	F0nua2W5+/yemQfCDUJ7S7oepBbeTAG3mkDnXcRtHH+6hmNSklzbv4HCMkyFHxxXAGGVo+vRgmd
	qBWGiWxIVHE5vv+pbikJZdEi+hM+ByBp5fPMxIB+cbPVS6hgqVAHtJFjKxs/7GNd/4YLiGq0OUX
	18oUS7S8gM4SK9MMvnQQnRpk/GfkFBkdPRkwzPY7XAyoRw==
X-Google-Smtp-Source: AGHT+IHkC2TdsvU53Arf9R3rEtIlqqSs2877Q+gumRy3NT+TL1A68HMegWO4XXkwBKx6SpYDp0zrGw==
X-Received: by 2002:a17:907:7841:b0:aa6:2987:9a4b with SMTP id a640c23a62f3a-aa629879b08mr105608066b.21.1733397612146;
        Thu, 05 Dec 2024 03:20:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:11 -0800 (PST)
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
Subject: [PATCH v5 20/20] clk: imx8mn: support spread spectrum clock generation
Date: Thu,  5 Dec 2024 12:17:55 +0100
Message-ID: <20241205111939.1796244-21-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_112015_339737_C1469466 
X-CRM114-Status: GOOD (  10.71  )
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


