Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89987C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpLFATDWKZO90jD7k6C19hhyGuSC5NA6ygL5CbsK9zY=; b=N3SQaUjABFKZTPcYWSzifxwvUB
	tOdXyABeH2z7Pvo2LYbme8J0tPADZt/rGgnYhPP1JL6tNFMzViLQVX38juKw4U9Gqg+vNC5j99Ze+
	ePGFsXZnHY33Shz2AeIeFY7zmrhvrNbGmFcFHJWtAmPGWRFr8rB4vi/wuCwYR9jC5B5+qzqhPJ9JS
	J9YcSqIc8FpurKhTTzX720wKcP/A3Qtf5fpdxidzmp1T6LZst/JCnQigRlDzXskkAPEPusl261iFk
	1Dd085OI1j5qnX5KAVmZICjflYdD4UakSx9FymVf9WPr9qPZ7skQt/LUlJg92XR27RQpO/E+R9b9/
	eDnRzqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3AY-00000005lTr-0nJX;
	Tue, 25 Mar 2025 12:14:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2w2-00000005iPA-2jMo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:59:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-399744f74e9so3412145f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742903949; x=1743508749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpLFATDWKZO90jD7k6C19hhyGuSC5NA6ygL5CbsK9zY=;
        b=FebvoXj8M0YL+sAqrIljLvxJdzlaAa9/XTb9E5wVR0UejPZAK/1e2UNKFrGphSDhZQ
         sUfUw68vWpnawF3K1Q+lXWf6eRNMNzLT00ZzGIpPIzGB+xng6weMP1F5N8CK8/kCXNxQ
         ieH5ymicSZb9869MfRqsPYop/T48YvFIiTCJ9hJ6x1Lxh3saK8lbNO4GDQOCb1BASwPv
         5ymwtK2solBsRWzwvOaPp57ujt4x1RxUPKWkZ2enkdMeSVy9LO5QZc61DOzHZdGAesls
         iabDvV06B1RGd208u2p9Vbr7A+4laNJJFmueMsZqVdRwl5MBam0OStjmoVo8qNS+f+U7
         JxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903949; x=1743508749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpLFATDWKZO90jD7k6C19hhyGuSC5NA6ygL5CbsK9zY=;
        b=RxDIvT2bV0bo5EXgzWfOoPmrFyu5DAtHHlWtUKJLiUoHML3vbbxZ7ZJEnAwgzxmdLZ
         HAKq9dCZnJP6V4MxqbHpzGICRfZHVG7Wq3rhDqOsShQVJFrJpbLrzK2ZMDVzSGwVClZJ
         W6e1uSLdRk1zOKS0TBCfI59unDxsili0UbfpPJm+GPlkssB8ye5+P3RBumD3OvSN3RT2
         Z8oqx9yDigeLuYK2ceshJtTRPrusfbBkBAfH3SMmXhIm9MRnsZiydWFGLrCUOgbkrxB2
         8OO3Bvs5PHQsEfQhs3MWeCfbgyvBP8pTQzovtrzkar05ilHZJ01p9i6k+RQuGPxovw/V
         phIw==
X-Forwarded-Encrypted: i=1; AJvYcCXRGYurKAum/wYVpadDV4i09wrbWSHmJatmYKdrhwgvpKurn6bLVJHlADpoZ/qtUQZCy38Dr4dLzZ1gNpwkiSgo@lists.infradead.org
X-Gm-Message-State: AOJu0YzYYVl0STl6Uq4mIfhhvxuc64K+8TR739vFbcpQqyCSiCAnbmJj
	ToIxQKmAgGV+sJvhbHvuIgoK8DmV4V8UnEkuCXA/RatmMjajwKFcrOtBEe2lrkg=
X-Gm-Gg: ASbGnctryxjDRboWerDMekkoPVPKBvnSvLbpek6y4yzNtjvWh8ELrxShbOLYSZaUSVE
	AJV7pxgih00cBlpm5RZiH2o+v0y737wRQtD27xMVRjADPVXYe9gnsVnQ6N3MFyJMm/xAtgu6QRY
	PRiKo5qMwvlt+tuQlS69D2ymY2dsO2o9hGm9yVzl+P/3K+/BCqXKQkpgukjzW0L8MRPTSCVjzkm
	4Yw1OhLuvBsXZ3JsNHwM2FzbtHv8LBelWwNDFHCByUukVXg+bb7rmLFHlf3VyAT7X2ZHi3VZrr1
	kL6bqhd1d7E8xjv55QnfUKyKFjlo5BmgJbB0CZ9sTO/uw0wP
