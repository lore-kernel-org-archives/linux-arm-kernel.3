Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86767CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 23:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OafmaFEEMiW3DYw/6kVfDpX+aIzCwIqDzz1UgpECPjI=; b=TkHktM81i7mmx149QYCyDvT2a2
	a2bZioXwSzTioLDtqOxf3lxS/DO+t+7SfKGtZxrhklcktUcCnhJS8F04dOmGq5jUvxcBqhfUFcxmC
	N7bI/C9Jkw96EGidrPB/YAFEx6T31WpjP1IB/st44EIzM+QATPSS49QTfYXZVvYcAJq7rElwFze8S
	xoPxxm2IB4OMijHlq1dSRGmIFMmO9aUK8fKamJbC016iCKb0nMb1adO/lBHj+bW8aEgSQr9e7n4J2
	ziiO/uaLrEvEpeb+AtJA8NBjI0Tz/ay0c4uR7rlQ2HF1lKOtqa55LIXRrrF7rVjE5XkQjQBaYjFvV
	3dPY9HAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBM2s-00000000x9P-2s28;
	Tue, 21 Oct 2025 23:45:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBM2n-00000000x7C-1SfP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 23:45:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-427060bc0f5so2084926f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 16:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090332; x=1761695132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OafmaFEEMiW3DYw/6kVfDpX+aIzCwIqDzz1UgpECPjI=;
        b=z4sdI+nervAPFgUxcw0kz7WaCoQk05zU1kySfXxr+g5mbQBCUoynL38aarFpYVasaM
         m/jRU8+B8fP5NzI7f2iHpChub71Yi290j3Rs1zbYYIlclHn7mdl0s7fay8sRBceC8lGy
         e3PvY3teyPq5B/x3WwCbR4DL9NHX3yhI3kpH1bHzsBJWPHoak2FJVExNogs8vzTRdFt4
         naa3g2qkuCEUSFJOooA0JVKD69b4BQGlso4yrKBi+sf58SvX4347ykq+RbKbYs9UM0/s
         N6qKK0NfsJX5b1lUlHKIhHIjIW0wgs9fCVJsNdWMxIr369hKr9oiibh1vlVXtB3/rBAL
         rdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090332; x=1761695132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OafmaFEEMiW3DYw/6kVfDpX+aIzCwIqDzz1UgpECPjI=;
        b=dmI1VEYPykmnBIJpd9NgzU7WN4V0wrgrChtnv1wSQsduOH3uJaaKjOjnhbFKZtLNTg
         D4dnKet45lHAct0EN9EIWGEBmuwoM3imRVpcyUNwmk5v13m1iKx08bRZTuJqBqe8esHM
         1wO2+tbgWwxS3T/4eg2esZ1zpgjEFXkUdqMpeRHbpgDXveovkjgOOq/XyjWsKtN09KV3
         DuPxVtMVx7llaQUFVoc62nPPvSxT2PjOdwkraWq2OjRXKyAlNN0UHg2TiGVP5H3um9/F
         6mjlWyIWMKXmd6HJl4LRmZPEllSWhdF1JmtNRmHCz1YeFoJgskHD9mWjGUrXUlDHUv8U
         i05g==
X-Forwarded-Encrypted: i=1; AJvYcCXHL+NSTMus14BQdE8ifywvXnrCfWLnbHglkVrucW5VFKfPagTDpwhCnBflyJ/bDgts5BAQLRpz4GIug/bCSG84@lists.infradead.org
X-Gm-Message-State: AOJu0YwacFn4V9cS2Apo2AvozpCb5xceyRFmtqq60+sya4/AD1Db0yJL
	OUT64Bv1ccCcoybu0w95f4mokFEh+4SVUn6fXXObEYjV/zlXQCk/Uk1ttk8dkhTEGlmdc6ww6HS
	IgeoJ
