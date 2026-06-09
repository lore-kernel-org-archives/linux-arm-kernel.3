Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D2ACD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZcKDdH1yhiVL50Qlb5vKMH/mf+UgMoMx7KZoBbcwRZQ=; b=CrdJY7EHCxMELXF4BOScZmThdG
	wW4eNWhY9+LP2unTEtGCBQ2PIXtiVUqshnVHU64aDJ1hOzB9F4kjl6SOGXmpiyT2Gr2oveWbvUsvK
	Q6fxJ9T3jGGFB9eXkdAbN/dW7k33kfObgLfUN8QyT4nKXmWr+uRlqucAKypI7XQCcVlnqhQeZAR8J
	MqvkLSe+/fFWhmkZhIRcFEAOIpaluNk4wRwsy5JrQeB/Va1xkqecglZdmcfLe/oYWu/9kSTtP1XnK
	jZYA18V/aUzSKS0Qqr3R2LOEYSr4BTfK47qk9lxVkjvb9RHzOkqMm1+/A5YOQAo44TqwUzOudTIFM
	qoi5fJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwc5-00000005g5I-1usF;
	Tue, 09 Jun 2026 13:35:29 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwc2-00000005g4c-3AWP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:35:28 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso3932954a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781012126; x=1781616926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcKDdH1yhiVL50Qlb5vKMH/mf+UgMoMx7KZoBbcwRZQ=;
        b=CqQjEnH0ApQ7JSokdszP383uhWgJojNwL09a6JPl5H4lB5VCB/3GzsOsQ9QL/p+Rdz
         YmyVhJ4CWGDRE5DP4F0gqVP1PVPiPvxig85W98GGKd59N6tsaa2KhChdfXNq9M+f6/vl
         85kJ86Rh+TTRQz+C3PfFnTW/EUDHfw6Qunp5rvHtIDmXjln3zM+TPpqqN0xzKq9kOuis
         ldq6DKdyPtQa11zOoITl0990Oh0u4ODCugbTk+c6W4+xUhWDh2Y9HKusTgE2kQP7A5Be
         rFQz22Gz7BTNIfo5a/9J8BnOvUyhmlgMokN76PbV+2TFB4yxREnGvvIKYZ+e5KMJe3Qa
         Y3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012126; x=1781616926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcKDdH1yhiVL50Qlb5vKMH/mf+UgMoMx7KZoBbcwRZQ=;
        b=eCA2p+8UNQqp0rtFKKmlR895iAi60/Mq2O+LucqZLJFk/k0Vsfx2DHRTOcZKrMLSDX
         +UccVN8aYfNhiZcHTSZI/Pat6tSZ+gqMSYUkQtBQKl/kArAN1BvjwHLxKYXvapMj7ApP
         GAav1weey2IkS8LwFCzNBCKAZR6zwOXl4JeiTAinOga2gD71U5upzyXBjxrEVHZSIIBV
         94852gYogQwp6BSnvI7Wbx2RpsKJ1KyX2K4TYshLUSciEK4MVad2w5vQvw6LKAd2KdS3
         gHmaYcN430yV4xHuWO8QovCCj+MUONsiYTGt4DiJz9yFiQ7TOqVezmQ8Eoz9AqkRmIMZ
         hKsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XedcSStz6P4h9F14OLUyF0P1d2VQlT+6vYMB4t3uwtrJ59RNWybnh6TIbAfuYJT7FDSGLsHHJ19MlS1BZUhXf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+aL7xm4u9kZWCLJaA+rs6+Ou+5AoggOlCxaGRT1tkhkFJsL4a
	af1dwdzDoyTexJ72bjxmN/tjkJDNuwHfuKgeH2GZwy6BQGAucDacvawT
X-Gm-Gg: Acq92OHFnhmxfXcm0YC2bkJipfKv4mZ6l5bzux7v+fXrPxf4gtf1ApFPTbchQutWsWd
	sOzdnt8BdGFhkRsEHXirY4GAod/jl4AaJem1r8kGng9cT7dPnskR9MKiytibVKAvX2b1yai0Gv+
	Ctw+WNEof+/mjqNYdKJuanNUc6VtwgUjnUrM3sc7Yp6mETbFNV/XZSDcMFLdEBgIFXNJ/o8WX3u
	C15OgJ+ZCo/0Gc4JErgzHtw2TcB9kLIQ76RXW3GolVWZqu7OuQvYz8awxZ2uJxyXs3ZWkBq5HHa
	05l4t2FePOmmh8O+S0A8SI7coxTROI27vhj4g7InDe0oSi3fHYftvFqqCxlClxlJOqb9kcowuLq
	SFSr0k6BgMwGL708Ze+r//jO2x5jlkOsKey7vMblQ3cBTrGYYbxlijpwJd02MlyQad4k8yHIQpS
	e/qgOue/ed0xF9MsUt3axMZRR5tElVg4EZklUnCEFv/LAxruXie+Jvb/OOOVghm8bnv/tmyGctG
	NnU8HZEbxT7KoyqX5tcNZ1GxWehp0GqYqw0n/Ma5vP13UA6KvDRWcxSZhbK5H5y
X-Received: by 2002:a17:90b:57c4:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-370ee64373dmr21339868a91.5.1781012125708;
        Tue, 09 Jun 2026 06:35:25 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827f1sm23628719a91.3.2026.06.09.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:35:25 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH v2] soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
Date: Tue,  9 Jun 2026 23:33:20 +1000
Message-ID: <20260609133320.1748882-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_063526_796140_E7FD78B3 
X-CRM114-Status: GOOD (  13.51  )
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

exynos_get_pmu_regmap() obtains a device_node via of_find_matching_node()
and passes it to exynos_get_pmu_regmap_by_phandle(np, NULL). With
propname == NULL the callee uses np directly and does not drop a
reference, so the reference taken by of_find_matching_node() is leaked on
every call -- including on each -EPROBE_DEFER retry of the only in-tree
caller, exynos_retention_init() in the Exynos pinctrl driver.

Annotate np with the __free(device_node) cleanup attribute so the
reference is released when the function returns.

Found by static analysis tool CodeQL.

Fixes: 76640b84bd7a ("soc: samsung: pmu: Provide global function to get PMU regmap")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
v2:
 - Use the __free(device_node) cleanup attribute instead of an explicit
   of_node_put(), as suggested by Krzysztof Kozlowski.
 - Drop the former patch 2/2 (regmap lookup helper refactor); with
   __free() the leak is fixed in place and the refactor is no longer
   needed.
v1: https://lore.kernel.org/linux-samsung-soc/  (<<FILL IN v1 Message-ID link>>)

 drivers/soc/samsung/exynos-pmu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179b..265a095316079 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -167,11 +167,13 @@ static const struct mfd_cell exynos_pmu_devs[] = {
  */
 struct regmap *exynos_get_pmu_regmap(void)
 {
-	struct device_node *np = of_find_matching_node(NULL,
-						      exynos_pmu_of_device_ids);
-	if (np)
-		return exynos_get_pmu_regmap_by_phandle(np, NULL);
-	return ERR_PTR(-ENODEV);
+	struct device_node *np __free(device_node) =
+		of_find_matching_node(NULL, exynos_pmu_of_device_ids);
+
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	return exynos_get_pmu_regmap_by_phandle(np, NULL);
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


