Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948D2D116F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0/Qi3NjbL8DWJLM+DALCaaRy9n0Hkgp5CNeZqwH6+M=; b=J48Dcdbgj6azY0mrCEMWGD18UQ
	bs4UT0XXJhBdOYD0NLqMaR3darQNvQ1YEeUMMVUQZGj1FlLz/h1IwGEfJA+l3Hy7ZtFqempBJhmTU
	CBwh8isG1wRW/0hxrlJzZRmW2aK41360G4PGxcz7iK+NjFwu3+G+JdfAK36V7/6oqli+6AhaiswkV
	BqC8/mctRRREpNNnBxG3bkSow6tWPYsEnj8pwtwXt6p4ES1XYZGFTUngy/yYWT6iOc7o2OUQuixOO
	OETxxvaKDw1U/cyPMFPmGs8ADj5VDfgLsyoEj6gYrV3H0qZ/46W668ThUu8K1saxGyvuhmaL31Rh6
	gt+gWTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx5A-00000000NsB-452O;
	Fri, 28 Nov 2025 11:56:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4w-00000000NjP-3KQL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:56:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so9464575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330957; x=1764935757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0/Qi3NjbL8DWJLM+DALCaaRy9n0Hkgp5CNeZqwH6+M=;
        b=wW/Sf9jhYoL9YckAh2cQxojUrwKiRjgCAuK8MzIlfDbaSq0mwjkLERXOYpVxfGgfcv
         6Z9s+aJCPxUiHsK5cD4xEWAhlsVMH9yBUgP4+5x2HxpAdFAXuePZRmNCTAs3airtnN6D
         0io7DtO4Jdr9aXKGdyzNeTFCyuKq3oN71xbNJwjVB3ExXPBtvGdfM1az6y0TOQNX4LO2
         gqAWngXfSH8NFUuKOkLvxzQZ6VqXKa/is7f3Mt/zo/xWaKyGUwOqoIK8gkQEGkfQOLCj
         gXR1jC3cHdUe/QXQ5KHFhzInRLvp48f3+tUD/VuM4avgQQNxwLWZEDentYUw5Owrsm2c
         H2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330957; x=1764935757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K0/Qi3NjbL8DWJLM+DALCaaRy9n0Hkgp5CNeZqwH6+M=;
        b=UiISETCqGijGUaN6RoXrftAPvXFRAvStfAIVCdwe0tW3i4LDxqgnXIUiHtKJfAtaRe
         l700WsEkzWyubcJ6Xs7IcqLUj8J9f9x8hQo1PHNFrJwJbLK1o4wTpKoQMCf1MTJfkvbC
         VPaast4qgnZRfjLPTajzkbGmfI0B1QIZIFTRQ3CqYAQ0xiBz6S/wZlKnXrt5fROCkFjg
         BVzJ9LseOvA8r9WEaiScZg+tShxkjsjxikCwNFZ63EKp+eaGGqirRd2d5d+eZgEmbUu1
         hqefUvGu61+gfULbPQixY9XbFbRcyIDPZEKsJSIxnrjioCmoXi48yRNvVQgb0GJeYcAB
         fGcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf5IZGuFnKkUIa4arfJw27Fh6P0yzkl3olbtADmUMIm5qxZ4VrjMsTFuVF12SOuaBmBJxbP0LbUkNg40Ee+Jbr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3hcX4g6mKHqgvrRB3gKe7v7TG14Zqw0Q385vOOd3dXKXv3YZW
	zfMc3CefPbN/DoKmLrmFpnJ40tZ2aEC6IvMRB2lW6QsGFDPqW3CXJSc/Ud2yPgsgPdM=
X-Gm-Gg: ASbGncsaGnZJlqjAY9cavQI4S/Q9Fyy+JK7N1sCKf+96YJm7Yf2KS9Vo2ixFV2G11xG
	v8XbS4M83RABmXtPr/U/mbWrhhWRozS9Nm9OqeveJsDKqj+OIFS8nLJK0OzI1DuzRKVGEUBA+0w
	Ql3jDe+7E2PW84QlbKjlGZhk5h4YsFK1k/qW3dwPcm9o18jxQgtcIMRxikBbtRlxrB0Nh7uYH8e
	4eytPSOV96sK9H7pvo6dRuz7yE4Vb9sYjoY3DACTAcauygewXL+hJJ+gCAOcnWngRhlru+/KhFt
	mSBQl4lxhNnzQVcmv8oI+klKb4/OEt+9T2JfBNVAiCNlaUn4ZzSJnoSUx3WcNbpIApscO1OVVP/
	kvivw0203WXO9h13Fk8SBdaueMM9GR2/YRnbCCxycwrsCx1bp31PSo+gci/f3Sff9Cj/aLNxJio
	gvmQ4cZWzJ+5SOswHGGpJx
X-Google-Smtp-Source: AGHT+IHV6cR5WG+cHm605aoGAD0fWpVavwZ5XX95yWGTIYMZtBRLmiZN7jZIjMp/OqRBrFXTsFoylQ==
X-Received: by 2002:a05:600c:3b05:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-477c00e7900mr301950305e9.0.1764330956965;
        Fri, 28 Nov 2025 03:55:56 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:56 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:20 +0000
Subject: [PATCH v8 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-8-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035558_927890_B2DF88A0 
X-CRM114-Status: GOOD (  14.02  )
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

The "config:" string construction in format_attr_contextid_show() can be
removed because it either showed the existing context1 or context2
formats which have already been generated, so can be called themselves.

The other conversions are straightforward replacements.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index bf4b105e0f41..3c8a6f795094 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -77,10 +77,9 @@ static ssize_t format_attr_contextid_show(struct device *dev,
 					  struct device_attribute *attr,
 					  char *page)
 {
-	int pid_fmt = ETM_OPT_CTXTID;
-
-	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
-	return sprintf(page, "config:%d\n", pid_fmt);
+	if (is_kernel_in_hyp_mode())
+		return contextid2_show(dev, attr, page);
+	return contextid1_show(dev, attr, page);
 }
 
 static struct device_attribute format_attr_contextid =
@@ -319,7 +318,7 @@ static bool sinks_compatible(struct coresight_device *a,
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
-	u32 id, cfg_hash;
+	u32 sink_hash, cfg_hash;
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
@@ -332,13 +331,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	INIT_WORK(&event_data->work, free_event_data);
 
 	/* First get the selected sink from user space. */
-	if (event->attr.config2 & GENMASK_ULL(31, 0)) {
-		id = (u32)event->attr.config2;
-		sink = user_sink = coresight_get_sink_by_id(id);
-	}
+	sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
+	if (sink_hash)
+		sink = user_sink = coresight_get_sink_by_id(sink_hash);
 
 	/* check if user wants a coresight configuration selected */
-	cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
+	cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
 	if (cfg_hash) {
 		if (cscfg_activate_config(cfg_hash))
 			goto err;

-- 
2.34.1


