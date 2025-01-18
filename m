Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04601C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJL+gbh4MVrHU+PAYDL4LrbInhBcvCC67N3SxstDEjg=; b=vHou/tZfxMJK18sIflwzsgUlmH
	IL1GakOwBUc9NeayIK+pDqOiFeQtGCwzptLA8rQk3JOq6TheNaEIvOUlqSDluRS0zkxTAubppOHsk
	ALHZG0HKWS5qJCg4PGweNkHtcST4+HYaZh7TZBRoI71SNIYn6QdQgAykyXa64D5OTT5ZZAMe8Jo+5
	y6O+GrS63+d0PvmeDGhxfKilLXJ6rFSf2JcCY8KVPCZbaaqQubsp3Q6Z/RJIiW4bb/wTvW+NEbnNx
	7hZwYup9xX28Lb/5ayfqFPovhMG9kjm4umXjr0dfb/uki4Z96WRrec/cIV/6E8LZvo4MH6isRpVAG
	Q66gGHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8Vs-00000002R1m-1NA8;
	Sat, 18 Jan 2025 13:05:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88h-00000002NHZ-07wR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:24 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab322ecd75dso535727766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204082; x=1737808882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJL+gbh4MVrHU+PAYDL4LrbInhBcvCC67N3SxstDEjg=;
        b=T630Z35rSduAAd+fv+vcWRxPtLqJ1rikEbf3AwrDYMsB7EFQR23o+550O27tdq4Y1R
         bcsV4Gg+dMseQAwOK/OkRAFwEnl2HcZhYioApSKp8jqmkvs0a3NufoZD6NHwvTsCxo1a
         LjNkhrclj2MUOPKThJerxw7JSDE/jDvik1k+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204082; x=1737808882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJL+gbh4MVrHU+PAYDL4LrbInhBcvCC67N3SxstDEjg=;
        b=gKeDbonhOiDgZRDXKjfEi+iEGc5NA3YeqJuXT7AoTqpsaogmgu/mtjelEumBZcNbCM
         KTSdLaSGz/nxJontWkCKAxe6OZN0GdhfJY40DJdutBG0Jm90BwxDcrlXENzyx+iUTwAy
         5sP1+9RxKI5sa0iE995wEV/mJsEw9AKfkXgJ7hytyEhtWK//NohECY9NXrieZrQ/DqcW
         hq/TIk1Keoo5m+El2FHoCXIq3kusbrc4ojCxcjiIE3Nm9TnkhF5KWu/nq/4e1/rbX3Qc
         Kctds+obT+U7tZqrtdO3enfF342DPZWqXzbn/ARFovoaGeyvXX5XOvvnJDxmvpfHAaZd
         ui6g==
X-Forwarded-Encrypted: i=1; AJvYcCVfqRP3h0MP3jDqciz55LCdLScNLNzUfn+kAC7qGpjUCJTUaL0dvxp3KXH6D0wsKMgj67+Wfs448M36Seukp8nO@lists.infradead.org
X-Gm-Message-State: AOJu0YzRJkaf5IW1yro1hycgdxWflwIdq5koiVZBplIXTRqjkx0hZtbU
	+/aA50mHMr9a2I+JaBY3Wx2zVPBmi8B49+67r8XuHO32shMPP3W126iXEyTnaXs=
X-Gm-Gg: ASbGncu408xkptpPPYnoozUyLDqAPchk39tyloxe127cctitK87izXzkBWINEZayTE9
	gmxgVsiHjHlGapAyZGvHHdy1aANFZjyLOg4pNouIT1bfXSt2R5PxOY/+O/g6mwwMElebbPdEBFL
	XUCZbDpJHzIjzbIiVp3vHJcHZYx2l39Yu0bPx1TX306Ml0bpqO4jdG4KpCTZlrHI5i9CVZiH0p7
	LNhwaS6kLPJAW/UhpJHWJBifKXjlL9/a027bYDsfV4mxBgIOp86xIgGdQaLHC3XBHm5YIixdjfg
	9c2Dj1rHKaXirJlpSKFw7OlCZNW8/yxSlAqSqr0B0nl35nVOgGRjOdwiVQRoHItqG5McYZzvknY
	zJtfjb/fRySSy7+mAtB9vccuLOw/K2mIVPR3G
X-Google-Smtp-Source: AGHT+IFakVVyb3qn2Ua9YGWtJbN5eKC5RFuNg5nEGxiu48GboLMu20VoxuWeB6dsBEEmvDx4fcRxwA==
X-Received: by 2002:a17:907:971b:b0:aab:ef03:6d46 with SMTP id a640c23a62f3a-ab38cbabdc5mr485286466b.4.1737204081750;
        Sat, 18 Jan 2025 04:41:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 18/23] clk: imx8mn: support spread spectrum clock generation
Date: Sat, 18 Jan 2025 13:40:01 +0100
Message-ID: <20250118124044.157308-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044123_069739_7DDB7EB1 
X-CRM114-Status: GOOD (  11.19  )
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
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index c3a3d063d58e..090b5924fa01 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -344,9 +345,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MN_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MN_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MN_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MN_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MN_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_GPU_PLL);
 	hws[IMX8MN_M7_ALT_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_M7_ALT_PLL);
 	hws[IMX8MN_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_ARM_PLL);
-- 
2.43.0


