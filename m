Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEFAEEF309
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aes9Ymy2SVK6T0USFDpwiCwEp+iOTQGnFHuH7w4M/To=; b=UzCseF/uF6oyDvr77/QXEAP3tV
	lC34atC2GUw5Bde0D1NNYX07m6tMHnkbBsyvyT8qk7dSVF9QJD4b2JhNlpH0oEDBqI3zafSJQmL5q
	H5c/vKHRw8t5TZYOyfS+ohpaQnU2KXNVR+q+XBNPPvm5pLOSIhwHtYTMn9aLuK/4UwkMR4NOya8bJ
	v8eNn0G8dSQDm4IbS7yCgRhb3XhXkUSC+YGx6FQhci4w3GdnVWZdEnaH26LAgAjruD33VN+C/OGa9
	qv/kwnORl4tVHl3OZLPstkQiM4fx3LGncxggRs9/0erLJOJYPuDRrroAThj/dYe/EtlimBlmP3+Dx
	klLhyf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wK-00000000ybl-0bOR;
	Thu, 05 Mar 2026 06:12:04 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wG-00000000yY0-2Ty1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:12:01 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-660be63279bso3247582a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691119; x=1773295919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aes9Ymy2SVK6T0USFDpwiCwEp+iOTQGnFHuH7w4M/To=;
        b=lLQMJ1ovfDwhekuyJFxUm9lEkcVLecVz2ymVzTvrWfxokeo84LWSYES8yomNCQvDSn
         Hdubv0IDOL/zDocI/LpX/620eKBmiaWiahBDXqywodxoXGIufz2PHvJhPxQOMkSBO588
         eC+TsFau8mX5p6D05M9vkPoJBbomIRaFgi73GPcR1AwCjAajA0xJJkEqiYMCBR+aPvqJ
         91Jkh1xw8AVtQgUMgS8TvdNw8zAFrNCgaU+UmiQ93gXZVIAXQ+zl92Bp2M8ZvD1w1lUB
         9XTdtekcK1yQRXViyR/z2CT45icIUz9sWsBrr1a8ZRXLS/LHMGBR1ZCTR8XkaSVXj3Ct
         8nFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691119; x=1773295919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aes9Ymy2SVK6T0USFDpwiCwEp+iOTQGnFHuH7w4M/To=;
        b=gYySyoNbL2LXRG4LnfdMJzzoaDSdOXrPFEfGZBSBKfVGhM2jMprt9we6XSDnTkRtR/
         Y2wpFVdyk9gHLBkkeuhmvOFAMZFoeefnjHROh5QcHhZM2XQiJroMQcxyWrgUOc2MXEud
         p2k327FiDNcLmha3AweS9qYY1aKti+vohdJt4uDAcnuRGNzcUupCR5C8tX+89gxk4lfr
         +bMJ3w+ftZHoIqb5i6OKRVZMPxDFeNzVF9Lx0iXeLrTOtIWHElwXtE9C+GMxtwOmgKlF
         PgkeY0AeRLiit321HaNHXBFb0Pcxu4JBZrUjqzQjdh4kHbTiUF+PYJS1+3LI8CdYw5Ba
         y7VA==
X-Forwarded-Encrypted: i=1; AJvYcCXdP7xpGd9H+UGGdgOEWQgDxNXpnTVNn3Bv3q7RJHkZlJ58IW8RcvFn3NLE2lJN0Fv7UFyLZaIu1WxvHs6nN+EP@lists.infradead.org
X-Gm-Message-State: AOJu0YxQT8rXMeCaXGTTsMgg7ioWUPupPLQgBLqx8/qdTtuiIfV/7ysE
	nZx+8/eNbHHAU8xHsOixSXLVveqae2khbm3mG6YrtvqTb3Kp4+jiCidSaffAgG33afw=
X-Gm-Gg: ATEYQzzzJs2vwJEm8xXJVVoZ60fS+Qc2IS7XYFSIpNfncQnwhoJpWLt4qjIFcojwe1N
	XOxIu0QjuoI9it86yaxs6du5YlGTRQZhFyhebBMemYObJwrRX5ga8bTIJ8SJvS+qhlJGxY8bhIt
	dDkiH3TQiG18kaUzNvYBi9aLi8dl2q/dwVMp7vhgayG7DQCZRLe3Q5ZTNp1EExOIgC4k1XYaF1K
	1jEZcla3MWiN62jtMjwbfc8b0C33IlPI1jo1y3Pi7y1+JoQUtie99AFL7hBvAroujZ+9Xt9xzX6
	YdOqQUCdxUduSMVUfghlsDs7ONbpSHpsijtdeC3Wq3Jf/Q1dXwInQ9wFfuFKbm83cix/s/5DbTx
	7qfrq/eXJOpgUDu1PID30axH0drmiG1hPyjgYgnsuaMN6PfjCm1g+8+0PUq3FOewG/Wr8OI9XQf
	2H63aq94SgiHfueNopD5rXBdQ/VRsmZsCLXLKHaqWQ5FxcHK8tw1BOfYeP8AD3vBWLNvd/CpYMC
	PGBT20c++S7bBE=
X-Received: by 2002:a17:907:d20:b0:b94:827:c561 with SMTP id a640c23a62f3a-b940885921dmr63080666b.4.1772691118046;
        Wed, 04 Mar 2026 22:11:58 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:55 +0000
Subject: [PATCH v6 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-6-8cb953c1a723@linaro.org>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
In-Reply-To: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
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
X-CRM114-CacheID: sfid-20260304_221200_654754_E438271C 
X-CRM114-Status: GOOD (  16.42  )
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


