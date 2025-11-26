Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08793D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tm65IZSOvcLW22I95NQ1DesGTVpSHNfrfkgnxYh1pRw=; b=t6lucyAIMzyLRY1WU3FS5obIRw
	iu8pLDYsTYkhKl2TXc1C1JbSF4HycPertTSnK+eiX/ovBV6W3uk0mTvsLJA4v9VyncoHjP0tIVo8t
	fiEciLVJ01Hd4HH3+LXqGHRfxsB7D4MPxU4Z1VG89VMc40SkHSs3WlBwg3x21c5rJ3BsS0NBmtlmG
	Ps12Ixkj6FTe/imhAThbHfTq5O6XqCE76mnOj957yM3AyhMHcHVhgWSKOiNBFpRQIsxxH0MCSmyPw
	NA9NFWC3A6RSuPfs4VwItHsTNWN9pWir36ciu5BIvrtzUyXGVE8gwQP4PLrbswvkvsKdo8GCU8GYY
	Oq2MC0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODE0-0000000ErGm-0zPE;
	Wed, 26 Nov 2025 10:58:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDb-0000000EqtM-47xE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so37244025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154670; x=1764759470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tm65IZSOvcLW22I95NQ1DesGTVpSHNfrfkgnxYh1pRw=;
        b=WcTNBcZfntmEcIxZknDiVWl+dyh+fd1NSzueNEU/pjVp8Tl4aNrtu/QjNS4httvJLd
         doTo6hRUQSRFtcWZ/qsSOPOsRSaUStpZKNH0j/Dus+k+XGWMz7qNm85ucV2Qc2Ujjqwh
         X2Ldzmg7y/A5C9xfhBwljZGOjNDOJUc4D5uJJwUd9fUqWoaiTqyW/CmsAoNZ/xMbgtgq
         c5RUbTRmWVK7Vip/0u03doYEwtId+4fHcAjnnr1fGLbNxt9/UHDKrOFun3tksJn+Btjh
         RuKtXm6Y2+rxVnW7Zbmq1AxtbpmAUmISiVB/Vn2d+7mUIePxQBOriisGlEVRD/i3Bfp3
         w6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154670; x=1764759470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tm65IZSOvcLW22I95NQ1DesGTVpSHNfrfkgnxYh1pRw=;
        b=UopRBhhGM93COqNH0Jm3KJp77S4/+qafEq56B9uW8IGztjbP/VQnV21xjUulXdMyKF
         TbtFqgS96DznUxxrUcydVm1fyyooS1WDUGKuybmcY9kYKKojEa56i+LWjlVJ6ox+rpIG
         H5F7WqWlyd9TBYh4aVuBe/J1Ezbt1aDe7FYmaadi0T/H/GA1vPH52o+OyYIlmctWFkzS
         cQf02VW5ZTh58b3/wtRvEXQzV9Z1usJK8Bj+wD4ZJ2pmMjzgzchO97temN9lqGJ30t73
         9BZBJR20z+f/vXDWbCSGZp6WacglNXbT++OXovfkcsvoPl2BYSbmFmOOMSG4hRGZm/sI
         MUdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrzD9sS8PkMMvn7nCic9BvRfvvkALC2XuVy4c1ucV2zeJl+ZI6CRZdOXuZVOlUgwf5iTNN5uLkvZS/VRG+ZhSW@lists.infradead.org
X-Gm-Message-State: AOJu0YzPX6Mf3smLFpl12rEnhNlOo0XyfynD9/jEWlVYpbAJKPG37mjn
	+U1q/fQfs8HUttFKLbc4EPjGMJDy8vrP5j2KpTMw+L+az8d6Bbe7SZzs0ZHJ2RolX20=
X-Gm-Gg: ASbGnctxWcA0G5kv2sgOamg9nb/lTrMP+asSi2fqvFvBtqxY0Gp5i/0uJrCovrrUFGh
	rZVrZUiY/1qy6Yg01YCFUoVAx//lV3l4F8eUuuCnswmCeWCtGzfeRPaPjpm9kupjpjjjTqyG7uJ
	vAFUwxN9FKdSiPb0VawIMT/fzm17maUIfY85zZN07Wp640wiXy9kOpQSnCM0/S/6SKBGxPJ3lko
	6Rhf4TN6fPV8TIqMb1SCr0/t9mv4xScwoaqMC75jxnjS0WSu4FA8o9p/iIm8Xt9vfKBExuLtCph
	+f+yHLXvdy0Vn32u2Kt+rQge2ybnTTw9JjmVluJOiUY4+MnLcssqfuFbLaMXrzZ1dLR0zAomMmU
	faVX9QFw/kLD/lUrzOAxoVwquygoc+5qh9PHv2BcGNc5t9TOiaGqyz5/d7YqLzH64w2c6aqnRzJ
	Ube6Qe7EXn/4Qpy+cZxkN7
X-Google-Smtp-Source: AGHT+IGJ2v0yxKZrimXOs4gdJGwyABW10H3d7x7EO5UfBg1Qo/N3VaSJ69gFaHjyPQmsOrFh8yPBvA==
X-Received: by 2002:a05:600c:3541:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-477c0162dfamr184534115e9.1.1764154670166;
        Wed, 26 Nov 2025 02:57:50 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:37 +0000
Subject: [PATCH v7 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-8-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_025752_056242_7C5EAB1E 
X-CRM114-Status: GOOD (  14.34  )
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


