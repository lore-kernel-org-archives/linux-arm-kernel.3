Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A23FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8V1iPWcqNA0HiKYEXXLEH80k6K3piZxher31w9nAbY=; b=UWguvQxJcH9B8Cl1LagDUxQzVO
	WbwHNaqBhG8Vo0c4RA1RBuPmwA9hJ2D5sUyQRd3MUuFY2IFLuzIdrknP0CJwDjMx3nY/Pvpb1cF5A
	q2R9iF7EQslWF/FK+nmLXIZmamusllLMu6hd+4BlveSJ1HDLJv+eWgmEdWv31GJxHvsGzmr97dcZ6
	B5LGbGFDdOUPqFWCc/puMG8o8Mlq6iWoAeb1TTsIzS600vZM0hVkVMBQRjWHGQ0HVknpyBa+ioYVj
	HfyYlWZ73dz7ZImpOKObGZ2d7XUn+f9zl/nl0rnF3z4ugCuadLqx486Lf7MSIjRwqS+b/QzNtY0G0
	g9m/HXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDm3k-000000065a0-0dTH;
	Sat, 10 May 2025 15:24:16 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlrh-00000006479-3g8H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:11:50 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-30ab344a1d8so3021151a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889909; x=1747494709; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8V1iPWcqNA0HiKYEXXLEH80k6K3piZxher31w9nAbY=;
        b=A2JSSNgqP9jr8Sl6Hwurq611Y2GjcZpV08f91wFuQfaHJWo6S7zDWjkc87HgABiZWV
         1vFJsTjPMDvkSdExInPnAhGhAzEx0RIGCv31ZK3fdo48lwsSXq8Ap3O2bzFMK9IoTdUU
         RPLUS5pI05V+Lbo2kxW94qgYRBGRFSoQq2MzE3TtBpSSltDj7gR7eyXaxrC+MHLYXXj0
         c9NGmMVoWE5h2rOdUEWeEGznQFVdirYApqms4t/nSaz3jm04heEm8tJoQysiQAYrarho
         Dey0pACfruQdhOqL6Gni1RpukjBjnrBoMU2OgcCCuvHmCTX4bfUc5LHplSrhT+ESSYlW
         wXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889909; x=1747494709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8V1iPWcqNA0HiKYEXXLEH80k6K3piZxher31w9nAbY=;
        b=fbs0VRdR9AKeULwgzEOjmv+ehHoy9IJwcrcFnc8CCbnC0wol/SQG/iORiuLe9EDMsM
         UGmqBVrJR0QwI7/JvT9NRrpIYHViyeS7uiKpFuVUO1fP57AzLeB4D0PA6GaNUNPKDJZ3
         bXzc+otQHAfFIo4+eU7T+L2vWlpP/FJ5izq+9FChQSYX+upG6U8OLosQdi+Nfycx99HZ
         Rh8qeRy5fEqlBZBqi4tDHBQOJo/baJ23iJOZlEzl+O/fFDcM4Iaqzoz2cL4L3hm5xSQE
         UH/JEHPsQ3XlvUAaXg7m7tngk9zIME9qJkY+sDidAajeLqsnAiL01yXHqwAwJLNFOP4I
         feyg==
X-Forwarded-Encrypted: i=1; AJvYcCXlQY8qmIGPtTK+09Te1YTDHO7lUaXHBL6CUqEh//arxaPqJ0RzreLZ6E/xJNviemb1GsvqsoOTyO0IIhp0XXuf@lists.infradead.org
X-Gm-Message-State: AOJu0YynaANNtQ/05qz3nT70IaWHViTFyCDMG3PIiD3KHp9MmBvRdrZ8
	Uwv1/CVPyVSfdgBHhNF3DHZ1kno9H1q+QOhj+yd4sfH+CxD3bi6U
X-Gm-Gg: ASbGncvWWTiuk4io+Fv4x2xjJWyRML4978QC6E7yjklt7EVW3I2G+kGaxzGqCwzJyii
	HtwVnuszNliSUBW4OmlJkZvOI3QbK+Rrxded354SD/5hRkcnze9ILZY7LLTfQ3aZD/UNjNTA+nY
	o5UHQg2/eaPBHbbVL6SvZFpU4RHnwY+ciFx0RS3dSdpSGwPs4ASR3PBOhVQjE4+tDe5iCDv+DFQ
	puPsHoTbkH/g5PuyOtFaFxD1MA55/ifN1+BmW1OA/6zdOTrmQy0JVi9H/UhcwCBWvCFYHHVzUw6
	5463MA7eLJj9Jq0dcs4dBm/iVgfzekSzVc6sT5vEZjeOVjFYPBGiVg==
X-Google-Smtp-Source: AGHT+IG+6iuaHV5VMdUjI4NiHZ4ZYI6UNAo/RMO/6rakgw1KRm9K6rCnAM+HbTPpoBA2+u8ionYImg==
X-Received: by 2002:a17:90b:2d92:b0:2fc:ec7c:d371 with SMTP id 98e67ed59e1d1-30c3cafda23mr10665386a91.3.1746889908845;
        Sat, 10 May 2025 08:11:48 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:47 +0800
Subject: [PATCH v7 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-6-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
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
 h=from:subject:message-id; bh=EHqn1hF+O5cx1kCcX9b9emwg/l7WZgXjC8JEUTZtaNY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yalP9EYa1Hto2s555HOXngh1U9zcmMv/j18
 10nML/8yWyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JFPKEACLAir2vysaJA4vW2/wJNXc3LFvdB6JbUIkeCnNhdYZBqPk1wOsy+4D70Zpndy6fUI+g9O
 pTv4FMrBHZSJGO1gIVgM4uy3qYT8TyQiX88ZGV8TEy7evFYsT2HGn/wmWmnKuXX0kS3ZsFm2QgX
 HqYYqPnINxdvSzgENDCWcqRxaelhXDu3j6EFVS2vIcJrODPFo70JquC+FJHi231FTSkCo7gxuIe
 UsU4DL4Migghp4vlXdFCmrfVCH8YEo3ivJuXHljZ150YJNKAyxV8Orfr7MiVTo1zsiiEeTuq61z
 88CwjDnbGvTwTYI7iFoXM4RHnMFiBUFDmyeKIiSizQSIOxJVjq31LbiXCGDyF2zFKlM4FNnKwem
 7loSz1HSE6p/Ps4RAN0pag2hl9DqPGdmevV9ZrczVaCSK2AkuNdQvw7qSzXC8vVY2g0i3D7xI1T
 hQLUE8XUtC97EkKkUXjXSx9wd3o0IMZO1VWYuM6Br+Q07NCv6r5H4ZTQtkP7+xGzmGskU6/IhpQ
 Ini9u3C/Sm8s38ZXLNJUo42/ciLHuJlpNiKFIogWlnAmf/3HZin/0mFixUTV1HlYIoPnCsBa8aM
 8j7yR4FDBuKbScHabpHy2go+ai36DU1SZVQSJCBLU3ZP4NErrfSoaXyKV3FYwNiyya8yXJZouR+
 2JCVzmaTrq26L+A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081149_918739_088A312D 
X-CRM114-Status: GOOD (  11.55  )
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
index 6736909a7df672a08938a392d450dc9b5b7bce9e..f4d8da4a8aa0c197cd16af422b33f4cd943d379d 100644
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


