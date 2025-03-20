Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67318C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYUfMkztXKy34QMNU5C7rZSoh6cruK9lZLqrSczib9I=; b=JnwvooCZDJeay1C5XFM6rKBgQI
	iCMtscwuPe6F2fIZUKzK2znhbm7hjfN6zngyuCv0HmNuvjPT986MDAaviPBQSYsK/SCr8uLMJfXJW
	MFC9/o6icyvACaUVfRBuTJl4RI3D8FLPrmP5KGuK0iGaCQh6YhCHOSR+ej6jn/xQQV7QLkIVZNuVV
	7Qnt8OYkIynCzaPqyGE6yW3kqkDSA3Bn727Gz84jsCo0hZZEu0nyKWYScPb44OilaXhcoNOi8jUKL
	lEiMmb22Przihzln9xIMh3FTxAj+FD5j18ticqI507XOLsnQdwigQU97aj8Cqpc7hVnQ/EfrA44aR
	rFb5I4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvH4J-0000000CPpL-0Vg1;
	Thu, 20 Mar 2025 14:40:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGzH-0000000COxi-2oyg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 14:35:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso6738135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 07:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742481310; x=1743086110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYUfMkztXKy34QMNU5C7rZSoh6cruK9lZLqrSczib9I=;
        b=nvEFRWiiJns1Q305C7WWq8TP+ydFHcWMJV/ZNKlmjcp7z1nU+QfPmWfyPeEXkJ6kHb
         zaBg2sAw44EeRjxhuGufQz2hSaGZUcSuJdp98/uo2uPFMtV5hoMtTPFiz0pUu1eF8rm/
         DPxo+83cyIUtNvgpTiCT9Zty2u34wJrAxTdWpg5cY49tDMHrBPUX/2GOq+WVPcZMYG6w
         qgBvKsoz/aS5ZX4BW8Np7p4P0jT3/EbcJHcO9NCfc4wU8w8Q/D1ITOUEHzkNgRJMYnC5
         beSuNR90lYheT2R47INMQQMn9HipgoyDn1rhaV9kt6P2TmjGNWXohGuHV5iob0ATYFmn
         VskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742481310; x=1743086110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYUfMkztXKy34QMNU5C7rZSoh6cruK9lZLqrSczib9I=;
        b=AlJPoFzyVvHbQWaHKASEbcEO5q51+eHa9coAaBtIrDxM2JA7vQ7LTuFq3wC8+7NACK
         bLvEQszF9hm646QwfoTzrlph1GwRZqwUdX/4baJJUp8orgHdq190WQQY+oXp8QiDDV1f
         SY6icqMvmK3AQPKqy/TqVhBTeZ50RX1B1rtIbKe1xNW0ANTGAqOk6vABO5snHP+VGDTs
         +HLkAtmIol6V0IHt9mte0gAss1mAw1CoTj9/2o1t9Rd+G75jtZJW9HIlVBlOsCrJBkfW
         z/+3YfIYVKHpTnNWXW2Prrcbu2AQCrHNgKtfBGjod0ECLls0kRUNiOA0eAPCNxsO+70u
         lg5g==
X-Forwarded-Encrypted: i=1; AJvYcCWhMCJn/0PPZlDo+SB9ckxRqdvqJR+IXYBLB6C0MtVTSSjmkGxSQwta/8wdD/wWg8m6efO/7ZhfQGFKE4kdXjgX@lists.infradead.org
X-Gm-Message-State: AOJu0YzRsKBirDG818mCZXPCG0akcGQ99OpjEW7Y31RgzwT9Ep8dHWXM
	ZFE+m5pAZSu3HhKLI/gvnQTpdnvZe+9qz8IVC96GEYffIvKnnzqoUDghJiy1kRM=
X-Gm-Gg: ASbGnctoD9+jnmY463bDHeVSDrSyYtGlP2M9PFw1z24gqZl20xNEvJyHLguX/ozgKEG
	LvalPna64+ZrSOGpVlPfG3mVhmokKaApAeybeoOATuYU09G1gcVwZ55DbUBpJ4YlWV9ahdxN6KX
	In/4p1H2g4v+0aiLk7aujA8OS9GLUyxcB16S+5U7V6Dt36UO5iRmh2kXji13aEPn9072qyuUI8h
	C7tioE7g/Bz/x8CA25MXElVgwxlZzFaV2zRsKbSijPVf9h8cnWi6Wq2kJ4n1cUL08wB4Y0s73z+
	2pNKx5zXVgWBkjOC2ab5mgS3vDodkbxWGAueoHfceHEXYkU=
X-Google-Smtp-Source: AGHT+IFvAZmo6NQ5OijrhciMN1Nhf7aIP4JbKjIelwmleIylRhiLnS3xjpZn3CfOBVpMLOLSS5GLhA==
X-Received: by 2002:a05:6000:1889:b0:391:a74:d7dc with SMTP id ffacd0b85a97d-39973b048fcmr4580230f8f.50.1742481310086;
        Thu, 20 Mar 2025 07:35:10 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:35:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:11 +0000
Subject: [PATCH v3 2/7] coresight: Only check bottom two claim bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-james-coresight-claim-tags-v3-2-d3145c153820@linaro.org>
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
X-CRM114-CacheID: sfid-20250320_073511_716766_F4E6B124 
X-CRM114-Status: GOOD (  13.50  )
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

The use of the whole register and == could break the claim mechanism if
any of the other bits are used in the future. The referenced doc "PSCI -
ARM DEN 0022D" also says to only read and clear the bottom two bits.

Use FIELD_GET() to extract only the relevant part.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 3 ++-
 drivers/hwtracing/coresight/coresight-priv.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 8471aefeac76..26d149a4c579 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -131,7 +131,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
 
 static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
 {
-	return csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR);
+	return FIELD_GET(CORESIGHT_CLAIM_MASK,
+			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
 }
 
 static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 82644aff8d2b..38bb4e8b50ef 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -35,6 +35,7 @@ extern const struct device_type coresight_dev_type[];
  * Coresight device CLAIM protocol.
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
  */
+#define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
 #define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
 
 #define TIMEOUT_US		100

-- 
2.34.1


