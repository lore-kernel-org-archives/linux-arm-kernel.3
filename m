Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7BAC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfzFRHbfXxXFspuQSyUelov0bU9Y998lI+AV7Y8adF0=; b=vymNCjyhBrTiYS6N5Syz9gD8+U
	Ti+0PhIE5r7tN3n7iKj6vvvz0g3QRs5atj5KZKU0H0fKClr8onf37hwjA9T/7yhm1dZUos96dIyZX
	KtIpfBMTOUtj7HslgtptEc8SerzrEwh0kYF6Wv1Em7HVu1G8bJQGtPBkjdnzjBYCtZ+evkD+W6+4j
	fmRMMlhtlIHrmllkXNs+WAXfG5rfRyBJ0Sapgxx2v0IQcXOrP2yarA0e7LGBn89LUg9wfQFlEQ+wY
	FyhVsUuxbIuP36B5PHaQmn3UEhXdivfvwHOCSdIY6aG+Qqgerdk0340gSrFhMCuv045EB8T43dlEz
	kw7K8FWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvH2d-0000000CPcR-1cow;
	Thu, 20 Mar 2025 14:38:39 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGzG-0000000COx5-2qmM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 14:35:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3997205e43eso692248f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742481309; x=1743086109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfzFRHbfXxXFspuQSyUelov0bU9Y998lI+AV7Y8adF0=;
        b=astUn1TirNZJD7f9CZeYYm5k3776IUv1HdNEbpMuAyy/ua6c1bPPbGbEvS2IpHVpKc
         ahZJnohoyTFbTTDiwFTykAZ4ZotInPYF+UhGYkmW+WhmjyvrglyJeUBsjssnObAYdouy
         nmVA6Nqqd8vyHXvAhcGzja9LqpFN15lPNPMhptv+7r2/IeGoWp+xQu0PcAoF/9TF7lQY
         qQPLiDhTA4rdWjuXUAOX9rUC1HhgKhBR2jDsKx/nJLmgg8Ra/Euju++OOMLasaDCKJR1
         bxJxb2LHFaMLFC3iR0WWN3NddQlTz156uOJsFdlZeaynT7AiLkhLqB4pDMpNT7MlxAAF
         aiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742481309; x=1743086109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfzFRHbfXxXFspuQSyUelov0bU9Y998lI+AV7Y8adF0=;
        b=RoJr2glLnd1fRDfYbuHgdjzCZlWamp0xa54VHClaO1LD851YJMB9NxVaicyzaFMVOe
         ETBibdQ6zDPPbZaJ034+5R4GV6Yf+YJAk/214qbgQwERUc1ZM06V3WU8I4Utyry709Q8
         rp8likun7dK0NU0lWX5nkhyKQtwk+rlGGAYlwo53tMlXZ7lFc7SFz25rSchRdUcjDX6N
         NnjImYfrZ8r5wrK5fwnPiCeyhpBKHjAR4y2XYTsKMzmufmShBJmk6ofrdQJMbo+ogVln
         ieqpQIf0/vN1QUit6vtykcc/gzUcBsKKLL+GKW5o1hT7+KzjKiJFYORzOD4XytBCZq/S
         M0Fw==
X-Forwarded-Encrypted: i=1; AJvYcCU5SsBDbjQPLfWWloZkDLo5jUoOG6Yu4Q9ovsZdY8CHg4gIv9UGCHBvAO3IXoYM3f0Npgg/0hVlZQ4KRUBDpOB6@lists.infradead.org
X-Gm-Message-State: AOJu0YztMQF1HZ+tJKsbEjixdX6qSrR78YY0vKrqrUxpQ5LYmSPCHrC4
	+5toKQaovMI0m6whum4w5GUjc3BoLPcxEraLNH5sMKjN+tmuBoW8SkLNZXrqSHQ=
