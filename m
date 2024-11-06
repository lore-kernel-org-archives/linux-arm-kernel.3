Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF087D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk3reyPLNpPW1T5hBq9gLHNsgFGFKl4S7Oe3HhKsMOw=; b=R6kPYYBLozNbDt5iRBNXBxhIFD
	+WntytTwpx1KiyxfJNSPdIWI6DitmErgeqMIUyyhxiCEXl83Z3j7V/rP90bxegYxZhB17m7W4VA9A
	rT2lF5VyuLYmknwunwS1eRhFL3Ty/7BbxJwuSZ6wEpksKEgyJ0f1pL8opcBuozm6WPCXqmgLTVTI9
	/ND/2DLqrj8Gs49qo+apJ/gPGZt0AMNuxLtUMqq6eYyMQWRRoc8YepxHg4bkBDpvQScsfIjN6hMal
	9q7rj/w3uTFsAr2HUxnJpjg00Uk2cjUJcgLgjJe9GP306X+KO1L+PK7LLDhXdFwfvRNom3otSw1+i
	8PBUDQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cVb-00000002a8Q-2LTN;
	Wed, 06 Nov 2024 09:39:27 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bzW-00000002PIb-3BB3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:06:20 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539f58c68c5so11578358e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883976; x=1731488776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hk3reyPLNpPW1T5hBq9gLHNsgFGFKl4S7Oe3HhKsMOw=;
        b=ZJ5bzy19WsL6S8psDvHhGeYC0zgmaK+jolBN6Vn15I+h7Iy4GgIfMB9YBpPxImaMCd
         fjYSSITWO7FdC45kaqBhFxikX5HNlbr9hTE2ozqLIa11bOiKy6yUrB8Fd67AIfPXbAir
         xy1/b11lhywF09uH7N5LBqLd4odUhUcvth3/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883976; x=1731488776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hk3reyPLNpPW1T5hBq9gLHNsgFGFKl4S7Oe3HhKsMOw=;
        b=C9WMRGQPIQnbTWV4yF5RwF7vDQAs/435UOx/+TfUeE7JClWEO9mWJL5Pxsa/DQaw6V
         Gk8Q1S6v6hX+xct99m3MQXtMNYNsVn8c7CpbtAZlQLn9LsHpIyPb4JBSdRRTQjckqNr2
         2jj2rMpWQDwFW5S9IfdE0tp69Byj02NBR70vorvaPnJ7NjrTioHoPO5ToW2mWuLwH3MY
         73Zv6xFowj6+7ne2bhiHQJk8FwBFz1FUj06a9lQGhaWueUZe05FE6xrtifXcBLpkrZxH
         bVpzAc3A29vcWtsRQsJLTVSw7OiTJreFmahabK2eX1MP7JnBKylwt7Bjhxp/2jsPZUfT
         WlvA==
X-Forwarded-Encrypted: i=1; AJvYcCVn8wDxHNKZ6wqmGZXVEablYvxZLpWfoZcHBs7WlQYm5pmR6/Wil8VlP/l+JHFBPbbWkuNgdMeCJBZL7JZ8Phdc@lists.infradead.org
X-Gm-Message-State: AOJu0YyNHScekoVob+t5o/Vayb3S3zZl/az8l9wAwLkwtdtrHExOvye3
	buiASd0SNthNw1XQHHdk1xnmiy+JE6GPDYLS4N3l9E9kVWKwMTD7WyazXJMaNa4=
X-Google-Smtp-Source: AGHT+IFfiGc0K4IbypV9SvZMfMNxXdKGIpD8FKjB2HVHQBbxWo+3XOmyQxGHdE3l/c9HDP8UE/3JzA==
X-Received: by 2002:a05:6512:159c:b0:539:8f3c:4586 with SMTP id 2adb3069b0e04-53d65e16881mr13255338e87.55.1730883976448;
        Wed, 06 Nov 2024 01:06:16 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:16 -0800 (PST)
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
Subject: [PATCH v3 6/8] clk: imx8mn: support spread spectrum clock generation
Date: Wed,  6 Nov 2024 09:58:02 +0100
Message-ID: <20241106090549.3684963-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010618_879450_096B844A 
X-CRM114-Status: GOOD (  12.31  )
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

The patch adds support for spread spectrum clock generation for the
audio, video, and DRAM PLLs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Use ccm node device

 drivers/clk/imx/clk-imx8mn.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index feefc9ef4f51..91b819d1c523 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -322,6 +322,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct device_node *anatop_np;
 	void __iomem *base, *anatop_base;
+	struct imx_pll14xx_ssc pll1443x_ssc;
 	int ret;
 
 	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
@@ -357,13 +358,18 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_ARM_PLL_REF_SEL] = imx_clk_hw_mux("arm_pll_ref_sel", anatop_base + 0x84, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", anatop_base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 
-	hws[IMX8MN_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll);
-	hws[IMX8MN_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll);
-	hws[IMX8MN_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
-	hws[IMX8MN_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_AUDIO_PLL1, &pll1443x_ssc);
+	hws[IMX8MN_AUDIO_PLL1] = imx_clk_hw_pll14xx_ssc("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_AUDIO_PLL2, &pll1443x_ssc);
+	hws[IMX8MN_AUDIO_PLL2] = imx_clk_hw_pll14xx_ssc("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_VIDEO_PLL, &pll1443x_ssc);
+	hws[IMX8MN_VIDEO_PLL] = imx_clk_hw_pll14xx_ssc("video_pll", "video_pll_ref_sel", anatop_base + 0x28, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_DRAM_PLL, &pll1443x_ssc);
+	hws[IMX8MN_DRAM_PLL] = imx_clk_hw_pll14xx_ssc("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll, &pll1443x_ssc);
 	hws[IMX8MN_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", anatop_base + 0x64, &imx_1416x_pll);
 	hws[IMX8MN_M7_ALT_PLL] = imx_clk_hw_pll14xx("m7_alt_pll", "m7_alt_pll_ref_sel", anatop_base + 0x74, &imx_1416x_pll);
 	hws[IMX8MN_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", anatop_base + 0x84, &imx_1416x_pll);
+
 	hws[IMX8MN_SYS_PLL1] = imx_clk_hw_fixed("sys_pll1", 800000000);
 	hws[IMX8MN_SYS_PLL2] = imx_clk_hw_fixed("sys_pll2", 1000000000);
 	hws[IMX8MN_SYS_PLL3] = imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel", anatop_base + 0x114, &imx_1416x_pll);
-- 
2.43.0


