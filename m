Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65713D69104
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zo7/3gUT+IQw+k2qVNpV0TR7aOCWRkGfGTG2g3pxuLw=; b=QJ/B2QwxRAwKZJnpTZqLFA/Pic
	LFerIbHhTHRBz9p2Dgm+bYNaAbxDa80VoHX5oDHbhMp2T5Cnq+H1yBh++IDnTWRrh3n42C0cJxrQB
	AgsnqcKb+uokd6wXSCLEeBuC57GgnnpYFaJQcVFWkKCg/q9VCBFLxpp9m7pOWH5D2hEPyf2Ozhkq5
	FZOf/pwOoALW5P0QB8XAb45ym7esJAYASxI6l2U6nklgf+wurI76ijNLOmQ/8y49m6oEGhk48Ch7h
	j/YhTPH8CDBtlOy3UsQlxic241vjLaglICfYxgRyCUU0JhDM742NfIXEOpPENc2ZXKLiPZyakhZqT
	pw8A8/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdRv-0000000FSOI-2tw2;
	Thu, 28 Nov 2024 12:16:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdQv-0000000FS8H-2hPP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:15:47 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53df67d6659so989711e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732796144; x=1733400944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zo7/3gUT+IQw+k2qVNpV0TR7aOCWRkGfGTG2g3pxuLw=;
        b=wyj73hmVaYQbb7x1SjKSUBaO792EuxC5ENv7jHYG7IIkB24LvY4yWIMMQODRGTzHOd
         rQxCFioCUksKzilClG5t+ce5hlEafMzVuRr07DOvfY2M21hJJmU7FVfdPUOtWGyi8UkG
         8MZQ/1gzOAaZo+S8Z9Kf9qmfWEHuQeLLm2oDz3MhS2sAEa3CvvLu1boEarKON9rmXyqz
         nWpGpTdovkSFx0r9h0k5HG7ogr/Q2k3MlyPxdNlOGNvJrMel+AlhafPYmIyiIWUCVMH9
         Ecl9tV2Y8M48tuEirJuNjOHP35OzqSJahQvBlf0VSYtefSAYzirR419W3rmz9ejWPjn0
         uHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732796144; x=1733400944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zo7/3gUT+IQw+k2qVNpV0TR7aOCWRkGfGTG2g3pxuLw=;
        b=IthiLsxC380qvII4TSr7W8SSqq9udZ6DJWGbU3Ew74+Ss8UwOBKcjxJ2qUG+JE9LjZ
         HxDgaXAa1deza/CchaZYAWTU6ytWAwI/xyRPczCZajJOwS6Ant/97Eyxe+socTWdpcRk
         Szoq6AnGINbEVLwQ8fWzNIaT9XrF487MYlO4Yim9yO9scmS2BOty8xUeH8R7viKU/CYw
         +r8zyKOMXVZp9GYGZxYln+hdrN+TnqZ/WQU0HeDa/TdiZnpLDnOXb2YUeWXg1wGqj1mQ
         oa0eLPJh8aH9/TBCcrW+6E6ra+EaqUXGeEYJOEL/oUc1hpsFi699htBK+CITmC7L6mzz
         w6ng==
X-Forwarded-Encrypted: i=1; AJvYcCUzBxt+wOlkZ3LPB/0w8jSmxxsBE69Uj4rdnuGzLM8HXW8Y7eStdvfoaSuEG0h4t1N41UX02+P6NP+x7ao2lghn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8IdCQi/xfnOs5OI1aqWKbmHVL1YrFIiwZD6S6EzF2qQcNnXKF
	lNT3rhbIWjlvG5k4NNXaSM3zN0GyQ7qbNFRKLrcWBLdWGTaWCIlmVzotIu+N1KTf5BrOmjq4Obg
	Ze/8=
X-Gm-Gg: ASbGncsRDXGFoBK8aW/RRxLF/xFwPhfCuC++RpF23sFMZFN5dkLP4TN90cxVVPs/+dO
	Fzk7Sx3ZePpKMsLq9rMn458DL5aMDEZkhyqJrNFGTeg9H1QVGCtkjHIMJuTDauw03tBktZ2R3//
	HQLDMLCfZaFu6h1HqB6wOpP/QfEfFsX8tHQfLkZJmw8HuinfwhO8aiN4uogPrs6XIPbnoxmAsEM
	oz778vlat4FrLPtTawZJ33oUU4tLWaP/23gO4Mcp5xF0r7oOQ==
