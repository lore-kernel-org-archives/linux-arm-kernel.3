Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96823CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=If4su5VGSArDtM6ZmAq2TrN2LVZ1m2nsNGX5iG7vCMs=; b=YZUO+doNUELjurCM3SVnGPRzDf
	ZDw/o27FGqIr9Y+VGijSYxIOWJRYc5/BQhlzJtKOO4rpnrMTdqITqkgoU/HZbx/OytaCsVF4zh7WN
	cPFDpyQGzW2Q5/Cd8MJU9+UyfgBizk62yhqLZxOhpp0lh5/zFfta3anseVarFOCBDIYij8m9+SfDr
	La0eitX8dInBlSaUD7Dr687KjpVBMV1YJUDC1V0xkxGwd4vHLJfQmX9E2IywRQk3VvC86j61opOy9
	zI+lGMHYAk5/dIsYb+gTw5gKp3vhZbSkIo1QqZ2GNt89Ge0vQ7O6mUWYhlbOHYh5+GiBzmW00lTh8
	QcNfHKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW2-00000006Tzz-2zzO;
	Thu, 09 Oct 2025 15:25:14 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVy-00000006TuB-3pox
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:12 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b50206773adso404378766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023509; x=1760628309; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=If4su5VGSArDtM6ZmAq2TrN2LVZ1m2nsNGX5iG7vCMs=;
        b=Jjqvy1YgZBf+m1n8DVlv/P/T5ZYrUKzE9hyYST/CdLBvaaxwr7axJI5RU2W8AD0Mff
         7xdR0RkOmS/Z2gfuja3MoXq5Xzo8EjYPqPHV3YhUpcINeqKA8wN2uGu7onzSA9NqwSoX
         Q1+Bf4jHsz1cnBIwVWdY345zj/bLjVTToEfhRGxev0uic1ntf5Ddl2Fp37hlpp2Vmcva
         Rws9UUyZQ7GV0RDgFUs2oRkLl1KJaAdxdLLPkK2Cm1HPawNFMaScoEQ5/XqlT22tXCmu
         xkGRV2JxcbaU00oKoqMgHaLDzl7mSqzduEoY4jJhhYr7/6Zz7B78/0j82oZqthJCACGI
         OMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023509; x=1760628309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=If4su5VGSArDtM6ZmAq2TrN2LVZ1m2nsNGX5iG7vCMs=;
        b=W/0rhUNv1eA7Evx/g7jNs7tOHZfupyxymRaPIxNHw9vsLzT8Zh0bRHMD58qrhdaXmn
         adyOnLrZqaTugdbj80QgdSJs0rOw3QB5v26n3cidzXRhOTe4lh2IpRuYNyJoMhPoIO5y
         FoXGUtBPyc2m9p9/xSb/FPBu0+ko/FzeNcna3aeTA/NXrzcvhBbN6MCPRZvJbYRPApmy
         m+rzOKKHw0f0mnH04f4czEDeASIDCwXgVMAenj0r2pPjehF1ycpRhsoKGuTHxdOHmwAm
         tB3s7EDBTYYIb1mtXlOHjxtHdkhiy+Fydgwh1MsGjAi9fbXYpVG8G8afSSmXeCKcL/wZ
         gzGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnfa0/cOlT/Wtp4uupUE+Q/4jnawLkfqigEjHUvBd8FZcrZOTTF4Veki6NojsJkop0Y9hyp/xMRCi3HApcTbkC@lists.infradead.org
X-Gm-Message-State: AOJu0YzaxJZtjzK2gWVeqbT0rsk7k/NhwWSXhIHNIrBF+ZkGYWWmS+xv
	4wFJJuBnOXGNogs8QMgzqi5NuGfedzBl+8ewciyjKBBIdQiQqJ7eCWCu+LuFQm5W9As=
X-Gm-Gg: ASbGncsIlmTmPc+8EpSGWZIaPhRB3sVIswlfKstHjZLRJpoi6JgKRRJnvBnjKj8aXeI
	4MuRW88x4NT75ehT7lrGr4nMr8ruUtZ0C/8xpYHyHU9b5e0FvMBeb3p5UuOcymclJ68FAbjN7LF
	K+HVK82QbZro1x5wlnTGVDpjFDizkJUKdbLJl2uF8BSirs1dOr5rjA64WL9gpCBQibzrK5fZVqZ
	Vemzd9YHhR1jKHj1unPviOkbera29v6Nwcc9ZYLDojwkpCEGN+TSUEURf3LFsTTTGXJ5/wwJQ1u
	UubhHpI7aOiT8vdfzJlu+96lDgjM5bTVZ1/wmMip/GJEFQoozeuqjZvlfMzylwovMVPSdRmj2GG
	kgcDlfd659J5opUvDnu9PgUTDn5HiHn3zpFK57kAKsD6NmtzIzv/3BbQHCSLy00aiJIRve0T+fi
	W9gAPxTRwhv9YhUayQr3K7jA7m2257ixD4PcGILXqiynY1ZTkubJI=
X-Google-Smtp-Source: AGHT+IGqgJYOgxpScnC7w6lgZwCm7ta9CxHWmpR8whF617JOpHOk3iVVQV+J82lvEfnmp6mQVRG2Mg==
X-Received: by 2002:a17:906:d554:b0:aff:1586:14c2 with SMTP id a640c23a62f3a-b50bcbe2790mr1084898366b.4.1760023509102;
        Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:09 +0100
Subject: [PATCH v2 07/10] pmdomain: samsung: don't hardcode offset for
 registers to 0 and 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-7-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
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
X-CRM114-CacheID: sfid-20251009_082511_002688_025EBBD1 
X-CRM114-Status: GOOD (  15.41  )
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

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
(syscon) regmap created by the PMU driver instead.

When such a regmap is used it will cover the complete PMU memory region
rather than individual power domains. This means the register offsets
for the configuration and status registers will have to take the power
domain offsets into account, rather than unconditionally hardcoding 0
and 4 respectively.

Update the code to allow that.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 431548ad9a7e40c0a77ac6672081b600c90ddd4e..638d286b57f716140b2401092415644a6805870e 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -29,6 +29,8 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
+	u32 configuration_reg;
+	u32 status_reg;
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -41,11 +43,11 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	err = regmap_write(pd->regmap, 0, pwr);
+	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err)
 		return err;
 
-	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
+	err = regmap_read_poll_timeout(pd->regmap, pd->status_reg, val,
 				       (val & pd->local_pwr_cfg) == pwr,
 				       100, 1 * USEC_PER_MSEC);
 	if (err)
@@ -146,8 +148,10 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->configuration_reg += 0;
+	pd->status_reg += 4;
 
-	ret = regmap_read(pd->regmap, 0x4, &val);
+	ret = regmap_read(pd->regmap, pd->status_reg, &val);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status");
 

-- 
2.51.0.710.ga91ca5db03-goog


