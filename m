Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53E5D10F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bwt8cEG57tdOF8BASxzVxlljz5Pjbs6lZvjUWFDTXHg=; b=AZl4AmD43/xXPDmGWZrxkfO4SL
	Jc7TCnY2eN+yHDN4TSGos8GrNnunNPZxNSSzf69amo2mS+tar5jIZthbcqSZMhgQdRRFUXm/JD7Z4
	oV6q6KxeksffCIFJhGF3y/uDeO55tdAZVAcg3+020dMGzouXCDmEDaUhOVlCnnYW8xpzo82mPg0zl
	k0PUcl8ylFUSWDLkXgu8w6DQEc4jYLv0l8hP3zejT/tKam00XThElqvKuUaH7qhjMc9oqryRwwABV
	6SBHol4Amw1WgK9YYRrcNVKkg1moYlha1MZ9572vS693H4L5q54MzabmMH5+QMMK1vr6QqfIEUm5c
	Kuqs5GcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODE1-0000000ErI2-1NRd;
	Wed, 26 Nov 2025 10:58:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDf-0000000EqyF-22tN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso43377215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154674; x=1764759474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bwt8cEG57tdOF8BASxzVxlljz5Pjbs6lZvjUWFDTXHg=;
        b=aa4aBGgROMLcGXt6dlKPxxaUqCWp3uSHn82f5r7jTLQG3SoAT9ZQIlHOPAboVDzwqv
         8gvhsnUJtDW/gt/EFyF/tdFo6BRnWJEpXlSipJZkjbOcpA3LgnUSXwXsYwjT494rhe1c
         9dVOshJg1wdqwcf+eZZpVj//Do3u3Yu95H9CcHrC08NxWM+1S050yEYxA9ekGDM+t4uW
         IShIuAujK/tQa8+0nR2i5KkmfEwlQT+kmoYqH4NDIiMzcee950/t1vZhTJXs+Oz11mFc
         VewqnRPBNL6pqzKIBI3GqhiOe+Gp6jqBHmHR9gOl0dht6suOTXxwAMaSFAn9/fVxg3ps
         fClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154674; x=1764759474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bwt8cEG57tdOF8BASxzVxlljz5Pjbs6lZvjUWFDTXHg=;
        b=sShq+Jb5YeRXziQialah3AUfpU1evBnUszRhoe4549Kw6C+JumfmppysXq72PwZFbd
         W61g50AlB5YaRRTa5GIvKZM9stkrlrHJEFv76CiWj7adwS40JGS7XxFTOz3i0QoWFKjv
         gzGcdMkQJZtBXY4bKi1W8uS53u1TyzjpTru9LLGWw3+1rXunT3wsMMhXEIJH9eoWrKrC
         c+O085rEKvA4Mdus3L+/oSGH2lLy9NtCUqKIPVy7LmSFrI3hUCCNinZlGMwH4cYLfxnZ
         Md/xjGhIjvdNznzg62+aKM1QYo65Vp3G7aiWG036Nu7DpKhgXPC4vE0OHWO+jzqcreaL
         JhBA==
X-Forwarded-Encrypted: i=1; AJvYcCX+O/9izcvgZEVpD5jXcR0I6MsuXilSi7D8cIILVL0gRdH7FmtlSF3KGM0W3wkfTjxcIaXmHguKQs7/QvEq0RyU@lists.infradead.org
X-Gm-Message-State: AOJu0YwRbQIM/I+SDh1FafuQAdsOOqyR4AYNUpj1Jh7RLW8TcbGbdKL2
	JC0wcWnhJYJM6Df5wgPR2uJQkFQSRIVczUDerHxRPpw4QtUVxblTThQDBxAo5Vnguxs=
X-Gm-Gg: ASbGncsNih1CEeFIzf8qSupDF0IVyZxDTpEkGOD07nGuGlnN/uGLpEmoRHElALOzhjJ
	ndK9APukcSOOENfhdsYHRUMFyeO6YkqX5HdKz3Pvd5VRYzIUEIsU4NeZGU6z1uyvr9BZHbMG1ZI
	HEul7Ihb23+wY50yT3NC4OJyHnxS3AhmdjIdoysyyXV7qoMYwgIFlVCCyiV4AMIkJ9GL8fSSCHg
	lPIq74vyV0zrsIhKBk2I8qS2c2SF8RttTHFSsIltWxOhT2k4lvO/A/iaJeYjadLuc5t10+Q2v0U
	/gYeE1GrdWRrWOcCe4DT/B29C1vSH29GNlowM3b2fJ5U5ZTUHAsqBCtbRaoC27G6T5h0yz+dIrR
	X1jTclfWUrqhqs5o/79sBqVyTGyafJADuJjMyH/3Sxxf/vLHxKoDzg3UH6zs8pT5T7pj7UDz+Cq
	9l0HYx6A6dpnCtM3oG+mkE
