Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1692DEE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDPN6/vJo47740N6QbPC+6K796StMLGbxQxmitpGhW4=; b=4WJXUhXdrjMWe7S9slm/UAwjnz
	LGMFVCucwVSgqRZk152RzDEBdObRdaaHGrts188n4+mRLkwt/r8qR47xfyV+Qbk9TPk/u8IqvdI+o
	y+Zn4peavQST0sW4VSRlKso1VCJU6LxFHWZMIknt7XHcud+lpRD3cl2H4udbDlQKpCz8p9PutC+ca
	pMpaxtnE1zDICKi0H26LsHG88EGXDiA5b+PaGP+kh0ECHxArviwIH7KNYShnmb5Z1BTXSXF7eqBgV
	RTDZ21w1itW6WNCbtl5dG39YBmjYh9nkFPphc6pmD3ApFCMnVthPnTV2LpAYZy29SwR1iSWno2ZiU
	ND/0mJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaF-00000006iit-09Lp;
	Thu, 01 Jan 2026 09:03:03 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaC-00000006igP-04ga
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so11670670b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258179; x=1767862979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDPN6/vJo47740N6QbPC+6K796StMLGbxQxmitpGhW4=;
        b=POlKGbs7NjLe/NRl88JtWmDIi9NtcQgpT3FFfKd+1gQTIgK/ANjbzRAQgFiol23WjD
         tf8XJ/+6/shGlgxUDgwofupAhsVao3il7rv3oyza6Rsq277PrcwnavSDZphGguyY87v0
         Bibhb3cGPvuMhr4JWwCTrG+awv3huUKb9kccgx9VVHExSVFsWPC/vME8d+1xHoZCvrkB
         wxCcwSsP57kmTmHFb1me6b+RINXTBQ9PqzP1jfdOSTk98cPGfw3RIYW4AOO+wmKsMu0s
         Sl47ZGA7nZFENl80UwTYNadlYSd/LTKHMafrAcQXp0Fa7Zqx65thnF+S7xHMBs6vT0NG
         Gb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258179; x=1767862979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xDPN6/vJo47740N6QbPC+6K796StMLGbxQxmitpGhW4=;
        b=wfeeEfSYBxGFWpF9dfVAbUZffAPqRqIqMZAFCxEBjCxLCS+ZVRQtiRbUzLwGOYgbwQ
         7+onLFf2kvayc/BLwZRTb4rvqbBNXHaTVi0d+FCG//u0Pgre+gLrx1dMuB84uA5z7AC4
         qUF3T3DhFPxu5a6elITuMgpoyqXeSziWGcljrSVT3l9C0eHqbtnIxqjxqfgp6MN0e+4d
         +04EhmqvK6j0mE/9ashAuTrW9y+mvcjNnKz/EacGPCQGgxFbTkF18AX6y41N0D9IKh/d
         WusvGlX5kd0ZgAtEqCLuV6NgKDWxOd692KPo52oETTw5zZMBxzmKP66UJwUcC3agO689
         8JhA==
X-Forwarded-Encrypted: i=1; AJvYcCXy/EhjzD83an/3BjANGoMakB5oymtuJ5DSpFzH7e4nJZzqgHhIVFy2qwsgELYFFm4IVyd2jDoL/40qHB3m+reC@lists.infradead.org
X-Gm-Message-State: AOJu0YyKdlkowx9VacuEyI0oaMDRiIK9rL9/GM8M5g++LCzC6eRtNy85
	P4UGQluvjCqmHwq5bJUrq3k+VpsuOn8RFJ6aSKufhyNLE2h8vwslx++M
X-Gm-Gg: AY/fxX5W/3c67nVa+OQAtKuzu2VMbsGxNYlWQqgZIjxTsNjAFi8b1c4J6Xn0TaIeR9P
	YvKV12mNSoMh1xVy2hjXgB8PV6/2KrmVzv7fIuQsLafRCy9vc4f4rOgypkfIPi+rGcV7tC52B5N
	SG7Xo6me5lUWeFFrb9XcBBHlGjNcIXUhs0hISnFowf0TlkFg8KhqcusJsVPzpbjKvwzAmU/OtXW
	EaksPP1Huf2GYmmvTvqQG5GFGGt3QXtkALDjq4VARx142KGTtHkcLpGOo1YvtsSOf7BEzt2OQCj
	akeWZOywUKIOrrDB1XClWHYk3oCnkTVUy9HXNSZIyzKIZz0M7uE+z3Z4JlUv8LBlsXFdOQVN3KX
	6bUJJUGZShbRoW4k5segMXHPkn48lLr2H6sScsGlj8uKGin1I99l3/ozlILiUfLV/Irj6xL8mq6
	RihPlaQAntUNTb
X-Google-Smtp-Source: AGHT+IGp06A95VtNsDuHQDY+7c9VWV7Q35S5rGZeleM+b9X7CGhsSB3XJnieMhxkxoxEhcSW9EnMFA==
X-Received: by 2002:a05:6a00:2998:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7ff64403c13mr36009776b3a.7.1767258179113;
        Thu, 01 Jan 2026 01:02:59 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:58 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:43 +0800
Subject: [PATCH v10 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-7-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2228; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=k9d/lT0gR+BsCohUFGgU5dkmO2RpQMNkTOvLv5F+1Zc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgnrBr6sEatcXYFZIFrxk4paYlmBpg0jYmmj
 PlXMpBhHf+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JwAKCRABygi3psUI
 JDGUD/0f8DiiF7tPJvy4tiRUfMyih3V1IJASfGdC4Rye3V+p80kHdfPEcVWUeUOgs/Ug/Uul4y5
 OOuKuCoqeoi/9EV/wtA5u6ihDrpg1Tif5RPhFJZSPaRrPFXGrZRWS/NwN9MoaNelp+0x7u5Hpbw
 BZ9HUNCfv0lu+qs15G9zPoNXzk/caXq7lBBezpLCo99fzq47eochYkXdqyrS43KqgAcUncWPQlP
 ETpVJYPgKTSRxjZQM7p25aAg4/mn562xxtGpwZ8ImLwMYyr2/F2zRoSzic4oURaVF+gTKX62lc/
 AV0zUsHPfeKIS1xcMZ8cvFiL7VGlSLGYhTLBCHPSpPgcJA6becbCMB8JJ5T8xG6nGDmN44dAsz2
 yYw2TX04yVAM8jSQ3Uj7pei1U/WDnVQo0IY8+IAgWUX9xyZxeK/xWWQGILLnuUZBF25bVCkMRTq
 9E7owcSymKYUKj459MHBzrCw6bcy+2GSOf//A5ydwrg0cdGFylNzTeMJrZXnrzrFKmGvbBDeDe1
 FyPMry6luwdhtHi/lRzmQGce0vWYs2xVX/NvnDscwpthQQ5dyxRReDZJWvx61ZpbSmyUGonx1du
 ye+RJW/1eRJLmlvp67/VhnqhmJ6GaCcL73fOpD1O1bG9Flg9GtfneDWeOVuwyGjAz90ImNDGOo5
 fBfPi1OgQMPD+ow==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010300_071198_DCFB9096 
X-CRM114-Status: GOOD (  11.95  )
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
index 0655eeaea96b46d638b0998944c30a07f3273c2b..f903cebf566be6b40f260d81a70cefa4858bc085 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -670,7 +670,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 nr_counters)
 	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, nr_counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -683,6 +682,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -693,6 +693,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -703,6 +704,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -713,6 +715,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.52.0


