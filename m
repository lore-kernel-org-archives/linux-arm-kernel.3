Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82706F01825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aes9Ymy2SVK6T0USFDpwiCwEp+iOTQGnFHuH7w4M/To=; b=0G5axoNF/53QtMK746Pp/2grFc
	2ZEpQdzGUJhKlBBPINF2cIvkFj/d77FeW90+Cg8jHqDwOR9krvllebrDnmu4zwRkvo8dUJUmkWS2b
	jhonipeTajicH6rWBlLUrzwiVjSHYvhPWlm1/akMBzVXutjfjess73JUtBgJ4Tewqom+zWNfUXcwi
	VxuJ4++JPUhBsvEintv0J0UD8E5Vz6NO+K56LUcNeQFIUIbvNg3KfzyaBzjVIxsYE9y+dh0vwnaMV
	x5tZhROBl1XEW6yrARw7rVpY5UUonsXVssLLy32W0YYdfltZmP2yF4vR5jp87ehTu1mfXKmhR24dh
	AbzIkqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRZ-00000003ScY-0xgN;
	Fri, 06 Mar 2026 10:30:05 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRU-00000003SW4-1emI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:30:01 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b941d924534so120587766b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792998; x=1773397798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aes9Ymy2SVK6T0USFDpwiCwEp+iOTQGnFHuH7w4M/To=;
        b=NLUTNDddhq1LckxM5y82x+DLOEBGZNpg1WfEduVVGwH56yN6xWpnTu4G0wIexyrH6A
         PYrvOu/H1Mq381pq8ClQa8BXIVfwe4LfjUogFVfepxWGtWupoLCoxBKkugFkwoQs0A7r
         iPizk+widvxHC6a0BpehJKnvUym17uz8ieauMMQGqisEO3aSs9xhyIjDyYqJuvmb3Err
         k53Do/GjlfgCCQG7VT/uoZkyH40F+rWGCKpf45PSJw8I5g+FsFKc607vTzfqTW4WfaSK
         5myCMPDQMXyC41X6HIyVTwLNFujjhYCIh7Jib3qdK4178vepXZv5K56SDDJI86Tqz7Et
         FdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792998; x=1773397798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aes9Ymy2SVK6T0USFDpwiCwEp+iOTQGnFHuH7w4M/To=;
        b=Sw8G1myBPLun3ufETC73Y+WhxlApYC+MxZhm9xdU9E7C7Au8IxN7ktDEhAoQrO1GL8
         1549GgAV0k9D3oFbZ5htaOlQI5jQ5bfpktPVbCpOBTmdZjG0M1xXG+n87KERN9FS6eS4
         8OOGz+awtXRzCVDtlTYAbOuyNBJ+SGs8j9w1TFhQ8a/rFcqtYXIJSOulIa+0roLMDVBZ
         ALU+0Kc8DPIjYGPSumDZHDOTOzRyZBnotICh+39/WEMVZlETV1C9BDkwCRBylxquNy0w
         F07JrlbxdJ+cM8NP6DlIv6HyceCP6AUARkbENcuHTqAZ7PDoneFjGhZL49AjHCKVk5wB
         9wgA==
X-Forwarded-Encrypted: i=1; AJvYcCUxjlQbdcf7LbhOWSTzAKKaqUGWbBbnaJtnaqt/7rdv7CF/ysBiU6CkpRVRzopXFKOHUVhkxKdM5zRpn6rYLeNS@lists.infradead.org
X-Gm-Message-State: AOJu0YyA4Gx47YG7LkwuFSaSPNdAUfDJUnmwaknN18qgdW46XMvjMPSl
	ewsNpjIce157oZOQKZFw+dBcgcR5AGDT5Nw1lidTnXmevXS6maH8nWUQNKy+HDShcA4=
X-Gm-Gg: ATEYQzwVKej8AkD5UvhgUI9vsYhX+mjENS60H+rXb+9GGU4Nx1wWWF0SLSryzZp04AE
	Zefn1jsBAwb/0+XWeZZyqCkWjWQLdE+AYISTrEg/vMf+HdC+At/9a8ydNg/vhBbL5e2MXT+yzDQ
	ehtJW6YKDi5sh/UbISZVUlV2aagN15bDbztktOYkR8uJsBifqWBd1Cf/qw75sRm5As0ul73bbpg
	FaPhSu0ackvyWvhyO85Y5tMKJyLYlVc4rrcmsibHY1iQvnCdtLRBYu+nvE8Duo90SLz1+bCnFPb
	ZjfPr1uxToWhQXfyKhSnRjKwfbREN6y+r58B9+9OwrExlUwnT1jzPxr9Zqmm6OLODtr5lEJo4OZ
	94Zql/MvHqXFiV+XDez9OywoYmkTz2B9TwuyYZto5wWqxFoAFvZikhBjYKyskiENH4SnOKKvp2O
	FYXMIhP10xIT0YFsDb23b+IJUwCAaMXwJnkQK+AjzNgihl3qPcU3D0Dy3jNAKkqn3hh1k2gkYrJ
	2u2rcjtvp0gjLM=
X-Received: by 2002:a17:906:9f8e:b0:b8e:7dcb:7f1b with SMTP id a640c23a62f3a-b942dbdc76fmr87190666b.21.1772792998248;
        Fri, 06 Mar 2026 02:29:58 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:57 +0000
Subject: [PATCH v7 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-6-03f7c7965ba5@linaro.org>
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
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_023000_451928_45754DDD 
X-CRM114-Status: GOOD (  15.62  )
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
regmap created by the PMU driver instead.

When such a regmap is used it will cover the complete PMU memory region
rather than individual power domains. This means the register offsets
for the configuration and status registers will have to take the power
domain offsets into account, rather than unconditionally hard-coding 0
and 4 respectively.

Update the code to allow that.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 3bcba7d38ac1..8df46b41f9bc 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -30,6 +30,8 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
+	u32 configuration_reg;
+	u32 status_reg;
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -41,7 +43,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	err = regmap_write(pd->regmap, 0, pwr);
+	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
 		pr_err("Regmap write for power domain %s %sable failed: %d\n",
 		       domain->name, power_on ? "en" : "dis", err);
@@ -53,7 +55,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	while (timeout-- > 0) {
 		unsigned int val;
 
-		err = regmap_read(pd->regmap, 0x4, &val);
+		err = regmap_read(pd->regmap, pd->status_reg, &val);
 		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
 			cpu_relax();
 			usleep_range(80, 100);
@@ -164,6 +166,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->configuration_reg += 0;
+	pd->status_reg += 4;
 
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
@@ -174,7 +178,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	    of_device_is_compatible(np, "samsung,exynos4210-pd"))
 		exynos_pd_power_off(&pd->pd);
 
-	ret = regmap_read(pd->regmap, 0x4, &val);
+	ret = regmap_read(pd->regmap, pd->status_reg, &val);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status");
 

-- 
2.53.0.473.g4a7958ca14-goog


