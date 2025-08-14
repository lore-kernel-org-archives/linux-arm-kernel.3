Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29BBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCFJWq6hVWDLLnb3WEoK3x2DCujP3OgS7K9EwJG0Zgk=; b=VtskxKyDfltk8GFuTsBhgX8zuA
	09fH3W3BEEAuYrewzCQX4seRaSC9bkiVXEyDZ9xwiSunK6bACa1FRtLXksOBc6EFtqceQQazmq34O
	50qaw7C5dqPJBIzcR9Jr7kYA7I9oNKwvbTRY6KCs5PrBqLtD9r2ImT6rkUFSbDRbEJZe0V6+QmAdJ
	4Gd/dF/fDM32K8wG5qlv+M+KXijJUrAYBgYsrloaz3JAA6UMUiKYxC2w6Z9KWspRrrPumGB24d83c
	A7diDHKHTFIjgd2sTUJp30hsqlaa8NgEUbOViCHQJ7QCoXiAunmfAqWnCJML0U14EkcSx2FdeweCl
	UEwZ4nSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0j-0000000HTJj-042N;
	Thu, 14 Aug 2025 15:37:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYS-0000000Gf9n-0TQa
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 10:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UCFJWq6hVWDLLnb3WEoK3x2DCujP3OgS7K9EwJG0Zgk=; b=gFMbA0PYxjk+ipaOWNE9egsggK
	GicnQzrJ3kTCEMlnmtgX2CQK6srtVeHh6OFHGiol1MJ2kGVElSWECrw/qi4O1S12Hb+ioAoNqHDNK
	vlmuSacPcyTCbgj6eK/WjiDPuHkv7giMz/aDusJBQMg7wEkpejzgAnIxSCdHHOB/0pqN3blIgGqw6
	Rln3pKroeLgOr0JxULafXGqsMDMXyqyCvCuh2S0eJe1GVdye/JjWIBG+yTgZvnaMPIUq4HJoOcYll
	h7wGNrhu2dz/jW5Qay5aYbycvuvi0qTL/jeU45rAsacMbGa1l1AOk8HTDHyfI52z5LRXNH74K/wci
	BKgjQxXQ==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYM-0000000GMl8-1lwu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:51:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b005a3bso3730665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168684; x=1755773484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCFJWq6hVWDLLnb3WEoK3x2DCujP3OgS7K9EwJG0Zgk=;
        b=q0981SNRuyvKHUxthhVizZYjcR8HFKDVDDToGepY5KfiNRv8jnIOX9+yAhUFDMR8NK
         tqJiLMt04/xGPO3OH4K/Qa0SMAlitSetbAAPF6MrTM8Rhs8852WAE7VmluhZCZ/MdXra
         /6p7kNFEK+m8r60NcLZjCZ0ixHqazNYTBHr5WONnhCP7Cafz6pxH8sPebR7bdsy2sjYp
         9HvRPBzRdb+xbGx4LVKvPTDDdwcTn/38yyZHmf9WIvlYrAiSaPjnxZivYSVOI5n3OP47
         QjPgd+O9kJd+jFdKJ0NLHgmtwvpayyzwZW3klVlETinfpJ7wKT78SP3jWZthFXJGhgO3
         jScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168684; x=1755773484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCFJWq6hVWDLLnb3WEoK3x2DCujP3OgS7K9EwJG0Zgk=;
        b=ocBnvtFuS+6rku1qtqIYXWHbhlzJ5zuN0zjXusSatmMxUIw3oi5390UNklPeDN6Eel
         YzioJ4XPzuUV2lNW8kDLt7Gj/SlGXqJb05XWDOqCb7OvffrMNfG/mspFQMuLBj/0As1I
         JfWSh0yDmlGnGYz/V4PrX6KyYCymbEZ0s7i/ud06vKspMGr3LuyB7jmjDFKeFbyR3wrQ
         JxtsFuJ2o1zql5G/yAtLH6PvZ9qmZt+Pzf8wyhQYygTqgPIP/YgD9GbRSKvKubu9HE1R
         zCuwVVtH6Ei+wLdZa+k4iJd6HTyrhcxepGXLMGpRvaOTS7jFpi/RnCnAldHMubzLOhdl
         g/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnfojeL+cstC714y7eTpe3Ah/36294cvSM0pdxL8BMZLv2QQSOGlVPsXkrNSw4hctuAbvBP11353bRlSs0dv8Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxMBYFzIoqv5Sd6N9jFeYL2O9kQCgeeswBihowsiRukSm1owytA
	Y86+hghBTSWqBUO4OKRAyUTYr36zsT6Bm2xIVOhlECcliXICyUQyPzrKMHG/baGSfD7Z5nTlh9l
	xma3C
