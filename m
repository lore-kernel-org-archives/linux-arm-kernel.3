Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DFACF8845
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaAjSoY/nku4Rf/DgaeK7ZZ3RvPX6WjghtPiUfT8Z6E=; b=jT0DMUx/FsrU7JcHIZ9RZss7g9
	zI+26hxNGq+fHombGaN3jmJSSkPoXV8RoOs4MxU82KfbnIK+o110LfBMzzzVDRsVcW6apxw2ot3kf
	uu/AuYCMsrottvgM5TUoJoRPOmiapCulS61pQJpm9Aa3f25UMKNUTcQKrbKO/YvRkL0gDr6ag+4k9
	2ewRjAJX+Ku6gd5BUCjFkGqFZ1UciP6UZiUfCSiUYGg+4uLleokb8R5h+SCTr/9LYi12dIXyFksIw
	jVKaF6S2OhXqD8SdBofoNE0W3980y00PCcIDhhQHbWevqCx4jFP4CGs+FNr59tddDDsL2zIYpOpN6
	aC1ZzrDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2rD-00000006a7e-2eow;
	Thu, 20 Nov 2025 11:29:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2r7-00000006a4W-3ICu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:29:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso3545895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638180; x=1764242980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaAjSoY/nku4Rf/DgaeK7ZZ3RvPX6WjghtPiUfT8Z6E=;
        b=XLuXW9mHpw/cA31DoLG9pgeCOWI50p4Auhj19LafuDjvIm+rDHobrJGmkGzD8AvFG9
         q3L/k4e9Flbo6YpNEn6syM3noQoSFPPwMs6uGljS7dgGE3Kxsaqen1Rr1FlC6AeoZ85C
         ijQTXS9F7uiqaCRPZgjFOowWnTqOKowEldgOdw0nBt4iUebTfjtLetupdpciQYs0Kg9U
         PkESUIGWYmaazUJiove44FDSfSDvG2mXJT5zhbzSvH4cwsjTsip1kf2RUnRpUI1nFAt7
         EEoabXEK0sGV94ymROPf4nyPITKlr+2AJIwksLhYe1FLvGsMPq8XYpJfNlc0ss24J005
         rBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638180; x=1764242980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XaAjSoY/nku4Rf/DgaeK7ZZ3RvPX6WjghtPiUfT8Z6E=;
        b=pDfZLFdftMXUfn7zBnWW+AeHDMfWjFP9xCzi+X/SOMJRM8N6NsBvsW0r7HlcklUqaZ
         us9GIHu5Yg7YFA/tT93esYdjGQ6rBZYXSzwUQqkorciC9X8/DrBh21OmwsGvWLLhDTIz
         D8J0dqc2217Bpq1bS/LIOuEGiQAp/dQj3AOrnxlWvpEmROE0WTQ+IRc+MyTr7adh6TSu
         jMqmLw/sTvl7eGS5OHs4dryU7IoImyGT13byA6fig/KB1IOKch8B4RPaEJEa1j92tDYQ
         +A+7Dt1SR289bNQdqzhZfChXfEHyarXFeZk//oidnWYlV85BuS/LXDpvheBEDIxz+u1r
         WN9g==
X-Forwarded-Encrypted: i=1; AJvYcCXm8KblVB+DpaLVjnn2sacQxP9GBfAaLVoXhG6vSP7e/8pwlGm2KHyMoRcg9GdvpT7JCnEF7o23ICa5bF6Go2ea@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn7kggosAYeHitLsCoapIsT97cEYNV1Qr8qsDALKVeGAGO8huy
	tB9xSmy5bnXyKIqR8ZNyTRbKD9PMvCcIvgN8GTlSugnF5gmDtnJMGAcFh061ThKFUs0=
