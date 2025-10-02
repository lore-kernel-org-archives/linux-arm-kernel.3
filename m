Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3243CCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63qg0d8m1ZxWOzlA/0Gwqg93V/NGeUpYpl/r93eUFdc=; b=UXNpCaIyiBMmTanZvDUIsplW5/
	4jDAzlTCBZk69/r/Hxv/JZyV/bzFGVtTigIxmsotS5rrUlN15BiSCpyk0Kl5EzkBSWv9vuVUruC3p
	PYIBNOBXQfv+MK21FcmVoRL1Q1gEFvKyzeiDMTX7sZvAbJH/BAjpb+HhwIEew0s+cp9MzyJlaMIzr
	+bT0uLnBBPgWZS1OH1OcOwp1ZghSEFN7GetGMNFKvQ96O+t1/e0BWTyEgqNdy5cUjwzrvUv6Br4ck
	KMLOIE9sJJXlFBWU3LKfcvRy8+jzb/oR5VNH7/tDsMNFl139G22NTq60r06dEMMSRj3kL9wwzNPRc
	6TzQZ60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GcS-0000000AGhi-1Hn3;
	Thu, 02 Oct 2025 10:33:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GcP-0000000AGft-3jvK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:33:03 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b472842981fso126520166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759401180; x=1760005980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63qg0d8m1ZxWOzlA/0Gwqg93V/NGeUpYpl/r93eUFdc=;
        b=w3mKTVOgppA4AcZXaUTvCRQ5xyU2zJAl3mPuWANmYChlyOkAFIh/03taGxZbCUwpru
         BXRs7GSLTvnDvLPCyxVIRBVdVsimMnXuaEany5HSrICAxMDxsDlCyfnAm1jADfaCaKgf
         sihIAUgBBd4orgMfUyoKwNJEtMsrvVFyoWFrjS/8iTZJA7xF30J3BDk1hC00s9r4kqY9
         jOuS83BnNk70faUrfvfRxopDM9ItM7ncnRai6gO5cnuGE2HJSOvzsc1jOTYGfnNWF4fm
         phzRmB7NLGRBfVZJrMm+3k10pAsHPaqqT/C/yAgt6jrfcfVKuTcRIYBmfTpeLunO/Lfv
         7DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759401180; x=1760005980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63qg0d8m1ZxWOzlA/0Gwqg93V/NGeUpYpl/r93eUFdc=;
        b=iJVf6jqSGYCcFgaW417WjuhSoTNliAvK8Y9ewva1jCVFXF1tY16MQ0ESS2nA5kItgu
         cWZx18Q/20ijvWSa1TaKk64n9uUu0tPAYCgYjUUSs5QawyUnqNvDWro5FSqom4DWh/xp
         CD8eaDq7izHUYci04YDnGxXMg0zgfcEppmn/eErPsRxbgGbo7KTp3pBhSQI6QTS+Vwbh
         ttb1e0kogmWsOBkOGP1a5incESmANachIryOr0Whbyru+ed3GyHLxrBzdmYdKnWO62QD
         UvNma998fltRNWBT758uE6YXp0rP7MIQ2heKkeEzsn3sgZHsXN/57MXtNCqvymGEVyj9
         iKdw==
X-Forwarded-Encrypted: i=1; AJvYcCVA8ddde2/TKwAVyvGKo+8h2sNbWFD2ve2Cjn6aA5yEF5n5VXoFpaxvjjJaW72/zXDgf+NHtY2cessmM4wfl8k7@lists.infradead.org
X-Gm-Message-State: AOJu0YxxcXhCHAZo0tLrpgMfRx//o6CYmvzAct0AOQAIAD8I/SJWJiVk
	Lxx5oiHrR5ynKnasHHvDA0dnX+bCOPxETd2+nqhIbd1J/QuZ8zQ8UQ1IpH+7YcXRzbg=
