Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAD8F357B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lB3BAGQE2BMrrHbc0CnVsZb8STXY1ehvHUhdt6oNmg=; b=zr5E4O3E+B0tL9IIHx7KsQCfLt
	7KXsCufaqS5V3hTQOZnwKDKHCQWvJIMyVmv6K2o9jYoztkFpLzT8Wh0Qzp+cDh2DOmX06Cs4l1DOZ
	lYSNprgkCnrl/1cK10GqtOBGf7g7kpk3yilZAAmQ8eb19dZTX72HkyJ3iWx+elQvxnESkt2gbDKSj
	W9rmZO1+K0rICM7TGxpwvEoFPOtdfO4temBZ50T5d9+QsAOKWevaSMt5/YkD4mqaFmyq0jm8437YR
	BF7iwEIVLiLbzRKKgB0o7nWNCVmiYUhuGqcF7a8kdQK8LYlwp2rlJmFQji1gXC/u6A6JjWlzaAZO9
	pbh6LFnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutQV-00000002D2A-1Fhj;
	Tue, 24 Feb 2026 14:30:16 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutQI-00000002Csf-43nr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:30:04 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12737f276a2so9228628c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771943402; x=1772548202; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/lB3BAGQE2BMrrHbc0CnVsZb8STXY1ehvHUhdt6oNmg=;
        b=GVekIREbE3789IT5hECPBlRQQ0t5WdDx1/TE0+wOXgUIrd+Ouk9nhLLCLpMfZSiGJK
         DvTpC+eewCYiVxxBQql3Ll9XIKfdYT+9N3sv4itsGxvDRrjac2UJDDQpFJS3Y+V9UFhz
         2AG9OdiRxOUPgLNLkEMpPN4WYQcjczXv97P71LXar/yhI33Yt6mctHhytHS/WGQwnyJ+
         Vx+AmhR5K8+BGbauPtdNYpr3jDSkuC+MzBeYvo3D4wpH8A15AwjfSUmNO7CFCRGXCi1s
         oKEJndB09o4HDEeasqLNuT89sZXw9iP8Hg+4xI/kUB27Fs9G/16lE4MuNyqVfOSUFKYE
         nLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943402; x=1772548202;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/lB3BAGQE2BMrrHbc0CnVsZb8STXY1ehvHUhdt6oNmg=;
        b=RS0hcBd2SGlGsioPbYFbQasFGiREoCbuBBO6Yzph8SOHPNkjC52WwtQDmmRfcKkA44
         V9FbtOiGEv61z0XcXinfo9husGMjR99CjE2pW7bZV5nTY+fgNz2SuxJ+0/+DJKx/om0l
         ih4JOky4hmqGg+B6Be6QPRKZAcGyWraZH5UtNeNkYMSUC2lOero3dU6AA5PN3IcaLs21
         9ni3prD7q+mSa1LTYmiTY6lrZserdv9BXPDWW4jZTduNtRaMF8hu5iDZ28FbN9jmnUXm
         MD7bp7gtUQQgmd4i1jQCLmL0XWGRkYbVknSMF67T2O2JlNDumJ92BZVt4iNIRPW6MDjm
         jfGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr8wVrk06SZYt3EImqVQ4f/dzEZjVk4H2q5ttyGFe9I0DUweOraMhB5Z9vvu+Z2RHmdnsYL/AFeSeCw0H73lhW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywubmk/ynUfgjZszDDX/oFh6Mb2c9bo7Qw8lcm+OCG0z4Y2tIKl
	GIhp4uorW+zbPTjQ8tr66xR+AfmAdF2CIImQD/0lfZgnqo4lMNZtcRTO+/AeT+CDXC/o6sFtnLk
	4c3oEXnSb+Q==
X-Received: from dlbsv6.prod.google.com ([2002:a05:7022:3a06:b0:127:177b:bd24])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:fa4:b0:124:9acd:328e
 with SMTP id a92af1059eb24-1276ad61b41mr4501553c88.27.1771943401387; Tue, 24
 Feb 2026 06:30:01 -0800 (PST)
