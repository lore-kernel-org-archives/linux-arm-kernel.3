Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF7ED10F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MS47VPO6RNZssHSPn4CeLg1VobQSQVVSULTdfhTMk9Y=; b=L+YphJmhqFn5uqMt6wMCIweG69
	0M4g3KptF9rzehP2ipbNOpwpXbykhWjNDwwW88SDDQwsluywJ5LIbcROgT3JNJBaT3rtjL8jg12My
	T1fnf7w6BP5aqTgFBU22V14Wio2xRj7rI2uf42qKOcZ0iD8tpOXR9yJHFySAUlo+9vF4+roVzrvXZ
	qEBb2xW97//JlX5N7Tzp4SLYFM0Nud10fBlqvUU1SHYCqcfnsnu4gn+FC5qRdOGXQYkHIOk9E4lAQ
	pWgmiXHLRmfQSSqq/nl/D1pz92gb1vZEOGDa/9lgbcTdMKWnWkfMrpvO/cql9JXOYNsyvdJPVcVuv
	vLVs3giA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErn-0000000EzsG-1552;
	Wed, 26 Nov 2025 12:43:27 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErW-0000000Ezjq-0Plz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:43:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso11550406a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 04:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160988; x=1764765788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS47VPO6RNZssHSPn4CeLg1VobQSQVVSULTdfhTMk9Y=;
        b=b5Koye9Yp3M8Xyr/MCMEx/7/6JTnifKlL4ifkHoqSlj/Q3mD15gFdcNGOkZLUgCnIK
         9yHVDtGD3tb1J8126zVlEPm9EGysjuBPAyP8hssjOQzg+b4o2430R7iPb06lSB4y5p8B
         baIWGRAPNQcJ5B6LNmlEtWFf2D44RalA5ge7odH5Wy6sQUjDnjtSMopVRsuw2WDyt0u7
         PuGxl6xWXpvlhMo/QUhaUNvxfHwf6U6FxE1ydRsneHawhQxZ9hFMnS4vK5BNfSaTvzxF
         m6uZai5u+RfrMzvs21KRiOvdd9UlBNrnbg1Cf2w2eUgTa3IsCV2R2+fST/vMQzdPshi8
         4VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160988; x=1764765788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MS47VPO6RNZssHSPn4CeLg1VobQSQVVSULTdfhTMk9Y=;
        b=N+95RPSCr6N6K6CsbqyG0QbxZHWP5MWE9G82QsSI7LdCclJb9FKIhL8Wf8c0nz1Xm0
         X+gokGXmXe6AmY6z6+3Ln13uWjRZJqRWd4KE2U0bVeQwfzHqUUUI2HLKI/r/tvh9lf3T
         H9R/nFu4/cgiB9udUl/k4BLmGdcj+gJQ6Lm6zZgTNzaughDKjdL4B/GP2a3xNvu9zv+o
         j0Q0h6vz+wNKLrjsMbWrlZpeyR8GdwLB3YUZtqfbDIrgM6Ckg1BfwzOgxIOw+Zk/K1U4
         L8BZe4Ma+R6uv3wOcgXSEh38eA2btbJslynfgCJQ2TYvZPLNc5V6RjnA8pdkvO+Ewd9+
         1MDA==
X-Forwarded-Encrypted: i=1; AJvYcCVHeuPwo/UgESwZ0BRDSvgrrlCC5vCNkhNuz81peY1IBfEkAeoR2nRYdeWgoBMfrPG78ME+Ur9sg5zO9j3dMJ6F@lists.infradead.org
X-Gm-Message-State: AOJu0YxsULfxQHPadJubSk/T0EYVLeKi6MYpRqICXVznzlOm8ENNAVBi
	ZWk6F6w23X9VShN0/krRMCVNrKd6GT2/zV08rDwa0g+2KYYQfQVcRbf4
X-Gm-Gg: ASbGnctEXY8RLLe7Bpb9jdAIh0ipL+sC6P05bPDvubR/CMEunE4WRu58gCS8YZ7PUqb
	TRfX8z4QBsqLVPzz7R9+qKZPKtU9A4RgtHtvegbrrSpcNUp7Vjp97oyY8Fy3sqYX/M94DLYoOH7
	4lytDecQEhm1aHa9eqT17uPx/J8NzI8Qvh+9SpkmqKcw31j4SHcZPM79E1he63xUGicH0lA2hOm
	k/x6NnaDCIqtGahLpeQBCmRKsvcfs6GnoBKxR4upEbflh7ElBwqXlVdeTxdVwBJsrV90TazvK0t
	9yK4WxPw1Eekx1Ck8PQoVVwkQnMmUr5bzxT24PkJXjqedkn0mdbudrBCV90YyPX+6kHzpUsWv8q
	I258+bZFH3ub+0+RO0A8OLaWoiN+CgSOYTsMDa5N6+kFMxDjpD0DpnSzBp9LklEWFGYurFav8vL
	wANl2QrqOo151punZJe94v97rOfa3YerWdBlKg
X-Google-Smtp-Source: AGHT+IGKniOPsuMqLGWG0SkLA1Zky3npjxWYZzJjefGtqxfKracate5d7l4F20Qx0HfNwyP4Of2daA==
X-Received: by 2002:a05:6402:26d2:b0:640:b808:75f8 with SMTP id 4fb4d7f45d1cf-64554339a47mr16014476a12.7.1764160988003;
        Wed, 26 Nov 2025 04:43:08 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:43:07 -0800 (PST)
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
Subject: [PATCH v6 4/5] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Wed, 26 Nov 2025 04:42:17 -0800
Message-ID: <20251126124218.803-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_044310_200800_B1AF3C4C 
X-CRM114-Status: GOOD (  12.64  )
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 00eee528a2d2..b7fa3110f282 100644
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
 	unsigned int mask;
@@ -52,6 +55,44 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
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
@@ -182,6 +223,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
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


