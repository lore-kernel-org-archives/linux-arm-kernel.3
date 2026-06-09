Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D797BCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Atlbwdb5r6O9CLVUIxIon+j2XEv/nqOX8bGypd9DhqI=; b=U5d+BAePEAC00r4l5/Mr2DQXs6
	Vva7SHhP3jdLB5u7ABPccqq0ZLDKJL9dgefwuC8q9KeNULLM41YTiUcAM5EgVIN+KyjSbUBXkozM5
	lvFoT/yOlvcO5iNOdDxubOiJQolxnS7P0fXFeGhF/Gu/vhz3qDY7/KYLbkuJIaOIGiuFCYrUsdyOK
	CROo1RTF+R0tL+Oer1pV4IVfMe+OiB+EJGIbfr2qJ8xx8w3gg9drle5UJIHl9b7u+KryLbxy4JFBH
	bub5kvbyUVI4Um+QXCNqUKLzuFeYb6u25ehO58BwsKjtYlFX+CT7S2wNL6MJ3vgnd2qNa/XDaHsGK
	TnbC+1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt8X-00000005GRl-0qog;
	Tue, 09 Jun 2026 09:52:45 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt8U-00000005GQj-43ND
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:52:44 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c8585c51f1fso2572397a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998761; x=1781603561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Atlbwdb5r6O9CLVUIxIon+j2XEv/nqOX8bGypd9DhqI=;
        b=D3aVFybkJ2fNU/3oTYDDX8uJ8XVz8Y0QVhA5SgZQtewMYU2uav5S1UR3KtEMZUnceO
         4xSZ3sc2ZJ9Ui5/FemxaqTzc3DXpp+H6FAduxw1FndCSHphwRtDGf5PIGYWMh44kqBAR
         xHMDrVCLs9xqMV6uCn3Cf01uhzcFX4b5dh+nZLqQAMJIPqvTfcKDIEkGWh27M6l1NG9W
         aPfq/738Jm7/0c0y0GiwYf+Upsj6R9SXMLTRU0oWRoesldtsbKqjk8QqpiDCm/UaW4T+
         l4jrAZAEy4cm9FZ28GRbjxRr0kCHeGQJaeUqR8rFTrnwulVIRm5gI0b00aRXnzPgbKR6
         /Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998761; x=1781603561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Atlbwdb5r6O9CLVUIxIon+j2XEv/nqOX8bGypd9DhqI=;
        b=BrVF/5R8eWoVnnHtRsWXWJxzPHH3g+0kC40LRHilB3G/LiXyhoyqrBCT9axhwddtv+
         Tuy5E1ph4grNTeLx2z16bNC64tggqKZ1tuCXp087eeinPQbwc3NxIZXo3npWgqOG9fgB
         z/9Y+Epfe6niQ5hc7duiLxig9m3laEL5NSAi8zBwB5k8TG+jmmCMFXAIyQzlFFHK4XYn
         I8Za5z9hUO1v8vGaWNAFN9kYbf64ggjyO2dNKef0aRsoOeis1O4fQB3JGKM2ldmLTniW
         BEVsiUKvBO3PM85q/Hj7eyKKezHnXzsNw9v4U8XAZJL/MfPx4QSE46TGPDQCwEb0rRjE
         Zqmw==
X-Forwarded-Encrypted: i=1; AFNElJ8QZOfg6hG09YE31UHl1TMm26a5NXDGKDUPWpu9eF+pGyy/jK9gzSHT6spLSLdlIEbgRdwz7S00l6vky4Aua17+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+nJfAGbsz9Q9Oye3DflO/dVnJlvMjeqTKObA6zED62g+FiVtp
	tJDEoVlnyvpMYS/VbxIbtKl4cJYEijXS/pNI85Hdx386LcZW/5/tAfFP
X-Gm-Gg: Acq92OH5yK3odt4lCR478q5E7RRXBnbqWOnN9IT39sikkUHy++leEhKCW1vst+yhW8F
	Z1uCieK+jgvFbnj24e4pry3IXiYsDbiHroTgjtVR6whcC62dY2MRUBM+/d4rq7U04LQZXlfNTJ1
	UWAXHEx4P4iYlf5Yf0Y/5SgQL4vCSCt5WzAzrnVYRoJRnXUICrWxUidCMCnvQK978GtTFFjyrLf
	ky/QREwdn+y9doTzDOkHn//P1jNdFjVEuvcDGW7MSClWbVHVXcn7rz8p2qw4frW8Uuc7te6lvwb
	R+zzTNSe2IRj1FI/k6PHZB7eHcuTIKN6rt0pObPUJwmvQ7ljq52D42sY65mTTAsIblaz9N1/1zD
	iio6QY+mjPP4zc5UnKEo20TMqiMjiDHuVePDaqDTCcVMyQf9KB4XNNim1AJ9HE01gyPpf44FS+z
	XUueN3i2NNmNdeEBe6poJmQzUgM2gz+6i0DEfK8qWoApbHdAUWV350ZOnA/n1CIqYW1ZhOu1sC9
	Mig4ZSpVOMOU/j01QDoi76kRG7pMHEY0dLZ6ITFTozxqqyOl0UjkQ==
X-Received: by 2002:a17:90a:c88e:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-37132b9aaebmr15941311a91.14.1780998761313;
        Tue, 09 Jun 2026 02:52:41 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3713346cd9fsm13185172a91.2.2026.06.09.02.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:52:40 -0700 (PDT)
From: geoffrey <geoffreyhe2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 1/2] soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
Date: Tue,  9 Jun 2026 19:52:23 +1000
Message-ID: <20260609095224.1706036-2-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609095224.1706036-1-geoffreyhe2@gmail.com>
References: <20260609095224.1706036-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_025243_008503_9298B268 
X-CRM114-Status: GOOD (  14.29  )
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

From: Weigang He <geoffreyhe2@gmail.com>

exynos_get_pmu_regmap() obtains a device_node via of_find_matching_node()
and passes it to exynos_get_pmu_regmap_by_phandle(np, NULL). With
propname == NULL the callee uses np directly and only drops a reference
when propname is set, so the reference taken by of_find_matching_node()
is leaked on every call -- including on each -EPROBE_DEFER retry of the
only in-tree caller, exynos_retention_init() in the Exynos pinctrl
driver.

Drop the reference in the function that acquired it.

Found by static analysis tool CodeQL.

Fixes: 76640b84bd7a ("soc: samsung: pmu: Provide global function to get PMU regmap")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/soc/samsung/exynos-pmu.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179b..a5da2741852b4 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -167,11 +167,17 @@ static const struct mfd_cell exynos_pmu_devs[] = {
  */
 struct regmap *exynos_get_pmu_regmap(void)
 {
-	struct device_node *np = of_find_matching_node(NULL,
-						      exynos_pmu_of_device_ids);
-	if (np)
-		return exynos_get_pmu_regmap_by_phandle(np, NULL);
-	return ERR_PTR(-ENODEV);
+	struct device_node *np;
+	struct regmap *regmap;
+
+	np = of_find_matching_node(NULL, exynos_pmu_of_device_ids);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	regmap = exynos_get_pmu_regmap_by_phandle(np, NULL);
+	of_node_put(np);
+
+	return regmap;
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 
-- 
2.43.0


