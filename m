Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CDACCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCzqKD3xSHfSBn+d7Ai/gvl8AIDeYTTV+y/cpT/4lgg=; b=Lr8Eqr8tMNizvf608xgL9n5cyK
	j/94bnZ2UyerypjriQBk3Txu+1HmLYDN0NNd4l/FMpRk3FgumiwFLdPW8RabkEV5cn4cUSgrr3Wlh
	sC4hfFPnySBPToCsyVkdlGQC3UYCGO5/kgsPJzKw461tTbZdWnII5+Kjw/n4/ODxx4oJXh8Vn34W7
	PqecWHBScZqJtOO8RfdpZVgbg5xKZ/PTlc8YguD2yy/xpXDzaNG/36seei//cJEA7H4Jd76MeQhlH
	hMTZE0fQ2zAbjms02fVDcQes1Y/+BaiMI3i37uz189CUqriXku309/+EFIdMEAjpjzvaTPT//vGWG
	A9omwIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFln-0000000Bl3O-339J;
	Tue, 04 Nov 2025 12:04:15 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlk-0000000Bkz2-2q1D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:04:14 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b50206773adso1117305966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257851; x=1762862651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCzqKD3xSHfSBn+d7Ai/gvl8AIDeYTTV+y/cpT/4lgg=;
        b=QguNh6Q0KfbshcShlFYitL72rBRxVPFr+ApEcmmUVZxvqqSu12Mtoe64RrelvoUAL2
         Y+QjVoq0iw5Qpc892FWkOQK5x9sL3mSHjPb1ZJG6JBpAi2B3TfDnh10H9PBVBvbH+fXH
         UONHJzt1ZKuHTT/QHXspFLfdy7tcx9dKQ0/BForMk+nqStGX9gthX1rT3OdAj3HvSXAz
         AiwShcaM3bCmKU4Prn8wL8Z1xg33gh0brp3syuopllvRqbWGP7UxQyaK5roA2SYWzdtH
         kvyYG6cz0ptXMmi0lENmewVF/UH9jtR6uLcG/cbjQL37P4GDQWncQoMgpflF4E8RK38B
         IKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257851; x=1762862651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCzqKD3xSHfSBn+d7Ai/gvl8AIDeYTTV+y/cpT/4lgg=;
        b=oXamw4drer+zT8j0ZuAgSA5r3vPwGbCaGADEpkglYjm8ngD9o/SvSMlc2cg+dnLYvJ
         +AdAfwV/eDCZyjvBLbkrS5lMLY1Tbw9EzdByblu6ghbgHDR6IgIE97D9Cklk+8/RmO/F
         lMZwddYt+wNZh7xLM87tuF0+n7yXopzJlG+C7BigLVBlvok/W8vp3XIXX6agGSyVzZ+w
         AB6XT5tdcgGeWLsL6u1BTITUCeEF+edvAc2gxjOwsHDle/p01wt+uPtscxE678kLRwxZ
         fGxHWuQoBv5v3o+f3d7zL3v/7joIUEso6lXuTNeBpvJnZRM3FZyidycMhidGNQU8knLM
         YQTg==
X-Forwarded-Encrypted: i=1; AJvYcCWa0qi1YYRyVm4+lHSuXrJeV8JiWfpBG5ECCmZSd7r4TgIqQ8Iq+f2LvJ8AvJBMdrlMcG9dEjN5nid5bKNKeI04@lists.infradead.org
X-Gm-Message-State: AOJu0YyJWp28LSMb28J2UwJyGUEMXO9Svz1Oo+5MJBD4S+P9S0k1kRX7
	5W4Qcwvp4a7aoAKfaMrOiENTxo20vsnJh+R+AwMq0u88QwypuHbMCQ4JGvM7NefJfGc=
X-Gm-Gg: ASbGncv6+FR2x/wOmARrR9K+tDqBaG7z0Lv14QVZQl4AxAwcFgN/gvNSUBMjndcOTKa
	SxsGvctD+bnqN+rahcnLBlnArO2o3qIATQJaiKsYT8YexC3BRfN6KCWnUjiOU+9wNvDI6bGWzWZ
	dVdkKPOgJiLBnpDFks69TvSvZPcK05XdRNg0RHiN82pU/X5fR6rPhXLCry2OvxflRoCLn2RYw4S
	G+0CyTDGmO8xRnYjnYRwG0S9KQMnBc47MjLK9NR5uWUNNbty0knhKwUTWUJ4WAuXbHNJeR5PFLy
	ovOdf263RWvN2Rzt74mNwjl21o2hAZAaQgX26iVbgUI38X1s13TY4LDPgF4xkxJFk4O3UJpqpEy
	k141pASzxPYcReJbzwMT2PM4L/Aql4FU691Z2lbmcOmmN8U1YdPwJlgQ/4A+es+AdR0I+1qj2bC
	G6KJmC0m/DV5/mP4DOjeESnhUJhA==
X-Google-Smtp-Source: AGHT+IE2RvpbkP9lMyxDB9hrGIqiXzETjyBqy83rux3b/+zJ7/joFNzbydou1+hhLeq8yhwIAz+fmQ==
X-Received: by 2002:a17:907:26c5:b0:b6d:5dbb:a1e1 with SMTP id a640c23a62f3a-b72159d5c65mr316758166b.5.1762257850774;
        Tue, 04 Nov 2025 04:04:10 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:10 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Tue,  4 Nov 2025 04:03:00 -0800
Message-ID: <20251104120301.913-8-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_040412_754795_18345BB0 
X-CRM114-Status: GOOD (  13.00  )
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

Support i.MX8ULP's SIM LPAV by adding its reset map definition.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 745b7e22b954..af8d585d6c18 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -3,6 +3,7 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 
 #include <linux/auxiliary_bus.h>
@@ -17,6 +18,8 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 
+#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -51,6 +54,44 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
 	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
 };
 
+static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(25),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(16),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(13),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(5),
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(4),
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(3),
+		.active_low = true,
+	},
+};
+
+static const struct imx8mp_reset_info imx8ulp_reset_info = {
+	.map = imx8ulp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8ulp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
@@ -179,6 +220,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 		.name = "clk_imx8mp_audiomix.reset",
 		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
+	{
+		.name = "clk_imx8ulp_sim_lpav.reset",
+		.driver_data = (kernel_ulong_t)&imx8ulp_reset_info,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
-- 
2.43.0


