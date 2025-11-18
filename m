Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D74FCED63B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGSZdccmXWk8F5qnJeoPtGkKc8FpBWygh4CtyjO0Ar4=; b=AYK8EsIboSPB0MhsELmIwJi0Ny
	ADvvz5+PYQW/cCjlvcNRkbjU1Aq1RhiFnYc1EkDtzHGXNtBbHdoX0BcHc6IM83+KgXDnciT87FDTr
	f7YPNsfnBiHz0GeoYAfgwuKCZg4E40+nFO//EviGdYfYgyQV9LnMprijIWYkguqlDX3Klb5/Hq7nF
	kRAmChRRm8GvAh1+F4Tv1PKBaLutNbVty7WRF/rw4eN/1OTkszrXAEjOQRttvSOP1bDuDfgBE5+Md
	P12OG7yrlcqXjslw5K563cmJspkjxbpI/W4PmRTW35MMILgYKjAqRnHvAMRNE8D4wZA/hz2KXtf3E
	w+AEDMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMCA-00000000VFP-05y0;
	Tue, 18 Nov 2025 13:56:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMBx-00000000V2L-3rbr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:56:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-429c8632fcbso3934091f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474180; x=1764078980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGSZdccmXWk8F5qnJeoPtGkKc8FpBWygh4CtyjO0Ar4=;
        b=eZ9x+rpWy/2PpvWBp/xkfSyKWKeiGYNMTg+7vXgEjg9WkPnbBgBAq7AS2w4SpktTRo
         F+PclcYEXaiqJ0YZEqdG9QvcyHAq/QoLYi1eERi1BlYQ5Xm1KEKQrfWNgnieR+J4NXO+
         0egxdKcC1zHcUL7SzSau4qEvIl5MACjh716cxwpykELuHkSw6eZMrjKOvCivx+tW4BwQ
         2U6nKQ/Hf2ZlXhp521dQ4nQGGVET0EUa7GSCSpKsh4ZPQD8de+G6H74qld29rRmyZs3g
         sLDVoY6pZSuyy/OfnRb2EFh4DD4VO53Vz6WY9qyu57jXBEZ1ZcyC8rvNUqkMVc+njOJz
         248g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474180; x=1764078980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mGSZdccmXWk8F5qnJeoPtGkKc8FpBWygh4CtyjO0Ar4=;
        b=TD0Y3x5xe3C469GdlOSaBfyzMhpCGgD9Lnti/BWRs+Z25WrrXATlplN5tCZM9fE87V
         P35erVeBg5RV8OEnDyK1bAZ9QEwKT1ebkcfcO1YvPPd5mFUdLCtxqe+Q6UXW83baES9B
         sytEPcUnSyKeLnuwnTyAdKOfHiSEOJB5MY7By/wHKYEuUKHXBMyiJ2ZK+eWejgC9dQ97
         cf7/N3FLqU+U592HnVeV5jrbQ7fR8JHj4r14eugldsgs4Y5aVwdaBf/yv8aEtzZpG9OF
         VzWWosShignb7MZdz+dPGDZDxkkREcoO+Dn15VgxlAMAc/vh2/bp6FW8tKViltOSrxoa
         xPLw==
X-Forwarded-Encrypted: i=1; AJvYcCWvIewVesFL2zTutUX7k9lAmUFR7xXopqV0Ed0aJW6dTWehxPo5mS9DFeyAkZ3Li0HzlziIj3wIEreykcX6IODx@lists.infradead.org
X-Gm-Message-State: AOJu0YwYAiFEfGVNg4UiOt9I7KvPRiR5Qb9IBZJ2PLOQmfLKUMPGmJDK
	jBHTgqpYMgsDgEXuKV5eEAWCcP0V41H7p8POHrpvptwk7bp/eln4hDRp6FGkLAMhmoM=
X-Gm-Gg: ASbGncu1Ch9RQdnQBTkQk8f0RQdjOXRnIdxvl4OosU86gPsvhQDcRMkHnrzmBmJmG8h
	LCKDDHVucR9Et2leQACOWnrPA/Q7WTLXIsG1teu9QoZ+V/fAifZHGq+vJBKcdNZonsE3nbkZSGe
	RqBCA3ykEw5jFgz5jl/kw7nO8uzs90kU38bOKbaNkT+ijKhgEJqeAMyErzJXFk2vnw4obEVm4z4
	SZXs6Rds+sZzXdeTPVyYJ9/R7vmY7yufx+3jwWm9BFRXTVe402bhGyO5HNsUKNc+/KxSQ3tIqEM
	YRju7TPReV2UURoY6NYa/DTkU1XrVLBGSdvyXJ5HSLwxCOHiHDOf91KqhH6ecfRA48XebdotYxv
	8QvNV4Q388wjKA5X+OT4hEPwf2qbOW22iwwjzKaJ3DqVubV6PhsFv6ekPhvkt3sHgqrUm9YiySG
	+OclqlAAb3SIkQ2MQwTiWcK3eRQbONv5sUqQFo9VxjzNDSM7FvFdBrcawy2t2VZlSMfH19hq/v8
	RmA2A==
X-Google-Smtp-Source: AGHT+IGJOqGPGMa/xpFl50AjeI6gLPwIWReT5xV4tI/TQp6aNhxWJYaCSsA7r2uIJZrDLJkG2ExunA==
X-Received: by 2002:a05:6000:2509:b0:42b:4803:75e8 with SMTP id ffacd0b85a97d-42b5937335fmr16390114f8f.43.1763474180302;
        Tue, 18 Nov 2025 05:56:20 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:19 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:10 +0000
Subject: [PATCH v2 3/7] soc: samsung: exynos-chipid: use devm action to
 unregister soc device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-3-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=2261;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=AYey41JluNvIXnVAMYRQRudvFDMHByFQlXtTmWlf5rA=;
 b=/BoUySuXF+LzGbF8Xi0BjukaCLCcgm542pIxGyPIv9c71vz9fpN2QT6L/bYOX6wdCuHw/i8BZ
 CmaqZLVmv3sDkYpUE5IuVIAml7k3WYlIgKtBidL/6Exyw7Ub0FBh/46
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055621_991446_FE526573 
X-CRM114-Status: GOOD (  14.49  )
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
 drivers/soc/samsung/exynos-chipid.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 8904ffdaf9a6f6d069cc6af18a24dd00a2780892..db73dfad4e1b4fb001cb653bc8caf8aa08d85f2d 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -145,6 +145,11 @@ static struct regmap *exynos_chipid_get_efuse_regmap(struct platform_device *pde
 	return devm_regmap_init_mmio(&pdev->dev, base, &reg_config);
 }
 
+static void exynos_chipid_unregister_soc(void *data)
+{
+	soc_device_unregister(data);
+}
+
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	const struct exynos_chipid_variant *drv_data;
@@ -207,28 +212,19 @@ static int exynos_chipid_probe(struct platform_device *pdev)
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
@@ -270,7 +266,6 @@ static struct platform_driver exynos_chipid_driver = {
 		.of_match_table = exynos_chipid_of_device_ids,
 	},
 	.probe = exynos_chipid_probe,
-	.remove = exynos_chipid_remove,
 };
 module_platform_driver(exynos_chipid_driver);
 

-- 
2.52.0.rc1.455.g30608eb744-goog


