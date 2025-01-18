Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5586C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXAgzqp6YN1DpD4nDAOaVXpHZiShYKGqmKOr0HW9Cag=; b=dl86JpxC1vT5Hy/YtHM3J92jlI
	40iTnN8Rk++A77fVAiYTYLkhdcNKcEPyhl1ynsJe9SR4cHOZywg3jJyAi9rzABWWLUT/AMDU7CEQd
	dOC9S/kKAUC9LnjRQWYWsipmpE4szeljEcfERc2DGw3PZ8JRYog0yRjYGs4Mqe88F5SEsAgnYsmWn
	vIE2pgpUaSO53HfdiGVxLjDC1YBxSp/uOspxgGr+UsNoMwYLbBcKTRHrrIeuQl0Y0oHpOAq/B8q5L
	lCr8R8HHnMMHbpWknvksQzXVfzYDaQsefp+eCWAJwBM9mOv4jQ8o+wW38QWoH4VcpMduS2m6bdL9j
	LCrbKVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8C1-00000002O8e-2tPJ;
	Sat, 18 Jan 2025 12:44:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88I-00000002N7H-2uFA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:40:59 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso5879824a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204057; x=1737808857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXAgzqp6YN1DpD4nDAOaVXpHZiShYKGqmKOr0HW9Cag=;
        b=Odkq5IEyzkBbWeqColJ5H0a0ItMcpYhp2B6ZYi+VJqk66D6nVcmQ3SmRZm2xAR679V
         +yHylE9YKAcr62fH0AIx3xveKFxhIns8djcDl06Lj942n6q+DW+clsThodNBIl1hHF0a
         p+G2nMQasKGL0d+zL+5DM3RyKKgzNZlEH30BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204057; x=1737808857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXAgzqp6YN1DpD4nDAOaVXpHZiShYKGqmKOr0HW9Cag=;
        b=JzT9zy1VbrRvu+AFTE1b/9fNqy1fFgHWQiFCK4cUGYx5IlpYMRU6bWN+Fqp2XtOjrI
         XfVT636kHTnMqyxI0NSUuUMeEIMhiEML6qM6YEIOVe1wwSmSNQrLlNihLaFWKR+rMMEc
         Ku/VAf9GFsia4sAUb6hRZvx5g9cTenzXdT8RhLF9pA2c6JTy5dACrTibKzepn01V3nTG
         sZj3e6L13QxcwkldUo2+ongCyYNpMZFCBIHySgAhou/U59+0jXKdAdXzXUlJI7uVsyaS
         90ChQoYJhUL2eVLPyZfF+D9vTYbTlU8Ya+Qi9jAle7QTWhpF0v+mm8IQrfiM55opBQP/
         yVnw==
X-Forwarded-Encrypted: i=1; AJvYcCVOLC1c/lQsSxk3O2ChH2T+UltxgHRNx8tgV3KfgB7iCzcf5V7oalXbJX/0WY/pY/LIY8xIuDjlcfME1+DLJV8V@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo9flRVqVd73wEdTOYcrPoSzfvq3dgoebi46aEyK2ive2XRffj
	ShkkQIDSytDq9oj4l0ouT4xghR5DNr6vdVnoh47QsRQ0HA7NAXHWa9J/WI74z7I=
X-Gm-Gg: ASbGncvmqUUpF3ovtKlTLSMGL5BgLdeY7DRWPz9vPgOoqBqlVq/y1Og77U1qtRzkWz6
	GNwhkH2p+SnB3VEaoiGAVDttAquA91t+kiw98Id+1UCI1LVXPJyMDa9mENrlI/1HlLXIWPLg/Fy
	XtnZSBYReJd16O2/xEtcZHnyNelzLHu/Mu47HB+NlzrajQw4Q/ZGWYRlLbXRJgj93KScafTaqXo
	EM2w/4ypjHJSFD9vQAwYqXJZlKpBJQJKgSEA0Z7iJp9wQAetbphOJLGx92cgaINLPraCkw13Ox3
	R2wvgVAOwQYS6cnskEbyd0Lq1Bc8JFQkbDRpLQM0OL4oqPjILMlvzEYtL1MbilEwM/r+YKyp1Ix
	2ErLLMcX1d3AtsSNNWKFY3P60vLqJYMds9Z8U
