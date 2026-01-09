Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6134AD26D7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7Hmg5PdIFiKNjesvbLQf4CxxIUooCirMgEw2O+Jp7k=; b=vFgK1DVV9eM7iL2m7va/kldhtv
	7+1HaQho9T7LkMda2+TVqB/8PbDKqezwzdseBf9+4/CNyadM9M0KQHygjJW4XRhLlXO7CLyciP7AP
	IhelOGtN9SHSlmVI4hbuoCxN8/qb7PTy3DVqBWyijuwWKkRtQlnsfeygyuEFjM18w97XDkNmOqXtL
	VIRuBwWJlWUzvQftFy+pAJo2JQUzjquid9Tw4TrI9d7d4vMMYyiM8K0i9QWS+hfELsHwL0ySepFBV
	92PYZaBIimZjwJcgQWBmMhIZqRwe/sKaSWyX9LAnR3onioKgMls02fn2zj8a/ZmNpzjnWHwBbEtxg
	Ht7+EqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGGr-00000002ouJ-1XKj;
	Fri, 09 Jan 2026 17:27:33 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGGn-00000002orb-3W2e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:27:31 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64b9d01e473so7210308a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 09:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767979648; x=1768584448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7Hmg5PdIFiKNjesvbLQf4CxxIUooCirMgEw2O+Jp7k=;
        b=z1jxVHhzUlN1WzUMjplonGfNrDLKdg+FKNMie16iSB0XPiENrGEZLUNHfj/l1pL5fO
         +QPEFo/iVmrOTiN+ipPyjBss1lJLTHrBUvOm554tWyLRpJoIYr3+w1lHBH1EVyotEHvg
         8nbhSWbnZFL0JPxdd4N2CVXuDrL1u01Y04ogGTO/GIZy2/L5it7Vf02VMQbPZIngojaW
         1UHQV6cFu50X4rovGCb6bdIU+xqZb5Nnxcornnyis1LdOrdkLuuvtKr2PRpzYgG2tHsT
         drA/ylkL6x6khLj0re4qv+ql0lkpnTFsOqPKlFODZ3YXLBkHF654wvP3G4zBAczWglKU
         q8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979648; x=1768584448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7Hmg5PdIFiKNjesvbLQf4CxxIUooCirMgEw2O+Jp7k=;
        b=xA7Mzj3lHLpXkksXZxSVcP/dCLTqpPRt1NUyChW42SUJPtuKddc+U6Ru+DCJCYi1FA
         oNrCPJd3r+FCKmhlm3Cyq8Tp1Gmi8zt9RWdkHCpgfJ0eVib6tkEU2NWd7p3oQOhwzuQq
         KB0JbvFCZaIqyeVLN37hKdAswCNfF+xqDu/g7zWFd3uHOfdRQ0Beca7wsKcnJ/gHaTTZ
         pqmssZq8hCMAvFt/sPstF3Qml1hFF6EdnCaTWbGRFSyKy+UF781lwdKsv0EIAt1XQPlD
         3pGb99uHNcenEUSp7aMHOGWjnaKV1ottRPKZsgrLVxDAE8VqPVRlw75R2dxNUCkhZa4v
         0q4A==
X-Forwarded-Encrypted: i=1; AJvYcCVw+hP9/gfq3iJR1tLZnI2QBZLpQfVgqBbhmsYog4PX47KkSE2SlO6GAax2QeslR+S/nDkJvyAyDohnsIxMZZdh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4kfRZQxhmkhr0Br5FYnQT01ZR9K6U9gmS9L1H/sapTwwOSMXP
	/CsDZg7OevNqCnhdM4u7CItZQinOxUlzPtrsiyjzPQVRG9y478VWGProm6slU9KgpoOV4SXWk04
	tIYhazXQ=
