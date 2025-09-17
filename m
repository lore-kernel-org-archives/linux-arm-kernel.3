Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BECCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/q3PAqpa8JFRI5D9goTpJtfgHgbqQ+Qd/SJYCaxuYg=; b=LNA6bEfVZk+bO0Ja5EsB/Ud8Ds
	PnQT04AxXfJAdxPiw3onqSZwpDffImPoqu33OHTStYUE9U8bQzWilvM7p0O2oFt7OVO70hZ/KSmHM
	ccHG+N4+S4pE9NJlEoQ+cP1PrqxqVNMjE4ekr8FlHzx7RTLBfOMAot3Ra/m7Ple+aSFldnimZ7EhC
	eoj+J9H19Mgtv7Ibujevl9vyjo7pXbM0SCbAUXVdVP9i2ixQ/Z3yd9R/x6wsYEJVhMDPabQRVBSAX
	0fX5wZ4+u8zB2AwyaYqtYB9yDOcCVUDIRCiOOPyEP/Ovu2wYcBLxdcfT9njsea+SAcCimJj89OBgH
	wzUzrq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynAn-0000000AZQl-3l8b;
	Wed, 17 Sep 2025 08:05:53 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynAi-0000000AZLt-2aJ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:05:49 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b00a9989633so144057066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096347; x=1758701147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/q3PAqpa8JFRI5D9goTpJtfgHgbqQ+Qd/SJYCaxuYg=;
        b=dqkK2xE5AXaZtINI3WnV3jPj3JUSh40efZJCXnGdNRWpiwSIqWFQOAFg42Q8tSHT4j
         ImQDoZUMnk9x/iy7xWODHP9DNQ45lfsI0HsAjFJ0ubmD/M7jjrDVVqk7kmeyrMgVaFQ9
         fMMIp9E6lXVSaOMsH4H5v4sYzL+KNXVbZFER4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096347; x=1758701147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/q3PAqpa8JFRI5D9goTpJtfgHgbqQ+Qd/SJYCaxuYg=;
        b=qTNoZKotUq74VPOeuwvnG+A2G2kpuOYyFGLHx3ZaODDgrCnsINRMzbaGuX+Fo8SgeQ
         qQhjyfm0ByLPrw1lue15eEZXJJmypWfkxBYOEu90vy7t/OWwbrBRjbSNdH4C3PyrXB93
         O5eFzfC7nLViSkca4cW5JTiUWsng1nw1WUAd+Ce7FI39o/IqLeDWpOc8J5R++GHYAk5N
         hwJFQ5UBsuwUi0yF+AtNs9xYdgIbwaVKORVrzKd8+mzTvQ96I5Qt1mhVgTgXCsqOA1A/
         NnYi4Syp4k7iU7hVJQwTaEKLgyzK2MR5liRuZS8dpXMc2h4VsF7jIhAiuIVmFY5GLbtm
         vtKA==
X-Forwarded-Encrypted: i=1; AJvYcCWbc/SofAg6k0KrnjqB5O15gTIUIdrlyvCuLFyHV2S5i//8CyIUg0iPlxW/5D59uxfH/Ndz0RzC96Xk97ClVHCQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt7Jp+1vVlPYDymb5GzPg6GPLmwJo9u9S+YsBkWhqgvBO8xApe
	qbCRLYkw2SpASbqcNrnf4dp9dASq23C0M9Oa7DShlyJawszLnUWEyCaBVwZIY40YoU8=
X-Gm-Gg: ASbGncu/QWDcM8oNn/qBkvzjabxwVp8UpIWOyRrpy+pkbPrlNzfg9I9QyjWS1MURBHx
	YRI7oiB19FAmxD95Epfb7A9bGwuRvM+HflUu9JECpT4KDUlm9NQUF2eFhcRyW1KH+dpa3prQZ0G
	wxgl+OFaVL6x5na99bmHc+NoGvxYaJShJrZBTeagX3u6IhbTOU6aNNwngJeAJ0KfoG4AirDYaj7
	XKg0mTrHv2UAER2/mRD1dkaDFKtj6lshbhlKE0akA7oeDj5wNorKlPtxFEXLqQhCLgch37JpQVr
	OKRegkTUV5DsRu7DgIhZ/68h9mRh5EzRVHiQxNxT96Kt8ZNNAbLGgsAJi31ROlKPJyxRDa00XQ2
	bCw4cSjgY+wFvUjoJA9CxeQBEg9m/baGGpwFOxpxcfbR8NH/Wg/lWAwpNG/YVGJgqZ9dMqA==
X-Google-Smtp-Source: AGHT+IFI+EUW9a0B9XdUO1VlBQi6AjaLzsT/+VpJZU5LQRGIlw+U+tPUlEHvyjyZdrFs1s7rII991Q==
X-Received: by 2002:a17:906:c14c:b0:b07:c383:8104 with SMTP id a640c23a62f3a-b167ea6334emr662752366b.13.1758096346480;
        Wed, 17 Sep 2025 01:05:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Wed, 17 Sep 2025 10:05:11 +0200
Message-ID: <20250917080534.1772202-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_010548_678541_A3DC7ACE 
X-CRM114-Status: GOOD (  17.89  )
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

Set the glitch threshold previously hardcoded in the driver. The change
is backward compatible.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Adjust property description fsl,imx6ul-tsc.yaml following the
  suggestions of Conor Dooley and Frank Li.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details in fsl,imx6ul-tsc.yaml.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.
- Rework to match changes made to the DTS property.

 drivers/input/touchscreen/imx6ul_tsc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index e2c59cc7c82c..0d753aa05fbf 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -79,7 +79,7 @@
 #define MEASURE_SIG_EN		BIT(0)
 #define VALID_SIG_EN		BIT(8)
 #define DE_GLITCH_MASK		GENMASK(30, 29)
-#define DE_GLITCH_2		0x02
+#define DE_GLITCH_DEF		0x02
 #define START_SENSE		BIT(12)
 #define TSC_DISABLE		BIT(16)
 #define DETECT_MODE		0x2
@@ -98,6 +98,7 @@ struct imx6ul_tsc {
 	u32 pre_charge_time;
 	bool average_enable;
 	u32 average_select;
+	u32 de_glitch;
 
 	struct completion completion;
 };
@@ -205,7 +206,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 	basic_setting |= AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
-	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, DE_GLITCH_2);
+	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
 	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
 	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
@@ -391,6 +392,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	int tsc_irq;
 	int adc_irq;
 	u32 average_samples;
+	u32 de_glitch;
 
 	tsc = devm_kzalloc(&pdev->dev, sizeof(*tsc), GFP_KERNEL);
 	if (!tsc)
@@ -513,6 +515,26 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "touchscreen-glitch-threshold-ns",
+				   &de_glitch);
+	if (err) {
+		tsc->de_glitch = DE_GLITCH_DEF;
+	} else {
+		u64 cycles;
+		unsigned long rate = clk_get_rate(tsc->tsc_clk);
+
+		cycles = DIV64_U64_ROUND_UP((u64)de_glitch * rate, NSEC_PER_SEC);
+
+		if (cycles <= 0x3ff)
+			tsc->de_glitch = 3;
+		else if (cycles <= 0x7ff)
+			tsc->de_glitch = 2;
+		else if (cycles <= 0xfff)
+			tsc->de_glitch = 1;
+		else
+			tsc->de_glitch = 0;
+	}
+
 	err = input_register_device(tsc->input);
 	if (err) {
 		dev_err(&pdev->dev,
-- 
2.43.0


