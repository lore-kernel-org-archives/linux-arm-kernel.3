Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DB5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=; b=i9ls8qGtbkJ57gGnbeGeA9vUky
	juWGs/hhR4k0AsBruYl6RVJKIpLVRpFlwvDMUuYxaBx+AmTBqNiqBcNIcnCVbkS1I2THWadq90iqc
	qJpsaHhfsW3mRLj3bXwH672gd++2pLcAUolqvqS3wo6m6KWBmwIezjZ2ljr8vtkQpiyOSC88DkTki
	niNsyNZUyBHWKboBKa4aqbAyBSZZn0b78gG6uRcJrrQEoH3VaOiR4hsYLpKNf+tcE3k+KCCcoeLa1
	hxE4CcRW9hjGrC8/D49siw/1OmvOKoi9AqGsGNZ+1JATb1xbQgQ5jNDSdRp55bVwuLJBS0Ugf+7ho
	LA+Fw7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eas-0000000GOeL-3MT0;
	Mon, 07 Apr 2025 05:00:22 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNQ-0000000GMk6-0o44
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:29 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-aee773df955so3062357a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001187; x=1744605987; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=;
        b=QO+Oet1SG62piU8IGdeH9pEnUgpD/ieBni1LAGVPo+NCZtGFhHuFZ4OkyUda24vxrw
         DN3ICRkRDpp1tSRzK/8C5VhX5uO9znFwUQ7K2mpIRtNuBe3KFzFzeGPgOwn1YPbQTvC4
         f4LpVXg5JFHOGPCV0O/oS6kysTBT0q5naFcwZsv+ejzpwO7faUBsj1/rwtAdmNW6bmxe
         Jjc2g+ExxGHM9tpuYQ/qN8HdpyyTAxyIP08Hz0eMhOwy8IxD8fAHiuO/G4dY5pfk2w2Z
         DCC+lCbRpNpe1nu0KDYrvf1CEAcdXz0JQsMQI40BQ9jEzJGrhjeZwGfHa/efg8JLOYcj
         SC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001187; x=1744605987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=;
        b=jZoGSk3GWbCCCWtWESZpGtcB7X96rvErM+BiFbBIB8YTKbszkLfwAsxD0Idig19X6H
         g1CGWKtGfOPVxUAYEspS1Agcxp4AZT7kA9ni+3q4XC/GtqoBGClOHnGRqKlXtilkvYm0
         0hclx21KGRRktj2l11j0Efzgqtlaxhh9o2Vb72BBmZrmNg9FIo0yXjTgj7U4pYjMcdP3
         WGa3zWP+2467oyvMnBR+RSLWksUa99Osoz+tc1uPfzQNbvSkr2uONUqlwx7Kv/n36Kr7
         gGCttxkc7nJ0KK8nMLqHo0pe0HHNzzPdJB7t64ro0xFWcLuvaC0WGQNGsDi8rnO+W4n/
         UZpA==
X-Forwarded-Encrypted: i=1; AJvYcCUh8BzKOJb/jXB0SOzSxYovNBnBqpxw/8Oa95vCEpv4oEkuQ9UDKrA1iyrz8tnaPQ7BwosoRF4V0JjD57kjC0KD@lists.infradead.org
X-Gm-Message-State: AOJu0YwqI3tfGO0QzEsFzTpoqCHC6GT4xCi9Wyj+sb3jgqy355gKaJJW
	cvkpOQEA0lxhJJyleeQ01aDt9Ce2tdRjmM7TUSEBf3trjPASjWU4
X-Gm-Gg: ASbGncvsyfNFLXElodzIuugq7nmj2PVZbZ2ssTvZE36xMiGIvgmR72s0o3VFxip+p/q
	nd2RCKvqbTc6Id+dO/5BSFKlcCFLJXx9CZswrYcIim89TIpC3EyLcXhNnQbOSEX6OdGZIhQCVCN
	cVnt1ITvxPEfiJNd8CsGlYbht11di6uhBc0jEhxmz2c5IV3NygjX8y7V7JA8FaM52MhBtCRGLIt
	IpPYbY4DIXO+ylZQsGqnMBp8yUXsnYe3Q3jsLtyr6Ux4rOnOsZqprd3Qzpfbi/rXyxvnxqMawPZ
	BF+1jxVVzRs7c0Lcx9/kc4zGK76MzCIR9iKNirdgwE/oN/Y=
X-Google-Smtp-Source: AGHT+IFtOzYQwCPnZ2zUn89rY14sYabFBGbtV8W7FYB2zj8vZDYi8rLaZzpBoEuRbxFF4E3itRzQ7Q==
X-Received: by 2002:a17:90b:5690:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-306a4dad016mr16981125a91.0.1744001187582;
        Sun, 06 Apr 2025 21:46:27 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:27 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:16 +0800
Subject: [PATCH v6 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-7-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=yx4ulzghzXPNnasdFXmt4DIvCjCuPnUboqBEbKM2bdE=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iG2cjlECAVc2xh3RvoP5G4JQxHopLKpmx5g
 EZq58CWMdSJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhgAKCRABygi3psUI
 JI48D/9yWpErN8+SzWqorucLiJZD4IWKvA3WTpOs9IDbnYncSBqRyTdCI8cEz9NTaiqmK9rkzyT
 eOs3LOoSZ+zDpwZUisCRnHzpnEWpG12m0U7QT6Dz5T9jxospC7BWtE7jR6erW8qaVl1cyQCLgU+
 iRTqhFHDQzEj+MgveAygx9JOuBbKhhUWEC+7JgLvc5Ilb1JhhUPeK5klyL3Wd1gRW2egeEj1EHU
 GNYLKC2XQGV4qSlT2eJ6e+2eInE2J/JunpGTlzByHG4YtNmtR6dwXnS+qibbxXRM1OkzmZPuL/l
 +1vKcfM163wH1eWvbfOBT65Lnl1eH9AN2uQyNqIvReOdjpybQNNmBmzzczAMoqElZ/Mpj5pd4Ns
 XnBarMiJi9UNyUFDMIKPcTrbPtF1prH8uIgkRAdC+j/7vsrNEiGIgmUIkXdtLHRID+fX4PYEo+d
 ZeVjdI7h4YzfhPLU2EtpmSMbDj++A/3/9wOFmJzyENVyXbWMS4qHd59WSks887yNBrwCo2gtOh2
 Tc1wh4/AliOJ4HOPCFBIvF3IeqZNDSbcHobgfWRRvIsSCIt7wCjIkKveq4uXZy8K5t3HWGhoIrE
 +bxFXCHXYH2UGWPzro+sNN00HB/IYyK4O3EMHdCNHZyzxaOpJlBimgGfysoV046rU0NyzpwHbzV
 hwi9OqF/hPlp6kA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214628_234167_DE4BA7AF 
X-CRM114-Status: GOOD (  11.52  )
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
index 38fb9200369c11d0d7674bec4f350915c67352b9..523ad37a07521692206cc438b8d777f505506c7e 100644
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