X-Google-Smtp-Source: AGHT+IEYTcBHn1pOrsctnZppGmBS2FGUX7+eHnJI1KxeJ2zy2G+iEm2miE77t/oAa9gJ02qJ30Nzlw==
X-Received: by 2002:a17:907:3f23:b0:ab3:f88:b54e with SMTP id a640c23a62f3a-ab38b2e71e0mr536034366b.31.1737204056983;
        Sat, 18 Jan 2025 04:40:56 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:40:56 -0800 (PST)
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
Subject: [PATCH v9 02/23] clk: imx8mm: rename video_pll1 to video_pll
Date: Sat, 18 Jan 2025 13:39:45 +0100
Message-ID: <20250118124044.157308-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044058_789781_3B485AD0 
X-CRM114-Status: GOOD (  11.01  )
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's rename "video_pll1" to
"video_pll" to be consistent with the RM and avoid misunderstandings.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---
The patch, which simply replaces video_pll1 with video_pll, highlights
many warnings raised by checkpatch.pl. These are not generated by the
changes made but are inherited from how the module was originally
written. Fixing them would have meant "obscuring" the actual changes
introduced.

(no changes since v7)

Changes in v7:
- Add 'Reviewed-by' tag of Peng Fan

Changes in v5:
- Split the patch dropping the dt-bindings changes.

Changes in v4:
- New

 drivers/clk/imx/clk-imx8mm.c | 102 +++++++++++++++++------------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 342049b847b9..8a1fc7e17ba2 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -28,7 +28,7 @@ static u32 share_count_nand;
 static const char *pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
 static const char *audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
 static const char *audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
-static const char *video_pll1_bypass_sels[] = {"video_pll1", "video_pll1_ref_sel", };
+static const char *video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
 static const char *dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
 static const char *gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
 static const char *vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
@@ -42,22 +42,22 @@ static const char *imx8mm_a53_sels[] = {"osc_24m", "arm_pll_out", "sys_pll2_500m
 static const char * const imx8mm_a53_core_sels[] = {"arm_a53_div", "arm_pll_out", };
 
 static const char *imx8mm_m4_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_250m", "sys_pll1_266m",
-				       "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", "sys_pll3_out", };
+				       "sys_pll1_800m", "audio_pll1_out", "video_pll_out", "sys_pll3_out", };
 
 static const char *imx8mm_vpu_sels[] = {"osc_24m", "arm_pll_out", "sys_pll2_500m", "sys_pll2_1000m",
 					"sys_pll1_800m", "sys_pll1_400m", "audio_pll1_out", "vpu_pll_out", };
 
 static const char *imx8mm_gpu3d_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m", "sys_pll3_out",
-					  "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					  "sys_pll2_1000m", "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_gpu2d_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m", "sys_pll3_out",
-					  "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					  "sys_pll2_1000m", "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_main_axi_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll1_800m", "sys_pll2_250m",
-					     "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "sys_pll1_100m",};
+					     "sys_pll2_1000m", "audio_pll1_out", "video_pll_out", "sys_pll1_100m",};
 
 static const char *imx8mm_enet_axi_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m", "sys_pll2_250m",
-					     "sys_pll2_200m", "audio_pll1_out", "video_pll1_out", "sys_pll3_out", };
+					     "sys_pll2_200m", "audio_pll1_out", "video_pll_out", "sys_pll3_out", };
 
 static const char *imx8mm_nand_usdhc_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m", "sys_pll2_200m",
 					       "sys_pll1_133m", "sys_pll3_out", "sys_pll2_250m", "audio_pll1_out", };
