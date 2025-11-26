Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43754D10F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwy1SauvpBsKdoqKcjNK7vrv6yyN6VbL2cB6r1BLjkY=; b=qWEkZg2yAmlpLMbEftDebWEirJ
	oYnZr1FFuuCzwIP08LSybH16e6taJAGtb6ZfFyOsoM7Q53EIMhwMREQ7dtSMj6JVdrP/w+SElTATr
	MhXLNX/0kVt2fiF/UVu+bu1GSSZzslRffGKFiVCF0qwjnisVu1qnA7UsDklmvWnPxrm2hnPMNnWb6
	giRpsmokA7A8apNGRJ50LXs6wkf0spAhsAryFywQ8Vsa3S7qxrqM4OHtwDOOeljXlvR3X2wR/kQ9Q
	M6zpEY+Ew/F9wm+KYSWAKkGSukxyQCmmn2TTLiqzDEGJjWSPfpb9J65OTxF0UrP4dx+vEdMhy42iu
	qDAy7ooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDc-0000000Eqvc-41S6;
	Wed, 26 Nov 2025 10:57:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDY-0000000EqqJ-1pmw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47774d3536dso6023565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154666; x=1764759466; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwy1SauvpBsKdoqKcjNK7vrv6yyN6VbL2cB6r1BLjkY=;
        b=WdJlw8EdW6PK2BNQHmleqbZyArfFm0nPzG4e9qy+NwTAaXP4bhB++9mkjH0OcnWN1j
         OoFlgXDFXKx6+Sfhe77fUFKgPKsjMeH09c9u9IPfg5Q8ibab80nev3eKUytpPSot3YS1
         j4pUiMjly0tPgL3y23Hr17CT1sDsrPP9wIeq/gi6I1lEmAqcHcsTrJ4NcFElBU4zS5yx
         dQKbsABUXJbRfs3ws6q1bIXYdvV6SMkSIjabv0VGSq3vc3mqTnLuUqe+BaAwQrpF+g1t
         yxEfRUuiPgNzP4fSVsU99rY7QFu8xDChFj/cTtvAuqnFBLu136p9cTxrrE5NHvjYb+lz
         EaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154666; x=1764759466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iwy1SauvpBsKdoqKcjNK7vrv6yyN6VbL2cB6r1BLjkY=;
        b=KXxQf96xJS08fGWA0jXWkGHzgujmMckR637TxPa0XvPX+QcXuNQANEFL6hRPRcAl3b
         TqaCUm7Thjbq2xNpEAjlU+iqhA+fDM1wdc4SdEBwFsa0pdOZTiJC0YpmCDFLfUUT587c
         bJ7CEWt/kyjwBWX0EUJ7B+4fxN1rnVllv4aiF/nyKrZh36G1R6UXczBAdfK0V2YUmHMY
         f2QM2gI/q2YCAjOCFe43caezi8TAFcWYGYL7Bzo4IOtFk2n+G7amGqgLh7I3af5swGX7
         ta+YL0XW8ZwAut04LnpW2kAejanHqS92kG2wRZkKfYlf67773AgIA23rJ12wQsaS6exY
         q5DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVJWQiNZzxXm7Z1IKpw1iunvtQypLokWUk7RwkUDrHMkIh5aDl1krWJBFHyMFF8PsQ77bXuTr2Y2diL+nzSHRa@lists.infradead.org
X-Gm-Message-State: AOJu0YxapBuDlx7oZ8TfStuJF57iLR6F5jvsfxuvADCw2gB5PBf9cSg2
	l4lCHpc/8hvOqCHwYEAZlkShogttD4xsfcEy90QBC2DgbW2wJbv6Sgzbrfy6VBJlWh0=
X-Gm-Gg: ASbGncucHXqTBNLXKvTnFaLj2heJcmyGjEwXzjsbnxZPDKsvW3iOXJFCC/m5vgwLEB0
	tkewz0qx0KYE7StDytXdvmndTn0tD/k2b+TuRLQf3LQAcw0iY8M+uS3GlVvFJ2lJOsp5x6t5633
	FdIZ41S40Rt2qKWWjfxKflHUQ1uhfXRBQlSedw9WS8jaZBxYDDfnh3roUT6ibInL9PbPqpKkaK0
	vhc1rEFAMjqaXq6Rt5sIoskiJE19N6uCTXAW1Z21+i4AjoXpRmVqyNG63anqYPkWo3UyIvsHdrj
	T6LZbddDFbI+C6xqelUArYW4YG9WrVK3dxy2Ja/p/iJff2BiMhS1bV36t6rkh8J4WQIdHeHywO0
	0PIloj8qXw5E12zBIao5+ujY2yTckWLcyLd+xFeDlAH8wOPDMy/Mp3sLvlPdXGA3p/8LILLWtQj
	XVVSFj0MekBf1IdIYjJ0vd
