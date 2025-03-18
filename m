Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884DAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALchZOot//FGgxa5QWuInvWCPSBt1WNbqrc9Q6XX+5o=; b=oB+MzdeTlZG0WVXl70dORJcqV+
	7Cmj1W4hYgeXVaLJvejdsVDZaDkb1Cbd0X6nIpWNtwJDz+I8JSREVXGKwzBRvzetw6cKeREELoR5H
	hcFAJs0ghdTtN5ozp+DV47+lWRF1HPb/2FExUvAvlIsbbNOiII/KrJJsKa9mWDucfUbJgUXlQAiFv
	ERb5wLIyuDo/AEkmOgjyg3guy7/OwaWoLXvFbdbV1/Em04tIlCxKpuderuSUuaFxtaJUwJkaXscBr
	ZBWuX3JWQGxmsh/Pm3RLIICgqEQIoUup9d/LMGsk25rXgTN5HZR5eMZhUuNAjgCNig6zR6yMrdd3h
	4DvTN5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZod-00000006XDf-2lrD;
	Tue, 18 Mar 2025 16:29:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZi1-00000006Vqj-1TYX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:22:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-399676b7c41so1529668f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742314948; x=1742919748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALchZOot//FGgxa5QWuInvWCPSBt1WNbqrc9Q6XX+5o=;
        b=UgJAHqSWIKW3BdX0F1MX+xyGsOV3orj8OIIhPaSpHwYMIX1zvMeQUUTCSeyBTZLAP/
         YDn1b3+b3AM7inRNkg0BZoysQLc1vrAEfeOBNiRNYz+00D6v8FRj/ucyWQt2eGVDjd8i
         xdb334IZz71wlslviZv5Wjh29CX+23uuetBmopAvJ6KB8X0sK2wOkfsolbjY6YPNx6Ta
         cCDKMnvWthTeo4y2+jBtx9pMtFd4+0L+Xu5zexHrI/KhgbVJUY86Kd058hg0Aody9vwQ
         Uk/w4jPW7VIL8s/icR4NoNv494wJ2fRldeJwDUkS2yyONohpad41RyV2hfpOQa3zl5rK
         EWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314948; x=1742919748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALchZOot//FGgxa5QWuInvWCPSBt1WNbqrc9Q6XX+5o=;
        b=AhrJWMrpbwAEg4mzkTklLujC34sgTb4QGt8Vqo1DLMSMyRvlsVWAn01fMnMWBNXRNT
         otEgXzpgBLyH8vFreAQnm2qBi1NZSEVkmk57Mc+8e0L3pUQgnProTCcA1jdCDjJ5eisK
         csRaTTX5g1I86TwisQ9o3tr8mDYt403Jdh2lHhe78TJJqoDv+4Yv10/jDSOEZ08fw57H
         VfoKDXzWyby3R9SJNNHg4XeC/BYaYZ0lgKwxfuYi/K3lYohFgMDw6Bp4bMo7+0EmvxCf
         3XwK+HMXsp0mJ6tiMb6XzoYyeR0s9OQrupQCt+PwN3zDV21ouoeNDLX9MwrHuMDOVQc1
         vd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPJgwhwOtrETPNzSNHiyw3KlU7ePOkicYKzoaGj1V6EE+1EO02HFDWgvI4esx2XrCP3ZpCVoS2Cj/ioSXXHeYd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx9JRsy4NflLn36/MEe+fQaugFG5ECbI6jnU5TJ2HpZMuUGwoE
	4ESb9ZxkAkVnGZ0ifNq98wEQM3Jr3bFfPxeXcS6UQ6/7OEoMi9C5UY2VOYFi/vw=
X-Gm-Gg: ASbGncvpXt+vZlzSYsMfRyeStkN6v3MpyWApWcgDjuFYgTj3xUNQ/5n+xUk8e6iIGiM
	m/9qXRa0861gZ/p1nUIHtTlfZ9tpu5wXU22IBX9JDfy5mxqLL2iMqCFxUjE2tx8ReOCeLnf1siw
	Q0YdYONvAVFOmBaPmv2mMODNsqFyYZKhc65qi3tQJX9pJmz2hX9e7FVruGAVkxM8s95pJd/eIks
	0/gHFyyOv+0ov9vJqyRBVFuNoafgTb5l94Kt8+1bwPXOsJLKbwlWhMdN6xM3njmW2UunuimXiVR
	zCsfStRm3eL9FAPU4VJFrGV6ZOKaR6vRJLo5OP7o3n6qmjWveR3UvcM6ig==
X-Google-Smtp-Source: AGHT+IF4rGnbGHEoa5pDKJFwrg3P3FevDrpaRcIRwif399qLvhZbFXQMfBkg079H3FFpst3W+F7xmg==
X-Received: by 2002:a05:6000:2a7:b0:391:2e6a:30fe with SMTP id ffacd0b85a97d-3971f9e517bmr20040164f8f.39.1742314947911;
        Tue, 18 Mar 2025 09:22:27 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:22:27 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:57 +0000
Subject: [PATCH v2 3/8] coresight: Only check bottom two claim bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-james-coresight-claim-tags-v2-3-e9c8a9cde84e@linaro.org>
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
X-CRM114-CacheID: sfid-20250318_092229_410535_B6C711E3 
X-CRM114-Status: GOOD (  13.73  )
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
index 9ff601e2415a..e39043a9551f 100644
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


