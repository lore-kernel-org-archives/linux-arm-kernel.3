Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4276FCF8845
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuKrcuoBI7d5g4q4orKG9nRm+eFjAB5tnSDzYO6y5WQ=; b=w+kAcsys2ubjA3Ox9Jn7ZOJc9d
	1kdKb7UyKDJwvW1XHDHBJSPPvueTJfhQfBnT9pywgNTC4OIbTr2YuUGqV+gtBy8f0jWvEql6AYb+4
	EXvIt8pMBanc/opDiwxis+WnNrXfeDa208P5oibk4dSI0XwmWKJX0tPu+ycjyU+PEdkBiWlLOJEVl
	jLcLc+i7/FZ4studxeajXMjx8vQ1RyCcrVGkkYj5oGO+Bj+ABkNvIChwuIhhiUmwTIq/spaNAVD+v
	0zXasO9YtaOuNwPWcA8f9wItPdFmDrFvXKc6V0+pdqG+vzynfE/kELbV4/+Q9Z6noQHdkwfzmz50U
	CFuLYJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2rD-00000006a7A-1CFS;
	Thu, 20 Nov 2025 11:29:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2r6-00000006a46-3dxe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:29:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso649581f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638179; x=1764242979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuKrcuoBI7d5g4q4orKG9nRm+eFjAB5tnSDzYO6y5WQ=;
        b=vFQT6I4gTvnKE7qVaKQ2eoCjZ03fY/a4lqkHld6pzxK3Thawfq3bQxwZ7DGKxZ4FKV
         vSAnKd9unldC5iwwK97UovUXfvpfSsYOgslVR6AKHCDrLfJWCo7t32pTN7EyWFTRBO2f
         hYGGsTrK6TleFmO9ACa+9BM7AEZb6daYlszYRarePO2pDzZWRqtSNx35ddh0Fd7qPtmB
         Yw4Nd2bGsdtv2rNh35WSyThqYuWz9PuUcwc/X2Cj7JSfKqTAeXW3iV4gW95BSd5cDp48
         xrdQKoXufsUAdhfOmxuwnwVNKBMfxfW6h+K0I11UNqwpBTFXZqGhl9xFyPt6EGc2GdZ3
         2y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638179; x=1764242979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PuKrcuoBI7d5g4q4orKG9nRm+eFjAB5tnSDzYO6y5WQ=;
        b=xRBsSu0jZgLDB44viggbfYLBUvgjYQ6gazCm/duHHqpcJsQokr6OMmEhuS/ytAsHLR
         bY/tTn9CSWg+zM8IGb+/RkbpQ4WTCg4SLMwihodQPnttW5XaAQSm1QloqwTYen4D/uzR
         AMxI6dJGEIsBTaIxBZ1UliVsx0ty0b/LPMSoujnl1j5BxaYUFR5NR8G73NUbuH2TEmEp
         pYKh0cbAhh3OTwTwQZwD8wIqJStHCOvdlJkLdeYkG+7iHdw/fneB3y9o+11cM3qu8JXl
         wUhMqnBbHSjlivkP+CQ9Tr/WA7Ksw+55bG5LxBA/nrAELVPlio15FgCjuTIq4ATFJD72
         DlrA==
X-Forwarded-Encrypted: i=1; AJvYcCXkoKGIKtMaTUZ3bPsjrkQaBPQLP/AjErd0ediKV0HhVQG58ZeeYFciHUk85uZKJXEgKrIwFSoOeV8ABDUI6M5T@lists.infradead.org
X-Gm-Message-State: AOJu0YzDOiCIEFujhj1KS1eS/ZiCwHkq8l+guxT28+uYmdgPa+Bu5D0d
	wFVOK3YT0jGMUaW6Zdn0ahpVUexg6MS20NVK36LFKZ+8i6tVifWAWXsRfmF0jHI31Go=
