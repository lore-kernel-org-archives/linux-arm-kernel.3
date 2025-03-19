Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514F6C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvO2MTCEp0zB1O4o3Tqb0ypgsyFb3UygQBlr47/GWsw=; b=2sWJfALeTk2Hdaa+FcFSaVBHC1
	wUJJEHEo9zl5cguB50ofIoCyAxoAPOe8aJqMxuSl8bwfVjCMWbN94Yginv/Tv0kB923Xc7W8rs3fc
	QW2u4OOH9pTCQcP+mLB1aRqmrfAgGbVdWM4Z8Sv6R2lDpg7YXJG8H/+1fSFu0E1xellLxzdCGfzKx
	i+eLt5qoUYsbt1Gd5uXCYpmeGfHn2ZUa+Wn939+JwM3TBO35U30+Kg5rmRfgUkvt5fzONRIkYxmq5
	2WniiVNdqcz7O1P0Fqjdr7laemZ1/LAQsmtlHWNV25RKGGzNr5GAPm/S0c1hCk4UmgmJiG2fGlDbs
	f7Yx04fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvTz-00000009PSx-01cn;
	Wed, 19 Mar 2025 15:37:27 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvNK-00000009O0T-3pUb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 15:30:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so28326265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398233; x=1743003033; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvO2MTCEp0zB1O4o3Tqb0ypgsyFb3UygQBlr47/GWsw=;
        b=P5Gr/2aQAce+dB5IJusz84KmgQpO4Vt3IjtMjX5WI3ryn7ek8Ygtg1qTJ/vEHwJ/G7
         Xet3DK/EQIrXryInH/XkxHE8X4NL+rrcJk/krDs8nkAlTYObCQmzpx+xezxkM/hjwtx7
         bCBrk1NSppr9QUL4yqZMfAANZ3Eh5JgT/pIebLS9FhcaD3vw6PaG5PNS0wZysFocZHbB
         DTzhQnQ9inMlHR1r3Pn2oTatuVwEBQDtos/55k72gNqdsuzLF5e2U/oTDJUkXkb0Ogvf
         RDALTdHUUbFo3vDfxFiSHmxCmjKbTreYjjdM5GglQz5DGfs+lBx94G4w/SVOudA/IH9j
         5hTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398233; x=1743003033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvO2MTCEp0zB1O4o3Tqb0ypgsyFb3UygQBlr47/GWsw=;
        b=U02GviKCp1D5gMkLmvE462TG91nFhUZ9J37IhD/2f1c/b5QsUwhjChL/zcxrJ4wrdm
         X8oY+bpUol/sRG8YcBFt0cEwC2DoCyFCElJDgh2rUKVo34GLvINnhhxd7sTgzZPiad53
         P2RcvxoznC0S/8RmeZm9RnWZ7PzshC0u//sGmEkK5I6771Z0ulu4F8c3z8GYGIWFhbZI
         nw03CUmLn7szOA4EAG+qd6QXlkkIL9Kl4odJAATHImcfZCdeo/bxbiwkpX6JVE/4zPbx
         SFr6VNBmTFNOWiTvZIvxvCmrN9IO7MPL9wRNvsEA1dDPcrPO6xoq5VN32tkAp3zyaytO
         0U6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3nNUMR9OruNtwDeu7WozoDZyxZavhJ4l93b4YU14uW1pO3pFdhQFXYoWXnBiMUNaVuCaYnaDVi56B0b+XGj1t@lists.infradead.org
X-Gm-Message-State: AOJu0Yx98akmv4Q++Uvwez3SRcf0CXPs9kPeB7useHaeXBonRwfu9gQU
	1J4bhUxEfgPk82rHCpxu4/yJJrq4SsvdvJCm48bWAw/2n2U4SN84h1GuurYyXCU=
X-Gm-Gg: ASbGnctSV1Myww7V1WmASfzPrRKxGWjSXkXA6O86yidymwSMUGcpcwFQhtwkZeemk37
	LZ2QOzA+rXsXKMdw79lOFmLBJ4Bll4bzhjGx51kW1B/Z5Oa4EX968QnBEUttOBIOaE3KQYXFBlx
	us51TZ3htQlUSysr97vieoH+PCHDOJpVUPDeD8KO+tRq4HUELkZ5w7DwS6X/y+gG8eLbiMX9v12
	8JVvIxZWiBOarszZ+leP1GR0/rQX1wbR+6ZyCgnUcgJF4fMZJUc13ecqKjEyW9OB6HOups5MCm2
	/8hMz0Bm4W2cm7MVKITHZp7pCloLRWpeFJHYbq7dkd1/L3Eq+hdLDrhMublpu28MhrUUnnCNtxn
	T
X-Google-Smtp-Source: AGHT+IEck0zvlF4mA6c/4a1WmAWWk69t4E90tBTeEQDggA6Dvagy19sFXvzCIF2qVQD5IG+HaMrWDA==
X-Received: by 2002:a05:600c:4f86:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-43d4378b49bmr26833505e9.8.1742398233118;
        Wed, 19 Mar 2025 08:30:33 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:32 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Mar 2025 15:30:20 +0000
Subject: [PATCH v2 3/7] scsi: ufs: exynos: disable iocc if dma-coherent
 property isn't set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-3-96722cc2ba1b@linaro.org>
