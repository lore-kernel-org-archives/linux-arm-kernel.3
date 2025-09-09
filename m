Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C35FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqCyjP3z7F10tcRyS6ryGhJEoWL9Np/LwW598YFvZGY=; b=rIgFPv7gUIuCbrYi2iEZ8QHPAu
	iZb1Z7lsam1RKdLhqVmJCED+MISvn/ByRtyN85NBROLc3HpmWnfB0W9R3uen35FUBmBNc5JQxezB2
	Eh4Dp7vYIWX4WzdvAfqThg+noN/WaIOr08WIjvjIZf/+2xEFsEkRFldanlFhRjjeW+H91EG39daQ+
	MQhWnVZ1jH7NYyAd3Fp0VfaleOjdhX8P0EENrC/3uZVc+kAiSVsBi2Rh4U4AGDHcjYWwRSImlsPAQ
	p4JXHl0brrj8CGoBkLrq4kMJgbq9f11whnBKEH3TJzW8kf0j73OownMY83hNU/99SDQFjVnccSMc0
	YRRrABrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0UR-00000008Ck8-2RNy;
	Tue, 09 Sep 2025 15:42:40 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvLA-00000006Ho0-0E0h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:45 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so35373295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412762; x=1758017562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqCyjP3z7F10tcRyS6ryGhJEoWL9Np/LwW598YFvZGY=;
        b=EV7Jkv/udVM5VSLlwYgAgYnGOLU5dtZwIPLHlRQG7f5lt7fbQgCHUcbVsir3mzO28o
         6jpBHqU+jv46N9fT/YFqN1kezVIqZPh3771xOK6r4uoq98HMZEYjA8MDOqw/Th8fjbmo
         FYiY3ks91Ca9+II2AavmuvzBHulshYwUgcD3+jTJeEE0OLjR9gyDq4GCVSUkKcfo08fB
         bSApJPtyYZg52hqhjbxMms31P9SeytRpFjFYoM1WqsWwGFQ3sDt2QERwNT7X3DyciAl8
         H9jDRjtJru8bDHEPTGKQCC18qBh1JlYMex2L4XjcQ8udu76hRAIvRmuDkZfv4ty0RDcW
         DFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412762; x=1758017562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqCyjP3z7F10tcRyS6ryGhJEoWL9Np/LwW598YFvZGY=;
        b=huKVtmd5sehtHIaNG87ZhqWldiBnWv+iAGfr0ziGJsO1qBBttkkDGaMNVLL6SP/umr
         VwFCMC+hble+fMwLF4lWXd+MJGEMvSCD/h65KsDkadM0RWBX68zWZpcVIJF9J0R6uoLg
         Bo3BjMPhCqzbJm1Bx9b94Q2H1kegO1EcqqNrra85k1aKKcrLdrrBOPqRQXs7fan1/W+U
         wEkhA0HdXXqSrMxkjDj3d5fnDQMKXwFnDZV6V20/if0QPb1iu3TVthzLz31y9dnf7cXr
         WyDnhblAad4CmdBEN9sab9/RRa69QqHp9z2GsFxAjxr6dAfyhDTj/bBvS6xUemx/0P5Q
         HQww==
X-Forwarded-Encrypted: i=1; AJvYcCUCVviOB1zkXUgLTa8p4/m1qTCTh5nMTn3zu31zMbUzOjJHPHjZ8vdxXh1dhbnNX1zhTKGLDv5peJSl2aQ1dePZ@lists.infradead.org
X-Gm-Message-State: AOJu0YySsnDTD9gok17hOEVwsFGbKc2QG0qa8d0z5AI6PxHdtynN/StB
	vHjfQAJskmiYmpop5R4q7apOslbAH4neYH0X8MSmiw1vAA0mSZcqPOD6
X-Gm-Gg: ASbGncuhJf+zIFDsRtmyXUnHKm1TGCw9bGg9sIyI09uX9MMTxT39yKfZHje+6RpfXS7
	3UUezSW43yjS+nAWEwh0UHAQ/zSHsmYnrRYJjmY4qdAEepnI4UpjsT26P9XCBwJKfsUg8KJwabR
	HjAXed3Buz84bqpDNLSv23TiM07YS6sUjcluLT73dI/RaKp/3ti5ybTXnpcSKkeSFnGTJaQA/vy
	r5kmOfOZVrz4HVDMw9GR06pdndIXwgDEHxi5iVLP0Y+bza5rFCM2F9vCm6bBv8DvVuv3hEo7eBU
	nUGIXgPI6pTo3opNqBtHgA8hmy5MNTzq1JbziMdR55s1rq4VRNNELtf7oMV9eJxi72pMNDzoamp
	VQOP6ktLdiqgbCFUAEltrwVE3pjFFOH9BLZ3JgFHQSWYOh2qD25yFzI4ktjyfMl3d+g7Nluvwky
	XPTxUSUZimt7+J5t0=
X-Google-Smtp-Source: AGHT+IHSNt7ZxSHFDDuz04qqP6sftq2n73jb1Nndw6OMb1HkK/pmOtls8a389Ut8g5o8jrLiiEoQmw==
X-Received: by 2002:a05:600c:c297:b0:45c:b5c3:ea37 with SMTP id 5b1f17b1804b1-45dd5b68719mr88577915e9.11.1757412762208;
        Tue, 09 Sep 2025 03:12:42 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223f3e2sm2041352f8f.44.2025.09.09.03.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:41 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:21 +0200
