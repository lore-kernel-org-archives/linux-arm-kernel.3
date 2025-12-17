Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B45D65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnmU0etDq0lcWJuNgsoBFmFUTXG/dt5JQHfVECxG+u0=; b=XzrbR0qepLYwYK1LQkAwKVBJ1g
	t6yNOJK0phrImZPBIdRD+t8sP5vcDfkaS+m9z4HayMer4QacVAtkn7I6RvFjM20qT10jPGS5xjuKX
	NA00+jeQYUnS9zJMkujnUjUD+Ot/MiC4/rFgpTb34baW3Qn+5Tr2BQtLWs1Drj2fwx7LGPE6ZQ3Ji
	jF5hY2XjE5DnPxPNtaziZf1lyzfLh+mSmg652HlB9/TRST/K7cZgONJvMzkUIffZm7QZSVBeay/UX
	gNBCqNy4+gN/qhHrqkiw8lLLmkd9Zi0Aq4hhGcOZVkGVbi56BEUTsrz41YfJjIQauulIGX9aJllyP
	ZFNa5SiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKW-000000074lD-2BIu;
	Wed, 17 Dec 2025 16:24:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKU-000000074kC-0vSy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:24:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a0834769f0so46490405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988685; x=1766593485; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnmU0etDq0lcWJuNgsoBFmFUTXG/dt5JQHfVECxG+u0=;
        b=ESZBOzfSehtkgS7pkLwLMnT4ctZytSvE+odtKa+lfimvbVc45zq5CH4r5QyMtohIE5
         B1aLZa/OGRr4PtznFYL37n9IfquN7qeOu6XD9vxADrJa5Iz7EuWF5+LAIITUjtWKQcUS
         z0I5ZTqgTLsAGLG6hG//IkABODxmAeyGv5spGr+OExm0Apvf9tSCuM/MIvLi//1kr3pZ
         XGzu/AEay9L1HkSZr6wogY7Vs0t5dwg8lXQOJs0VeHc4Yrzh2Sro6EZchdj8aBHZD012
         A/+Ip7P8xXs8asYD6JjgpBJsTGI0+yMkN4Pltw7ue7dYOiNTUYlv9WpXxOPC6/9NoKef
         tEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988685; x=1766593485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnmU0etDq0lcWJuNgsoBFmFUTXG/dt5JQHfVECxG+u0=;
        b=EutQHvKjmC2CLOknvhDlBQN64KnloYtacqbHuUte9peuxwHQsMxatNacc5gpvenVGC
         n0Lr17/lU2gQ3/QAnq4rx8ctFSyUw35O7vxKOojMEcPFfgD+lrvIqsRsyk3Mai7P+Va9
         A1CjW1ZnHt/1cCezhZ3N3TJmktTTjCcrCrD8+pgaVlKWtfY/f4+1aOjySsNAWdXJnW8g
         Sp+updT1cIBP5cjcp3NUkT1B6ccsS+e7BTzHWpgaqI/ztH6CYpihw1Flon9kXvIQwy84
         lEfUeuR3kk7qgqh2RngVaIcZVOlMHa/m1TTwidqEvb/4BLlwXtB2mOt8Cszqw6qDqLHH
         19AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM8xS8kJsyHmElFqWMbToZb7ntY05A+Pdi4cXpzlXsGupFzLDnIJxgoY3JonjEuc3jPCPj92e+zT2/beVOYkrq@lists.infradead.org
X-Gm-Message-State: AOJu0YwW8tCs7Bo1jrnOEccsyTuOjfxp4UdnUmXEx0m60ktmxlRmeya2
	9mEXOIb5yJ93pDJeD1O0c2tc5k1BjWO4DaiLDSCtz9SK+dhMwtqY/9to
X-Gm-Gg: AY/fxX6EaLWDQZkulee4CmgXcLZ9rECvktuynbR/veuekiKCjAfeQS7R5yoqJwx1lxk
	xGU1Rd7Aloa4ffbbVqg3vLfd9YoDK0hiRwYyUFFxDOhrPOT02MxuehlllexjBfopBaexxGeFdik
	2yHj6tYnhC/IEKe7loJsSKejVmb60G2QmVvQ4NwzbM3Y7K9N7Q4HSDHt8BytQ9G5k7oOrpB/78/
	uJEXr5JU6krGfawmA95fWARhZl/+/odRB14TRx2bu1cK5OhzrVAi+dDijLEjogTwo94SMHDMm85
	A04Ta37Pyb5hVqSsfV/DqBv0vDfZSzP9WzguRhm8ECyUHVph2KyIcvYPS9IwmtYMP2uIuWPXP5A
	UhAZDfow/8usZbK+u2EHBNdcYbUOXaR+p/VAdQFMBSeH6LzwIOkkN4dlAKNXjfgTEXDAKdrAr2L
	7fzKmwmshAEWf9
X-Google-Smtp-Source: AGHT+IG/nquZVvdb7hdBfthWotpPmdj/WUeQ/0emdMCtPLX4TCGdHlRO8AWzO6VXDeE101kKUDS78A==
X-Received: by 2002:a17:903:4b27:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-29f2435b8d6mr184902615ad.47.1765988685325;
        Wed, 17 Dec 2025 08:24:45 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:44 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:15 +0800
Subject: [PATCH v9 02/21] drivers/perf: apple_m1: Only init PMUv3 remap
 when EL2 is available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-2-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=T7VIuEp6hEe3RkCETbS7KqP+//z7d2ZDmQMS7i30tSU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlAE5NDqs7fuGSBDfaoYGlzVF4qIaF1lkua9
 vndWjdJ4UuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JIu4D/9aF7Vmpryy6HujH92+R1amWBbT29Pk0lgoF+TezSRD2mGenGzsAFgeGPO1uhu6SNcGhLA
 9aovgC8dRLUhnM+lq07wJN8mog+EtcMVDUCNPbS+lOF+fm2lUb1E8v+mUh2AiSG98pPOXyxrLVb
 aX7utsSghAD7AjWd+CDTx4LJxDbLVNs6ZYCNlVMxhz+einkIjKBqs5k1+M1omv7BYR9QSY/kyU4
 7yfSx3/VqpK3jdWJnXMhYqLM2a4iwar70Fa8v6zCUI5i4eLqox4VsBNEKcmWiYZk5XKQC1wj0Wk
 gKs1RVHwkOPaweHbQgnnQQOw2lAl18Ot0vvP49Gg/ZGi3wM5s3C3PXqIBsu+vBYthkDeghuDWod
 SXN1xtbIfDPrSdruCYMpccow4QJv2+aTLMFutcf37T2prLmgRAuhVEzvsFsQfEmGgL0MWfgxupM
 8azf8sRLi5FuFbdShEK9mwZPX9mrhc4/QkSJzYc1VUtX0U4v/jxWTKgFT5mhSegmsIpeP1EqUHB
 v5L5Jr/PiJ7k2UCXoKOYHLc24hMgpROoVNyWt/DJaY0YKeAu5hohiEPlbz40CCnOa7mQDGw94qq
 MpvpFbZ5v1p8NCmvBMCDOij33xk0cusBM0Ep7YJmCftcvETI0FZOrnPpHIXcowieMk4zUfpnC1y
 AURR4XPLwieqCtw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082446_286709_165D2803 
X-CRM114-Status: GOOD (  13.11  )
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
2.52.0


