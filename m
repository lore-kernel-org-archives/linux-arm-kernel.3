Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00454FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFaRGwKwcB4UEZe1cHPn1QebdGoufLB6lmAYhWEeHLs=; b=VuX/CWqzoue91CMG5O+YokU8aa
	kmFUzEs3iDmx1lFM4CyAL56/mFx+OjJRc6ahdPYGXyytKFQt4NEHnJeWpZpKuiO1oMthP1jyu5WeE
	MBr0wU2qjB9S4aqTEI3rmlRj1E0yWinGmWVZ4XUCOLWvRCoqK+UbU6/Ya5iIIKLaYaw4jjiNwStgt
	WGF++1wh4W9imm/unpKdJp+mCBlyxJrftWjpLcCKgt75t9pz0tPsSUorHDT/fq5xRYfsMOpbLjVfO
	BGDZS/POsQE6Erj27HDJMIFz+A75TZjFtLuibgyhunhZEN3wAJ8N3+gpDBsoYij114uicimxfPgHW
	E4wQW5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhOx-00000001PnZ-497L;
	Tue, 28 Apr 2026 12:18:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhOt-00000001Pjy-0sYi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:18:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891cd41959so96535675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 05:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777378729; x=1777983529; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFaRGwKwcB4UEZe1cHPn1QebdGoufLB6lmAYhWEeHLs=;
        b=gtah/cKXc0W7RWQmNXhHzQY0lv+Jg450+0+1gTijOVOIZjpdMZHvD7BZ5i3CRgUqMX
         cXLosFCBjExnwb0SHt3FO06+uH3v1bBGXuyiMIaRAIlu0rmK0qUrJBnvF5woncyqb0Qf
         NATzbk+vfUrkRjpdBbKoWoC/x3e8tCV74FzBvNDhwq+yx3Z3Nmoggz0Cpyt5xq5BPWye
         pGIu2pLr5jGsZ5fhXytDYf64knHzpn5S6MxzdE7XBe8OCveZGSY4OtIBLoLii+hwfgxw
         4n42piKKoTIINN2iL15vpTqP9qH/Ym30+91mI5jNmAV5gosGxLvIEizgtI1df9xiKFbe
         pS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378729; x=1777983529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hFaRGwKwcB4UEZe1cHPn1QebdGoufLB6lmAYhWEeHLs=;
        b=R9QRJFTAh9WZVN3Q9o9/RWBKXIjSbP9BVO1gf3BMNqzsdhYjxhLmh0FszXpJBOBX2X
         b0qFq7zM/7DaOiDEddOE+rp16bVfAQZyEkryCGXEBiLj41+bf/pWZEAEWmJ9lpAvEhLc
         jUNQO9xAcA02WojFfinTyf/QBq3Z2XKrTd/2JdQyz9DuQN7RHkIAMINVm2nSaCTb5oyw
         RA8cScCFLitp6iFKeGHd1HDlRxLwr1XFVVRbpcji428vDeDGl6d5wTswemgdmdNFozpL
         7JCW+49BgtFXGZEG3C7A5AowB162I6gZf6EIps30cq0iwfv7/+iHXKjVE1XA8HvYgjJv
         6evw==
X-Forwarded-Encrypted: i=1; AFNElJ+yIc4P3ePDEF7Xqu8po6EBCmdjGmLhzFZM5WxQDLVlibybT4mDMhJ7tuKmSqufHZbMnrtxm1SrvU5Xoek6yUGI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy1b7WyiTa6JPKsLp1oLQvm0NhRB93NwSqCw4sr/j486cU3wMr
	uPzQyVqCfmE5Qm1dx9Y7GGa1uAyLQUN4g6yxZExK3KUY/426XLUnrDyapSe2gKnmR0A=
