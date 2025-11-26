Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB407D1037B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRll0z28PX9oYYWspSiraPmZN3ssbBscfFFFKlw+WKc=; b=OiWiD89fG/b7Pocohi8beUK+vJ
	FRRN2UowFvLiXIyjGOrgPUpnW8ExSb2rqhkEQVbLnKTOj+q4j8OE63qK15089XXX0r12pxDk0NSqn
	tqb1Ja/2tkhq9oUIhmmaIS7WwakE3vcmgZHQAXDZOxjzs7jDYa1FZWT+t7xJw6WLdxdM0Iv9pO6F/
	tVSi4tYP+dQFSRNteqJGg7lFHP0BiJ1Xd6TupToqEYKmgAuKC1frv98YBoBMjOdjZ1Z83nncl3amb
	wWTzadyFcvhuYzH5z4kKI1tKZMCtTIeG/oxKYvU6jeQd15xiHrRnh/7wNG//QITLtIBhLxHpVcMJI
	DutKsjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDc-0000000EquX-0wKE;
	Wed, 26 Nov 2025 10:57:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDW-0000000Eqor-2Ewy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47774d3536dso6023205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154665; x=1764759465; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRll0z28PX9oYYWspSiraPmZN3ssbBscfFFFKlw+WKc=;
        b=JpDam0bgaQfmzaTmsUThO0yjHvwhWPNzqHmlL2knXkGsDQj55bAvBK3pXkuXKmEcIq
         ZACIf44tRpuaHNn9eUjQqWetDbjrubp8jCIybr0CvtHeqXk+e2SbTk4TeA2ogB7t73YS
         wdwG7uqf5/4SDhVrVCqkxZyXVbIx3//ITxj8h0NiOpgKzkoV9JXxmI7FgocvSzn0avc6
         xM6zAa572Qo/f74eUZsI8W19W4zX8OrkZnUkgkBA7zKPTpyBt/Ckjf/rV/fvvTOtKHOl
         yqXtgykV5nt4+LgYZpwL1UxvCovN92wR9q4FC9TPdY/QKrb6BJNSSj7CbIwAY66//8X6
         mK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154665; x=1764759465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xRll0z28PX9oYYWspSiraPmZN3ssbBscfFFFKlw+WKc=;
        b=ilMOvCQNWlQRTmw0IoHi0FFMRI9kIhmWXpL2s2cH8ya4o+2ObKL5FLRdEAGdeH20iz
         hGuNxq4q/03vSBfBBY0/TNCGU/YOCQ5jLnvojG/fI+vYqe/kjXPlorGxwI00cso39KMx
         n8+EgrW1yYBbxgnWXLWX/uUOnjs+giFwHbfuS13NbCBrG17gjG2E2gr13h+bz6CGDJTx
         wmVRjFE67lpfGd9QhcSaBNEE5jTLbdw3NhNDu1zZ2j82hirQMV7AxA6vX0F08N7yOWhI
         1xbQpBuqogatV2b5CEjSYGbsbmJat8NwE2gFLwrJ1/W5/F1Lpbl6HbUqxxJa6Xj0DrHE
         jiag==
X-Forwarded-Encrypted: i=1; AJvYcCU6x72z3/m2nK2SgqNpF7Xjapp7XwI8vHeP67QBiHWGGQZchwi7pHeDPTjP32OQ4oss5I7DbWpe4N9beuKCvvA7@lists.infradead.org
X-Gm-Message-State: AOJu0YzgzVv2z9UVg0cSuYCJJrxUYMHQ+gPDM9mPgNnoPoLSCObIMToI
	pD42c1ww36T8IeX++aJDMS9uukYcb9rHbLbmT1AibDI2v4XlUfR/JoRF9ZmJ+lOnKLc=
X-Gm-Gg: ASbGncuUq6ZpFarClvPlHzr0n6tSqoHbFg8YBaAQsd0VdOrDgDL3HyQQsSmk174B18z
	HZZUmEW4lyOZaXY817Sj0WM+a+qTN51JkKD+v3qyptB4wpigsKFzqRflUxcO5s8JQkGvrjvuvjt
	ei6klJl/lC1fj6Y7V70L90gbQMXrUUqR17g4LlJB5Jpmsrj0q2Jwpbt5bXXiaxJYPb/gEnoycjp
	WoyP2nAGN4a4Mz0KNwsWksNr5Apuvma0m6WQYfiBXCXMxBHFXRuOqPx1ueKxiMRQzPogtKTbFR7
	vukP5uToJetstxrkY5vl4/3Sb/2neAdYSMSMT1nqAIUrhjCkF7k0gaGIaQYivPy8d0FVSGGHxGb
	T1xfV9DBvQnWQ89KnODi6X9XHI9+y2BVX/yWcOgFooY1s4XAAXUz+hTSF80FfH8Za4jazVDAtHD
	0JwVVWrdvSLF9e9C1XL4P7
