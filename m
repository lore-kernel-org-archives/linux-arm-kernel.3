Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AFBCD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oy/vEIMWCNxmvdfWxz9XMqAUZ1LIkGJ8bknBvSZDaPw=; b=mtCl008/yCTzHuehGIR54DEFY4
	DY5J0P9lLBMDISEuorvw/XgyByGMYsBZ8aZfmsCI6HZNPDPWLVtH/3EKENDOx1imRSMETCYZx7++W
	8E6bEQ43srLw/7F+O1nYcKDanOIWNeRk56Hsx8kvuopDXds/hl4WuYLbg9FfQLrkMiBa/VPdOKfTa
	UdQXBBNq17L0KgFC4s91Ez9jscmuwSUN5zXSKz4nH3vuhnr0BpnlGqwt23VcTNOYnEf/bdiPfxlgS
	HKXFg8B1flRbef0oUsO20Vycpu9iTYlbE+wh3mXB5XZjh2VYj2rFZesZ0UD6yr6fMHNKHhcwZBm/L
	mTC353GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgH-000000092Pq-3u3I;
	Wed, 12 Nov 2025 15:22:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg7-000000092H2-1jZm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:36 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-429c7869704so760290f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960953; x=1763565753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oy/vEIMWCNxmvdfWxz9XMqAUZ1LIkGJ8bknBvSZDaPw=;
        b=AOGu1HGVjONw/1vb/iHacmebLyQvxl2ynilI4LGKvSLknYxNxba/Qsd0ZafA1SojO1
         8SXL84kFsF753JKQvzxWeOLMg/L4Y3nYI32i17zthaAj9Nmi70YpsjjX6vxeUgPwc1ei
         4Zaf3WG4Hr2isATK2R6sGhm0x8ovFYtT5qgMK8AujWsOLOlFuUa1RlydQtK0AeVMeyNJ
         w41md3aCj20aWyT2Rh2LrY9ruDaBbXqrohc9ZzwG8vl8oWwg8s+JKaGhfFZfaCnl16gX
         oG8TMYNxgAqOeO8Az+liEIiAUK8m4r7phw0arMs6X/3h6TUAQmfTpr3XDn+7vbcNslfU
         NO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960953; x=1763565753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oy/vEIMWCNxmvdfWxz9XMqAUZ1LIkGJ8bknBvSZDaPw=;
        b=IEQJJXArgXT3KUzlGFA0qoEEDPr2a4Qus829bfU+f9Ym71C1zZlE8lfBP/QqGRtH+I
         32hD809l6fi9YVnFy3uNAJv8BDdz3fIg6isEdo2GKzdnx3SYVlplEbcmkuGmJ/anI8v7
         4Rrgt5bzfutMuJONnxDGuq6Qxnm+RjC7WH87xPIuNi1+jnA8+s1k3jPLfNo57sZN2WLT
         zlzF1fQXDF2PZ1dcKWh67EnJp4+2j6JJWnjrTBpFTy4WZ6Jz3ayFx6iO0HV9dTV/937M
         qtPIPpjWGjy0v3qd6wkurWw3IS0zki2xsyEDCDbo4wO7jVzMTSfVYBqNQTqzqi71Po8o
         Yczw==
X-Forwarded-Encrypted: i=1; AJvYcCV81dwFTz7nE/uCphF3KoleMnjnohXlcyz+d9aqg0wYXhQAcmGipRM5pbIsWTGQ/K3VDMkUX8A0s/DtVnrUSMwJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8CJAU3bIUEf5xNhoKJH2tj4yZlmcuwlnlOCrGX64MxCq4zvww
	oKvYJi+1nnC4mnCvMcoZDFu955Wk7yWDISHutguSXzqJ46LvwPcIiCluPq/xTUX+cTY=
X-Gm-Gg: ASbGnctO/8A4HdPJwwiodSx4uUD1R6ffRdeWFWSfJuA4b/MNZTuIo0Z4qciPXfV8nq/
	Xi4rG03fA61hc0ItwktE14mlM2WCCVL1+2QLHNslszEtfcegSAOXP1jCiVMNbQHy3f2KKt8A473
	epUSWZdY1ge/nmuPqpiFz19yEM5aJZ63fBSIVrEtzRJ3peYB87il807ec0s8xhXKYlPZUGEZaBc
	pkwqh60eACXt3MRirNqVnfChBvAiuupFQor+89f+JVbzG2vZ4VA3SGfDlirP+Du6hwq4MefPG+e
	g5j25LeOZJut62NuVHH3Y26r+ngKO/Oe5zvQQXmGCARpd8qp0DtgWaDJzCzR2kB/8wzjSU9jw2H
	v0CigsddIzk6pAYNOZLMMj1PrfzptOpymoi2+fiY0D26NQWTb09NkD6wPDVkJjL1V221kW4Gqh4
	hIRC5OCPyYqw==
X-Google-Smtp-Source: AGHT+IFq9p78WOUWmhrHEtusd6G6TUySqV0Pm+H4B4or80xw+cl5zLOKvMpvaFJz7M7ANx6M64mshw==
X-Received: by 2002:a05:6000:3106:b0:3f7:b7ac:f3d2 with SMTP id ffacd0b85a97d-42b4bdb947amr2650518f8f.43.1762960953526;
        Wed, 12 Nov 2025 07:22:33 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:33 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:11 +0000
Subject: [PATCH v4 05/13] coresight: Define format attributes with
 GEN_PMU_FORMAT_ATTR()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-5-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072235_489229_6B9BBEFE 
X-CRM114-Status: GOOD (  13.64  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++---------
 drivers/hwtracing/coresight/coresight-etm-perf.h | 31 ++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 91132abca244..d19e2568a0d1 100644
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


