Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F65C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSrHfq1ODaepQOo+hHypeE7yxwo5oeqvpXeWUiwKXOQ=; b=y6tIjWjJ96gKKeTXO3a5Y/Z2XA
	HDESIgNp+LpSBSKPRW8Hv80Nx//oWOlC77fN0WJqAJ5BxiC/QCjF7PJsbxhphc6RhM+wwtPeyA2BU
	BQ/26/RNxELnh5xlRQzrxpvf7ZbhYbmt939HZi0dLSjorhpBlT8lAhzG92ZpFF3W9iHrlXIoWGriZ
	ljUXq7z8CiSLZXA/Xt62WYKMTaLoa5urYrK6CU9vnH8oYGZjBBBu9pWqpP+Mw9zkKe6yfCzLoB1bi
	AF6GZ1i+8uQ3ldd7Ugj0yK8Oj2hz01XjRbtsZgkA3XkCMHtxd3CmjQ+O7bFxnYZdUE/gTp+x+YtIP
	c6MViQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXq8g-0000000A4Yd-1rTt;
	Tue, 14 Jan 2025 23:16:02 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprt-0000000A02S-3CG6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:43 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21628b3fe7dso103697835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 14:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895521; x=1737500321; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSrHfq1ODaepQOo+hHypeE7yxwo5oeqvpXeWUiwKXOQ=;
        b=UfNp1seRDFAQ53i0PvaetrZhVSrc5JEWnP+Kil0PVGc8EeGGjxYHnggbERuuyMkCCF
         QvJgRUS3CjSrK4QfnqdOTjXGK8UhIHJqyNU0aVAD6/K+Ifw3/dyBm2NEiOYAj6y+d6XD
         08DNKBLAvTfe9sDxP4DOOpyap6+rJnxN1d9jn7b6ME/DLtSIJMUYkNU2FCJV9YxRorG/
         rK2xAfBvEyj6hJrqfVml9Gx5uCLwkxXWcCMK+VaA1J5gQlj28Hm57cnxm2rZlYGq8ZsY
         PLPJoqV+ePZc/WcVvOj3Tl6Lksf4fwgBHB80s81wEudTSdfsKLrccwT2mu010ysRWe3Q
         nLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895521; x=1737500321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSrHfq1ODaepQOo+hHypeE7yxwo5oeqvpXeWUiwKXOQ=;
        b=hZFtI1vz4h0Azo1QmAX0aIunf5W+SJG/nMYTW/Ypd+CpLw+N6OwA4x+F3jmE97ZNiV
         Ivlz76j+veGaEjsIU89rM/Ux1wisggVczgZOi5sCdP2QWffdj0U+CV+Y7OCEVkKUeAtx
         zrS3g+45W6Y01SZbM8gV9tyvb5BIGRXLLJw66VjkSZdIr3MtJIOwaSZazSiZezLdpzbB
         4mpb76HJ+pYh2NUycyV4Almz/w2RsTjbjKRduGAj5BlSjmZhOPqBpMyx9lm53xIVHe9k
         jCtMsxmqmpKu2EIGP7nggFwg8T29kqsHHr9Z8Mc1ZoYXhggSLO2o5r3tZCWTH2CopItx
         XBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9NEUW8gOLe4/rD4rV9G+QOM0Hn+41q+FWnGalpSLWW1KZCHxZxZNO6CKeagLTXciP/oonGcO2dGlJMgOQIL89@lists.infradead.org
X-Gm-Message-State: AOJu0YxlrXAdbFhRYEXL0IGUvehApkxuJY72eMoaa7YQysFdTSa5bylT
	jDf4dPOXPmskRC60bch1QDgF1xoJ+Tta+Vs53bUcjX71htgKBT+yuFEhGvBmoJQ=
X-Gm-Gg: ASbGncv54BbPD8fowg9vQ2U3O0EoF+THOBeb0qbUrrBX2yzCdsHKrPZ6Vc6vaAjCKkk
	xI1vnxONFGfBY7XUGxKR5hPJJ3Ggoh7jOo2N9xiA1cKWaQ1wP1pMj8o5zS3g+KKiHkCMA8F1zED
	Ei7aoWB1vq6b/5VrCr6yErsjv4X/FsL8Tkx9+yzQU9osoD1OPYAN+Tgav5jlUeg+rMyQqxfXJOM
	gMud0eqPYn53+bKCz5cfeyU4rv0mtDZobU83PiRX7dO51ixiCjX2oNNflQ4z4lLQm0L8Q==
