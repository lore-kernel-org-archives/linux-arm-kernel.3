Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF058CF3953
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJnX1IssBDUYwxbPMQpT21RQj6R52sfQCZ+gQVVjaes=; b=SdofAHuiVdkHpkrCktxlY0bR7u
	zOmONbO4MfTwnScV+vDgST9gKLTA1VirDkS/37O/JMbGUR7QIn1p7sKsW7q41+5OVDM32GBqUl/CO
	VjLdoyKqD+kpN0fbCLxrgVE2IEi1nLNsODqbMK+ZCLeMezlZyo42/n6qCtjKL7teml91q+zeFAPtu
	CHPwLsZF7+fbm/EvzGoYrMQKif2Ofra38R2/WlU8fYj/G5lLWuqukrzH9OMLrYaPEyg2Q1O1qstqo
	6JKyd7clUdaCa/jnz5c17VpdTMKU+iRTo9Ufk9Fzq77PNgrT1wkqSzQriKdEmZEUo9sRzaBwMOtAQ
	lcO/b6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt3-00000003ezo-2tPi;
	Wed, 19 Nov 2025 16:18:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLksz-00000003etj-02QX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so37187425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569103; x=1764173903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJnX1IssBDUYwxbPMQpT21RQj6R52sfQCZ+gQVVjaes=;
        b=uKkdse+nXupR+D3AfCX/BiLZwO6qD4hsyme4wgSV1Z8dwYYy4nqaoKDdeFykF9zBlh
         1lyDHkHfxonRcNeSsGiMDkUovzgoo6c8OPL9BXR0jD8Ezdrxmq/fA9lwnaYB92JFFyLC
         EN0XPz6Zo2OT6I9/Qmf4DmwjdknQpE3WFxi7hZClADjwSDyuRrNXLrFxFfM0+BHPUjnP
         wrLK87206qnIEKQ8koVLrECbHXJrIl/ujlihcPykHIvWx/wPQLTzDQENM4BuOfRTPgIB
         bdgyO5Z4Xb10rEGiHe4En7YUl5tU7uLlcOPmg2E3Ey6ntfORAqa/2b7Mip0MoJnReWuk
         WQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569103; x=1764173903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJnX1IssBDUYwxbPMQpT21RQj6R52sfQCZ+gQVVjaes=;
        b=wMJIovMGK6xS5UwOuz+2bqekDMjFZaCNNhaT8C48ueIERL8s+bXMhK0EaVdZ1VgeBn
         gkWBnZFgIqGzVWpHclPRPRbJYFApMJkrd8lfWevINV+B2EmruxgFDK5KuQyW3e+vNoBS
         K1QqnBhWigd05osAKUvHB/SX4A86u0uuISbYG930T0UXKw/jALA3zssnqDbRyNM4Xdhh
         78JNjevcP/eTDS4g8d+DYXwbFfsSGjGJUh8MSiew1GtoDs5RjCiNntfoyL2+vUzyPX/I
         a3MUGAVzI1oS/yetWgGMWaIqzjqTbTvLZ4zL0yVDE4tY0T8yTOEjw1pdEB9lr35DrUmT
         99+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzcMbfhqLgP74NdSuKa2wD6EdF/ZRXOGg/tcg3x6wDY0TCzYuNp57UOz+kaFXGCACrR0TfXHR3tiRa9auMHCdp@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfq1eBomaAqMvWu30Gd5UQoS+yzfaMp8OE3OLCUJTKluJfwf6t
	dHEl4CFqo9uxhOdNFO7ePfe7oOBgPydZ6H9wfVWWO23G0103QrZFGMs6vkJd4Ut94Xo=