X-Gm-Gg: AeBDietgbtCFu6F+ANl0DRa9sQIzoHOIJoPifBpqDmviT2NXHSXN9U6AVU5JBkP3AS1
	sIkLLtYK/Kt0+iIX+y9FHFCIbckDWj6DqYUkBM/O8tseFbaQOZLlZ1ZKzZINQQkMBveBliT+6Ch
	hI2J4oYC/HFAaJhsTDch3eCfLT+iP6fdFUNv0saPV7PIdDkthumFcDDYvupJ07UklV8QkpeUByY
	eo+lJQCo2i4f7FirgswuhPtFS9GXSQE2JCeIEr2VoawYKzwdpSWfHcIO8asiF0Ln/7tzwpYp/Y9
	Saq4+hGLg9a2INV6a0WjZe3lV7XfMw9pmV/DefS/BN9DBWuJTKRVuB1xS+1+AxI38eY3heFZcqv
	20Ukg73jQVE4uDoIFNapfu2oeMUzh8711zDj9feM25q4e4/0ek+AlwlPKx797rMf0pmn9qEtSMM
	wvHFNvwrzMT4+6umjTQX/EdjrKqeRBOVKgCyVlsG6YiTCQYHMoKQ==
X-Received: by 2002:a05:600c:a11:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48a77b1b405mr46646045e9.26.1777378729214;
        Tue, 28 Apr 2026 05:18:49 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748e622sm17851125e9.1.2026.04.28.05.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:18:48 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 28 Apr 2026 13:18:12 +0100
Subject: [PATCH 2/2] coresight: etm4x: Refactor pm_save_enable handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-james-cs-ete-pm_save_enable-v1-2-c7a90ca6f43b@linaro.org>
References: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
In-Reply-To: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_051851_281457_CF670A45 
X-CRM114-Status: GOOD (  21.57  )
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

pm_save_enable is a global module parameter used as a user input, but at
the same time is modified on probe. There are some theoretical scenarios
where the DT for one device says to save and another says not to which
result in one device not allocating save state memory but later trying
to save if probing happens in a certain order. We also couldn't warn if
the module parameter is used for ETE because the input value is
overwritten, then for the next device it looks like the user had set
a value triggering a warning.

Fix it by treating the module parameter strictly as user input and
adding a new per device pm_save boolean, and then add the warning that
couldn't be added before.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 22 ++++++++++++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  1 +
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index a7fb680dd383..915f348620d8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1366,20 +1366,30 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
 	}
 }
 
+/*
+ * Take the global pm_save_enable module argument and setup the CPU PM save
+ * setting for this device.
+ */
 static int etm4_init_pm_save(struct device *dev, struct etmv4_drvdata *drvdata)
 {
 	if (etm4x_is_ete(drvdata)) {
+		if (pm_save_enable)
+			dev_warn_once(dev, "pm_save_enable module option is only for ETM4\n");
+
 		/*
 		 * Always do PM save for ETE. It always uses system registers
 		 * which will be lost on CPU power down.
 		 */
-		pm_save_enable = PARAM_PM_SAVE_SELF_HOSTED;
+		drvdata->pm_save = true;
 	} else if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE) {
-		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
-			PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
+		drvdata->pm_save = coresight_loses_context_with_cpu(dev);
+	} else if (pm_save_enable == PARAM_PM_SAVE_SELF_HOSTED) {
+		drvdata->pm_save = true;
+	} else {
+		drvdata->pm_save = false;
 	}
 
-	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
+	if (drvdata->pm_save) {
 		drvdata->save_state = devm_kmalloc(dev,
 						   sizeof(struct etmv4_save_state),
 						   GFP_KERNEL);
@@ -2037,7 +2047,7 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int ret = 0;
 
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+	if (!drvdata->pm_save)
 		return 0;
 
 	/*
@@ -2152,7 +2162,7 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
 static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 {
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+	if (!drvdata->pm_save)
 		return;
 
 	if (coresight_get_mode(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 89d81ce4e04e..6472677f3098 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1078,6 +1078,7 @@ struct etmv4_drvdata {
 	bool				lpoverride : 1;
 	bool				skip_power_up : 1;
 	bool				paused : 1;
+	bool				pm_save : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;

-- 
2.34.1