X-Gm-Gg: AY/fxX7LI+DxTc4LwL71MQV8jxuc6m5A5Sh0ZNdfBOoZFkJGL9UKs6xYz+LEPcOe4zY
	M54CUpMMoP9cgIZ6VZpNv88Bv2nXTDMlbswK8g5T24pX5AsUJNCy4XjyTKahJv3zo2woAEcmyLJ
	/XvfVOrjufcwsCBnZo/iy0oQfQk8mtTd7HXC7h4p7+PDcuE7fA0VOhLXdvGfi6vZHM4oeId8gx2
	ogl4TPbmNB+vslnSe/Vn7I3zpqegM6aMmWf5OlYWEsGYiBsChuFoLgpHt0VKiJPYjI0oIaGPI7u
	CvHaXQCEb6Yv4o1/2tB8EmAvTKdqxCShAERXmRrPFGj/FKEx5QjsYC2dqAXLmT9dzF2asPz+PCt
	hWom59XiykF39bPaTd4KKa6DvhJLg122blk98XJ620RGjUAPE1tipOEOhTvYHl04XtSH3JBfKLd
	/Qa0UQ5Urm3hRHvr3DGbznaJ8Qq1B3tHyE8SShDyRggk0c04aj3xPTZyvNgMB227llTe3J19NK9
	MFhnA==
X-Google-Smtp-Source: AGHT+IHlzZvKQ1vGaBuCrNMWiF2l/TnTFiSG49QjgLu/wfS2dioTQUU95+p1/w0tLKgtkLx/PQjBDg==
X-Received: by 2002:a05:6402:2554:b0:64b:7f98:c7e with SMTP id 4fb4d7f45d1cf-65097dc6375mr8749976a12.1.1767979647762;
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be651a4sm10642182a12.16.2026.01.09.09.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 09 Jan 2026 17:27:24 +0000
Subject: [PATCH 2/3] clk: samsung: fix sysreg save/restore when PM is
 enabled for CMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-clk-samsung-autoclk-updates-v1-2-2394dcf242a9@linaro.org>
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092729_933063_12505B1D 
X-CRM114-Status: GOOD (  19.64  )
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

Currently, sysreg registers of a CMU that has PM and automatic clock
gating enabled are not saved / restored during runtime PM (RPM) or
s2idle. During normal suspend, they are accessed too late, after the
CMU (and potentially power domain) have been shut down, causing an
SError.

The reason is that these registers are registered to be saved/restored
via a syscore suspend handler which doesn't run during RPM or s2idle.
During normal suspend, this handler runs after the CMU has been shut
down. This registration happens as part of
samsung_clk_extended_sleep_init() via samsung_en_dyn_root_clk_gating().

When PM is enabled for a CMU, registers must be saved/restored via
exynos_arm64_cmu_suspend() / exynos_arm64_cmu_resume() respectively
instead. These use their own data structures and are unrelated to
anything that samsung_clk_extended_sleep_init() does. Calling it
unconditionally from samsung_en_dyn_root_clk_gating() therefore isn't
useful.

