Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B66CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnZwMqT5Z3k14agLqjdrnk3P1X+gmQLWShTQkVnycRg=; b=mp5K4qSg2EOT2JRE7TVHPxaWq3
	9tZvCFRjWgrTkzbhzqQAIrBp84SRT5QURYMw2d46COQMqGVH0AZGWhNad8n14/01uOHMxJXN5HacA
	FK7X6k0XrYbI0hINuA+0DLcqXzyZuWK03VWhY5zomMU/1Q6GwBtnINOe73G7j/ymiEe09f5vfQr/S
	tKdIELfRwrqWoIcbJ82lSh4I//P2Ou862ryNXRDgLzs9SXan+OJfo9WX8/PWPe1lBWN5kd6QfBUAd
	HD1gCfCaNab/M4LyCYOmmVhDz+1zndXCKDoFKtQLf7ddEyWK4Ta6aWwLvyh/4BGv4k0e07fXop6TK
	S+f/fhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mzk-00000005f9d-3nfF;
	Thu, 09 Oct 2025 09:31:32 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mzj-00000005f8C-126W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:31:32 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b463f986f80so160942266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760002289; x=1760607089; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnZwMqT5Z3k14agLqjdrnk3P1X+gmQLWShTQkVnycRg=;
        b=gl6/DFexg05cVDKLJesdv7RTnyiRWdI8uuU350BIpI6FU6gCOBlbHsDds6+7BL7v7w
         pgFJMMiKA9QsYLzEbBKRaXNIH++bo9lFeIeFOX90cUi+RFB1qg0E+/VDKHIcDbD8gRP9
         B4PeacFVj2Mz42CnDMmokaYQGuV9NK6aV8bTSb5PhSBlpq3sSIM4L+mu8HoA/ctHRZEo
         DDz24CmsGlr90OIb91CWBCGwyMqIHtoQJQTm0xkdxpmr3AjEJUZVcIpaa7mcZhYCXrVB
         vWhTBo1emrQL+CX6aaEenAB0EwkvPIUb2HvPoCU5eDhXYWZXusPAmAMNQFWN8xeAlgO2
         RX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002289; x=1760607089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnZwMqT5Z3k14agLqjdrnk3P1X+gmQLWShTQkVnycRg=;
        b=ikyqfgeTCutt+DqgFrfChUkLRERiX2cBBlip6L6Y09s1vsDmzUSUKbIPFC9vwgFZuZ
         w/jm/gFJJcbByYcqccrvw8RmJcs7rjmGyZDjjTxLL87xFJr9xgoN/lHY3KcsCGJHV1JW
         Pn3a8QYwTv4c8RItiiR8HDYbIjfEThlJSP1CHZD5KYKjaRwybGKfdO0ODoih7BSwX16p
         PbEJTiQuNBVA24zmHd34Pqzk92RE9ZOsCX8RdTboPd1oC6+2X0exOjUu1fh2KsZ+7auy
         omGyYu16S/gKV514evyGc6Q74v4Wyp32g7h3LSzxN2ijDHPNZuRYvXpA9odXLPSbInt3
         FTYg==
X-Forwarded-Encrypted: i=1; AJvYcCUqn1ekK60xBwifoZucpRJ7bBrjeAGysCh7rrndmHIMIfgq6kQl5morqhZNWO7Db+2L9vB5k/B+SlOCv/jRB1Jq@lists.infradead.org
X-Gm-Message-State: AOJu0YzReTWXwA+ip6mbrZ1TBi+Q7ynWwXJEbSabOSFxY9wcA1NGxhoD
	GeE/wvK5OaJ2dzm+u72cM6vz2taqAwnf5eMadnTFFRzCYrNS6ZGrXhphNwadIhnv2eA=
X-Gm-Gg: ASbGncu2kWYTG4QnvAvXZqK6yfxXqZYKEa1lSQ83f9xBfsWNY6khOyO3RtQ94YCQOS5
	uo5I/FQE+P6ARWWzQiKYXPt+73zvqOIXjdUoViwD5Ve3alRcbr1FzNv33BnffLYYI+KK6j6gzXq
	OmylaoCMKoi8F/2rvLiR8G5dH5fHwdcPoV2LL4j2PW8JOPM67O+rL/ROIekK+sn5g17mRf4tLLo
	CVV2sKWPqwuDx2u84Hi5jpMCCN/uryNUY+TmrTGJveYFPuD3UtcswHfd4l6kwAQnu5y8RNZ7Z/P
	PZ9/gb+5X5pMzUhWPUDt8xkR+ONgLbrDYw4k8aB6WIM/ye2Qia4HbnlcnpCDFYOolOobMKPNw+T
	7PjEkmpF1wEZ6KXgV08m3leKp8ZoDXZ/sbMUqDcsXzg1wB6OSIdc2u4vxktIGISjc2fblVMOKAk
	nUz2QOsm5Cr1kAz7DYRyc6rcz8/eZ10/oxk/pI78t1
