Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC2AC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xzlt1Rzvb520tIYWakwAX5OIfk/gS8FgIjZQBtZ1BQw=; b=HTs13oB+kDsJknt7qk3036AorU
	WOvdExNlMpgqQnp4tYLDKpTg9tLQUQgH0lu3B1+mRQDakZiAEbj+l2IqwsT8ltT0srbt7NbzEzgJg
	fPAMGi/BF73rQ8xl5Lt9mG3L74k1f+W3vNFlY3/d2hzrF8GrwMMb3UOfhGV3RKoxMLLghxMYqPBDc
	/cq4AehqCzlR8fkWg/i1DLNkORVelSPQ7QZ6EpWIWsz1fiSG1EhVY0Sp17Ix3141DW8s5hsmN3saq
	4CncBIWuFp4wt9zFEvICjzgwmPG8cUsZOFeunBzt5UoQGsmBXMYkpWSW8mvhmxLnwclOJ5LKVaFpK
	nutZpqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx38q-00000005lES-2B6f;
	Tue, 25 Mar 2025 12:12:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2w1-00000005iOW-046j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:59:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38f2f391864so3247651f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742903947; x=1743508747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xzlt1Rzvb520tIYWakwAX5OIfk/gS8FgIjZQBtZ1BQw=;
        b=bVYAaBGWrqytsFDiNBSRprTVvMM9WHbNo6+ofAIfRE6+Ln+HJU3O2iKEcj6I0lpCWg
         vkDoXlASX0TYfZc6gVmmmeR854o6dqeLCmxUlDrwUA8lv1qJuzYPKKphUUSD3xyNyYwX
         aUvJESEuNWzj1JC8wu/tfV0ZHDBiL9TC+tmfrxXst7mX+AK2yitT941fyTKSiIfav9mW
         k0bawzdq81TMGh4lH2iNQv2A7JtJTdsdAS9LgwhXGI2pPNtPUIgqQmhZvanhNdGtU6H1
         ZmAOMW2N7jrNIJOeYuDcBGJD78rvWlidN0YxDD9h+sV7zPyXZ7wjLKr2W8uhDA1YOi5i
         KFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903947; x=1743508747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xzlt1Rzvb520tIYWakwAX5OIfk/gS8FgIjZQBtZ1BQw=;
        b=AGrXafv6WToDpaQVd5jq49d6f78cym8uZmDHtokRtK+KiXYCBRHXNAb6Zk0tkycTEj
         d1WeB62j+KZH5pmj0X+71Nc8ocQOw7j3vXGpN/B2MhH0kw1salC4DHPJygCWVjbxyX2j
         B/mYzu3D4FI7WquIApM3VSc17BsLN6MGjYqFg+64uj9Ez/ixrZ93R7IP062qjkduPIvq
         4qwyEO/nMq6d1ap2BvXAu3F4ohNtDFZPx2ey75j1BTFGhXyE460nuIvBBpDQXKXOlaNa
         sv39Voh3nx8SdtA8I/2CLO3g9yvuhmjQuyumXkPV3IwUAwyjo+08Oh6rCOEPjz6gMG34
         QhbA==
X-Forwarded-Encrypted: i=1; AJvYcCUcI5+iA8pIBiWhDi3n8Y3SI26Onrr+qkj4VVczO1xVZd7+HmD5CdgVqWgC6RrtMmgz9GjbMKU/ygDvN6CqNJcV@lists.infradead.org
X-Gm-Message-State: AOJu0YzGUVqu8KZmM9DWQoU0LCeIci2elj3fU7algjrwrwa+W5c/2w9b
	lVgAnM8wB5HeyDrEIAi0oTW5S+WqQB04Y5yKxRWzZb7rGs42xQGWNwF4+pS+QPw=
X-Gm-Gg: ASbGncsGVK9LIhBypwr6C8pe1ffHseA6fIX+8n4nmUgNrxzMLwBrKZT1tfPZ9MwNFkd
	ZXDcX1ne9TMf0Lk9ujrc21bAUi4/TOkj+VChQvifwyMFP6kyBLhQpSFnRWhyTXzFgouH6GJed4M
	RWmA7wSNM6jSECMhZLXg4Nhp5NcDswqC48aUq+iFFKASG7XAlbCqdqdufOlHR8AADMjRrFJad/Z
	t6ZaQhBmS/W6jpaSZLrIv/Cf5KBIqBAwrad2llJRpC+Q6n0Sdklzgm00g/YNNnXfix0RvwrVJkS
	+HLxYKrfzhmiKLqrS587WtivZKJxMrFFpYAdMqatW12spbCh
X-Google-Smtp-Source: AGHT+IHmwU3sf2ERC5YZs23ogMiMNFDMx/Jl+ToaspZF/hgfKgGiiw1uVFM9CO8NyhGifaNlqugPWQ==
X-Received: by 2002:a5d:47a4:0:b0:39a:ca40:7bfb with SMTP id ffacd0b85a97d-39aca407e6dmr1134175f8f.54.1742903947366;
        Tue, 25 Mar 2025 04:59:07 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:59:06 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:47 +0000
Subject: [PATCH v4 2/7] coresight: Only check bottom two claim bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-james-coresight-claim-tags-v4-2-dfbd3822b2e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250325_045909_063235_98CB5BE1 
X-CRM114-Status: GOOD (  13.94  )
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
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 3 ++-
 drivers/hwtracing/coresight/coresight-priv.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d895815dee1d..e0638e5de0e0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -131,7 +131,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
 
 static inline u32 coresight_read_claim_tags_unlocked(struct coresight_device *csdev)
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