X-Google-Smtp-Source: AGHT+IHu3VMV/nia9zExacgXf1CG1quUw46Gmf589tkbMqB6kt7gsqIoCudhkMzjlBbUakuyMJJKdA==
X-Received: by 2002:a05:600c:4ec7:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-477c01ea075mr176599335e9.32.1764154673792;
        Wed, 26 Nov 2025 02:57:53 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:40 +0000
Subject: [PATCH v7 11/13] coresight: Extend width of timestamp format
 attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-11-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_025755_570646_564C26AF 
X-CRM114-Status: GOOD (  20.42  )
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

'timestamp' is currently 1 bit wide for on/off. To enable setting
different intervals in a later commit, extend it to 4 bits wide. Keep
the old bit position for backward compatibility but don't publish in the
format/ folder. It will be removed from the documentation and can be
removed completely after enough time has passed.

ETM3x doesn't support different intervals, so validate that the value is
either 0 or 1.

Tools that read the bit positions from the format/ folder will continue
to work as before, setting either 0 or 1 for off/on. Tools that
incorrectly didn't do this and set the ETM_OPT_TS bit directly will also
continue to work because that old bit is still checked.

This avoids adding a second timestamp attribute for setting the
interval. This would be awkward to use because tools would have to be
updated to ensure that the timestamps are always enabled when an
interval is set, and the driver would have to validate that both options
are provided together. All this does is implement the semantics of a
single enum but spread over multiple fields.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.h   | 13 ++++++++++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  9 ++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  4 +++-
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index c794087a0e99..24d929428633 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -23,6 +23,9 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_preset_CFG			config
 #define ATTR_CFG_FLD_preset_LO			0
 #define ATTR_CFG_FLD_preset_HI			3
+#define ATTR_CFG_FLD_timestamp_CFG		config
+#define ATTR_CFG_FLD_timestamp_LO		4
+#define ATTR_CFG_FLD_timestamp_HI		7
 #define ATTR_CFG_FLD_branch_broadcast_CFG	config
 #define ATTR_CFG_FLD_branch_broadcast_LO	8
 #define ATTR_CFG_FLD_branch_broadcast_HI	8
@@ -35,9 +38,13 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_contextid2_CFG		config
 #define ATTR_CFG_FLD_contextid2_LO		15
 #define ATTR_CFG_FLD_contextid2_HI		15
-#define ATTR_CFG_FLD_timestamp_CFG		config
-#define ATTR_CFG_FLD_timestamp_LO		28
-#define ATTR_CFG_FLD_timestamp_HI		28
+/*
+ * Old position of 'timestamp' and not published in sysfs. Remove at a later
+ * date if necessary.
+ */
+#define ATTR_CFG_FLD_deprecated_timestamp_CFG	config
+#define ATTR_CFG_FLD_deprecated_timestamp_LO	28
+#define ATTR_CFG_FLD_deprecated_timestamp_HI	28
 #define ATTR_CFG_FLD_retstack_CFG		config
 #define ATTR_CFG_FLD_retstack_LO		29
 #define ATTR_CFG_FLD_retstack_HI		29
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 584d653eda81..d4c04e563bf6 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -338,9 +338,16 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (ATTR_CFG_GET_FLD(attr, cycacc))
 		config->ctrl |= ETMCR_CYC_ACC;
 
-	if (ATTR_CFG_GET_FLD(attr, timestamp))
+	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
+	    ATTR_CFG_GET_FLD(attr, timestamp))
 		config->ctrl |= ETMCR_TIMESTAMP_EN;
 
+	if (ATTR_CFG_GET_FLD(attr, timestamp) > 1) {
+		dev_dbg(&drvdata->csdev->dev,
+			"timestamp format attribute should be 0 (off) or 1 (on)\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Possible to have cores with PTM (supports ret stack) and ETM (never
 	 * has ret stack) on the same SoC. So only enable when it can be honored
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index b457f182efbe..c7bf73c8f2d7 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -28,6 +28,7 @@
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
@@ -791,7 +792,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			cc_threshold = drvdata->ccitmin;
 		config->ccctlr = cc_threshold;
 	}
-	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
+	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
+	    ATTR_CFG_GET_FLD(attr, timestamp)) {
 		/*
 		 * Configure timestamps to be emitted at regular intervals in
 		 * order to correlate instructions executed on different CPUs

-- 
2.34.1


