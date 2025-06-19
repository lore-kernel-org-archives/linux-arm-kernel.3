Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12944C7EE24
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Fvf7YFNk9hgZaIBMwH5Oxgd1wYDkkE9Dk+oH7pOxYY=; b=btMPckJmCjy75RwWU66tFRQCcp
	Oje/LPlIqIzMOwII0KJjtZ6AsCGP+vUXKVwa5AfeM6Y8sIqX/Z0yW5XWe/PqsEtmhgwTXnKG4eJY3
	QcuuxrrZzDdoJrxJlgNFnc3d5xNlUV+QkinF5JYPYvqhmUZQj85GpIP80Lh0GnMz2gbQIL4T7C4e4
	pNtz4nh10oJtK5a3wyYEsciGjnRtYSI61oU80K5jt6eeT9oAm641WDsnbbM2m/ZCIOvdgPx9YvSmK
	ZtNDn5DygRsqm/tzA+anNWtvzYWDu9jSSzGhdgGTXv/iDSaGl18guth8gkoLtkXMdtHtp8/LBnpi2
	nC2FMUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRf-0000000DRfh-2pz1;
	Thu, 19 Jun 2025 15:44:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDHl-0000000CqNu-0sUI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:18:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a588da60dfso444079f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750331903; x=1750936703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Fvf7YFNk9hgZaIBMwH5Oxgd1wYDkkE9Dk+oH7pOxYY=;
        b=RXPo6pD5cwzeMPOBDXvM3yB5FmeprEMc+nEk81iOCqq0r3VA5HL55PySxsX+HE+2Dc
         KpgMG0NTF3lfGsy6uniPOXRVkAeKx+FNwtqFtHjoW4J9yKiP/zwAypspki1j72KpuF5L
         rLL3kMtYK0qyrAlpjmmBZVX3V4pEa/nGRWHkC4frFWHZ8tn9dJE2meuNhBIWOqYJi6Lx
         nA3Vm5voPqDKNQA9a4y0gVQdtLImM5Xpz3ZKAjygpGta+58rJvgTUZOWQnxMc5kw4bH8
         irJYWwy1b5ap2L4fB+PjpFWZJXg29hdNDKGW/eK9FL3vq1u57EyOh1OVpTguBO+1pJwF
         R+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331903; x=1750936703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Fvf7YFNk9hgZaIBMwH5Oxgd1wYDkkE9Dk+oH7pOxYY=;
        b=l05KsT9mo285HsYMQfHudxkSmGVlmNK3/XLUIPh3maPpAkSSgboTLkRx+Ud8c3wEFz
         CNLmFewfoe+t5LkAdqo6dFbPLjE4+tmGItA6AFqreoK5bakHHIokGvVdRJ9ZevRBtiKY
         8HaieJs2KEpP7A00DMZ2beHeRwkQ3ujBPgNd6N/ooXPYw4FGsHapjgZPJdc2fLI2vwj5
         1JUwyfsvc1xx0aZr23lHR1EgZ5uoNeCESJqidvRXCOFeKrvyp0eG3Ts8WReep7zSnglC
         DJrNbKuUwiTGqeXc9XNYiUvWaImFBcnpV1hUwM/8K4vcTg2itYDHxBzBwtEV0c+KvtZX
         5otw==
X-Gm-Message-State: AOJu0YyEi2RgEdcuEBLITVxJv55uR7IthwCvQkxr6LV93CVxoz7xB6hO
	tuEwLD5eHDJRCUTojikoy/YHypFIrnrLZWbcW7bi2AUqd8TB8MMjtJp7ayRY2LB7V/o=
X-Gm-Gg: ASbGncvMIFET98nAjRFIeUf7PkQ1jg83HWgZUkvtN+HM/4ZwfVO+gaHQ2azk4WrqGAF
	cW50cL6cmhF0C1rKn/0XEEXGPKa1gZSVBAV2vP04YyzcXYcdT5oYilYWb997kFs779HYRcCOe6F
	3D1LbOmXWFiKWXTwawES0bnI06zV5uZQKwVISOVeVTb8hK6JhzE2wtVggiT1PajUGoEaZXxIfmc
	RORU8COERbMTf9VGyQKVM7yk3ZtuacsTPl+i4Uc+3tCT2pBUcBu1QZrE5W0RkdPYtpcNumNhj7n
	kKVjHDhRPIJrQXLVp7FeFh+4EGYlINf8dl1ALYiER8YRJ/7WHezBrV5TNmTAuKlFbDA5VE+hjOH
	c2HMjZrbe0BphzqKd