Update the code to prepare sysreg save / restore in a similar way to
how it handles other clock registers in the PM case already.
exynos_arm64_cmu_suspend() / exynos_arm64_cmu_resume() already handle
sysreg save/restore, just the setup was incorrect.

Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode for CMUs")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-exynos-arm64.c | 32 ++++++++++++++++++++++++++------
 drivers/clk/samsung/clk.c              | 19 +++++++++++++------
 drivers/clk/samsung/clk.h              |  3 ++-
 3 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index 11e4d49f2390ba714eff5a329bb1f427cd6437b9..35d4de233cc1b4aa25490ff20d0f0372b8d3d0d6 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -174,7 +174,7 @@ static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
 		const struct samsung_cmu_info *cmu)
 {
 	struct exynos_arm64_cmu_data *data = dev_get_drvdata(dev);
-	int i;
+	int i, ret;
 
 	data->clk_save = samsung_clk_alloc_reg_dump(cmu->clk_regs,
 						    cmu->nr_clk_regs);
@@ -182,8 +182,22 @@ static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
 		return -ENOMEM;
 
 	data->nr_clk_save = cmu->nr_clk_regs;
+
+	if (cmu->nr_sysreg_clk_regs) {
+		data->clk_sysreg_save =
+			samsung_clk_alloc_reg_dump(cmu->sysreg_clk_regs,
+						   cmu->nr_sysreg_clk_regs);
+		if (!data->clk_sysreg_save) {
+			ret = -ENOMEM;
+			goto free_clk_save;
+		}
+
+		data->nr_clk_sysreg = cmu->nr_sysreg_clk_regs;
+	}
+
 	data->clk_suspend = cmu->suspend_regs;
 	data->nr_clk_suspend = cmu->nr_suspend_regs;
+
 	data->nr_pclks = of_clk_get_parent_count(dev->of_node);
 	if (!data->nr_pclks)
 		return 0;
@@ -191,23 +205,29 @@ static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
 	data->pclks = devm_kcalloc(dev, sizeof(struct clk *), data->nr_pclks,
 				   GFP_KERNEL);
 	if (!data->pclks) {
-		kfree(data->clk_save);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto free_sysreg_save;
 	}
 
 	for (i = 0; i < data->nr_pclks; i++) {
 		struct clk *clk = of_clk_get(dev->of_node, i);
 
 		if (IS_ERR(clk)) {
-			kfree(data->clk_save);
 			while (--i >= 0)
 				clk_put(data->pclks[i]);
-			return PTR_ERR(clk);
+			ret = PTR_ERR(clk);
+			goto free_sysreg_save;
 		}
 		data->pclks[i] = clk;
 	}
 
 	return 0;
+
+free_sysreg_save:
+	kfree(data->clk_sysreg_save);
+free_clk_save:
+	kfree(data->clk_save);
+	return ret;
 }
 
 /**
@@ -305,7 +325,7 @@ int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
 	samsung_cmu_register_clocks(data->ctx, cmu, np);
 	samsung_clk_of_add_provider(dev->of_node, data->ctx);
 	/* sysreg DT nodes reference a clock in this CMU */
-	samsung_en_dyn_root_clk_gating(np, data->ctx, cmu);
+	samsung_en_dyn_root_clk_gating(np, data->ctx, cmu, true);
 	pm_runtime_put_sync(dev);
 
 	return 0;
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 417ec1786b5e77e17dda4022b417c1c6b79c59ab..9f68f079fd552f8dfb6898dbfb47dec0e84c626c 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -496,7 +496,8 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
 /* Enable Dynamic Root Clock Gating (DRCG) of bus components */
 void samsung_en_dyn_root_clk_gating(struct device_node *np,
 				    struct samsung_clk_provider *ctx,
-				    const struct samsung_cmu_info *cmu)
+				    const struct samsung_cmu_info *cmu,
+				    bool cmu_has_pm)
 {
 	if (!ctx->auto_clock_gate)
 		return;
@@ -513,10 +514,16 @@ void samsung_en_dyn_root_clk_gating(struct device_node *np,
 			regmap_write_bits(ctx->sysreg, ctx->memclk_offset,
 					  MEMCLK_EN, 0x0);
 
-		samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
-						cmu->sysreg_clk_regs,
-						cmu->nr_sysreg_clk_regs,
-						NULL, 0);
+		if (!cmu_has_pm)
+			/*
+			 * When a CMU has PM support, clocks are saved/restored
+			 * via its PM handlers, so only register them with the
+			 * syscore suspend / resume paths if PM is not in use.
+			 */
+			samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
+							cmu->sysreg_clk_regs,
+							cmu->nr_sysreg_clk_regs,
+							NULL, 0);
 	}
 }
 
@@ -548,7 +555,7 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 	samsung_clk_of_add_provider(np, ctx);
 
 	/* sysreg DT nodes reference a clock in this CMU */
-	samsung_en_dyn_root_clk_gating(np, ctx, cmu);
+	samsung_en_dyn_root_clk_gating(np, ctx, cmu, false);
 
 	return ctx;
 }
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index a56aa3be54d817cd24bf2bc29427e783a1a9a859..b1192ca03db5035cc485771ff5597cf132234a2a 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -476,7 +476,8 @@ struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
 
 void samsung_en_dyn_root_clk_gating(struct device_node *np,
 				struct samsung_clk_provider *ctx,
-				const struct samsung_cmu_info *cmu);
+				const struct samsung_cmu_info *cmu,
+				bool cmu_has_pm);
 
 struct clk_hw *samsung_register_auto_gate(struct device *dev,
 		struct device_node *np, const char *name,

-- 
2.52.0.457.g6b5491de43-goog