X-Gm-Gg: ASbGncv8EmntXsdWPs5FEA/qOFIamxqGVMi1awaNXyB4V3ngNvAqOVMOwahL3mgGyK6
	89fj8mKRzbcsvaj16+ggNkLsyPmQLgXdXy0MD2QsO8MlWq2XOZKnzi+pzz77zTu0ZFcylNZA3vf
	TRkwCv9WRMnBFYqvjY6a/PZ+/a3abZWF9SzQ0CaDiwoIOY6py78Nl0T9CSBVR1M/YFfJ+QdXpOe
	P7iTH4SJH+2Uh3u8dO3paOOn3gRHAWcEod8v4iounV1H2idVkoiFOV+PGXe4RRDvKvl1qf11gZC
	9xq1aR/nbTIKrxQfBwAMRFH4sQirPBIoSOvexzxlerRa3lFZpC7e9MHe/cZAFEzOMtAhMtVSc6N
	+S/lXNOwyv7ilGyPVYZcmuuyZQ5Sk06ICXYMsceo0wMg4UTzTLtt7cwgxdO1GrqqJJ+LAQTkhF4
	QmrIkv9jb75Pb3QevEqmA9ciWp6GkhEWChJTKFQlYLXgDRiD/cotiTFhKaBwbwSs0FirE=
X-Google-Smtp-Source: AGHT+IEvA1MyH031OEvH24ynuE0LyStn/WEmFOJ9u6ZU8yrQYuFsjPCmysl8RrhQB/MEu5VH/0+U8A==
X-Received: by 2002:a05:6000:2388:b0:42b:3366:6330 with SMTP id ffacd0b85a97d-42cb9a65915mr2696231f8f.57.1763638178815;
        Thu, 20 Nov 2025 03:29:38 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:38 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:35 +0000
Subject: [PATCH v3 1/6] soc: samsung: exynos-chipid: use devm action to
 unregister soc device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-1-1aeaa8b7fe35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=2398;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=q4SLhBlNs3t93tDVbeMVgBT6CvDIqD2qRVhlhlaXWaw=;
 b=nK061O76WMFoYj9rMWr/tOtXFH2+xEeqZerjwnB7A5ZG9eGCMLEYmueI7BG1LxSjTJ8CCK8ZB
 sgwYqPwxkbQD0CIyqIOcBPEiT2aDWcKRx3u/B8eAEUDo0B4tH3RLzZu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032940_927935_CE178FF9 
X-CRM114-Status: GOOD (  14.35  )
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

Simplify the unwinding of the soc device by using a devm action.
Add the action before the exynos_asv_init() to avoid an explicit call
to soc_device_unregister().

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index d3b4b5508e0c808ee9f7b0039073ef57915d60fc..49cb113d99f314ed94730cec2b98f48a1a7b87f2 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -14,6 +14,7 @@
 
 #include <linux/array_size.h>
 #include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/errno.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -104,6 +105,11 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 	return 0;
 }
 
+static void exynos_chipid_unregister_soc(void *data)
+{
+	soc_device_unregister(data);
+}
+
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	const struct exynos_chipid_variant *drv_data;
@@ -152,28 +158,19 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = exynos_asv_init(dev, regmap);
+	ret = devm_add_action_or_reset(dev, exynos_chipid_unregister_soc,
+				       soc_dev);
 	if (ret)
-		goto err;
+		return dev_err_probe(dev, ret, "failed to add devm action\n");
 
-	platform_set_drvdata(pdev, soc_dev);
+	ret = exynos_asv_init(dev, regmap);
+	if (ret)
+		return ret;
 
 	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
 		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
-
-err:
-	soc_device_unregister(soc_dev);
-
-	return ret;
-}
-
-static void exynos_chipid_remove(struct platform_device *pdev)
-{
-	struct soc_device *soc_dev = platform_get_drvdata(pdev);
-
-	soc_device_unregister(soc_dev);
 }
 
 static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
@@ -206,7 +203,6 @@ static struct platform_driver exynos_chipid_driver = {
 		.of_match_table = exynos_chipid_of_device_ids,
 	},
 	.probe = exynos_chipid_probe,
-	.remove = exynos_chipid_remove,
 };
 module_platform_driver(exynos_chipid_driver);
 

-- 
2.52.0.rc1.455.g30608eb744-goog


