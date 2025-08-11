Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60568C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9Aanu/g+hL9gq0ALIBjFsl0W4g2TJYUNRbSh54dgYI=; b=lR3Kh49gWERMmKX/guVSMgBhWh
	KhXqvujcN66pBri5NEl5eBwI8ZakSmtx//slJSrq4N5g0GqlP5DTi+O5VSCeHBkiks8oNBQEk0Mes
	VAzxcN7wgqAPkJDi0UTf+GAkZv/oUnq3hecmQCA9zxZx95Ze4Co2WcPd4K+OmHKlLFTiasCDOhE9r
	2czXyuwvbo1ZPca6WlhqR1MZM5omHrobMeqorSZoi3JCtjZYPdAv2Fh/kMWRF3PYh5ZCD5GgZr6g/
	FGwB7TGqU31EeYbxd8xu+3JRRf/IX8Lae9VjkX3x5KfCG1XHpRKKnMgohlYOsGiZWHMPsQX0HIwfR
	ElDEqqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTsS-000000086Dj-0TIN;
	Mon, 11 Aug 2025 14:51:56 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSzr-00000007txG-0o9F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:55:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76bd041c431so3772992b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920530; x=1755525330; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9Aanu/g+hL9gq0ALIBjFsl0W4g2TJYUNRbSh54dgYI=;
        b=X75zBvvYMWCY6WOTvxMo6cfxQHV7a+Ghqb/hNaPWTAJTXcGR3q/ufop0WTyk1OYS1l
         rImGGhLwQaS5WqFDpnxKm9Ud6Au5VeB2n5XYn9XcP5c/wNNxlUZWhsNDE6lXTekQq5aa
         kGga/clk9nTDGK57/dvlxjodwzvGGppLlkG2MuTmFfEeO31xzjQVOsk+uYvV31ZqCgNT
         wkSsAIsclLxxgycD7mUMJ5ERrryqaUygZhUl9+s6hOzakKxmyTB7sIT2w+IJEZrH/XV2
         zeqa2SZ6YXyoUwI7gL946Ei2FpCqhsAB+2f6j+3B5zbwqejKK1IKwDlFhl3dz92xnv6A
         Y8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920530; x=1755525330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9Aanu/g+hL9gq0ALIBjFsl0W4g2TJYUNRbSh54dgYI=;
        b=UsmsWwueLp1qEZmMkU+XychmIMEaOwixRH/kFRS8A32pFNbrOMXRqsuTjaEqyO9tCI
         Bbd10Uvv+tAegeSNj7Y9Mt2yRddYwmKRyzldgV9k5X1crm+VWvUQaQdLT14w6rECCLrT
         5AE3cV+QjADF1RIc6zguBo1tux3nJKUGpqhGOmN+7+Sj5HBgPAykyGtzZqYOZFSKeG6E
         l9mjd5HfQ4pXKV+9cJSBDjZALkVdjC11rByUF2XRjc8++0uxmV0hreFLYIC4BWroV9HB
         clwBi6nDDzlrEAuZIepjEBvzoak4jxlXfNAJjGeFwJTgZJrLmaGHxvxYwBjNXXbL9tsm
         Faqg==
X-Forwarded-Encrypted: i=1; AJvYcCV5n9aep4fx29veqcbyLeZTQoxDTXDwSMWck9OHL0ci6TLQKRf4ITpyRBqpY4vcolgg4GiW43I/NA+YA6tZgf4W@lists.infradead.org
X-Gm-Message-State: AOJu0YxH2DugLZqIAkZSaIe6eJ4cFRi8QTJa9OhdPC/2bAqIS+4GjUXq
	bpgV6RZhcympf9PC8BKDhwOahabtgtuW7shWB6UZv+Vu+mwWTnz6S8sT