X-Gm-Gg: ASbGnctLtt9lHst6LwuIzqNoFxRtS45u+PkIHIi+Zp2en96/310nfqoxqjqr4tVI2rg
	8BATOPiQFvTVrthfqE3cx3oWsNFSB/Vp7jM6Mh6W71+i/hzpO6HAKKR1kp0ChABLXOv45AwDufM
	RzcPbzLRDrlUPQ7GsUOGfh4pW4v34nKfePJSDUvqVwT09naMy8gWxY/ospSLT4HuDVm+x3zgKou
	0WwboWGuNCTxHHdCa3u+4pJjNALUBkUPXj8c7lxr1hJx8tlxy0hzt9qZVodEAyo6w4obOdWYWhP
	Ccd8fotcNVeLbwkoTgZTY6RW1OG3rOQudKuZIqNkY4GNn2h3TGZTHL4Bk23CcmzAkwO4p44iXGQ
	iIm3yReLeuo02oKnGVRrDexj2M445QYs=
X-Google-Smtp-Source: AGHT+IH7V3UbaGrUJe9fOSW+9cf1k9RfdPPJpO57OeoAxEN+FtVoytlc5UFLEqj9CTFJZLY7Ywq0nw==
X-Received: by 2002:a05:600c:1ca7:b0:456:285b:db24 with SMTP id 5b1f17b1804b1-45a1f8e2320mr1517955e9.28.1755168683865;
        Thu, 14 Aug 2025 03:51:23 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:55 +0100
Subject: [PATCH v2 4/6] coresight: Refactor etm4_config_timestamp_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-4-c76fcb87696d@linaro.org>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
In-Reply-To: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_115126_699054_FFC14EE4 
X-CRM114-Status: GOOD (  23.58  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 95 ++++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      | 20 +++--
 2 files changed, 77 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index cbea200489c8..1a2d02bdcb88 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -608,18 +608,33 @@ static void etm4_enable_hw_smp_call(void *info)
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
@@ -629,15 +644,17 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
+	 * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'.
+	 *
+	 * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
+	 * by 2.
 	 */
 	for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
 		if (!config->res_ctrl[rselector])
@@ -646,13 +663,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
@@ -660,26 +673,42 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
+	 * RLDSEL = 0, reload on resource 0 (fixed always false resource, never
+	 *	       reload)
+	 * CNTTYPE = 0, one count input resource
+	 * CNTSEL = 1, count on resource 1 (fixed always true resource, always
+	 *	       decrement)
+	 */
+	config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
+				    FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, 1);
 
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
index 1c67b263b01b..aaa6633b2d67 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -224,6 +224,16 @@
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
 /*
  * System instructions to access ETM registers.
  * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
@@ -823,7 +833,7 @@ struct etmv4_config {
 	u32				eventctrl0;
 	u32				eventctrl1;
 	u32				stall_ctrl;
-	u32				ts_ctrl;
+	u32				ts_ctrl; /* TRCTSCTLR */
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -843,11 +853,11 @@ struct etmv4_config {
 	u32				seq_rst;
 	u32				seq_state;
 
-	u32				cntrldvr[ETMv4_MAX_CNTR];
-	u32				cntr_ctrl[ETMv4_MAX_CNTR];
-	u32				cntr_val[ETMv4_MAX_CNTR];
+	u32				cntrldvr[ETMv4_MAX_CNTR]; /* TRCCNTRLDVRn */
+	u32				cntr_ctrl[ETMv4_MAX_CNTR]; /* TRCCNTCTLRn */
+	u32				cntr_val[ETMv4_MAX_CNTR]; /* TRCCNTVRn */
 
-	u32				res_ctrl[ETM_MAX_RES_SEL];
+	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
 
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
 	u32				ss_status[ETM_MAX_SS_CMP];

-- 
2.34.1