X-Google-Smtp-Source: AGHT+IG+wSKB/nJlp2hdV7B+ZukcidbStJET4Io+vE4TA+UKP1A0EgQjVCYy5IHJP+9G/aovhCo/hQ==
X-Received: by 2002:a05:600c:204b:b0:477:9d31:9f76 with SMTP id 5b1f17b1804b1-477b9ee4fd0mr168302815e9.12.1764154664628;
        Wed, 26 Nov 2025 02:57:44 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:44 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:32 +0000
Subject: [PATCH v7 03/13] coresight: Refactor etm4_config_timestamp_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-3-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_025746_713582_5166F782 
X-CRM114-Status: GOOD (  26.55  )
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

Add utilities for programming resource selectors that do compile time
checks for constants or WARN_ONs for non-constant values. FIELD_PREP
includes compile time checks so we only need to add an additional
BUILD_BUG_ON for resource == 0 in pair mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 96 ++++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      | 54 ++++++++++--
 2 files changed, 112 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 560975b70474..2ec2ae1fef58 100644
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
+	 * RLDEVENT = RES_SEL_FALSE (0), reload on single false resource (never reload)
+	 * CNTEVENT = RES_SEL_TRUE (1), count single fixed 'always true' resource (always decrement)
+	 */
+	config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
+				    FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,
+					       etm4_res_sel_single(ETM4_RES_SEL_FALSE)) |
+				    FIELD_PREP(TRCCNTCTLRn_CNTEVENT_MASK,
+					       etm4_res_sel_single(ETM4_RES_SEL_TRUE));
 
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
+	 * EVENT = generate timestamp on single resource 'rselector'
+	 */
+	config->ts_ctrl = FIELD_PREP(TRCTSCTLR_EVENT_MASK,
+				     etm4_res_sel_single(rselector));
 
-	ret = 0;
-out:
-	return ret;
+	return 0;
 }
 
 static int etm4_parse_event_config(struct coresight_device *csdev,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index d178d79d9827..89d81ce4e04e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -225,6 +225,50 @@
 #define TRCRSCTLRn_GROUP_MASK			GENMASK(19, 16)
 #define TRCRSCTLRn_SELECT_MASK			GENMASK(15, 0)
 
+#define TRCCNTCTLRn_CNTCHAIN			BIT(17)
+#define TRCCNTCTLRn_RLDSELF			BIT(16)
+#define TRCCNTCTLRn_RLDEVENT_MASK		GENMASK(15, 8)
+#define TRCCNTCTLRn_CNTEVENT_MASK		GENMASK(7, 0)
+
+#define TRCTSCTLR_EVENT_MASK			GENMASK(7, 0)
+
+#define ETM4_RES_SEL_FALSE 0 /* Fixed function 'always false' resource selector */
+#define ETM4_RES_SEL_TRUE  1 /* Fixed function 'always true' resource selector */
+
+#define ETM4_RES_SEL_SINGLE_MASK		GENMASK(4, 0)
+#define ETM4_RES_SEL_PAIR_MASK			GENMASK(3, 0)
+#define ETM4_RES_SEL_TYPE_PAIR			BIT(7)
+
+/*
+ * Utilities for programming EVENT resource selectors, e.g. TRCCNTCTLRn_RLDEVENT.
+ *
+ * Resource selectors have a common format across registers:
+ *
+ *    7     6  5  4     0
+ * +------+------+-------+
+ * | TYPE | RES0 |  SEL  |
+ * +------+------+-------+
+ *
+ * Where TYPE indicates whether the selector is for a single event or a pair.
+ * When TYPE is pair, SEL is 4 bits wide and using pair 0 is UNPREDICTABLE.
+ * Otherwise for single it's 5 bits wide.
+ */
+static inline u32 etm4_res_sel_single(u8 res_sel_idx)
+{
+	WARN_ON_ONCE(!FIELD_FIT(ETM4_RES_SEL_SINGLE_MASK, res_sel_idx));
+	return FIELD_PREP(ETM4_RES_SEL_SINGLE_MASK, res_sel_idx);
+}
+
+static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
+{
+	if (__builtin_constant_p(res_sel_idx))
+		BUILD_BUG_ON(res_sel_idx == 0);
+	WARN_ON_ONCE(!FIELD_FIT(ETM4_RES_SEL_PAIR_MASK, res_sel_idx) ||
+		     (res_sel_idx == 0));
+	return FIELD_PREP(ETM4_RES_SEL_PAIR_MASK, res_sel_idx) |
+	       ETM4_RES_SEL_TYPE_PAIR;
+}
+
 /*
  * System instructions to access ETM registers.
  * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
@@ -824,7 +868,7 @@ struct etmv4_config {
 	u32				eventctrl0;
 	u32				eventctrl1;
 	u32				stall_ctrl;
-	u32				ts_ctrl;
+	u32				ts_ctrl; /* TRCTSCTLR */
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -837,11 +881,11 @@ struct etmv4_config {
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


