Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4F6D19503
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MS47VPO6RNZssHSPn4CeLg1VobQSQVVSULTdfhTMk9Y=; b=iNS51fQ7wQcm04dQ2aD24zPH51
	O4l/SuLL+eFU19C97BY8lBcmxipLLMxytjD4qajXMTcdfGt9cvdgidJsXpM+gaGhojJFXKCt0s22a
	qZrm4tkOlLsW+l324tivThXVf5+c3jpMzNWCX4FMj7wq2GE64QGMAazresaN32tsKpNnAumqmnTVk
	Vc1HAOACm0l5qZJhEkssNMrcDg3mYDI7aL02gOoVL74QcKYwbWiOkR03Te5/1rhQjxria/qWAfk42
	1PIe1MO2oH99eLYldVF0rnq7C3MFeasau67ogt28cc5PxgtMj3yUej8fRmJTdri7d7A2eeDteb4OO
	kAntPs+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPMA-0000000Cr7W-35zH;
	Mon, 26 Jan 2026 16:22:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPM3-0000000Cr3m-2XoS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:22:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48049955f7fso40299355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444538; x=1770049338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS47VPO6RNZssHSPn4CeLg1VobQSQVVSULTdfhTMk9Y=;
        b=FUkVLoA4LPq76gvNgNQ7gAQ9F4dOoWID/6ySHXKPYaohkiGqduv4ms5VzpzkOsOkJz
         CR10MypfsYrzWYCAdYG0iTm4SQTGEZhqeMTKVTPDSrqWvJGIsXsqAUSli+dEbiLEHLZF
         4hEE6U7lPSTQK6Gy9TwBT+cEVZ++PBV5CYyC0aSIy2JQT2EoY9AwzgNvodgImZOMJGxd
         4od+DeYfCZ6id9oP8otOPK77gyiyotSf6cQQ0H89b+jn6mUiMMszoT45yoO/cYoMt1GM
         tUaJQMbXT9Y9Jg4dDXtCGrf4W4Hl3C+7ElFrAVAgIXniPvxnGmImiBSNJIwjUB2AqUTc
         G8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444538; x=1770049338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MS47VPO6RNZssHSPn4CeLg1VobQSQVVSULTdfhTMk9Y=;
        b=oQk8f2F5eMu1J9GUYawhLfnfBtONR9Ze87bAUFJcC8d99PzU0pJH6TCT0CFbeGMijG
         tpfwyxTmJ+/lAIvcHkjat2ZfNDhZpNpiNbWpVD8hE1AOazPdl0cdUJMPLI7/YnV5dn7C
         zDaJa15BiSTFdB72vsnJXMJyY05E7xHq/wUEaggNVhwYHLXrxJEaRDpoDjzbTkru/Fyw
         srFwSzbE5XlsO+IHU7gj23JAs3nJxQzSHx03mEi++J9wGD0OtA5J5yUxEQ8v6SXP7GwW
         i0UtEuLKAhcm9WyF48SgkDEyJvm+5wFQxAu9e2GQsOnD54F1rCAq/Fl3+MFFILTKKB0Y
         X4dg==
X-Forwarded-Encrypted: i=1; AJvYcCUW5uTjspI9ou6GVFKrQbFIFzSe8KwhmLGJEu3XEDWU4S+s8maEgTGdwTX3VuGxgfHQS77b0GRdumQEVQVRRMIY@lists.infradead.org
X-Gm-Message-State: AOJu0YxnQc9LYAAY4P9ifOk32KcP3I3uI4qyoqDpNXctAHUvB63747BL
	TiEYoKuHplhtjpPlHy5ly2JKYwAJQfd66QZ1KI9I74gPNQwCfTjKy9QP
X-Gm-Gg: AZuq6aLWoyiWqQbSaA/F102OIPVN+wWf832ZQ9cC0CKDt0wVMENWWVIo+MjxQ8Dxz3j
	WmnsQdeNcE1amJ/ioWbtv/mHNfAFwdXQCENP4mHicNsJrs1nwWLeUinNutxmJUtQMT6YFRd+6U5
	mY+ZhTonAExEq5rVCTQfYv5VEkn0JUOpnQrAD8tiyJXcSipWtLBDmBqOVpiaECpM9CrtthnhmPs
	a7Aj0973U2hdNSeBEonquA9eM4PiInzWv/A9XmdUmjOzV7/wohTRfN/BL3qsZxBqAVKWriwk9Qx
	roOBWjeeYgtfXrz4bRyag7VyOssn+3FPIl09U+GcqE08uck14k871LP8h55x3nj9+2qv7qIgLRt
	wS6eTniyc/3ngVp2srTQ3dp8SfZLtxAl6l1Qd/ydgV9Id/cnjFPmjZE7LXYfwlo6EWu2ZE779gE
	3kcJ4tBtAbxK1rPlNYDZbUiUgSJNUQb4wO9FcImQ==
X-Received: by 2002:a05:600c:c0d5:b0:480:4c20:6a06 with SMTP id 5b1f17b1804b1-4805f66ce22mr49700305e9.17.1769444537616;
        Mon, 26 Jan 2026 08:22:17 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm370371035e9.14.2026.01.26.08.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:22:17 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v7 4/4] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Mon, 26 Jan 2026 08:22:03 -0800
Message-ID: <20260126162203.708-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
References: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_082219_662398_D2CAC75D 
X-CRM114-Status: GOOD (  12.29  )
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


