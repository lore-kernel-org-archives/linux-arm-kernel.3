Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31EAF01821
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJyveOpQYRN0Rj97xYSp2eMNn5Hi3Nxu7cTlokaFCRE=; b=LZMPzrwVPG4JQP31yZCcYC6uUz
	DhEdXUp0E+AOdbbP/2++gi66abzwQeStfbDONsCkmoEmSfByWo6oWcE/ovWKQRQCiFQcLaUw/BUUV
	ipXlvnBz61jjsAewi/FUw23e871pXEmorA1ZwAKgDnbGrLEcsG/CKnofHofDe4tRA45/UBRTv5nQo
	EIAFzN/jMNVZups3PlVLnzOtLInIShJ4PAz6ZjmbJFY68esZT1L7yFYuO5Jrp6IOaWXGmTdLQEk70
	7QEyXh5XX2jnHwm+cNjjxmkd94LKw+i+qnxx1uEIlh8k+5YySDmLnfDOsd9fs/SekDrqwafC39Emy
	Ob/zTVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRZ-00000003Sdh-43Mz;
	Fri, 06 Mar 2026 10:30:05 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRV-00000003SXO-2765
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:30:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so226423a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792999; x=1773397799; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJyveOpQYRN0Rj97xYSp2eMNn5Hi3Nxu7cTlokaFCRE=;
        b=v3Ep2N7MeSyoU62iG6kMEIdkSqnXyqZ46awGI46gHq4hxIBGUcslcoRkIt0i29ChCn
         Kekx3yYzCuekvGaBtOEeZae+kFJjc7UAin2cZHYkTTfRsSTGjL4jACiV7ao6umBXfSFx
         Iv0S29PE0vQiGo0ZTAt/ZhZ8jrZfik1yrCxTFCsB2oKJ5ZX+M3mGfnV9rqCwMBZVAEzd
         rxulEUc3UCsK7YZLf18jduTH1phxfIpBrvagwGvh/7FGcV3Wcxft/KvTwaNOYLOKg6yV
         fM99g37BVEf/OfAJOaLmWGoFgszfQqPgfkNYaDH2iBEt3ai4yr1VD4ngd7csptPEmFxr
         IY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792999; x=1773397799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJyveOpQYRN0Rj97xYSp2eMNn5Hi3Nxu7cTlokaFCRE=;
        b=kc/HPBT2pePdlThIcAMdu0dL+rTSpdBYEY77iwS0Hzo4dWGA+eoDLoNgUMx18y9sKC
         gPHBFiI/DQt+MGzHPecrOV9CGy/7U2YkMmT00PQOYZ6tzM2CdsxW198QBwSbDE6GT7Ww
         3UPUbAo5LSj4p8pypg8+Pfp9uThxLAHgKqLWbvt1IjjIsEFq9oYmdyrwjVREJAvovybT
         OGQ52epwQSWAj2ittLL6DHKe6L1BPoKZJB6rCfbprxzYLXrrj+9r/efa0EFm1wznNrs5
         9RUjYfT8k7iJXjAqnh+8VOMkV6ZdWgsDla2+fS8k+EJQCODzdi281EHn2gCTg9CtIkkW
         oZOw==
X-Forwarded-Encrypted: i=1; AJvYcCWRNy5AScHTnVyazzvZGoRvkrPePHGTqaSHKEu8PCz+s10lMiWgudham1RHwDkrz+I/Qwc9gcS/GjSFo3Br3cuR@lists.infradead.org
X-Gm-Message-State: AOJu0YxfKyvYjEiP8CC6t5msFQvHQo47FwHt64/WfAkTh8H2TxjDyjeJ
	3Go1lnB2k/Kru/p+tax3sRg5+bviR0JaBwPBj+Mk8CDzKH/jm4Y2ibpSt4V8mloLtJA=
X-Gm-Gg: ATEYQzxIAfi+Lytx6T5I1m006s/giPbQDa3MGkOa9pRRiZ1fLdQ61EHxRiWqu9b6+1m
	KjNyHUw+2dyu8sAo/0igeuMYyIz+W0HZKNyfKq2ZpJUrp1HY9ZqHX5Ox6mfuEOYJA4gCfaTxJy+
	CvrmM9+WxMI28PKFqSeCf8g0qcUsK2rQmhxcrHEzEYoGCSsp7Lq3imRaj+bTtqC5tdc16IYcu8p
	FB3nnwec0HBsSY4VeDu8EqTQiZvkJGCNStUsu6m57TRhFIfzEAMNufXOfqwEo9oSZq1dCKbm4k6
	dLIpqBpDOCzAS/P8/FySjMXPCkBSI1t83h8dZsKBdBk5cM6UrtiNAm9ldQVblqCVTlZhcrMjjPU
	Qlcao93+9SueUoNMhlepGwSmPNEgxiKZ4gnskmfQTQGPLjtEgISPGeqFfoPn6kbSqzSun27e11S
	g9gPUcwAqOYKkUva+hsdn5NJw4Rn1rTTcjx2jCLUbsij0DZFICVqXiPzAraxoglQrRVn9RYHKl2
	IlB/XvRa0A6SwIxTJ02Nr3JLg==
X-Received: by 2002:a17:906:6a0c:b0:b8e:3d49:25db with SMTP id a640c23a62f3a-b942e00db25mr86819966b.54.1772792999461;
        Fri, 06 Mar 2026 02:29:59 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:59 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:59 +0000
Subject: [PATCH v7 08/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-8-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_023001_570596_4D520837 
X-CRM114-Status: GOOD (  13.74  )
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

dev_err() gives us more consistent error messages, which include the
device. Switch to using dev_err().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 2214d9f32d59..41a232b3cdaf 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -30,6 +30,7 @@ struct exynos_pm_domain_config {
  */
 struct exynos_pm_domain {
 	struct regmap *regmap;
+	struct device *dev;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 	u32 configuration_reg;
@@ -47,8 +48,9 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pwr = power_on ? pd->local_pwr_cfg : 0;
 	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
-		pr_err("Regmap write for power domain %s %sable failed: %d\n",
-		       domain->name, power_on ? "en" : "dis", err);
+		dev_err(pd->dev,
+			"Regmap write for power domain %s %sable failed: %d\n",
+			domain->name, power_on ? "en" : "dis", err);
 		return err;
 	}
 
@@ -71,8 +73,8 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 		/* Only return timeout if no other error also occurred. */
 		err = -ETIMEDOUT;
 	if (err)
-		pr_err("Power domain %s %sable failed: %d\n", domain->name,
-		       power_on ? "en" : "dis", err);
+		dev_err(pd->dev, "Power domain %s %sable failed: %d\n",
+			domain->name, power_on ? "en" : "dis", err);
 
 	return err;
 }
@@ -140,6 +142,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
+	pd->dev = dev;
+
 	pd->pd.name = exynos_get_domain_name(dev, np);
 	if (!pd->pd.name)
 		return -ENOMEM;

-- 
2.53.0.473.g4a7958ca14-goog