Date: Tue, 24 Feb 2026 06:29:35 -0800
In-Reply-To: <20260224142938.26088-1-irogers@google.com>
Mime-Version: 1.0
References: <20260224142938.26088-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224142938.26088-6-irogers@google.com>
Subject: [RFC PATCH v1 5/7] perf unwind-libunwind: Move flush/finish access
 out of local
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dmitrii Dolgov <9erthalion6@gmail.com>, 
	Blake Jones <blakejones@google.com>, Tomas Glozar <tglozar@redhat.com>, 
	Yuzhuo Jing <yuzhuo@google.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Shimin Guo <shimin.guo@skydio.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Thomas Richter <tmricht@linux.ibm.com>, 
	libunwind-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_063003_047968_557F5A83 
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

Flush and finish access are relatively simple calls into libunwind,
move them out struct unwind_libunwind_ops. So that the correct version
can be called, add an e_machine variable to maps. This size regression
will go away when the unwind_libunwind_ops no longer need stashing in
the maps. To set the e_machine up pass it into unwind__prepare_access,
which no longer needs to determine the unwind operations based on a
map dso because of this. This also means the maps copying code can
call unwind__prepare_access once for the e_machine rather than once
per map.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../perf/util/libunwind-arch/libunwind-arch.c | 82 +++++++++++++++++++
 .../perf/util/libunwind-arch/libunwind-arch.h | 24 ++++++
 .../perf/util/libunwind-arch/libunwind-arm.c  | 19 +++++
 .../util/libunwind-arch/libunwind-arm64.c     | 20 +++++
 .../perf/util/libunwind-arch/libunwind-i386.c | 15 ++++
 .../util/libunwind-arch/libunwind-loongarch.c | 15 ++++
 .../perf/util/libunwind-arch/libunwind-mips.c | 15 ++++
 .../util/libunwind-arch/libunwind-ppc32.c     | 15 ++++
 .../util/libunwind-arch/libunwind-ppc64.c     | 15 ++++
 .../perf/util/libunwind-arch/libunwind-s390.c | 15 ++++
 .../util/libunwind-arch/libunwind-x86_64.c    | 15 ++++
 tools/perf/util/maps.c                        | 31 ++++---
 tools/perf/util/maps.h                        |  2 +
 tools/perf/util/thread.c                      | 29 +------
 tools/perf/util/unwind-libunwind-local.c      | 12 ---
 tools/perf/util/unwind-libunwind.c            | 61 +++++---------
 tools/perf/util/unwind.h                      |  8 +-
 17 files changed, 299 insertions(+), 94 deletions(-)

diff --git a/tools/perf/util/libunwind-arch/libunwind-arch.c b/tools/perf/util/libunwind-arch/libunwind-arch.c
index 5439bf90d161..9692e6c81492 100644
--- a/tools/perf/util/libunwind-arch/libunwind-arch.c
+++ b/tools/perf/util/libunwind-arch/libunwind-arch.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include <elf.h>
 #include <errno.h>
 
@@ -30,3 +31,84 @@ int get_perf_regnum_for_unw_regnum(unsigned int e_machine, int unw_regnum)
 		return -EINVAL;
 	}
 }