@@ -72,28 +72,28 @@ static const char *imx8mm_disp_apb_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pl
 					     "sys_pll1_40m", "audio_pll2_out", "clk_ext1", "clk_ext3", };
 
 static const char *imx8mm_disp_rtrm_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll2_200m", "sys_pll2_1000m",
-					      "audio_pll1_out", "video_pll1_out", "clk_ext2", "clk_ext3", };
+					      "audio_pll1_out", "video_pll_out", "clk_ext2", "clk_ext3", };
 
 static const char *imx8mm_usb_bus_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m", "sys_pll2_100m",
 					    "sys_pll2_200m", "clk_ext2", "clk_ext4", "audio_pll2_out", };
 
 static const char *imx8mm_gpu_axi_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out", "sys_pll3_out", "sys_pll2_1000m",
-					    "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					    "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_gpu_ahb_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out", "sys_pll3_out", "sys_pll2_1000m",
-					    "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					    "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_noc_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll3_out", "sys_pll2_1000m", "sys_pll2_500m",
-					"audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					"audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_noc_apb_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll3_out", "sys_pll2_333m", "sys_pll2_200m",
-					    "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", };
+					    "sys_pll1_800m", "audio_pll1_out", "video_pll_out", };
 
 static const char *imx8mm_ahb_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_800m", "sys_pll1_400m",
-					"sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", "video_pll1_out", };
+					"sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", "video_pll_out", };
 
 static const char *imx8mm_audio_ahb_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m", "sys_pll2_1000m",
-					      "sys_pll2_166m", "sys_pll3_out", "audio_pll1_out", "video_pll1_out", };
+					      "sys_pll2_166m", "sys_pll3_out", "audio_pll1_out", "video_pll_out", };
 
 static const char *imx8mm_dram_alt_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll1_100m", "sys_pll2_500m",
 					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll1_out", "sys_pll1_266m", };
@@ -108,10 +108,10 @@ static const char *imx8mm_vpu_g2_sels[] = {"osc_24m", "vpu_pll_out", "sys_pll1_8
 					   "sys_pll1_100m", "sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", };
 
 static const char *imx8mm_disp_dtrc_sels[] = {"osc_24m", "dummy", "sys_pll1_800m", "sys_pll2_1000m",
-					      "sys_pll1_160m", "video_pll1_out", "sys_pll3_out", "audio_pll2_out", };
+					      "sys_pll1_160m", "video_pll_out", "sys_pll3_out", "audio_pll2_out", };
 
 static const char *imx8mm_disp_dc8000_sels[] = {"osc_24m", "dummy", "sys_pll1_800m", "sys_pll2_1000m",
-						"sys_pll1_160m", "video_pll1_out", "sys_pll3_out", "audio_pll2_out", };
+						"sys_pll1_160m", "video_pll_out", "sys_pll3_out", "audio_pll2_out", };
 
 static const char *imx8mm_pcie1_ctrl_sels[] = {"osc_24m", "sys_pll2_250m", "sys_pll2_200m", "sys_pll1_266m",
 					       "sys_pll1_800m", "sys_pll2_500m", "sys_pll2_333m", "sys_pll3_out", };
@@ -122,47 +122,47 @@ static const char *imx8mm_pcie1_phy_sels[] = {"osc_24m", "sys_pll2_100m", "sys_p
 static const char *imx8mm_pcie1_aux_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_50m", "sys_pll3_out",
 					      "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_160m", "sys_pll1_200m", };
 
-static const char *imx8mm_dc_pixel_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out", "audio_pll1_out",
+static const char *imx8mm_dc_pixel_sels[] = {"osc_24m", "video_pll_out", "audio_pll2_out", "audio_pll1_out",
 					     "sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", };
 
-static const char *imx8mm_lcdif_pixel_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out", "audio_pll1_out",
+static const char *imx8mm_lcdif_pixel_sels[] = {"osc_24m", "video_pll_out", "audio_pll2_out", "audio_pll1_out",
 						"sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", };
 
-static const char *imx8mm_sai1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext1", "clk_ext2", };
 
