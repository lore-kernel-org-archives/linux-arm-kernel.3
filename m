Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E80D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cuw09+mpuhIYFNKi8DQQhaPDq5r/kQhVj2hTbI63flY=; b=xF4JW06WW8PL/Aun+GR5sWRMsf
	HXRZoyXI3N/+63qD18m2XI9gb5VYWrrFkVTvJZwDXaJlJqH/+BEFcEwAkD0TJoqmY13z+qMxPnQWb
	E+iI0JPR15iynRE2uAeZw5I/6mBX7Cve9WaXFeAMIwrm8NffcDTfuMPDVKMXKDRkdz06lWLzHCj4A
	qx542SUO38dlpzXIFb7cgOIrtW+95Jd6KLEXDej5XhFev+pC2LEVHJeOkEox67uWUqox6rmw8adAK
	19t/c7B2gBtFoBz2iv1Gdd7fQ3U5a2JyE+rqH+kI+uP/WMM4kEhQSmQL0u6Oqf93puHOwSXI8yLdv
	Wkctbwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx56-00000000NoT-2JDX;
	Fri, 28 Nov 2025 11:56:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4r-00000000NgI-3rZB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:55:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so10580555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330952; x=1764935752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cuw09+mpuhIYFNKi8DQQhaPDq5r/kQhVj2hTbI63flY=;
        b=oaYC8LRkE/oUDWWvCEeE25buApcChHmk6G6YQwfUz8Ng+7Vp6KmN6V7NFC5kjRve17
         2DUuJfLDpBv24ZqXira6RHKzBxQbPIqSQZJuAwrZyTSzrEyjXymqkg0MrGHgYfFV7zLt
         OFE2Sl7F0gJAwIsWBhVktPjDbbrspBH7cQe54fLmGOH6XUl98wiZ0kxCx8AA34f896U7
         ANx2cC5sNY43KYrOuFBZFP33Kt3EKGTQo5Cwi9uNA+096yK6eP6gAFkcl5+9aBPPY8Ni
         05KSSBthRVrrj++bFZKrhWqAuKm6YBvHjfD/Ghtf9TIISqliYLx5EtjbJiWpQRsd3EFy
         Ldcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330952; x=1764935752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cuw09+mpuhIYFNKi8DQQhaPDq5r/kQhVj2hTbI63flY=;
        b=rgBZkP34aLIjdUnGu6j5MgSuSrlbPGnXz5QPTCRaKOMsxnQgxFPVmdt3V8ILCLAbHI
         ZfD2qRfmbcpn2JF9YjZB4BmA302lqNgXpAmt6p4Wixh+2D9on9hQO5g6H0XnLyJVjWHf
         x2PcmN1xTsuZC0FjZGfmn2zI9Z70CV1WoLG/tWQr/tHvf8h0LLBgGR+wxCp0IFD46V1l
         HFwwU7yRn8hsBShYBaJohfRvdegUdaNh3PM/jyGrsoIXeY+Fp66duWazVUfnsBHLPLOo
         ZXEQ674IECelG1WA0jDb9hYO7pCE6/6QnXrJZcnIySb4r2+lIkLiqrwks8qIaAhqnFMz
         JA6w==
X-Forwarded-Encrypted: i=1; AJvYcCW8KgDg2db9dOZsGkqzsCdtZvwf865lk3u8gpiYa1VrQ+q6YK/4qedL+4I5R21V3IcXJ4H9tUhybyg2whpnWkEy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs5itJyM+3K/TcdNT72A7vWDSjuHkwi3VCKI8oa0vxfVeMWN8A
	k5atGUAdlkyM/iTzrVJ76aIU3mAAUDQ+MotFFbO+AK/Dp0Nb6KET33RVARnayyiblLo=
X-Gm-Gg: ASbGncvV+iNcH6BRwdrsl2dtJ+vvVUiuXvhrX/Fx9fns7GNriog+9BVsvRIP31NjPmm
	fm+XlNYL21SXwi++AQ4qLP76sMnntmEiFURT5EttHHEe6qHKxp1q3osUd1Md3rwbMUBBRYGuNBD
	bq2j5PUI1alQw6YhZiO+u00HTqI6He0Edezw/Dq8kpEY4gdWg4ITDgtxxDpue8wpvFHVldMlleL
	4GPetb1cbjjaQWuLQPiuV+gnf8quen7Dbb0ze87lS7hcwpZE6x3Q/gPpgMsR0k3dA/GGnZNWEU1
	/JMrRDK0FPddCaz+NLTk8rP3KubFkKfiEBhbMDZfZzn9wIAgpYmCiIMjZCm8KSwlYcuhDlhKyDw
	ByKteX/0aZYs9f4DkvOtwaUndNby4AKGFVbrEa5Vn6HjqIBaewASJUCWZU9bsxv0QW/bJy0dMvi
	ooTTDFR9sJj97comXhoByF2r1wH1rfCRM=
X-Google-Smtp-Source: AGHT+IFgEnXjtO4cXfxAM6inpDQihSyQc7Tv9HUFntpcRVF6PXqQFRNyhWq6X1yHq6mFLoSoebTg0Q==
X-Received: by 2002:a05:600c:4694:b0:46e:4246:c90d with SMTP id 5b1f17b1804b1-47904ad06f3mr141247395e9.11.1764330952004;
        Fri, 28 Nov 2025 03:55:52 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:51 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:15 +0000
Subject: [PATCH v8 03/13] coresight: Refactor etm4_config_timestamp_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-3-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035554_026755_703AF2E9 
X-CRM114-Status: GOOD (  26.28  )
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

Tested-by: Leo Yan <leo.yan@arm.com>
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


