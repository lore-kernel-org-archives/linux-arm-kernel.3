Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590E9CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mx6qce1QvYPrCvX+nnNjmWVayPG89i/5tERfc8V0M5I=; b=fB8CHM7r671Vsl9IZDjmOGw8JD
	xGC9RYlTL2UAFZG4CnroYlLFGbihw0r9ESmjIveXbCeufMY0ZSh6mj2QiEb/o/qaN4nzG0EuFWVsh
	9rUKrM7FI912DriwhgBYX3bO/VSsgyCB2+ix7ZN2KgJ4MV0axWcr4VxDoe6N1droh/IjEkgwgdChM
	GHo943lfAq1ghlWwTEgEDhgjH9HxV2cLHKcRm28DdCm2gx8bBJHnsK1PbRUnq+l6qccisi1UYKy6R
	7zz60IsN4ZHJu3VLVTAo2RdNPPfqISbswX8tcKiSxQYFWp/lEC0abOaT3bSa482ekrP7M1WwOKKmV
	RvHorPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVom-0000000Esix-0WFz;
	Mon, 27 Oct 2025 22:36:00 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVof-0000000EsfU-2w2R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:35:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47103b6058fso38211165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761604552; x=1762209352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mx6qce1QvYPrCvX+nnNjmWVayPG89i/5tERfc8V0M5I=;
        b=yAaq8sTxVsT9xit7bjuxhJfQ0A/uUxgKcXClxvA8BoHewQYo0Sxa40e3PRqo7c0gTs
         k08r0aUYp5ipfSGD8uCfcbLuYapE/8c9rkeHQaUnaeayCGJCiHB/mdRobxAYrxgthmdL
         8qZOMd8qW8CJMB8sbiVJiD+ZajpNjp6+Q7EbZ368WWyk1aZRyrrkSjPrp6FWrF+XzgQL
         UEJk6mcUirjNilsWXnXEs3T4IfrfbV12mRnx1W+aw5QaMsIc3LKmdFBpNAugS/KNO0Oj
         XA2WhtKibKFc3zVI6DU02Y2eAM3USzgZtzpbxfz/XyiSS9GP+psO6YPHg7gDRwz9gHsN
         /sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761604552; x=1762209352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mx6qce1QvYPrCvX+nnNjmWVayPG89i/5tERfc8V0M5I=;
        b=w5Wy+edT10R8gQm2CxW9xotJk61SqJDFQUbqQ9lr2QdBbxwnbZcMvLu40RPeBWk5US
         UyQ98xI5C8bvmeVXFIcuiZfs7uf96yz42PcANSUsfHIv7bVzZaQWEAuQ4ClB6j9J9bNv
         j2vq587jltlBvPzuB0RcxWFXf0arnFpc9AWRe9JhvA+60d4uPa5zt8kckzs77/Vk+wAU
         T/5QnZPjBvy6PoK05CCKMBFyP7sPiKRznMHByp0R7eGQfx2LFj6G4sYbXK1qTSWl3Svk
         Yzhor7UWfpusIM/bgHdYdi6dUriR5vqY9O6c7Vk86CVirphwmMj4xMglrAYyR06r424N
         Zy9g==
X-Forwarded-Encrypted: i=1; AJvYcCX+hZ1vRDM70+mn450XHuF6xZJ3f+eMBUPV9f0QMfuLSc2y531cdbhjTCqDaKs8iyhLlzQkZ/rGM+k3QQdyTvKU@lists.infradead.org
X-Gm-Message-State: AOJu0YwrvKJd0LhN3wTiClow+M8fV7ZaCoYi8iiiYO1Vk13faouQZfEh
	emge04PmxqD+dXJpLVUqqdeFAOjVA23SCMZFKpLjFS5OLMAYO6LlDfI76XyhreRpcQc=
