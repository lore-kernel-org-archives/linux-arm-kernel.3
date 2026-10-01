Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E55ACA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 03:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebr0zKwmRy5Wy2u8eNXuEfkoYnCwRU2+CdFY8YmOfEU=; b=tcTcupVCTfZwoiDc+enPwJYIaK
	aL5eqqM2JsJmeWrKmSmJdBUgro+W2dOLTFgOIZUJkUtS699KAmECtI2whBO0tZLH6+9YRtjJSWD/g
	xF/MLfIgFi5wXiU9LZKd369c0oW/M4TRjh709tpTUdbQ9TQZehSUbS5DMpZAEU30MKNGbjbDJV7aO
	YxX0s/hkK+OudWdm6gpRlvCp0iDq/FfHPiuPBhJRhqVMYKikIOqVdYX0lQBdTAjLUZ8hUxbE2bDDR
	J52lRFYkYy6yuc132xqIJS2hKWcxeSCrVd1pugGVR9hV3eFx1+Lj/aSeb/qN0XmxiTYbMUJZzcVyD
	u/z9NS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Aw-00000007e30-1rgn;
	Thu, 01 Oct 2026 03:09:38 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Ac-00000007dx9-3dCa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 03:09:21 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d391aso45913525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824157; x=1791428957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebr0zKwmRy5Wy2u8eNXuEfkoYnCwRU2+CdFY8YmOfEU=;
        b=ixmpnoLQkubLzUl5roqzj8xLRJeV+zwi74kajQFr27opzQ1BsezeWVS89EMfiWLc/R
         87RFNFOSVpBaN/OVcgp+oIsq4vHAdZ8ybTmofY4rssTpded1H3W3+cj6vZBJ1JUH8WDe
         Y3V+SDzRLuP00i8qALwLtI/4+xJvfG2WQBno90v91zIPGHp3lDXjrpkbEqpCaWvKIHGG
         Qk/0xfYCTMfN3BLAEk8KogypvLG4JmFWzZWCVnvPbBbCcoSyr55FtSEgCM/R9PtvdgYm
         9pSEm57qeVqvaUgSjsmnuHbSBaz+9IzCW4RTIUYBrZKKFQzGOj17tegMliyqAw1S3e5Q
         TGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824157; x=1791428957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebr0zKwmRy5Wy2u8eNXuEfkoYnCwRU2+CdFY8YmOfEU=;
        b=Ev3szvpOZHol9M3Lk1USXfL96PRn5NRBj+CL/7j2TsFO/nJ+LEAmt/W3Q/qllFQ+ut
         EUtaeOyOnld28yq2pmHaKcUS7fQiwYrRcLMK/Cx0si7utaamzg1cOkYVmCvFu9cekYrw
         2VVoiEC/2S30qpZE3IzKHjKctt7KKeKoZf6lniAj85ASIrWd53LgkxKNWaIsOmVglZaE
         flWKscnO0wXcZ6d0B8WKeuslXXP0ojQvrubYwZozD9Nq8ihQHipgi0OVqFuUMTCLGLzk
         OElJrxEdrvg+X1lnB35r7wSfU8cpIDnFAoILHArO5SaZTuegfo5YzBES3GJjk8tUYKO5
         dtAw==
X-Forwarded-Encrypted: i=1; AKwUvBzJXu/6vZa0PFM91S5nQ4SzZc6vLSPleNy1xRC/OoI1+marKof3Yul6/YmetmzxVJ6uP9R8AVllETy8CozM2hQ0@lists.infradead.org
X-Gm-Message-State: AFuF++kTbz/hVN9OWUyTWi1IoIalyNbqOl500eSSM2bqF8cS4tfpjhYT
	CtJZXZY7myD/uCN5bS/5ZEFYHJsQcwA1zfiuk7jaWRk1+q7S6g8+HvoWBVNzQXNejVw=
X-Gm-Gg: AYBFou1gmZ/2T/6Yn/x8zaoE/qHDo/UBgrqtZ/ZR2M+wEIYz6maXJryNBuroH3UgsNX
	xizGnegJQceyFezZiolBWRhxktSXTj3H6ZT4ic9jMa9YesWST1J1iOBa6fDVGMt6xBCJAMFBqqj
	kPdX7CxK4AtWfXjwRPlIvF1lheyy/eij5pzRChBMJ5ZL5o4niJDt2AmLdBqjpDQFnsPejZtU4cG
	hY0Qh7yqy/SiMTfidiuzQBNqDiPRKYByRPapXzhIDMhbX7Tlr3D/+6gIFC8JGrhUMToLIicpHdh
	G8izKuPaSnhEm9IkoJV3KY+9MjPardAZrboYjBwMfd6oGZzJ0Y2uxQBGgk+bF7dtzmPDrTQ16ra
	ZYB6DZiGqY4oFiBV8zeg6jKlgFxasUMzKyElKyK22fg3iZs7J6+o8UxxdET5uzPhKeVIgZe9R+y
	w43hrOqf9MQLalnuoR1H+sGXXTVhfVUMtL3iHCozMD/rNcyV0xyOc0wbq8gyfvuqGPaw19YR6V2
	vMvGgNopVy7Zk2zB/vjMdcsq/hTmv1UPcwGmWqr6uDQkqQnrh6Ta4uTLkU1Sg==
X-Received: by 2002:a05:600c:6206:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a01b128d1amr54436895e9.33.1790824157298;
        Wed, 30 Sep 2026 20:09:17 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:16 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 01 Oct 2026 04:09:13 +0100
