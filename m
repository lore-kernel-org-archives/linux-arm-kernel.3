Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E311E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 23:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFJqUzl5fdNVuBn3sGLREmqduf2d1M+FGHIvccO18JM=; b=DNOVepgwwC2cAPPAvGU+YRyFl+
	acoxbOX/eb6OySOv1laJYejpGHojWqRjejL26VhTulywiOv33rDwubufaKLO7f+p5PT9q91B2Y0Ri
	BlHDLxIPHw9jB6xadm1XbwRX8eRSqg+fR6c5HZoTE5saBN3JPI2kT3MO3uEbRqhdacJT9dneRAEKX
	uuQbf0J9Ol5mSDNA5y9A22AF2Pb+pD/p3lKjz8rGFOWZR2E23e9bHlOEsN3fyjl1C1nYRvgc6m0gI
	MxVxCGAPxj5AFjxv4SRcsDckw1SiWGYELLbqH2IzndyKSrP4cNy/epIFNUG2RNhLonAsGZcGGW1no
	Iu3sA3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO35u-00000000HYw-3bpY;
	Wed, 18 Dec 2024 23:04:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO32j-00000000HAk-2fRB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 23:01:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so2007315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 15:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734562884; x=1735167684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFJqUzl5fdNVuBn3sGLREmqduf2d1M+FGHIvccO18JM=;
        b=GPBBj8cFkXOm0Al7vy/UXLbEqQ4BrLSsa1r38ja0y+YtOAMWvYMdI+dqYDueWUEQ/s
         byKkbcYxslfhxH40wIpC02DU+DyDuIfe4O+xr31SJuNl92YLP4iehjmP0PoxpfJJor+j
         6XhroqP8mh20RRp9tWaQM+YELOi1F3vOShKBJwLU2kMGVMD7wc6jDf9CnkwT292I6Ie+
         DHMUCksuv1uUgCRqWbOvTQ0bkmVm21XuJCdd+f6w0xyrPilQklsvjjkNLjLRQ9oYkQMW
         lFHmg22xtLBOKl59QwvdeOeb8U/fSniu3qP1GNvcYRQesPt2kY9O4OfbCyhk6wvhkRXm
         fGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734562884; x=1735167684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFJqUzl5fdNVuBn3sGLREmqduf2d1M+FGHIvccO18JM=;
        b=nhoncgmpox1RLTKsryOwGvj2Cssmuca4P43CfTT/5Fb/oMbec0K3hX+m2pJx2lcT/y
         nFzmFjULcbmlUtNuRtldfKnXo5tKQBKnZSCYr+ARgdU3WcSf9GncacaWDqkKY5L7ZUWt
         ckKNpmumh0IBI+xgTuoYU+DCW6lYjZI6jITTGg9bXb465qcck6b5PF2bRKQJLBhs5lpr
         S5jRiKlX1qJPpB4YlpdXuTesajq3kEfAyWC8lSnOhPgeYsME7Mzu0pS+4jj763mm+HbA
         pzr6G86HkrMB97sFG5msOaN8MWkU4LaV5nycan/y0UwFXDFwqVcPfXilv/0YXYHSDId9
         fgig==
X-Forwarded-Encrypted: i=1; AJvYcCXqxwjH6RHfrNwVXKVAN79/PuCR3ThqAmkIrXX3t977JxCav/KMZrm3GedxA3fG+ZEoW2uPsEpRZ74joNm/6nqq@lists.infradead.org
X-Gm-Message-State: AOJu0YyQuy0RzJ5UAcbjxEAXxWEPDLUPJprCj94JhFreCu+/5GJTXlJe
	uJRnTBEM+saiKSXu0mqJxfE3eeJOhfk2p1gr0bg2OxFJjrVNUfmgWgsXRhAHBc0=
X-Gm-Gg: ASbGncsbBx0PcjAGFjoSV7dSq2J2J2WRvqgMosA3ejchQ8ipS0spEH0C0vDd79S74zA
	xjrluC6cEuGe2Xj32T7ZYZFzhU8QbZcgS+xENBzVb9iZYcxpWWn68DGmPvCn3wikx/IyG+9B/zu
	3uZgwtFdeKarHps/2AJCqCPqvKl5ywYQUup0uvcHt2ornIlZOUuEDjBhmso0vzqS9bAvxXHvyKy
	mfGgdX+/Xkw6Tymin0xdI9US4EKllr6BjiGJchUL+duOfgygiMl5i9SlDc=
