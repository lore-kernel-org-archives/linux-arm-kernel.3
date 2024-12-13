Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2570BE77183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 01:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rp8FO0OCSZ/qUCDzOjOMxVbbH2AtMi4o4J4InXgU+q8=; b=AC5qZK7OEPdMWqSHmiCZJ1R8Fe
	VvJ8XvjUkAqJi7waWKur/efN/7AThMTdvXW3UTtPoMq5XJW/BIUIwIX2EtOD/e/fukVNFod5WAY/Q
	wozzKmK/JEjF9pJOulVt0EYPwWmKtGd0gmODCbj03VdfEeTyIDK0BNPgjh7S8yL4j5lr/nz1lwTSw
	SDV1tVtekVCMY+riG1rlxD9QpDuq35CHTOQqBC92vvYJa+eO4+UsmKphCVuGEcHiRop3l2CNt6lr2
	0PDX0kgpsTm9bCy0YFE08Dx2/YPX/dz44aFrs1RDknvwOqcirqvults137B/pRoFbKHDfXv7RYdjM
	6PUtECVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLukI-00000002RAs-35Fw;
	Fri, 13 Dec 2024 01:45:34 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtcK-00000002Hz9-3NAV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 00:33:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2efb17478adso1020612a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 16:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734049996; x=1734654796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rp8FO0OCSZ/qUCDzOjOMxVbbH2AtMi4o4J4InXgU+q8=;
        b=cZvD9q3j+ZDsjbqxc7kjoRRcfsWK4kAr9ickamG3DEJ7RpT0RYI2KyhlPpfqqhMhaI
         8ippQHaVzwnGC/E10128A6A7dCmSeadIK6koEwW+GlNFz8gLeFgTPjsiMXpLk1EBiJHK
         WUJGjXiGg80mdv+ifqzNOHOZNVuU0lAFj5oY97W7ET4C8/OB5oEQ4a/20ai7J4KEiE6l
         awrbbUPg1mv2fyReYTDcPInltcA3dZWrKe772GD6teFCzZzzP5HABZdIdQnZ+5grdz9L
         k82dYx4OoIt66H5rOecwSeJH/Bxzm3rg0+fn/bYDAl9DhM2O9G79lpBvIryXUDJGnLVe
         ALGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734049996; x=1734654796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rp8FO0OCSZ/qUCDzOjOMxVbbH2AtMi4o4J4InXgU+q8=;
        b=EFYsLGfFnE/yb+SDoloA+Toy5/9v24Mc2i2tHAyBL1f710NLhpm1u/PVK4poVtG5xj
         lOZGMSHroZ5d/NbSJlMub53D2IzuGvyNsumF3m2OTTWz1G9jaYCwlPIeYpqbew7Y6Oq3
         Qz9LoHBPWoDT+ichVsUdWuX9clpAnWPjU9stU5270FlDUH7v2Og2f8UgP8Bn2aA3gfYT
         /WAexWrAvIlXbWqOHareVusfcgI3TjVEiVf+bZo++2LDckM6+xLSSzRxIznly16PUjkv
         BxtmweAJrXwnpwEeWtWGwYZFl5iRrKVr0JZh+D4l9HAvz5TxLoGQ/d+/rNVZteJ0L4jY
         F/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUkvWqDt/UYC74rvkxeB8077YCzjbuPGrt/uYS9+UTXj6yq4UUspFUuqVuTNlB/yRGJJ64TM2wEluNGT9EPebjg@lists.infradead.org
X-Gm-Message-State: AOJu0YwHgtgCt8ke1Dy3rN68+/XiSSpp+t1W4aMrs7AWlStjTj4c1dPr
	CGHK9h9QlG4aaHHsqUnYhsba5TYcUiTqg+HdKBCWvwlN+TVAZf5eznO+k1+unaE=
X-Gm-Gg: ASbGncuofGiY7a3sQWuNXq5geJm4TYSgfrGEh2F9UdfSdpfaWZvTq3Y5RciY6Vd4nwW
	THj9HqLsmr0Lr4rP9Gy9y2d02j5QmfoWg4rpk2JRolRa83KAURwXlnjiVMkFfBdFXmunxlCtzXQ
	xpt4MQ1rQ+Zh5RscAFH6J7xk941bZGlGcTTbZhqSdekzKBTnOiBrUjTN5cNosN2go/Vyp6wCW4R
	ddsgB7hmL9Uxtjt1e0InCZ9evdoQzLUeZeuvPoVRCsVT+VnuCTY8M5X0PZH7V5mBicivLtL
X-Google-Smtp-Source: AGHT+IG4gRsZLG4Vx2a1/zZIKlGxZhkfrJbfitUgDX8Uz2b6ouZp8VypnAWgqiCZsMeD1Is8X9jPmw==
X-Received: by 2002:a17:90b:4a04:b0:2ea:3d2e:a0d7 with SMTP id 98e67ed59e1d1-2f28fb67655mr1250703a91.15.1734049995974;
        Thu, 12 Dec 2024 16:33:15 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ce50sm1934462a91.39.2024.12.12.16.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:33:15 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 12 Dec 2024 16:32:53 -0800
Subject: [PATCH v2 03/16] perf tools: csky: Support generic syscall headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-perf_syscalltbl-v2-3-f8ca984ffe40@rivosinc.com>
References: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
In-Reply-To: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=s+YOevH5qJpXQeBMeav5HfEhx0qMLUBz1Ow99oWav84=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3p0w967bHUGluV/JWs/VJgacMaueH7pVN/r1WWOmRVbW
 yJiw191lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBHFOkaG90lu90Vq035fnTjJ
 XfEzd/a/jKDIJxaK19sYPf9kMSjdYvifO7dMZILE251LdOYfVm4MklfMfhnaeM7s/SK92aqF0zK
 5AQ==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_163316_836570_2C8264B7 
X-CRM114-Status: GOOD (  15.13  )
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

csky uses the generic syscall table, use that in perf instead of
requiring libaudit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                            | 2 +-
 tools/perf/Makefile.perf                              | 2 +-
 tools/perf/arch/csky/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/csky/include/syscall_table.h          | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 3959a9c9972999f6d1bb85e8c1d7dc5dce92fd09..6fcaa051a47621b818b4c9d967eeed050056e400 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 3b463b42b0e3982e74056e672b2ee6adad5a3f0e..407f589046e032c4103c3b6b82c9d044560c5bac 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky))
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/csky/entry/syscalls/Kbuild b/tools/perf/arch/csky/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..ea2dd10d0571df464574a9c0232ada0ac1f79a3f
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += csky time32 stat64 rlimit
diff --git a/tools/perf/arch/csky/include/syscall_table.h b/tools/perf/arch/csky/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
--- /dev/null
+++ b/tools/perf/arch/csky/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_32.h>

-- 
2.34.1