+
+
+void libunwind_arch__flush_access(struct maps *maps)
+{
+	unsigned int e_machine = maps__e_machine(maps);
+
+	switch (e_machine) {
+	case EM_NONE:
+		break;  // No libunwind info on the maps.
+	case EM_ARM:
+		__libunwind_arch__flush_access_arm(maps);
+		break;
+	case EM_AARCH64:
+		__libunwind_arch__flush_access_arm64(maps);
+		break;
+	case EM_LOONGARCH:
+		__libunwind_arch__flush_access_loongarch(maps);
+		break;
+	case EM_MIPS:
+		__libunwind_arch__flush_access_mips(maps);
+		break;
+	case EM_PPC:
+		__libunwind_arch__flush_access_ppc32(maps);
+		break;
+	case EM_PPC64:
+		__libunwind_arch__flush_access_ppc64(maps);
+		break;
+	case EM_S390:
+		__libunwind_arch__flush_access_s390(maps);
+		break;
+	case EM_386:
+		__libunwind_arch__flush_access_i386(maps);
+		break;
+	case EM_X86_64:
+		__libunwind_arch__flush_access_x86_64(maps);
+		break;
+	default:
+		pr_err("ELF MACHINE %x is not supported.\n", e_machine);
+		break;
+	}
+}
+
+void libunwind_arch__finish_access(struct maps *maps)
+{
+	unsigned int e_machine = maps__e_machine(maps);
+
+	switch (e_machine) {
+	case EM_NONE:
+		break;  // No libunwind info on the maps.
+	case EM_ARM:
+		__libunwind_arch__finish_access_arm(maps);
+		break;
+	case EM_AARCH64:
+		__libunwind_arch__finish_access_arm64(maps);
+		break;
+	case EM_LOONGARCH:
+		__libunwind_arch__finish_access_loongarch(maps);
+		break;
+	case EM_MIPS:
+		__libunwind_arch__finish_access_mips(maps);
+		break;
+	case EM_PPC:
+		__libunwind_arch__finish_access_ppc32(maps);
+		break;
+	case EM_PPC64:
+		__libunwind_arch__finish_access_ppc64(maps);
+		break;
+	case EM_S390:
+		__libunwind_arch__finish_access_s390(maps);
+		break;
+	case EM_386:
+		__libunwind_arch__finish_access_i386(maps);
+		break;
+	case EM_X86_64:
+		__libunwind_arch__finish_access_x86_64(maps);
+		break;
+	default:
+		pr_err("ELF MACHINE %x is not supported.\n", e_machine);
+		break;
+	}
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-arch.h b/tools/perf/util/libunwind-arch/libunwind-arch.h
index e1009c6cb965..c00277a5e914 100644
--- a/tools/perf/util/libunwind-arch/libunwind-arch.h
+++ b/tools/perf/util/libunwind-arch/libunwind-arch.h
@@ -2,6 +2,8 @@
 #ifndef __LIBUNWIND_ARCH_H
 #define __LIBUNWIND_ARCH_H
 
+struct maps;
+
 int __get_perf_regnum_for_unw_regnum_arm(int unw_regnum);
 int __get_perf_regnum_for_unw_regnum_arm64(int unw_regnum);
 int __get_perf_regnum_for_unw_regnum_loongarch(int unw_regnum);
@@ -13,4 +15,26 @@ int __get_perf_regnum_for_unw_regnum_i386(int unw_regnum);
 int __get_perf_regnum_for_unw_regnum_x86_64(int unw_regnum);
 int get_perf_regnum_for_unw_regnum(unsigned int e_machine, int unw_regnum);
 
+void __libunwind_arch__flush_access_arm(struct maps *maps);
+void __libunwind_arch__flush_access_arm64(struct maps *maps);
+void __libunwind_arch__flush_access_loongarch(struct maps *maps);
+void __libunwind_arch__flush_access_mips(struct maps *maps);
+void __libunwind_arch__flush_access_ppc32(struct maps *maps);
+void __libunwind_arch__flush_access_ppc64(struct maps *maps);
+void __libunwind_arch__flush_access_s390(struct maps *maps);
+void __libunwind_arch__flush_access_i386(struct maps *maps);
+void __libunwind_arch__flush_access_x86_64(struct maps *maps);
+void libunwind_arch__flush_access(struct maps *maps);
+
+void __libunwind_arch__finish_access_arm(struct maps *maps);
+void __libunwind_arch__finish_access_arm64(struct maps *maps);
+void __libunwind_arch__finish_access_loongarch(struct maps *maps);
+void __libunwind_arch__finish_access_mips(struct maps *maps);
+void __libunwind_arch__finish_access_ppc32(struct maps *maps);
+void __libunwind_arch__finish_access_ppc64(struct maps *maps);
+void __libunwind_arch__finish_access_s390(struct maps *maps);
+void __libunwind_arch__finish_access_i386(struct maps *maps);
+void __libunwind_arch__finish_access_x86_64(struct maps *maps);
+void libunwind_arch__finish_access(struct maps *maps);
+
 #endif /* __LIBUNWIND_ARCH_H */
diff --git a/tools/perf/util/libunwind-arch/libunwind-arm.c b/tools/perf/util/libunwind-arch/libunwind-arm.c
index 6740ee55b043..bbaf01406c52 100644
--- a/tools/perf/util/libunwind-arch/libunwind-arm.c
+++ b/tools/perf/util/libunwind-arch/libunwind-arm.c
@@ -1,10 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/arm/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
 
+#ifdef HAVE_LIBUNWIND_ARM_SUPPORT
+#include <libunwind-arm.h>
+#endif
+
 int __get_perf_regnum_for_unw_regnum_arm(int unw_regnum)
 {
 	if (unw_regnum < 0 || unw_regnum >= PERF_REG_ARM_MAX) {
@@ -13,3 +18,17 @@ int __get_perf_regnum_for_unw_regnum_arm(int unw_regnum)
 	}
 	return unw_regnum;
 }
+
+void __libunwind_arch__flush_access_arm(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_ARM_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_arm(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_ARM_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-arm64.c b/tools/perf/util/libunwind-arch/libunwind-arm64.c
index 53b1877dfa04..8ba510089736 100644
--- a/tools/perf/util/libunwind-arch/libunwind-arm64.c
+++ b/tools/perf/util/libunwind-arch/libunwind-arm64.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/arm64/include/uapi/asm/perf_regs.h"
+#include <linux/compiler.h>
 #include <errno.h>
 
+#ifdef HAVE_LIBUNWIND_AARCH64_SUPPORT
+#include <libunwind-aarch64.h>
+#endif
+
 int __get_perf_regnum_for_unw_regnum_arm64(int unw_regnum)
 {
 	if (unw_regnum < 0 || unw_regnum >= PERF_REG_ARM64_EXTENDED_MAX) {
@@ -12,3 +18,17 @@ int __get_perf_regnum_for_unw_regnum_arm64(int unw_regnum)
 	}
 	return unw_regnum;
 }
+
+void __libunwind_arch__flush_access_arm64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_AARCH64_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_arm64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_AARCH64_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-i386.c b/tools/perf/util/libunwind-arch/libunwind-i386.c
index 83bef77bddfd..a0dcaa10578e 100644
--- a/tools/perf/util/libunwind-arch/libunwind-i386.c
+++ b/tools/perf/util/libunwind-arch/libunwind-i386.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/x86/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <linux/kernel.h>
@@ -41,3 +42,17 @@ int __get_perf_regnum_for_unw_regnum_i386(int unw_regnum __maybe_unused)
 	return perf_i386_regnums[unw_regnum];
 #endif // HAVE_LIBUNWIND_X86_SUPPORT
 }
+
+void __libunwind_arch__flush_access_i386(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_X86_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_i386(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_X86_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-loongarch.c b/tools/perf/util/libunwind-arch/libunwind-loongarch.c
index 7009410989bc..837aa11e2b9f 100644
--- a/tools/perf/util/libunwind-arch/libunwind-loongarch.c
+++ b/tools/perf/util/libunwind-arch/libunwind-loongarch.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/loongarch/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
@@ -25,3 +26,17 @@ int __get_perf_regnum_for_unw_regnum_loongarch(int unw_regnum __maybe_unused)
 	}
 #endif // HAVE_LIBUNWIND_LOONGARCH64_SUPPORT
 }
+
+void __libunwind_arch__flush_access_loongarch(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_LOONGARCH64_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_loongarch(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_LOONGARCH64_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-mips.c b/tools/perf/util/libunwind-arch/libunwind-mips.c
index 01a506c8079c..1fa81742ff4a 100644
--- a/tools/perf/util/libunwind-arch/libunwind-mips.c
+++ b/tools/perf/util/libunwind-arch/libunwind-mips.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/mips/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
@@ -27,3 +28,17 @@ int __get_perf_regnum_for_unw_regnum_mips(int unw_regnum __maybe_unused)
 	}
 #endif // HAVE_LIBUNWIND_MIPS_SUPPORT
 }
+
+void __libunwind_arch__flush_access_mips(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_MIPS_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_mips(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_MIPS_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-ppc32.c b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
index edcb0ec95dd7..fa8471c74bf3 100644
--- a/tools/perf/util/libunwind-arch/libunwind-ppc32.c
+++ b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
@@ -29,3 +30,17 @@ int __get_perf_regnum_for_unw_regnum_ppc32(int unw_regnum __maybe_unused)
 	}
 #endif // HAVE_LIBUNWIND_PPC32_SUPPORT
 }
+
+void __libunwind_arch__flush_access_ppc32(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_PPC32_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_ppc32(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_PPC32_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-ppc64.c b/tools/perf/util/libunwind-arch/libunwind-ppc64.c
index 9f57a049600b..2f746e347336 100644
--- a/tools/perf/util/libunwind-arch/libunwind-ppc64.c
+++ b/tools/perf/util/libunwind-arch/libunwind-ppc64.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
@@ -31,3 +32,17 @@ int __get_perf_regnum_for_unw_regnum_ppc64(int unw_regnum __maybe_unused)
 	}
 #endif // HAVE_LIBUNWIND_PPC64_SUPPORT
 }
+
+void __libunwind_arch__flush_access_ppc64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_PPC64_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_ppc64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_PPC64_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-s390.c b/tools/perf/util/libunwind-arch/libunwind-s390.c
index 9fcc7885ca55..9f68d15438b2 100644
--- a/tools/perf/util/libunwind-arch/libunwind-s390.c
+++ b/tools/perf/util/libunwind-arch/libunwind-s390.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/s390/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <errno.h>
@@ -27,3 +28,17 @@ int __get_perf_regnum_for_unw_regnum_s390(int unw_regnum __maybe_unused)
 	}
 #endif // HAVE_LIBUNWIND_S390X_SUPPORT
 }
