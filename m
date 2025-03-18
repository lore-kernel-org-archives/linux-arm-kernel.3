Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F3BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGJ5zCEXGy4gA/KaDFLiaN40rMPxYRX5syJtqsz1eiI=; b=ISNrLCStVQ/c5uGMVAm0viBKY9
	hcEye1zRUyZeBPGaAgUD6GzcKF07TIuRVi8Y8syTBkBpXNEOgtXdOdIMpgbqyZMyX9X11cRnKAkg3
	XOzJWy2R2NvITDhnDB0I1YTvPW1iRGaH6+RFVcnLby0XFTJTAKwofEDpBZ9uJdTXzoZ142YFGENTD
	3L8ZOMbU7Dmg9CFOlzKTVQQl/FKVQ6JScAu6EEhAMwQhuAwB8JaybYTFWcDPAxVtb7U/O+uVQP+e4
	r7GtieoK6vcJX9qNZyu1po4FG/XMVRKqnXLmSdCpUDCWuUO+CaGN7FxbIyjMivRjRhgxMaO98T7Cs
	eHVfIWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZqK-00000006Xb3-1yE9;
	Tue, 18 Mar 2025 16:31:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZi2-00000006VrX-2cAg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:22:31 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3913cf69784so4953914f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742314949; x=1742919749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGJ5zCEXGy4gA/KaDFLiaN40rMPxYRX5syJtqsz1eiI=;
        b=DliNKYdHxzyRsE7smNPjZlnBI89D3mk5ETQz3SYThq+TqOMszuMfBFOvF03T7YATkI
         OIEbs8M3QWb+WmLC5SmljK9zGKbRjyn5Sh2oGFwv2U5JIZbyNXzXah2bnmEoHurm3pPK
         6urOMjzefuYxxugu60XBgA2Rk4kiLXVrpKEIr2CNoqMkXgkcLzmMetYvnmT+zN5gQJhw
         qQTCyqzFNMncUpSODZADxQWENNqZvEo2Xiw3V5MKaghjrJJySTNaw8fg1LQER+J+Li0N
         DuOXAbecUKVCXX4xR14dmD/X8OtjIrRPLhs55GzVfSbAfWtZmwFBtkvEckiDMUd1mSX8
         Mx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314949; x=1742919749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGJ5zCEXGy4gA/KaDFLiaN40rMPxYRX5syJtqsz1eiI=;
        b=BKZlB5f47IAaWTW7wuCXB1SgQb0zF4QtUoZwS4HVndlN38VGlCaHEowKGB/CU+5ByX
         WWNa7WBu5Up3spAw5KK+am+Vxb/5IGLLhc2eMLVjuhQ6n059UX6PV3lgfhT1IRDsv7zZ
         oxb0S/yDaosw232l01eQaphOnNEpRZu2bFg7RHnSBFcIKxhSXhoLwxvYth+qMIwjzE+k
         XVKowMszerWNx0JxEy9oKco8Sy2Pvgt2KTathLWCvomg3IHO0yBNRZOFzT5uGS4vSSms
         V79C4Aneb3mFO1nK83Cd/4bEmHK/pJtjbNp6/r6bKYwfYYKgK58C5+i70N1Gco3uYgJT
         EtNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPJp7RF1CdCVKgdh+9ydVyUCywd6hgD9jffB4zclRBwJ7wu4w4cRNv1d03ibNCmeYfEOr5VIK3fIFeNV/mxlyL@lists.infradead.org
X-Gm-Message-State: AOJu0YxwH/HQcXxSB8vASi2N0IK84S5IzE7YMksbhtgAwlkC5kUuL0Pj
	i22dUlMT8KajY9PwGgrRaw+iyVidNaQFW4NvtqX7H6HFSnclT9J4k+B1bwyrrVc=
X-Gm-Gg: ASbGncui8B93Q9wPxCCANtXZkz5XSJnhTXVY7dOEcspPaLF0F1I2HkR9pbmLPC4MTeM
	+P+25DVM2yyIf3u0Kl0rGnEai4036LEvsijieTyhnn6rIr+V76VBQyCvKVPkorCUeUa3hBMnu7f
	2KfNI0qYyvcre5Bv1XM7vmk7cryVWL0ROnEEntp2Iu4fIBf1X8lP/SbhTLwR407i/WGoVU9vPim
	tB3/Zh43PaikHc+guyFaHoZWBqrO0Fk6FzHcX6oPSmg0w9fXUg9yJsL0j2zQtA9I0vLz/UhKND7
	81Hr95aBxJDig1VcRQ11UBkdg9x3Tckb/QhQubxeF3ABxw4=
X-Google-Smtp-Source: AGHT+IGD5l1woUahupr3/UQIVjMPG5ye4Qvywoq72MhWarq/PntTcl1VjdMMAP0XoDz6JV4vEUnAmw==
X-Received: by 2002:a05:6000:400f:b0:390:d82d:6d4f with SMTP id ffacd0b85a97d-39720d47024mr12201789f8f.52.1742314949252;
        Tue, 18 Mar 2025 09:22:29 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:22:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:58 +0000
Subject: [PATCH v2 4/8] coresight: Add claim tag warnings and debug
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-james-coresight-claim-tags-v2-4-e9c8a9cde84e@linaro.org>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
In-Reply-To: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
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
X-CRM114-CacheID: sfid-20250318_092230_692354_3011FA10 
X-CRM114-Status: GOOD (  17.42  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 51 +++++++++++++++++-----------
 drivers/hwtracing/coresight/coresight-priv.h |  5 ++-
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index e39043a9551f..5f08845faf0d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -135,16 +135,6 @@ static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
 			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
 }
 
-static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
-}
-
-static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags(csdev) != 0;
-}
-
 static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
@@ -180,18 +170,41 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
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
+	tag = coresight_read_claim_tags(csdev);
+
+	switch (tag) {
+	case CORESIGHT_CLAIM_FREE:
+		coresight_set_self_claim_tag(csdev);
+		if (coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
+			return 0;
+
+		/* There was a race setting the tag, clean up and fail */
+		coresight_clear_self_claim_tag_unlocked(csa);
+		dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
 		return -EBUSY;
 
-	coresight_set_self_claim_tag(csdev);
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
 
@@ -220,7 +233,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 	if (WARN_ON(!csdev))
 		return;
 
-	if (coresight_is_claimed_self_hosted(csdev))
+	if (coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
 		/*
@@ -228,7 +241,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
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


