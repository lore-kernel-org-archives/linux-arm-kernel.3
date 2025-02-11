Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E62C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5A8RVRjBK7H8bCZinYcme/5PJTGf7uIF6oMOSyxCJUQ=; b=LBKZqcyyKTN4WJ2NrK9FqnWPb8
	q5+6JXLAZ+ARO/AErImE8bDAU16bwOqWcKzR3APANZyzbrRZrw//KKXFgG/vNKZpfkJcJ34iW4EC6
	ePq7LoeQsaBqZQfipc27o5Nnvntp2+TxvYPkGeKdyTasUAOzxJq/nuGXz4ygbaTqliPNtxOKyl0jw
	MkZAws2iOoFDmw8jpfINXyYX4cWbTGbSBFn/eecjazTPIb/Xjb0qcjao1cxvUMJVi81MgxyF+lbkB
	XKwGt89WZ6U/00NZtIdScLCuwZgk0nqwQ8tw5sl/GcM/wSfiC0lYGSumUywVeu4e5Cv2+VbUrI5cH
	MQi8Me9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnm3-00000003PUP-2io8;
	Tue, 11 Feb 2025 10:45:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thngu-00000003NsD-0bnz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:40:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43944c51e41so20256895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 02:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270430; x=1739875230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A8RVRjBK7H8bCZinYcme/5PJTGf7uIF6oMOSyxCJUQ=;
        b=cAqboRCBCp6ip1wYQtAuZc/O1YwT3lUfBT8kcvLp1ZEaPRWyvGCmj+hRkXNAHemaMP
         qpM3TuI8/xOsNLZ1uVY+nNAIA/XmWlRhEA9E7plq/7yHhmKNEiOz7PvFk/FWTEUnM+P7
         K1+WGxMoF3ZYJGBBy/SJBpjupjzMQQ2B73Z4ZxvcoSGg/RW8JK/jf34rD2uoerH8NFfd
         tF9uLWnj2iTsTb97M6cjgMPSbZjJVw0yqjn4Cx4XotDfEQbw2T2hCZWdy+zdPudztrmw
         1jEPfdQlv86i/yTRcKQnCRK0ju7sA1XRlNB+KYOa8lViYavk7nlXpbVelHdMAxA/X1vw
         2tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270430; x=1739875230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A8RVRjBK7H8bCZinYcme/5PJTGf7uIF6oMOSyxCJUQ=;
        b=rX6jaM/8401WcsQrUIQ8LSeeKXwW+9q7CPEdPnMTalXeq0qc/1ugOCQO5vVD9VS4++
         9I5fC/hW8AeWY4H2E9IDSN6aUuoau9zSQbXEol/haJCq7Y2o+OutZHwbNVMCBjslKBnk
         cD4i+dElL8VM++mP17Dxc34Shvwg4hoKH5nTDOkhzp/dKraOAxO+shKbJ1Cd+04eseZY
         QLyooSCFwE7neEGpOFD2l7YJFbmBF5DjqagGB8JiCItXX63p2pnF1/cPdEI7WtSHEIyB
         gN4HCchPkpg6hy18VcjEAAoseuTT9HH1NnSNpEkb99B5zDrRAMR7vfnHS4OZl79MjYv+
         O17g==
X-Forwarded-Encrypted: i=1; AJvYcCWBJIngCCqJIEnvHIEhvEJv6hxPq6e9fX78pJU4BMfBkV1RcFGFqohxix3N1dgFiahsUMPz+OCO/8fwBdi1qG/D@lists.infradead.org
X-Gm-Message-State: AOJu0YxwrOsZRTb6ZGNnL2SczVi9W9/iaVGYdGY3K8atWXehbGmkQgMv
	oEuqtCVqZLgUN5rIF0jpmfP6FCGv+y+xcuIuFiucuxqslD/zwNaX2gLXFWq+B9Q=
X-Gm-Gg: ASbGncsCcWK9J/BFBIn5lOYU4nYfNU3NmBCXHkU5eRXuQy+QRHIU46C73zt5CJRPw++
	HBGpS4+IjQWB2OsgTdH4QIf7eNxIbTwCV02qCLQTgqjNtl1d6tC95RfEsRCQy2knRUwpY3BM8Yk
	gd+5CohztQ++Px5dXy4sgDUIE8TNGUvtN9YWN8JCvkkoc9YPWHwCKmYdhGmtX+BKOOltgORXezP
	y1K6WC7wNm5Zt+1UywuGYkGDLDaK7I9Uz12s/Dy54nqIaShX5u9IFa9bca2ZTiYWWWQftC5rOOq
	QX5uY84nl+e1
X-Google-Smtp-Source: AGHT+IHsAnh1dHvEt+uOlGshWjb+DFPLFBYIUXSAhkCj/7Y+istcriVGonzZp0irFU33oYSY1ss5Eg==
X-Received: by 2002:a05:600c:5128:b0:439:473d:a3dc with SMTP id 5b1f17b1804b1-439473da569mr60088295e9.31.1739270430353;
        Tue, 11 Feb 2025 02:40:30 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/7] coresight: Rename coresight_{set,clear}_claim_tags()
Date: Tue, 11 Feb 2025 10:39:37 +0000
Message-Id: <20250211103945.967495-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024032_182469_A9FF6608 
X-CRM114-Status: GOOD (  12.42  )
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

These look like they set the whole tags register as one value, but they
only set and clear the self hosted bit using a SET/CLR bits mechanism.
Rename the functions to reflect this better.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0a9380350fb5..523dbb381f90 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -142,14 +142,14 @@ static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
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
+static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
@@ -174,11 +174,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_any(csdev))
 		return -EBUSY;
 
-	coresight_set_claim_tags(csdev);
+	coresight_set_self_claim_tag(csdev);
 	if (coresight_is_claimed_self_hosted(csdev))
 		return 0;
-	/* There was a race setting the tags, clean up and fail */
-	coresight_clear_claim_tags(csdev);
+	/* There was a race setting the tag, clean up and fail */
+	coresight_clear_self_claim_tag(csdev);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -199,7 +199,7 @@ int coresight_claim_device(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_claim_device);
 
 /*
- * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
+ * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
  * Called with CS_UNLOCKed for the component.
  */
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
@@ -209,7 +209,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		return;
 
 	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_claim_tags(csdev);
+		coresight_clear_self_claim_tag(csdev);
 	else
 		/*
 		 * The external agent may have not honoured our claim
-- 
2.34.1