Subject: [PATCH 2/4] iio: adc: exynos_adc: add Exynos850 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-exynos850_adc-v1-2-791b3516bb9d@linaro.org>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_200919_032317_B1068ED2 
X-CRM114-Status: GOOD (  16.91  )
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

The Exynos850 ADC controller located inside the CMGP block differs from
other Exynos ADC controllers, mainly in its register layout.
Specifically, the data register sits at offset 0x08.

Abstract the read_value() operation in driver data exynos_adc_data to
support SoC-dependent data register read callbacks.
Add the exynos850_adc_data struct that describes Exynos850 ADC ops.
It also requires its own hardware initialization and exit routines.
Add them as well.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 66 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index c1a0061b16ca..3e9b5d28b922 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -46,6 +46,8 @@
 #define ADC_V2_INT_ST(x)	((x) + 0x14)
 #define ADC_V2_VER(x)		((x) + 0x20)
 
+#define ADC_EXYNOS850_DAT(x)	((x) + 0x08)
+
 /* Bit definitions for ADC_V1 */
 #define ADC_V1_CON_RES		(1u << 16)
 #define ADC_V1_CON_PRSCEN	(1u << 14)
@@ -133,6 +135,7 @@ struct exynos_adc_data {
 	void (*exit_hw)(struct exynos_adc *info);
 	void (*clear_irq)(struct exynos_adc *info);
 	void (*start_conv)(struct exynos_adc *info, unsigned long addr);
+	u32 (*read_value)(struct exynos_adc *info);
 };
 
 static void exynos_adc_unprepare_clk(struct exynos_adc *info)
@@ -195,6 +198,11 @@ static int exynos_adc_enable_clk(struct exynos_adc *info)
 	return 0;
 }
 
+static u32 exynos_adc_v1_read_value(struct exynos_adc *info)
+{
+	return readl(ADC_V1_DATX(info->regs)) & info->data->mask;
+}
+
 static void exynos_adc_v1_init_hw(struct exynos_adc *info)
 {
 	u32 con1;
@@ -252,6 +260,7 @@ static const struct exynos_adc_data exynos4212_adc_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos_adc_v1_data = {
@@ -264,6 +273,7 @@ static const struct exynos_adc_data exynos_adc_v1_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos_adc_s5pv210_data = {
@@ -274,6 +284,7 @@ static const struct exynos_adc_data exynos_adc_s5pv210_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_s3c64xx_start_conv(struct exynos_adc *info,
@@ -295,6 +306,7 @@ static struct exynos_adc_data const exynos_adc_s3c64xx_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_s3c64xx_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_v2_init_hw(struct exynos_adc *info)
@@ -356,6 +368,7 @@ static const struct exynos_adc_data exynos_adc_v2_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos3250_adc_data = {
@@ -369,6 +382,7 @@ static const struct exynos_adc_data exynos3250_adc_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_exynos7_init_hw(struct exynos_adc *info)
@@ -395,6 +409,52 @@ static const struct exynos_adc_data exynos7_adc_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
+};
+
+static void exynos850_adc_init_hw(struct exynos_adc *info)
+{
+	u32 con1, con2;
+
+	con1 = ADC_V2_CON1_SOFT_RESET;
+	writel(con1, ADC_V2_CON1(info->regs));
+
+	/* Bring out of reset */
+	writel(0, ADC_V2_CON1(info->regs));
+
+	/* 64 times conversion */
+	con2 = ADC_V2_CON2_C_TIME(6);
+	writel(con2, ADC_V2_CON2(info->regs));
+
+	writel(1, ADC_V2_INT_EN(info->regs));
+}
+
+static void exynos850_adc_exit_hw(struct exynos_adc *info)
+{
+	u32 con2;
+
+	con2 = readl(ADC_V2_CON2(info->regs));
+	con2 &= ~ADC_V2_CON2_C_TIME(7);
+	writel(con2, ADC_V2_CON2(info->regs));
+
+	writel(0, ADC_V2_INT_EN(info->regs));
+}
+
+static u32 exynos850_adc_read_value(struct exynos_adc *info)
+{
+	return readl(ADC_EXYNOS850_DAT(info->regs)) & info->data->mask;
+}
+
+static const struct exynos_adc_data exynos850_adc_data = {
+	.num_channels	= MAX_ADC_V2_CHANNELS,
+	.mask		= ADC_DATX_MASK, /* 12 bit ADC resolution */
+	.needs_adc_phy	= false,
+
+	.init_hw	= exynos850_adc_init_hw,
+	.exit_hw	= exynos850_adc_exit_hw,
+	.clear_irq	= exynos_adc_v2_clear_irq,
+	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos850_adc_read_value,
 };
 
 static const struct of_device_id exynos_adc_match[] = {
@@ -419,6 +479,9 @@ static const struct of_device_id exynos_adc_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-adc",
 		.data = &exynos7_adc_data,
+	}, {
+		.compatible = "samsung,exynos850-adc",
+		.data = &exynos850_adc_data,
 	},
 	{ }
 };
@@ -484,10 +547,9 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 static irqreturn_t exynos_adc_isr(int irq, void *dev_id)
 {
 	struct exynos_adc *info = dev_id;
-	u32 mask = info->data->mask;
 
 	/* Read value */
-	info->value = readl(ADC_V1_DATX(info->regs)) & mask;
+	info->value = info->data->read_value(info);
 
 	/* clear irq */
 	if (info->data->clear_irq)

-- 
2.51.0


