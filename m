Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50BECAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfwDPpCiVyJ0buY5NGtfte2dcu4mrKn89k8yErLBKTw=; b=QQjD14CCL2bknRHdRQkpDRALVm
	1X/I5y1lZS4Sv0IB1MxKdD4NyaBA6YjPTg6+TZAd4IJFjC6UPw9YQZ8QzNZDPwxdFAC9i95+3XdtM
	MUjOZKA3qQfYE+5Mb1NGAHBoKtht32tyxssCT278JA9SLlGQ61pID1kJi0Q5hV9Zyh82Bf4J4nrOk
	Z+z7cTDqdD6fqM4LWn9uLacNIjL65Zo80ITII89eDL+5MZzWFpYMb3t21Ye+wpQchJEiJpM5Z7vgX
	Y1lBstM640NZM+KA2Ot0jtUSaldQYjEppjlH+2dwuZfv1cuMqOupEZBTxZFM9D158KfgDMs7xRa3f
	mEufx1kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabs-0000000GqSC-1ywX;
	Mon, 08 Sep 2025 12:04:36 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYgW-0000000GDwY-1Eir
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:01:17 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-24c8ef94e5dso34326415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325675; x=1757930475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfwDPpCiVyJ0buY5NGtfte2dcu4mrKn89k8yErLBKTw=;
        b=WtpZvWnKY1SI7FzMi1pSmkMIL40tgMkJ5D1SeIXSvjKnTIz1/N95LQGGaqN3FpG589
         jCpr7j8XFAikphkHvkaMr8+1MOeygz/kF1m0nFyEdEkrhH94dwn2CmwK+xtJsF/A3Ydk
         zZ1orIDbiEogM+Thv4IcsNefU9xEZfZluIVk6BD+bbTsrbKg/T0u+Ujl4W+qczs/S/Jl
         jhPc5CzEBHZtKq4apg/4FWlmevGOK/aS9PAjDoSDhk08chTK5Qbw5UgPqelKAMscfK7E
         jd9xFAB7jvmG4ag6+pM1L3RtHQ/a4i2V0MkSMCjPY2QdfugNRU+m6rRRiuxYlWPSbMx7
         ykBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325675; x=1757930475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfwDPpCiVyJ0buY5NGtfte2dcu4mrKn89k8yErLBKTw=;
        b=jLslv48GqatkGI9QbTc8z28YBNIPL1jkZuWtWdiZc2Q+4hrERzzRIYG2n9z0R72N78
         TYFZsp0CYQvP8TIlqxIVAUGQZ6dhOaAyDy7jkNSX12UbIBCJ+2UXcHGLQ3DKIPxwwZcr
         7i+DY78EYG5aqdrk2gkDyL8VRSHInF6yMwE2SpDrGlMAQrhUhKaePFzx1/NdSdqPMY++
         1wCpiDIjUDD8mJs/UEpn5i/hLsva0zBJOO3J0LmWvF6OF2cFrtBhuh08zwGPcGoAYGAA
         21a7cnGHSLn8OvTbSpwmLYzopMfaur0K0piTEExQzga7gOSoFqfiFXGrepr4O5dCE/k7
         3twA==
X-Forwarded-Encrypted: i=1; AJvYcCVpQDm2PmpOhqtkK0iziEXkRjatpqwKozWQrdyOBXsorFpvamTtbzRQDPyoAcsDkP9hfPCdE4un+H5MXXk6k8JL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8jTMCtEcxq+xRFS8igwdQo7LP+pIrTQ2+TIs/up/wNhEK4jDL
	D9/m8mZf+ru7P9oTvV/3pOKyA5aIgY4tHZQFA1e3KKJIzTxAhAOsduUR
X-Gm-Gg: ASbGncuCk5qtnoxOyrNneiThX+kOpxk4SKLGz5a2fKWrvv368xGOpcT/Kt7eKUKAlI+
	Lr3jLszgH6EHRbdLsVE5gApe73uMzrSgL9gP7oxyk6B8S60YarGNlqBqOw7tVGhDd7rXakr54/U
	r31CbK/giZ2AQ2z8hg8Z4/q4RAeQwInXdTEkAHr+9UXuSLtJF0tK5tgKvBxYRC5ufcaQm1Pvw86
	l1ziqQLRBAmYivj4i4iAx8rqQZByvFOPOscytArL7lU5ttsnAw7dORjy5mqi9YnNg5htTl7Ikp5
	apGYYCTnf+q07KBOlyICogPfM5JIpHDDji2NIzuye154b2HofUyFl75j/1TDRy5Ys/XWnZ58fUq
	kK0BzsP/n5PeXN0oOHYwfsH2LTy4eMSKA3Jwurg==
X-Google-Smtp-Source: AGHT+IGLk7qlbfVScOMCIeIb42XcLnwpLlMwiHFaoZOJPZ+XNLGGX7CNUjJexYFNYFgrdXDdh8bXbA==
X-Received: by 2002:a17:902:c653:b0:24e:7af7:111b with SMTP id d9443c01a7336-2517427bc46mr80800895ad.6.1757325675347;
        Mon, 08 Sep 2025 03:01:15 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:14 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:31 +0800
Subject: [PATCH RESEND v8 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-7-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
 h=from:subject:message-id; bh=HNTQqQJemqX0WI0eYRGH+l+1PjBhJi/4JkQ/C04BuCI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlD34FCamS7+BvFxzQI9pN7EpC0Hbp6D6ALC
 y9ge2t7aEmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQwAKCRABygi3psUI
 JCtPD/9Ufjt9jmDhmxNUAxoA2V2hfzWrlQmETddcge9lzhC2G+4lt9vtNcKyoJqjbR9EcVuuH+N
 0SF1IYHPgbVm6HiVcUf9sAvi7pQpj3D0tXtvx1y3IIUONGg2MrYDjqbvQyRehoWYfc5c0DzNfRX
 9T3FDbDuaHmQWVLEz4H++z6nnstjCLImgqVDK4WC+QqD3R9vs4QHpkeYvyYKWG5cGm202IL66+Q
 3zfH37A0bK0eRn8dMahrHxWmRImZ8Us1Nm+Q2mVwXDbjHJ8h3PPyuCvggNGXgSk9sz+EuMYRuT+
 EAucmWITr9kYf6lKOZLN4aKXS8Gv66Us+OMTMBEkHjP0cm4s25JZtX7k85vC/SQ0+dNP5mJCITY
 IlA4Dvg1scmk5byxkrCRR1T5BiEdangbWzRvbr/JQpb0bb8fHGxqR+AkeEvf6IELA5cnelHEG9b
 pFXm5yUYNcvOWCJkls3XGyLILQGnP5s/suOebq6BSXb4G4f1qiU56y8kggJ+zRafdDKIzicZ4pa
 bYcNDSgadB939lrENMqO0DQ3yJrLCSTFPX/aEtqdqQ7YQ8WNr83VZJlbcxswJiQfIKTLfEJS7Sf
 T4Kr+YsEgfgZ1sN4PjE+SkVKbuUVPFy1lcD4Rd2t/p85VynzhTwijW/Pir/6Z/qyFdOZVcVPBg2
 UJkGyS4ezYQjliw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030116_340457_A471F546 
X-CRM114-Status: GOOD (  12.09  )
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
2.51.0


