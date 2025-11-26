Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D95D10F23
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eB34ho9tLNd3EJt+3+XUDw0cEApe270YLGk56wWE0A=; b=GAsck4IzpaGw5tIq9QA30nmTu6
	vn36usEGRx6Wx4sSr2t6w2WDiyOZw7bN964bdkPdlrAL9KmokHCCkcOfzZdRNGYqK6da1qZUfwHFq
	NEgmM2a4vq5TDpWRtOacji2Ns7kr3Rg6e2Z62b1qA8WKYZSRE/hhK/qaefs66nL3SR7M3pitWWn14
	Npqc1E+XSMsiqED2EN0mwtKOjIzv5tLVv3wbguSR4mVAGslzvtsLUW+5zbiz8OVRGxRgxmiMNjTZC
	wOM5IZJdL6fkwB2fL52QvMLfnxzNjw8//gupabh7yGwVwwVwaSVNGXRjK/NpEM9vL+dvPmI/+oNKl
	tEoMRuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDc-0000000Eqv6-2cJS;
	Wed, 26 Nov 2025 10:57:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDX-0000000EqpS-10iH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so62713865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154666; x=1764759466; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eB34ho9tLNd3EJt+3+XUDw0cEApe270YLGk56wWE0A=;
        b=f3cdW8IYSsBt992IDleBVZqIku6VKaL8N19D27hYaXTPGh45c8NdVRN/dCOZMKkawX
         P9BayMqWxEYZq9ggSEetvThAGT0lDPD4tJ1HVRgouRxPrm9twIXB4GPtmbi1lMqXhH7f
         B4dofxj1uKj1HfmWIBAKC1oL9Pl8fSFIVAuU9rTYq/PKVQh4xYpVN1qoEASukO1hkp7Q
         yVw0KPS6Hx0fPwdUyNBcMTHgdV58SUCA6FWsZVsxdGeDROP9ypHL3hKyxzxc8dk2annh
         amXJGEr44N+Zb49iRpUCaNPgSbhkYvDCbOltlhpHeD3SOMUqOCa7qpx5Bsfu6xwTBcoW
         VTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154666; x=1764759466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4eB34ho9tLNd3EJt+3+XUDw0cEApe270YLGk56wWE0A=;
        b=ViNfISYZ34IPzeR/W7wn8/Rz5+J6R9DThQzdJmXfr/3Mno7ed082fyeQKxzUgueGhj
         uUNdP6Zi/zsZgy5CKIDNz16tpfCwTCQd01VKfwD6EZvP/FKSSUoUs1Z1/nDEMnMdUco8
         UZ9q6KC+UiS0R1sNtW+zFyQh545Jx2+5TEBCgfsxH5EPtY9gly6p8XG9kEFDejblGQkN
         /6X9W0PA4sMFfe6PnfGTFYHzqPnB1IMgEaVS5mi3JfrYftVePwDiZuKdO18XohVTrXdH
         CT7S/lQ/arDoZMQsrzf2AFcoFvGFvWDvQ4/Ty7kg7ofLNuU0YfeNUrX28sX7s3Y1yBZU
         wHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4R86mkDiKrpD2wTgsKZHAJ3euygNJigy5CLc1n/vt9CW0YK2U8aRsu2wpm7YJH74vX7VeeaHlvQN4ofaB6Uqv@lists.infradead.org
X-Gm-Message-State: AOJu0YyWzt9c0y77F8T4h7jqyuGR8It7zAZHdfyfUWKlqqsm0LT+6LY4
	twnBeW8lTViFZS3vC6LcrXTbeavSYlKcfSBqCZIsLfGoz4TXQscqsfHxYW2Z1uYru6Q=
X-Gm-Gg: ASbGnct9/qAgfAWkaMUrTXbJ210TiNr+sUrFaeDirbMHSxZuGdV1oZUa3yv+X7VVjpz
	zDmyWFc0HpU4k0RgOgvywx3cfNrdK7mwyEO7hCivapl8he1EJRLLxpho19m4Sb3gfsnRvgp68N4
	25nsMAwXR3Bitx/RoiKRnYBIRBiBwcxulvrnNib03QqRUTpfloGZlLRjr2w2Qs6e9WKXONGE14+
	+SjuWhIaoEZbb3oi2OmB3JNv/cZYwMg1gKrBmoX+/p9gjx1FJE5bjOC262PwXgrZyesTncfu9JE
	mwgCetezYlUA+5W4pIfDPnWISa65tGyR+hhHdYLS7dvs4EY6nxV5PNP20x/tT4xqT1SXXcPtyAx
	3ZZN2rsOml6PHPhM34/Ibsgx8Ub5clXrBNRmtgSLk+uHeAD4ciKNFXKkuvmww2725Js57OIC2yS
	vHCSExir/HJO6VXTKj3Gv6
X-Google-Smtp-Source: AGHT+IH2BvopeuRT0S9+xRNSYbyM4nOqRmPC8UzC4Hx7OfiHrAR6M+pqTSqQVntjYyB7HV7H6n6VHw==
X-Received: by 2002:a05:600c:5491:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-477c110e391mr180110055e9.10.1764154665624;
        Wed, 26 Nov 2025 02:57:45 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:45 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:33 +0000
Subject: [PATCH v7 04/13] coresight: Hide unused ETMv3 format attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-4-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_025747_363428_53D891D7 
X-CRM114-Status: GOOD (  16.58  )
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