References: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
In-Reply-To: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Chanho Park <chanho61.park@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Biggers <ebiggers@kernel.org>, Bart Van Assche <bvanassche@acm.org>, 
 willmcvicker@google.com, kernel-team@android.com, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Jb70gmFrO795pq6l4lVz8akO7b7EaG1IPq1SXiJvoDo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn2uMQZjsaOtKjGo7lobraBsTsDeP+7mpJ30581
 SJ5trpIFZCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9rjEAAKCRDO6LjWAjRy
 ukYxEACIl1Ea5bUkcLZGzc6ZA0OO/h7+Se39yd6wIuAMUSpmswvUV3Qb0bAsYwxo3+GplmGD4NC
 GE0K+EJwXJuPeUC/bM5ws5vvl3Ju9VuaX1q4tdZQsTbxv+b6Zkh+Xecklhh0JbEe5a+M9cB0ck1
 kcSm4RaJv/yfB/lfK4pKQhEBXXnORI/uRSVOylkEJt5gQydTgTACqAfeAdtvjnkRortPSkWWouh
 16SPfnBNlmtgTfvG0oqjMupL1ahKe7xKGiCZiV1X3XMIiQpHO3/wAphY6NQXltTyPWK327QWomm
 /nlVikpDZgWmlV3R3bqfvMZYe4XLX1nYDy2gwi3Nt6mQUCLundOtLwLz6l1M+1T++1nZsaD7fD+
 5Vw7NKpj1PHyr5Yo4XT9B33Ee/qzk41FZYpKyAecvFYKOfL3/yXTk90uWYYSUJsL3E75OVNuhhf
 hneoGmsPvUdFJj5PULxpS41lQJoZX6Iy6vCHrD0dzYZ1LvJj/6MWlbpT9FMl4Gd1QdM6D+L/+VE
 xZgKHQ0B6p0p82l+KF4ix/ccLMRt9zCxMgSHLekM23BMkxVjNl6QBKV1J9+iZoZM8JyucNtpKNp
 wvMMpaHQI2jWkUPHCVJKfszB/96IMvpxk2DJk5m19jR8BRYl0hdfT4NtIC2kUY2/R1BTJmispT3
 F7l81PGxEltoqgw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_083034_956966_755B9C39 
X-CRM114-Status: GOOD (  15.30  )
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

If dma-coherent property isn't set then descriptors are non-cacheable
and the iocc shareability bits should be disabled. Without this UFS
can end up in an incompatible configuration and suffer from random
cache related stability issues.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Fixes: cc52e15397cc ("scsi: ufs: ufs-exynos: Support ExynosAuto v9 UFS")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Cc: Chanho Park <chanho61.park@samsung.com>
Cc: stable@vger.kernel.org
---
 drivers/ufs/host/ufs-exynos.c | 17 +++++++++++++----
 drivers/ufs/host/ufs-exynos.h |  3 ++-
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index f393d42a659f821225e67e3e5d323478456ca3af..61b03e493cc1ddba17179a9f22e5b59ece02458b 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -214,8 +214,8 @@ static int exynos_ufs_shareability(struct exynos_ufs *ufs)
 	/* IO Coherency setting */
 	if (ufs->sysreg) {
 		return regmap_update_bits(ufs->sysreg,
-					  ufs->shareability_reg_offset,
-					  ufs->iocc_mask, ufs->iocc_mask);
+					  ufs->iocc_offset,
+					  ufs->iocc_mask, ufs->iocc_val);
 	}
 
 	return 0;
@@ -1173,13 +1173,22 @@ static int exynos_ufs_parse_dt(struct device *dev, struct exynos_ufs *ufs)
 		ufs->sysreg = NULL;
 	else {
 		if (of_property_read_u32_index(np, "samsung,sysreg", 1,
-					       &ufs->shareability_reg_offset)) {
+					       &ufs->iocc_offset)) {
 			dev_warn(dev, "can't get an offset from sysreg. Set to default value\n");
-			ufs->shareability_reg_offset = UFS_SHAREABILITY_OFFSET;
+			ufs->iocc_offset = UFS_SHAREABILITY_OFFSET;
 		}
 	}
 
 	ufs->iocc_mask = ufs->drv_data->iocc_mask;
+	/*
+	 * no 'dma-coherent' property means the descriptors are
+	 * non-cacheable so iocc shareability should be disabled.
+	 */
+	if (of_dma_is_coherent(dev->of_node))
+		ufs->iocc_val = ufs->iocc_mask;
+	else
+		ufs->iocc_val = 0;
+
 	ufs->pclk_avail_min = PCLK_AVAIL_MIN;
 	ufs->pclk_avail_max = PCLK_AVAIL_MAX;
 
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index 17696b3768debd641188b5089585b6d303de7451..a345809af79dc528ad518d3572fe8be034341ee0 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -231,8 +231,9 @@ struct exynos_ufs {
 	ktime_t entry_hibern8_t;
 	const struct exynos_ufs_drv_data *drv_data;
 	struct regmap *sysreg;
-	u32 shareability_reg_offset;
+	u32 iocc_offset;
 	u32 iocc_mask;
+	u32 iocc_val;
 
 	u32 opts;
 #define EXYNOS_UFS_OPT_HAS_APB_CLK_CTRL		BIT(0)

-- 
2.49.0.rc1.451.g8f38331e32-goog