X-Google-Smtp-Source: AGHT+IHA+lPS2DUQCATgDgIURdRFlX3C6OKochIcH8ifOEzHHA6ifhQXJjqURM+gkgnfCzyEiDrXWQ==
X-Received: by 2002:a17:907:94d0:b0:b04:7232:3e97 with SMTP id a640c23a62f3a-b50aa3921edmr743792266b.21.1760002289304;
        Thu, 09 Oct 2025 02:31:29 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a41sm1855670766b.87.2025.10.09.02.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:31:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 10:31:25 +0100
Subject: [PATCH v2 1/3] soc: samsung: exynos-pmu: allow specifying read &
 write access tables for secure regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pmu-regmap-tables-v2-1-2d64f5261952@linaro.org>
References: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
In-Reply-To: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_023131_311004_F36FC4E6 
X-CRM114-Status: GOOD (  18.64  )
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
used on creation of the secure regmap by adding respective fields to
struct exynos_pmu_data. Also add kerneldoc to same struct while
updating it.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
* add regmap_access_table forward declaration (Sam)
* add kerneldoc for struct exynos_pmu_data (Sam)

The regmap_access_table forward declaration declaration triggers a
checkpatch warning: 'struct regmap_access_table should normally be
const'. In this case, it's just a forware declaration and the warning
can be ignored.
---
 drivers/soc/samsung/exynos-pmu.c |  3 +++
 drivers/soc/samsung/exynos-pmu.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

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
index 0938bb4fe15f439e2d8bddeec51b6077e79a7e84..1658a55fe61c6fe70cc4cb0fcdcea2756096a268 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -13,11 +13,38 @@
 
 #define PMU_TABLE_END	(-1U)
 
+struct regmap_access_table;
+
 struct exynos_pmu_conf {
 	unsigned int offset;
 	u8 val[NUM_SYS_POWERDOWN];
 };
 
+/**
+ * struct exynos_pmu_data - of_device_id (match) data
+ *
+ * @pmu_config: Optional table detailing register writes for target system
+ *              states: SYS_AFTR, SYS_LPA, SYS_SLEEP.
+ * @pmu_config_extra: Optional secondary table detailing additional register
+ *                    writes for target system states: SYS_AFTR, SYS_LPA,
+ *                    SYS_SLEEP.
+ * @pmu_secure: Whether or not PMU register writes need to be done via SMC call.
+ * @pmu_cpuhp: Whether or not extra handling is required for CPU hotplug and
+ *             CPUidle outside of standard PSCI calls, due to non-compliant
+ *             firmware.
+ * @pmu_init: Optional init function.
+ * @powerdown_conf: Optional callback before entering target system states:
+ *                  SYS_AFTR, SYS_LPA, SYS_SLEEP. This will be invoked before
+ *                  the registers from @pmu_config are written.
+ * @powerdown_conf_extra: Optional secondary callback before entering
+ *                        target system states: SYS_AFTR, SYS_LPA, SYS_SLEEP.
+ *                        This will be invoked after @pmu_config registers have
+ *                        been written.
+ * @rd_table: A table of readable register ranges in case a custom regmap is
+ *            used (i.e. when @pmu_secure is @true).
+ * @wr_table: A table of writable register ranges in case a custom regmap is
+ *            used (i.e. when @pmu_secure is @true).
+ */
 struct exynos_pmu_data {
 	const struct exynos_pmu_conf *pmu_config;
 	const struct exynos_pmu_conf *pmu_config_extra;
@@ -27,6 +54,9 @@ struct exynos_pmu_data {
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
 	void (*powerdown_conf_extra)(enum sys_powerdown);
+
+	const struct regmap_access_table *rd_table;
+	const struct regmap_access_table *wr_table;
 };
 
 extern void __iomem *pmu_base_addr;

-- 
2.51.0.710.ga91ca5db03-goog


