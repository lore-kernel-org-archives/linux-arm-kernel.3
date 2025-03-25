Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DA8C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/UNuURSLtrCWfGxAweNNVcnSfgmRZrsQu62GBrBcJ8=; b=Fr48aswJasfto7Ij78VOJHtwSb
	KNqB+jg+wb88fc836tZOd4LZAmxa+Zx9FhA0bUjFel/GYzQqw90zNS2KLbzsttxlmTmjUXcWeauqw
	2g3sAd24sm6T/qVu6XGx78hu/qDQQPWJp/QCQ5K+dKdtv9fcurolYqMoPnkpFtoiTpqhahZ6wKrzG
	Ksem7hHAqsSfRUYXdrtLqfeOgLSjriEBY5rLv6ZivrbcTFV+Zd/FuBsFWUpOqgl6ufmxfdn9r3V7F
	RooQq0pLv19oq+zjMfdgGbSXwykkHMo1gd3uaDz/5wNmV2QXucpVW/vMeWlKgtn2C4ewLXdV1oniZ
	XhdquDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Dw-00000005mAQ-2nRf;
	Tue, 25 Mar 2025 12:17:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2w5-00000005iQH-1HOA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:59:14 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39133f709f5so2935818f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742903952; x=1743508752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/UNuURSLtrCWfGxAweNNVcnSfgmRZrsQu62GBrBcJ8=;
        b=M2GmtGYPZJ8Yvcz+WW2o1nE0aq5+eKb4HkkLCtP1F92Gxh5JhCXgM2TV19PQi8qPaw
         BgOhydBzrKez7FvLi+sNS1tEI4y4vr8XstfgoXXcxYiBV3zVWQs3Ckv1fpqKbBAs5IAk
         5ccLKrI1Yr7SDcu2BCOnX/ed+3oY3hhY7DBao3oDA4E7KoATRIytL6ykZ5+p/OUY4EP0
         JpabnhXiKbtjx6VADBhvbXcnF41y419Cze/ZvBw9zg+4RuMuTsPfENMrDC5HTOMBRKis
         U04ktQ1wJqb/1uSxkJ9898epjIPjQjK6HUbFeMmQHqpia5RbtYtZ/Gye5w+CZKRe2waB
         eJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903952; x=1743508752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/UNuURSLtrCWfGxAweNNVcnSfgmRZrsQu62GBrBcJ8=;
        b=kJwp8ZQntbWnMbVcPevdpvxC7Ne3AB+exi34XPwIFP9NZVKZaTDIG4XNQ+pgQSkcaw
         WEGtfGcaP5Adtz6zzSkLvrtYXnP5IuocK5g7MFdGdlTIfsvs8HrbS5XB67RmLcr0UK2i
         qEiwdwVljXh63JVRd1s29DrwnToYUyx3EcheCXMJz3dhjuQABm/KhlG/OKX1l7Fdz36F
         zMfQt4J4Ac+WCZ//gEKeTtdb9auxPwY/xeWQAllD1zH3AA2yUO7YycITZpRdl+H+UmUS
         nC2NDsE7lGwJNtOW36hnj478Vdpyso+5ZSn3cVCQJ7MkpAUeflrsC/eoMvJvYGy5Tv4r
         prSw==
X-Forwarded-Encrypted: i=1; AJvYcCVAo5qJMXsWw0T1lha1yzGWyNLuuIxWbtD0Tko+vyz3wBfaX9yW6MfjRqMRa3cLw/o+yMbSyjbZpn10By78uISI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+gmx3A4sWEwwLR9CZvve8Q5s0oVc6sLjCx4q9AKP1HhKrzw5A
	bSIzBLI33cSweklXdUAOirJ0bTrDcN6sKtsL0y+tB2KB6w67Ot03Bg779jsqxTw=
