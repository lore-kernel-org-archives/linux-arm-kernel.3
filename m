Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53363C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHnX3hiTgygahZWce81xiavlKw/l1jLJfkiYMRd1Pzk=; b=Yf/dsL5JYQff3P0xWV5fu3wC0u
	Glp0zC1fdzMSVgTZIEki/17STwh0cI8Wo1GYeydKgjLaYOo8ljq3TLurj0KHj19i1Y5lrfEx9QB/m
	aQtsUjX2BaPLVmu9OuyPvZWPpIeHC8XmgEYSn2OrWn42XUFPxKCg1lILN6x6c4a6WTa4fg95WWujA
	0U8ud7Vd+cYxaPA54bIDsT6gMt5jpQHj8++s+mT/m4+GIiPgjiTM+DpfkhEiLe4VP4VXXUR0FgE9e
	PiKpgA8cZuueSG5p1j3yGyKTcbS4BWJB2azbinm2LwNgTiqRY+bIFna+yYbHpuzyzOqBMp52ykheO
	nnTj8t0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyzP-000000036yO-0AYk;
	Mon, 16 Jun 2025 01:50:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyiD-000000034HG-2ISp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:32:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2349f096605so51010545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037557; x=1750642357; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHnX3hiTgygahZWce81xiavlKw/l1jLJfkiYMRd1Pzk=;
        b=WhMbq562YZleLNPPHLBVGq0Bv4GafyMvEPkgWO5LzagsuJx3kcuv187PEbbkoCrbix
         2UjWaexMQZlNOz0d9TnccWEQiK65h1YquRAQZSLGxMsFuPhdV8U5cBo33Sl/ZjtQEdbN
         CowSSfd7ULKw9GdBJyK0KGi2cjg73pha/rpix007sH6BZcWhRiyegxad5vGIHMwL1CY2
         7swnNDSi6QA+WcfMK1YJGMFwp0IVhefzr9RFfZlrGCOepV75DceqR0kKP+OyGrIZrIUU
         0LC37Ed3HxU7HazeN2la2pZjygOCECIvUK1A6os4UvnVneyHwg2/MP5z/P/ThfnFWs6p
         VLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037557; x=1750642357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHnX3hiTgygahZWce81xiavlKw/l1jLJfkiYMRd1Pzk=;
        b=H4lwTQNEiIkVur8/ORhrJ7KlPJIvhtYumrI3Q4e3xdJ/GRB9UgIotqn0Y7jwDXE8hd
         3DB8ShupbEFqPXMSNJGt/MAVv/NuUgNxoqyiZ/B64R7g+vLxS56GLlVh+6QQynLxTH/L
         8GUL2m6CT7s5w3lh+6nSWe9lscGTjM3SfmKNsslS1PqMx4soc0fxXkh3zQ7SAjTUFIsb
         sOvZEMbNy4rmCgtVjfg8K0qYIsaknWc7gROPZDunJsrhtTJgIGRA+l+kmb/wKwrFHu3N
         3tS17Phu/pTaQZ82lKQH52aTxBiRoeLlfWmq4/qcn63VidJDlNKifiVI7zKvnZPq0N9r
         I7UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF4Jj4DKA2CkvH2jj6nMi2pmJMX8APM7hEyR9Es4Ap0Dly75xpuwlSqwUWZQJ8i98+iIJGnDMHVdnXgsyE9wz4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo3lscXoqbrm4c/uNtVQLz5GVnXAgqsuqkvS2VsXloijFLk8xQ
	2NRPJYGqezdhSTZeluCki7T6Q/1zg+OzHiXaXqWyuzJY8yPxY052z/eq
X-Gm-Gg: ASbGncv2xtdLADQ3KHLA6Alu3tgEYOYOUAF2KTENLiy5cG4BNFk6C7N6B5U7dprneiW
	oqt48kbPJ2jT1ugzhb+/EFdaxTWTCiXfP5+7MCb2hQjQQjUfWYm3qKiPk7mkjlSTRyTBzt5X+nK
	+mhlIqEax/nWVW3Q36b1Cx4190bfNpYsBXFYb5EdTP/U/IGEJ+JHHfo1UNCwUoR6+17aK2H1nNa
	e/jyMK1CiDZcXYMr842JZkmLeyjmp2JakXfjcmN7XB6V/rEpijjlpGRjKppuh4MJpIthHEtW3jV
	fKS8AbxL24L+LmWGorS9TrD3jyLbs5mxiGScEvPc6yFzFkcpVNz59Uthdkn8TEJaa5BPV8h1JPi
	LEFE=
X-Google-Smtp-Source: AGHT+IFudX6EFzo3QF4r2jcIfH6UCpGNE340PBewbeY6d/vvXtFcKmgg2EvJTzMAhvkSU20ywHPdBg==
X-Received: by 2002:a17:903:8c8:b0:234:ed31:fca8 with SMTP id d9443c01a7336-2366b3ac384mr110047745ad.27.1750037556953;
        Sun, 15 Jun 2025 18:32:36 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:36 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:56 +0800
Subject: [PATCH RESEND v7 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-7-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=rgncqluFC8hqHT0y83Q4VleXE9Vishjne/f3KrvYdxI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QXGctIy8HTZc6FMgHV1/cuW5JYoDcpgdCzh
 hOQjXH5VvaJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FwAKCRABygi3psUI
 JCIHD/4jagi5xi8pwdOPV2nlS/vBxkQU9xSTwWSEW9TBVL0HG3+EnbuoWhb/YT39DKjLMeLVGRg
 K83Kdh0wt2khtxKo/eTJqmF0T3G+tOfxnH7DGm+Agr2XA/QwaBk5WV0XqqmnS8wPRAJhAq9LCrO
 mBUFtdHGe2mN0BrmOPyQuDBxegFHJWsm3xYn7F/X9HuddmCYqqRMUoIHOAjfodZ5ajyNLCQomCH
 l8X6T9mECLvhSwp2naJZ3xcrneHmu8CgczyJLojrNoYsGAcZzTFNHjs9spge8O7wzlW36qlzc5k
 Z9JT1yjGopSGnhjSlhhSWVum10qD4ECi8rk9mT8gtGoo2Plj4b1MPQ5XTTwdpd5YhBdYgTV3GcQ
 LHfNEh+t2JroObT7XvHDyoO7SngbK2GJdrh2thXIducD4oeE7b2n+evuUJ4Y0qGdBqe+T8FW7Ci
 2kfWdvYWNFI5S41H8zHM4hJ0sBSU52bF4JHbzH18j7HJd1AgpTeYCzYf8hJebMmblLTRdEiHnQE
 CZHancEpcgYQfI49EFQArnhzS17oVmmciEVZq/H4N1lFwoVXOBMJfb5aXl8rkM8mWcbP5NjnGov
 VWnRv+R3ckH0KWKcXxbGB5pdC5TfT7k3f/MdSFfipW1OXPaOEA65RGpzE2U7YrHIZ+BXyxnVXYs
 jk404JLt7UMwLgw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183237_599161_A9282F0E 
X-CRM114-Status: GOOD (  11.25  )
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
index f4d8da4a8aa0c197cd16af422b33f4cd943d379d..74e9e643cef7f9a3c9ed599da36cf9b04b124810 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -669,7 +669,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -682,6 +681,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -692,6 +692,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -702,6 +703,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -712,6 +714,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.49.0