-static const char *imx8mm_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
 
-static const char *imx8mm_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
 
-static const char *imx8mm_sai4_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai4_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext1", "clk_ext2", };
 
-static const char *imx8mm_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
 
-static const char *imx8mm_sai6_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai6_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
 
-static const char *imx8mm_spdif1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_spdif1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					   "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
 
-static const char *imx8mm_spdif2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_spdif2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					   "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
 
 static const char *imx8mm_enet_ref_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_50m", "sys_pll2_100m",
-					     "sys_pll1_160m", "audio_pll1_out", "video_pll1_out", "clk_ext4", };
+					     "sys_pll1_160m", "audio_pll1_out", "video_pll_out", "clk_ext4", };
 
 static const char *imx8mm_enet_timer_sels[] = {"osc_24m", "sys_pll2_100m", "audio_pll1_out", "clk_ext1", "clk_ext2",
-					       "clk_ext3", "clk_ext4", "video_pll1_out", };
+					       "clk_ext3", "clk_ext4", "video_pll_out", };
 
 static const char *imx8mm_enet_phy_sels[] = {"osc_24m", "sys_pll2_50m", "sys_pll2_125m", "sys_pll2_200m",
-					     "sys_pll2_500m", "video_pll1_out", "audio_pll2_out", };
+					     "sys_pll2_500m", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_nand_sels[] = {"osc_24m", "sys_pll2_500m", "audio_pll1_out", "sys_pll1_400m",
-					 "audio_pll2_out", "sys_pll3_out", "sys_pll2_250m", "video_pll1_out", };
+					 "audio_pll2_out", "sys_pll3_out", "sys_pll2_250m", "video_pll_out", };
 
 static const char *imx8mm_qspi_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll2_333m", "sys_pll2_500m",
 					 "audio_pll2_out", "sys_pll1_266m", "sys_pll3_out", "sys_pll1_100m", };
@@ -174,16 +174,16 @@ static const char *imx8mm_usdhc2_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1
 					   "sys_pll3_out", "sys_pll1_266m", "audio_pll2_out", "sys_pll1_100m", };
 
 static const char *imx8mm_i2c1_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_i2c2_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_i2c3_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_i2c4_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_uart1_sels[] = {"osc_24m", "sys_pll1_80m", "sys_pll2_200m", "sys_pll2_100m",
 					  "sys_pll3_out", "clk_ext2", "clk_ext4", "audio_pll2_out", };
@@ -213,19 +213,19 @@ static const char *imx8mm_ecspi2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1
 					   "sys_pll1_800m", "sys_pll3_out", "sys_pll2_250m", "audio_pll2_out", };
 
 static const char *imx8mm_pwm1_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_pwm2_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_pwm3_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_pwm4_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_gpt1_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m", "sys_pll1_40m",
-					 "video_pll1_out", "sys_pll1_80m", "audio_pll1_out", "clk_ext1" };
+					 "video_pll_out", "sys_pll1_80m", "audio_pll1_out", "clk_ext1" };
 
 static const char *imx8mm_wdog_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_160m", "vpu_pll_out",
 					 "sys_pll2_125m", "sys_pll3_out", "sys_pll1_80m", "sys_pll2_166m", };
@@ -234,31 +234,31 @@ static const char *imx8mm_wrclk_sels[] = {"osc_24m", "sys_pll1_40m", "vpu_pll_ou
 					  "sys_pll1_266m", "sys_pll2_500m", "sys_pll1_100m", };
 
 static const char *imx8mm_dsi_core_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m", "sys_pll1_800m",
-					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_dsi_phy_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_100m", "sys_pll1_800m",
-					    "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
+					    "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_dsi_dbi_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_100m", "sys_pll1_800m",
-					    "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					    "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_usdhc3_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1_800m", "sys_pll2_500m",
 					   "sys_pll3_out", "sys_pll1_266m", "audio_pll2_out", "sys_pll1_100m", };
 
 static const char *imx8mm_csi1_core_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m", "sys_pll1_800m",
