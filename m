Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51080CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqadXdSW1D0YdX9y/VYCHcP9OLLjsnrvbDdXfqIeuyU=; b=0kpwlgofZosMF+al9ny74nqaG3
	reQjiiGxJy0RdmXcuVlRMb7xKPkpjUDL/cdFlKLL8MO/I3UxFupKdPfQfJHTpt6Wac6WyFBwg0woz
	SzRTKXgSDRTOzWRuN5NRx83PN6oGjwXnqw1wBo1gP5rsfoCx5IatF0/zYrjmQNxbiFkpyZzd5vxj/
	qcu8a9qVRIYXZsCc2zrCGDhB+Ka22RBXwTEfiTpy/zgux/gsy/9HXHfvVr9V0yQY7yxfo1Iz93IA1
	wUaB84F7EgTrWJE+19F367vAYF2bzegdAD7V9vz69JeVzWsR3ytOC3WM0L5uEYsXuuWI32xZtTHjR
	2+DPitTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFH4-00000005Y80-0M9B;
	Mon, 15 Sep 2025 19:54:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFGz-00000005Y3n-1pkm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 19:54:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso35025395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 12:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966039; x=1758570839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqadXdSW1D0YdX9y/VYCHcP9OLLjsnrvbDdXfqIeuyU=;
        b=cINsSg8LOS6s5LTfoe5UhsSJvkmpO+j+B8n21A5IOrPIcdJqWqyLS89a86o7wCLVbe
         VjjY4a+yg1nHH85ahnlITLytJPl/vLI0UwcZeq0JvnYugNBJBoOFKlbGbtAED4YyM7lx
         m2t33nMbg40fEdYbWTTT1bkEwsV2WGsu8MH0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966039; x=1758570839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqadXdSW1D0YdX9y/VYCHcP9OLLjsnrvbDdXfqIeuyU=;
        b=OIIuGTqT39/cXkjWmmXceTrH5DZsNSjI5Nw5agqaZR0oYC6ywXjZT44VUoi/Wzys8F
         xjypzTiolrP/iW7xHcgloEKR+Y3werXX6DcZt1SqF4HNFhP5gaSzBTeiRRTj1y2BoDXj
         vpsjYcTJ+BjwE1Pp8nXZ5djlRXS+wjdflvbcCAtMmK5ESli5QxT3y5zqCmi7YrXjcwZF
         Btp0PoULAr6Yeu6TvEIZEZKvu8J2Qb9Q4rIre2OYZnTvCm5n69pyjoS8x1bc3FKRSeHi
         lZAF/KwIMjlm02KUC2qwo7ccMmuGto8WEFYwMQbMyCHAr1MmEomUw/AmFdE2z0YoF8Qc
         au5A==
X-Forwarded-Encrypted: i=1; AJvYcCV0xuBEs2M86Im05+nL8T6Hyrjw8uLKEocr61+7F1nA2rD3otk1oKjuhecCW6ot7dv+OPzxhYsaTkzJNwmE+fE1@lists.infradead.org
X-Gm-Message-State: AOJu0YwKQz0MKU3vCjKBFSe5b/dmeIvoIwuJfP1FOgY0Jy2EXfT6HSMn
	s+CNPvkr+lnH2mNAo4GiGyjBAlVvuvvpFIXFgce2vjZdBOhtZMA6Cz7S9xXbkKwSbok=
X-Gm-Gg: ASbGncvGRztc4aZKyf5jN74cz3YikebVVKG5aK3M9afB/ZeQRJIsQ2lcdH9azg4+s4Y
	9a86RhC+dDduLpdvHvdpefxdsSIOm/h7QZNTPUAzZAPqP711hvTq40RdqyN8eE37QvADOZkMA+J
	OUwmdHmvIum6QKLiGfgAicpFgzQTp4YKsE25YNQ462M/Ji1DecPgl9II/l3ej7Fiwyfqnh68TLq
	AqplgAT7fyWzw7eoN7xe7g6FwbFJfcdZya2YipUt7b4KDYCTz8pezft2EDnjc0cBbU8whXfSyuw
	fygiFpQtku3zcK2al86VumxS84jvKjIVlWwMQ/ihXqhLDjlFTh7mydIy+yyfMqul8jLbg27a/oh
	76wlD6RemfR/hQpDgX2SviI6jsl0zRBdxcUtPDPMCUGHSADMazprSson+RBzkxTI=
X-Google-Smtp-Source: AGHT+IFX174NiBczGaK/x3CIfQpHj6Pi6AzSfzk1fSmasGkNMFC1MAnI/pPMBLk/mLUpvLPRyiHwCA==
X-Received: by 2002:a05:600c:4453:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45f211f2fbemr160469475e9.24.1757966039580;
        Mon, 15 Sep 2025 12:53:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v3 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Mon, 15 Sep 2025 21:53:08 +0200
Message-ID: <20250915195335.1710780-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_125401_491401_BBA680D6 
X-CRM114-Status: GOOD (  17.90  )
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


