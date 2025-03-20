Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CC0C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwLrnZ7veEKh9dgDPH9OcYYObOhDGXo4oYTlew/IRG4=; b=LOGYSiPfr4Si5PyZqLH+5PM8NN
	ms/4BykssQJJ9qn+s+ZAGrtGvkIJ4WUqDyX3/q/fAEJ7A9Y5aGAMe8NWtosFEv9HceDiZvlY67NDr
	lzR9C293lDYgCsLzFT5/gyIqQJxVdCBFkn+pQIztbwMvwpF4riy2b62wKDeQACGJrgFF9HRcZ4g5C
	vo9oS4+KG8l34YxuwUjcFNy+LJYhMAdVmUzafJxYZs6Cweg96T+DXg6HWD3LrWh6G3TNLINbMgJxp
	m7iSYfVQNBaNIeN8eyr8Qy+dlmx0hxU3txQEoTfsNCJ0dEnisdI90ru8A6gLAIsPH2SG7cLsh3rzy
	e4Xxq3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHB1-0000000CR64-0AgF;
	Thu, 20 Mar 2025 14:47:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGzO-0000000CP0k-0FuZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Mar 2025 14:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BwLrnZ7veEKh9dgDPH9OcYYObOhDGXo4oYTlew/IRG4=; b=mxrBv4iFBkcBtA9VFnclCmO1d6
	qy11o+wNLlAaZeKTIpHJVr1QQtLgvsMSkeJhqUJ04eDVixvRo2uKOJoUPiIy0bT4frLcDRJaC9pO/
	a3uS4ZAQ5BrRwhSJS+wttbE021IM4lxDiw+MgU649I78xCqcjTiE9lq0qSdhxtyjZm/lZ4Wc6u3ua
	TPqVBhENVA0tytBMELmEsMXez/3q/mofkXDdN81G5aRKvHgEyJ6XbyKxVP/+vdJiSRc9qcL/767rL
	sojil2r+gl1U+O1b/sowB6jGEM9UCWxG5W5OpZd6XGeL0QiGjNwvrmcK94/25BN+mBcXLp5r3obFW
	rVls2TVw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGzK-00000004AJ7-2n9O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 14:35:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso5980415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742481311; x=1743086111; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwLrnZ7veEKh9dgDPH9OcYYObOhDGXo4oYTlew/IRG4=;
        b=Z32zLcaEXlH0UVHUSwj65oDvyTXyw+Z1U0VIRLrCffPzdwEShbe35qIp0LX7ghobRj
         5Wgv0IG0iCatiA5HaLmXBdFn9GeRkrnlzFvWbkfWM55dUO8tGOAvMFfJ0pC6yGyVPx41
         57L03KqEb1/PrSY6LWpbY5KMgtC8Z2uJUTUXakU9SWHZG+Sp5N9L7OGOHhIGVp5WbdBY
         x8FjBqc6k3GSRXJ8tps5wYYgBSeEfHQ+Ic5LWhtdwd82mQUxfZD46fb9uYRdTI14n55H
         YH2CPiuB3ap1mIeTDyR0v5/nvuczq3hA+anNQQvNdokxRJCV9GF8N1L3zqT8sihlP09b
         3DvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742481311; x=1743086111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwLrnZ7veEKh9dgDPH9OcYYObOhDGXo4oYTlew/IRG4=;
        b=KGO/U+FjS7usFmrRn9tfy/1t2PeluggacIp/fkR0U6/rpg0GfVrKmC3BTEG9iQ/jOS
         P+23aLHkHkCrQXtW6LBg6n33UTdp9oISnVm1KzauxxL7OjE7ehcILyKM6HfL+yfCX5VA
         5d5ye54v8hNi+p5R1B+RYVGBJ3Yn3qSFSCT7eNE7GN8voIv6gsDQIqGbaIS1rtBlzZBM
         mLT8EJCQZPfgTOJ6Uokfh8NuJ4Zu6pzz46tya8UsXENrs+TdV7fzmZ5I2EfYg0l1k3wE
         x8g+VYwFuDn475brrNW4Cn+RgDp5pOzy3j43COW8N5GGt5vlNJO6ld3VevuBTQVgtlm6
         cu6A==
X-Forwarded-Encrypted: i=1; AJvYcCUvxxHSudBfaAtEIq/E8XGKntoha29DZENfkY0SQY+u78zCPF1WoYS5qhYFLDr1rxwH7Lo/f6GNo8VGmDQJYZJU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx4xVzkmD2D4K5LKE0IcSdV5td1vwJ8X72VgR2QkKVaOVthq/A
	o/UBiSiNaHjjSzfoo2Mw/7uHrHNNSaWmIcuZVJhQ8zfrOVsBXnTritXEkkXFHUc=
X-Gm-Gg: ASbGnctwHLtyLZjTcdTfhmLCdC2fr2ElwU7alBKlP3SBytIbv/vguAiP5s3RQvqH+Th
	fedr/iHO4fG5wDm1BlqZpC0+kVUwwnM33qRHvK8ArNNTx6sgF1GeIlSUDH6+JQRLuQnDCP0+UAd
	V+x60t5ztCppmSHd16Swp0q/PIFi4qgAmNU39DW/nfMKvsuIEk0fSQiBJPoamW4DG0oF/kUaOIo
	a7CmSL2qb4WPlI/C2roL4z0c8htKS6XBQsysqXjFQQoynJUcIVQhQB4AmKJdYpU25PrjvFN79dR
	QbvWoShDiSwgAwzad4VXnoclDI+pQDdV4YOI//SuQlNFDkA=
X-Google-Smtp-Source: AGHT+IHwP3zwF5MimE9Q6RcdnULD6yCEU4RZj5mW35Mho0ZLiaj7qqK35hnHeoXoBUJLCg626reWtw==
X-Received: by 2002:a05:600c:3c8b:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-43d4917b597mr32574525e9.9.1742481311313;
        Thu, 20 Mar 2025 07:35:11 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:35:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:12 +0000
Subject: [PATCH v3 3/7] coresight: Add claim tag warnings and debug
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-james-coresight-claim-tags-v3-3-d3145c153820@linaro.org>
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
X-CRM114-CacheID: sfid-20250320_143514_802254_08532528 
X-CRM114-Status: GOOD (  17.14  )
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
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 51 +++++++++++++++++-----------
 drivers/hwtracing/coresight/coresight-priv.h |  5 ++-
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 26d149a4c579..2b5a7cceb719 100644
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
 
@@ -222,7 +235,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 	if (WARN_ON(!csdev))
 		return;
 
-	if (coresight_is_claimed_self_hosted(csdev))
+	if (coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
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