X-Gm-Gg: ASbGnct1og3+4QtKxTI9eCs1C2X8EKTj9iHeLbe9+Whm5pwXGnwAhlwZZTCGv2xVMY5
	fGx1LvWscTqOjqwqvzaDaIFQh4lo0M4s1Fq8mE5EFBe7W6O5UmfbJSOg0lltzzuM54mHo7pxU2u
	daICidpA6rFLebqwX4xamPFRV5DQZ+sCohkHjoC5jauHo8tteHp37m+PflZYcBycnpA/xEO8y2g
	ibpGFeZmg1AnogglZkzMr5cXuQBBVC7fJiPXnADahEcItpWlzyzKEqLgvtanqMADPZ/o9FAboFT
	Q0XQ90R89Zpf2O9sNomdpe2CmpZd7ha+Be5mxRSIqcqEFJc6
X-Google-Smtp-Source: AGHT+IF8Oewoyaq+XKBMLaCapfCjhogHik6lfiKnm8UQ3WRDy17FimEPzUr4FkQxrwT2uHaots6ZYg==
X-Received: by 2002:a05:6000:2b0c:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-3997f9389d0mr9529129f8f.52.1742903951913;
        Tue, 25 Mar 2025 04:59:11 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:59:11 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:50 +0000
Subject: [PATCH v4 5/7] coresight: Clear self hosted claim tag on probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-james-coresight-claim-tags-v4-5-dfbd3822b2e5@linaro.org>
References: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
In-Reply-To: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_045913_368948_6DC56496 
X-CRM114-Status: GOOD (  13.18  )
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

This can be left behind from a crashed kernel after a kexec so clear it
when probing each device. Clearing the self hosted bit even when claimed
externally is harmless, so do it unconditionally.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 1 +
 drivers/hwtracing/coresight/coresight-cti-core.c   | 2 ++
 drivers/hwtracing/coresight/coresight-etb10.c      | 2 ++
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
 drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
 drivers/hwtracing/coresight/coresight-replicator.c | 1 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
 8 files changed, 11 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index fa170c966bc3..deaacfd875af 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -558,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
 	catu_desc.ops = &catu_ops;
 
+	coresight_clear_self_claim_tag(&catu_desc.access);
 	drvdata->csdev = coresight_register(&catu_desc);
 	if (IS_ERR(drvdata->csdev))
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 80f6265e3740..8fb30dd73fd2 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -931,6 +931,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	cti_desc.ops = &cti_ops;
 	cti_desc.groups = drvdata->ctidev.con_groups;
 	cti_desc.dev = dev;
+
+	coresight_clear_self_claim_tag(&cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 7948597d483d..2bfcb669aa84 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -772,6 +772,8 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etb_groups;
+
+	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index cfd463ac715c..1c6204e14422 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -764,6 +764,7 @@ static void etm_init_arch_data(void *info)
 	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
 	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
 
+	coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
 	etm_set_pwrdwn(drvdata);
 	etm_clr_pwrup(drvdata);
 	CS_LOCK(drvdata->csa.base);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e5972f16abff..52c9aa56e8b9 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1372,6 +1372,8 @@ static void etm4_init_arch_data(void *info)
 	drvdata->nrseqstate = FIELD_GET(TRCIDR5_NUMSEQSTATE_MASK, etmidr5);
 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
 	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
+
+	coresight_clear_self_claim_tag_unlocked(csa);
 	etm4_cs_lock(drvdata, csa);
 	cpu_detect_trace_filtering(drvdata);
 }
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0541712b2bcb..7249cc356ccb 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -255,6 +255,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 		drvdata->base = base;
 		desc.groups = coresight_funnel_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
+		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	dev_set_drvdata(dev, drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index ee7ee79f6cf7..b2acd4535c74 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -284,6 +284,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
 
+	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index a7814e8e657b..a09579eff3fd 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -869,6 +869,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 	desc.pdata = pdata;
 
+	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);

-- 
2.34.1


