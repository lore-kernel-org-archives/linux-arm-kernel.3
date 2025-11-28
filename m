Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91CCD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6NKswHRt2B1T1Lth0kajA34+egQTqFsQQ3qShHJFKE=; b=Ptay9Vjs+SJSTz6lTUgg5Neq3a
	jeGXX0WazC5noF6oQ56Cjmod1XCF4oiM0KdwKLlp37Gd5qVrae9xuPc4UdO0tydsMZ036NLybkS1T
	sMTuU4aAYi3nNz0QAB8323Lnn69XkD7xDARKuQrDfOHlDBbpLAObn7d0IaI5i8b5B4lN4xjmpS6mg
	Dt+AWDiJ9gv+8w9hvh8mfALYFBECySWXhY55mdRWwHCvmXzdVVvCf9E7tqxzLnMgslAFIaA05cyUv
	Z1rDIOt2cqZbVteHTPAsVSF/LVg3KrH46upmuvIo9Tg26mZqynKIlPolI8vy0bNwNzt6ok04E5VNu
	Dbt2StAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx56-00000000Nos-3n5n;
	Fri, 28 Nov 2025 11:56:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4s-00000000Ngj-3YTx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:55:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4775895d69cso7727155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330953; x=1764935753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6NKswHRt2B1T1Lth0kajA34+egQTqFsQQ3qShHJFKE=;
        b=lkaKCp3RTpLezzgjoxYBs7T/KFxUSzyu8gYRQ/c1y+OwwvHzdYibWFe0uaeD/jqk4/
         +LTGZ1I1JiBIFXVtYwka0n8LUgoFpgp56Ap3X3oewf6OZ0BUNDELoh4K/E3434aSWzvy
         79Kjb2SjlsPrkTFwHBY+8rEFW0SkNpqAlKhV8Maom5I/bLP1IMHDDKcNAGnwh/yTbK7j
         GMQthNmPAtgi68pbj4VznCKKohFhRkm2fqPFodT33LlX+27xhX0yZQNLGpAv5Vn5kyf/
         kLA/PHgyAUKINsFgGc0o7XoWl8ikRdFW0uCPWLADsDq8KWO8ixKK3Zp0FV/dZEf3OAK9
         4aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330953; x=1764935753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P6NKswHRt2B1T1Lth0kajA34+egQTqFsQQ3qShHJFKE=;
        b=w3putg0B0lSDOS+LG15LUEueQMbis0mHAPCo9SXbvM3bF5shh/jshhFGxvnDmLjRL8
         SwP4NPjVOyioapvnEneqXsiGaY7Bez4eFlFvwnuotG2i2x6NQ/O5NAyOllRRYBJ8dlVe
         TJQViSswzE4G5jElSPMYXovYrSZp6FgW2Fb+7SNw3vESpQawTGleKGZvR6bj9NWmMn9w
         toahfkN9Wah/lCR5a+PzVBfWZrG+686PQpSfePcSyqt+T0qOWRKDQ39UlqneI+DsGuOr
         hcSRb1/BYCaL2e5pS4rEcF66DjwqNn6O2Nsq8cTTEJhDMGmBnCdGjkO5oEvyqEUcd/jG
         hb9w==
X-Forwarded-Encrypted: i=1; AJvYcCUmW7KA3kie+47+qYpEcyIJhWMr6nXQr874/7DIwSvzYHdMTGArZRXsXLIJUJrl58Z44xyf++Mn+qGc4OQhgHYg@lists.infradead.org
X-Gm-Message-State: AOJu0YxcvoaFbb38iVhs7z8xlKMWB8a60AQsIYRmkHylFfxX49giW/Vd
	n6V4qs3G4+X6Ysaoz6xMgtentjaPddyRWbH3rgBaGzlw4shyFaSkj1HRYugaL1HY86M=
X-Gm-Gg: ASbGncv1g6PoFV8e0hdskClAVyiXvlh1nC1XR+zsOamPhlAeU1AK8fABWexoUFxWqpG
	s/QcBPebRtdeJ1Y0PMvW5P/s0ADkZRom6/9KO2IVSPd4XHgJ7f/nk0TJ6DhD7pSFc8oN2JvffMW
	TleKw1sDvEDoAWsOzYWskpSPNTyBIvyE+81+j2k6DOvrzFZ3QfaBZCJGAXcBPY8MAsvx8gT8ZMW
	DNb+FA88xtXVuB1e2HIT68NpCa+1VljX7/wc3b7HT4wLnoXLwBoZZPwAGve+Nr5NmAu3JNpmIX4
	ejpzpT83+vAK8jBeR4VImwhhsKHUSRF8fHbgZL2TLG7Em2+Y5B6b0/ltP7PuSuPETl+7XaRzIUT
	nb2jH+dj5br1PYc+EDT+CK+jY7jLlPno3P+jhXx2z/QvPsDSL/vFt/1DOa+wBzwl1lHoSn5E463
	upQNN4J+hKVgQXOHHszDqV
X-Google-Smtp-Source: AGHT+IGG6SyR+Pc3XkdqQLhR9KbEorBs/XuSc16Qz/v7snsfS3YnRvRgeWVwY1cYlOPb/CmMrFBsjg==
X-Received: by 2002:a05:600c:4f46:b0:477:fcb:226b with SMTP id 5b1f17b1804b1-47904ac44c0mr158757575e9.2.1764330953033;
        Fri, 28 Nov 2025 03:55:53 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:16 +0000
Subject: [PATCH v8 04/13] coresight: Hide unused ETMv3 format attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-4-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035554_925041_CD3AE520 
X-CRM114-Status: GOOD (  16.38  )
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

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
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