X-Google-Smtp-Source: AGHT+IFKE7xqDBi+cZmxYmt7ECXkRTo6VaxF8DAN573/AN6UlZxpeMT1JwaC1egW90HocEjDlccZpg==
X-Received: by 2002:a05:6512:1286:b0:53d:eecf:e25d with SMTP id 2adb3069b0e04-53df010b161mr6061834e87.37.1732796143557;
        Thu, 28 Nov 2024 04:15:43 -0800 (PST)
Received: from pop-os.. ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d410dsm60981466b.66.2024.11.28.04.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 04:15:43 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: suzuki.poulose@arm.com,
	coresight@lists.linaro.org,
	mike.leach@linaro.org,
	yeoreum.yun@arm.com
Cc: James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] coresight: Drop atomics in connection refcounts
Date: Thu, 28 Nov 2024 12:14:14 +0000
Message-Id: <20241128121414.2425119-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_041545_682273_EEBF835D 
X-CRM114-Status: GOOD (  15.47  )
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

These belong to the device being enabled or disabled and are only ever
used inside the device's spinlock. Remove the atomics to not imply that
there are any other concurrent accesses.

If atomics were necessary I don't think they would have been enough
anyway. There would be nothing to prevent an enable or disable running
concurrently if not for the spinlock.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-funnel.c     | 6 +++---
 drivers/hwtracing/coresight/coresight-replicator.c | 6 +++---
 drivers/hwtracing/coresight/coresight-tpda.c       | 6 +++---
 include/linux/coresight.h                          | 4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 5a819c8970fb..bd32f74cbdae 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -86,14 +86,14 @@ static int funnel_enable(struct coresight_device *csdev,
 	bool first_enable = false;
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (atomic_read(&in->dest_refcnt) == 0) {
+	if (in->dest_refcnt == 0) {
 		if (drvdata->base)
 			rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
 		if (!rc)
 			first_enable = true;
 	}
 	if (!rc)
-		atomic_inc(&in->dest_refcnt);
+		in->dest_refcnt++;
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable)
@@ -130,7 +130,7 @@ static void funnel_disable(struct coresight_device *csdev,
 	bool last_disable = false;
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (atomic_dec_return(&in->dest_refcnt) == 0) {
+	if (--in->dest_refcnt == 0) {
 		if (drvdata->base)
 			dynamic_funnel_disable_hw(drvdata, in->dest_port);
 		last_disable = true;
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 3e55be9c8418..31322aea19f2 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -126,7 +126,7 @@ static int replicator_enable(struct coresight_device *csdev,
 	bool first_enable = false;
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (atomic_read(&out->src_refcnt) == 0) {
+	if (out->src_refcnt == 0) {
 		if (drvdata->base)
 			rc = dynamic_replicator_enable(drvdata, in->dest_port,
 						       out->src_port);
@@ -134,7 +134,7 @@ static int replicator_enable(struct coresight_device *csdev,
 			first_enable = true;
 	}
 	if (!rc)
-		atomic_inc(&out->src_refcnt);
+		out->src_refcnt++;
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable)
@@ -180,7 +180,7 @@ static void replicator_disable(struct coresight_device *csdev,
 	bool last_disable = false;
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (atomic_dec_return(&out->src_refcnt) == 0) {
+	if (--out->src_refcnt == 0) {
 		if (drvdata->base)
 			dynamic_replicator_disable(drvdata, in->dest_port,
 						   out->src_port);
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index bfca103f9f84..4ec676bea1ce 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -190,10 +190,10 @@ static int tpda_enable(struct coresight_device *csdev,
 	int ret = 0;
 
 	spin_lock(&drvdata->spinlock);
-	if (atomic_read(&in->dest_refcnt) == 0) {
+	if (in->dest_refcnt == 0) {
 		ret = __tpda_enable(drvdata, in->dest_port);
 		if (!ret) {
-			atomic_inc(&in->dest_refcnt);
+			in->dest_refcnt++;
 			csdev->refcnt++;
 			dev_dbg(drvdata->dev, "TPDA inport %d enabled.\n", in->dest_port);
 		}
@@ -223,7 +223,7 @@ static void tpda_disable(struct coresight_device *csdev,
 	struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
 	spin_lock(&drvdata->spinlock);
-	if (atomic_dec_return(&in->dest_refcnt) == 0) {
+	if (--in->dest_refcnt == 0) {
 		__tpda_disable(drvdata, in->dest_port);
 		csdev->refcnt--;
 	}
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c13342594278..834029cb9ba2 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -200,8 +200,8 @@ struct coresight_connection {
 	struct coresight_device *dest_dev;
 	struct coresight_sysfs_link *link;
 	struct coresight_device *src_dev;
-	atomic_t src_refcnt;
-	atomic_t dest_refcnt;
+	int src_refcnt;
+	int dest_refcnt;
 };
 
 /**
-- 
2.34.1


