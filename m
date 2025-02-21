Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8560BC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOMBM0/LptOoZWpnGTFXn3VuyeurWEITTiZxZ/wflWQ=; b=XjHTR54q5T/Xs2Px4mwrEi0qud
	LuXAyn2yfSYdGU4Q4k0YyaFpobSRzhjgckdmvV8+GSzdSg51uskGBUlMSWs+Zfb4tow98PixQN8ff
	AXGK7urAxIANhy/SaHgseKcFUBNEtPlcmu5uzVrntqU7v+z7BQoJ80mYxYfEOw1EIMLbaRK4xn2JH
	CEAa6JUdbNLubiz/xN61WPiotYcZcE6cscAQMESSg8IOBSc5QROqEAhXr7e/RHILm9V8R8OArbJ+C
	PKDFkwTOXiw0sKlAa0pgjlGTJy0BvuwxKgBUesF4VGV8hKDK4ZhfdTKyKdTFgvKKJkgHFTw0+8564
	I2PxqbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYTv-00000006cPs-1nAi;
	Fri, 21 Feb 2025 19:14:39 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYPf-00000006bW2-16jN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:10:16 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaecf50578eso479606766b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165013; x=1740769813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOMBM0/LptOoZWpnGTFXn3VuyeurWEITTiZxZ/wflWQ=;
        b=PCFXKI7AYVeONOgHc/70GwgDePXT4cDTMn0tczjpKD+npQQju4lZCvyRcwNV0UY/fs
         i/m5F/K4zjlAMnI/GvwwKQHrLYphDejfFIjN2vaCzLdCoZS8MrV+xp627FnBAW9vwqaP
         iFYZLDY4BJ+HtrSYcEupdBbBPCtPfbHHxOya3BOnLISeo1DAUMTPrAkHr+vNuiTGDjz9
         2t0qdz/IqZqCN0HfAGvRSFILMbgtqdVNFKTyiNmnYaC35EnMmYjJr+mB+cs+Lm9k2le1
         PB0ln5da40yCME5+fjPjJCOH98GBeim9582B7CCxIhw8zjX56jDV+qlFBcqvshs78PH0
         3j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165013; x=1740769813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOMBM0/LptOoZWpnGTFXn3VuyeurWEITTiZxZ/wflWQ=;
        b=a3S8IH42toIP85HYq7ior8J6s/A3qY3aZ67hcSfx1ThmKJHfBa9as68K8U7z/VeFi9
         fpcT6y3QqHVqXASN/wPULco9BXA18xUh8PUjsq+e/mGaHftMe2Q5FtKEHFxeCLP4jJ/E
         zQAksKxincqMF9+EHqiuJijedndG+V8N7RfXh/44tiCISyh4vSdV4arYKNWfPL9C7DvP
         JLoIxS+Fu9+VKnmCjPdGiRbbt+2QjfSDJo8uih2RP0kFFW1SopIDcc+972LFMvEIZ0IK
         oqlxedK1yGoiS3p/H0RKHUk4sCdDZ6Cx4ss1aMbtw6vn2gTsTBwqBAJUwAOE2FgVKPpN
         RrRw==
X-Forwarded-Encrypted: i=1; AJvYcCUB8Jt8XUMHj9W0AvkAaqTeZGo2aIqoO+zo641zvYJmKh8WdBv7YlbIIl1t8qgTsRCJAIY1PrR1TiTfQk/HKOXX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4fxPF+PLjv5ZbhebhrkyhRPs1yX8TzPw4ulPKZ0htmR1wPqEJ
	ZcUFZEU6oHC60z4jQtbrVoC62Tm7gYis0eLq90mW6zFqI4ZTZsXb
X-Gm-Gg: ASbGnculWYNk7RaFW8444mPE9sZGFNbzIwdEZjrBXNAKDDhZtsxY2QIdUMpbQK6W+UR
	8uXAhrlgyCCaqfBr4v240AqtXxM5Ec4SNB7OARnOqosiiAccKSDrDRGwhJztUHfAEthec5L6seb
	bWBMWsWtysxY4tSAlbxa+ENQY7WmaqYjWoinkUj+1BqXVOnQSo3ckieI0dIe45Y1m1DwLewPPsY
	5XVeA+vonMw8m9qwwxffFEYYZ9Qs4eTIIef/zYN5iJl6M6LCcQj1j0LFUV6pQWOp6n73FPPpQLM
	ESCWnYmiXcfrkpyZ25m300kgMSiUQTuj4dLaHSWPWuKvz/WySftGpocnVBw=
X-Google-Smtp-Source: AGHT+IH9dIYGKpfakCpm7QX9v0EfX1043+vTXy8S2cvINmOR+ptJQsFSlwJ4jw24HVfPeVBX1a9vlA==
X-Received: by 2002:a17:907:7285:b0:ab6:ef94:6054 with SMTP id a640c23a62f3a-abc0db35708mr483073766b.33.1740165013278;
        Fri, 21 Feb 2025 11:10:13 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b187203sm1027261566b.61.2025.02.21.11.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:10:12 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
Date: Fri, 21 Feb 2025 14:09:27 -0500
Message-Id: <20250221190929.31469-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111015_303459_E1CFBC94 
X-CRM114-Status: GOOD (  11.70  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP and OCRAM_A modules from AUDIOMIX are clocked by
AUDIO_AXI_CLK_ROOT, not AUDIO_AHB_CLK_ROOT. Update the clock data
accordingly.

Fixes: 6cd95f7b151c ("clk: imx: imx8mp: Add audiomix block control")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index b2cb157703c5..62a180d6f8cb 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -180,14 +180,14 @@ static struct clk_imx8mp_audiomix_sel sels[] = {
 	CLK_GATE("asrc", ASRC_IPG),
 	CLK_GATE("pdm", PDM_IPG),
 	CLK_GATE("earc", EARC_IPG),
-	CLK_GATE("ocrama", OCRAMA_IPG),
+	CLK_GATE_PARENT("ocrama", OCRAMA_IPG, "axi"),
 	CLK_GATE("aud2htx", AUD2HTX_IPG),
 	CLK_GATE_PARENT("earc_phy", EARC_PHY, "sai_pll_out_div2"),
 	CLK_GATE("sdma2", SDMA2_ROOT),
 	CLK_GATE("sdma3", SDMA3_ROOT),
 	CLK_GATE("spba2", SPBA2_ROOT),
-	CLK_GATE("dsp", DSP_ROOT),
-	CLK_GATE("dspdbg", DSPDBG_ROOT),
+	CLK_GATE_PARENT("dsp", DSP_ROOT, "axi"),
+	CLK_GATE_PARENT("dspdbg", DSPDBG_ROOT, "axi"),
 	CLK_GATE("edma", EDMA_ROOT),
 	CLK_GATE_PARENT("audpll", AUDPLL_ROOT, "osc_24m"),
 	CLK_GATE("mu2", MU2_ROOT),
-- 
2.34.1


