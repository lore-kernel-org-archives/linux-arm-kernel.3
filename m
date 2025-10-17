Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29F0CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUV6qtcx4rMTHA9YbDeCb7EleNNSZvqvmp58IK55HCg=; b=NZYaTMw86HBbgHyqhnKIUcY8rZ
	mjpBFh/gXdWaP7eshG6F8z0W9FjivfJjQk9+4/mDlyWSHeSpEYtATIn0aBCD8DLtWJr568hIwkhJe
	3K2wh8tttYL7aOK71fqB+TAi4SjRMkpL+m0ofjCuM7AawfbYCitNUFBdJiNMGnvAy+dadLvZKy58b
	BUCD5ZZRyvXNIR2EPhwSR7IYKfp6NnuzugXdH73LzdZuCa0mLq7Q7vvzOrkQs7vzvZoSp7uCv10jk
	6lMx5ihcNs5SkVIHZy7+QzPdkedhtPpIdU556aZNwRhfQFK//79ULjNZ2mIrtogeEN/mzveoamPME
	rQuSWEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iX9-00000007evc-41h5;
	Fri, 17 Oct 2025 11:22:07 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iX2-00000007end-3P1Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:22:02 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b3e9d633b78so419095366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700119; x=1761304919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUV6qtcx4rMTHA9YbDeCb7EleNNSZvqvmp58IK55HCg=;
        b=UwA21yPnIsI4+sg3FZQ7H0lTukyk7ozDvKqg9355/IpK2EbFHyB0GiesccosqH7Zjv
         DJQtpqN0jVEGMjfV8H0IabTzTJaBkhfvZb1M3UF0zXhCXdCpc7aS+vwonV7x6+JIC39P
         +C+H/47Wfmxbj2hx6YZorUbZ/+nYkIXyTiQrehMfAe0Ndy1qUSLu/ijQEKMgNTHgQ2uv
         SKACVTkuFZvE8s9d841xEv1H4hne/3yRlwnjZgnGHCRu0IZIPHy/HkCR+UfkUJjSGWko
         /Mz1rDDPM1I1AiWZMy9qMHX0GW1PtI41yXiNEgPD9XYEV2k/AQkOsoToSzqJjxsEgITN
         GIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700119; x=1761304919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUV6qtcx4rMTHA9YbDeCb7EleNNSZvqvmp58IK55HCg=;
        b=fyoCd3FTYEq0N6ThhULb/pJQaxklysCN4R1L3rHrKKO7R072fQ9Ue7fxZCTaBkt5LC
         ALMYBa5+CyBnoLU7OxarLFn3x8/991Gm5MbORjqk+vV6gJwdqmGpBs9htYeQt++lE56o
         H2/kwH2UtV5nH//WJEtVdZWLmbWo2Mie9PtYg9JJ2C6IBUfwuHgGRIJyjRZW4q2Fg/IF
         CG6JeQScoMK4NTabgzJEuGLxccZ3aA7rrywRcpHhCgsZYe0QBi5b7xYQyzlxCFLCk2PK
         8kGetYpkLxzBu3kuykBeuPRUJZfsHMjCGi00X4HnSRZMqRRwLBrJ209wgQDMRphM4iEN
         unYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6jEyoJvAZ+NwXeI0tntom8XxpdqgVUtExwE2JX4Dc0AkFDIyNMx1N0pQMLDVLrWSyS/cl04j9I5MIYkbdvtyB@lists.infradead.org
X-Gm-Message-State: AOJu0YyBkRiQSWYaEo9k5KWmXRI5WMQklVetvov9EWDTLmIKuIva2nYy
	1dgeKo9i4s+o5BlJ8ZzNhDqRm97Ht9tvn9oDUSHaK5WMYgCATWnqFEYY
X-Gm-Gg: ASbGncsOcAeO/HYDcFHtvTxOFQWz26NsvIh76a5LNvGwGvzTfyvgj2Lo/vsMLB4qNVB
	55VKlO5gc+bcF0w41oL7uSs7ZmEtCaGM49cK3lSaFkbQeq853V+L4bjIn84DzD209Q0ofsMmBFw
	UZ0GpG2CoLMz/OvKO9q2QUlWr0gNB8hMg+y9B7dRhv91blcZK1ru6W4I69V2QQJ07FbT5meNYAy
	g4ML/VuisXo1RxKtj1MM+4RCzZsreqXsixkBdAS1adW0UHPln1qgKzZHWkMZYGrl9w69pbyCb4M
	Kyp2ROy9ocO+hy91qRB4vrd4whv8nWASXdeFA9Rgj9rA2dAgPKWt3yKK77sHCGbQrudabqGeyaA
	eX0Kjr/5uz4y7wcdzGWzd71GTUSh75raR9/Lrhz7PhItV3S3f/Y0BRXJon+ZnYqBulydgaPNJvn
	Q8OJaJaizeN8VqigNtsktc4Jv6mI4AchW0IRUOFg==
X-Google-Smtp-Source: AGHT+IGBmOLlRjgaTi3Dp0i7n6ywhQoBAle46tY4Ru1l6tF04+Mf45lE3lTlEpkDb4XkYETG5Xjxmw==
X-Received: by 2002:a17:907:a0b:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b645d20ef0fmr390859366b.9.1760700119091;
        Fri, 17 Oct 2025 04:21:59 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:58 -0700 (PDT)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Fri, 17 Oct 2025 04:20:24 -0700
Message-ID: <20251017112025.11997-8-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_042200_901441_BCDE65AE 
X-CRM114-Status: GOOD (  12.95  )
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
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index c370913107f5..b333d7c1442a 100644
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
@@ -55,6 +58,50 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
 	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
 };
 
+static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(25),
+		.shift = 25,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(16),
+		.shift = 16,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(13),
+		.shift = 13,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(5),
+		.shift = 5,
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(4),
+		.shift = 4,
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(3),
+		.shift = 3,
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
 	void __iomem *base;
@@ -183,6 +230,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
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


