Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0316CF3953
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CqXsiWuG8ftmN0OUcZwJJmX94veikCNwJH3neNDlXs=; b=DbU6O520S3ocIE+nmpP+9S6/mP
	fzQ7S1eTRwI7V+vmk2FOvVodY/iSofcqIk5L7/Pp8VzYD69fMuK5EMYeu6RJrw60VomkWpu1+NPby
	GUqdsKL7KQCoSOmnYvIw20qZ3JgSDQ3o5sFIQcsbdSTteYq2RzYu3yVbdbBE7F+1YGpnzNADvdAQ7
	0hGS5VWiZ/4t5QuqP05yGlG8T3gIrwEWu3wXBBVykrBWw4DqN6vCEe3E4nZZtI34dpsXhRi+CiYsP
	MSaHBuulYIaQ3uEebdGBNDJPkax9l2+/pp3ijq6yuJgKZwJJzSVIAfN8562HY2AcywqQWcX0D6dXg
	5+vfSnPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLktG-00000003fAn-1foh;
	Wed, 19 Nov 2025 16:18:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLksz-00000003eu9-3l81
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so50503255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569104; x=1764173904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CqXsiWuG8ftmN0OUcZwJJmX94veikCNwJH3neNDlXs=;
        b=PxJOyR6MKWH1DWACFDAkKQcEBhTSyNV34R8NPINiwxuOSOMCFYgcGc/X2tFzwLKHpH
         nizqAcsV7QSdSDVeWSf2SMl5WV+fgo5Vj4q0yJVPK58r0vlohuX2UmL7nsART8Cin7l9
         gN2j+AQuvahVtpGq3sIIRMF8GqqOFBuhY1Jj9UJkT/6FmuLVg03S6LK40fkCA+jp0EWc
         qF/vVTl4IzY15QKehy01kXUonjH7sFGyeJk8+W4GJAozGJliuvQu8R0L8BPk67GZnImW
         Rk2rcxByUlkevXXggtjB3h6uDl9Irz1iZQxtDD+QpODs8ltsqUA+FABHn1uqf4aemgDk
         r5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569104; x=1764173904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9CqXsiWuG8ftmN0OUcZwJJmX94veikCNwJH3neNDlXs=;
        b=klkaVb32xDRkB4vj3L2cqwvG+CN1B15UK1FTPC2uPmZG02iDmm3Eer4yZ1Uen9rXg1
         tAl+QwHV594SLiCmNulNN3qxpesjrfq8Ml0KOMjJnJYMuZOBcV4IhvggMCs4KMWbZbKo
         FTREl326SuXxVBY3jwAb3XvebhGjtU4hxWmNvh0sy+UMXwdiSzPvbColr/AOZcozlOG/
         d61G971uFXgfO0i65WHi0Br2yEPKe+boqD386gg/nI3s7c5Q/N/nsEcyuYYQAKs7AiKS
         q/aS1+r3N9rl/kO81nc6JxdMAAF70vrg/BSFjW0N/Ue9zMd51SNUY2qAe2N+jMl6xItb
         ThTw==
X-Forwarded-Encrypted: i=1; AJvYcCXy5VuhjN0udQc9wn2WXkocS2t7LNZN5g7FQcDwzi+vbqwir0Tugy6ZrA8VMQmIoUVwXKMIenXSYfGmOXCfq2KT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9/4PEaInL54JZR28yIOQQMaPXUrresCPEVO8+edVppGk2/xXl
	5WLL6LPSHUBS7SXLqu2sOBGE32d8eBvj+30Yt86hbDkttY/PFTT1ZDJ3ITQ+h7Kp9GQ=
X-Gm-Gg: ASbGncuH9usrVN3OzGb4vu6B4QOAN2964nvKApV6LppriDHWXrvj0G74SngIyG7LycC
	njo0mmRnWzpFxMz2CFOpzoOGWnJg8WwDzhSWEhkVkkeuUHZcAPBzG7BGmTnrKWEaeIJ4RB46xdd
	lgwTy/MzvBANLckoJziY1YPwDSj18bSyfuMx3uK4VTYka0SS17Uc2GJPhQla1YpukXGct9jbp7W
	3UMlUTwu9X29ymg6yQWOxoInA4sjurdhtgOvXap3815wRUzRaEAjJFBzfkbe1C6sHuVhpqY/imh
	XTls+xnw67vvD7ffTagqj822EXqkR7wS7zCcCqZGVk8xVsnXsc8tvgBhc5QrD2m9Brm6aLOORDS
	p7T2c29WVBcfvyjEllEZVJGQSkYskECz7ALV7hR2moPaIdyHcWguIwFPuQkPAqHtQAhuTKjTepy
	rZWr7BkjWv9EyF4mQcqj9yoeDCaYQF0Z0Ir+RdWEHoGw==
X-Google-Smtp-Source: AGHT+IFIpxMsXtL8Djl2C/kcPjmViN58tbjJ6XcizBi2clh7TDM8Exuf/J+ojhsvo8EkMvz/b7GLZw==
X-Received: by 2002:a05:600c:3b12:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-4778fe89ed9mr164685515e9.28.1763569103694;
        Wed, 19 Nov 2025 08:18:23 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:23 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:01 +0000
Subject: [PATCH v6 05/13] coresight: Define format attributes with
 GEN_PMU_FORMAT_ATTR()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-5-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
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
X-CRM114-CacheID: sfid-20251119_081825_996086_557007A9 
X-CRM114-Status: GOOD (  13.91  )
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