X-Google-Smtp-Source: AGHT+IEAqQjOcoAnpyzophi6mRFHajmHtj9QIjRFkm/NOIYibt3bAKSIyjkYnPLx3bhYlV5yilrOcA==
X-Received: by 2002:a05:6000:4024:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a5723a2907mr14065943f8f.13.1750331903200;
        Thu, 19 Jun 2025 04:18:23 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c41sm25674375e9.26.2025.06.19.04.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:18:22 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 19 Jun 2025 12:18:15 +0100
Subject: [PATCH 1/2] pinctrl: samsung: rename exynosautov920_retention_data
 to no_retention_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gs101-eint-mask-v1-1-89438cfd7499@linaro.org>
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=3xBT1L8I6TNRRff1Q5/u26yR0koFA81Rb/IbdPbqOko=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoU/H7wfYr2rXyNKdlg6SW6TglHvBZIDQC5oY73
 6RHG1SOE+SJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaFPx+wAKCRDO6LjWAjRy
 uieOD/9Oz+JuAQTo4NeJIF0oxjINRvPiNiF3dnirauG3D/pn3bu1nOmbTdr56fq3OuS0bhKywRD
 wwo8uSmB4R/ojhYjn2uGlFMbqwiZACJFmjq1XyRbFpkERiZ1PUtSDkA+ARJFcOt907bF/p72x1+
 XJYR4oqki+UuzHp+eEJ0b6go7rI9gmIXUo3Mcksxm4/FkbetMCdbcNF3+m/pzqdcHgkPlinMQL4
 36rRZ4ggeeHUndmrJi+CbRGgG4SbZjwIeEJ6rTzPlULRTnRACUkOmSZkq2oS2ESHboV6p0Jf2GT
 yw4RK2dJlhc2QI6MNLH/rnNVRL4Ma45++M8EdAkOPXChF3b3PSlaNvPTCNeQSb25CI7WG7VwEVz
 dIc4aFRvUzE8MGd9eHvpPf9B1vdB0Uh8PQLjtbMqz+rOTmui/N5SUoVydOGZ5gaHcKTBWsGtXKW
 3HAWhJPR7rR5b9LC3VdENoWL+JgYR7Ir4xZX26ze0lBo6V2X3GVWBghTFVB/kHPfsRc5HCAxEVK
 jrdZTaB1y0iJ0midI3yuxCUagEqZAWwDyvKOEWhgEIVrXb541/Xb1SXrXxHSJoI9PqOeYduOlhn
 R2ppA+niNAaR7eBDnwN1MHn3dF2SMB/iCmW1i9+zujxzh7XaMYfORrv24Bmz5jxyRsTZrPyOTR8
 LZT5Dtlb7siS0Ow==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_041825_269224_D9E84FAC 
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

To avoid having an exact copy of this struct for gs101 rename it and use it
for both SoCs for eint banks.

The purpose of this for exynosautov920 and gs101 is to obtain the PMU
syscon for writing the calculated WAKEUP_MASK register(s).

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 9fd894729a7b87c3e144ff90921a1cadbde93d3d..5fe7c4b9f7bd424f396082f1b1b16bfb65f26cdf 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1405,7 +1405,7 @@ static const struct samsung_pin_bank_data exynosautov920_pin_banks7[] = {
 	EXYNOSV920_PIN_BANK_EINTG(8, 0x8000, "gpg1",  0x18, 0x24, 0x28),
 };
 
-static const struct samsung_retention_data exynosautov920_retention_data __initconst = {
+static const struct samsung_retention_data no_retention_data __initconst = {
 	.regs	 = NULL,
 	.nr_regs = 0,
 	.value	 = 0,
@@ -1421,7 +1421,7 @@ static const struct samsung_pin_ctrl exynosautov920_pin_ctrl[] = {
 		.eint_wkup_init	= exynos_eint_wkup_init,
 		.suspend	= exynosautov920_pinctrl_suspend,
 		.resume		= exynosautov920_pinctrl_resume,
-		.retention_data	= &exynosautov920_retention_data,
+		.retention_data	= &no_retention_data,
 	}, {
 		/* pin-controller instance 1 AUD data */
 		.pin_banks	= exynosautov920_pin_banks1,
@@ -1764,6 +1764,7 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.suspend	= gs101_pinctrl_suspend,
 		.resume		= gs101_pinctrl_resume,
+		.retention_data = &no_retention_data,
 	}, {
 		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
 		.pin_banks	= gs101_pin_far_alive,
@@ -1771,6 +1772,7 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.suspend	= gs101_pinctrl_suspend,
 		.resume		= gs101_pinctrl_resume,
+		.retention_data = &no_retention_data,
 	}, {
 		/* pin banks of gs101 pin-controller (GSACORE) */
 		.pin_banks	= gs101_pin_gsacore,

-- 
2.50.0.rc2.701.gf1e915cc24-goog


