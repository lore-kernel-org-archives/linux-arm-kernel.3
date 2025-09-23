Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CC8CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDNPkG1BJO1AhX7f67y0O0jm17yTyZBB5A5XJjEod98=; b=gdDpw7if4lAFU96lV7joZbLkoj
	zeBIqhChBRXoOvoQp3QZVALeNfQDWS3tGvab52W7IlPCrrm3wqlqtpXCChG7CRLp9RR+txfxJ37jF
	/CDlVzhFFN1lb4cVgPKlwMtsxN1TqOhLAp93E5fufkUU+Yma5XRafDedk128Q82mmj2/rWtkznEVQ
	dcEggZLdW3cNJS2r9rjitG0P96XOlFYDnjRy/qDMAQNlKSzqErc+1fR7cmil0V2RBlQrRYql72m9u
	LuWJ6i4g83/fIS78aTtQS3PEGaYkkjRGm5uLHL8fGUzgSWSeEePXiHk9KnldAvpZPdXkivqe70KKS
	NmXRS39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149Y-0000000DpMk-35kZ;
	Tue, 23 Sep 2025 14:38:00 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149S-0000000DpFj-39uo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:37:55 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b04b55d5a2cso1012350666b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638273; x=1759243073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDNPkG1BJO1AhX7f67y0O0jm17yTyZBB5A5XJjEod98=;
        b=cuAU3X1V+WPhOZAU+ndmYovSHwhtCAmfy0tR4IIWdUX+IJgiZoz6XD/MiFZMwGXdl+
         gD56DrsPlX7aw8rfmKB+d8KyJC7jSg2S7f/xqZZNpg/oQka0l42I0WEqtzSdSi4B3CK0
         Kc3J97CpaGgkIlMdS+uaWETCCaJax2mriogAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638273; x=1759243073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDNPkG1BJO1AhX7f67y0O0jm17yTyZBB5A5XJjEod98=;
        b=Qlf9XA4qx72Fh38GEwf0DgkLVURetppouNv6EcXDSd6Hi00Z9dazwn0P+EHLy523xE
         Efb1AlGpoTDd0YMETVCY1tOMu9zfPQ5O6vg1+cqm/KqpK6VEh23Avtc3Y5ckDLyXi8Xp
         zfSx8/46YwsQ+e1STSjKYQZps2xr7bCD4579xPY+y8pz/qsbyuRz8G2WmC6sSfBnFKGv
         bs0mJcq566Wp9C4tcW1CpJ2mJKmwVJohqExeaM1LYyDPd/FcxRDXq2rt7B2Q4iiVwpBy
         P5wQFD8Oo9tKb2czSXh4KRG/XwidsLK5h7bdiHkCSdt6nvomJ1EbEo0/Bc7cX8vqqkSR
         1k6g==
X-Forwarded-Encrypted: i=1; AJvYcCVdxsUkcyHOv3tqQfnnRfVOl6Izgkmb+41EMAIgKGLuxCxTzJFH/t/70+kMBgHbpQJcgIaavOqbpgALL31c6zvw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1vw/K670ABgm0blBhxk0MFQC78tVOThOJzf1+erEX6vEfYmyo
	PTV8oM7wknwHQjcpY7hbmAcDxQGyEBcid5WuEJ3SQ6O+fZcn4fzpzkFEOyjklDNH3r0=
X-Gm-Gg: ASbGncui/MLFHEEwsvzg5xdkXJQEoyKI8zEjftiW7FIuS/TUtH5GCkyk5viAIWit1as
	LbZH3GgfcJPeM/6WSEjjHHtkNiuJgZjgEL4wQrIjfHi0zbd/uLfQDzWx8jj7GfW8dnk08sCtQfV
	8fjJuQiBdKlMIvt7SD6GIFY0Xs5SuK0exi/xwNhAm0I11YPCQQCndnBvxBImwN7VxTydobafzEj
	VLSYwxDNJ/ZOEg3lEUoPu4hRyc1mdFqG5IlnHkE67qgN4DeYe3bB4lUAimYZmLsdXgsPvOHjRLx
	MrNHyXk3kdnvkC1FXVAH5hk9oF5NW0Lw8R7tmKBzWSjdIG6rlDOJCe4F+eoBqVnD0WmU9DYvq32
	RAT/FBf+JqXpBDtP+X0K7862dLa0kBt33EMzpos/yzFnY1f3cpkOWNMpwGJu7mAkuISNdl3AGLx
	qIY1yMveBhmAd4QkQY57OHP8LdpYVAQAkskjKcOHIhN+BgaF11fyaNf/YlmQnjY3wf
X-Google-Smtp-Source: AGHT+IFJDM1Ud9gq7T8KPgfmRD15dasPME8CaUoxppMBegCDAFRVY/1Yr/iEsJz9G8dZnYYATmDnmA==
X-Received: by 2002:a17:907:3d91:b0:b07:e212:4bf0 with SMTP id a640c23a62f3a-b3027262001mr277390666b.20.1758638272754;
        Tue, 23 Sep 2025 07:37:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:52 -0700 (PDT)
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
Subject: [PATCH v6 2/6] Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
Date: Tue, 23 Sep 2025 16:37:33 +0200
Message-ID: <20250923143746.2857292-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_073754_833956_96708AF6 
X-CRM114-Status: GOOD (  16.70  )
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