X-Gm-Gg: ASbGncvoTVYqbjQEypuxhzK7AzIRyKZ4tfxaA9y3oG0NaRnv23oZjPW28+2K7yWol+y
	rAE5cflTQvCnlDN1IFmUoZIfGvuSboBlcMvSNJDWFekUWUib1l5C6WuG2dGOD3kziVIsAGy3v4Y
	XvVP6zBXOzo4mPzBCb81w2pBOJSGaotvzLOphHe1WL/ddZ9d6yodmBk9eZ0B3rA/TUkArJl9Wu6
	jca1uem6tl9EYA3E/i9fIPOWX86y3w2oKxne70hXpLqIABJ6acTG6W+FvVgURddyLzc/CjAGvWG
	EBlaMphqFnEyKGYVb7aP32gWVIgVy09O057faNwRx7CpBJTPTVtTFKw92UN+N4sHJXDd0ub3gbO
	fUR0Hs/VE0Q5xM6pMMFAPhmbklxkmJjzYZ12b6WcvqOaESb6i+l9cwBFukJfh9n9HQtQxoam6Qs
	diqN5IoR/ywFJN+nRWg4BSxpW190LCwn4WoMDF1LLh/PMXIgrjtSFVpxOV8Fsf4SrCrl5OUpFzS
	xTOEPDSicZx68tV+eN/7KwDYG9w
X-Google-Smtp-Source: AGHT+IHDFi/uarH0TV/fP4fWWWvcBI7LxoChkgr58/si1RVzykVqlT2kD7TRyiAf+r5B+dX8qqG1Mw==
X-Received: by 2002:a5d:5d02:0:b0:428:3fbb:83ff with SMTP id ffacd0b85a97d-4283fbb8dc6mr6439834f8f.7.1761090331776;
        Tue, 21 Oct 2025 16:45:31 -0700 (PDT)
Received: from linaro.org (host86-130-206-17.range86-130.btcentralplus.com. [86.130.206.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a1056sm22247870f8f.2.2025.10.21.16.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:30 -0700 (PDT)
From: Mike Leach <mike.leach@linaro.org>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH 1/1] coresight: fix issue where coresight component has no claimtags
Date: Wed, 22 Oct 2025 00:45:20 +0100
Message-Id: <20251021234520.3355-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20251021234520.3355-1-mike.leach@linaro.org>
References: <20251021234520.3355-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_164533_407401_27A36ABB 
X-CRM114-Status: GOOD (  15.06  )
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
 drivers/hwtracing/coresight/coresight-core.c | 26 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  8 ++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3267192f0c1c..ce4eade8a1e3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -131,6 +131,22 @@ coresight_find_out_connection(struct coresight_device *csdev,
 	return ERR_PTR(-ENODEV);
 }
 
+/*
+ * Reading CLIAMSET returns  a bitfield representing the number of claim tags
+ * implemented from bit 0 to bit nTag-1, valid bits set to 1.
+ *
+ * Claim protocol requires 2 bits so test for highest bit required,
+ * bit 1 -  CORESIGHT_CLAIM_SELF_HOSTED_BIT
+ *
+ * return true if sufficient claim tags implemented for protocol
+ */
+static bool coresight_claim_tags_implemented_unlocked(struct csdev_access *csa)
+{
+	u32 claim_bits_impl = FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
+			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
+	return ((claim_bits_impl & CORESIGHT_CLAIM_SELF_HOSTED_BIT) != 0);
+}
+
 static u32 coresight_read_claim_tags_unlocked(struct coresight_device *csdev)
 {
 	return FIELD_GET(CORESIGHT_CLAIM_MASK,
@@ -156,6 +172,9 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
 
 void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
 {
+	if (!coresight_claim_tags_implemented_unlocked(csa))
+		return;
+
 	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
 	isb();
@@ -181,6 +200,10 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 		return -EINVAL;
 
 	csa = &csdev->access;
+
+	if (!coresight_claim_tags_implemented_unlocked(csa))
+		return 0;
+
 	tag = coresight_read_claim_tags_unlocked(csdev);
 
 	switch (tag) {
@@ -237,6 +260,9 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 	if (WARN_ON(!csdev))
 		return;
 
+	if (!coresight_claim_tags_implemented_unlocked(&csdev->access))
+		return;
+
 	if (coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..f93cbc9bb36a 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -41,6 +41,14 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_CLAIM_SELF_HOSTED	2
 #define CORESIGHT_CLAIM_INVALID		3
 
+/*
+ * Coresight specification defines a maximum of 8 claim tag bits.
+ * The precise number is implementation defined, and may be obtained by
+ * reading the CLAIMSET register.
+ */
+#define CORESIGHT_CLAIM_BITS_MAX_MASK	GENMASK(7, 0)
+#define CORESIGHT_CLAIM_SELF_HOSTED_BIT	BIT(1)
+
 #define TIMEOUT_US		100
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
 
-- 
2.32.0