X-Gm-Gg: ASbGncvg2OhD9wZPYBWJYcReL3jgSkegZYXkX3kzkVlh9ahNrjtyF6rX+E3qz+D1zvx
	1c0MSkCy+Ljsz6h45/mZuNrnudaZdkw/3uN5Zkb3CHSTdZrfD7jTSq/DVgLRGrRjO6gbpLvwrhR
	Xd+WsQL3dpeagDjtHg8jW2hDvl/ycm7ggVu0938D/X62As2K1IAJPMo/6Lmgb34lP/PTipyZfqs
	DtiE/dfn84fhWbOnXNrrdCWqf8y+jlgsyrddgFNmn8HN7e+6NaY6hyhATAbRwgp41Sx0pZS7oQ6
	esYWqFVTKyo+8YiRTC65KL8M65RU5MiYeX50371+a/Kimh2Qw+f7umgEni/+8hXKAuFcd7RngTZ
	7X0DUQNw3q8H32kGMZHh7qmvubr6c9T6GA1rZ6RlFvf6JOdpxQVBYEr2jbqqkYDYpCtvlrKevQf
	DvSZaEMv1thxRoQfYaSfpTgwiJqK8PNE+CqajUKgtC
X-Google-Smtp-Source: AGHT+IGxZCBahQVltdFOGvGloTZFkP3rum3vuta/+ZCokqpuSClzu28tF6ot9TrYBaOgogmM+n5Dvw==
X-Received: by 2002:a17:907:9446:b0:b04:3e43:eccc with SMTP id a640c23a62f3a-b46e632d6a2mr846196166b.40.1759401180048;
        Thu, 02 Oct 2025 03:33:00 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4871167172sm170262566b.65.2025.10.02.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:32:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 02 Oct 2025 11:32:57 +0100
Subject: [PATCH 1/3] soc: samsung: exynos-pmu: allow specifying read &
 write access tables for secure regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251002-gs101-pmu-regmap-tables-v1-1-1f96f0920eb3@linaro.org>
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
In-Reply-To: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_033301_944674_E48A9D0F 
X-CRM114-Status: GOOD (  14.77  )
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

Accessing non-existent PMU registers causes an SError, halting the
system.

regmap can help us with that by allowing to pass the list of valid
registers as part of the config during creation. When this driver
creates a new regmap itself rather than relying on
syscon_node_to_regmap(), it's therefore easily possible to hook in
custom access tables for valid read and write registers.

Specifying access tables avoids SErrors for invalid registers and
instead the regmap core can just return an error. Outside drivers, this
is also helpful when using debugfs to access the regmap.

Make it possible for drivers to specify read and write tables to be
used on creation of the secure regmap.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 3 +++
 drivers/soc/samsung/exynos-pmu.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 22c50ca2aa79bf1945255ee6cc7443d7309b2573..9f416de03610b1727d8cc77616e5c87e2525cc69 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -635,6 +635,9 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 		pmu_regmcfg = regmap_smccfg;
 		pmu_regmcfg.max_register = resource_size(res) -
 					   pmu_regmcfg.reg_stride;
+		pmu_regmcfg.wr_table = pmu_context->pmu_data->wr_table;
+		pmu_regmcfg.rd_table = pmu_context->pmu_data->rd_table;
+
 		/* Need physical address for SMC call */
 		regmap = devm_regmap_init(dev, NULL,
 					  (void *)(uintptr_t)res->start,
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 0938bb4fe15f439e2d8bddeec51b6077e79a7e84..113149ed32c88a09b075be82050c26970e4c0620 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -27,6 +27,10 @@ struct exynos_pmu_data {
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
 	void (*powerdown_conf_extra)(enum sys_powerdown);
+
+	/* for the pmu_secure case */
+	const struct regmap_access_table *rd_table;
+	const struct regmap_access_table *wr_table;
 };
 
 extern void __iomem *pmu_base_addr;

-- 
2.51.0.618.g983fd99d29-goog