X-Gm-Gg: ASbGncsAUAJ1cUYqdlkNvRdqVVZqWxFy9sLS3Mb6+QTTz5K7brQdEBwI5GSFrpxCEgX
	Y4nGqAnnqYrr2xMs9lk4tvQATl7KVjrS+mHrZA9b1yxZ8kGgY+sldB3Yt3XozrNTxbBt36Ox4xl
	RqVCjFY+OE+bruduSCuRiJ6vrjZJMrpeQxX6YA+vC4lsQ2TgTgibdZ4CTdIPPKNsOhBd/cLBZEm
	F6dgU9zH+xeaZ+5wsv4I4i0tpcn4R7cYXeqvFRQapr/4SX5HxyyTgh5+ZPTdiPY39cvIseyrGiz
	c9U87z+dYjpN+t6WUzbkJ4GhXDjuyKAh5pqrxRcZ44Vmpn5Xa0BuG7jm6fiXmyw74URhLTG22M0
	RmSV0tISNZSDoqR+JrSoD0iJArn2/JOqnH7kfuLS4Q6RXvtWZPZjn5TL3QvfslhQPk7bbEeKpK4
	L9WjYOp+4apcPQTNQuMPTeA49Ad+Jgy5tSNSmKRkZRFiti881F01+E0+RjiipT2DPyhrCfu1Yit
	X5y9TTNcM0J+yx1VAeQveYJwHEX
X-Google-Smtp-Source: AGHT+IEI18RlKvu3sL7/TxLhdbwGpT52FovIZ8TtiIYoo2vbR/zws0/ySXLOf1ihsMWG10P23FTF6g==
X-Received: by 2002:a05:600c:4f07:b0:46e:1a60:c995 with SMTP id 5b1f17b1804b1-477181098d4mr9866555e9.2.1761604551834;
        Mon, 27 Oct 2025 15:35:51 -0700 (PDT)
