Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD8AD3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eK2D5YdiBqlMNYfxLWNo7UJDqbeX8vHqHTifMmfFsII=; b=lt0RVBmNwwwic5H2tihp6LVztK
	RlT8tD835vCtvT9Arz7oDDl5l16LfXgfeJ27mBmjxs4nug2BCaiQeEwaB/1sbC6BmvNvcBueHVLpB
	jS+64yjF0IJpfZ/E1avSa24l15JTu9OZJ1G1fSzWs9PWrENNo0Pk8mKRaVjZp24g5nOEP2RjCwrjr
	GAnObCPHcRbHc9xtH3zI0IRZlMWR6H7qHAioyX3UidKGmewPazSioaZOneQmeZpIB3C45dCVkzOdV
	JQpOj39Elyunjt8u1vefgc1N9zzbPRIoZRw2RALokdosNjYtsG5ucqDXhiqL0arCtl2QFfoLBB+Gq
	+2ZDvfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cYz-00000002b0m-3GAZ;
	Wed, 06 Nov 2024 09:42:58 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bzZ-00000002PKP-2cir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:06:22 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5cec8c4e2f6so4827762a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883979; x=1731488779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eK2D5YdiBqlMNYfxLWNo7UJDqbeX8vHqHTifMmfFsII=;
        b=lTxsUsCihdXQSULyzUKqMQiVcpkQWCOYRMBFf2RsBJe1tBHDPIJjAb55Z+2KPSVcq/
         akezOzrk3LTbIGxCnbClaPOWatVYtHb5MK8w6Q1Y6TyUvKY+6PpREBRYjZXHIF0x+pzM
         sAHH8YcwPRbOKvPIwIdcbHXocROJzS8/zC72c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883979; x=1731488779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eK2D5YdiBqlMNYfxLWNo7UJDqbeX8vHqHTifMmfFsII=;
        b=v1/DxjeIIZfw11lu7HqvW/WUh7MBersAASFfKJkkx/THq7K8et/JjwIbB8Rcm6qeBS
         xWUvyf8/bUcEjCaCUuYG03Me1AA9srXZwkbXrwevdjV4oD3psym6GlmkJ9se79YkYuNV
         hJqV2mdTx+3BbdUdlNK+D2WLb6szoRyj0k0N27imjC9k/TZ2HlkSQkjXnSkiC3j3dcTu
         IHs3W/awubTPoSUem+peCKQ2L2lqmA0iSP45h0w0Pfhrn8RWKf4Ou+blnngV3WIqI+xp
         PdjEk6onGipf3W8GdHnh4rQKkC1ZNE3tbDab19Q4wEFtiM1pRN1bm07Z7l/80+z7OC+3
         Fb2w==
X-Forwarded-Encrypted: i=1; AJvYcCXGn2CxWxjGPVixbmRBERP2gmSMuNg+BGvs686kfXvZvz+7tdgdSV3JNDwqL1pSYe9CFJo7k4kEz9ZjkJdpp/bH@lists.infradead.org
X-Gm-Message-State: AOJu0YxVuhppFYQmPu7XTJxVGPxGecVup9PyjL0SsT5LT9G75/aB5+Gb
	93yU5nWuc0K1/j1iOzZEsWFDwGTh35Q6JIPVDn4WnsSls7ZkV6u/S4hti+UJrk8=
X-Google-Smtp-Source: AGHT+IFR2ALI2nOMRY3tCPEORGk9Pk1VVUWH4SbHWXlpOCHycjnjv8+CE/MFtM052hJoPRrmQx+ifw==
X-Received: by 2002:a17:906:b84b:b0:a9e:b68e:909 with SMTP id a640c23a62f3a-a9eb68e0a79mr387359966b.15.1730883979467;
        Wed, 06 Nov 2024 01:06:19 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:19 -0800 (PST)
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
Subject: [PATCH v3 8/8] clk: imx8mp: support spread spectrum clock generation
Date: Wed,  6 Nov 2024 09:58:04 +0100
Message-ID: <20241106090549.3684963-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010621_716838_B12F769C 
X-CRM114-Status: GOOD (  14.46  )
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

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 drivers/clk/imx/clk-imx8mp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index b2778958a572..e53a688d2cfe 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -410,6 +410,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np, *anatop_np;
 	void __iomem *anatop_base, *ccm_base;
+	struct imx_pll14xx_ssc pll1443x_ssc;
 	int err;
 
 	anatop_np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
@@ -449,10 +450,14 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_SYS_PLL2_REF_SEL] = imx_clk_hw_mux("sys_pll2_ref_sel", anatop_base + 0x104, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", anatop_base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 
-	hws[IMX8MP_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll);
-	hws[IMX8MP_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll);
-	hws[IMX8MP_VIDEO_PLL1] = imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
-	hws[IMX8MP_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MP_AUDIO_PLL1, &pll1443x_ssc);
+	hws[IMX8MP_AUDIO_PLL1] = imx_clk_hw_pll14xx_ssc("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MP_AUDIO_PLL2, &pll1443x_ssc);
+	hws[IMX8MP_AUDIO_PLL2] = imx_clk_hw_pll14xx_ssc("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MP_VIDEO_PLL1, &pll1443x_ssc);
+	hws[IMX8MP_VIDEO_PLL1] = imx_clk_hw_pll14xx_ssc("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MP_DRAM_PLL, &pll1443x_ssc);
+	hws[IMX8MP_DRAM_PLL] = imx_clk_hw_pll14xx_ssc("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll, &pll1443x_ssc);
 	hws[IMX8MP_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", anatop_base + 0x64, &imx_1416x_pll);
 	hws[IMX8MP_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", anatop_base + 0x74, &imx_1416x_pll);
 	hws[IMX8MP_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", anatop_base + 0x84, &imx_1416x_pll);
-- 
2.43.0


