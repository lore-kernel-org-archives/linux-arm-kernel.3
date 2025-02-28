Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5D1C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EN+eZpJ9eIG68InE3GWCQVcY+xomBgCqyQkRTUGWCeg=; b=JFAlWPal13PT3wJL9wT1P0t176
	H2UxJ5EYJUoDgUQavA3cFS39i/B5MpPEJKOX4W02HvAa0LcgRImuoqfO0od7unrEhwdONDKPAuMhO
	X+08+k/gSMhUYcHoXTC1HaF3sbuO1mJscHMtS3uYloaahu7t8LpatPWMkHVFxDx8hbOPM6xCoB0jP
	fawj3uKF25BzmJa94wHMvFqDFCoq+kUrgLejbsy0uhXwPFpPn769Aa7BG4DIs1ZOIgyS7a/cijDU0
	A5TZuutwfcP5dM/MdmMjrO08wTM+I9P/xv+vi8YBDGjWK+AZ4Z+f50tIShbAatJuZNBgEmmDb96Yb
	SJ7aOIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrsQ-00000009iZ4-1haW;
	Fri, 28 Feb 2025 04:21:30 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrjb-00000009goC-0wEQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:12:24 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fc0bd358ccso3262251a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715942; x=1741320742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN+eZpJ9eIG68InE3GWCQVcY+xomBgCqyQkRTUGWCeg=;
        b=P18tQtE3oBUa+8cajALcnDC7hFjrvczFliuLf++yiR/MZzdHC8BUsK49ivI+fBLr37
         7knXtniCd3OOIBw0WR3p9UfvOHuWvx3ocS5OnmazeqtAehu4XiKgbrxeO0C08asHGiKJ
         V/0A3iSjX146ENw3THkVKhGLa6N8+UTTgolo+w5LV8K2CUOQjtAk7W+iqOzr1Uo1iCy+
         NV2ZZEJUDwn+5LvkUF3A/hLpXAS9WJw+390uKO19B/HUKwzCW7eid890alyV7inj0CGV
         9uyJogN95ZgjNQX81k1S05HSf4rhlclSEf+nha524PBpI/5+aTgwNyLU6WxcEH4/PMYI
         IHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715942; x=1741320742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN+eZpJ9eIG68InE3GWCQVcY+xomBgCqyQkRTUGWCeg=;
        b=bXchFn1G7XFTY7dxBfdi1yo92qBcIAJFpPmxPByPH3CLSGsk0YpKM/FiqPCfvyRUdQ
         4HlfZCw9bayHwmW3ReCLZcbrkuiXsXSInKoKFFP4sQKxe9xc9OOH5t9NHP+86p32vEwa
         Kd0F499P5ATNLuKMpd0zp8reVISk6PgqAS1/rSWPMJqmvdhRcN3WDID6gJpvhB4w3fjH
         eYpV5rbcjvQiAJ9H53oi0V5pZ05SOjFXZlXBCDHzhdL5HZm2ZPRSCAor9hZwCFrVQtqx
         IlumI6tuArhjNic8NEKIKdSUCAfh9aRIZl8YR9zEEuweKdUXEvs//q4en7bHCDz/kqvS
         c7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNSF1cUDYel8375nxWufZ+mvoQ7n9Mk79JvC5bc6cHQNU3WEXvbncbcmULciPMDwv0WXIdGAaTl75YUnR7ExPj@lists.infradead.org
X-Gm-Message-State: AOJu0YywuFZZdV4v4ctO4dkfjN44zpy2O7m9WIOthsxaerbJ0RXLP/5A
	7DfwFqxWdoFoeX3/zpuBCy5srSQ6sH7yQtFih5eC5xO5NCixMs3H
X-Gm-Gg: ASbGnctT6mu7Lb4/4RGOmducpWwp6aboYKVOmrPoRShgwR57EGgcbjIg1YyZKeGHIGs
	XLMTl2KvGVS7eJb08fpYrO/Eaq4wRgbT4pe76Yko8qUX80VBX4ha+T5B78KMEsAE4yNwzYLhKHA
	CoP8LSjk8CPUQp6yQZ+Xiwb3PsrEZqrMNJ796ggCpiFArZ641eHJwBejUWLTJNeKn2iDVueUsuy
	eoRSisPz0nlvBXK4/HEp6urDZCLCpg8Ng2p5kiOAdQG+5zYP1qeMqKmgIWnQkQhXVw/VjJrcf4z
	axg8fn6Np9dP6GtZIZ89CkmmDSw=
X-Google-Smtp-Source: AGHT+IGQdF6ah7D8WVtQqj5tlB8T681HfUUtCnXKbIkwtEbPe096u1zDzUDD1CQAFOKPJ1x9jbndsQ==
X-Received: by 2002:a05:6a21:600f:b0:1f2:e31c:527e with SMTP id adf61e73a8af0-1f2f4ddb787mr3214705637.34.1740715942338;
        Thu, 27 Feb 2025 20:12:22 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:21 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:45 +0800
Subject: [PATCH v5 05/11] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-5-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6YoEPxJ23tlB05Hr5lEn9IwiUxu3JyxaBoeQXV7L+7o=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeIR+A7oyzynRaKo2M82R3bzQoc3Ggu14u3u
 zrqtHcCrbSJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iAAKCRABygi3psUI
 JDNpEACnujBcz8W76KNJTc0D/JzlK3t8TEZg0aeoZGLcmlkABBd0w8zO0HMby2QqTon3hXWcGUe
 fsd4HCdSenkuFlu3mS+Sh7moZT6CzOFYAzTA60Ltt6/Bte2kaN/SCDABXf6ga/pbxt8I0DNnF9y
 JvNha9yZ28xLrBaTSyUaVsAmR0ACZJXAJrbvMiyO4RpIMT/zoYjNmJadrTb3+WaFLnEi2yxIJIJ
 mQ7cbjVF2Gnf1jI4zM09YTGOrVH18fumF0/HDbfF+RUEYtKKBdsMdQaTQ1UN4XgoWeiRusdu9h/
 mGQlPUqJh98gPeoHSZTlvZONKsopGoZxpngCebQOjpoH5RXFJnm/K7AqWPHKSLPablaeR3KXlEU
 xNxBykfAX1om8ceJa2QydGO6IhkuH1flBWV4nzmdpZQeYdJdR45c0+QilOFfTKx0PuswdGxl8II
 4YbZKPmzhg/mCpl2a3vHBSmutsC/WxFjg7RP7RmJY0fu4FHSRkPe4hEq45Hp2XOqwxBAAVvRL9E
 n3mUulLJW5pRGT2y6vRzEU727ryGX3+GzyPqhGRAOndGTfUKREl4iIGQuu5DWiFJG4m/x1cDbie
 CtkVTL7XGxpL57bm7/uyR+3YK/QdONoVo8UL81RV+nYvsCY6T/XYRX95GI8ofPO5tWalAJFT26Q
 ZJmByVzMquGTX6g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_201223_266189_2E2A87B0 
X-CRM114-Status: GOOD (  11.27  )
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