Subject: [PATCH v6 14/20] Documentation: perf: stm32: add ddrperfm support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-14-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031244_188105_55AD2F34 
X-CRM114-Status: GOOD (  17.51  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

The DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.

This documentation introduces the DDRPERFM, the stm32-ddr-pmu driver
supporting it and how to use it with the perf tool.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 Documentation/admin-guide/perf/index.rst         |  1 +
 Documentation/admin-guide/perf/stm32-ddr-pmu.rst | 86 ++++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index 072b510385c4..33aedc4ee5c3 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -29,3 +29,4 @@ Performance monitor support
    cxl
    ampere_cspmu
    mrvl-pem-pmu
+   stm32-ddr-pmu
diff --git a/Documentation/admin-guide/perf/stm32-ddr-pmu.rst b/Documentation/admin-guide/perf/stm32-ddr-pmu.rst
new file mode 100644
index 000000000000..5b02bf44dd7a
--- /dev/null
+++ b/Documentation/admin-guide/perf/stm32-ddr-pmu.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================================
+STM32 DDR Performance Monitor (DDRPERFM)
+========================================
+
+The DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
+The DDR controller provides events to DDRPERFM, once selected they are counted in the DDRPERFM
+peripheral.
+
+In MP1 family, the DDRPERFM is able to count 4 different events at the same time.
+However, the 4 events must belong to the same set.
+One hardware counter is dedicated to the time counter, `time_cnt`.
+
+In MP2 family, the DDRPERFM is able to select between 44 different DDR events.
+As for MP1, there is a dedicated hardware counter for the time.
+It is incremented every 4 DDR clock cycles.
+All the other counters can be freely allocated to count any other DDR event.
+
+The stm32-ddr-pmu driver relies on the perf PMU framework to expose the counters via sysfs:
+
+On MP1:
+
+    .. code-block:: bash
+
+        $ ls /sys/bus/event_source/devices/stm32_ddr_pmu/events/
+        cactive_ddrc                 perf_lpr_req_with_no_credit  perf_op_is_wr
+        ctl_idle                     perf_lpr_xact_when_critical  perf_selfresh_mode
+        dfi_lp_req                   perf_op_is_activate          perf_wr_xact_when_critical
+        dfi_lp_req_cpy               perf_op_is_enter_powerdown   time_cnt
+        perf_hpr_req_with_no_credit  perf_op_is_rd
+        perf_hpr_xact_when_critical  perf_op_is_refresh
+
+On MP2:
+
+    .. code-block:: bash
+
+        $ ls /sys/bus/event_source/devices/stm32_ddr_pmu/events/
+        dfi_is_act       perf_hpr_req_with_nocredit   perf_op_is_spec_ref
+        dfi_is_mpc       perf_hpr_xact_when_critical  perf_op_is_wr
+        dfi_is_mrr       perf_lpr_req_with_nocredit   perf_op_is_zqcal
+        dfi_is_mrw       perf_lpr_xact_when_critical  perf_rank
+        dfi_is_mwr       perf_op_is_act               perf_raw_hazard
+        dfi_is_mwra      perf_op_is_crit_ref          perf_rdwr_transitions
+        dfi_is_preab     perf_op_is_enter_powdn       perf_read_bypass
+        dfi_is_prepb     perf_op_is_enter_selfref     perf_war_hazard
+        dfi_is_rd        perf_op_is_mwr               perf_waw_hazard
+        dfi_is_rda       perf_op_is_pre               perf_window_limit_reached_rd
+        dfi_is_refab     perf_op_is_pre_for_others    perf_window_limit_reached_wr
+        dfi_is_refpb     perf_op_is_pre_for_rdwr      perf_wr_xact_when_critical
+        dfi_is_wr        perf_op_is_rd                time_cnt
+        dfi_is_wra       perf_op_is_rd_activate
+        perf_act_bypass  perf_op_is_ref
+
+
+The perf PMU framework is usually invoked via the 'perf stat' tool.
+
+
+Example:
+
+    .. code-block:: bash
+
+        $ perf stat --timeout 60000 -e stm32_ddr_pmu/dfi_is_act/,\
+        > stm32_ddr_pmu/dfi_is_rd/,\
+        > stm32_ddr_pmu/dfi_is_wr/,\
+        > stm32_ddr_pmu/dfi_is_refab/,\
+        > stm32_ddr_pmu/dfi_is_mrw/,\
+        > stm32_ddr_pmu/dfi_is_rda/,\
+        > stm32_ddr_pmu/dfi_is_wra/,\
+        > stm32_ddr_pmu/dfi_is_mrr/,\
+        > stm32_ddr_pmu/time_cnt/ \
+        > -a sleep 5
+
+         Performance counter stats for 'system wide':
+
+                    481025      stm32_ddr_pmu/dfi_is_act/
+                    732166      stm32_ddr_pmu/dfi_is_rd/
+                    144926      stm32_ddr_pmu/dfi_is_wr/
+                    644154      stm32_ddr_pmu/dfi_is_refab/
+                         0      stm32_ddr_pmu/dfi_is_mrw/
+                         0      stm32_ddr_pmu/dfi_is_rda/
+                         0      stm32_ddr_pmu/dfi_is_wra/
+                         0      stm32_ddr_pmu/dfi_is_mrr/
+                 752347686      stm32_ddr_pmu/time_cnt/
+
+               5.014910750 seconds time elapsed

-- 
2.43.0


