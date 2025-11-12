Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40635CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUj0j3n1vb2Wu9GInL+qCS54uhf2SL5HLPcj1zO45w8=; b=HtueFWCN6l0lu7IilhT7RGoP5D
	dJLr9cFQVcGREeKfcNVKQoCCRGmaZP20JeMmRprYGgdVnw8F6jeXxwGqVUL9NotXsoAusr5yM7Gp2
	AkhYvsvhUYA5ibOKeb1HCftFi3Y6K2RiIPHG0gq5MbQ4Kyb61rl0cB+XDWT3CUh18JPJYQskhGq4s
	/b7TKiBc00y+5YexcWsCK6PU1t75hOyS0g2BjIpzZNpcrq5gzl2DsSjcE1YZ6eK35kn/e4O6LAsbP
	dw/4jZfaWNa4zt/jYGYOJzkkJYtwPtbw0yl8duphjTM7XjXZrp908kE6vVRndxPl/BGZ+rsKZTP2X
	OHWGUt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgI-000000092RH-3qUF;
	Wed, 12 Nov 2025 15:22:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg9-000000092Is-3gEP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b32a5494dso508024f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960956; x=1763565756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUj0j3n1vb2Wu9GInL+qCS54uhf2SL5HLPcj1zO45w8=;
        b=L6VaArStdN1oUocErtrW5yc3yjlDPbL7EcP4XicVxDfcFRUNaWDjyoSX0S7HqGsmLK
         qDRTaI7PCmzHcjZ9wUNQdNiETSAoRrd6TDj5FiudTD4tbslvfZ0wLy3hd3tTdTpM/A+G
         vocz9Nv//LuVDDtEmk4eH+ZvZtMlZtLi9tZT+cZgDzjY9KTxcW0uRMhcl1k/5cROil18
         rxYIxHhLtckDumNxPbEnyE1WMZLb16R8BtMnOpTEHlJYGhT4I/3z6rqVoFq+TqumOa/o
         ia1+/J+zk44fBJG0IQKsfPLX7o8lyv88O9ENba50jK5v+wu//ic4Q6P3FIH/T6P5RFvE
         cMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960956; x=1763565756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cUj0j3n1vb2Wu9GInL+qCS54uhf2SL5HLPcj1zO45w8=;
        b=iRqqJVBtS0qgS6SR/QVQ6MC9OZxNt3rqrOdsgEdSu7nPneH6v7+yAjBWd+WcDqGtA0
         3KrSlTN6vGBy5CMlNA8QrbPxplCd8UcZs+zEa08F63CddF+EIi05R/2MAY5mXyPlvUIg
         B22sf5DNnoQ3Z59Su1/C31Ecoiudmdhsqzx2OD8CgdvSDuWoEfF4dvUbfL+I+GnvuDWu
         y3wUYT99SILlaZJeEAiA1GW2iTCtKMU6OOunv8VA9ySpc9RRdBG7c3eZME4t5DoCruFv
         HlP43VW7XNlUEhgkeT7xHf46PeJjqHSFJm+98b4OJw+CIHg+BFQjoGUeWVsBdPaCNUW1
         NInA==
X-Forwarded-Encrypted: i=1; AJvYcCXVl9CcRLEu0fG4bk5pArgBrsEXHceImk+LSunD9dEuc7DzDL39+pqyBEui6i3RU0jxDrvTF+o4aSzxRttmsGul@lists.infradead.org
X-Gm-Message-State: AOJu0YyL0VkWmjdSU3ydVgMuv5mpI97Nu/Y/aqkcU9dOkUXPqImF6Azw
	SFBB+FcrMQGxVf86kqRXCrkNj+wJBY8261I/QjuU3kefvLq1J8ju+5/8VZzBcqZWEJI=
X-Gm-Gg: ASbGncvQHt4xhdz9UogKRwAX4NXFjlEC++rZwTqggWYV5RVScM/E1U6EVTFug1KxjF9
	A4++3vqq60IN0pPluCDBYc14jfRBdtspaLJMi1mIkBSPHiGSuaBDLW3s1D+tIms/BS3l8GzaUMA
	z7gHB+XQklsr5D/fdXSm3s+zTWCky40loX+L8GznKA+LCktNfVE9wvbiwDP3hFezK/YbEF3NqWW
	pGIttp8ZdrqdPhKKYyqg0rwb0ebbmDfwOo45RvHT2OMyJgU9RofJypFIQThAC2pWRDbcDejCoPF
	IfxJijPgZKTa6ULEtOWDyDQnziiUOY5+LF+L0/oUPSAqDotWXnRc9ZV6wLCUGq8Moz7oeUFUVj7
	FbiMQs8T5XUzpmpshLXYG8YL8kUvDiJ83BLiWPpWI1KOxbJyT1cAOpcsLQORXsK0nIwV12D06Sp
	4QobmseM2saw==
X-Google-Smtp-Source: AGHT+IFlw5Lz/ACVGaZYBTkar+BWPh1yCKM0EeqPcMg7SFjnpxyLc8kUfqQFePDdrWGjsDSOCoDNlg==
X-Received: by 2002:a05:6000:2509:b0:42b:3e20:f1b2 with SMTP id ffacd0b85a97d-42b4bb8b8fcmr2593627f8f.4.1762960956140;
        Wed, 12 Nov 2025 07:22:36 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:35 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:14 +0000
Subject: [PATCH v4 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-8-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072237_941653_19211CF0 
X-CRM114-Status: GOOD (  14.40  )
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
index d19e2568a0d1..7272e758aebf 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -80,12 +80,11 @@ static ssize_t format_attr_contextid_show(struct device *dev,
 					  struct device_attribute *attr,
 					  char *page)
 {
-	int pid_fmt = ETM_OPT_CTXTID;
-
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
-	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
+	if (is_kernel_in_hyp_mode())
+		return contextid2_show(dev, attr, page);
 #endif
-	return sprintf(page, "config:%d\n", pid_fmt);
+	return contextid1_show(dev, attr, page);
 }
 
 static struct device_attribute format_attr_contextid =
@@ -334,7 +333,7 @@ static bool sinks_compatible(struct coresight_device *a,
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
-	u32 id, cfg_hash;
+	u32 sink_hash, cfg_hash;
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
@@ -347,13 +346,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
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


