Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38AFD65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJBqWPH2nkiaa34J/fXU+ba5HlDmsksob32XTdaDMY4=; b=U3cF1jN8nhTp4DXrOzSVxNYYG/
	XOmM/MWptn0l4DN2J/wu7mi1O9mvl8arYVpqYGMd7z61k6544CwN2YukjpOsc5fgYTsqXEfZPCNAz
	+qcNUChz6T6K10S5CzlR6eQk/rwtUwsSo/OGG1wpZJ7xZckda6Q54puWG32pkss+Whs6kDUr9n7SG
	qaFjPH+7OJ2Q9CInQmGLkCUvKIr9He4FDqF4uRAbBGXeBQEHLFplXBK56qYDgRP0MQ83Ezmw/6xmJ
	0sIhi1zWUZgGP999hUN6cqSUTIXrgI3HJRNNIGEXTJD9ygjC7+aVG4sVGUwtJtIJN8QjNv55j0jpA
	XpwitElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKp-000000074yA-2OgZ;
	Wed, 17 Dec 2025 16:25:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKk-000000074tr-2Njj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:25:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a07fac8aa1so47271815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988701; x=1766593501; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJBqWPH2nkiaa34J/fXU+ba5HlDmsksob32XTdaDMY4=;
        b=PpPQWELdjQz27e/oYueShFW83iGKJGuiv8y61Af5O/1UMA2A5wKAYY+/BngqUYPdKh
         +Tc8EZa5PDatbHdwx2c1vSMuu7MjLAh+JcrcftZk3y/NwGPibIWVt5hn7IUt2nHdEPX+
         DJHzy6G4ABcxYRCmzQVYxMyy/+ziOt8m2ozXJhdnvOxX0Fnp1M5oYod+Na1eztPkJmD8
         7UK8Jv3uKIWFw2Odca3lFk1fFbmnMZOhG6n919A6eu8w209VeTNHpSuaJfDydz1hITjH
         eA7LpW63OT8lr3vAmTdgEWWzpuK0t18ZXgtBsY7EK3v9AVl0wUW3DwRfKo1UIes7mKb9
         VORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988701; x=1766593501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LJBqWPH2nkiaa34J/fXU+ba5HlDmsksob32XTdaDMY4=;
        b=mrtx7BFHpJTR2F/h63hAZsKowgal8MgIYzXMFAnj38wa2Hh+mzoco4vUCmoCv/1YvE
         SRn+YhwZX3ZPjKd6ASrgjUAt50QhQHg85QFezv5QXDI+6AlOQqBBoEvVp1wx790g/H/v
         sixDl4x5nvtG9VdPX3nTg/uYyMj9NGcVjGPAVQx9SndE8D1j0xZHExFTBVU6yG0q0pPP
         stxzC578qsHNl92zD8X12OwqFPisTIs+9sdbYnjUuXRAm8g5pJafWwVnR5BFTjZIcYuv
         86ZYhNg4nMFaFVl4YuuLwiNf/YOty8HXk/qCxC5z3k2Gyz+LbIT6uvGU+nToE5YZwRVK
         /Qhg==
X-Forwarded-Encrypted: i=1; AJvYcCXlmgeGSuXMqUcKxgddi/YAx1uWeg2Rj+CaO7mSa1twZ6Ym1xSnuwDlVvI44vEYi9LFWlDLDNf9qUvnd0U7gzSR@lists.infradead.org
X-Gm-Message-State: AOJu0YzTRkpb5Fb0jwOP5FAuXb3FeZbUmGCo2ogsLqG+gtwhD8EdSVRl
	Q5iG+i4wzRHuEdzkAgUZSipUZfzRBo5cdlgRfXbXkhW3ysXFbIEfQqsc
X-Gm-Gg: AY/fxX7UOtXMJacZVS+d/5Z5esvvbSTOuAzsw9JRQuxKsxHXbRmGQuz74Nbgo8ORkJ/
	JEbRxyHLgl3b8qI9fNSqsrQ1pUN7bSwO+lthBY7vPAOkqiotkxVgxi55If+r0K5OpICgYWZj7Uz
	lx4pMmITkMNW5LdvYbg6vqZfpj/6z3FvLI8oHLVfhhI6QoW+603Rs9UVL/XEJ5bPFg0/mxw9VnE
	ypVCTT0JmvfY3stCpjXJpZ7Txu4e6L1RPwJzu9LqMj2t0Qy5nKOU/+GbwMHM6E4vkz96sJ/PL+6
	adbL278rdxBk1QeOMSfXX2X9FK3DjI1cmQXjqxEMSJ6Ctz3GndDzlG007q4TLUKHjPXw0FxNlbX
	dRFY0wxC87KSgJDsF9Ud8Y+4DFUNEyK0rclQAW8jFjl6z+z/LrJVHsmytSxHu2J4+71iMG+uj11
	TVMhQ2gMfhcf7q8T9CMXEBWwM=
X-Google-Smtp-Source: AGHT+IG0BRya6JcBr0mTcVAqL7t0D9n0v53qOEX5qkYR98IGq7dQZ1TKMwIAOg2C6RQdGKX63TpT6w==
X-Received: by 2002:a17:903:2442:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a0b62ee12bmr124556125ad.32.1765988701484;
        Wed, 17 Dec 2025 08:25:01 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:01 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:20 +0800
Subject: [PATCH v9 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-7-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZZrFSnM4qaLIjy+z2U/97ZkDz6A45/CxzWdqdPeWGg4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlAGMO0GGZLpi1zAtxvLgpEJr3Y9rGS2lnzl
 VwsXzVKlU2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JG0wD/4xjOyi4wclJt98NB5Fro8UHmkJvVz91tpavZ8ogxOXqWdgOt1/EA3rU8KXW+O2rZ5IYHt
 rGFXDuwHqThtPxSUPe4d30LDij17Eqk09D9s65+BCUfRByroZKPgkuThHAbjGoFncAExxsEAk97
 ARE5Obg1xmTvdcNN+MF9YML5wxXzgiWsgZoQwueb5bv+uJDx6mn2Wa82iZL/R3d+2ZXyF3mSXNm
 nSjF3TvGGee2bmB5yM+aiNq2lhhQIgRjWyyoshfEgccWmWg74iMwXRrqFuyJ7yPvJr5zDateZzw
 t8AhG+FtAU1ZFQe5I0vNDugjZ7MSbGWF3nycpmLPI6gjrMSJvSXm+x9SN/XuiD9z2qb5LTfBs8S
 0zq4bwDU3RLO9d0hlOhqrv7C2bght3tCo0InrHn+7QXPa6kvrqO1KHmWrHY3xPeeX0eAT3F8oRm
 gBJCDa0cMxCD6SuvnsTGMDaTRZtxodGFwyUTOdrVEiUF4W2dN+66pJZW5p0uWcKSJJdNi4++OmH
 tY+8H0KaeclNhGqwJvNk3XGtae2UUbHsnbQr58GCGO9fUGOhW+6gEc/nUKhmxdlYKfygk3K6+9A
 9EYIinsD867fdYWbjzShMO5ggO3TBzTqmeqdSq9Mv6Qy1VXLyXZxxRKbWlufGEK26lQkutjh8zF
 SagzGtDXKJl3dXg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082502_636073_D4A8D833 
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

To support implementations with different event numbers for cycles or
instruction events, event attr groups needs to be per-implementation.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 303c0e62432281e899a33fc197365c70078d6ac1..d0362a1813788776f4210523efe33a3018cfef2a 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -668,7 +668,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -681,6 +680,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -691,6 +691,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -701,6 +702,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -711,6 +713,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.52.0


