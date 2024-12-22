Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682CEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmS2q4PEwUxAZm6SKuFHBNxLEZy5O27yTgc+4SIr6m4=; b=1tllIhUrlIeYpwzgnbD9vvdfq9
	BMKBreMa3rPDRTcTip62jPDhTcPejfPZYC1jW0TKIreS9C4l4NzXwVbJ3olGmnNDGLtN3ZYjZmUB3
	+3dg+KfdiPu0KzsDfXtWo5d1wVzHhHNIWKn8xhBRysZlGXyGPKeVK9HCoSEqYZdjpEJmjYofDiA7i
	YB14/OEv52skeR6Ip03gEHX62I/0gAvmQJN+5WCPUY2d0mVOc7UDd+DAdvvpt5WW8Z81LpjoobIVM
	u9hbQ3GtjY340MvcEAgSFGbY5uEFzpnDWsi06NpoAsC2tZVKnaDvp0ZR0kHpiNFSiDCQzxp+Tt3bF
	ZEKdX39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPkP-00000008asX-3J5j;
	Sun, 22 Dec 2024 17:28:09 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPPB-00000008XxU-01sS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:06:14 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa69077b93fso499900766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887172; x=1735491972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmS2q4PEwUxAZm6SKuFHBNxLEZy5O27yTgc+4SIr6m4=;
        b=LEVm8yoC/eBFIFQxurndYNu3p7llCZo+vrjVhk7jtV2wrR8/ud+TA0ZsfCecEUXPW6
         FsW9nmjNqsNev4hcwPxn6tZAzTcINpMkjzxPxPPTakchlUqHa8fK/xujaC86xwyw8+F1
         trxlCj0Zr1ppyPN8c24u0rKgGojEn4tO6qf24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887172; x=1735491972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmS2q4PEwUxAZm6SKuFHBNxLEZy5O27yTgc+4SIr6m4=;
        b=taNZsoI3GyvnKlw5JpmrVmyfxJeaBcQ2BYxmL7daJthHw4xG+V1kiXLjjAeKb08Jqd
         bU3iZVPSS538mSZxfG8Xcmf4klKXrs8HnxGO9Id+vbKIJoSg1Ru7bo9aEj68hK5O+KyD
         jo8stiHKwSQXLsLFj+j5nNruOxSTxyCBzPO/DdWUoo2O1zaZNyAMrPtVnWZa1lr2BpF2
         oSqb1+Iu1c98btRWSQbyrDVBL4N5DdmDh9dEayd1GnaI5fyLYe9vzI6V8jXU5WUWrjua
         74/3MwiDaNy21+RlhXXr69rqBmZ/3AT5nWId7aaPxTxsUfVT2WcIu5srWIO70uboAK7q
         sYEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR6ueklA3CR9WELfvEk+8uG5z7AI5kcCxFtVz+mPHAonSi2bUtRjljm99oTiQ36OZaIPxeZcQNJ3YsBJ4gj63o@lists.infradead.org
X-Gm-Message-State: AOJu0Yz14WOYjSE/+LszwsTdlJ/M7LLXHL7koTVoIoKeo2FV3yuGsB1G
	aMVvJFQg9pjRCdisEanYxinY+tnMkVWFugwS48M4Y6eMGFJhqvgg6fHILT7hz0M=
X-Gm-Gg: ASbGncvNYGMFYw9wAI9eCdPiPRi1OY5iKg+RuVysDTYpMfqHsEYd7H6gXnjE+/Xii9A
	vSMC2oAGkk+KzJqdRXDBllQgdAz6Gfswh0fQxtB3Rf0BenhAg8j2cRBoDN/XzesLnM7RnPCBfOj
	5P6JLqNMUu9a5lN/aNMW/bW/W7HYb9W72WmsLPEh7DBdCOmfyYUUYtxbn/youV1KQIruAuigP/t
	Jr1X3aXlx6nZ52nmHCsBJlxtxzqmmTx4XDJ5CIHYuUWYxAzLHVsaevKSHV4aoLrDp+BMTK3JrEz
	auJI0tGmomr8sQ7Z4gwwS2PLqeps8TBGGTccs+k/LvqArw==
X-Google-Smtp-Source: AGHT+IHJzculVyLqVLiiOPR1XaEdHZ7jSwaVhPg8aOnJUgPmmOr2yhR4PsirVllXClh6H0aRUqSvpQ==
X-Received: by 2002:a17:907:9621:b0:aab:f8e8:53b9 with SMTP id a640c23a62f3a-aac345f427dmr975282166b.58.1734887171608;
        Sun, 22 Dec 2024 09:06:11 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:11 -0800 (PST)
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
Subject: [PATCH v6 18/18] clk: imx8mn: support spread spectrum clock generation
Date: Sun, 22 Dec 2024 18:04:33 +0100
Message-ID: <20241222170534.3621453-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090613_050132_48823643 
X-CRM114-Status: GOOD (  15.38  )
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