X-Google-Smtp-Source: AGHT+IGRbE9PP4sSJth3Mz+63UAwD8egHvRzP0t3VjOdXACcY1KJUtRtoWF3ulON7ndSDCLW6GT5WA==
X-Received: by 2002:a17:902:ec82:b0:216:2dc5:2310 with SMTP id d9443c01a7336-21a83fcf8bcmr435627195ad.48.1736895520852;
        Tue, 14 Jan 2025 14:58:40 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:40 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:38 -0800
Subject: [PATCH v2 13/21] RISC-V: perf: Add a mechanism to defined legacy
 event encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-counter_delegation-v2-13-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145841_822489_EFF3874E 
X-CRM114-Status: GOOD (  17.86  )
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

RISC-V ISA doesn't define any standard event encodings or specify
any event to counter mapping. Thus, event encoding information
and corresponding counter mapping fot those events needs to be
provided in the driver for each vendor.

Add a framework to support that. The individual platform events
will be added later.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c   | 51 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/perf/riscv_pmu.h | 13 +++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index c7adda948b5d..7742eb6d1ed2 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -307,6 +307,56 @@ static struct sbi_pmu_event_data pmu_cache_event_sbi_map[PERF_COUNT_HW_CACHE_MAX
 	},
 };
 
+/*
+ * Vendor specific PMU events.
+ */
+struct riscv_pmu_event {
+	u64 event_id;
+	u32 counter_mask;
+};
+
+struct riscv_vendor_pmu_events {
+	unsigned long vendorid;
+	unsigned long archid;
+	unsigned long implid;
+	const struct riscv_pmu_event *hw_event_map;
+	const struct riscv_pmu_event (*cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
+						       [PERF_COUNT_HW_CACHE_RESULT_MAX];
+};
+
+#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, _cache_event_map) \
+	{ .vendorid = _vendorid, .archid = _archid, .implid = _implid, \
+	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map },
+
+static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
+};
+
+const struct riscv_pmu_event *current_pmu_hw_event_map;
+const struct riscv_pmu_event (*current_pmu_cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
+							   [PERF_COUNT_HW_CACHE_RESULT_MAX];
+
+static void rvpmu_vendor_register_events(void)
+{
+	int cpu = raw_smp_processor_id();
+	unsigned long vendor_id = riscv_cached_mvendorid(cpu);
+	unsigned long impl_id = riscv_cached_mimpid(cpu);
+	unsigned long arch_id = riscv_cached_marchid(cpu);
+
+	for (int i = 0; i < ARRAY_SIZE(pmu_vendor_events_table); i++) {
+		if (pmu_vendor_events_table[i].vendorid == vendor_id &&
+		    pmu_vendor_events_table[i].implid == impl_id &&
+		    pmu_vendor_events_table[i].archid == arch_id) {
+			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
+			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
+			break;
+		}
+	}
+
+	if (!current_pmu_hw_event_map || !current_pmu_cache_event_map) {
+		pr_info("No default PMU events found\n");
+	}
+}
+
 static void rvpmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 {
 	struct sbiret ret;
@@ -1547,6 +1597,7 @@ static int __init rvpmu_devinit(void)
 	    riscv_isa_extension_available(NULL, SSCSRIND)) {
 		static_branch_enable(&riscv_pmu_cdeleg_available);
 		cdeleg_available = true;
+		rvpmu_vendor_register_events();
 	}
 
 	if (!(sbi_available || cdeleg_available))
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 525acd6d96d0..a3e1fdd5084a 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -28,6 +28,19 @@
 
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
+#define HW_OP_UNSUPPORTED		0xFFFF
+#define CACHE_OP_UNSUPPORTED		0xFFFF
+
+#define PERF_MAP_ALL_UNSUPPORTED					\
+	[0 ... PERF_COUNT_HW_MAX - 1] = {HW_OP_UNSUPPORTED, 0x0}
+
+#define PERF_CACHE_MAP_ALL_UNSUPPORTED					\
+[0 ... C(MAX) - 1] = {							\
+	[0 ... C(OP_MAX) - 1] = {					\
+		[0 ... C(RESULT_MAX) - 1] = {CACHE_OP_UNSUPPORTED, 0x0}	\
+	},								\
+}
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;

-- 
2.34.1


