Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A966C71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8V1iPWcqNA0HiKYEXXLEH80k6K3piZxher31w9nAbY=; b=tV1fLTCnwsbqF7fEBoapZeIf5y
	LIi69IpsHW6gdmaGYDuzPTGaVkETGWDxkGmUsoTySkvSUDqZxzkFZ0UOO8H0cqKhh2aH02ktXvaQG
	ngthHgAkGFP5OvrZ5kV2hd1mSvfn8v0fczaz+yKhp2SUEJcaM2C6r3cCFh3aHTR9R44yDY3j8BXHA
	+WBe9Rl98go6Wk+mVVQEgw/rihiXeoBcivW66FvWdQoKrRUcJ0F2MV+YYP8C+2nejL6aJwiaSSfgD
	8VbtIp/Hd377JowD0i+pPOCChQtzP8zN6toOB3AJrNk5PRVYqeWG5PvVkTERYpP8w76ztmxtOPI0U
	gOgxpsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyxD-000000036ou-0iNo;
	Mon, 16 Jun 2025 01:48:07 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyiA-000000034GJ-1rlV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:32:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2352e3db62cso34063305ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037554; x=1750642354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8V1iPWcqNA0HiKYEXXLEH80k6K3piZxher31w9nAbY=;
        b=PClIaGgf2pvewTBWIU9mLjjvgGSAuGOMlNdshemQs7D3V+0Llr/1HFny1XSDl1T/Yi
         5BMPdF/xvaDIHau0QzCyb+wyyHHe6uQbtxIcVZZy0eZKF/1se9MovkrwNY5NoA1qYlms
         BPy4xbTCT6QepO+3gaPwnD0nPvlIVL8i+WM4b47hKygI4e64Ls2DYYpyxkPvR0sg4MH+
         fr7n/hO+NTm+Hem5L6qbIQsky8rPwFe8E7prEcdiaD1uR//mUlCmFnj7kCvA3Za9RYLy
         FB08ifO6qZOOTLuqk1QfJC5qA4iGeRl7ulgDxZOPM9/mjX4wwwFFOgCl///rst5Kn92W
         z9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037554; x=1750642354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8V1iPWcqNA0HiKYEXXLEH80k6K3piZxher31w9nAbY=;
        b=pC9meUkvMsNxe1GBxW1kymR0SxDuczkdtmwsQ0R9XSDv3rnviuneZFkgOvonDifZ60
         wsNaoJb2G5e2ajKjVhyf7AIA0y1y5DEF262Y4QbTSaBhMHNud5qAn+WTfxOw+89uQx/G
         t/3FFu2rqlmm6gbqCBpBHyHKBo33HKioQ3HokJHbQ6lnJJxSIkASlagvyKyqyncaT/+W
         9RkSDp1dBeACwSpZ8f+Qyadm0mdRjJvxLEI62koTAGQazknYN7wa6Io6/UvIs0ZaDccL
         V0AxAQGUJ0tuzvpQaMHRDvCymE3RRflfoeryoqmto4u9HfTYyLJqIL0vMK7HmpT3M2/l
         rGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhtKYpiArl/GkNv2eGiAU9U9qF2E1iY8ahLabG4P2//XgjIjxbCq0ehKO44Zck3QSUOup8QrIL/5bC2KmmiT+1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx16GnPrlFpTofUIDuVgUsy1xAXaDxnWBgj6O14DEBvEENvIATD
	Sv40go8wmFntj5AnKRFblT9oNf2kWS6qJYwEaepEI2tKuTDuagtb9R3B
X-Gm-Gg: ASbGncvGpYXeC251bykbjx6v6ITmA5BdMtxEtX5oTfHjo6pXjKwjcZpYDjkrIICbjKH
	8uFO/XIvi6j/AnT/iwyCtOWDdfTc8WDQ91qZHipdHAG5s70OkNgkBkeSBvogY8TAU+b1/G2r0X1
	YXL9/QikYmsOB7kdlguHsSQGAznC/t1GyFK0kNJjQmOtbjRG6pz2NwevlD4hhBntbYnKqY3bLHv
	Vo4Qh7jGB7gtFNwxFAla5UnFssGlyo8tMa7UNMtb2jycaatHMKyNDO+aphIhvUSxRuUx5M4ujKh
	EUbKNfX+6aFRiPOV2uVmvzNHnvzhwAIn+05rq80lxcwGQbqeuXDH8PwRLWOrKxPl+pWn60a1W5q
	gDT4=
X-Google-Smtp-Source: AGHT+IGnYwyNO6goCwhqMS76Pt1h5EgguWJW1w+NAgLWXSvJ8YRko+g652YOdF2HCeek9omQa3nO2A==
X-Received: by 2002:a17:903:3c25:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-2366b137c14mr110398865ad.37.1750037553638;
        Sun, 15 Jun 2025 18:32:33 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:33 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:55 +0800
Subject: [PATCH RESEND v7 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-6-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EHqn1hF+O5cx1kCcX9b9emwg/l7WZgXjC8JEUTZtaNY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QXUmwc9/dCynBWE/WKymn4LvmWDoaAkcPa/
 twzLeqXmI6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FwAKCRABygi3psUI
 JJt2D/96iuNKzAxGnEHVosM27pNigeAU5uos6CMZyL/eSOYYapNkzJGuEJOz+7fmbN+kamRLRxd
 f8iUjNFO8N9IYliG2cSGn8hV8NudpPs+0nbt0Iwz9QaZ0y+1XPMobYMvrRw/DzYj/YPJ0boaj8P
 ZAHPMAnw9roc9EoJzyyvj0+CwkgwVGZ7SvuYWsAJ1dMLtRTF0Uc4mtU9feG3KSn8xcODyBwcIzs
 eE3aNyPEtCBLqh26Eby3t7EvnNlD01HiJUIIqQAT2D8tHvqSwuHBujet9sgHIw58UjEz4h0vRWm
 JhsJzu1IcgoQckHppjcxvB2xZKd6+Pkoe1rmSpzRPJFu16DGsD7sCOYJu9dZipGb+RUBWmpiVIj
 hCy+2FSj53gJvQ1TMhO9kCi+4Dqz9O3VWV2LnC3/Sd6FaYJcy79vf8hFXy9sc/OloohbE1+7xOy
 unDyyWbfXnGKkOw68ocKgvFSZinOEtgnGzsw0MPrllKDoB3wmXTUcAOrjySr5NBQJrZHFjJSNfz
 4OX3XhU9PKPAb4ZPix4I/LW00wGMyaJxhGsN1bkS+mFkX1tTaW9OPZYUXouet2u5E6GYn433WMb
 IQrseHjlezYTW2fVewcsPYXJqXORyZfrSziRAe4NE/8YvG6iUVjYdBr3LdcjVFNDD3p79jFyz+Q
 DTwodajb9kcd8iA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183234_487200_7B1068C8 
X-CRM114-Status: GOOD (  11.06  )
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
FIQ will be added, which requires a per-implementation startup function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 6736909a7df672a08938a392d450dc9b5b7bce9e..f4d8da4a8aa0c197cd16af422b33f4cd943d379d 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -660,7 +660,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -682,6 +681,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -691,6 +691,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -700,6 +701,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -709,6 +711,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.49.0