X-Gm-Gg: ASbGncvdtNpIJrr/iXMNsuDwFo9lLR1PEkaHFheSjDeBD/VoB7/N3EkXF4A4RIAoaBG
	ZaaPImgbLKfxuAIhGHZ6G/YugxBsSbK2Fl5/IvadAsoaIaCH1Hdra5WmQjkJ5mvhBw3tOLt3Sz0
	4cilZbGVEb1P24s/46bilOWHEsx8H6amvv7dZQWX5HEpuRt5QW7EiJ+k+hnArbQTW6WjnynCr/4
	hYHHxp0czxmFSs1yRsxbJ0iVPvdUY30g/IwSMSLw46WsGLu8zZdJ73bGRCinDL2k5IqqnUmB2Ix
	ikqqhjiNG+lEfRc1YT8vK0w77Rdof3eUJiI2gYvpLUNVYZqw1PYz2NUBs+fDhoX8Tz7432+Xfkp
	KYh6PyFmWGJwH4Kjosr/S35AwKNExv+VhBgy5DqnvILXrl7nWV0x5z7vf7DpOk7aXbPAszvKkuB
	hBum8T0+dn4Gv7vGcs04eJUgVqjwN5V6k=
X-Google-Smtp-Source: AGHT+IERG1RqFDP/vomohLBpJJq4UxABCONp2aW0eCI+GJF8HXVx2/qdo6JpRsSGCuMFRUh2amzmJA==
X-Received: by 2002:a05:600c:3105:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-4778fe95ff8mr203233935e9.23.1763569102729;
        Wed, 19 Nov 2025 08:18:22 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:00 +0000
Subject: [PATCH v6 04/13] coresight: Hide unused ETMv3 format attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-4-740d24a29e51@linaro.org>
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
X-CRM114-CacheID: sfid-20251119_081825_463679_1705719C 
X-CRM114-Status: GOOD (  17.11  )
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

ETMv3 only has a few attributes, and setting unused ones results in an
error, so hide them to begin with.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 37 +++++++++++++-----------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 17afa0f4cdee..3805282b97e8 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -50,27 +50,23 @@ struct etm_ctxt {
 static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
 
-/*
- * The PMU formats were orignally for ETMv3.5/PTM's ETMCR 'config';
- * now take them as general formats and apply on all ETMs.
- */
-PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
 PMU_FORMAT_ATTR(cycacc,		"config:" __stringify(ETM_OPT_CYCACC));
-/* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
-PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
-/* contextid2 enables tracing CONTEXTIDR_EL2 for ETMv4 */
-PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
 PMU_FORMAT_ATTR(timestamp,	"config:" __stringify(ETM_OPT_TS));
 PMU_FORMAT_ATTR(retstack,	"config:" __stringify(ETM_OPT_RETSTK));
+PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
+
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
+/* contextid1 enables tracing CONTEXTIDR_EL1*/
+PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
+/* contextid2 enables tracing CONTEXTIDR_EL2*/
+PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
 /* preset - if sink ID is used as a configuration selector */
 PMU_FORMAT_ATTR(preset,		"config:0-3");
-/* Sink ID - same for all ETMs */
-PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
 /* config ID - set if a system configuration is selected */
 PMU_FORMAT_ATTR(configid,	"config2:32-63");
 PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
 
-
 /*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
  * when the kernel is running at EL1; when the kernel is at EL2,
@@ -82,27 +78,34 @@ static ssize_t format_attr_contextid_show(struct device *dev,
 {
 	int pid_fmt = ETM_OPT_CTXTID;
 
-#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
-#endif
 	return sprintf(page, "config:%d\n", pid_fmt);
 }
 
 static struct device_attribute format_attr_contextid =
 	__ATTR(contextid, 0444, format_attr_contextid_show, NULL);
+#endif
 
+/*
+ * ETMv3 only uses the first 3 attributes for programming itself (see
+ * ETM3X_SUPPORTED_OPTIONS). Sink ID is also supported for selecting a
+ * sink in both, but not used for configuring the ETM. The remaining
+ * attributes are ETMv4 specific.
+ */
 static struct attribute *etm_config_formats_attr[] = {
 	&format_attr_cycacc.attr,
-	&format_attr_contextid.attr,
-	&format_attr_contextid1.attr,
-	&format_attr_contextid2.attr,
 	&format_attr_timestamp.attr,
 	&format_attr_retstack.attr,
 	&format_attr_sinkid.attr,
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+	&format_attr_contextid.attr,
+	&format_attr_contextid1.attr,
+	&format_attr_contextid2.attr,
 	&format_attr_preset.attr,
 	&format_attr_configid.attr,
 	&format_attr_branch_broadcast.attr,
 	&format_attr_cc_threshold.attr,
+#endif
 	NULL,
 };
 

-- 
2.34.1


