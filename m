Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F333BEEB57B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=562CWWEEZvkhVziZnN5oXKTCmOhNnY9tXruJsoQZ0p8=; b=TNde+uPJLPfVZMn44DESt1ONAh
	EnKaFvnyQQlNH05tulhZgvrER+bq01+G0aunI9XONTvylhrTONWwM/WOBSI6ccA0Sk1q3p91OCWuG
	/6wwpQFOEzkv9XDvc+ftYNs1TQTBFCk1pukSC2N0ES1miP+56oPak9bANSLAkVrh1LBhhe8CatIS4
	rrhzLW554YeRdyVJktUiT88aI83tEGY5R1EgewR56+nJQpxro9yhJHcVH5OuouPeBtyuo3vx7G0XZ
	NIvIJJgShnOKntEJjpM1EKdJdk5nAOXnqu3O855wxHuRWZIQ6EE+5dmVbTstZPzlQ4zWH2BVrNXBf
	mYcHLZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaA-00000006ifj-2vrj;
	Thu, 01 Jan 2026 09:02:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEa8-00000006idT-3RA2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:02:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29f2676bb21so155326685ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258176; x=1767862976; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=562CWWEEZvkhVziZnN5oXKTCmOhNnY9tXruJsoQZ0p8=;
        b=PN2BMQiGWACKN1983a22EaJX8wMEZ7PxUCEdTmiN3BVP3kNF5C6q0x5TsGrZDQBsVx
         qQ533lqSjSEewP3n+A+3B/SKR4iaPqlMnBK6KP4jmlcxFXXOCpylank0F0yfPo9ACR/s
         CcL3WlZ4Kak5qGAwDYrzIx2IPdmvR3Z/bf7YRLZBb6/eAyTZUPeckRLl4BT3/fB/xjDD
         l0cBPhOPm+sZWBFxqLl9Ayp0OdwGFW/1+IEy+FYGLsthSlxrXq/X/U5pbJvppABhcaDx
         yh+/ot+a164U3crII8cXVUhDjM8z6MiDiD9q+1Q5yj0qVZNiu1PTuWVIpjRpnXF+APZ1
         q7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258176; x=1767862976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=562CWWEEZvkhVziZnN5oXKTCmOhNnY9tXruJsoQZ0p8=;
        b=Xu0qzvsDHl15T5uqSYjAqo9d9dEYZwn9A3nwvckGAFXin/DVBrS/xEbnsGxXDD99Is
         sn2O8EO+Feur7TxpxEvP5qjZxYIafY03DzAurSsc3BuP60/lEJgRq5uRfxrMeR6t+3IJ
         3ygIajb6EJD+N1qQs4VT+BjQHVcWkQs+h8g6aO0uGHu86R/yvFAJMJkLiahbFmjY5YRf
         5TdWaFbAHdGVgB4IIQIIx/o+Pbzsu5vfXeJCohHCNrOHWvPMx8Hv0N3jhRnwIoSwaEli
         KtmxgwK6scIa9TbTz0BDzjmTkyI5rGigAbE93ejlLe1QJ+XmY0Sl26PJQXccy0ONmqkD
         KiCw==
X-Forwarded-Encrypted: i=1; AJvYcCWXEHFfrAo9Ov4VGj2P6fPvNdUgbG3sKfkHfvt5y5pG3pKX7hsqtJgxRaR7XfDrgnEZlgbAkT0g3BKMSbsw76dx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzz/TKg75TjommqnKI2QNIv3MmAqAxJgIxJu2qD+AjaMKde3mj
	Dyp5VqZw1d2m/RUqZkrCFSHEusZ4IzGgHo29rgaa4EwMRmSpUh7WM7vz