Received: from linaro.org (host86-130-206-17.range86-130.btcentralplus.com. [86.130.206.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475ddad455fsm79826845e9.2.2025.10.27.15.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 15:35:51 -0700 (PDT)
From: Mike Leach <mike.leach@linaro.org>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v2 1/1] coresight: fix issue where coresight component has no claimtags
Date: Mon, 27 Oct 2025 22:35:45 +0000
Message-Id: <20251027223545.2801-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20251027223545.2801-1-mike.leach@linaro.org>
References: <20251027223545.2801-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_153553_799385_840E8604 
X-CRM114-Status: GOOD (  21.98  )
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

Coresight components have 0 to 8 claim tag bits. ARM recommends 4 and
the implemented claim tag protocol uses two of these.

If a component has insufficient claim tags then the protocol incorrectly
returns an error when attempting to claim a component.

Fix by reading CLAIMSET to establish then actual number of claim tags
and return success when attempting to claim a component were there are
insufficient tags to implement the protocol.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 46 ++++++++++++++++++--
 drivers/hwtracing/coresight/coresight-priv.h | 10 +++++
 include/linux/coresight.h                    | 15 +++++++
 3 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3267192f0c1c..61b4902b0ead 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -131,6 +131,39 @@ coresight_find_out_connection(struct coresight_device *csdev,
 	return ERR_PTR(-ENODEV);
 }
 
+/*
+ * Reading CLAiMSET returns  a bitfield representing the number of claim tags
+ * implemented from bit 0 to bit nTag-1, valid bits set to 1.
+ *
+ * Claim protocol requires 2 bits so test for MS bit required,
+ * bit 1 -  CORESIGHT_CLAIM_BIT_PROTOCOL_HI
+ *
+ * return true if sufficient claim tags implemented for protocol
+ */
+static bool coresight_claim_tags_implemented_unlocked(struct csdev_access *csa)
+{
+	u32 claim_bits_impl = FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
+			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
+	return ((claim_bits_impl & CORESIGHT_CLAIM_BIT_PROTOCOL_HI) != 0);
+}
+
+/*
+ * check if we can use the claim tag protocol.
+ *
+ * If currently unknown - read register to determine if sufficient tags and
+ * save value, otherwise return current value.
+ */
+static bool coresight_check_use_claim_tag_unlocked(struct coresight_device *csdev)
+{
+	if (csdev->claim_tag_info == CS_CLAIM_TAG_UNKNOWN) {
+		if (coresight_claim_tags_implemented_unlocked(&csdev->access))
+			csdev->claim_tag_info = CS_CLAIM_TAG_STD_PROTOCOL;
+		else
+			csdev->claim_tag_info = CS_CLAIM_TAG_NOT_IMPL;
+	}
+	return (csdev->claim_tag_info == CS_CLAIM_TAG_STD_PROTOCOL);
+}
+
 static u32 coresight_read_claim_tags_unlocked(struct coresight_device *csdev)
 {
 	return FIELD_GET(CORESIGHT_CLAIM_MASK,
@@ -156,6 +189,9 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
 
 void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
 {
+	if (!coresight_claim_tags_implemented_unlocked(csa))
+		return;
+
 	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
 	isb();
@@ -175,12 +211,13 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
 int coresight_claim_device_unlocked(struct coresight_device *csdev)
 {
 	int tag;
-	struct csdev_access *csa;
 
 	if (WARN_ON(!csdev))
 		return -EINVAL;
 
-	csa = &csdev->access;
+	if (!coresight_check_use_claim_tag_unlocked(csdev))
+		return 0;
+
 	tag = coresight_read_claim_tags_unlocked(csdev);
 
 	switch (tag) {
@@ -190,7 +227,7 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 			return 0;
 
 		/* There was a race setting the tag, clean up and fail */
-		coresight_clear_self_claim_tag_unlocked(csa);
+		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 		dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
 		return -EBUSY;
 
@@ -237,6 +274,9 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 	if (WARN_ON(!csdev))
 		return;
 
+	if (!coresight_check_use_claim_tag_unlocked(csdev))
+		return;
+
 	if (coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..270f179c8535 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -41,6 +41,16 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_CLAIM_SELF_HOSTED	2
 #define CORESIGHT_CLAIM_INVALID		3
 
+/*
+ * Coresight specification defines a maximum of 8 claim tag bits.
+ * The precise number is implementation defined, and may be obtained by
+ * reading the CLAIMSET register.
+ */
+#define CORESIGHT_CLAIM_BITS_MAX_MASK	GENMASK(7, 0)
+
+/* MS Bit required by the protocol */
+#define CORESIGHT_CLAIM_BIT_PROTOCOL_HI	BIT(1)
+
 #define TIMEOUT_US		100
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 6de59ce8ef8c..fefe4317a793 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -242,6 +242,19 @@ struct coresight_trace_id_map {
 	raw_spinlock_t lock;
 };
 
+/*
+ * Coresight claim tag info:
+ * CS_CLAIM_TAG_UNKNOWN      - not yet checked.
+ * CS_CLAIM_TAG_STD_PROTOCOL - using standard claim/release protocol.
+ * CS_CLAIM_TAG_NOT_IMPL     - no claim tags available.
+ */
+enum coresight_claim_tag_info {
+	CS_CLAIM_TAG_UNKNOWN,
+	CS_CLAIM_TAG_STD_PROTOCOL,
+	CS_CLAIM_TAG_NOT_IMPL,
+};
+
+
 /**
  * struct coresight_device - representation of a device as used by the framework
  * @pdata:	Platform data with device connections associated to this device.
@@ -265,6 +278,7 @@ struct coresight_trace_id_map {
  *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
  *		spinlock.
  * @orphan:	true if the component has connections that haven't been linked.
+ * @claim_tag_info: how the device is using claim tags.
  * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
  *		by writing a 1 to the 'enable_sink' file.  A sink can be
  *		activated but not yet enabled.  Enabling for a _sink_ happens
@@ -291,6 +305,7 @@ struct coresight_device {
 	local_t	mode;
 	int refcnt;
 	bool orphan;
+	enum coresight_claim_tag_info claim_tag_info;
 	/* sink specific fields */
 	bool sysfs_sink_activated;
 	struct dev_ext_attribute *ea;
-- 
2.32.0