X-Gm-Gg: ASbGncu0SJBFsR6pKtgQm4N9q3MjGbQMG2vQdTPfkDlkYGA72GFyyJabsKgQVD5eWcr
	GP2ER2uk/nPy7VqyVtJ1eGgidwm3YfsdOqL89rWztBeHijiNPdSDiVTVk/DsNRGBCrpyt2nnrBs
	F/IhOgloTWf7Ogy7718MaEgg6hQoj7rh37ZZ50IY9FGBm8N5KSipWjhuaLHM9pMSP4qHmmLrhAP
	F95I2JHppPy/YVrXyHP0Hsg4SwLecSrxurQpK6diCx6kB8JU7+C39zR0vrLf+eGNIJycfrhv6sF
	PmduOXrSt+tBq5L7pvInGYltZ2n0zZQZo952w0pcDfoEJybklwerIl78bRDMpNXXmO58P8TTZdK
	zJaz5wTynflU8TqSitkAFYHqt5c8LW2Os67hgqjebK8Pbh0csKH3YflmvAzyHdIMt9Fr1V6syi8
	xHKjV4VToO834ewoBaCumvaK9Eirxz9l4Sm6xv5+EdRfr9mbDuc8mZJA3qIzEJz2k/E1c=
X-Google-Smtp-Source: AGHT+IGbKsNEy/oueUtizdEXhVcAeX3YEdD+UJr2wvqpgctEkJQ/yJL/aveJn6ori9RZU00wT99XRw==
X-Received: by 2002:a05:6000:1846:b0:42b:5448:7b06 with SMTP id ffacd0b85a97d-42cb9a219ecmr2426328f8f.13.1763638179927;
        Thu, 20 Nov 2025 03:29:39 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:39 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:36 +0000
Subject: [PATCH v3 2/6] soc: samsung: exynos-chipid: use dev_err_probe
 where appropiate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-2-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=3106;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ydziPpmvPsHAqypZZhan8Qbcj761T47in3GhwmLevxY=;
 b=3QfKC33suSvG0rhHt/+ek4MMRHqRHtNEUYflZ9HpBIoEjKBWMgp5OHbOKUXglp9RLJujxdm4Y
 eJ0sTaG3i8yAL0fq7oX5LmnwNS87zA7ibX3lE4bZJ0CXepRz/sSZvBV
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032941_852776_EBC16B1B 
X-CRM114-Status: GOOD (  14.05  )
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

Use dev_err_probe() to benefit of the standardized format of the error
code (e.g. "ENODEV" instead of -19), to get meanigful error messages, and
for more compact error paths.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 49cb113d99f314ed94730cec2b98f48a1a7b87f2..b9a30452ad21c326af35c06a341b28491cee6979 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -81,8 +81,8 @@ static const char *product_id_to_soc_id(unsigned int product_id)
 	return NULL;
 }
 
-static int exynos_chipid_get_chipid_info(struct regmap *regmap,
-		const struct exynos_chipid_variant *data,
+static int exynos_chipid_get_chipid_info(struct device *dev,
+		struct regmap *regmap, const struct exynos_chipid_variant *data,
 		struct exynos_chipid_info *soc_info)
 {
 	int ret;
@@ -90,13 +90,14 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 
 	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to read Product ID\n");
 	soc_info->product_id = val & EXYNOS_MASK;
 
 	if (data->rev_reg != EXYNOS_CHIPID_REG_PRO_ID) {
 		ret = regmap_read(regmap, data->rev_reg, &val);
 		if (ret < 0)
-			return ret;
+			return dev_err_probe(dev, ret,
+					     "failed to read revision\n");
 	}
 	main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
 	sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
@@ -123,13 +124,15 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	drv_data = of_device_get_match_data(dev);
 	if (!drv_data)
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL,
+				     "failed to get match data\n");
 
 	regmap = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to get regmap\n");
 
-	ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
+	ret = exynos_chipid_get_chipid_info(dev, regmap, drv_data, &soc_info);
 	if (ret < 0)
 		return ret;
 
@@ -148,15 +151,14 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
 	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
-	if (!soc_dev_attr->soc_id) {
-		pr_err("Unknown SoC\n");
-		return -ENODEV;
-	}
+	if (!soc_dev_attr->soc_id)
+		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 
 	/* please note that the actual registration will be deferred */
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev))
-		return PTR_ERR(soc_dev);
+		return dev_err_probe(dev, PTR_ERR(soc_dev),
+				     "failed to register to the soc interface\n");
 
 	ret = devm_add_action_or_reset(dev, exynos_chipid_unregister_soc,
 				       soc_dev);

-- 
2.52.0.rc1.455.g30608eb744-goog