X-Google-Smtp-Source: AGHT+IHtn8HMaA0Echf9v97EK95rBxusNCmaEB6z8oTn86z7AlsjYTu+w3WdhP9odmi/RB6ItLeU6Q==
X-Received: by 2002:a05:600c:c8a:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477c04cfb70mr212463515e9.6.1764154666538;
        Wed, 26 Nov 2025 02:57:46 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:46 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:34 +0000
Subject: [PATCH v7 05/13] coresight: Define format attributes with
 GEN_PMU_FORMAT_ATTR()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-5-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_025748_535417_15C5447A 
X-CRM114-Status: GOOD (  13.43  )
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

This allows us to define and consume them in a unified way in later
commits.

A lot of the existing code has open coded bit shifts or direct usage of
whole config values which is error prone and hides which bits are in use
and which are free.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 21 ++++++++--------
 drivers/hwtracing/coresight/coresight-etm-perf.h | 31 ++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 3805282b97e8..bf4b105e0f41 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 #include <linux/init.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/percpu-defs.h>
 #include <linux/slab.h>
 #include <linux/stringhash.h>
@@ -50,22 +51,22 @@ struct etm_ctxt {
 static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
 
-PMU_FORMAT_ATTR(cycacc,		"config:" __stringify(ETM_OPT_CYCACC));
-PMU_FORMAT_ATTR(timestamp,	"config:" __stringify(ETM_OPT_TS));
-PMU_FORMAT_ATTR(retstack,	"config:" __stringify(ETM_OPT_RETSTK));
-PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
+GEN_PMU_FORMAT_ATTR(cycacc);
+GEN_PMU_FORMAT_ATTR(timestamp);
+GEN_PMU_FORMAT_ATTR(retstack);
+GEN_PMU_FORMAT_ATTR(sinkid);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
-PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
+GEN_PMU_FORMAT_ATTR(branch_broadcast);
 /* contextid1 enables tracing CONTEXTIDR_EL1*/
-PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
+GEN_PMU_FORMAT_ATTR(contextid1);
 /* contextid2 enables tracing CONTEXTIDR_EL2*/
-PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
+GEN_PMU_FORMAT_ATTR(contextid2);
 /* preset - if sink ID is used as a configuration selector */
-PMU_FORMAT_ATTR(preset,		"config:0-3");
+GEN_PMU_FORMAT_ATTR(preset);
 /* config ID - set if a system configuration is selected */
-PMU_FORMAT_ATTR(configid,	"config2:32-63");
-PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
+GEN_PMU_FORMAT_ATTR(configid);
+GEN_PMU_FORMAT_ATTR(cc_threshold);
 
 /*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 5febbcdb8696..c794087a0e99 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -20,6 +20,37 @@ struct cscfg_config_desc;
  */
 #define ETM_ADDR_CMP_MAX	8
 
+#define ATTR_CFG_FLD_preset_CFG			config
+#define ATTR_CFG_FLD_preset_LO			0
+#define ATTR_CFG_FLD_preset_HI			3
+#define ATTR_CFG_FLD_branch_broadcast_CFG	config
+#define ATTR_CFG_FLD_branch_broadcast_LO	8
+#define ATTR_CFG_FLD_branch_broadcast_HI	8
+#define ATTR_CFG_FLD_cycacc_CFG			config
+#define ATTR_CFG_FLD_cycacc_LO			12
+#define ATTR_CFG_FLD_cycacc_HI			12
+#define ATTR_CFG_FLD_contextid1_CFG		config
+#define ATTR_CFG_FLD_contextid1_LO		14
+#define ATTR_CFG_FLD_contextid1_HI		14
+#define ATTR_CFG_FLD_contextid2_CFG		config
+#define ATTR_CFG_FLD_contextid2_LO		15
+#define ATTR_CFG_FLD_contextid2_HI		15
+#define ATTR_CFG_FLD_timestamp_CFG		config
+#define ATTR_CFG_FLD_timestamp_LO		28
+#define ATTR_CFG_FLD_timestamp_HI		28
+#define ATTR_CFG_FLD_retstack_CFG		config
+#define ATTR_CFG_FLD_retstack_LO		29
+#define ATTR_CFG_FLD_retstack_HI		29
+#define ATTR_CFG_FLD_sinkid_CFG			config2
+#define ATTR_CFG_FLD_sinkid_LO			0
+#define ATTR_CFG_FLD_sinkid_HI			31
+#define ATTR_CFG_FLD_configid_CFG		config2
+#define ATTR_CFG_FLD_configid_LO		32
+#define ATTR_CFG_FLD_configid_HI		63
+#define ATTR_CFG_FLD_cc_threshold_CFG		config3
+#define ATTR_CFG_FLD_cc_threshold_LO		0
+#define ATTR_CFG_FLD_cc_threshold_HI		11
+
 /**
  * struct etm_filter - single instruction range or start/stop configuration.
  * @start_addr:	The address to start tracing on.

-- 
2.34.1


