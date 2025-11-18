Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A5BCEE338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9PmA5gGpR/tWp7wz6WLiRdtF8z1fVXXlKYB4lN3jNM=; b=ntUlOBEF5dJkfytXB0hmkkhKsc
	+fyqqohkxL7SI0Cx2YmFkCffA+5U5qr4MaTTAibj5zrlhAHncSTBfG9EBfJH2wTp+fGfLfHCtN8ry
	9qJnOm4/0nQfJvg1qT31OEDol5HyzEXgmHtbZcPJ96uFrHHGvRN7nWljQOVKyrS6ue8T+86s4Aaf2
	GlebeiOoxMzq5JDaQVuyg1KzgBScWgimnPklzLLaIWMqrxAGv6DMv8IbmUrZICOK83x4VpDX4RXFB
	t+90YCoFhEgZKiBHFrWo3W+6G2J5GvmLBNIaknpPDOo2ei86/EmJcbQa1CzZK5r7WSGO9qliRuFSh
	Mr/lPUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZR-00000000jne-0e1l;
	Tue, 18 Nov 2025 16:28:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ6-00000000jSB-1Snk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4775638d819so33160165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483302; x=1764088102; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9PmA5gGpR/tWp7wz6WLiRdtF8z1fVXXlKYB4lN3jNM=;
        b=kvngScOW8LL1TXlQqLYPg64c2kOcCce/IxT/zgMNvMYlCliTulYs6/jjcpu39pawqf
         0EjBpsAAmktAJ8aRjK+f5wkJT3iLjiQ3yrHQ7lQB4vs/vQnwkPFjEUJLcIzFbkPDdVoD
         WUKxM1ILTBYDy4wihT9vRXd1LZTHUQoPq31axiNdxIgQaPUbuNN+f7l2u5UsL7JnZ2YE
         uSHhK1wW1pQnKqM/fttv6jukinq4d0Z+AwL3rQaV8jjnmVmuXX0mP6TgnKscWeReWDSN
         gDERUjMphiOYUT/cm7g3he0VdVA/W5leOapsPj/6hXkoY39fPhW8rGvFACIoEOVJJt1D
         TiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483302; x=1764088102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l9PmA5gGpR/tWp7wz6WLiRdtF8z1fVXXlKYB4lN3jNM=;
        b=VcVYu57DCV6jJEzGT4irK/dnG5YryEhkiVE5q9rwGIUganWJSoeRIFA8LEIrm5IYFu
         xlCyDkBeNCjMxqkK71SllU28L9CVgsfJHNEAJfbHpo/z2/vxF68B7DEAJVqRfcUvPPcn
         sec0Htb52Ug1zGBZXQX8JfRegk7YhcsDAirPwRJi/2PZ9HA6TNvu1VotsqMIdCLyFiY8
         TY7H4zq/8MfUDFEyYJ8HwsQwZB9wNWSHbdDADhF7ui0m0jWt53flU4SScEYluRZEjFzC
         85LFoa3dT/fHtBMqe4Pj2lb2zQ+Rk7fsEjUQ63nY3qoWLVv9dm5Ril1rBrzdjRJG+ejY
         R2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCX72snZAa2TE30wUB2BGWJDn3BDmyI+4X56T8DuTILCg/bPJoVmQ54EfCgAFO0PaE6OdGeUjR0aBU46sgLccbnS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt7H84qVRGmYOPAl90zOgaRzYMb/Itx35ipLAKrQprUyHzxIax
	iEpCb2Y8GQR7cAs1h0AFQeZMwBlsYqToLLnrx4uHQ2tuNCgTXGsZBTrl9dfFYk6uTsShk3sgCvk
	2dubKdvc=
X-Gm-Gg: ASbGnctl1IP2fcBw6EdW1OMY8a9Ua/u1FiS+STT89yL1RM4oMWwvYl9md3cRxQ9Q9wn
	84OVyRDX4RjISrN/u7dxeOGzwmY4CXrYMHffKWgOzyRqltOGfJc5pECZAVJpJs/vwMOdIc5Bkxa
	CDaiPfKyq48i53UoWhcN69dUVGY5y2XzgTbRQFbEjkOopGOlw0fPGD0I1Mx/tZ1V1+k4mpxypnT
	h98fTEnMtBGyEM4P86FPGUv9ysegBKKneTav5uy9O26XPn+PhlzL+mnXxGZ0jXY6e2xON7IVOUc
	iku0ik+bqDPNU3qdeOFGAa3k7C5aJvDr2i2Sbri+VlwuuXbn27EMtQ9SouTmAcF9G9J1OdqJwF/
	K1dDLWoZXxbXFzAI8bqPVSTje4y9k6UjoET1c5WEMI4MX+Pkd8X8ijP0LDufIcT96mFUJYu59yX
	Egf+0U7XS8SR6nX/TfYZGzYM5t15vX3Zg=
X-Google-Smtp-Source: AGHT+IFBsfyqI4nfvni5vPvJYY1wHrZ3i9XROTrpO6sjMJMIe4fE7Y8UeZdT+PEXWHCYRfnXU1kcgA==
X-Received: by 2002:a05:600c:4685:b0:477:7a1a:4b82 with SMTP id 5b1f17b1804b1-4778fe5fb4amr166705645e9.8.1763483302373;
        Tue, 18 Nov 2025 08:28:22 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:21 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:58 +0000
Subject: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
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
X-CRM114-CacheID: sfid-20251118_082824_409184_C1F5111C 
X-CRM114-Status: GOOD (  15.25  )
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
 drivers/hwtracing/coresight/coresight-etm-perf.c | 26 +++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 28f1bfc4579f..1b9ae832a576 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -80,12 +80,19 @@ static ssize_t format_attr_contextid_show(struct device *dev,
 					  struct device_attribute *attr,
 					  char *page)
 {
-	int pid_fmt = ETM_OPT_CTXTID;
+	/*
+	 * is_kernel_in_hyp_mode() isn't defined in arm32 so avoid calling it
+	 * even though is_visible() prevents this function from being called.
+	 */
+#if IS_ENABLED(CONFIG_ARM64)
+	if (is_kernel_in_hyp_mode())
+		return contextid2_show(dev, attr, page);
 
-#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
-	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
+	return contextid1_show(dev, attr, page);
+#else
+	WARN_ONCE(1, "ETM contextid not supported on arm32\n");
+	return 0;
 #endif
-	return sprintf(page, "config:%d\n", pid_fmt);
 }
 
 static struct device_attribute format_attr_contextid =
@@ -337,7 +344,7 @@ static bool sinks_compatible(struct coresight_device *a,
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
-	u32 id, cfg_hash;
+	u32 sink_hash, cfg_hash;
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
@@ -350,13 +357,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
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


