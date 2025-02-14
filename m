Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92CEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkIjPnn91/SRZervKGZC0B8yDAzqnA9SsHweWh8Mdhs=; b=TzXefnYTMsZbTSBlYaGjQWgkUX
	ng6pP8N3rZRVC5RkRXwaJW+q6jD8RgtMary9dreQdVUJNA0k1L9SHym8iXOIcRPL63XlDNA3szMTN
	LLdGrcT+7yRKlicPndCatpm0dRbBUeBaeAf3HV5LCQWxUNjMJkIbR6h2oVI09y8oQUk5wSAPLwhYC
	+3GIdOj6ZDhE/WrEzEKr0qjUTG7M4hic5yv9A7PQbL+g2+XoorL4UUjeJbHwz7hkeNrVPrkS3JGSw
	uk5S3mHGd9C+a0y8C24dUxyWg8MmywR53ftekY7KC4vgAPK+pqZ4LGKHS+UXFjCVnTkmSkDCSetD3
	t6basHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiws2-0000000FBmt-3gr9;
	Fri, 14 Feb 2025 14:40:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwiO-0000000F9px-0xgM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:30:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-219f8263ae0so37010195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543448; x=1740148248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkIjPnn91/SRZervKGZC0B8yDAzqnA9SsHweWh8Mdhs=;
        b=lz4GJBqpr+JsW78II3v1m5OAOS9AycSbBFHyy4GxVJPj4c88gVRvWeMnbj+N+YZEY4
         DyQismA7vvYIzv3ycaAs7VYJAYSgFWW+aHzYL/LT580yQNkonsKGzpGjS7Q4iQVzwiln
         o6vO0Rl41voTlqu8/dnDIMumHDBQwS4796rTfTk0jI6tsnmP8XdWLtN/uXD73sdz0rTU
         c7HkpPn2ykUS/RUqjQgnR36QE9fic5j1R7wSufYNBqWAmtftOH1Lnp9q+X/NqECHmZJJ
         9CcjhEMHXauPwhmQENLmcBum2KbCHHmexhpLMObWpMbg990HItd3+Q3a09nyvDwJIGrB
         jPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543448; x=1740148248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkIjPnn91/SRZervKGZC0B8yDAzqnA9SsHweWh8Mdhs=;
        b=bRZqgIAn2/fQ9utHx2kLZ6suiaQHoy0z0PyTXWcOzcaXkiZKCeK1zjZh37Y8Ptgs7S
         RnZPTS3ACDGFNLj0mVdEig00dM6qhqeHXQEejvlbcWfH38Qkl0se/6nf+rFoKLBRboXF
         37YsmM/1ybTDmZO4zcBWCe4+WrY0yyuo7qPNO1FkOsdf11AGQz/OGFqzfEx3mxsevpIO
         G7Zx6clzSWKy3YmU9hg8YojUhfSuwm2BTanOgiQn5Oqadj+MccnZLgCQKgnZjfe6VtR9
         vr4aOAtxQRcnRsu+FyByP/I8BQZuetYJ25X6UpNNLoHbiik4lOKBFNMt/6G4SkCBcA/s
         3aLA==
X-Forwarded-Encrypted: i=1; AJvYcCXcnm7okQ7We95pm828aNC4+vSuJ2//cZtkuk2ULNgKImYMv2RnCtp16lMY9tmfn62LdpnIZIp1QkbrjDHDYXB1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx7RbB6BwnqHHokbmBEqV5I+xrZEFiUjf9PJF5gl1P71yR4Rrn
	ueq+Nu+v3HXuq5dQRdTSOzFISBv94d2d62BxH6VG8vE4qne3sRui
X-Gm-Gg: ASbGnct1YXggTL/hqDLJOxiV8wy7UcU6u3oFnuQVXcnk+J+e4giHVzWQiTgCuFxhlhB
	ZSXPt7XIZ3WZz6ChB2syg2E1dQwh7t6huu/+QVbe80qiamCOA9eQMCstRL5fpGiMcTu/v8nJ2xr
	I4AppMR88UNGjdBDykbjab0SkZ9wt85U0eDxwo0TD6DCwJIF2whaimOlVunRP8hmONogzBrCcq3
	h+dNOKzWfd4RTlMkkX8vh6c7xFdipHrDH26rCKxQH7ijRG/t/vxv1SKGfaOYY5P2a5raySgezbW
	VyS/TnDDN6mrbrNwvQ==
X-Google-Smtp-Source: AGHT+IFglqPtbNOR5d6lPNgfHapWAMCKOc/XtNXDkRhnLODWQ8FuM92j2yXPlsrbIGhvAMP7bUtYFA==
X-Received: by 2002:a17:902:e551:b0:221:1c2:2012 with SMTP id d9443c01a7336-22101c2226dmr5121005ad.49.1739543447628;
        Fri, 14 Feb 2025 06:30:47 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:47 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:32 +0800
Subject: [PATCH v4 06/11] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-6-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ODunfawf7CVe5hX+5as3cMBvBCM9oIodivRV8l+gVA4=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1OANQD+IsUSDqrlORfp2jkKJ1QfjHu80PWed
 wsiCyMmfLiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TgAAKCRABygi3psUI
 JJ8BEACp0B2nKDD0n9WAUS7AUfltglql9y7lURBC6T+c1+vW0x6Je4TI4EG8CG+yKDEjyQEL15p
 NewACnfSOBVXdxztSY+6+NvYRbO+W8KZgDlbM4aOAKOg1JrEOtigSYje8BqJbcTWwDC10sIAzSN
 vAeBN+rANWdrNouVd0H4CCxfo71A2rKPX7VAtQA1fFOuQtS/UG+v7t1pgltm64gCXZqIywyyEcY
 vgJfZWDLlg91TPdqKrHKm7fKQK81c+bF+I3Fwc2eeDyeIhmx8nCTmJ4vc4BwitobujK4h7Mwcy0
 h8Vzqcij+mPbzO2JRwWnaVuI9ngQLF6baMNd4s7+dKxixy0Ubav/CSXn6QT+UWm2w5ibSPxlhiC
 erl8bLI9FkEUg3jS9/LljeNidQOOhHaIuLmWim4Sg5biRxitgYnCZsV4o83a0eOstJvmuvm3dWl
 dWCpf/qltjbZS9dfBYgiJQ9ZoqGRMV3tX4IXN/RNw8CUeGqJf8p63a26N+rW6VEQeoyGupejGxS
 wWfyiDPKNt0hhn6ygb/2AlMgsFWmghqaaZgAapSOJTXjtTmxcjDexxEXbl5F9XzdgOvTQEJZEWh
 DW8fpWzU/U3GHBHDe2blGQUT3Wm6oFMPVfApfu4+amZjmISqbPhftYJEVBnS6a9RHTlyEOEIC2o
 kt852ZFaa0zC7RA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_063048_271721_4A6C6327 
X-CRM114-Status: GOOD (  11.56  )
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
index b601d585d204f9e59ad7f5216679b97852a46a04..f98f3e95bfdbb5e9d0fe66357f6037f056fbf25c 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -612,7 +612,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -625,6 +624,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -635,6 +635,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -645,6 +646,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -655,6 +657,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1