X-Gm-Gg: ASbGncuuCOv4F3CadcUTnNbxq+ucXK7uv3Z2grn9cw0cVhK8BFSvQg7upZkMt6Yv4xf
	h232dWEEVIXNtKeW81K1VNxDn8hjsHszkx7yCU6ac+wgyG6812L3ks4w9hkRqBPSh3ploUFE6Aq
	WDLnWW/Wx7kXQ7kReI8psP1JQu83HloVS8gu1V1M9kfO8+mYKcZP5YhQp9scrMwbNAielsBVPtH
	DFm0UDpBM05yheK6bOro2JDqZmCSdA5MBnhEumVRkgZoK9DOv/kKtZ6fhSFgZuAh8kBRZnBVXWm
	2EkoTWTXy5m8qexz+Qv32A8LcYi9u13KAa2O6FBaQk2j+Atj1mEZjlMG/exjR1PIjSo+0HwR3Da
	oAa6Acv/SZKg3VS8enHWowoINPl7Ldy9nsggMF6ZNIlPcV9w=
X-Google-Smtp-Source: AGHT+IF3ZrUSel4K1BuqKwEOc9pQQQUf7+NY6zqoq22ESLFTV8EiYkuG39Kx4E5+ym6f4Xi+Pvqjig==
X-Received: by 2002:a05:6a20:6a23:b0:234:80f6:2b3a with SMTP id adf61e73a8af0-2405501aa88mr20984035637.4.1754920530416;
        Mon, 11 Aug 2025 06:55:30 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:30 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:34 +0800
Subject: [PATCH v8 02/21] drivers/perf: apple_m1: Only init PMUv3 remap
 when EL2 is available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-2-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/PeiCZRRXTs+WYDUarH1jFdEbam99TBMronNZaQIczY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZAjJ6DSFyNEbqI7WQb0Cs1/cpoqcmkC5M9x
 edA1YRSzTyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QAAKCRABygi3psUI
 JAlRD/sH1t2xS6IlKyOl1wO70gblqwbM1KqyPFJvf1yS37xaYtta2EkTYwoDnFJRADzM4QOucKk
 EuCEThPdttD95EZUcAjkRVe+c5FInsMfLCUlOnBzOXh6pI7mU8f2l7On2mMyuRR35Nnj5dI1ZqN
 l4Xozo6NtcqOHGkO2In7dkEqrTaiBUFzxdkux/24RHK2LgD5KvuFi/v2PL+IgSxWtB4NcZ3pZGe
 q2xTGJA8h31gqwrZSAhU8NZdDFEqa6vIXJrbuqU3KEXB2xFoBXo07TvFDIBsdX/xolnlcSse+G/
 85NbGGinRlTvj71bYqnYES0DChPgkFHyYdFgevzSPIn8jU77Czue3U17LRln3D0yhQkTW1UIJ+7
 jL/N4QyZj2sHTMqcFIyqtA0QA4HaR+vNf0sSnYVpcv5+suUB1Q2H0LAOxhp/3GpboWnBnX5gi4o
 sWCHwFDJHbuEQyjfKFZYLoKpC6CwfYDZKt9RRxjbwwcZn/0wb2YzTVU46pgsEyuQliProBHsmyA
 MttHNUmZxVqRt7qJt8eVNu86C3ZFZr+mPqeOa2Hd32VVqXsuGPKN1iLkhKDZbO2BdctJdCyhykG
 lAJLxrUwg9aSmiXbsAIFyhpzqSAJlh0UBDKn1GH3sD5h4NmbdbX2msqe9IhVZwvtXLQ2kr62VY5
 oFjjgMuO95pcYYg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065531_236738_801D73AA 
X-CRM114-Status: GOOD (  14.11  )
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

The events in the Apple A7 PMU is very different from the ones in M1, and
EL2 is not available on Apple A7. Instead of assigning the wrong PMUv3
remap on A7 or declaring a new PMUv3 remap that would never be used in
practice, skip initializing PMUv3 remap altogther when EL2 is unavailable.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 81b6f1a623499566ef04d04075752f34e2cb6a92..f3948528e28e0189efd0f17fde0d808930d936af 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -645,8 +645,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-	m1_pmu_init_pmceid(cpu_pmu);
+	if (is_hyp_mode_available()) {
+		cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
+		m1_pmu_init_pmceid(cpu_pmu);
+	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;

-- 
2.50.1


