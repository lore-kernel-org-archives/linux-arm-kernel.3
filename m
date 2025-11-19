Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85448CF3951
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fv3JnFDC0jik+shXFRazxf6/zTl+pNpZZP8z8eh7A8Q=; b=Ts8GfGXDQKw/0NWwnznkRg1VXL
	+/xsgP0ixheYUYFeUTRg6aBI4gj+T+tSHZEqcdd76JeeyN47Dzw3D2SGtM9/M8Up02Y9JuMBYolq1
	NvG37I8OhYF+nQVNIkHx09WVYUWkgje5/ZxzIocURikg9Imdg8XTtS7CMSo3wje2JZGyMQZLJf7YZ
	kB+tObEvZ5y+HPOwmlUquZEqhETpBAex6eS4cbtU2JtrTRO/IkKkXK2GPWoLz9Y+ebiiIz2uH7h2c
	Xrv19mjl6yjpCdCvzRIhv5nxjWNAqQU2fRNfQoz8lKyik+9n/MIgXWcyvWzX17vNNbJOSC3iK+aPa
	sCU9kScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt3-00000003ez5-1LIZ;
	Wed, 19 Nov 2025 16:18:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLksx-00000003etH-35BO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so37081075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569102; x=1764173902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fv3JnFDC0jik+shXFRazxf6/zTl+pNpZZP8z8eh7A8Q=;
        b=us8QmeYJEk/MV5Hh3TAsrqVnac53oJjtsYzvkavCIdJIVXlDYnD/Mi23UUpc0WBrhx
         0L9YofpBPB2B76qRX4o1Hr2dLPAKCnJ3fWS2jAVViOWVNF5V2TCNNXDTBhAngECae8Ma
         ROFemUEQ1rDh+4kqei93FctF4VIJgQJbMEnacgmICreSk0FUE1K0zuWKJ8AOvKoG+pjS
         gsz7hR/UD1NBBF+aw2Y/U/D3HY85vh5YaLWI6O4W2ldrGjBRcfsO1ZxVplKCRsORtoVe
         ZwK5NYIw/iw/eyYrI8pMGX1MlerGjdkE4ePUrDtKuzmtSva6BcxioG1QBSDMLVcrDnWH
         urag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569102; x=1764173902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fv3JnFDC0jik+shXFRazxf6/zTl+pNpZZP8z8eh7A8Q=;
        b=VEmQOvWVwPmEWEjr6HGwPKhvF65XfLQm4nm8oevb4KL7+P7/p9ZuuRG6EVx0QyaqT4
         OiBEVfHZef05KqhdXqodOsZ+WFCKRZZAT1DmlmBgiKAU0j+hy1cyfRkjBZk0TEpejQ70
         iUUHlvaWyfMbp7yJtBu/wBWd7cHUGOJhveLb1WGd+H1foabjGr2RagrOpOJQg/PIhyWJ
         yQbmIXbUnPs6J7yl5s3BDn2olEpSbCxSxM5cXCKIgNqwJxFQeo4HlOb5XTOd8jaA91Ty
         m8eTpXfp9/F6FIZW+hKpLJNUlZvu5S7j8CiMKeIU7vaRQc9v/NJGDI7U7ON3KFubyzuY
         OuqA==
X-Forwarded-Encrypted: i=1; AJvYcCVvY29mqp7Ko5TYoIyEZBsbsu5dArQMJxGl5z0wnMpOcEOYX4FKAilWu04rMJpR4PYzuiGII0OobTkwgUBlEgGn@lists.infradead.org
X-Gm-Message-State: AOJu0YyreEpEQRrITZYcYfjSyHlBkrZd35JwqS9YD2k7nFI2uiR1ONS2
	LFBy63RGkKtMKkifC3Wq3P0Ssf47DmUR4tlSmjzohp2RlA1Qq65IL47+eKnI3qdE4U8=
X-Gm-Gg: ASbGncvT48oY3ioc33txkPANdQ5tYDxTdiLo/NXp/BKIIAmKRHYqTvnx5V2ZkSeXMJV
	fdzYywLbmyDkBjE1bI3lmA93U0B329lwQcO+dX+/i/JIOMWLA5tRWsSjho7ADbW8uh3GzXqrXEu
	M5DCjF2bZTMoiJMHtygkyegTRbGBoIke/v2x2wOVQBP0Grgwcg7KOxwGmoP+pIIZPVngV6SikK/
	NUsaUBWpNi0ut0st3xMhs9yvwdM4Grmfw9DwUGjnlKHg0DsuiMORnIbl35bmukCd3iMqv7zyfpP
	e2152+CpOFA+V7aHqE0tHb9YV+ur1bEaIzQ9xfPWetqYRjjusM3xligFyI4Z5SPvw1NOjKsFI5W
	oX0LxtkRlTVzIn6bOcyZf781R3GEugA5H1g1XB0h3emnfft8C1sqmHSR5budfc0oCnGAayf/D0c
	7mSOh71TQNy+ZdK1kudw3f
