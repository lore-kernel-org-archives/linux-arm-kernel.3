Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C68C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns9K/OM0OlSKhVmMZUPRzp8mdJBBQqc3nvPasnNJ9zU=; b=n3Liw5v6IYSUOX3MIr2H9H94x6
	0QZZ9dGlaa9tWV/rZShIEpG/CD6m3epQr5CgIWV/LHE7o+qCNQk/TpHIqt/h+YdDtT1aawGqP6dC1
	g8kekFtEJeJXo2d5sklQDVSMl9JUPX1fqHEaGtH5d6m58w45zeDwSEBMLjUWPyEebWLlG4OWPq4nR
	W9aqUYR8HJBw4mRUjg/ngkIk2NvKvEg6GR+wrSh6qOx9KnXKQY8Jtl6+4EZjCht1aTCFnsDf5Ce/L
	QHPCZjFAIlCyt2gfaQNaRX3Orwjihw5CBUfn0vgJJ+dicD25adMiavO+QMfpmrIh8Iroy1l4Ndqhc
	w9dk4p0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiy1X-0000000AyXI-2LB3;
	Mon, 04 Aug 2025 16:26:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixX5-0000000Atu0-016h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:55:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af9180a11bcso957621866b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322925; x=1754927725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ns9K/OM0OlSKhVmMZUPRzp8mdJBBQqc3nvPasnNJ9zU=;
        b=PmJfMTXkVjghoAUoq9CEELe6UjD0Zu2dPbzosvNqxRJmHP5DeCUyKKGMgYCqfkrD0P
         s5jyduuUKQox/MvKsBwkREDOiBkkYqFxLVQfeJqxxdfX1j0h65LsYTrD4PleYktasJQ+
         66kB0s9E8FyIxxi6lFpPDEa0rSvUU+R2CIq/Ke0D7cUo7o0ZFxPZ+Pk/VPd6WhqXVsH6
         VpMO5reidGILoGDTP/oQf8VVQr4FQ2q6Px3PwSp7XaT3+cBsXFwVU/zn7n0Nwaj1THDU
         lQhbzZK2XH5a9iIs8vlj5yyeAKLIBFHeix9j+OGPmkZvCjFX4yw1lKkZ/r5kTqLU4YM2
         bUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322925; x=1754927725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ns9K/OM0OlSKhVmMZUPRzp8mdJBBQqc3nvPasnNJ9zU=;
        b=c7+KT2BpT/YrZH8ypACDE7v5Ipm/Qu8Ecnt+loJ4Y2YsiBk+8OHzHuwPrHwbCbcwHE
         b7Ygt1i2QV73Z1hWpyHWV6eDzMgRsgyIMbWt8zdhJLVN70Xhk6zBLRmsNzr2ueqTdQ0B
         eJ9JiOUtRwuLNrgC2iEGuN4hm2bcVbWpWMvrknZkWPtpxVfiuWppjk6gNJFP0Bcx/PR2
         m2yVj/Y4xtxWWSnhwGcvTGvko9eFIirmNi7F9EDQECItpvo39TTzrU451iYMAQ602Wic
         m9BBHYa7s5OEPRvs/yvKtt0UbEx6ml1gECA1WQnl21ULEamxMQUj+Xd8vFsaazQwcJdq
         +M6A==
X-Forwarded-Encrypted: i=1; AJvYcCVfY+DVng7wL6LdiGLHyHUZSm2eZG8KtR8Ay8ZdoCxvd9MD/DMSDEabR+pi8vLy1Q7dEO4MFOacKoeGv0RqArpD@lists.infradead.org
X-Gm-Message-State: AOJu0YyUdpd8qkz8hvoXyAkHcTsZv3qoX5pWP5ml+p9PXyZGk8I2H2rw
	KLdH2DbUIQFz6looZ0WutepMsSjC2B44CpBIgTCy5WEpzHWtGKfOKARx
X-Gm-Gg: ASbGncuNiRLQ0UaX3liFi6bs9EYfW3KaqlX7geade96iHJlBYkbyUwlSyFPhkVI2SHt
	uV4Q9EVQFg5VBqB29y+Nhn+V99Ds+eqRXK4G2uMKu3zdYAqi7hqZd9oFXV62xlUBbKJCq7dfovP
	vwKMrkmsK0KCHj0UAKUJr+JIWrT7eViAMzx5UcpThEFcxnoWVo86+ZDj7sLyoIEixNZAByidBF1
	HpMzcQHq2Pk+7RkJxbLjUfvnfjacEo09kVlK0/HAAEJyuMW4W/7RSpssGBUqaKDUTg2kQSxUeSS
	FS9wBLgiIW/7tiuDsSH2z4ldsuHls8XjxQCaJKqCbO5wKnPbhCs41F4KDnHUnPbtSy5JFs+3fSX
	YtbN7/eP3X2iToJbHYugbZBQYJgRtWyJtN6Q824zvVtZKaN1sQ/VpE8dqu7s=
X-Google-Smtp-Source: AGHT+IEouzbjulkG+wmc2r45tzYYbBoKFNbyGXyIRI/lLFnz2uUKUnF6zkDeOJPorwY1elRfZNGXiA==
X-Received: by 2002:a17:907:1c1b:b0:af9:415e:2f38 with SMTP id a640c23a62f3a-af97d29c92fmr13675466b.7.1754322925044;
        Mon, 04 Aug 2025 08:55:25 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:24 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 6/7] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Mon,  4 Aug 2025 11:54:06 -0400
Message-Id: <20250804155407.285353-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_085527_050053_C1D6D8BF 
X-CRM114-Status: GOOD (  13.43  )
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

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index a3d0bd823272..2ab701ef1c30 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
+#include <dt-bindings/reset/imx8ulp-reset-sim-lpav.h>
 
 #include <linux/auxiliary_bus.h>
 #include <linux/device.h>
@@ -20,6 +21,8 @@
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
 
+#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -54,6 +57,44 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
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
 	spinlock_t lock; /* protect register read-modify-write cycle */
@@ -159,6 +200,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
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
2.34.1


