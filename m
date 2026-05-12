Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80058CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkhmEf7l/p3H+evY3e6sZCpcHnKb11tYhtK4qTF0OHU=; b=v4N13bol0ImLn84QYrNi9NFAiq
	uoFBpE3K0naPXP9mUfLOdev4B9zAG4+nrQbG7eWtU9M1wO0cJZlRKcFG2UQ7Qo66oy0fYdsNNt4yc
	g204KE3L++8jhqOvkFqAS3K684TFXbKdNDmkkTCuPsqAapKn8U7ugchqOzyNiGtJ2FyyCMsKQyx5X
	0TTUmanLr69Ogq233d3KNs8swOruFivzaLYWrTq3dAv5c8F9XZhZ/U8OwqYqsED9N1Wd5I5w0BUnN
	8lENfIXKI/6xyXaWRb0djcr8NxuV58AvBO8X2ZOjZOIuuK3pKGBLWjQv/HiAOg7zeSRSOMbf+SGod
	yYE1SJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfsK-0000000FgAz-03Mx;
	Tue, 12 May 2026 05:41:48 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfsH-0000000Fg9v-3IET
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 05:41:46 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2f5943ca81aso6184521eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778564504; x=1779169304; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vkhmEf7l/p3H+evY3e6sZCpcHnKb11tYhtK4qTF0OHU=;
        b=Rb2hQKqPXEyKoWugPN/c70Rmrsr0uj/UBdC03i7mZ3JQ/NQ5t5ma+ZhR2j68fNSg8Y
         /SFLLEUlYOmCxHjX4IdY+lAckGhnHgg5caJPJ/ijHRCFB74r6CFCbUbxzpfzADMhTJf1
         a3rMm0rIA/xxpIL3LWmlSlsX/xdRtSc2pyXICMm+l4/prG7cRacWx1v1PyIKGLU1fOVG
         FhvtnYcNRiOe/5X8us7RTQQ+fNxG3ur2cN2sg6VuMn7K2SdMVheNpQD+R58dpNpOwwUv
         i6HT9CDMUO+rAFOruj9MPmMExZGuQeUW3IDN5GwdCnX0A1HUcB2fNa4njM0KUoXQKbZX
         zGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778564504; x=1779169304;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkhmEf7l/p3H+evY3e6sZCpcHnKb11tYhtK4qTF0OHU=;
        b=p5lIQsnDNNMiNOPMMGNXrxKCYxsz4oJGXnv8RZTFfv6+up3kN/aEmDuM3kvP+nII9w
         f42whryd3zfrLILFzFkGU7kdhPnI94Nb6jcsftsWiTbQ5X29cdtLM88WOJRqkNYppL2R
         g/N9D71znAm18PesgDXBWqdQo0okBQZkn2NZJehVNu6hwBjWr/3qHEagIs5MC524+38I
         hOPWgSm0Nvrp0M7DvU6lPYX5GOVBqtqWPH717NVsar/UpqQ7FOxjpj3V3FF2S2qjRhsp
         ce3PKxfhfB0dUEWnlZdY7RnwrSKvZ2LQ+8GsJaP3fVJllehu/hSEwBZntokbxUvbmROY
         IVUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QKyG8wChZLyLXYom98Xuxbe1MRYLSMmbjFC0Ka1qwiEK3K0hP5Jslgf22y1NSpS1qTNBHaVMNMIDDUr2p0q8V@lists.infradead.org
X-Gm-Message-State: AOJu0Ywld1tIS0WA7EP/h1FA4eIoNmLgxsfIAbm7I9g0u5kx2Gd/wIV1
	dnQ26i2mr29fL0p1G5Jo31YVawTckomf2xkWZ9QpXf5KiqUe2ncTI1FTYzu1OWVpGFjyopjlJ9n
	0K9bJyAPiRw==
X-Received: from dlbbt1.prod.google.com ([2002:a05:7022:981:b0:12d:c585:f600])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ec07:b0:130:9b78:b17b
 with SMTP id a92af1059eb24-132a83ed506mr6504466c88.38.1778564503592; Mon, 11
 May 2026 22:41:43 -0700 (PDT)
Date: Mon, 11 May 2026 22:41:40 -0700
In-Reply-To: <20260507170622.611933-1-irogers@google.com>
Mime-Version: 1.0
References: <20260507170622.611933-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512054140.3427725-1-irogers@google.com>
Subject: [PATCH v2] perf record: Refactor ARM64 leaf caller setup out of arch
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, james.clark@linaro.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alexander.shishkin@linux.intel.com, 
	dapeng1.mi@linux.intel.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mark.rutland@arm.com, mike.leach@arm.com, mingo@redhat.com, 
	peterz@infradead.org, shimin.guo@skydio.com, will@kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_224145_832120_30BE2529 
X-CRM114-Status: GOOD (  16.28  )
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

Code in tools/perf/arch causes portability issues/opaqueness and LTO
issues due to the use of weak symbols. Move the adding of LR to the
sample_user_regs into arm64-frame-pointer-unwind-support.c conditional
on EM_HOST == EM_AARCH64 (false on all non-ARM64 builds). This also
better encapsulates the use of the sampled registers by
get_leaf_frame_caller_aarch64 and the set up by the new
add_leaf_frame_caller_opts_aarch64, exposing opportunities for
possibly sampling PC and SP to help the unwinder.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/util/Build                     |  1 -
 tools/perf/arch/arm64/util/machine.c                 | 12 ------------
 tools/perf/builtin-record.c                          | 11 +++++------
 tools/perf/util/arm64-frame-pointer-unwind-support.c |  6 ++++++
 tools/perf/util/arm64-frame-pointer-unwind-support.h |  2 ++
 tools/perf/util/callchain.h                          |  2 --
 6 files changed, 13 insertions(+), 21 deletions(-)
 delete mode 100644 tools/perf/arch/arm64/util/machine.c

diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/util/Build
index 4e06a08d281a..638aa6948ab5 100644
--- a/tools/perf/arch/arm64/util/Build
+++ b/tools/perf/arch/arm64/util/Build
@@ -5,7 +5,6 @@ perf-util-y += ../../arm/util/pmu.o
 perf-util-y += arm-spe.o
 perf-util-y += header.o
 perf-util-y += hisi-ptt.o
-perf-util-y += machine.o
 perf-util-y += mem-events.o
 perf-util-y += pmu.o
 perf-util-y += tsc.o
diff --git a/tools/perf/arch/arm64/util/machine.c b/tools/perf/arch/arm64/util/machine.c
deleted file mode 100644
index 80fb13c958d9..000000000000
--- a/tools/perf/arch/arm64/util/machine.c
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include "callchain.h" // prototype of arch__add_leaf_frame_record_opts
-#include "perf_regs.h"
-#include "record.h"
-
-#define SMPL_REG_MASK(b) (1ULL << (b))
-
-void arch__add_leaf_frame_record_opts(struct record_opts *opts)
-{
-	opts->sample_user_regs |= SMPL_REG_MASK(PERF_REG_ARM64_LR);
-}
diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 4a5eba498c02..272bba7f4b9e 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -14,6 +14,7 @@
 #include "util/parse-events.h"
 #include "util/config.h"
 
+#include "util/arm64-frame-pointer-unwind-support.h"
 #include "util/callchain.h"
 #include "util/cgroup.h"
 #include "util/header.h"
@@ -3230,10 +3231,6 @@ static int record__parse_off_cpu_thresh(const struct option *opt,
 	return 0;
 }
 
-void __weak arch__add_leaf_frame_record_opts(struct record_opts *opts __maybe_unused)
-{
-}
-
 static int parse_control_option(const struct option *opt,
 				const char *str,
 				int unset __maybe_unused)
@@ -4319,8 +4316,10 @@ int cmd_record(int argc, const char **argv)
 
 	evlist__warn_user_requested_cpus(rec->evlist, rec->opts.target.cpu_list);
 
-	if (callchain_param.enabled && callchain_param.record_mode == CALLCHAIN_FP)
-		arch__add_leaf_frame_record_opts(&rec->opts);
+	if (callchain_param.enabled && callchain_param.record_mode == CALLCHAIN_FP) {
+		if (EM_HOST == EM_AARCH64)
+			add_leaf_frame_caller_opts_aarch64(&rec->opts);
+	}
 
 	err = -ENOMEM;
 	if (evlist__create_maps(rec->evlist, &rec->opts.target) < 0) {
diff --git a/tools/perf/util/arm64-frame-pointer-unwind-support.c b/tools/perf/util/arm64-frame-pointer-unwind-support.c
index 858ce2b01812..3af8c7a466e0 100644
--- a/tools/perf/util/arm64-frame-pointer-unwind-support.c
+++ b/tools/perf/util/arm64-frame-pointer-unwind-support.c
@@ -2,6 +2,7 @@
 #include "arm64-frame-pointer-unwind-support.h"
 #include "callchain.h"
 #include "event.h"
+#include "record.h"
 #include "unwind.h"
 #include <string.h>
 
@@ -16,6 +17,11 @@ struct entries {
 
 #define SMPL_REG_MASK(b) (1ULL << (b))
 
+void add_leaf_frame_caller_opts_aarch64(struct record_opts *opts)
+{
+	opts->sample_user_regs |= SMPL_REG_MASK(PERF_REG_ARM64_LR);
+}
+
 static bool get_leaf_frame_caller_enabled(struct perf_sample *sample)
 {
 	struct regs_dump *regs;
diff --git a/tools/perf/util/arm64-frame-pointer-unwind-support.h b/tools/perf/util/arm64-frame-pointer-unwind-support.h
index 42d3a45490f5..ba35b295bfcd 100644
--- a/tools/perf/util/arm64-frame-pointer-unwind-support.h
+++ b/tools/perf/util/arm64-frame-pointer-unwind-support.h
@@ -5,8 +5,10 @@
 #include <linux/types.h>
 
 struct perf_sample;
+struct record_opts;
 struct thread;
 
+void add_leaf_frame_caller_opts_aarch64(struct record_opts *opts);
 u64 get_leaf_frame_caller_aarch64(struct perf_sample *sample, struct thread *thread, int user_idx);
 
 #endif /* __PERF_ARM_FRAME_POINTER_UNWIND_SUPPORT_H */
diff --git a/tools/perf/util/callchain.h b/tools/perf/util/callchain.h
index 06d463ccc7a0..b7702d65ad60 100644
--- a/tools/perf/util/callchain.h
+++ b/tools/perf/util/callchain.h
@@ -277,8 +277,6 @@ static inline int arch_skip_callchain_idx(struct thread *thread __maybe_unused,
 }
 #endif
 
-void arch__add_leaf_frame_record_opts(struct record_opts *opts);
-
 char *callchain_list__sym_name(struct callchain_list *cl,
 			       char *bf, size_t bfsize, bool show_dso);
 char *callchain_node__scnprintf_value(struct callchain_node *node,
-- 
2.54.0.563.g4f69b47b94-goog


