Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5920C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 04:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qETjSISznhSwPPS1o1aaIPNAE1fFREGWY+BmDgwUuls=; b=ikgGeBHGj+VwRjnMyk0fRBhR7C
	9tqkT6/r9fNl9Y274wq0kcvXqvpsx3EUAyny0Zp+CIya1tVdzKlbiG/F0vLg8Qgwe3WQx69B2sdxa
	Ygc6VZjjnyaIIMZkDgi+p+LGkhgwD50OQjTahkwZG6UitNbb1DNWk1KnO0072WAoFZ1kvRHIaJujA
	Og/OmhwpKgIKMtNtolqp4Uw9EeSTMqn6FCaBsWX2bTx4WbEWtn3AGsr/bMwdh8EfBiMtmjfvoY8H3
	XGhB43W2PRVzGkukzsacHmEP9qdX7Zw0HosahQ4ZvASfHCMZY/zfraWrAuLWOO5n1475G3dbFIZTF
	knBn+5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eZA-0000000GOUG-428i;
	Mon, 07 Apr 2025 04:58:37 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNN-0000000GMjU-0tIH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:26 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-af6b02d9e5eso2574532a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001184; x=1744605984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qETjSISznhSwPPS1o1aaIPNAE1fFREGWY+BmDgwUuls=;
        b=YSP5mN+ECRcdsKS1iyRZeRj2UItAKmsOOTtY6dJoMzAGnOuewUwgRCr67zBiNsYSag
         9cDWDC4V8RBOiNxgCjzB466Kpf6qgyetG7F8f/4JMMrOgcq8v6NajR7WS2KRaW/Ay/8T
         hyd8VkLwlI2qrLrncsK2d6HkpYew/Wrx3/oWRy/MYUiNJhgjoW3XALXq3vx2JlY5F18M
         Zw1Kkc8q8tM4v5e6V7p0fr3ZePt1zk9q6MzzcPFI91zMilbP0HGL9VZkhqDsk57E1mhM
         6SG+oMQ1jVKSHPJ4LYeuLs78Mx7u54hEjZR4FwrYJk0Yck3S+pfwiA3yZ+PTfocXAYGI
         7Cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001184; x=1744605984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qETjSISznhSwPPS1o1aaIPNAE1fFREGWY+BmDgwUuls=;
        b=b3ZGYqGOfqYQavRz99bz9G1lqEOM3trylP1d3x7q0f92a6y+eP36I5y2/poV0Ec39b
         enVZnmcxV1htCuArRMrj08ZHhMVWF00u5KIPpareqyAMqM+0t1mqOVuDTmqktxXuvLjW
         6JWnB8jJfyJbVZuIj1WOKgzytex4iqIxsDFrmRHY5styTkAZvBAsqeytiFbmPUd5thtr
         kZyFUpKl1ekBucr9RwZphsDVgo0kB77GIKIcHUY4oU/HTK+QqJZx3OV5lwkiMG0LuzRQ
         BISyjs0hoHag4brgV7ytJHCleXx6uEnGjiuQ5lasRQjSjj0oilj2xNPVmjrSHDMu5ftp
         1CEg==
X-Forwarded-Encrypted: i=1; AJvYcCUQib08LJgJe6ydAXPXf4KXcwGJCguQHknc81QKt21AhoefSWrEf5hjy3KGpjH7Ld8oLW5NvNhzt95+yv6T6X/7@lists.infradead.org
X-Gm-Message-State: AOJu0YzxPUfwWzE3WbdAAEkjrEicg9SaR2TT3lorf82oMRCL3vCz0RE9
	aP5VCDVzswwce/ckDdkCJEiWAmvyFDqP4DmAHXi78l3154D7QyQv
X-Gm-Gg: ASbGncsLjB3UZ9wb9w2KKdSzUCpKOMhGZJaTJPCl8y41a73Hl/a65U0J3xmj4NlmajZ
	uxQKEgHaOY8GIuNFux5lcvS5Mg8zJCdGC2jlCCIyow6hwLUlOIheSOQjHf6nywXlrK1Q+9SjGx6
	5UnFmGxv0BAITsJ4w+uFULE3quvw8/cKzVxP8fzkq9XDBEIXGgDBtojmS4lmrG8AZ8HzJRVXYp2
	MNW5WmmdlPiYHB//LmtOlJeHTrgwwpgrqSmOqAqg/GPLHM9MtLKZ6t6J6uyM5WzKK05PeP8rEr6
	37fALZ6xuDjzog8g/4mAll8y3f/FqwAF7bQPDSRRNc3+yuiRzdalD8KDgw==
X-Google-Smtp-Source: AGHT+IGYQoaK3vw8XmhPvcq6HkCDrn06T9cMzDEgAiLjyJ5UOyzNsi1lR4Ihahet6xHWzu4E4Z37Rg==
X-Received: by 2002:a17:90a:d646:b0:2fe:ba7f:8032 with SMTP id 98e67ed59e1d1-306a485e486mr17007211a91.9.1744001184276;
        Sun, 06 Apr 2025 21:46:24 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:23 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:15 +0800
Subject: [PATCH v6 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-6-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=XuN7zsZ7YOoemig6fmya2Ywu9aWxTuisbfQnSd0HHz8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iGrPE67Q+X5dil2ghBm2CGl7DhIEIc+JlRJ
 NJTDrRde/CJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhgAKCRABygi3psUI
 JAGoD/0YlUpOe37l+KbRTZhMKDfhWXru37w+hdyNOlWkR7VlVG6Wm9JXOoi6TZAfmZ18hLmEWFI
 ApstQjHIziX7xMZmCLoqJzhyz3z+jT/hB/KOZkyqPuXGP9lqXrUv+ZfwOoriN/TxipED4iaFQ30
 RcZojMN02vgjs5V/q70m2yCDB0woPyl0Hi5veJYGk9gW/eWkV4/M1SPbLPA6hjhcPaTBwVk4BMm
 AFYl7Kwd9JGSFjmCX65dWHCEF/oIyYDekVF8eclHld0rb42++mI81Be745a1LnQlIyJ08OZ9aKP
 2Jt9hb1zXMKZZSShjEMijmFjZJjKRMXrF814vXTis/Zz4lLDEF1RRu24GGLmttLmtlvZctbCS+m
 fMAsnjibZCTX6m1QeX3rL4kIdzRbf5AT4jdZFPBXiFAiZkvqNvgxaQ2pxrHhRbokO415JrhDLhJ
 tynSka+I8eH7afYDNUZ8ZxMPSsI+DnELqidBUYQ8Kv6e+zJQzqNYq54TJ4A8kUylkNLpF1wsszZ
 NeOO7hm40HKZMGArEfsv9cgXxJahNEI9jOs0bj0e+fqFzDXtHY935bLrUjOMNYTRKMETpT+KWkU
 hkbrfmnCimvRl4LuLLJIrPS+jEna8ywL4Gh65CecJZB6OgIXY7BKcLfZO7UtsRQx040CazpLyoY
 lDfz2AsMUSeJ7Xg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214625_255503_1640F63F 
X-CRM114-Status: GOOD (  11.32  )
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
index f2566a0f8d330fdc0d71ae298f16ee9700a13c23..38fb9200369c11d0d7674bec4f350915c67352b9 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -660,7 +660,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -682,6 +681,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -691,6 +691,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -700,6 +701,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -709,6 +711,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.49.0


