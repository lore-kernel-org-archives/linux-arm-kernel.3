Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE67C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvTKndiMkROVePKKMXmQxzHj6whXXjb2pDAXF1Y9+GE=; b=0qhjwdpyUPN3e+CwI0xeGpcyVh
	pqSTlCpC8Y9a92KLFQUfKRKrVs9HlXhwgos6RxEFegV4UwsNVj88Lugs8uWdAwuGmo0bDWS31oVT5
	kpiD139gOnx8jQ6Or4th9UIjn1AfLMz0RnVU2tzq2YVBl//bjU5grmNY4pb6gzJ9Zccd90K40vZLX
	wkvsvWqimJbBWCfzDaZLq83ZbiIKF5L9RirN8kbLS0OMXHTeTmT9rKeK/2ZWV/+jinlINaQAxtXqr
	rxdSmQUMDQfAGzB8K8IKsi+yCIe422cfspmq3k/Wcr/zJSwNR9klEdH68d1xu5RzT2bnbENiHqlE2
	WO8cowmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8c6-00000002Rry-2jN8;
	Sat, 18 Jan 2025 13:11:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88p-00000002NKX-1SoE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:32 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d9f0a6ad83so5971711a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204090; x=1737808890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvTKndiMkROVePKKMXmQxzHj6whXXjb2pDAXF1Y9+GE=;
        b=nw5bExofBCZbLdwLc1k6xXYdoIvWwjfzuw/ZCtVzKVgMTiSe7DUtOZW8yhEybtkTYL
         K5t8vkmYLY/IEHfZdzvrgCNNCPog1Ez+baavhl3yjBjFbhfHjrJ0xonpg0qbW0ZK/aUP
         ZUCE2monp3dDTzi12R65Ee8qGxywLMa3zA6Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204090; x=1737808890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvTKndiMkROVePKKMXmQxzHj6whXXjb2pDAXF1Y9+GE=;
        b=bPEo+y/RWCN7AzCzR7xkIOJ1Ic8WcDZjuzsrscfmi09iXBJRMSEJlTIBmV/g6/JyL3
         upPesPv6+soiRTNJ+UBNrg1RXelJ93s0Whl4DalkAyGg/yR/6FDdPVe0lxpG9LYX1ViZ
         y1VYDn8T0ZfG3HaJGFWrnRra1dV9c1QWy/TRnIUx+pwpiu5pO1/u01s/DVbM3VaTb4Np
         7iVw7mBh3N7iLxpcHfD25s4h3op7Bxt/DO/y+Gr24ASJC0BHUAj4ajNFB0x5bH7q54rP
         UnPE+DykYb4hTR57AAvEYVc+5oHa7livLO/NQbKpA+WtN3dqRJh6BzEuLnFWb0ciimD3
         HENA==
X-Forwarded-Encrypted: i=1; AJvYcCUChnm2+q6UTBMWqOK0I/goavrwVain2kOE5d2XE7X7OLP+i2DOQ6hqdeCaLcvBGA8ccSFEBPpwIRI0eZ4zmPTE@lists.infradead.org
X-Gm-Message-State: AOJu0YzXwSPbdyKiW9demsjZJKHFew9G3tgyr+qIIc3PNRBg9fD3zWYa
	jqEq3VM4/rICMDJIwYrsDOPRObISBTBaSLQbQIzcTyV9tBByNWIrw1V57W6/uuswNgMwUsK4gbR
	z
X-Gm-Gg: ASbGncsuvRoj4dUkRm3yeDgg+841p2R8SNF32O+0NJeCbYqjcgDfuE8PcRqmRYDbpgS
	zRlTJID21VIYRl8SHY9hMmlUfk6/mZj/gwwG8hKs7s+nZButsSlDEJojjBff2MyYO23bbNhTLOs
	t2dJBgaummCRBk6wFaIham5dJ7ouxfuXrctOU9xNer8ZlDAc4mK5jvzY6ikp/Wr+hRtG9GmS2aU
	mAq9oC9Xzyl3Zev6QnpgeaLDpYiN2qkjwGTsvliasb2GO1ogbUJ7CE45/ds/rmt0XVbB4Pbt7Z2
	4d/1qi/BCtC31Mw1gxjJccJR+mMKqUmCQ27m64t0GoyrE0JqQ64StBcd9xlNaqUQTjtilxIKDel
	Q4KDDTyMusXqsuk+uitOlEN+jdJU7ImoIrZ4o
X-Google-Smtp-Source: AGHT+IFC/pqArB6lP+2fYPukqjbNk0HklO0cbxbWcFV3TF46oG+xZmBHJNyGCFzgAtJ5215kQXOiSw==
X-Received: by 2002:a17:906:6147:b0:ab3:9a57:f4fd with SMTP id a640c23a62f3a-ab39a5802damr320445266b.28.1737204089946;
        Sat, 18 Jan 2025 04:41:29 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:29 -0800 (PST)
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
Subject: [PATCH v9 23/23] clk: imx8mm: support spread spectrum clock generation
Date: Sat, 18 Jan 2025 13:40:06 +0100
Message-ID: <20250118124044.157308-24-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044131_389442_F2B701B2 
X-CRM114-Status: GOOD (  17.38  )
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

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 drivers/clk/imx/clk-imx8mm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index d39de0a81a6f..f8413f495d5d 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -286,6 +286,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -324,9 +325,21 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MM_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MM_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MM_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MM_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MM_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MM_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_GPU_PLL);
 	hws[IMX8MM_VPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VPU_PLL);
 	hws[IMX8MM_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_ARM_PLL);
-- 
2.43.0