Replace opencoded masking and shifting, with BIT(), GENMASK(),
FIELD_GET() and FIELD_PREP() macros.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

(no changes since v2)

Changes in v2:
- Add Reviewed-by tag of Frank Li.
- Move the patch right after the one fixing the typo according
  to Frank Li's suggestions.

 drivers/input/touchscreen/imx6ul_tsc.c | 96 +++++++++++++++-----------
 1 file changed, 54 insertions(+), 42 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index c2c6e50efc54..e2c59cc7c82c 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -7,6 +7,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/slab.h>
@@ -20,25 +21,23 @@
 #include <linux/log2.h>
 
 /* ADC configuration registers field define */
-#define ADC_AIEN		(0x1 << 7)
+#define ADC_AIEN		BIT(7)
+#define ADC_ADCH_MASK		GENMASK(4, 0)
 #define ADC_CONV_DISABLE	0x1F
-#define ADC_AVGE		(0x1 << 5)
-#define ADC_CAL			(0x1 << 7)
-#define ADC_CALF		0x2
-#define ADC_12BIT_MODE		(0x2 << 2)
-#define ADC_CONV_MODE_MASK	(0x3 << 2)
+#define ADC_AVGE		BIT(5)
+#define ADC_CAL			BIT(7)
+#define ADC_CALF		BIT(1)
+#define ADC_CONV_MODE_MASK	GENMASK(3, 2)
+#define ADC_12BIT_MODE		0x2
 #define ADC_IPG_CLK		0x00
-#define ADC_INPUT_CLK_MASK	0x3
-#define ADC_CLK_DIV_8		(0x03 << 5)
-#define ADC_CLK_DIV_MASK	(0x3 << 5)
-#define ADC_SHORT_SAMPLE_MODE	(0x0 << 4)
-#define ADC_SAMPLE_MODE_MASK	(0x1 << 4)
-#define ADC_HARDWARE_TRIGGER	(0x1 << 13)
-#define ADC_AVGS_SHIFT		14
-#define ADC_AVGS_MASK		(0x3 << 14)
+#define ADC_INPUT_CLK_MASK	GENMASK(1, 0)
+#define ADC_CLK_DIV_8		0x03
+#define ADC_CLK_DIV_MASK	GENMASK(6, 5)
+#define ADC_SAMPLE_MODE		BIT(4)
+#define ADC_HARDWARE_TRIGGER	BIT(13)
+#define ADC_AVGS_MASK		GENMASK(15, 14)
 #define SELECT_CHANNEL_4	0x04
 #define SELECT_CHANNEL_1	0x01
-#define DISABLE_CONVERSION_INT	(0x0 << 7)
 
 /* ADC registers */
 #define REG_ADC_HC0		0x00
@@ -65,19 +64,26 @@
 #define REG_TSC_DEBUG_MODE	0x70
 #define REG_TSC_DEBUG_MODE2	0x80
 
+/* TSC_MEASURE_VALUE register field define */
+#define X_VALUE_MASK		GENMASK(27, 16)
+#define Y_VALUE_MASK		GENMASK(11, 0)
+
 /* TSC configuration registers field define */
-#define DETECT_4_WIRE_MODE	(0x0 << 4)
-#define AUTO_MEASURE		0x1
-#define MEASURE_SIGNAL		0x1
-#define DETECT_SIGNAL		(0x1 << 4)
-#define VALID_SIGNAL		(0x1 << 8)
-#define MEASURE_INT_EN		0x1
-#define MEASURE_SIG_EN		0x1
-#define VALID_SIG_EN		(0x1 << 8)
-#define DE_GLITCH_2		(0x2 << 29)
-#define START_SENSE		(0x1 << 12)
-#define TSC_DISABLE		(0x1 << 16)
+#define MEASURE_DELAY_TIME_MASK	GENMASK(31, 8)
+#define DETECT_5_WIRE_MODE	BIT(4)
+#define AUTO_MEASURE		BIT(0)
+#define MEASURE_SIGNAL		BIT(0)
+#define DETECT_SIGNAL		BIT(4)
+#define VALID_SIGNAL		BIT(8)
+#define MEASURE_INT_EN		BIT(0)
+#define MEASURE_SIG_EN		BIT(0)
+#define VALID_SIG_EN		BIT(8)
+#define DE_GLITCH_MASK		GENMASK(30, 29)
+#define DE_GLITCH_2		0x02
+#define START_SENSE		BIT(12)
+#define TSC_DISABLE		BIT(16)
 #define DETECT_MODE		0x2
