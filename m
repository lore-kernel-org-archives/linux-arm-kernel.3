Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09366C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 03:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=; b=AITeLJkcNADokF5Sez11BfoCgT
	Mn6XSMiCo497V+9FLgxPW3cS7ZuTYCoHk0OPe6laCF54IUMRiN+aeIBK7WqsStGS2O5gmI6tXnqul
	zcSKn4jUsURN2YmBI1zJe1hCHk1fOn81oj9lHSWWxQDPdXovnL3DG+q0R03EH2fyBZfrFQ8JSG/44
	g7oUsavOYbE/aOfBOVQYfGhQZaaIBDHGF111Mh+vFNRAwXYMVWEJQ7ytMhRNvhcs7KMljanWwGvzv
	EOHLGQvH3m+4L/cTahLtoCDs5X5s13jcXkB3NWRoeEl91A0uqkRhdmLrXPL20qJhQzJA3ivB1gOhA
	mlL61oZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9byR-00000008EG1-0DiY;
	Tue, 29 Apr 2025 03:49:35 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bsn-00000008D1x-2g4X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:43:46 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b0b2ce7cc81so5486266a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898225; x=1746503025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=ijhFhwWdf+Qo5GqLhim6L6rtwOfLDiIvDWemR1/2X6gW5Fh+XyRcy4DftVA0wt0Dy9
         vZhERRb5yrJTQETfft51JYRRJB1WCEQ2ovxJEyzd/tg6SQDmxXKIuVGMO7107vG3qNq0
         wurfTHalfUkTfznFtenYgh3OmRm8we9+XvmbImsAyIfixMtl8wRU5CD6dM24jD8cB5Lj
         c0f+KUJ7A2Eih9/M2yerNp3vSMY9gnU9gWP6t4kFTM9XYuULvp/JZEWmLiIs2/TQRF2l
         nyITC3aPfrRG1DqInD+6k8rY6nwNAVOE1cGGVArLazjRAedybGaLW/FiVMZOZNDjdnU5
         jejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898225; x=1746503025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=tL11I3v+WW+QjckKX26puZqig5eBFeImUbALOZ5V36PoLpy0wD7rOPVKkqqKK2AeuL
         QuKhWVmXHlnqvB0B6Scz09N171OwVzS1Nmku88Df03eSmZRO71biZ3slduV4IQvb4nB7
         DRcCZeJFhW9olBvoeF7QbFOy5caGMAZGWBCPk1LdwU6otAeYqc0MOM1waJY3h7GHmeX4
         JR0qgj5I5pHRG1TxzY0Jjpa2OUhhBaeRjOZv7nbJh8fPl8jkIhySFU+9ozfCLhOiGB2k
         5L0p3uP0dloRlVvRBtCcqGc9EKqtOAq1LzxKRrZrLO4Y6dDFi3zO/WkYPE50+RdRAzlp
         tpyA==
X-Forwarded-Encrypted: i=1; AJvYcCVhNa6nNRGN4rpglqamhiK0RHbThymrm2OI01kEA/tGJDfM5TW7joKDom0JDaqu6ZWFhKQYKoaUy3uVP/Hy6UFO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0zx+1Nxh4ii2gx1cwFi22APMz1+ovmbY/IetKGVxUsNzdNTSD
	ULcHUItC54SL2JplBWZ/C5e7dqvqMNTMYTHVR1UcLLnfvl4z2XNf
X-Gm-Gg: ASbGncuZHmm18RMEU1sTHG4O0ghwYBrLFjYmF+lsohe3A8Djizh4nYKE7YU+yrXkhQQ
	9W6QCsftce5G9ZxJLiETdlSSnktWtUN4S1+de4dTo87gBF/gXAh4WisdZggi6sHblOfaSo0XNYx
	a/ao4NVU/xaYGJ5er3zV4L7TQUFu2Q63ZKNwcULONzhL0GKH8gCh/srxHfJ646rsVG0VehQCmeV
	+SRkFn690ewHnMd/U2maw5o8uRQzol2+4h2POfFkguMrJ0SJjqj1o74BAMdOvujKYVvYrabYBGG
	tOdTVGNux7gOL68bgrqvMPdaaRGeVACcXSoqXtr8VYxlYWmzGqAVKe+DHg==
X-Google-Smtp-Source: AGHT+IH0QfnRZrHDVi9u9tS8SXfAhYyEOmXMgFJu3ii8LTS/mV4wfXLUnUpn/pv0G898oqDjmezJqg==
X-Received: by 2002:a17:90a:c105:b0:2ff:7b28:a51c with SMTP id 98e67ed59e1d1-30a215a1c05mr2568143a91.34.1745898224710;
        Mon, 28 Apr 2025 20:43:44 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:44 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:26 +0800
Subject: [PATCH RESEND v6 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-2-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Qn+UBxFKpVtKUsbAnfhiKrUYfNaGPfBOlGOEhF8eJS8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErjazzO+NLo3kdywX7pJWIqZFooUQqgBzJoe
 fadMEORQrWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK4wAKCRABygi3psUI
 JOKSEACbThOdFHwrnvVn6sxZv66ea9SkhNl8R4RrTjcvjuF9BIVY/PIZYjx8tfqK4W+fynHpppu
 1+DFqm5j0iM71gkyvAV+981xWKS63ks9e1tJMVwPm2hmPkNnPYKMo8/PZiglrsRvcWCvLY8jts9
 Q3ZI2tAvfmAmmRHzyATaEG0RxGUiJCunxE1XeUQyJSLjGUe9Ex/5j25UNSCp62JlHEIE9V1Q24v
 qJ64TSCl/9nlCt4jRYjQHIM1LdyZlXHIvzWF36c3i6ZICWK/6X7DRCz9ndjuV0lAMK8+GO3leIB
 kZckjRyKGACOvAfb5L+xNJwPqPoXqwIOM8WG07/Gt3zWVeO4w58bqVVqSuNEPYyHR+iWOyKqAwV
 zM4ho/Ph/ng4+cgRTRDuPPiA6HS37DKHuqRqEfylkmajKRL0R6wX3girk1waJQ+nnOol/jOSBbe
 OFnbtNIjeYbv5/Ix0fRyU+Sxuw4QlVWaovWPWjboIHp6vrVzAnofdjnW63M/S+iWHE0z5MAGh5m
 ppwlFArOU6clMBsXhOjKqnun0lhme88ETBTYYuG5DsiA9jK0faJxrthclc12YZUbEIv0u1vw/0a
 QHhgEXkolJBpHhGSrpYcYZ/aG9CfH0BMJXNTVWguK6XKATBuSgWXVqEtWmU/tuK5mSBWYiapxa6
 i4+nnovqZOneI7w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204345_680370_7AC1746F 
X-CRM114-Status: GOOD (  13.22  )
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

Skip initialization of PMUv3 remap when EL2 is not available.
Initialization is harmless in EL1 but it is still a weird thing to do.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index df9a28ba69dcfad6f33a0d18b620276b910a36ca..b800da3f7f61ffa972fcab5f24b42127f2c55ac6 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -646,8 +646,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.49.0


