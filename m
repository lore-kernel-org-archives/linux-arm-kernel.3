Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE823E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9y65mSKckiOGkTEuAAogO736LDDvGviKkEok9cQB10=; b=MHiChZ0SxniNIyO5SpNCCik4dg
	2WyKnWA2/EwX8KEC9/rCePkxPhE+U3jdgLsS8FU8sbFNHD8JXFbC1yY3PZ2lCv1wwDU+6scaUnFfN
	238b/vihrjvajEG2gjO2oTXRBKmr4n5Cl+bwQ9N6gjs8tG6aMOnmICEroTPyzjE3gGqTw/xik8uUn
	pEIn/HV1iR8+zpznMKtlnTpKIIYP5aj0Z2Tci9bEII/LtiRgAa1vAOtcF42UI3vhyKDURZ6YSBH1z
	zONO70tm+0M4JuqOPnmAVO/Ozz/p9BEBerw2ftKm9IEE8wzu8gEv39Uxbri59mEsmrmmAeEUY+CFu
	e/dgIgmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRE5j-00000000iRe-0MP7;
	Fri, 27 Dec 2024 17:25:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDf1-00000000eew-1Hkk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:58:04 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so1281110166b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318682; x=1735923482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9y65mSKckiOGkTEuAAogO736LDDvGviKkEok9cQB10=;
        b=afI1izjSPgKPiMj8fkCOeqitwzJrFuca+1b8nAdLlzOlG3AWmfXiaPBnhjoNNTVDwp
         Kd+Tbvi8XeZcsEljPP7fydNq7tQecbFQp/7kCJyU09jQOIMgsO4Rta/BPI6OX/ScmGhx
         UcFVSm0q7YQ22PWOtj6Gqn8fWzYPWV6V9JYw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318682; x=1735923482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9y65mSKckiOGkTEuAAogO736LDDvGviKkEok9cQB10=;
        b=ZjBUafvCY9CCFBLxueScSPw0RUcl60zc91dx1BnuO1o7HJjE7T8dkesF+LNPglEee/
         O3P/gjadqTMuP1XQn6jN7YIwpgCDMq/O2FSFlDLqjHuDF994M/zNCJdYLtfnolo+BC3p
         a7vEdxhMHY0Xdq66OC0/glZ0GYIKyEgUpSi+REw4upyIPrl1RxRYGodG7bc3v53jkVN3
         YHBO5kpMYZM3sJZOblDoeOUNa1c+f9X9OwSv4bFPBjHR03wVDaNZRGOl83ppUDsCFtcB
         4t85irmIpC3jzYGJeSbwksXZOH4V4MH7YncH2I4RZ+r1WoBClLYys3UV09yXaldJtJqv
         GqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqA4NIHgefEezOaTRMcd2Z79DRBe5dj3y73ybwNpdmwL5hnKHzsUMJuXTJOu/EwOpcUntYC3jGfJw3jtrEWmES@lists.infradead.org
X-Gm-Message-State: AOJu0YyUCFAgm31EcJgowRtiW7zzAQsU86hkf7VDbJa4t8jsn9Q4q6fP
	dEtJ0NHiliLsEctVOL1imf8PkJ1HyRAFqOUM4S2WcqDUCd/DoOjQnbznWKeREvA=
X-Gm-Gg: ASbGnctn+SK3zjvgIKGdIUIsBrrVvMHuMdZUAXURu2i8GmTIFsayySUDItz2Y/0/ajo
	yK8fuQVYbSs27zNBJKtJz2JCJ/zT5ilM/kq6gDUcH3s9ASWUD5xwsgYE+taXv/VKBzAlss42oyK
	jWJMd0WVxr2n0W7zUP/dwQeZ90kF1tcs86PDimREbherP/daVaKU9+GZ79MKgCtYkIxn8ZYwXgO
	0qw7NDTAQSkGSQ7yDse+2vbfNvkeBkyLlhtnqN6c5GaNcs1jXyT2j+RhoXRVChARm1ffpWAkatE
	k3M50OF1ZxkoE3bnVxMpFw==
X-Google-Smtp-Source: AGHT+IF5jJPOX6kcBf6BRntab9qdhEP5H59U2Fi48sPndxAdgm1w2Y9ddhMbzuVLYYL1IC/eBjryeA==
X-Received: by 2002:a17:907:2d2c:b0:aa6:8a1b:8b78 with SMTP id a640c23a62f3a-aac271318f9mr2143573966b.6.1735318680458;
        Fri, 27 Dec 2024 08:58:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:58:00 -0800 (PST)
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
Subject: [PATCH v7 23/23] clk: imx8mn: support spread spectrum clock generation
Date: Fri, 27 Dec 2024 17:56:26 +0100
Message-ID: <20241227165719.3902388-24-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085803_348118_D3AC1064 
X-CRM114-Status: GOOD (  15.90  )
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

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 984331372139..9a04e8138b7d 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -347,9 +348,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
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


