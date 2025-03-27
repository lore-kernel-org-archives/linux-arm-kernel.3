Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D22EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKAfCqQ7Qjy4MJYkAdCHV9zfU4kl+sMGOwwGVOQa3Ms=; b=wDS9c/GUBrFaTpxmM8nlN1IiGp
	UTUCvVNX3zONTNjeLxCTOCZ69JCDQ3Ju2V5cpdModZ03oUnZuy0UV9H0EbGhZ8PrETWP1MTaAkcyN
	Xqdf//GPg17jLXqasokUDL1EkIMcFYIdTh96cYtQ91odSt/LvkNEcDWMZUYkMXuPPElo7MyNsnILI
	mFF0vJvUzzhg2xjZC6IvTdHH91/wWqKN1g+NJ2pxlSVWSpn9u5R3KZ+P8399TMzMhVhdu4hhl8NUY
	ZVeSytLDG0gIgK2agrDhpPuHoIDxlztEkq9lYPFm5zz1fVmAy1fIfB9U9bPBK14zMkK/CZspf5O1x
	MB/P6lWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtWd-0000000Bvut-3LsS;
	Thu, 27 Mar 2025 20:08:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1t-0000000BpsF-3vsn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:43 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so5156708a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104201; x=1743709001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKAfCqQ7Qjy4MJYkAdCHV9zfU4kl+sMGOwwGVOQa3Ms=;
        b=ql+sORbg4ad08+K0hcP/WFo7pRjpRK8oLdsgEfyntrSkxgiVN6htInp8/DY5MRzTCj
         pnThLm6a1x1XHjTEFL624QEoHtaPj2yOGPGDrswlTzaE+S4hg8akF5CVnZvOHyqkDRQk
         DU+YRD7INeKacKR17m3Ap1eppa2dN1esnQ+GtCjMzY/1nnH17nFKy+NDZhFxbiKngStz
         43mzoQu4smxV2McRYTcN/dWnBmmWjLWrjBEMpLl58tPBLINK137GGw8zup3HK0PQMT4R
         0FAuAMARTsP5Fyg/pyZX3p4E3voNN3z8imJ5mtuGkjr6vkYRChrKS++JG6ler8za1c3W
         a0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104201; x=1743709001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKAfCqQ7Qjy4MJYkAdCHV9zfU4kl+sMGOwwGVOQa3Ms=;
        b=Goj8PVgJsYjiuUQ83K+x6UitAGjND8fvlkELYalje8N/MBXXeJCLq1Tww2NRZq5p6i
         PIinNR22m7XaMIyjQZ1YTT664D3hiakD3sNkfogv8A5SRNmr+QpigIWuxcCQw2IfBnn8
         RWmf3bBchvfqoRB5yQlXn2Zzqwm1a8f0iiGMCPSc/e+/6ntHEtykVje44vTbgIVWEFiy
         jUonet3MCpuJMHfDT9yFFURQTSKxNj9cBlhBm3qfuqRStauXEKHoJPuDtiVhl+iTtvme
         3ZwTo4U6ZWJhkztvn9UfNMqbCDUlMk3Xknmi8XGGTedyo3fz/gtKWsfNcAZbyo/yXeHU
         iU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWe0ir4NuQUTG38mIEqNucajBjODkbFF3EqD8Wy/3HdgrZz2w73j4u+Hsab4hTs/kVnIRmY4skDOym99ldRg8q7@lists.infradead.org
X-Gm-Message-State: AOJu0YxQH0c/ImRrOAjN3qmz/KdO3bM9py2TxktaZK7SBmIhOuWYy69O
	U0N2YsF6S+4KxZIbU/ZLVNRGt9AX3cEsPP3qLQ1ilf6lUQD3iAkJsVtMxhRDiCg=
X-Gm-Gg: ASbGncvJua2+eiFSuIyOVBs6dabFtq2Nj9n4WMSXpKJ2aoJ69m825E16kNA0hMQFnF/
	nmmf6wk0dMvlRnu4JkhuipLj2Ul0GqZsgeINgg5wSrjUXeqe+ciq8lXyaQY3/p7SW2ezejIkKiW
	F7bLSPIAG8B1Q/h0TE1WCHrxrqUNfUGLmsDmDyvxGpP6Ic6z9l2CDJAqpZWCA/zCf6/nW4W16iU
	5fnCStiqBtZnjisrolHwrZrTR1G7um1WkJRK0LeYcfbfa2v7ZHHtW/oeKgob4BZsOh0QxtMSQum
	kwWQuoPDilFZjxNS9ix82+5/TiQ+rwTPKEZd2RiRvHlrzFODetBKKe9cAg==