X-Google-Smtp-Source: AGHT+IHmdxTsICz9N512i9L283p3Q2gBYmhvmlMjINfcSMOJVvgePV8NVWPmyITDgHhdaid8NLhNtw==
X-Received: by 2002:a05:600c:c178:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4778feb2401mr186240055e9.29.1763569101830;
        Wed, 19 Nov 2025 08:18:21 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:21 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:17:59 +0000
Subject: [PATCH v6 03/13] coresight: Refactor etm4_config_timestamp_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-3-740d24a29e51@linaro.org>
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
X-CRM114-CacheID: sfid-20251119_081823_832005_B6BA79CB 
X-CRM114-Status: GOOD (  24.54  )
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

Remove some of the magic numbers and try to clarify some of the
documentation so it's clearer how this sets up the timestamp interval.

Return errors directly instead of jumping to out and returning ret,
nothing needs to be cleaned up at the end and it only obscures the flow
and return value.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 96 ++++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      | 23 ++++--
 2 files changed, 81 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 560975b70474..5d21af346799 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -642,18 +642,33 @@ static void etm4_enable_sysfs_smp_call(void *info)
  * TRCRSCTLR1 (always true) used to get the counter to decrement.  From
  * there a resource selector is configured with the counter and the
  * timestamp control register to use the resource selector to trigger the
- * event that will insert a timestamp packet in the stream.
+ * event that will insert a timestamp packet in the stream:
+ *
+ *  +--------------+
+ *  | Resource 1   |   fixed "always-true" resource
+ *  +--------------+
+ *         |
+ *  +------v-------+
+ *  | Counter x    |   (reload to 1 on underflow)
+ *  +--------------+
+ *         |
+ *  +------v--------------+
+ *  | Resource Selector y |   (trigger on counter x == 0)
+ *  +---------------------+
+ *         |
+ *  +------v---------------+
+ *  | Timestamp Generator  |  (timestamp on resource y)
+ *  +----------------------+
  */
 static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 {
-	int ctridx, ret = -EINVAL;
-	int counter, rselector;
-	u32 val = 0;
+	int ctridx;
+	int rselector;
 	struct etmv4_config *config = &drvdata->config;
 
 	/* No point in trying if we don't have at least one counter */
 	if (!drvdata->nr_cntr)
-		goto out;
+		return -EINVAL;
 
 	/* Find a counter that hasn't been initialised */
 	for (ctridx = 0; ctridx < drvdata->nr_cntr; ctridx++)
@@ -663,15 +678,19 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 	/* All the counters have been configured already, bail out */
 	if (ctridx == drvdata->nr_cntr) {
 		pr_debug("%s: no available counter found\n", __func__);
-		ret = -ENOSPC;
-		goto out;
+		return -ENOSPC;
 	}
 
 	/*
-	 * Searching for an available resource selector to use, starting at
-	 * '2' since every implementation has at least 2 resource selector.
-	 * ETMIDR4 gives the number of resource selector _pairs_,
-	 * hence multiply by 2.
+	 * Searching for an available resource selector to use, starting at '2'
+	 * since resource 0 is the fixed 'always returns false' resource and 1
+	 * is the fixed 'always returns true' resource. See IHI0064H_b '7.3.64
+	 * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'. If there
+	 * are no resources, there would also be no counters so wouldn't get
+	 * here.
+	 *
+	 * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
+	 * by 2.
 	 */
 	for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
 		if (!config->res_ctrl[rselector])
@@ -680,13 +699,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 	if (rselector == drvdata->nr_resource * 2) {
 		pr_debug("%s: no available resource selector found\n",
 			 __func__);
-		ret = -ENOSPC;
-		goto out;
+		return -ENOSPC;
 	}
 
-	/* Remember what counter we used */
-	counter = 1 << ctridx;
-
 	/*
 	 * Initialise original and reload counter value to the smallest
 	 * possible value in order to get as much precision as we can.
@@ -694,26 +709,41 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 	config->cntr_val[ctridx] = 1;
 	config->cntrldvr[ctridx] = 1;
 
-	/* Set the trace counter control register */
-	val =  0x1 << 16	|  /* Bit 16, reload counter automatically */
-	       0x0 << 7		|  /* Select single resource selector */
-	       0x1;		   /* Resource selector 1, i.e always true */
-
-	config->cntr_ctrl[ctridx] = val;
-
-	val = 0x2 << 16		| /* Group 0b0010 - Counter and sequencers */
-	      counter << 0;	  /* Counter to use */
-
-	config->res_ctrl[rselector] = val;
+	/*
+	 * Trace Counter Control Register TRCCNTCTLRn
+	 *
+	 * CNTCHAIN = 0, don't reload on the previous counter
+	 * RLDSELF = true, reload counter automatically on underflow
+	 * RLDTYPE = 0, one reload input resource
+	 * RLDSEL = RES_SEL_FALSE (0), reload on false resource (never reload)
+	 * CNTTYPE = 0, one count input resource
+	 * CNTSEL = RES_SEL_TRUE (1), count fixed 'always true' resource (always decrement)
+	 */
+	config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
+				    FIELD_PREP(TRCCNTCTLRn_RLDSEL_MASK, ETM_RES_SEL_FALSE) |
+				    FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, ETM_RES_SEL_TRUE);
 
