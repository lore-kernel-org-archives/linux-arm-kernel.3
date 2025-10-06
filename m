Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99E2CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVe/h8oE+b7BSIsHHmcvuc3lfDEBo1cFpLLSAyL8B6I=; b=qQgqC3z73G36YE2ljiGhyh6T0B
	R7VclFqvfb7JOV0q1SIYUnsWtnhZFicLswvKCWQrfUbarT5YzsbvIZXWsfnCWRThVvReyOCbV0VIt
	sVgmyahmyimc7lK7HTEXEpQJ0cn9LZKYgyulHC4r7PM9VhXNaOnyXiRsmdhs0/jGotObxtj6OR6cG
	pxuGiaijnoADncEUn5EOM2iwc7G/vXtJad46FyYeG2dvm79ZFcfPDF1mdpc3alvlp+3o/XKYefeny
	KebDzK+ku6nfpBQJL4wnifIeJOg67qmafS8DO0ifQqDEudvth8phYN10vDiFnQurcJGUTzMKUMJ11
	0mWU9mBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJH-00000000QYb-2rEq;
	Mon, 06 Oct 2025 16:43:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJC-00000000QSm-0Nlp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:35 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-634a3327ff7so10616369a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769012; x=1760373812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVe/h8oE+b7BSIsHHmcvuc3lfDEBo1cFpLLSAyL8B6I=;
        b=TLf0XVinzWyNx1L3tH+farG1UJrhYlEu2E8dqwc6sdl6J5ZJZO9lvA4oB6fFEzKq9O
         bu4w4HbF9L0DkVWJcf3mwtFKBNzR1pgmSiGpIj1vs5JbSk8jRc8W7hE9zyNp/JAab3be
         f223BmOQAbGXl15rliVRTV/isDjqt3GK7l7JHJlvkzcMn+5JBsPRhQKqZlzFd+mBDiIf
         ciPZ0QOpt7Cgbv4umiUnNByzNChyW32thr6FI/XdEKcrNXGWjGtHfH2exi7QStiBxkiC
         gkHG5qKjghJIG5CWyTqfjnaIASY9zbTDZ7biTwR0gRM8A3s93iQGlSFNWun3/7oPHUtO
         D82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769012; x=1760373812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVe/h8oE+b7BSIsHHmcvuc3lfDEBo1cFpLLSAyL8B6I=;
        b=Ul0FCW4p/m7dG+6p7eEdsN4NzDsACGmKu1waNQir3SeNcnQ402qLdHO9YWdlwUSNYT
         owG/fjWXc1MMIgcau13y85QVkvzfClEi3vwD7DTli/eULIunNDJ18hkrqta48UWamkMX
         uOwqUOJ1Ze4tQt1inogS9nWBaOOi86EiWe3BoFEBdQI5Jqx88FtyGqKpR/fQGdXVdeGe
         ww+YAwOG6DeIO5QCe6UJZGyTzo53yoypunKO3ecUzTQhWqmKD6lG7ytYwUXIXMT8a5ww
         iC5KlL8kwtOvVK5ggiymPUjgto9dZwooDZjuncdvnMfnGtPBkJVMKtsyB9d3BaY04Cgs
         tR7A==
X-Forwarded-Encrypted: i=1; AJvYcCW60BQjUUjsUgF5GtF4EJxlL2nNNAaHRXzAB6BDEjDyYABu+bs7swK4Je7tROctPLf3+rgkrWufTQdezZTiX+wT@lists.infradead.org
X-Gm-Message-State: AOJu0YxFvcYIQFo6H3QWjdqaWOO0IfZfaBXTgEvetg40iTNO1KPzCr+S
	PVFIOPY478n6Z+sIlsr2eZkAOD0PXJC5i4O6tsh0MxrumlHA0GiDhugJlQZlwHpkqp10busEkB/
	XYZTlsPk=
