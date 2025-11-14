Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06B0CE7B0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjEK4P3dbzSXwnv9p+7adMjs6IATWQpdCincKxuWQP4=; b=SN6zIlqmN4PZKLF+eTJdVa/RXn
	hXyKehtHnbWss8ppkKNFtk/xEelsC6d3djGGl2KOFSI7a/97QFdU0vGNwd13UJCcDq5tgtGcsQKDI
	XhGXvcRACEv2yYedrcwGYijt3y1t07A7VP/URz2Kca/aOGWNZJ0EqHNxTlgWWMfLZsk1Q7xRnbxzu
	eXDGtQkDiLM0dGSJmlt98cYYe+iD4u6OhVoSiNFqSXuxj70OjfkSdH9KmS+eGxyMcxWK2vjCvTtdk
	bgqRVH/JY/HTnk9eO/u21VEUS9G2rWRkNt1cym/r6q4AYhH6NrBk2oZ3mqEBooRhkI7sym9Y/eLF5
	fUBmkzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0a-0000000CHGC-1Iwr;
	Fri, 14 Nov 2025 13:38:36 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0T-0000000CHAE-3jfK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:38:31 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so3455525a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127508; x=1763732308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjEK4P3dbzSXwnv9p+7adMjs6IATWQpdCincKxuWQP4=;
        b=I4b2vHsvWxDhQl0ECcnJaWAe3qLryH002M0Lbaso/edgVIxA80pgVE5S1d/tDy7KKx
         RAr3AQ4Aat1MZlRKbf0xuDat/0TzfSsC5DVUKh8M2sLxkalDa/y8MJG4ginDTT/UDji4
         s0ZyzMzcNkctw1rR22FNyQtxXa/aY4rRHTP9DpNvT43s2ZLA/k7b8gexQC91s10h1USA
         oEGdYvSBYpz4W8GK0Ol/N/6w0nzFXVH+aBy/1YNmNd1kg8/dSv5o7u4Atzp/EfHp06Ci
         vKDZzHkfEy6PMOgWWc4xPZHT4/YqweNoM7ToXjzesXclUnMxmGJ5O898PYkf3CNt3YtE
         IQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127508; x=1763732308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wjEK4P3dbzSXwnv9p+7adMjs6IATWQpdCincKxuWQP4=;
        b=l2+53pNhN/VoMgVSmCJbawL3MQaQ/8bfFEQ3A11hi6r3lKYqUPQgVcRgfRfJpLmECJ
         Ty30n07zXCaZp7kCrT7K5w41r3eDC2qESipeoN8GIfDWVobCo/yGX369QT+QSHfH+GuQ
         4hxNsZpQDICe8g8mfCSlVHTyfolfHiWCpfbNXZQOcVYqVPJRWRUdIIPA7Su7ZPHExZcK
         8QtpQWyVeyiNYQaNgamBFFQROqCkZ3drJba50WFcwTJra9fm+RR7BROJoIuaM94CQgHy
         I3G4HkBky/D0ppa2ZaUoWvbtFZd4QARZmwBNaev5yq0YjczybFNC5CXkhjPwtPg7vZu0
         CbnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbkUNCed8zBNwk3z5V6xeqYCkcw/i23GbA79yNG5mxp2O6AbbVWxYBnizcipZZHyY0EwKyH1OXq1A118D8OgJW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+VmwGmAFRHINHSAO7p9GjvgalVBPNptTfYEef8YsZdJdlA3q2
	vSKRkKPOF6y+u4S4OP5GSyOrPWUdNF8H6T63bDLRZ3GoSNniQYqyJHv3
X-Gm-Gg: ASbGnctDYdXwjdgVZE/p+PpVZSCewyWPayRvYPZuPVCi0XEuobo2DVfiixxumo7IKRz
	UXPPNW1fdEwYdpostqkJaRhMYZ7QJOWzJ1TACjtuhbWdakSbpwGOJ5VKL5KlY5yfiITkR557ZtV
	8Z1zLpqXxAkp+67qkM2olTTKWIAA1rza8/aRMQaY/JltZHPYkcrijBRbI37R2bhnrdkIaJ6Vrwz
	TH7trG2kiQX/x5GivFpTKyP2Xaqad1PQfHMW/wU0uLMzF8gcF0MGVcMmqRdi9FpPx27rh0FUO1R
	HeanBEEaInWTdnBxM5wlwkN/RlUotADsH2br/sRv8Klca5+euTlzLpdpltHZslHX/G2y2gPK4O0
	zs/E7KUSTc6rUVWstbYLy+IRaTW4jwFH7BYeYmZVjSINZd43brS2oUXweKsmSWhQZauWdDMPy3W
	FJ11z78xA+5YCndGK/UsiBTyJhrm0OKlA3hYfu6g==
X-Google-Smtp-Source: AGHT+IG/Eta9H7LYA39y2DTXjRpl0eAQHOhH3wq89aCFtUYEwpNsngjLk7o4A0zETlY/YY2uNySFTg==
X-Received: by 2002:a17:907:a0b:b0:b72:5e2c:9e97 with SMTP id a640c23a62f3a-b7367b8b6bfmr226704866b.36.1763127507961;
        Fri, 14 Nov 2025 05:38:27 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:27 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v5 5/6] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Fri, 14 Nov 2025 05:37:37 -0800
Message-ID: <20251114133738.1762-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053829_947594_652701F1 
X-CRM114-Status: GOOD (  12.32  )
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
index d3396f37d1ff..83fc8bcf80ab 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -3,6 +3,7 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 
 #include <linux/auxiliary_bus.h>
@@ -18,6 +19,8 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 
+#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int bit;
@@ -52,6 +55,44 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
 	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
 };
 
+static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 25,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 16,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 13,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 5,
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 4,
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 3,
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