X-Google-Smtp-Source: AGHT+IGQRLjfoklE/nAi3keHa2krGni8a8quLIKCujHbsRuNFsPx1OQ7JeezjpcD78ucuIM5tbYduA==
X-Received: by 2002:a5d:5f92:0:b0:391:4389:f363 with SMTP id ffacd0b85a97d-3997f91bc76mr13237990f8f.21.1742903948838;
        Tue, 25 Mar 2025 04:59:08 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:59:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:48 +0000
Subject: [PATCH v4 3/7] coresight: Add claim tag warnings and debug
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-james-coresight-claim-tags-v4-3-dfbd3822b2e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250325_045910_698850_A8B9E44F 
X-CRM114-Status: GOOD (  17.25  )
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

Add a dev_dbg() message so that external debugger conflicts are more
visible. There are multiple reasons for -EBUSY so a message for this
particular one could be helpful. Add errors for and enumerate all the
other cases that are impossible.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 51 +++++++++++++++++-----------
 drivers/hwtracing/coresight/coresight-priv.h |  5 ++-
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index e0638e5de0e0..33824f4a631d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -135,16 +135,6 @@ static inline u32 coresight_read_claim_tags_unlocked(struct coresight_device *cs
 			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
 }
 
-static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
-}
-
-static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags_unlocked(csdev) != 0;
-}
-
 static inline void coresight_set_self_claim_tag_unlocked(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
@@ -182,18 +172,41 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
  */
 int coresight_claim_device_unlocked(struct coresight_device *csdev)
 {
+	int tag;
+	struct csdev_access *csa;
+
 	if (WARN_ON(!csdev))
 		return -EINVAL;
 
-	if (coresight_is_claimed_any(csdev))
+	csa = &csdev->access;
+	tag = coresight_read_claim_tags_unlocked(csdev);
+
+	switch (tag) {
+	case CORESIGHT_CLAIM_FREE:
+		coresight_set_self_claim_tag_unlocked(csdev);
+		if (coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
+			return 0;
+
+		/* There was a race setting the tag, clean up and fail */
+		coresight_clear_self_claim_tag_unlocked(csa);
+		dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
 		return -EBUSY;
 
-	coresight_set_self_claim_tag_unlocked(csdev);
-	if (coresight_is_claimed_self_hosted(csdev))
-		return 0;
-	/* There was a race setting the tag, clean up and fail */
-	coresight_clear_self_claim_tag_unlocked(&csdev->access);
-	return -EBUSY;
+	case CORESIGHT_CLAIM_EXTERNAL:
+		/* External debug is an expected state, so log and report BUSY */
+		dev_dbg(&csdev->dev, "Busy: Claimed by external debugger");
+		return -EBUSY;
+
+	default:
+	case CORESIGHT_CLAIM_SELF_HOSTED:
+	case CORESIGHT_CLAIM_INVALID:
+		/*
+		 * Warn here because we clear a lingering self hosted tag
+		 * on probe, so other tag combinations are impossible.
+		 */
+		dev_err_once(&csdev->dev, "Invalid claim tag state: %x", tag);
+		return -EBUSY;
+	}
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
 
@@ -222,7 +235,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 	if (WARN_ON(!csdev))
 		return;
 
-	if (coresight_is_claimed_self_hosted(csdev))
+	if (coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
 		/*
@@ -230,7 +243,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		 * and has manipulated it. Or something else has seriously
 		 * gone wrong in our driver.
 		 */
-		WARN_ON_ONCE(1);
+		dev_WARN_ONCE(&csdev->dev, 1, "External agent took claim tag");
 }
 EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 38bb4e8b50ef..6e8cf55aee0a 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -36,7 +36,10 @@ extern const struct device_type coresight_dev_type[];
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
  */
 #define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
-#define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
+#define CORESIGHT_CLAIM_FREE		0
+#define CORESIGHT_CLAIM_EXTERNAL	1
+#define CORESIGHT_CLAIM_SELF_HOSTED	2
+#define CORESIGHT_CLAIM_INVALID		3
 
 #define TIMEOUT_US		100
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)

-- 
2.34.1


