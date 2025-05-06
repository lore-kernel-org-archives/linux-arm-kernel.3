Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE008C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkqHrlk5rXmqQcmnUyYZSiZOvHTWZlNV/KJqAn/HjmE=; b=Mv1HeABHSh/Zgx4na0oUE8XTTu
	hgsg2aRccfMv5i+DdCVOdfnSQvjbB0U+QboG2V+knKsdHa6bdkGLyZnTp9rLonmE0OJ/rvJJncOW+
	cBv60raqzzj1r+ooJeUF6OuvpgQRD9R4tD7Hgb6jsBGgShnGL91AoJ7sc/lCxoAaYjwzUmaSVUEGm
	/sEscH+HyCUwjzJwc2yaw3xg8B+Rb5Pne/PEvz7jI881OkhCPB3av7Yj8Sk5DFDlhOUXy87fpomBH
	girVFRgndXQmLxdj2A8YmoZ1AsCN0EeNXZ/tI9vNLOsNRIBqXoHo50ll/gQFNI/4zB3xvQ/5YX5xd
	o4SZiY5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJVk-0000000CMiZ-0Zfv;
	Tue, 06 May 2025 14:43:08 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGhD-0000000BmSq-0Zui
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:42:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso3718797f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531766; x=1747136566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkqHrlk5rXmqQcmnUyYZSiZOvHTWZlNV/KJqAn/HjmE=;
        b=uc+dCkmQNKnpLPDoY6IpB/BSWeG8nmvaHk9oqKHF/AseAGcVEQN60g6loAkP3cuwkQ
         +5fdv3f8qA05YgUuJ1An6Xq+DIiYAyFTGNIhnmoYL0gcGVbsgYYNoT+aGu+VqDdAVkH2
         3u5B+feHgBc90Qdfa1xjBMNbNfAf8D8dSZHTkbcqUjnO6HpqJQcq41ImKmzVH8NL44Rq
         As6nTM6OrUy4S0epi5wX/qY7KGdY0vYwy6l3QBDqAgQz2QPy9SGqJLq5VuVv9YN57vg/
         DRH+aCdi3mSHuj5XBxkCYAqYApz26fprS1AOyojbSlVyxd+c4TWXD5Hmx30nJYpaXtdc
         74vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531766; x=1747136566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkqHrlk5rXmqQcmnUyYZSiZOvHTWZlNV/KJqAn/HjmE=;
        b=Dm6YxoO0AK3KsFdWh6gZHDIVvFkKuAC/9WCioVvlgIq8Nhb7yO08bGF+KzrS8bXBvK
         EdJkfms8fObJCGNXs1FHSishdzKnVHEQ+xWJbP2T7jOuxxVUNVnHJXrBVHDzZX9KAacj
         0C6KW98tdG8wAregDtDOXgD34lKbaa18LwCuQZbpMqgS8AINr1Ytjeja4reEsf8croHt
         T4ojGLvTa2RMt3mDNFfLn/iLyv9X0imPqMAO4XASvWHlhUtNFzeKIRy3jVPHubyTINJ+
         6w5ox0qoFOrVVlcAK+7VAKLX8cotwJ2jdWPICDMLxXCFD35SPbeXMZSrpvFHWyfqnBKu
         cKEA==
X-Gm-Message-State: AOJu0YxDOKDDToY8+FTrLPHTqG8YG1Dv9vKOTXMipjeAv9/8XncEWy0g
	qfD4R4cwpskXckAgWLld+Kbkwyaj5ogZtkh2z5ie2VAMCA7nQIvT7+o17VMxBNc=
X-Gm-Gg: ASbGncvI2LWivI1bt0bXJoK9DKkX5jRlJu0JScjhA6TgqQ1PvSxj8dPNe8DhufjzD50
	1K+WC3HeTJCTmJvfEA7nn2UI7rV8fKnTnlQWO3lPpFNkDPDJ0DEcxEppm6Fg4qjVdunsta7gX9v
	LEJvr7GzPoQln7VtiBm9OU0pe3VBqG3LY1onJ6fzeAfaHtOoZ1+4rBCqkgWsMraxKF188tz7XQO
	JUkJ0leoXYlRSOvLgLfnQ5/xDawRWRU/N426Nm8Ibbei1K0jAchBRe2ZmQVFecKWci/ladYPWHo
	IaW0MXFxkOn9xdH7SxVk6TwP0RKUregIgOT3V+JiWgt+I/A=