-	val = 0x0 << 7		| /* Select single resource selector */
-	      rselector;	  /* Resource selector */
+	/*
+	 * Resource Selection Control Register TRCRSCTLRn
+	 *
+	 * PAIRINV = 0, INV = 0, don't invert
+	 * GROUP = 2, SELECT = ctridx, trigger when counter 'ctridx' reaches 0
+	 *
+	 * Multiple counters can be selected, and each bit signifies a counter,
+	 * so set bit 'ctridx' to select our counter.
+	 */
+	config->res_ctrl[rselector] = FIELD_PREP(TRCRSCTLRn_GROUP_MASK, 2) |
+				      FIELD_PREP(TRCRSCTLRn_SELECT_MASK, 1 << ctridx);
 
-	config->ts_ctrl = val;
+	/*
+	 * Global Timestamp Control Register TRCTSCTLR
+	 *
+	 * TYPE = 0, one input resource
+	 * SEL = rselector, generate timestamp on resource 'rselector'
+	 */
+	config->ts_ctrl = FIELD_PREP(TRCTSCTLR_SEL_MASK, rselector);
 
-	ret = 0;
-out:
-	return ret;
+	return 0;
 }
 
 static int etm4_parse_event_config(struct coresight_device *csdev,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index d178d79d9827..b319335e9bc3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -225,6 +225,19 @@
 #define TRCRSCTLRn_GROUP_MASK			GENMASK(19, 16)
 #define TRCRSCTLRn_SELECT_MASK			GENMASK(15, 0)
 
+#define TRCCNTCTLRn_CNTCHAIN			BIT(17)
+#define TRCCNTCTLRn_RLDSELF			BIT(16)
+#define TRCCNTCTLRn_RLDTYPE			BIT(15)
+#define TRCCNTCTLRn_RLDSEL_MASK			GENMASK(12, 8)
+#define TRCCNTCTLRn_CNTTYPE_MASK		BIT(7)
+#define TRCCNTCTLRn_CNTSEL_MASK			GENMASK(4, 0)
+
+#define TRCTSCTLR_TYPE				BIT(7)
+#define TRCTSCTLR_SEL_MASK			GENMASK(4, 0)
+
+#define ETM_RES_SEL_FALSE 0 /* Fixed function 'always false' resource selector */
+#define ETM_RES_SEL_TRUE  1 /* Fixed function 'always true' resource selector */
+
 /*
  * System instructions to access ETM registers.
  * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
@@ -824,7 +837,7 @@ struct etmv4_config {
 	u32				eventctrl0;
 	u32				eventctrl1;
 	u32				stall_ctrl;
-	u32				ts_ctrl;
+	u32				ts_ctrl; /* TRCTSCTLR */
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -837,11 +850,11 @@ struct etmv4_config {
 	u32				seq_rst;
 	u32				seq_state;
 	u8				cntr_idx;
-	u32				cntrldvr[ETMv4_MAX_CNTR];
-	u32				cntr_ctrl[ETMv4_MAX_CNTR];
-	u32				cntr_val[ETMv4_MAX_CNTR];
+	u32				cntrldvr[ETMv4_MAX_CNTR]; /* TRCCNTRLDVRn */
+	u32				cntr_ctrl[ETMv4_MAX_CNTR];  /* TRCCNTCTLRn */
+	u32				cntr_val[ETMv4_MAX_CNTR]; /* TRCCNTVRn */
 	u8				res_idx;
-	u32				res_ctrl[ETM_MAX_RES_SEL];
+	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
 	u8				ss_idx;
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
 	u32				ss_status[ETM_MAX_SS_CMP];

-- 
2.34.1