X-Gm-Gg: ASbGnctWhuAMdvrW7aMqqLoe+0eKnuMRdZo+sAXZ7Py+uBbpE3sp0y5l9WOs82Z+G4d
	5ak3XCzFYODKwMf6ni+wXr66WcWcHhYRyhNQcP2S2IbCyclaz3B2LSjprXsZyHx9XrSyFIg5ma+
	7uADdL02+FogxWYjHfOwt/jEI7iWchYnd8X+hRoOEY1hWhJJKMjq9X0uW8aacXqzr3LUGXOR3Xp
	Q7dVIe7Vd7wzQGoVc1n0XeaFfJeOyOnjuXAOLEIsX12WWI+RpERJ6ROoLYtl/iKy6p0xjcnDdz2
	UEywKTr5LV/KInvPSmSk5kYs9Bb6eEnpA7JTGUvS6S7O7suSWLmKeP6il07zptg1e/LF1tYVCzq
	WFaqAFfXX8/YY1aZaHvF2aoq9oBDNoJt6X5yVYLhzFHsNv/q/Z42n59tyrS/Plo81dv2NMeMUqp
	bx0tNnzpABE0eHQL2SEtuT+2emN2QGcBRfESd53xc8
X-Google-Smtp-Source: AGHT+IHyfqUJ/1bbZ0b+uTuR4SP9fVf5ypcK6bma2PpVrFAj23Ekd8i6RkAsU0S6e1awiYiWiR2poA==
X-Received: by 2002:a17:907:3ea1:b0:b41:297c:f7bb with SMTP id a640c23a62f3a-b49c3639c42mr1623024966b.26.1759769012219;
        Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:34 +0100
Subject: [PATCH 08/10] pmdomain: samsung: try to get PMU (syscon) regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-8-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_094334_162952_A7377D7D 
X-CRM114-Status: GOOD (  16.64  )
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

Try to obtain this regmap using the parent node in DT in case this PD
is a child of the PMU and fall back to the traditional direct mmio
regmap otherwise.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 58 ++++++++++++++++++----------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 5a87802cff394945cb0202d08f2cf6bcbbcc774d..c1b5830b2ad3e8b272dcc8ebc364be49aa7fda7c 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/mfd/syscon.h>
 #include <linux/pm_domain.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
@@ -107,17 +108,9 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	struct of_phandle_args child, parent;
 	struct exynos_pm_domain *pd;
 	struct resource *res;
-	void __iomem *base;
 	unsigned int val;
 	int on, ret;
 
-	struct regmap_config reg_config = {
-		.reg_bits = 32,
-		.val_bits = 32,
-		.reg_stride = 4,
-		.use_relaxed_mmio = true,
-	};
-
 	pm_domain_cfg = of_device_get_match_data(dev);
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
@@ -128,25 +121,50 @@ static int exynos_pd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/*
-	 * The resource typically points into the address space of the PMU.
+	 * The resource typically points into the address space of the PMU and
+	 * we have to consider two cases:
+	 *   1) some implementations require a custom syscon regmap
+	 *   2) this driver might map the same addresses as the PMU driver
 	 * Therefore, avoid using devm_platform_get_and_ioremap_resource() and
-	 * instead use platform_get_resource() and devm_ioremap() to avoid
+	 * instead use platform_get_resource() here, and below for case 1) use
+	 * syscon_node_to_regmap() while for case 2) use devm_ioremap() to avoid
 	 * conflicts due to address space overlap.
 	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return dev_err_probe(dev, -ENXIO, "missing IO resources");
 
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return dev_err_probe(dev, -ENOMEM,
-				     "failed to ioremap PMU registers");
-
-	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
-	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
-	if (IS_ERR(pd->regmap))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "failed to init regmap");
+	if (dev->parent &&
+	    of_device_is_compatible(dev->parent->of_node, "syscon")) {
+		pd->regmap = syscon_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(pd->regmap),
+					     "failed to acquire PMU regmap");
+
+		pd->configuration_reg = res->start;
+		pd->status_reg = res->start;
+	} else {
+		void __iomem *base;
+
+		const struct regmap_config reg_config = {
+			.reg_bits = 32,
+			.val_bits = 32,
+			.reg_stride = 4,
+			.use_relaxed_mmio = true,
+			.max_register = (resource_size(res)
+					 - reg_config.reg_stride),
+		};
+
+		base = devm_ioremap(dev, res->start, resource_size(res));
+		if (!base)
+			return dev_err_probe(dev, -ENOMEM,
+					     "failed to ioremap PMU registers");
+
+		pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(base),
+					     "failed to init regmap");
+	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.51.0.618.g983fd99d29-goog


