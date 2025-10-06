Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DDDCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WkKVU8kwH4FiIJkp0DFrv47tH1tikibDwgyehQFExE=; b=nHQN4U+AoXZnVDo+x5kbO0w3Pe
	9Vzhike0cYOVjeAZ6pYsXtAcIkeuUeZL+VtN1lE6HOnpi83tcela72yld4zEvLHrc/XYeAbtYmkra
	vVDcfXtqbOlRo+mVr+D5yc77+hSf54bfbQSmfO2lymV1fp+fjbBQLqJwACfNksY4cDdWezVd+shkt
	34NkV+TALxQFtYiihM3MGmqFGZ+++7I0Mh9OpHyBpwWNzvvXui6q5BxM3vZrJc74V/lTlkB/MCm0Z
	a0S6uieWWW9/tp3Qwd33ofYSb2my7dREDEsB/9Gvhdx8/LtY0dYZXzaNuzxweFoykEbciTp4Kpk7g
	VCGSD5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJF-00000000QWI-1jve;
	Mon, 06 Oct 2025 16:43:37 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJB-00000000QSR-09SC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:34 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so8038813a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769011; x=1760373811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WkKVU8kwH4FiIJkp0DFrv47tH1tikibDwgyehQFExE=;
        b=UY6WXUbxaWmB8VezlyoekO+G18XZ4hpB3/b8W5Pl/P2ncMlUlZazaobtRnkmXwtbht
         cdpKWrlFjyiEJ9ae+pXEIyS8ySTBdld4wtU/Aiy99JUz6k+Owf6GUfW7FZXzK7JJ5iui
         g87HW+0hL7fKRB2VYPaNKF3Idr7D1/O6dkiE0Erdx6FvNfRFwSWB8tQsL43qqcZvNVaW
         a7kjGVTiY9HjX7ewSlWoQv+BI+36W+iXVpBfFY42N99djLBlyBE2OGmBLaUdOhL/EKSI
         SciC/MRiACZNdh0dB4S/G+QttTgZArtoLoDc5Pl+u/T62+pGfKasMbD2wW9kBwTG/ISf
         asbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769011; x=1760373811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WkKVU8kwH4FiIJkp0DFrv47tH1tikibDwgyehQFExE=;
        b=rQmJ9zf9O7lEEduXuDulofYc4xX2Bk3i2yL1WLsshBROCveS0g8kak74v6SDcbtOFJ
         OKz3QUYnO6nO7AOgX8SPeiVDX0KfdQGudM3t+19ozq9mv5fn6omukLYrNWqcbm8OXoXy
         f7Ns9XoruqnfaNfTahdurdkFir18dZg+LPbSgRVki50Bz9gzZQnKzgCrynG0NpgVRX4v
         X28JLEGkT7cs0P0oRsKpCFiBpljhBCsIH77jB6t/vBQzmplVtdQLR14gTFgGs4eNyrc7
         6Y/qX4e35Zs+qBBzjqe1msGCpV5JGSRXatsXt+w5N+D9o5uIiOdKh5jERNrumWNBgE6d
         DL4g==
X-Forwarded-Encrypted: i=1; AJvYcCWDoJHuZNe2iGQ2kUDTaEGFnNRK8uxvqy+dPEfhSaWxy0PakbjMbkCy0SShqE9Gcv4CyrnbEO0UEm3eW5iuRIFz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu6BLMEAh72fQdcXC76MVtG357oFs841WCofYqd3IhXebLjWXi
	i0uaBYaUW8vfEIihlQR6vIiHQXzeqm8NfjZkpoHOAePPSOrOrinEtqhs7Y8pNkt3v/Q=
X-Gm-Gg: ASbGnct1u1qE4zeKkAN/CqYFrTxsLTau4Jmee9NjBuw2PTpvwXTQfF05N/YQJilUDtR
	4wtpuLabeBp5cbX29xEMlIxObcdB9AsrmDfawjTr3NeFA7Khw5N0Uq1WL3RZ219phTo+UYqRNv8
	TWq/ja1/twq+a1GWDcU2LqXTK0Gt7vieiqcssy20+pPtaBNbX2ZlNH3pW29m+Ki0h8x/9ELi90N
	n5MBJ5WSI+RcFOkkcIZV+rhzTfggIMhesqoNF1B3V3+m2R8lVSBPMPzQefgk6NBS7CLLVgCuWAF
	H8iK26WrAFfl31Is+2dCcn46i+awWeaJaC5FpOY+Hi0dByr7S/5+Vg37m+Vr9o7C+BAobYiY8Km
	gD+038Q1xniH9DxoRUyZs/2LbNgj1luTk/yMx03wgXw+2rjXQKLLW4NjYYilfKTzdiz8knvhxrJ
	nOzovihPJvsbAyDufalIPQuDqyCZN/b6HzvkKbjHmIO2/im1J/8LY=
X-Google-Smtp-Source: AGHT+IEG8W4Fgu15EAWixutgpzICMiJaZUNK8COlNrHcpfllaPfZ5W35myiVDFya7fewpU3c0gC6vw==
X-Received: by 2002:a17:907:2da6:b0:b2b:59b5:ae38 with SMTP id a640c23a62f3a-b49c2761ad2mr1799899866b.40.1759769010845;
        Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:31 +0100
Subject: [PATCH 05/10] pmdomain: samsung: convert to
 regmap_read_poll_timeout()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-5-f0cb0c01ea7b@linaro.org>
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
X-CRM114-CacheID: sfid-20251006_094333_091655_6917D30D 
X-CRM114-Status: GOOD (  12.25  )
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

Replace the open-coded PD status polling with
regmap_read_poll_timeout(). This change simplifies the code without
altering functionality.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 29 ++++++++--------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 383126245811cb8e4dbae3b99ced3f06d3093f35..431548ad9a7e40c0a77ac6672081b600c90ddd4e 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
-#include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -35,7 +34,8 @@ struct exynos_pm_domain {
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
-	u32 timeout, pwr;
+	unsigned int val;
+	u32 pwr;
 	int err;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
@@ -45,25 +45,12 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	if (err)
 		return err;
 
-	/* Wait max 1ms */
-	timeout = 10;
-	while (timeout-- > 0) {
-		unsigned int val;
-
-		err = regmap_read(pd->regmap, 0x4, &val);
-		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
-			cpu_relax();
-			usleep_range(80, 100);
-			continue;
-		}
-
-		return 0;
-	}
-
-	if (!err)
-		err = -ETIMEDOUT;
-	pr_err("Power domain %s %sable failed: %d\n", domain->name,
-	       power_on ? "en" : "dis", err);
+	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
+				       (val & pd->local_pwr_cfg) == pwr,
+				       100, 1 * USEC_PER_MSEC);
+	if (err)
+		pr_err("Power domain %s %sable failed: %d (%#.2x)\n",
+		       domain->name, power_on ? "en" : "dis", err, val);
 
 	return err;
 }

-- 
2.51.0.618.g983fd99d29-goog