+#define STATE_MACHINE_MASK	GENMASK(22, 20)
 
 struct imx6ul_tsc {
 	struct device *dev;
@@ -112,19 +118,20 @@ static int imx6ul_adc_init(struct imx6ul_tsc *tsc)
 
 	adc_cfg = readl(tsc->adc_regs + REG_ADC_CFG);
 	adc_cfg &= ~(ADC_CONV_MODE_MASK | ADC_INPUT_CLK_MASK);
-	adc_cfg |= ADC_12BIT_MODE | ADC_IPG_CLK;
-	adc_cfg &= ~(ADC_CLK_DIV_MASK | ADC_SAMPLE_MODE_MASK);
-	adc_cfg |= ADC_CLK_DIV_8 | ADC_SHORT_SAMPLE_MODE;
+	adc_cfg |= FIELD_PREP(ADC_CONV_MODE_MASK, ADC_12BIT_MODE) |
+		FIELD_PREP(ADC_INPUT_CLK_MASK, ADC_IPG_CLK);
+	adc_cfg &= ~(ADC_CLK_DIV_MASK | ADC_SAMPLE_MODE);
+	adc_cfg |= FIELD_PREP(ADC_CLK_DIV_MASK, ADC_CLK_DIV_8);
 	if (tsc->average_enable) {
 		adc_cfg &= ~ADC_AVGS_MASK;
-		adc_cfg |= (tsc->average_select) << ADC_AVGS_SHIFT;
+		adc_cfg |= FIELD_PREP(ADC_AVGS_MASK, tsc->average_select);
 	}
 	adc_cfg &= ~ADC_HARDWARE_TRIGGER;
 	writel(adc_cfg, tsc->adc_regs + REG_ADC_CFG);
 
 	/* enable calibration interrupt */
 	adc_hc |= ADC_AIEN;
-	adc_hc |= ADC_CONV_DISABLE;
+	adc_hc |= FIELD_PREP(ADC_ADCH_MASK, ADC_CONV_DISABLE);
 	writel(adc_hc, tsc->adc_regs + REG_ADC_HC0);
 
 	/* start ADC calibration */
@@ -164,19 +171,21 @@ static void imx6ul_tsc_channel_config(struct imx6ul_tsc *tsc)
 {
 	u32 adc_hc0, adc_hc1, adc_hc2, adc_hc3, adc_hc4;
 
-	adc_hc0 = DISABLE_CONVERSION_INT;
+	adc_hc0 = FIELD_PREP(ADC_AIEN, 0);
 	writel(adc_hc0, tsc->adc_regs + REG_ADC_HC0);
 
-	adc_hc1 = DISABLE_CONVERSION_INT | SELECT_CHANNEL_4;
+	adc_hc1 = FIELD_PREP(ADC_AIEN, 0) |
+		FIELD_PREP(ADC_ADCH_MASK, SELECT_CHANNEL_4);
 	writel(adc_hc1, tsc->adc_regs + REG_ADC_HC1);
 
-	adc_hc2 = DISABLE_CONVERSION_INT;
+	adc_hc2 = FIELD_PREP(ADC_AIEN, 0);
 	writel(adc_hc2, tsc->adc_regs + REG_ADC_HC2);
 
-	adc_hc3 = DISABLE_CONVERSION_INT | SELECT_CHANNEL_1;
+	adc_hc3 = FIELD_PREP(ADC_AIEN, 0) |
+		FIELD_PREP(ADC_ADCH_MASK, SELECT_CHANNEL_1);
 	writel(adc_hc3, tsc->adc_regs + REG_ADC_HC3);
 
-	adc_hc4 = DISABLE_CONVERSION_INT;
+	adc_hc4 = FIELD_PREP(ADC_AIEN, 0);
 	writel(adc_hc4, tsc->adc_regs + REG_ADC_HC4);
 }
 
@@ -188,13 +197,16 @@ static void imx6ul_tsc_channel_config(struct imx6ul_tsc *tsc)
 static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 {
 	u32 basic_setting = 0;
+	u32 debug_mode2;
 	u32 start;
 
-	basic_setting |= tsc->measure_delay_time << 8;
-	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
+	basic_setting |= FIELD_PREP(MEASURE_DELAY_TIME_MASK,
+				    tsc->measure_delay_time);
+	basic_setting |= AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
-	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
+	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, DE_GLITCH_2);
+	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
 	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
 	writel(MEASURE_INT_EN, tsc->tsc_regs + REG_TSC_INT_EN);
@@ -250,7 +262,7 @@ static bool tsc_wait_detect_mode(struct imx6ul_tsc *tsc)
 
 		usleep_range(200, 400);
 		debug_mode2 = readl(tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
-		state_machine = (debug_mode2 >> 20) & 0x7;
+		state_machine = FIELD_GET(STATE_MACHINE_MASK, debug_mode2);
 	} while (state_machine != DETECT_MODE);
 
 	usleep_range(200, 400);
@@ -278,8 +290,8 @@ static irqreturn_t tsc_irq_fn(int irq, void *dev_id)
 
 	if (status & MEASURE_SIGNAL) {
 		value = readl(tsc->tsc_regs + REG_TSC_MEASURE_VALUE);
-		x = (value >> 16) & 0x0fff;
-		y = value & 0x0fff;
+		x = FIELD_GET(X_VALUE_MASK, value);
+		y = FIELD_GET(Y_VALUE_MASK, value);
 
 		/*
 		 * In detect mode, we can get the xnur gpio value,
-- 
2.43.0