X-Gm-Gg: AY/fxX4JyGbJZukA5s34NgxuPI2VhrQEUutyCtNQ6tf4yUjlL4dMSy2wK12ipZzbLGl
	3kIkRKSGN2dj6vFJ0fIquTEDJBmnNwrwSqYszvuArb3YyVWcnr0HyxeBvKdDmwCNabz8NJUF955
	KAiN5d2K9PSIKrcyb2B4JmsRuOttKs5HXXTXRJW4Z12Qq6Nsaz5FDD/+eunRfkJvMuc1esOcBol
	ASsmZr9GYU9zZIWrjH3+0pMV/VIZL5vATJtipQDBlxCaPvcA3LR6Er3WcJ0LzXCNW5WpVlqzyGG
	EYAtT012pJIY++pP1ZPuSuFDbBPbTWk/WEjcSQRWWC2M8TS8sdWMPe6RPOIPFyeYsRZzJcuUxg9
	HOlyAHHuqwPbxiN719cVSmCDzxThoveaJXNioO7MdiEtJt6vyPRJ74suV7JQjdCxd/E01aMCfr6
	3kv+37Ox3Cwdsx
X-Google-Smtp-Source: AGHT+IGvF03jWexAPJyhOO/i64xBB7TgDY1P/zTwtuv+fTjh6qLFIzbXX3lAjmk4xMTgxWdhAdn6GQ==
X-Received: by 2002:a17:903:40d1:b0:2a0:8972:d8ca with SMTP id d9443c01a7336-2a2f28367f5mr416747135ad.35.1767258175996;
        Thu, 01 Jan 2026 01:02:55 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:55 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:42 +0800
Subject: [PATCH v10 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-6-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2181; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=NU8ScGmoP75NTB+9OTDUGxz+f/5ItDBm5slDMiDdGlc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgn4+BbzPzmvWZ//5Po4M/zFrkKjQT2wI+O8
 wgEahlzfFqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JwAKCRABygi3psUI
 JEPmD/sFiwZMs7NQhuYcsTtLBMmLLgeraA1aRrIEksKSz/7IB3rYXDcntcSrfcGLZTTIgwqsm4N
 /pMVUnhEYu6wCag9SPwikW+oLIyA+dkw8vIrhEdmF8ZmoNpliYBe707KXo0pjkUQuxkjFJrdPYJ
 EYJftIe0s9FQYrwhNFqlFr8w4kpQKiHWzQ7E+IxntmQsWQdPYlsQVgkPSTIxjAJdeGrbWtO2daO
 Kl0ops2XzNpwhDlZAZFJ+38pctInGZQ7Jr/Z1U90efBoaPnrOjghj4Gk7MqL7KvHQ+DCl7PRP1o
 IqOYRKw30cZGMJBkcle5sj+k1b/EjDkURtWBt9EGr1d3vYSgsgPDsJ0quEYC4B7LFD/4kpySjiP
 CD46EcVx/ZclAF4SbtmmRrhCWr3ThPeTgKlNFRAtwQwbtcFfz8yBlJJ8GlARzEh/UrgFpJxpcbq
 h/oTeLN35rWdc32FeOephqdk7YbqymuBwWEUEjc+wpGZBN3ysz4t3XJNx2o1Mo0sscPobAehXPJ
 uMX5mrVQ1SRxeK1D/FfGxHfFMKc1TxqUrlyCwEVNAe449Wbn0Yl/XTpnJk95QTG9DcsuNd/h0Hf
 5dimwO6+AvzmtPzXO3o/i9jPLCE3sT8ezpasjGmTq+UEYimtNEaGgfWEZIIecV75BS6RXVnIC/n
 pdtZ725SgGg3DNw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010256_870985_9436D9BF 
X-CRM114-Status: GOOD (  11.64  )
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
index 6340ff7d3b75d7f0c7ab159e4114d49cf031daca..0655eeaea96b46d638b0998944c30a07f3273c2b 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -661,7 +661,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 nr_counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -683,6 +682,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -692,6 +692,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -701,6 +702,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -710,6 +712,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.52.0


