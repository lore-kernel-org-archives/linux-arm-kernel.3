Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B3CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh23cgVTrsuEAgMOdQ2R3Fyv92omKUsnmPcgOaLOE0w=; b=yDI9zz20A/oho92CDiykKMx+q2
	XTiH5R492bJ3uoKlNU+ui8MmV7jkX3LFO79d0zHwBQ9+bOh+Ttf+KB7grHxiSQtedmyonIstbqNyU
	mv9e2jC85G1XxXcAH6rYYyc6iiLtW2F1CUHCnkdr+YW8n/LRt3AezthW/vLi7XVa6gpoMX4oU4C02
	2gIOPzXh2Y3ApuQ5HwndXKj1YQB5pBu45ffHoShLTGaogS7HIPv39DkLfC0hAm0shYOF8UWv3IGdp
	RRI6xWFjfw+rnYw24oIY+2NrIvhZhfMbd5HdDMkbsFnyGn4ch8zuy1dnrJxNgwV2lKQFEcNsYNJ7X
	7RWS88zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgJ-000000092Sz-2W52;
	Wed, 12 Nov 2025 15:22:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgC-000000092LY-2uFG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477632d45c9so7160015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960959; x=1763565759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wh23cgVTrsuEAgMOdQ2R3Fyv92omKUsnmPcgOaLOE0w=;
        b=jlDJKYxfrSUwe2D6Rv43CWAXiFGjWdDA4VjZyv50y1EzzYsjyCwcPUB2hSKFy+dxrQ
         Rf7PKx+16bGdwI/pPnGHs4oVzMPziUQBCXbkteDFuq+jWDBmlq1K9jLuMlhe4+/cvJIt
         Ft0eiGS77iCBHhMXjbOR8+MTUGlFtSM7nRmCfAcLn4GY2eqREpnO9wVL9koKAumyOte1
         TNoV/urAIdH04GNxQNXyScHZfLdOC6vGYK0w8sC31lPYf47Y7NQyDc2c3EkkrJZN0bRM
         MdzEut1E5BXPRLL52E8XzeWPs9mnkH7g09E+n7o4zF7vTDzxXrgYGSVwZSog97HztezH
         QT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960959; x=1763565759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wh23cgVTrsuEAgMOdQ2R3Fyv92omKUsnmPcgOaLOE0w=;
        b=JBnqoHWoQ/Fh5b7L1SHHcls4FwHHji5xNaWIr8b269FIx+QOieBi3/kJyE31WhZasA
         nLAXFF4hcPZNjSYSql/Nbp48U+nvWYiSjiCqzAc/kxM23UHNhVX3e2ETBRzJ3BCtvVEf
         r2FM052wg7Qh9XGI6XBUirDXBbgP5KUEncnWTnQ9tVde4ZVlv+eRvnNhq/4h4jUx06O4
         9ka7QCgmUVPWZty6qX+0SqbU6DFw4Jov1+2hBmSXf9GiA1BLn/Rib4i4+S+ZIfX+2cm+
         QGNWU6WRcnAmD4DncMZQufAFMbQY3H8+LADhL+93OpnNgBXDRDm5Slss2TTM0o1kSX0S
         u1lg==
X-Forwarded-Encrypted: i=1; AJvYcCXFh/wgUqEVuAcVWYwCr49RtXzgLb06OVI6ITWaDiVwzExnvpJEUEV9T0PvAyVl2i0SSJElpnPB1kjRttRaTCu8@lists.infradead.org
X-Gm-Message-State: AOJu0YxesD/onRess1hE0od8ygsdYTyvf55bRkz5hWcG2iPYF0RwYNyk
	CaNunFKJoSNy0i8yy0BLztvnPx06zN8AWjk7u0JJLAMQ5otasDKxhdcgj1WKSSJPGMg=
X-Gm-Gg: ASbGncvkIeCR4nYmNl5a1oumf+UVXHfIUrm4ID2MzHcevBOdaCNGaLbk2fJsZGV45ME
	0TguXFFuhiRXXpdfCHjrOUm/2/ApvtRHTNDLgwa54ru6b0UJRVdvBLDeFEN9aLNgRjddJ8euiqR
	Xoh9rLO99V2r1gWErXrIjXojhyAKYShVbC7Hkpx1iWXuAbSljECf3OecvVhMEx+Fz3+HKG+zZ9Q
	5ALX0w4iJZwoypVGiPHhcTGlWTMKIliClPUYaFwXiJSwldmmqEf7ntV3w+1jqc1oD2+RpaBneIu
	MQO3ATPuOTvx91/ZIo+GA9UJs6IwiRO4/V/D/SBT6axO3oQa7uNfUifHl2wkRKt7SWZp4V6A4xx
	NRsuIzwY4Lcwpb8TyGWZFUItIxsaAxnGRmiP4vPTVJ0M9Op0rTclGEzMWEMXO1MCD0N7+cxuxUr
	/rFspxIy1fMw==
X-Google-Smtp-Source: AGHT+IF+L/8DtFqvQEmvBjAnJLhDcKijbfYq7KDpw5oNA46EuTEQqeHPWKCbNq+YJQfVY3elkWIKSQ==
X-Received: by 2002:a05:600c:3b11:b0:477:6b4f:3fbd with SMTP id 5b1f17b1804b1-477870b935dmr27757175e9.38.1762960958765;
        Wed, 12 Nov 2025 07:22:38 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:38 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:17 +0000
Subject: [PATCH v4 11/13] coresight: Extend width of timestamp format
 attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-11-165ba21401dc@linaro.org>
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
X-CRM114-CacheID: sfid-20251112_072240_778099_7A8B2E5D 
X-CRM114-Status: GOOD (  20.45  )
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
index 1aa0357a5ce7..d4e294cd48ae 100644
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
@@ -800,7 +801,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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


