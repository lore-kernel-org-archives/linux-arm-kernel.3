Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0756D3F090
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebxIe09ZJP2AO9RkSAId8NpKhFo/Pn2AHgb75qkbgKA=; b=DKGxNa89wdnM4XGp7c/dw9k3Kx
	Ga41fS34wrUyP2Pc0y44kHIPLWyq3DB3hquwJUl5edfCdMh7IvvIYj5kN6sCoOrrh0FF1Kjk/9gSl
	yJ+kEIxgo2cDJWxlZLK5pn1ftx0ciHk4v6r2REw8kzG1we2Jpo3kDqKtKDWtTQQAs0LkLkQj13W+X
	itLccnvVmFDxyu9QvI2YqSed/Zs7yIX14dP8Y1I6TRg5YGGSk6FTTf7ExPrXnLP7ceDl4uFHll3Qv
	6X0o7768aN6GHQFAOyW4mQXbAIPx/6LHgwAkj20BUQzpYyR6+mG1X1UUMBMWG8a3ldGhOUDsgxgRf
	UkrSF5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88O-0000000GLxs-2gmr;
	Wed, 28 Jan 2026 16:11:12 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88B-0000000GLs4-2yK6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:11:03 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65808d08423so58881a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616657; x=1770221457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebxIe09ZJP2AO9RkSAId8NpKhFo/Pn2AHgb75qkbgKA=;
        b=mh/VODY4XawNIZVokTCHfnR6iu81d4rRE5any4mlNkTSyDHUMcEx/a33Qgg49Ii58J
         TmWyvgtpOGVWR0pmN0JZIE3l4Ju0UogsLUmTokytZiPQUJbodA0NdqqIt/KN1OCCzPzz
         04FUX82cZ3T1c3V3yvPvxK8mveUJLqNhhF/Q28we8l9ynQo+SPW1rYyLe/OUeGLY4SZ7
         qQl87osUPKuEZhMHji0oqkH/sJQvOA/UPs3de+l90Fud0l5j46ef9khAG8XTnEM2iXhZ
         ZO0NvVfqI8aV44XnAxKnZHv2s+LpyUlouLTI7PwqCgbYWOp+dMFcQ6HVnE4O2hqqSkcw
         Xqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616657; x=1770221457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ebxIe09ZJP2AO9RkSAId8NpKhFo/Pn2AHgb75qkbgKA=;
        b=QzzIEoGT75lAS5sYUXewY6vYlKHY3uoeD7wMqJYiOBvIiQoJuUWIGXBnvcuYVYh42h
         YDtCqJMkPkezdZ2p8/cBaF1buvemqMmoACqBPuE/TxgFpIBRdl/r+7mTCgYjgfD1qNwX
         IC7SlxFMFvu0YYbJRieXqHVQHOAR0GkEhGqEgSrSqP/WSq+lo7m0lXH41/4enoW2tAyb
         QkrrU029VjAbhwSNFww20+JpyT6cpldjeeHqS8VyvgtmSISexJ9BV3RmRDCFsyILc8OY
         br4Vq/n29CLIe9uT1mk/fWgw3A5UAGLcd0Bhi7g62g4xUIZYRjpUASLX0zVe96M3Dafa
         sA4A==
X-Forwarded-Encrypted: i=1; AJvYcCUpvWm/BCRzcuAhasE1FT9qgIqqjehoKqdYVqZ81Z7BJdCjBOaff2WfnZ6+cYTHDdbG/14iKGy73JgKeeKahVKf@lists.infradead.org
X-Gm-Message-State: AOJu0YysVasNzXZ0KIOLtLx0r2ayrh2cG8AzOZEcf8Civ6YXVVfExDk0
	UdALXlpMfsX59HkJSDPKyb0iGmseLviGM0QD8gohfKZXbJS6CtFKK7rHwHgtenEXKNw=
X-Gm-Gg: AZuq6aKNSPFVvsmQtZGa3mrtfTaLhZ9gR28SFAg6RxKiTCJhBinwDU9zMNIw2A8y/cE
	2uqmGx77Nm4I7Y3IaQESSXbN6EUTi9lDGl14lv1eBVuBXYv+79n400vD9KPxdfmEKDGT2DBJArA
	QlpV5rIzsIPhh4l9vLxbtnyeqC0QWWxOQrYUTl3tY0snKugg16diUEP5F+CQr/yfkC10Zbo1FHO
	u1wkT8xP+9QHaLex0W6VBQbRqGoz8IsyayY/UvG46n4GyEmax/OaAMI3vxUrpHMTPtB+XPzGpao
	qRg68MagdZBx9v6dMfr5s6c4aZu1a5ReK8h6pbec2yg0NeiToN/DXjsa70s4SSDZCA/Xi5kb8WC
	kCd7aBENI8Z7BwTlTqobLE8OLLUmHpZPHlsSZ3L/QR7fytjN/d6hxR4GqW/hcdLE7akFDiHRZ0I
	Fc46YwIzx2jg5w9x4qde851vZjbCo8BcKo5GD+M5kUamaGNo61LDkDz0l9NPUszI0BOWFwVd+ch
	3udKw==
X-Received: by 2002:a17:907:1b24:b0:b87:3c4a:e68f with SMTP id a640c23a62f3a-b8dab434f1emr359018266b.36.1769616657368;
        Wed, 28 Jan 2026 08:10:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:57 +0000
Subject: [PATCH v4 08/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-8-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_081059_761151_D2540548 
X-CRM114-Status: GOOD (  14.07  )
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
index 2214d9f32d5967b60e84f68f4e99a725d66a39eb..41a232b3cdaf0f4be413b25d9373b99c6a3db602 100644
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
2.52.0.457.g6b5491de43-goog