X-Google-Smtp-Source: AGHT+IGUvZmO1ysjfj2110bUiJ8J7jVXWaXvMQnsa2Hz+uClfkGhq0fClzub1N37FV3ldFVqBc7yhA==
X-Received: by 2002:a05:6000:2287:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-3a0ac0ec06fmr2094137f8f.32.1746531765765;
        Tue, 06 May 2025 04:42:45 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:45 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:42 +0100
Subject: [PATCH 10/10] perf docs: arm-spe: Document new SPE filtering
 features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-10-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_044247_208328_BDAF62C3 
X-CRM114-Status: GOOD (  22.29  )
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

FEAT_SPE_EFT and FEAT_SPE_FDS etc have new user facing format attributes
so document them. Also document existing 'event_filter' bits that were
missing from the doc and the fact that latency values are stored in the
weight field.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-arm-spe.txt | 86 ++++++++++++++++++++++++++++---
 1 file changed, 78 insertions(+), 8 deletions(-)

diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Documentation/perf-arm-spe.txt
index 37afade4f1b2..a90da9f36d93 100644
--- a/tools/perf/Documentation/perf-arm-spe.txt
+++ b/tools/perf/Documentation/perf-arm-spe.txt
@@ -141,27 +141,60 @@ Config parameters
 These are placed between the // in the event and comma separated. For example '-e
 arm_spe/load_filter=1,min_latency=10/'
 
-  branch_filter=1     - collect branches only (PMSFCR.B)
-  event_filter=<mask> - filter on specific events (PMSEVFR) - see bitfield description below
+  event_filter=<mask> - logical AND filter on specific events (PMSEVFR) - see bitfield description below
+  inv_event_filter=<mask> - logical AND to filter out specific events (PMSNEVFR, FEAT_SPEv1p2) - see bitfield description below
   jitter=1            - use jitter to avoid resonance when sampling (PMSIRR.RND)
-  load_filter=1       - collect loads only (PMSFCR.LD)
   min_latency=<n>     - collect only samples with this latency or higher* (PMSLATFR)
   pa_enable=1         - collect physical address (as well as VA) of loads/stores (PMSCR.PA) - requires privilege
   pct_enable=1        - collect physical timestamp instead of virtual timestamp (PMSCR.PCT) - requires privilege
-  store_filter=1      - collect stores only (PMSFCR.ST)
   ts_enable=1         - enable timestamping with value of generic timer (PMSCR.TS)
   discard=1           - enable SPE PMU events but don't collect sample data - see 'Discard mode' (PMBLIMITR.FM = DISCARD)
+  data_src_filter=<mask> - mask to filter from 0-63 possible data sources (PMSDSFR, FEAT_SPE_FDS) - See 'Data source filtering'
 
 +++*+++ Latency is the total latency from the point at which sampling started on that instruction, rather
 than only the execution latency.
 
-Only some events can be filtered on; these include:
+Only some events can be filtered on using 'event_filter' bits. The overall
+filter is the logical AND of these bits, for example if bits 3 and 5 are set
+only samples that have both L1D cache refill and TLB walk are recorded. When
+FEAT_SPEv1p2 is implemented 'inv_event_filter' can also be used to filter on
+events that do _not_ have the target bit set. Filter bits for both event_filter
+and inv_event_filter are:
 
-  bit 1     - instruction retired (i.e. omit speculative instructions)
+  bit 1     - Instruction retired (i.e. omit speculative instructions)
+  bit 2     - L1D access (FEAT_SPEv1p4)
   bit 3     - L1D refill
+  bit 4     - TLB access (FEAT_SPEv1p4)
   bit 5     - TLB refill
