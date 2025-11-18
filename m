Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E06DCEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48JreFr5BaTMOPMEs2r/FtKXuXZRpdyc8fhVXjm2c3w=; b=0c7Q9Xr9c0aNHiQYfuyiqzCe5W
	srI8VYXyO3tYEBXd9OOnyPghfjAckrDp0U7Q8zTrnSNZA/OIDO+hOc6MgUrsLQ5FndQD7hyMcvizM
	6a0GFEqg9fSNmEtQ98kCRzl2xoVz7d6qMRzctGRYQQCOxN5fESGKXIrAs45iUEXkfBa8A9e/G2FD6
	S4Mofi6aAUPuEdZtpzbZEHlG/DpfUA9mmpP5jetzYXGQChNYhL8Ftb+RE82cALDkrN219VZ6TPcZd
	4tCHu2pIOd41gfn8HxAVJX50OR3J7eBx0LXwUWNcBB2a2mpS74Hs3uG9hrQVQvHNMGyP3f6CXJfdf
	3P5MTAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ7-00000000jUh-26MX;
	Tue, 18 Nov 2025 16:28:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ1-00000000jOq-2UHy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477549b3082so47144015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483297; x=1764088097; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48JreFr5BaTMOPMEs2r/FtKXuXZRpdyc8fhVXjm2c3w=;
        b=Ze695dNM/5RhJP3WsEr4RgZeZRbmvaRHNOnhI/ZZ4zkDb4vNeLKqt2KA6sQHaG3R+P
         IdITMzTtGEymGX0xFnwDouIAObSwd+XjTO7ovxbBDn/8GSYdTiI+DVuMetpx5X/FnJEo
         D+13C242Lx6QC80S0cExkkDS7qMdEWXMuKltP1//jFVFul+iXQybTrmH/r/caWPrfRZ4
         OuI+qig8AN+40AMcReBoOZNYbjjizYwMKmhuk13UQM0f3ATI8gE5SPSddnFz4t0nkqpW
         5sJNHKQxCGzDl12flBNIoFty0OR9WCFBUmEQHVRQg9cMmNfrp5OUDvnXsH0YiePMEVko
         ITeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483297; x=1764088097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=48JreFr5BaTMOPMEs2r/FtKXuXZRpdyc8fhVXjm2c3w=;
        b=FssVsCoCGaSX8iasO8fJLt1Lzuskjvr8gknrI2+keiKCIry5eqMN5CsmSsI6y3M2ow
         6OOyylQ6LlOyEMkyzaSuTeVlhs2IXaIC9/58S2fwyTIV5kjeo5rV214QIPBLePz0PG34
         OFqcn43dUY7pUvVFnV9bUclChICR0hyhfbftVvYji7EcL4ThDiqpFME30SQ7t1vviXNp
         2gYenY/DHMB1hQMI9sAsczANZC4TJbCFUSKPmBga0Wm52xV95u1fldfIqi60FHK98R18
         +GCqBvZ3QWKpRs3UoyY+2sydsDkjqPBai/GZNBgTq+77im7nvVR98T4dPDoLr2dLyZgv
         e/dw==
X-Forwarded-Encrypted: i=1; AJvYcCV/skebTcz+EIULg4WBMONjX3Hs47zdw5YOaslqVmPNvcwZvf72ZJYkQ0BB1T265Ekm7RVdFV1/4C8FsPmfLCrY@lists.infradead.org
X-Gm-Message-State: AOJu0YzNlqx+8gaNdXb7IoRb5qCWTaeoMfMHPBpVb3YVmlHVtbuJ3Bxl
	ykBNufIxxnZV6fR5yceLWTJnuPS6uDFXdLKT8oOoOJ7zSZmiZ0cb9lWTfeEjNBxi0G68cLWYhvK
	qwkAWlZ4=
X-Gm-Gg: ASbGncuylNr2x+uCmpKFsOqpywyR77ehahfi2izCWa34nGy28zQ27KQpdPJEGospgtj
	KyB0q1BWbDUqlCBt4t+FX1Hn9LFIm82lLnajefk8B7QAf+T8NTAkytxo6aZ8dIaTKsmMsUdy7FQ
	g8UOby1Puvy6VQc1t+DvTETSnYTdtfRS1uSQmCqdNymf47GQ75n2wBgEKyXGzALCDaEf8yn2h3F
	YCdxHCtuIvkauMWHPR23ajfoBH7o1RHiSlXdm/XFKUU7UB6UC1HedTjtXn8z80fuY4o2lgvajlp
	7ym3YBwS77KDOIzD1pzloJBwNFh0yBmsHpP7ZcoSiZdB5+4r7DKWYzPy5aSIocgQOP4pykbTasW
	st6X6VoQl4aVqjGjz4dgszkvWcl9JrhAGq7hDgqo+w4w4qdxBc8+6KvgxQE3EXzF9g0cJkMT1U0
	lIQppb5jif0oTfI3WxJHpxWGUTpjMbmsg=
X-Google-Smtp-Source: AGHT+IGSuixkn6OuYVtzSeJQdoPs5+G1QrCaXWxHvrng8vSHtjfxGmf2OhXIq27Lrw6E3F/PTbSNaQ==
X-Received: by 2002:a05:600c:1f91:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-4778fe9aaadmr152880415e9.23.1763483297570;
        Tue, 18 Nov 2025 08:28:17 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:16 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:55 +0000
Subject: [PATCH v5 05/13] coresight: Define format attributes with
 GEN_PMU_FORMAT_ATTR()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-5-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
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
X-CRM114-CacheID: sfid-20251118_082819_669389_0B699574 
X-CRM114-Status: GOOD (  13.81  )
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
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++---------
 drivers/hwtracing/coresight/coresight-etm-perf.h | 31 ++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index faebd7822a77..28f1bfc4579f 100644
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
@@ -54,22 +55,21 @@ static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
  * The PMU formats were orignally for ETMv3.5/PTM's ETMCR 'config';
  * now take them as general formats and apply on all ETMs.
  */
-PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
-PMU_FORMAT_ATTR(cycacc,		"config:" __stringify(ETM_OPT_CYCACC));
+GEN_PMU_FORMAT_ATTR(branch_broadcast);
+GEN_PMU_FORMAT_ATTR(cycacc);
 /* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
-PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
+GEN_PMU_FORMAT_ATTR(contextid1);
 /* contextid2 enables tracing CONTEXTIDR_EL2 for ETMv4 */
-PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
-PMU_FORMAT_ATTR(timestamp,	"config:" __stringify(ETM_OPT_TS));
-PMU_FORMAT_ATTR(retstack,	"config:" __stringify(ETM_OPT_RETSTK));
+GEN_PMU_FORMAT_ATTR(contextid2);
+GEN_PMU_FORMAT_ATTR(timestamp);
+GEN_PMU_FORMAT_ATTR(retstack);
 /* preset - if sink ID is used as a configuration selector */
-PMU_FORMAT_ATTR(preset,		"config:0-3");
+GEN_PMU_FORMAT_ATTR(preset);
 /* Sink ID - same for all ETMs */
-PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
+GEN_PMU_FORMAT_ATTR(sinkid);
 /* config ID - set if a system configuration is selected */
-PMU_FORMAT_ATTR(configid,	"config2:32-63");
-PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
-
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


