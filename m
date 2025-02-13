Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE0CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brfPicLLdkrgI41YwzQ0UGM6yUtJtaTRoCcFKs9+F6E=; b=bq75Jt2+KZHN2geOeZDAaL553L
	cmiiUGA5xyIyRkYvETjbcutxtU6JcA+GscjfEAa12b/vwX42bnLjuNQKx8rSCRqPl+WAHNqJCz7Ai
	uvl1coAr3Qm3GuaV9aCI2uXwCe4ZSOHkCtDCAIGpaa1Ugz+DqEEreV9iXgBq/ZjCCb9OyGzglmXcr
	b2KWzgveGnXZDJu4Xb4rOPXLtIAL2OfzbSk6QXtk0MWsCNUMRTuMh84gOaGDmfLGNtRV3BcK4AwzE
	mgHHiWkelw35bU/vwez5gyRmpNwoDb/6xZeJ9PIyZnlk9UZNTeklZcQ38S6UbIFSPizuKW9RAFAQc
	GCc1vzKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaSl-0000000BOaR-2Ax9;
	Thu, 13 Feb 2025 14:45:11 +0000
Received: from mail-pj1-f48.google.com ([209.85.216.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaKV-0000000BN63-2VAy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 14:36:40 +0000
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso1436087a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457398; x=1740062198; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brfPicLLdkrgI41YwzQ0UGM6yUtJtaTRoCcFKs9+F6E=;
        b=AoO9amKu41xHPhhLPlEK1p9xKdSpLNnUs7eAXiJungQlg7rR9CS+faNN4Df+OPiePD
         vW4wXlIV+8JeJlDp2Rp2U7qusFovR6e4PvssITTqMoOSFU+e6351sz3nZJB9ivL27bvl
         PnDmENhda9TgaamSGtjeMYVpHbjVDj+H7geD5NTalcjFPZsKVPWdnW+m3Ts3ljysMb1s
         0+msKfAip3IGSDaB0Ycw5P1mBv2MdZVb7ScvS3mb9Gf/DK1mxmaI+0O/N05aPy39EG+/
         iEqX+LD5VnKp3UznjS0AGRPXEbWZzDtZztzSSYMSIcir7V9NRWMbzUpD1vUqAhxRkRg2
         FFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457398; x=1740062198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brfPicLLdkrgI41YwzQ0UGM6yUtJtaTRoCcFKs9+F6E=;
        b=Sqhv11tsXh+HNOXpRGoQhpdoczO8tOL6TC27GoTqQ7vDSa6S4Sy8I/yfop9dlZ6sdV
         A99VGWUKR+3MrWm10BboSaOXDE7dD6y6xSICiXLcVeyDnTnkUMhwtT9myvfzJkTeqrYr
         cBG/XWTFHsuS1XtQEwePeSQx9Yq8dy5eD8FNYKiQeB1SZIJygrR0HUzqTg4bVyeLNZrH
         nlVvZcrsnhrhC0QO8I8CQ4OpAlAB1SX9cs2tLwSaHclJY7dIAbwA7qaOHmiRyYfZU7Y0
         H20EXxnuvsLIzECbQDz0i7XvsnncfFp3KO1N9QLvmI7fB75tADj3WDIQKsE7mvpXi6NA
         dLXw==
X-Forwarded-Encrypted: i=1; AJvYcCUlrCiPEbGFT+RiWUIfxPIJGoBJTRavv+yHLhnDQ/jLfWlBIFElvPW7Een1UMeu4CRY8RCTLq3ThTy9cFIjX4Vv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt+Ehg+ehHHd/8bnL5RIutMXpa+Jo+CvM6sDlumi0xtcPUhmoO
	/+r9bQlmrnfky6GA9tQ6Um1E80Ww9MC+LPHLQrVqupyHYVR6qItl
X-Gm-Gg: ASbGnctdEbGCiJymzBr9zLjvGnFAdFiOXCwDlrUgIlxDUyot59t3gBNEC5da+hcHqZj
	A8QPzqjXVYdNF6TtMoSmcfTRIer7FMyk0wNp39T4KNbq/LpUo2uXTFzI2vHml5KCnfZp44y4WeB
	MouRrC3a/cfkQrycz2/AKMypfhqv8srBj9u0XJ7Gu/7/PzzSyOOXkVrf1UA4tiyVclyzZ/bp5PZ
	mA5Q4ygdpzwlac1uc91LrjhoKZUYw5hAFgWd1WvtAghrPna58/jZ8/gYgrUGtsNnysIE4dJVbVt
	ZdGHJcxksFsPoH7JpQ==
X-Google-Smtp-Source: AGHT+IFsbySmksHdNXy81h6YvNNHE9BZZniwa0ueT3pNOciifsTo+H4RXh2Q7qtiAxq0zRNb3OkIGg==
X-Received: by 2002:a17:90b:2c84:b0:2fa:229f:d036 with SMTP id 98e67ed59e1d1-2fbf5c6d38dmr10765873a91.30.1739457398543;
        Thu, 13 Feb 2025 06:36:38 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:38 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 22:36:07 +0800
Subject: [PATCH v3 05/10] drivers/perf: apple_m1: Support
 per-implementation PMU start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v3-5-be7f8aded81f@gmail.com>
References: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Ba6tnlIzm8hDFqRo9e/Ta1Gy5uti3Gdq0jOkoUN6OGI=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNj0lJErC2qtod+ZXsZ0DIlOQ7lXM29HeHb8
 16Uak6bYMGJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYwAKCRABygi3psUI
 JN/TEACJUDyO8R4j7kouUyMBNb2JHE9lC3cKD8bqCQzfNvC76EEXAWDjU/hSOhlybaLWuX49jWz
 7LUWeyJ8wa0uYH1LnXo9uRc3wkPM7jPGW03B0RM9CYNXlZEiXBmDBHXopBCGHTATsm4yBHaXBER
 d579EShfjFCbPX4SEGp/+ZiJJti1ou2PrvFwwhWJi/jrv2ZrbahL7L44G+YO+DpwBJwoQ2iotGr
 Og1pUY3cz8VtM870No4VidVKfEg0x8sarH8YA2rRo/W7NhMcdL/ZlzQdg5DaZHGQwnA8IwCuUT2
 AZN0Sh+fJPPpw3DUwOYt3KzPNYk23SNoFpt09HjU6faa82HxuPSRIlDEMz9G5hO/fheW7DcaBof
 Bz0SEOVOzIkBr9n+llUpcgvRB5WdtLCQQbVFuIBAVef6axVN5tNmnoblxfFK90Y3tpGvwEUbCFa
 o10DMLnJpA+sEQrTHmn7Ooy+vtPyeXbLzOW2hf2VaEYDeaNmRE/xWuadyfx2ihCEsAGFWs7Ca6b
 m8GfgEGd35ODmkNC+jv5OA9fjSeU5G4cQjSLt7WpzAM1CM1jCSzAPBK2OwNLLpAvml23+xMSK5o
 auUNFvJP1u3PY6S6DGo3ikDQiaDosC9uQvGYW/4Gu+lEMIe0HV9CSfSzKZD+o8nc84YFfhs+Qio
 UPoiQr53FGZvOIQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_063639_643877_3C8F9EDE 
X-CRM114-Status: GOOD (  11.33  )
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

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation start function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 73ba9861a15ff931b5e388b6d809dedb140e2292..b601d585d204f9e59ad7f5216679b97852a46a04 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -608,7 +608,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -625,6 +624,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -634,6 +634,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -643,6 +644,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -652,6 +654,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1


