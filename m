Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA29C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 04:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=; b=ZMcHIdsCZA33zmSk7uFd5N4S4c
	1WEf+ar7m+zHLzxCtZ6cWRb2ijnwV1Uutu7cL+r6FVVumChL06HN5gDP+8akUKx2vvpXDQk0zhp8P
	fPx3iCa6lNGnXulf6tytjuxFO4kholWnI6yu+BqCBbvcUhr+gPCpLqWQ1TEBp/m3hzcRJkY9knLGw
	L+jR+EKE406HDzKLZJeyzWJXKgGMIpkSa7rOCzKo+S4VOqFzuXEL6tabP6Kr1JtPogfy0+TYCXBlC
	vfsSvuELWX4p1UcJq8fvCcomVJf/zmLqLFqCDE/qwTUNOcneRUjxrtS1Gan/XxJYWHhRIfJ/B/CZz
	tpQV9Fhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eSH-0000000GNmI-2oNC;
	Mon, 07 Apr 2025 04:51:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNA-0000000GMfN-08YR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:13 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3031354f134so2883593a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001171; x=1744605971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=N79C9SRqOo3oAYziWZfENbtN2ckXFji6wpZYwdCDZG/kdIQP05aLveJrJ1viAXmRtC
         UNJwTNOFJ9yyfMRarKYinRx9biRxxWogm0WhQIk9FtxgcSHjUFgyriVLwzCK+NDKcCR9
         W2fPeQpgSBrdiPt/uy/DLgMnYhyV5yNej2PIJB9rk9sgEIvnSjDhDMlAYVpd5CBDYteB
         /n0JtYJtHfVbOqzcFYSgroq0TUb9d9vnL9cOy3nHezS7ZrNb8K6fNVEZGNR4JoCUN3aA
         aS4laRKELIQYtkkdfstZHOAh5yjRFAoFZ1/i/5lEbcVZAqlk3XFk1nvKIXaaNp2QlQDE
         U/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001171; x=1744605971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=ta0lu54MOhsczAOZ6zhWkDPbsYqVRCtigYgOVTmPPqShU+8lATc1Swdwi4UoEVGheH
         DAVlXGymlhbXlWzoH8iKUT9+vJzf7XCh56Wceu4S0TL9MF9aKpPC82ROn4MfQwuQIlze
         HVDagNNkYcJh89TwYb6d5auWitGGuvx9vlk5iQpa9mQNejxwKg/NzMng2tBoMnylCEni
         VO67aannd7RNn9dzAgvrDW5if5RQ7bHeDxUhHT2dqydWHcx2fwMxHqvkYY8vf+/LkYh8
         w44ncigBarNeuIkcqGELrNDGvflfq2DzNxEzFR9ScdPCPKYcFxn3wm4u0kEohePXzVvd
         ziWg==
X-Forwarded-Encrypted: i=1; AJvYcCWm17+EF7I8qBunFtzmyUaF0VWlvqALFhwaxfcbIqKuCkBqhaYCHzPmX4cxRIFTzcdKaMtANMDuX/6zOx7IaSF3@lists.infradead.org
X-Gm-Message-State: AOJu0YwUP6HAxiMm58RTSxCk8aqviC9wAyofNdNAGu0kavI9+i+vsDCO
	7k3fHUH/ExDSDJA4B1xVRpImwtB1dnkTJj1wtNxxCJpf7irjMP4Z
X-Gm-Gg: ASbGncu8YrMAGKTZCBR5serKLRtwDCLxShnzfrB9EelcbA5/QHjEang5aN4cyGMb98I
	JXi/RtAVkE48eUp20R3kC3lsSUInoOyyai26ea+55pBpmRyW8Ql+l388venFDve/S9yHq1FyNTV
	Uy8Zvb4Ptg8HJLNBsIMNq9D1reo8Gb71MxX0ufF2IOCsPbH0CGEJMsKEhdlfjMQpV5CEYtfA0FE
	ApNQlaNiOWrVkm45QI6FV76/bmw7FnW1sdtDivugKvUrrzjXI7UqGW96jMHktQdYHbhPH4z8eIO
	vGKU+YvL5VLrhkONEMXPsZLZwEyaiknzphV+trr/bahIJJU=
X-Google-Smtp-Source: AGHT+IGrxaobhUpE/KKrj4rgCnJzb4I798A3JeTUshuwGCuxTpNwaCSNZ7EcgS9JOSvfkcezth+Xeg==
X-Received: by 2002:a17:90b:2547:b0:2ff:618c:a1e9 with SMTP id 98e67ed59e1d1-306a61ee159mr11785909a91.23.1744001171050;
        Sun, 06 Apr 2025 21:46:11 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:10 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:11 +0800
Subject: [PATCH v6 02/21] drivers/perf: apple_m1: Only init PMUv3 remap
 when EL2 is available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-2-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iFZ5puw9qhFP8u5Nje2j0soWKWkUUFQDGlD
 seWq/74HMmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhQAKCRABygi3psUI
 JFtwD/9QIvFD8R/1BTp/iJHipmTBs9PZYMuBIs3cVUwC9kIXc0+7zHN5ocj1qBmkq7TkKqGg3wG
 GAioGthoqoUVd5C9RXfNdgojjnVXTXO/8fQVRrWftQYMXb8orZXKBXZuh+BEQ9hxzowM3Hscjb8
 tC/wh+VGmijBEl3mxLbbc1ONfbS4IoX6m2NccKLFAE6syIN+izy+2nGBHXulNnb/GqR9SeiT/c2
 LPW7fJD9WXFe0k/gVSD0PMyacqyDdh/HS+uCfFiuriV+53w87Jh6Aog7GH0ftk4sollgTrGxxVy
 f2H37/PRE5eEVTLbDux0PC7tGhX56exzxY7hMO12x+6nx2ax5L1pu9gBa2aVz9GCt11sSL1ZX0d
 Sz/VaJhDyvdG1Onc9Tt7xWlMPfZ3Tpo2vnjLf8/CZZqnEbF2NiN24qZ5wDwZ8/ebgoFPLbfmRgM
 6RUYjPBpcVRArrNu1KsBKODpwEGWdYQ/Wn5oAmOGGUGQBKove52Vx/BOva0JexTrbjCtIZnGhyW
 ZwmBRryhdedFxcCY8YHYsHLkpSKMVuP8EVw0j3Et9a0UVRSt6R2adV4j41hBzZoAEXOyDsyC3KW
 LNNxDgAmJhvlKgrK6rkVYFD1gM+APCwQP0mIHuSPJR9THsQ7eDS/G3vn/6BeW1bZwmbuGvcMr1x
 DvgL3hl9tP+PhTg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214612_090881_1AEF6B6E 
X-CRM114-Status: GOOD (  12.91  )
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