+
+void __libunwind_arch__flush_access_s390(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_S390X_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_s390(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_S390X_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/libunwind-arch/libunwind-x86_64.c b/tools/perf/util/libunwind-arch/libunwind-x86_64.c
index 6072e3597e61..25e326bd3e15 100644
--- a/tools/perf/util/libunwind-arch/libunwind-x86_64.c
+++ b/tools/perf/util/libunwind-arch/libunwind-x86_64.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libunwind-arch.h"
 #include "../debug.h"
+#include "../maps.h"
 #include "../../../arch/x86/include/uapi/asm/perf_regs.h"
 #include <linux/compiler.h>
 #include <linux/kernel.h>
@@ -50,3 +51,17 @@ int __get_perf_regnum_for_unw_regnum_x86_64(int unw_regnum __maybe_unused)
 	return perf_x86_64_regnums[unw_regnum];
 #endif // HAVE_LIBUNWIND_X86_64_SUPPORT
 }
+
+void __libunwind_arch__flush_access_x86_64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_X86_64_SUPPORT
+	unw_flush_cache(maps__addr_space(maps), 0, 0);
+#endif
+}
+
+void __libunwind_arch__finish_access_x86_64(struct maps *maps __maybe_unused)
+{
+#ifdef HAVE_LIBUNWIND_X86_64_SUPPORT
+	unw_destroy_addr_space(maps__addr_space(maps));
+#endif
+}
diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 4092211cff62..8c7b2a1e7642 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -40,6 +40,7 @@ DECLARE_RC_STRUCT(maps) {
 #ifdef HAVE_LIBUNWIND_SUPPORT
 	void		*addr_space;
 	const struct unwind_libunwind_ops *unwind_libunwind_ops;
+	uint16_t	 e_machine;
 #endif
 #ifdef HAVE_LIBDW_SUPPORT
 	void		*libdw_addr_space_dwfl;
@@ -206,6 +207,16 @@ void maps__set_unwind_libunwind_ops(struct maps *maps, const struct unwind_libun
 {
 	RC_CHK_ACCESS(maps)->unwind_libunwind_ops = ops;
 }
+
+uint16_t maps__e_machine(const struct maps *maps)
+{
+	return RC_CHK_ACCESS(maps)->e_machine;
+}
+
+void maps__set_e_machine(struct maps *maps, uint16_t e_machine)
+{
+	RC_CHK_ACCESS(maps)->e_machine = e_machine;
+}
 #endif
 #ifdef HAVE_LIBDW_SUPPORT
 void *maps__libdw_addr_space_dwfl(const struct maps *maps)
@@ -1038,6 +1049,9 @@ int maps__copy_from(struct maps *dest, struct maps *parent)
 	down_write(maps__lock(dest));
 	down_read(maps__lock(parent));
 
+#ifdef HAVE_LIBUNWIND_SUPPORT
+	unwind__prepare_access(dest, maps__e_machine(parent));
+#endif
 	parent_maps_by_address = maps__maps_by_address(parent);
 	n = maps__nr_maps(parent);
 	if (maps__nr_maps(dest) == 0) {
@@ -1067,14 +1081,11 @@ int maps__copy_from(struct maps *dest, struct maps *parent)
 			if (!new)
 				err = -ENOMEM;
 			else {
-				err = unwind__prepare_access(dest, new, NULL);
-				if (!err) {
-					dest_maps_by_address[i] = new;
-					map__set_kmap_maps(new, dest);
-					if (dest_maps_by_name)
-						dest_maps_by_name[i] = map__get(new);
-					RC_CHK_ACCESS(dest)->nr_maps = i + 1;
-				}
+				dest_maps_by_address[i] = new;
+				map__set_kmap_maps(new, dest);
+				if (dest_maps_by_name)
+					dest_maps_by_name[i] = map__get(new);
+				RC_CHK_ACCESS(dest)->nr_maps = i + 1;
 			}
 			if (err)
 				map__put(new);
@@ -1099,9 +1110,7 @@ int maps__copy_from(struct maps *dest, struct maps *parent)
 			if (!new)
 				err = -ENOMEM;
 			else {
-				err = unwind__prepare_access(dest, new, NULL);
-				if (!err)
-					err = __maps__insert(dest, new);
+				err = __maps__insert(dest, new);
 			}
 			map__put(new);
 		}
diff --git a/tools/perf/util/maps.h b/tools/perf/util/maps.h
index 20c52084ba9e..6469f62c41a8 100644
--- a/tools/perf/util/maps.h
+++ b/tools/perf/util/maps.h
@@ -51,6 +51,8 @@ void *maps__addr_space(const struct maps *maps);
 void maps__set_addr_space(struct maps *maps, void *addr_space);
 const struct unwind_libunwind_ops *maps__unwind_libunwind_ops(const struct maps *maps);
 void maps__set_unwind_libunwind_ops(struct maps *maps, const struct unwind_libunwind_ops *ops);
+uint16_t maps__e_machine(const struct maps *maps);
+void maps__set_e_machine(struct maps *maps, uint16_t e_machine);
 #endif
 #ifdef HAVE_LIBDW_SUPPORT
 void *maps__libdw_addr_space_dwfl(const struct maps *maps);
diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index 22be77225bb0..c5df11ad329c 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -358,41 +358,20 @@ size_t thread__fprintf(struct thread *thread, FILE *fp)
 int thread__insert_map(struct thread *thread, struct map *map)
 {
 	int ret;
+	uint16_t e_machine = thread__e_machine(thread, /*machine=*/NULL, /*e_flags=*/NULL);
 
-	ret = unwind__prepare_access(thread__maps(thread), map, NULL);
+	ret = unwind__prepare_access(thread__maps(thread), e_machine);
 	if (ret)
 		return ret;
 
 	return maps__fixup_overlap_and_insert(thread__maps(thread), map);
 }
 
-struct thread__prepare_access_maps_cb_args {
-	int err;
-	struct maps *maps;
-};
-
-static int thread__prepare_access_maps_cb(struct map *map, void *data)
-{
-	bool initialized = false;
-	struct thread__prepare_access_maps_cb_args *args = data;
-
-	args->err = unwind__prepare_access(args->maps, map, &initialized);
-
-	return (args->err || initialized) ? 1 : 0;
-}
-
 static int thread__prepare_access(struct thread *thread)
 {
-	struct thread__prepare_access_maps_cb_args args = {
-		.err = 0,
-	};
-
-	if (dwarf_callchain_users) {
-		args.maps = thread__maps(thread);
-		maps__for_each_map(thread__maps(thread), thread__prepare_access_maps_cb, &args);
-	}
+	uint16_t e_machine = thread__e_machine(thread, /*machine=*/NULL, /*e_flags=*/NULL);
 
-	return args.err;
+	return unwind__prepare_access(thread__maps(thread), e_machine);
 }
 
 static int thread__clone_maps(struct thread *thread, struct thread *parent, bool do_maps_clone)
diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unwind-libunwind-local.c
index 3ecdb468b859..8f0128ba05a7 100644
--- a/tools/perf/util/unwind-libunwind-local.c
+++ b/tools/perf/util/unwind-libunwind-local.c
@@ -722,16 +722,6 @@ static int _unwind__prepare_access(struct maps *maps)
 	return 0;
 }
 
-static void _unwind__flush_access(struct maps *maps)
-{
-	unw_flush_cache(maps__addr_space(maps), 0, 0);
-}
-
-static void _unwind__finish_access(struct maps *maps)
-{
-	unw_destroy_addr_space(maps__addr_space(maps));
-}
-
 static int get_entries(struct unwind_info *ui, unwind_entry_cb_t cb,
 		       void *arg, int max_stack)
 {
@@ -821,8 +811,6 @@ static int _unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 static struct unwind_libunwind_ops
 _unwind_libunwind_ops = {
 	.prepare_access = _unwind__prepare_access,
-	.flush_access   = _unwind__flush_access,
-	.finish_access  = _unwind__finish_access,
 	.get_entries    = _unwind__get_entries,
 };
 
diff --git a/tools/perf/util/unwind-libunwind.c b/tools/perf/util/unwind-libunwind.c
index cb8be6acfb6f..816891ecfa5e 100644
--- a/tools/perf/util/unwind-libunwind.c
+++ b/tools/perf/util/unwind-libunwind.c
@@ -7,76 +7,55 @@
 #include "debug.h"
 #include "env.h"
 #include "callchain.h"
+#include "libunwind-arch/libunwind-arch.h"
+#include <dwarf-regs.h>
+#include <elf.h>
 
 struct unwind_libunwind_ops __weak *local_unwind_libunwind_ops;
 struct unwind_libunwind_ops __weak *x86_32_unwind_libunwind_ops;
 struct unwind_libunwind_ops __weak *arm64_unwind_libunwind_ops;
 
-int unwind__prepare_access(struct maps *maps, struct map *map, bool *initialized)
+int unwind__prepare_access(struct maps *maps, uint16_t e_machine)
 {
-	const char *arch;
-	enum dso_type dso_type;
 	struct unwind_libunwind_ops *ops = local_unwind_libunwind_ops;
-	struct dso *dso = map__dso(map);
-	struct machine *machine;
-	int err;
 
 	if (!dwarf_callchain_users)
 		return 0;
 
 	if (maps__addr_space(maps)) {
-		pr_debug("unwind: thread map already set, dso=%s\n", dso__name(dso));
-		if (initialized)
-			*initialized = true;
+		pr_debug3("unwind: thread map already set\n");
 		return 0;
 	}
 
-	machine = maps__machine(maps);
-	/* env->arch is NULL for live-mode (i.e. perf top) */
-	if (!machine->env || !machine->env->arch)
-		goto out_register;
-
-	dso_type = dso__type(dso, machine);
-	if (dso_type == DSO__TYPE_UNKNOWN)
-		return 0;
-
-	arch = perf_env__arch(machine->env);
-
-	if (!strcmp(arch, "x86")) {
-		if (dso_type != DSO__TYPE_64BIT)
+	if (e_machine != EM_HOST) {
+		/* If not live/local mode. */
+		switch (e_machine) {
+		case EM_386:
 			ops = x86_32_unwind_libunwind_ops;
-	} else if (!strcmp(arch, "arm64") || !strcmp(arch, "arm")) {
-		if (dso_type == DSO__TYPE_64BIT)
+			break;
+		case EM_AARCH64:
 			ops = arm64_unwind_libunwind_ops;
-	}
-
-	if (!ops) {
-		pr_warning_once("unwind: target platform=%s is not supported\n", arch);
+			break;
+		default:
+			pr_warning_once("unwind: ELF machine type %d is not supported\n",
+					e_machine);
 		return 0;
+		}
 	}
-out_register:
 	maps__set_unwind_libunwind_ops(maps, ops);
+	maps__set_e_machine(maps, e_machine);
 
-	err = maps__unwind_libunwind_ops(maps)->prepare_access(maps);
-	if (initialized)
-		*initialized = err ? false : true;
-	return err;
+	return maps__unwind_libunwind_ops(maps)->prepare_access(maps);
 }
 
 void unwind__flush_access(struct maps *maps)
 {
-	const struct unwind_libunwind_ops *ops = maps__unwind_libunwind_ops(maps);
-
-	if (ops)
-		ops->flush_access(maps);
+	libunwind_arch__flush_access(maps);
 }
 
 void unwind__finish_access(struct maps *maps)
 {
-	const struct unwind_libunwind_ops *ops = maps__unwind_libunwind_ops(maps);
-
-	if (ops)
-		ops->finish_access(maps);
+	libunwind_arch__finish_access(maps);
 }
 
 int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
diff --git a/tools/perf/util/unwind.h b/tools/perf/util/unwind.h
index f13cb6390088..d3d0f3650f83 100644
--- a/tools/perf/util/unwind.h
+++ b/tools/perf/util/unwind.h
@@ -2,6 +2,7 @@
 #ifndef __UNWIND_H
 #define __UNWIND_H
 
+#include <stdint.h>
 #include <linux/compiler.h>
 #include <linux/types.h>
 #include "util/map_symbol.h"
@@ -19,8 +20,6 @@ typedef int (*unwind_entry_cb_t)(struct unwind_entry *entry, void *arg);
 
 struct unwind_libunwind_ops {
 	int (*prepare_access)(struct maps *maps);
-	void (*flush_access)(struct maps *maps);
-	void (*finish_access)(struct maps *maps);
 	int (*get_entries)(unwind_entry_cb_t cb, void *arg,
 			   struct thread *thread,
 			   struct perf_sample *data, int max_stack, bool best_effort);
@@ -38,13 +37,12 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			bool best_effort);
 /* libunwind specific */
 #ifdef HAVE_LIBUNWIND_SUPPORT
-int unwind__prepare_access(struct maps *maps, struct map *map, bool *initialized);
+int unwind__prepare_access(struct maps *maps, uint16_t e_machine);
 void unwind__flush_access(struct maps *maps);
 void unwind__finish_access(struct maps *maps);
 #else
 static inline int unwind__prepare_access(struct maps *maps __maybe_unused,
-					 struct map *map __maybe_unused,
-					 bool *initialized __maybe_unused)
+					 uint16_t e_machine __maybe_unused)
 {
 	return 0;
 }
-- 
2.53.0.371.g1d285c8824-goog


