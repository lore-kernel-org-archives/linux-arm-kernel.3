Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C408CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bES0slIYsqJ4nlNrDrdS0ePhgxZqsdotlF46CT03uqw=; b=Pqx6FEjTBvVKeDhUOIkLT3iUu1
	PuTFMSdw2yFttQMq5AftBeLlVLjkPtWgywiNChzyDsMo/7GFI0NhTvXECJaleTllu2k7MmDaRhq9q
	uuX2zzIaggETDzNSxGTsaS8TU4NZzBL7QXHOq49hOMmp0p5rrDabBFyu6MJTpu48vWrz04dpOLQXB
	KMd2OmtPwQWqk3otKW/C0MPmY/UyLZrXQ5u14wj4nuyhbLjbGtCfkcpmZ6FOwuwqWm++JdqWDm8BQ
	PHFNBs2MzrV9F7kWlFZLLRNr1v6HxomlagvwtY9pQ37K3/4Om3JttxPtetCmJCX3P5kH8mGQd5fJT
	RRU1FStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxbe-00000005ncQ-3EfH;
	Tue, 09 Jun 2026 14:39:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxba-00000005naV-3rdo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:39:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf125989f2so41435955ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781015942; x=1781620742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bES0slIYsqJ4nlNrDrdS0ePhgxZqsdotlF46CT03uqw=;
        b=VQpwlfodrWjszwgSFbybcW1a0h3l2fm6w3g4NI9C3g538LaH8I3C3m1/+9OMKbxBuZ
         7CyImEWu3ZCXoFvdhUL7wP8iaaeJymXQvl8MikvO9GL9e6QsWLIdSBCfqzkrU155TDA7
         qeaq2mxRvcnqWxq7/EVf0sKAFLx0+Sgovcj5nQqbJ5vwD7mIimk7qL4by7Uo0FeLZmxr
         LWU5OpZ7IIYbOzK2X58iFN9eU/492X55OrxENmdxA5HFsbdQyYDRgij9qNTxFCyFksi0
         +SvUmn3p+D1MwDXP60CdfEkh6Z4nf688Boc96EY4hvY8xIJn8dUZXhe5R7WSJuei1uGs
         1+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015942; x=1781620742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bES0slIYsqJ4nlNrDrdS0ePhgxZqsdotlF46CT03uqw=;
        b=BuKkKZHsTJA0SZr0PpSqvt2LwdczTv/GHR6Sp1rUyBY5UNASIUnpD8UVRTxyc13f28
         cch/3Dr+P/5za9Sd2nY/WJSRoMcFs7x+YwgSlD2QBgQmCvJ+jvc3EeCUj9+aVGTddaRs
         mU5cjAzv26qTlQVkB7ozC2yxZ+DcVvCvQrlwOdaNgeWwc9Km3AXV4R/9h3WaYEA+PAvX
         iTI1+wvZHQeejGpH+ovX4j0a0UhHhVU0AOAuUk94KThieTSv6yXy55gvFVKxXl6o/+du
         8ehozx9orr/kpf67ohiTI6eyiegQkFeXX1SQgaQflhKFfEqEaG8Qug7p1y/eo+8SVUU8
         aKXA==
X-Forwarded-Encrypted: i=1; AFNElJ/3DGIVPckIpCcrlgxd4d/A8Sezm3Mr8tnqeD8RFiVol1tHPvoq8O/y229EN1y1ycmzirGRfmq/3m36tHSCGNSc@lists.infradead.org
X-Gm-Message-State: AOJu0YyEfCo6fInqoiZUhze4XLBsacM3p6kuSzDHWTsD+jcIa2qf7yHu
	w3529wVDwafyvjyBN9IbqLL1TS3v8pXQbcO63Shu/1jAZYgjgOVKKi3e
X-Gm-Gg: Acq92OEEovF+4VWgMpFuU7bGuIoVQjBLhXo0d4ZC1bwaTpXkvvM18ecB1FVnbrLRvZx
	nXujDokS89ize+OLi7nSPMnG6Al5+t6uXdHO80nKI+fElvol+rZ4bupBk+7ORMBSMuvAOW9fI5j
	2YW0pGQQ/askSKRntiy685grEaZtbSkwVzOfoiyF0V/gT3UloUgp0ps+6dm3zwvOKG5+Ygs2gzA
	oTQCYdMCvNYEK9lvFGcfCwQ/7GyEOuGbP2Y5kviv5yVJ1eQc5t3gnjg+1vy6Ku065B7RR4Omkkk
	dGiVaV7Lzq+ZWX4uxCVzHDeKsSeCsfAK9TUNfIDmEyKRGrmORdOPqtLuxaAv2gd5Nj11ap5r8Gw
	9r/mFxnBA3ezwgqwL05M7Cz/WfsqQI4LzGqes7Q9sCj5x6caBs+1Aw9dLzatYTl+93LlO8OXlen
	ooT5KokNZDztJqg+rjWOHkClk6IFHsSeyJiKWOS3id523EQE0gDO+FFpnU31etg1e90b8xaA98M
	MzG3aiYknSPlu3TRNIzVCx6xo3BNOT8+R/aqSz7VWMwXcPZWzM5cA==
X-Received: by 2002:a17:903:2451:b0:2c0:3400:5c34 with SMTP id d9443c01a7336-2c1e78e03e8mr237284925ad.3.1781015941960;
        Tue, 09 Jun 2026 07:39:01 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm220741875ad.8.2026.06.09.07.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:39:01 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH v3] soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
Date: Wed, 10 Jun 2026 00:38:52 +1000
Message-ID: <20260609143852.1783558-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073902_960047_E0A49B9E 
X-CRM114-Status: GOOD (  13.80  )
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
Changes in v3:
 - Only annotate the np declaration with __free(device_node); leave the
   rest of the function body unchanged (Krzysztof Kozlowski).

Changes in v2:
 - Use the __free(device_node) cleanup attribute instead of an explicit
   of_node_put() and the helper refactor (Krzysztof Kozlowski); dropped
   the former patch 2/2.

v2: https://lore.kernel.org/linux-samsung-soc/20260609133320.1748882-1-geoffreyhe2@gmail.com/
v1: https://lore.kernel.org/linux-samsung-soc/20260609095224.1706036-2-geoffreyhe2@gmail.com>/

 drivers/soc/samsung/exynos-pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179b..f5fcdde9750e2 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -167,8 +167,8 @@ static const struct mfd_cell exynos_pmu_devs[] = {
  */
 struct regmap *exynos_get_pmu_regmap(void)
 {
-	struct device_node *np = of_find_matching_node(NULL,
-						      exynos_pmu_of_device_ids);
+	struct device_node *np __free(device_node) =
+		of_find_matching_node(NULL, exynos_pmu_of_device_ids);
 	if (np)
 		return exynos_get_pmu_regmap_by_phandle(np, NULL);
 	return ERR_PTR(-ENODEV);

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


