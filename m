Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045EAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+uvKlLnv4557Icjif9h7ezpBJYOQndwpRbHYJUOt04=; b=2TXqELg/fFj1s50t8PUXDuOJUe
	4/MHAeDrfZd2BGOyci6JDc3SxIsO57q7tUGhNpohCoLsSj8HZ11J91bsNpojGcyv0Z8EOrt6xNov2
	hozwIke4c2w5NnR2+3NnnQPA4JKE5Phd19oADjU3wgeL2uJfRhCj8mtVyjm/K5mJ1V4VzGszRZ9iR
	jyhXAlDpEKOQGePv+4kSDQ3XPFgv7489935CPrODWmX5GZ6T+OI703o9Y21j7ZNFkg/Ql9c23OEoD
	k3oxv3GJ3d0hwxfzIbiPHp/8ErfLVVnOUs4KQmEKS5Ah5B8FUIVwR8OKckCBOaDc1wt4PUNLJ8/5x
	O44l8v/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwcb-00000005e0E-0BTy;
	Thu, 06 Feb 2025 07:48:25 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEj-00000005YLd-0pGR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f9d5f8a4b9so810605a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826624; x=1739431424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+uvKlLnv4557Icjif9h7ezpBJYOQndwpRbHYJUOt04=;
        b=murxL00NC2opG11rgDM7LVAQkMvXHX/P5zusStgbaObaHlfAH7fd3wTJQSflcmfSE7
         nKpXo0vBBKXfDcM4DS7ijd51B78T2hX4n5NlUpKBzrwu6+xHYEGI+Kd2KdBBreTcY21A
         7MkQhrJ/TuVYX+STCaWbkPNC40znU0XgnFYJkUDwyLOn/GbRjLb75uwzFb1VJzUwJnid
         bJPKbKLa8XFYNZpruF9E2nXHtN+8l4UclaQUIJyXycP/Hy30hP5y/rCCBrJx93M8ckNo
         18plBj/XA7fMhHJ5RVU+JfCXhTueEZobj+V+iYi+nHrlDua3tFqwvZbmC3fciE3j3X0D
         MYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826624; x=1739431424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+uvKlLnv4557Icjif9h7ezpBJYOQndwpRbHYJUOt04=;
        b=ahprOdLFu/u60dXv91CTFBDRtIAoWbXbPt2FPp0yKR2svNkiOOakUqTsqB0yBWOBch
         vIDAKwCTrfd7jV+pv9AiiJ2t4dMNa62yzB/F15fMYKxl2YA1Z9MVt56qYsy7v2qw7R1L
         4mDbx8ckhgEx0YcjgZKUnDTo+5R/8Pav2GKJpCnk5KKifUtPzVQDASu7/FKMAGbGnh/T
         3oWGlvsnwT3C4tD7vT7F1gp0CRBvpMtWIR892lnaP0NTrdmRnyq+BGZ5dabPPvc3d7tr
         lw+qFy7haDTSV6mas0D97LwX2FQiPYOzZVUaZeFAjp6fkWEEc5ABzAdPcziRHy96tVdB
         MQDA==
X-Forwarded-Encrypted: i=1; AJvYcCVExpz8k79L46jlB195EhqCSizSh7DjroOm3AGI1pJnmaefVQK+cywJQ1giW3Rq/gxfcbHF5V4RWqcmP78khUDe@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3H+SVKQ8lg7YFpxbFUDm5PcfmrjNzC3ep9K5aN2E063f46Drs
	J3KJZ28wt8j+6bmxwWyLb3w+xV3cn1FbtG87FJhdBpLy62HM8/QCkHLsJO6bexU=
X-Gm-Gg: ASbGncvNM4OHJy25ao7+p1OjgJA4QMasXndYDT8U9V6VGy/HgKtCVXgVPyA9I6/and1
	KwAsBdSHelb9luLmEuwG9fm/HbYB6yPWGnTMoyf6E0kDvdGmQA2pMAIoOpAAUv6XO+CC5I0lONl
	C6pxa99ShGzTAecH5r7ec0MUcOg/L16whKnO5LSxysjB+USdhyf67Kdfo6D6YRaGN82Mp02MXis
	zgsOmTYUHUYMAp8qh2VxEizyalFO45KrT3wT4JuKJC3yQC/HXPH5PYb+bf/N2ffvZF2MRrU7hhL
	LJJyj/EKr5AL37PKTtiIZQxMrugl
X-Google-Smtp-Source: AGHT+IHVvUPUTgP+795doXG0yWQz3ag++6JLrXz9noZOmxRc/vzTQhLTg6Ot+5lngwjxV29P2MJVrQ==
X-Received: by 2002:a17:90a:dfc8:b0:2f5:63a:449c with SMTP id 98e67ed59e1d1-2f9e07fbf59mr9122811a91.28.1738826624682;
        Wed, 05 Feb 2025 23:23:44 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:44 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:23 -0800
Subject: [PATCH v4 18/21] RISC-V: perf: Add Qemu virt machine events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-18-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232345_348036_1ED4C500 
X-CRM114-Status: GOOD (  14.01  )
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
index 2f2bb0c84f9a..ef22b03552bc 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -9,4 +9,8 @@
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
+#define QEMU_VIRT_VENDOR_ID		0x000
+#define QEMU_VIRT_IMPL_ID		0x000
+#define QEMU_VIRT_ARCH_ID		0x000
+
 #endif
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index dd4627055e7a..b315f361ae79 100644
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
@@ -384,7 +385,42 @@ struct riscv_vendor_pmu_events {
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


