Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756A5CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOMGO9xFi2Mtx7k0vCEAwcztQ4BN53A74nGNrcyF4+o=; b=rDB5tnlZesCz4hd2T+AQFh3HL4
	x57z/dCbo0UAL1EKHWb7bRCITq84strbe3U8+t1JFmuGlFIC7mf7ayPjJnjbYOntpoarLZxoB8dAK
	D8pkx5jQk10a2NBkM4150s+2ie75qXFvUOKYERUJ7B1ggEIeECCn2yp420Fzdhm365GfonQgomRii
	bqY3tOg4T/JR7SVyZgGOwtJybJ4IZsUhpEOQ5hk/jmR2liX1beBMHzT49KMgmbOxlZTxH1ykXeu+a
	SoaJ5/QYFXcZZpVK9QH4PpvDDGwbWOPivWpT3knPBpPF89g0d7cZzVh2cIUTsw5WerksiT45IrVh7
	mkaPVhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNY-00000005Ih2-3mpB;
	Thu, 16 Oct 2025 15:59:00 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNP-00000005IWk-217k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-63c11011e01so1180896a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630330; x=1761235130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOMGO9xFi2Mtx7k0vCEAwcztQ4BN53A74nGNrcyF4+o=;
        b=GApgcRJG4LX6gsnPZVcOw8GKBDy7G1cjB4VLmkdhuzGCEiIdqQMcim+pPrb+s3XnPG
         xy4PzDnwF8l1Ofh8G+mOQYLQVkIQgfgxt0Jz770MyzRBlx4TM4O8TdEaNgQ0T+ZdmJH6
         +gNBj6aN/NU7fcds/sEdoaQdVF61KVA3uy7pUujUcYJyIGMFD6+qfKbst6fV7Katk1bu
         xVaLxU17pjOzVg2vdQbQWQcrGADnFSAvI8aKe+pls1lyzNUmlYtacACF1xSO74vsDiip
         7BYq1PjWp4m/DBSd3E2QKI47MIpkb/OcZRtKn0U4Y72PXM9JFbZUdvX0qKBpd95PuUAI
         en1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630330; x=1761235130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOMGO9xFi2Mtx7k0vCEAwcztQ4BN53A74nGNrcyF4+o=;
        b=B8sd4h1ezOLc3WKyWim8X1wuhyq0HYY65g8AgxwIAMlgE0bBio9tdgMpNARuBHtpNx
         OLkmujeoQw4cC0nJCqnzVPnhSO+xg0CulNV3BxuIeq9bRS36th1lO7fpsMqqffw0hmFx
         k1ezFiWLP89rckbCGYvTUZVL2PXq62C/SQzChj74go8rS6dquHTQwvZJIi6SGuP3rj4j
         6qjIdni2c5KoT9hi7/3nYvnc6SAKPoy6tj2LNC26MBAyZ9+bOEZYiln3d9Ma1R5NS2Qy
         1vS+OKTbX1ZZGMuPG6ukb8Pbvd1SR4hwOEItJYq1AvL6JUo8TiOnRO5pwR5m/eU6cUls
         LFJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiesgja6Z/prDnmSouMz3Bf/XED6rgWzql2TOPfN5idvKnlsOE4ndXkd/KjqQF/Py1Xbrh0oaBUO+bR/i0KK6s@lists.infradead.org
X-Gm-Message-State: AOJu0YxiSfEeT9FOuE3OByu3+y/yyI2+IjYvx6yUZnqlregwtE7qF60x
	3hOsFpZAUvNl1hCGjvy27sbeMsjc6uuUuVCsQjMC3Nt2ekmWxu0E/dqJu8yxOQJqUoTUBJbaFX3
	oXUNPjYC4p/sW
X-Gm-Gg: ASbGncsFX8fhTCaFAAds6HDTbdZtyOG1mIfxTI4owGKNtqLVEqZiOILtg6au88O9GK2
	76K9aK6JQptP2hRCQxx1LYGA+dvY67JqTBhfxkVLA41IfxC1UtC0eL/A6tU+S1UHgcy9rmrhxwy
	emgLIZzc3SCtTM5BdMTW/mixp3PdT1MJQM0Dc1bILaIJI+Gb31UAWu6Kp1RX/8Wsft7IoxDNw+E
	n9RHlEbNJEjwsF/ZY7oJBX19mrITEyarcJpBz60DzKlb3Q9X3ba1CZEeLN82ArYhwUIQg1pLNW6
	FpStYD3jUp2LLketojKP4An9J+ppCJb/zBMAvzaNiqSlFtaXxPABfvbV1Yg/Nv1QXQ645VSlHpX
	7+XK3BWRItsikGsuywTEHllR/6TbcgKKO0T89nn1Y/ErkawpGJWQpyRmDP2+ZbMhw50eH6FvhCd
	1ZVRVM/CAwOCwagQJL8IUvWztK3ZxYKkdJIQTw/jjJs7CbajHkCeJrVGUS68ptyj2k0VErRvybO
	MSS0Kbqxw==
X-Google-Smtp-Source: AGHT+IFYdstIK88h2DzNqSnXkoNZZTxC+NFmDH+MQK4MClgJpcEBcvp9PSTTwQIBKBRNe89kOYx4bg==
X-Received: by 2002:a17:907:d0d:b0:b41:873d:e226 with SMTP id a640c23a62f3a-b6472d5bbcfmr52909966b.1.1760630326396;
        Thu, 16 Oct 2025 08:58:46 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:39 +0100
Subject: [PATCH v3 06/10] pmdomain: samsung: convert to
 regmap_read_poll_timeout()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-6-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_085851_542268_8BAA8137 
X-CRM114-Status: GOOD (  12.53  )
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

Replace the open-coded PD status polling with
regmap_read_poll_timeout(). This change simplifies the code without
altering functionality.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 29 ++++++++--------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 383126245811cb8e4dbae3b99ced3f06d3093f35..431548ad9a7e40c0a77ac6672081b600c90ddd4e 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
-#include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -35,7 +34,8 @@ struct exynos_pm_domain {
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
-	u32 timeout, pwr;
+	unsigned int val;
+	u32 pwr;
 	int err;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
@@ -45,25 +45,12 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	if (err)
 		return err;
 
-	/* Wait max 1ms */
-	timeout = 10;
-	while (timeout-- > 0) {
-		unsigned int val;
-
-		err = regmap_read(pd->regmap, 0x4, &val);
-		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
-			cpu_relax();
-			usleep_range(80, 100);
-			continue;
-		}
-
-		return 0;
-	}
-
-	if (!err)
-		err = -ETIMEDOUT;
-	pr_err("Power domain %s %sable failed: %d\n", domain->name,
-	       power_on ? "en" : "dis", err);
+	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
+				       (val & pd->local_pwr_cfg) == pwr,
+				       100, 1 * USEC_PER_MSEC);
+	if (err)
+		pr_err("Power domain %s %sable failed: %d (%#.2x)\n",
+		       domain->name, power_on ? "en" : "dis", err, val);
 
 	return err;
 }

-- 
2.51.0.788.g6d19910ace-goog