X-Google-Smtp-Source: AGHT+IHJf8Ah5vkyUVf6kv8cjtnnLJhOZpe/rVCKKkvSo43Zhu7qDMGsL/5ZTN2knDnhDpQH7himWQ==
X-Received: by 2002:a05:6000:1446:b0:385:fd31:ca31 with SMTP id ffacd0b85a97d-388e4d96b6fmr5215883f8f.53.1734562883750;
        Wed, 18 Dec 2024 15:01:23 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:7895:12a9:ae3b:17a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b190f3sm33291835e9.32.2024.12.18.15.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:01:23 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Cc: james.clark@linaro.org,
	mike.leach@linaro.org,
	suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: [PATCH v3 2/3] coresight: tmc: Update error logging in tmc common functions
Date: Wed, 18 Dec 2024 23:01:17 +0000
Message-Id: <20241218230118.999859-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218230118.999859-1-mike.leach@linaro.org>
References: <20241218230118.999859-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_150125_671231_06785960 
X-CRM114-Status: GOOD (  15.02  )
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

Enhance the error logging in the tmc_wait_for_tmcready() and
tmc_flush_and_stop() to print key tmc  register values on error
conditions to improve hardware debug information.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 44 +++++++++++++++----
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 +-
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index e9876252a789..dff82facada3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -34,25 +34,39 @@ DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
 DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
 
+#define TMC_WAIT_READY_FMT_STR "timeout while waiting for TMC to be Ready [STS=0x%04x]\n"
+
 int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa = &csdev->access;
+	u32 tmc_sts = 0;
 
 	/* Ensure formatter, unformatter and hardware fifo are empty */
-	if (coresight_timeout(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
-		dev_err(&csdev->dev,
-			"timeout while waiting for TMC to be Ready\n");
+	if (coresight_timeout_retval(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1,
+				     &tmc_sts)) {
+		dev_err(&csdev->dev, TMC_WAIT_READY_FMT_STR, tmc_sts);
+		if (tmc_sts & TMC_STS_MEMERR)
+			dev_err(&csdev->dev,
+				"MemErr in STS reg waiting for TMC ready\n");
 		return -EBUSY;
 	}
 	return 0;
 }
 
-void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
+int tmc_flush_and_stop(struct tmc_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa = &csdev->access;
-	u32 ffcr;
+	u32 ffcr, ffsr, tmc_sts;
+	int rc = 0;
+
+	/* note any MemErr present when stopping TMC */
+	tmc_sts = readl_relaxed(drvdata->base + TMC_STS);
+	if (tmc_sts & TMC_STS_MEMERR)
+		dev_err(&csdev->dev,
+			"MemErr detected before Manual Flush; STS[0x%02x]\n",
+			tmc_sts);
 
 	ffcr = readl_relaxed(drvdata->base + TMC_FFCR);
 	ffcr |= TMC_FFCR_STOP_ON_FLUSH;
@@ -60,12 +74,26 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
 	ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
 	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
 	/* Ensure flush completes */
-	if (coresight_timeout(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
+	if (coresight_timeout_retval(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0,
+				     &ffcr)) {
+		ffsr = readl_relaxed(drvdata->base + TMC_FFSR);
+		tmc_sts = readl_relaxed(drvdata->base + TMC_STS);
 		dev_err(&csdev->dev,
-		"timeout while waiting for completion of Manual Flush\n");
+			"timeout while waiting for completion of Manual Flush\n");
+		dev_err(&csdev->dev,
+			"regs: FFCR[0x%02x] FFSR[0x%02x] STS[0x%02x]\n",
+			ffcr, ffsr, tmc_sts);
+		if (tmc_sts & TMC_STS_MEMERR)
+			dev_err(&csdev->dev,
+				"MemErr in STS reg waiting for flush complete\n");
+		rc = -EBUSY;
 	}
 
-	tmc_wait_for_tmcready(drvdata);
+	if (tmc_wait_for_tmcready(drvdata)) {
+		dev_err(&csdev->dev, "TMC ready error after Manual flush\n");
+		rc = -EBUSY;
+	}
+	return rc;
 }
 
 void tmc_enable_hw(struct tmc_drvdata *drvdata)
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2671926be62a..34513f07c3aa 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,7 +259,7 @@ struct tmc_sg_table {
 
 /* Generic functions */
 int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata);
-void tmc_flush_and_stop(struct tmc_drvdata *drvdata);
+int tmc_flush_and_stop(struct tmc_drvdata *drvdata);
 void tmc_enable_hw(struct tmc_drvdata *drvdata);
 void tmc_disable_hw(struct tmc_drvdata *drvdata);
 u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata);
-- 
2.25.1


