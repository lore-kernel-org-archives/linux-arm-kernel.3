Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AA1E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc6AkHxSAkZ2nW0ejwY9TuAU4WyUl5DsEUDPCF/WMmI=; b=kFKjv6JVFwR+mbeaJSOLIJDyiy
	+lPgg2usmNlVEBiF3kciEJNwKqKyB96FQIEVN3LF0bKDfRpEV/GJPzE0LChj5BEERZi+xmrqwx4ih
	NfifeuKu/DPqvbxf6RBZ13Xdlzgz+vLTr1FmWspyFj1l9K9Z6i9btzO+C6aSgqdrVI9pSx9/+PTXC
	6N6k5EsDjG5Pjy5H9AsNMSHGyjWPvFLUk7RZaOnR+q7YFjUukzfTgIovBeRuVjEOEgYGkhQTI8cL+
	5ZfL+46L8zfC4rONEy+vL1pN1jgYA3hTKJucIGoPR0/4HnN7YCFfF98ubIeMsxUUvZN9+utTTIfTp
	xt57QaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRJ1-0000000CRuC-1vkZ;
	Tue, 17 Dec 2024 06:43:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNREr-0000000CQU0-2m0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:39:27 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-725f4623df7so4254336b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 22:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734417565; x=1735022365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uc6AkHxSAkZ2nW0ejwY9TuAU4WyUl5DsEUDPCF/WMmI=;
        b=ND5GdNC2tOPfeZGq6YK6O3d18yXyfdTb/J6NnOTajTHS+oP4dOnCqruY3pvtH+rSLw
         p42ijczX6ctb9rN6mQ/xUlMJXnM431x/zQhdkyJC6iDNmDvT7M4RZbxhRTzh5iSm8E0D
         Amm2JG+LUman4JZ8lyVmBKElRBkobYiFcSEzgkqmWh/MC+s1gN8Qc6J4U88PrGkcD8vd
         scPvi7jbxVnuIT8F9ZiGJS8Hstj1LC1iLZmR1kkiRrD51sAZ5QV3243RB9+L4UqtgQZS
         J73tvI6GrZoclFwY7tq2fkU0/vUwkNjzN0IpAERKZUuDHlve5xHr02i7HDU8ztrO5WBM
         e/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734417565; x=1735022365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uc6AkHxSAkZ2nW0ejwY9TuAU4WyUl5DsEUDPCF/WMmI=;
        b=rbYAvJFp4kNKuayGEhLettRuIyPubqmpCYKzqyJUR4yUiAgP9IWVNBLQlFqenoz9iC
         88JNksUOAHpk6wy7PogPSvbt7nwRvMeQ8ca7KSU/eMSGFyG2Jpy51rVhJG4aE0cgFBSy
         zGL4wo1nh0j4XwZgiZvWpZT6LwYOgCMUK5okZ9mylGlv0wym/PsuwkqCsGrc2d369dlh
         tW71q+ep35Y+WgJDTjxSEUUfRrP4N5/lHEKO/N1mcGif+v6rdAuahHuzGtyJ7KE5ZbCH
         EiL2vJHYjGzYarB7ynF6qbgg8ORM9ZShxMHT2Ul0eW/IS1VtRE6751Fq9u6NOAytIe4+
         ei+w==
X-Forwarded-Encrypted: i=1; AJvYcCV6XIbeapcbBGT/ypfsUbSANsDTl9easnzo8DUB6wPOoB/o6J5jLuQ2+k1CbKz7S8BAJjmIzgEsJYdyNiU/CG89@lists.infradead.org
X-Gm-Message-State: AOJu0YwpvnFWXs4Dxa6KSruKnO91aGd+mluNNKFzSBixhXYuTWtacD18
	zG7NFs5lHvv7dFTjHojKiQcx5HvBauRGeGkAo7zxK0v6RvrV2pcRFAe4ujCCYcA=
X-Gm-Gg: ASbGnctezG/ZJxiCAsoGfJBZ8IWpqCYR7VUeiJDGHqUn86KnyVW4/7+Kso9pV6IgouK
	ck0pZclQMMiyepxb9spJPL0V+uhFd2IbBxVP2AH6kgw8FJ4ebmIe39Rnfr0XXvoJ2dtc6F7rZF3
	oQNsnTWv8PGMPp9XRczdmuKZd2PcHhfTSwV4vd2vSZElVXr8kgxmY+CpZTSyhvp0HgZ8aSaMct0
	rSC8D2MO2TdDi9ZzBCTNOANoEdgX/WTh9ZlPJif65sc7+POSrkozBFmHhN7neTRL7FLxZ8i
X-Google-Smtp-Source: AGHT+IGUd4gH7BE0kdkomPlujnx2e5+f9LC+XgSew50DyNj1to7GARJn9sGir0f0VS3f2JBCRB8eHA==
X-Received: by 2002:a17:90b:53d0:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2f28fb5fd68mr23504844a91.10.1734417564810;
        Mon, 16 Dec 2024 22:39:24 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90d6bsm9179551a91.2.2024.12.16.22.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:39:23 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 16 Dec 2024 22:32:48 -0800
Subject: [PATCH v3 03/16] perf tools: csky: Support generic syscall headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-perf_syscalltbl-v3-3-239f032481d5@rivosinc.com>
References: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
In-Reply-To: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=aj6KhD87JndqJTmCbrJmfbqawzLsCSF87gVbexImUU4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qiTC/nK6erkybH3NrWECwgfVPwiuDsS6e8mBZf0a3s6
 /zMIbC5o5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgImIHmH471mzgum0s/DxZc/W
 R2uta3gg2jq76fSrOK/nf1x/X40J8GBkaP/tI/tf562q7WH+bRKnXUXW5Cpkc36obHnwXnROtN9
 MDgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_223925_720429_690E20B0 
X-CRM114-Status: GOOD (  14.94  )
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
 tools/perf/Makefile.perf                              | 2 +-
 tools/perf/arch/csky/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/csky/include/syscall_table.h          | 2 ++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f717e4628d9e4632f53fed16524a659a3e4feea5..b20daf3769771a7c23cc0f7dd46f562510bc3199 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc
+generic_syscall_table_archs := riscv arc csky
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
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