-  bit 7     - mispredict
-  bit 11    - misaligned access
+  bit 6     - Not taken event (FEAT_SPEv1p2)
+  bit 7     - Mispredict
+  bit 8     - Last level cache access (FEAT_SPEv1p4)
+  bit 9     - Last level cache miss (FEAT_SPEv1p4)
+  bit 10    - Remote access (FEAT_SPEv1p4)
+  bit 11    - Misaligned access (FEAT_SPEv1p1)
+  bit 12-15 - IMPLEMENTATION DEFINED events (when implemented)
+  bit 16    - FEAT_TME transactions
+  bit 17    - Partial or empty SME or SVE predicate (FEAT_SPEv1p1)
+  bit 18    - Empty SME or SVE predicate (FEAT_SPEv1p1)
+  bit 19    - L2D access (FEAT_SPEv1p4)
+  bit 20    - L2D miss (FEAT_SPEv1p4)
+  bit 21    - Cache data modified (FEAT_SPEv1p4)
+  bit 22    - Recently fetched (FEAT_SPEv1p4)
+  bit 23    - Data snooped (FEAT_SPEv1p4)
+  bit 24    - Streaming SVE mode event when FEAT_SPE_SME is implemented, or
+              IMPLEMENTATION DEFINED event 24 (when implemented)
+  bit 25    - SMCU or external coprocessor operation event when FEAT_SPE_SME is implemented, or
+              IMPLEMENTATION DEFINED event 25 (when implemented)
+  bit 26-31 - IMPLEMENTATION DEFINED events (only versions less than FEAT_SPEv1p4)
+  bit 48-63 - IMPLEMENTATION DEFINED events (when implemented)
+
+For IMPLEMENTATION DEFINED bits, refer to the CPU TRM if these bits are
+implemented.
+
+The driver will reject events if requested filter bits require unimplemented SPE
+versions, but will not reject filter bits for unimplemented IMPDEF bits or when
+their related feature is not present (e.g. SME). For example, if FEAT_SPEv1p2 is
+not implemented, filtering on "Not taken event" (bit 6) will be rejected.
 
 So to sample just retired instructions:
 
@@ -171,6 +204,29 @@ or just mispredicted branches:
 
   perf record -e arm_spe/event_filter=0x80/ -- ./mybench
 
+When set, the following filters can be used to select samples that match any of
+the operation types (OR filtering). If only one is set then only samples of that
+type are collected:
+
+  branch_filter=1     - Collect branches (PMSFCR.B)
+  load_filter=1       - Collect loads (PMSFCR.LD)
+  store_filter=1      - Collect stores (PMSFCR.ST)
+
+When extended filtering is supported (FEAT_SPE_EFT), operation type filters can
+be changed to AND and also new filters are added. For example samples could be
+selected if they are store AND SIMD by setting
+'store_filter=1,simd_filter=1,store_filter_mask=1,simd_filter_mask=1'. The new
+filters are as follows:
+
+  branch_filter_mask=1  - Change branch filter behavior from OR to AND (PMSFCR.Bm)
+  load_filter_mask=1    - Change load filter behavior from OR to AND (PMSFCR.LDm)
+  store_filter_mask=1   - Change store filter behavior from OR to AND (PMSFCR.STm)
+  simd_filter_mask=1    - Change SIMD filter behavior from OR to AND (PMSFCR.SIMDm)
+  float_filter_mask=1   - Change floating point filter behavior from OR to AND (PMSFCR.FPm)
+
+  simd_filter=1         - Collect SIMD loads, stores and operations (PMSFCR.SIMD)
+  float_filter=1        - Collect floating point loads, stores and operations (PMSFCR.FP)
+
 Viewing the data
 ~~~~~~~~~~~~~~~~~
 
@@ -204,6 +260,10 @@ Memory access details are also stored on the samples and this can be viewed with
 
   perf report --mem-mode
 
+The latency value from the SPE sample is stored in the 'weight' field of the
+Perf samples and can be displayed in Perf script and report outputs by enabling
+its display from the command line.
+
 Common errors
 ~~~~~~~~~~~~~
 
@@ -247,6 +307,16 @@ to minimize output. Then run perf stat:
   perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
   perf stat -e SAMPLE_FEED_LD
 
+Data source filtering
+~~~~~~~~~~~~~~~~~~~~~
+
+When FEAT_SPE_FDS is present, 'data_src_filter' can be used as a mask to filter
+a subset (0 - 63) of possible data source IDs. The full range of data sources is
+0 - 65 535 although these are unlikely to be used in practice. Data sources are
+IMPDEF so refer to the TRM for the mappings. Each bit N of the filter maps to
+data source N. The filter is an OR of all the bits, so for example setting bits
+0 and 3 filters on packets from data sources 0 OR 3.
+
 SEE ALSO
 --------
 

-- 
2.34.1


