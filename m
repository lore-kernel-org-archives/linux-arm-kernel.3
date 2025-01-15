Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C1EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=; b=U1ShEN27zC0BLSu2jKgjU1CvZK
	6YCi8mxi71oln6KxMm2sBW7l3OBIZegi7GOWzhU9bNjPgm/2diUNaXPqtc+MIgfRuWOQCsf+J5aVp
	e1Bo7f/93Ug1eyjJOUKcm2rpz6Sh8OWMKRrZkQ5U1e0AjUjRaBlrE5b1N4VJa0FnUucEK9E/gApYc
	ierryPeWJX/TLG5YriiC9OlUG419BguqRr7GKH2Dh8ORVMLkGPuZwjPpWDmL7U7rQo853kEqrBqmQ
	qN8qZg1g5q0JGqldLcWBL5Tk3ZxO8GjmdUC/eNV/YteIhUXhGtZruDEpovQM8rdtULMUyeJdp4DvA
	5Vv7QnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8Gg-0000000Cn4k-3aC0;
	Wed, 15 Jan 2025 18:37:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AO-0000000ClC5-3Jjy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21634338cfdso128148785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 10:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965860; x=1737570660; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=;
        b=h8Yp7TE4M/x2CnoHbrQtjf0sxDOkhXQzJ5XdpO8HWEWW432Xtd6YnFejCEG7e1wWom
         kXN/s7O6jQSpEtKFyKJB4AwD9TaUWJPqajSyDDwSTaTaNrug7mPMbkkGuEWUWKfsBuCO
         lx2soA1Dq9oCKrCAGXKBbLI4B/W+M5I04sLYxkIi52g4NhDc3b8Qsp13YTU4movEWUQH
         mhosY8j/NbmW15LLYi5plThDWbBNrhQgmB4RcMONX/yyNFZnXlkas38nDvCyBgaaGcoj
         wuThcvgqNAQ9PI4lQZDPUgPBypdGZk0BMx52soz6CzMTrVb1UZuu7Ye+dGBrvIFWfrur
         aVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965860; x=1737570660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=;
        b=TgJoPLnRnmlabp2rh7HDyjuugRQhsW6BHGbyJpxRgde/s14fbEeSnzhMNk4fMTF7/r
         BRPiRoCtMce4BGttXUqs94PrhpvyjlOEUBabXiVu67M4ez/f4rm9xQw++pW8/7gs8fmq
         OGhp0tjTIriBlObL3IdMRH2FxkrrzIkoxymBevce/ExW7AGbhDwUftFFNN1J8pTJVYIy
         vojS0p3NrJMQDfzR2qIec7JZIZe+Rm/6/rxIcx/Fr0Jchru5VINSH2f6uLh9M6yPzz4e
         N5GaeClud/zmgtidMgAiajAKXxJ6XZ/yJ3qvj6YFmsbzb/imN5e6FEW/FciRCOIsQcA/
         Og0A==
X-Forwarded-Encrypted: i=1; AJvYcCU0sA9GFmHdGIvGhs9ictjNSVAPq7YH7iQePJwZgOBYIrzvGf5lO1uxilHZy4QDCItUCBrJQO5lc+Kh5W/ff1QZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yznnixb2IDA/6gObsrx6dV0CXCRsU7X5mhQYNryZDkFWm5CjOg+
	uon37dDrmdO7cgtw/yuZK1hSYP2dGjfnAy67eE6csDE09G0JyaU+UEIL6VRtAaU=
X-Gm-Gg: ASbGncuXB6F1tFnVQhhdArn7ICSGTKktXU+Mhj78MIZTOCRADUmLCWwEFq+LVqqEN9Z
	Hdfnkc4J8X/G87fDJIUjEcPssPZ6XGHZfMj7d6FNzKLUMpjm+cxqFFwuttW49asXplpmSB4wXQ4
	LRVMAXbROnJda+KpJfG7wJ8+E6/ZG7JnLEHya5jikDTqWDWWI9rZz70d0reYLr1cEO6K1Wc+Ved
	tgnvs4YTrcZULBs6MEByCgjm3kGwjOmTV+jrbUDbqYf3x/jleOuxaJh7LtiZCfME7F83w==
X-Google-Smtp-Source: AGHT+IFhv3d+iNN38adFn+dH29zIS7C6pmY5MPy1fONgMvFeK1H10VHPHqcDN6p90NhFpRdpeycXlA==
X-Received: by 2002:a17:902:f68b:b0:216:32c4:f807 with SMTP id d9443c01a7336-21a83fdea82mr472230285ad.45.1736965858786;
        Wed, 15 Jan 2025 10:30:58 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:43 -0800
Subject: [PATCH v2 3/9] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-pmu_event_info-v2-3-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103100_881143_C28E7E67 
X-CRM114-Status: GOOD (  11.58  )
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

SBI v3.0 introuced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2707a51b082c..efd66835c2b8 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
 		type = PERF_TYPE_HW_CACHE;
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
 	case SBI_PMU_EVENT_TYPE_FW:
 		type = PERF_TYPE_RAW;
 		break;
@@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 	case SBI_PMU_EVENT_TYPE_RAW:
 		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
 		break;
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
+		config = evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
+		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
 			config = (1ULL << 63) | ecode;

-- 
2.34.1