-					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi1_phy_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m", "sys_pll1_800m",
-					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
+					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi1_esc_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_800m",
 					     "sys_pll2_1000m", "sys_pll3_out", "clk_ext3", "audio_pll2_out", };
 
 static const char *imx8mm_csi2_core_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m", "sys_pll1_800m",
-					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi2_phy_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m", "sys_pll1_800m",
-					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
+					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi2_esc_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_800m",
 					     "sys_pll2_1000m", "sys_pll3_out", "clk_ext3", "audio_pll2_out", };
@@ -286,9 +286,9 @@ static const char *imx8mm_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", }
 static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "dummy", "sys_pll1_200m",
 					  "audio_pll2_out", "sys_pll2_500m", "vpu_pll", "sys_pll1_80m", };
 static const char *imx8mm_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_400m", "sys_pll2_166m",
-					  "sys_pll3_out", "audio_pll1_out", "video_pll1_out", "osc_32k", };
+					  "sys_pll3_out", "audio_pll1_out", "video_pll_out", "osc_32k", };
 
-static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					   "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
 					   "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
 					   "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
@@ -327,7 +327,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MM_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MM_VIDEO_PLL1_REF_SEL] = imx_clk_hw_mux("video_pll1_ref_sel", base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MM_VIDEO_PLL_REF_SEL] = imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_DRAM_PLL_REF_SEL] = imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_GPU_PLL_REF_SEL] = imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_VPU_PLL_REF_SEL] = imx_clk_hw_mux("vpu_pll_ref_sel", base + 0x74, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
@@ -336,7 +336,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MM_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll);
 	hws[IMX8MM_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll);
-	hws[IMX8MM_VIDEO_PLL1] = imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", base + 0x28, &imx_1443x_pll);
+	hws[IMX8MM_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", base + 0x28, &imx_1443x_pll);
 	hws[IMX8MM_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll);
 	hws[IMX8MM_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64, &imx_1416x_pll);
 	hws[IMX8MM_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", base + 0x74, &imx_1416x_pll);
@@ -348,7 +348,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	/* PLL bypass out */
 	hws[IMX8MM_AUDIO_PLL1_BYPASS] = imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_AUDIO_PLL2_BYPASS] = imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14, 16, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MM_VIDEO_PLL1_BYPASS] = imx_clk_hw_mux_flags("video_pll1_bypass", base + 0x28, 16, 1, video_pll1_bypass_sels, ARRAY_SIZE(video_pll1_bypass_sels), CLK_SET_RATE_PARENT);
+	hws[IMX8MM_VIDEO_PLL_BYPASS] = imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28, 16, 1, video_pll_bypass_sels, ARRAY_SIZE(video_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_DRAM_PLL_BYPASS] = imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50, 16, 1, dram_pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_GPU_PLL_BYPASS] = imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64, 28, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_VPU_PLL_BYPASS] = imx_clk_hw_mux_flags("vpu_pll_bypass", base + 0x74, 28, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
@@ -358,7 +358,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	/* PLL out gate */
 	hws[IMX8MM_AUDIO_PLL1_OUT] = imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", base, 13);
 	hws[IMX8MM_AUDIO_PLL2_OUT] = imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", base + 0x14, 13);
-	hws[IMX8MM_VIDEO_PLL1_OUT] = imx_clk_hw_gate("video_pll1_out", "video_pll1_bypass", base + 0x28, 13);
+	hws[IMX8MM_VIDEO_PLL_OUT] = imx_clk_hw_gate("video_pll_out", "video_pll_bypass", base + 0x28, 13);
 	hws[IMX8MM_DRAM_PLL_OUT] = imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", base + 0x50, 13);
 	hws[IMX8MM_GPU_PLL_OUT] = imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", base + 0x64, 11);
 	hws[IMX8MM_VPU_PLL_OUT] = imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", base + 0x74, 11);
-- 
2.43.0