X-Google-Smtp-Source: AGHT+IHMf2f5UBv5DVE142wh0oBPFx9moUIGj7INCFxWN59jTOUXk2pfw5aEvm/YJFqWLspysjUW3w==
X-Received: by 2002:a17:90a:dfc7:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-3051c85e607mr159363a91.3.1743104201222;
        Thu, 27 Mar 2025 12:36:41 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:40 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:59 -0700
Subject: [PATCH v5 18/21] RISC-V: perf: Add Qemu virt machine events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-18-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123642_058531_9C8701CA 
X-CRM114-Status: GOOD (  13.79  )
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

Qemu virt machine supports a very minimal set of legacy perf events.
Add them to the vendor table so that users can use them when
counter delegation is enabled.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/vendorid_list.h |  4 ++++
 drivers/perf/riscv_pmu_dev.c           | 36 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index a5150cdf34d8..0eefc844923e 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -10,4 +10,8 @@
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
+#define QEMU_VIRT_VENDOR_ID		0x000
+#define QEMU_VIRT_IMPL_ID		0x000
+#define QEMU_VIRT_ARCH_ID		0x000
+
 #endif
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 8a079949e3a4..cd2ac4cf34f1 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -26,6 +26,7 @@
 #include <asm/sbi.h>
 #include <asm/cpufeature.h>
 #include <asm/vendor_extensions.h>
+#include <asm/vendorid_list.h>
 #include <asm/vendor_extensions/andes.h>
 #include <asm/hwcap.h>
 #include <asm/csr_ind.h>
@@ -391,7 +392,42 @@ struct riscv_vendor_pmu_events {
 	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
 	  .attrs_events = _attrs },
 
+/* QEMU virt PMU events */
+static const struct riscv_pmu_event qemu_virt_hw_event_map[PERF_COUNT_HW_MAX] = {
+	PERF_MAP_ALL_UNSUPPORTED,
+	[PERF_COUNT_HW_CPU_CYCLES]		= {0x01, 0xFFFFFFF8},
+	[PERF_COUNT_HW_INSTRUCTIONS]		= {0x02, 0xFFFFFFF8}
+};
+
+static const struct riscv_pmu_event qemu_virt_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
+						[PERF_COUNT_HW_CACHE_OP_MAX]
+						[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
+	PERF_CACHE_MAP_ALL_UNSUPPORTED,
+	[C(DTLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10019, 0xFFFFFFF8},
+	[C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]	= {0x1001B, 0xFFFFFFF8},
+
+	[C(ITLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10021, 0xFFFFFFF8},
+};
+
+RVPMU_EVENT_CMASK_ATTR(cycles, cycles, 0x01, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(instructions, instructions, 0x02, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(dTLB-load-misses, dTLB_load_miss, 0x10019, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(dTLB-store-misses, dTLB_store_miss, 0x1001B, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(iTLB-load-misses, iTLB_load_miss, 0x10021, 0xFFFFFFF8);
+
+static struct attribute *qemu_virt_event_group[] = {
+	RVPMU_EVENT_ATTR_PTR(cycles),
+	RVPMU_EVENT_ATTR_PTR(instructions),
+	RVPMU_EVENT_ATTR_PTR(dTLB_load_miss),
+	RVPMU_EVENT_ATTR_PTR(dTLB_store_miss),
+	RVPMU_EVENT_ATTR_PTR(iTLB_load_miss),
+	NULL,
+};
+
 static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
+	RISCV_VENDOR_PMU_EVENTS(QEMU_VIRT_VENDOR_ID, QEMU_VIRT_ARCH_ID, QEMU_VIRT_IMPL_ID,
+				qemu_virt_hw_event_map, qemu_virt_cache_event_map,
+				qemu_virt_event_group)
 };
 
 const struct riscv_pmu_event *current_pmu_hw_event_map;

-- 
2.43.0


