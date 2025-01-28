Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882A5C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 05:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSrHfq1ODaepQOo+hHypeE7yxwo5oeqvpXeWUiwKXOQ=; b=ikiPED/B/Dam0SjbvyC7PJMNCO
	H7N2wVmWnOGHH6uEM3SE+zoCq6qqhs35Q4YuXT9W42LFhvrJy0yieC8Z2Vmi0XYCdgLV1zyrID5am
	ng4PssPWd+/q31ENBbk/MMUqC+Sn5Met0Yt+DXXTe+xUwbS2B/X2h+1Giu7sMTgEVHN25YYOZoRLt
	5CdHyzZbhqlCnJTZFWMbbVH8H23/vPNbzCPJL4D7GIVbsXULovd94yd+lpY4vh+iOhX1QY/leqlU7
	8iGoaD8E+OjuVmDxSCTzOIsuEhLvBGU4epJxdHaYvUbac1VJ8YDe0M2JUZey9+sMgvWqMs6ya2tdZ
	TGW9jSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdxO-000000048Xd-1Grp;
	Tue, 28 Jan 2025 05:16:14 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhq-000000044eW-3LSQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:13 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso9669873a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 21:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040410; x=1738645210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSrHfq1ODaepQOo+hHypeE7yxwo5oeqvpXeWUiwKXOQ=;
        b=kDnOZfyG0FWzt4IOVjQQhkz9JRPkyK/h+4GSNY/Xd2cv+2mP727+lmToPYd4g0IeX3
         SsWrB1fK7JKG9yYdH1dO6XaZ0OHjmd21tacCMdfnXVBFIRoMuDZ3/WscNpJa50aVVdOk
         o4x3JY5QMpx7mAkevkFANKI+tnBRiCV9mfuZ5bmwCvSCvGbRnGCbTYem4nmAmawtLtv5
         pJ5qqMjHCHCMwVsuvOmWsblxASBgTUc1EmxmYlz9LuPArE8RKkbOir/BCyWcCmMDO0mN
         64F9ILCC56/GnCzGO4ylLkhGioyKISLTY7A6AknVYhj0Neqvks1dOpwZ2JNi/BO3lAqd
         p6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040410; x=1738645210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSrHfq1ODaepQOo+hHypeE7yxwo5oeqvpXeWUiwKXOQ=;
        b=nZgXRAsfB2OI1RdpCQimWSf5rt+Yr0/wJO85a3mXUjmYbGvi7R1tPSt3bPjuum7Kzw
         4/UkN10oLhimxPkVPegSc+jhE6MuZDsLCAVIcfyT6xXao7TatKfzJbCHtkL0JmIOmStO
         eUD/tsPJo08XKbzfKOU5lXqW+LjM5aGOhK5vGGwuHakEhNXszN2MKHEX8yhijxnqui3/
         BxdOS9mebP0NlvwNshFjLjs9vBT7IsM7ST2R1OLisEPQ7e9ZyGwbPXVO5qfqbTXh4/gq
         jNqRrrH9Kt98LUXoPubY54fPSgXwyp4eLOa3yq8WhezPnj8z76aBAY35Re0aXW2lWK1V
         gObw==
X-Forwarded-Encrypted: i=1; AJvYcCUjE/tNG41CuOKHt4WJgIzw+zCV4jS977A/m0u9PKL5zwK5G5B6OMNA3hJKO3p37S2Kn99fHxa4xBR5Mhi7AjkJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwCgYnagQe2eJxCPvnjYNKmfkH0wmTGPHSUEB8ScYU8BDgFROKe
	63bR2kZ+cA4rmXErM58DX5C2Pz4XWiMAkVntHB8kBmqC1Dj4MmKRZfapiNDY4t0=
X-Gm-Gg: ASbGnctincI4ifRYBTrTxXLbcLFOT1Mmlbsm8Ghtxd5Lb/gpaQIJ5f2sLZZ1g567hcl
	yEh/lyY5KmuUoBHJd2Ti/YGG9DX7ARxUSTGlUOi7dTYU4EoXluC99p10cX6NgZf9UjApQj/dfTs
	9bC1mlI2HbZog+2jZJyx3aJ7IfxWuGo/yPy5utdL70hkCryZd4MCBFs6ibWTDbggMy+v501x6g/
	u76JgxZBoQIIB6b/OtJ+cjhkW/mS42TEtGi2aaAP5Vj/2hXxvWZUmGZ0Ar3aWTIZOhaMSMvcWOm
	VeAiVY+dSUYf8viOC+r4+Nk+tNzE
X-Google-Smtp-Source: AGHT+IFvlfPVqMCu2zkoZbhcnulgbZV3w347S9tQLlvr5tqQ00LyLOv3SR3w4dBEc2GE4tcYLaucAw==
X-Received: by 2002:a17:90b:5208:b0:2f7:4c7a:b5f with SMTP id 98e67ed59e1d1-2f82bfa1bc4mr3200150a91.2.1738040410254;
        Mon, 27 Jan 2025 21:00:10 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:10 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:54 -0800
Subject: [PATCH v3 13/21] RISC-V: perf: Add a mechanism to defined legacy
 event encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-counter_delegation-v3-13-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_210010_884183_4271B540 
X-CRM114-Status: GOOD (  17.68  )
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