X-Gm-Gg: ASbGncvtZZhCp8KqPAKiFDfMPzqI/kr2U5pNRi4c2JyghaIJEWq+PstMne/GTpq3HqJ
	S8/1TZXSF9R29DslAH2TtgUreHIKQnYQZn1H+90ixwDtWLbtyDsG68L2dNCztwW03vVo2+L3iE1
	gBh78UeVZjhtIB8tiyu5jdjkaRSrRi4LKGJzpIo+2qRmY+IhdhepZQkB4io5Aib7+VSTp0xs99/
	5DAvvoZAVNzqf4/967OKeox6TrEGQzPFHYUR5hYh37RZo585v+rJeAXUNXSQmi5/RFIOCuBLBmj
	0v1awjJPx89AG66OMo1G6DqpHC22UA1tV/5ffoorLOGUZx4=
X-Google-Smtp-Source: AGHT+IF73C+sldZfp1EoaiTa2aCKKOCtDRpElINoDtMTnJAzYhWVerLTt8PUOTnbGm7i+dgQZml1yw==
X-Received: by 2002:a05:6000:2ad:b0:391:2c67:7999 with SMTP id ffacd0b85a97d-39973b0befbmr7716072f8f.48.1742481308907;
        Thu, 20 Mar 2025 07:35:08 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:35:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:10 +0000
Subject: [PATCH v3 1/7] coresight: Convert tag clear function to take a
 struct cs_access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-james-coresight-claim-tags-v3-1-d3145c153820@linaro.org>
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
In-Reply-To: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_073510_723304_BC5ABE2D 
X-CRM114-Status: GOOD (  16.22  )
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

The self hosted claim tag will be reset on device probe in a later
commit. We'll want to do this before coresight_register() is called so
won't have a coresight_device and have to use cs_access instead.

Also make them public and create locked and unlocked versions for
later use.

These look functions look like they set the whole tags register as one
value, but they only set and clear the self hosted bit using a SET/CLR
bits mechanism so also rename the functions to reflect this better.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++++--------
 include/linux/coresight.h                    |  3 ++-
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..8471aefeac76 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -144,19 +144,30 @@ static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
 	return coresight_read_claim_tags(csdev) != 0;
 }
 
-static inline void coresight_set_claim_tags(struct coresight_device *csdev)
+static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMSET);
 	isb();
 }
 
-static inline void coresight_clear_claim_tags(struct coresight_device *csdev)
+void coresight_clear_self_claim_tag(struct csdev_access *csa)
 {
-	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
+	if (csa->io_mem)
+		CS_UNLOCK(csa->base);
+	coresight_clear_self_claim_tag_unlocked(csa);
+	if (csa->io_mem)
+		CS_LOCK(csa->base);
+}
+EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
+
+void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
+{
+	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
 	isb();
 }
+EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
 
 /*
  * coresight_claim_device_unlocked : Claim the device for self-hosted usage
@@ -176,11 +187,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_any(csdev))
 		return -EBUSY;
 
-	coresight_set_claim_tags(csdev);
+	coresight_set_self_claim_tag(csdev);
 	if (coresight_is_claimed_self_hosted(csdev))
 		return 0;
-	/* There was a race setting the tags, clean up and fail */
-	coresight_clear_claim_tags(csdev);
+	/* There was a race setting the tag, clean up and fail */
+	coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -201,7 +212,7 @@ int coresight_claim_device(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_claim_device);
 
 /*
- * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
+ * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
  * Called with CS_UNLOCKed for the component.
  */
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
@@ -211,7 +222,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		return;
 
 	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_claim_tags(csdev);
+		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
 		/*
 		 * The external agent may have not honoured our claim
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..00134a80d358 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -685,7 +685,8 @@ extern int coresight_timeout_action(struct csdev_access *csa, u32 offset,
 
 extern int coresight_claim_device(struct coresight_device *csdev);
 extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
-
+void coresight_clear_self_claim_tag(struct csdev_access *csa);
+void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
 extern void coresight_disclaim_device(struct coresight_device *csdev);
 extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
 extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,

-- 
2.34.1


