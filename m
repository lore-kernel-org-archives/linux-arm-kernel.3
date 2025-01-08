Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343F2E77198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 02:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05wirhUQV9Km8dQngc0z5Y797cbCbqNKIhJCCOZ4z1g=; b=QKXvIIO2Quxru49mp03q18ok4F
	RYIuA+9aQEXdN6UZQqEyQXCXP/4+qApfoiJ+DnIDvFJq+8Z5Ft2jldTsAjFbLSrQq8X3KloC2RUGs
	5CRPVXC6BtzIq7VyMmnJ8BIuxC2hzYyra5mQ9aEnxMo1zNMLMOt5aWpYEKUvJLKEEc+jAd8OO3a1Z
	foLwYDOdrtjc83yX8M/H41oCyYRXidjmpNzNCq+C33iOjN0/r/UiOTJa6zJWQATWK958lsFCsaIRa
	khlN6+sNGE3NfPpTXfow+YlLby98C7gWSGApWEy1JNStV9VC4CZKRMQm9ns8qv2VgIv3GIaQ6wMcd
	me4d/t4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLZR-00000006qeQ-345Q;
	Wed, 08 Jan 2025 02:13:21 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLUV-00000006ojJ-2URi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 02:08:17 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2165cb60719so244041665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 18:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736302095; x=1736906895; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05wirhUQV9Km8dQngc0z5Y797cbCbqNKIhJCCOZ4z1g=;
        b=Hxwr9hKVI0DgfuYA5VEsxsqtvX6WY6coDMWP+OGY6A15Y9O3xnntAqTRH6bCk6Kp+f
         sZAg6Q+d8lVjFbJM1Y7hv/TZfo9j8Xv3iCSIneAGS/sOmDsaI71QOvCWpiHvFLC5nt4P
         4vV1B+Nt9qehoLQ4J1hRw9jgvgg9Nz5SLS6DN/qqx/+QKJLX3Vpo02rXON83xSOVUXLW
         cWf7NeJo5BRIcPnZkr3vbmqY+VoTqh4+I4Wj27PbJKS7VLXb630XwJoEJqpQTL4j0f11
         DsIDcvdxPrW1yhCsEtaWDdO2CfLXP49I/7FSUsL55VeOKUPL32prF7cUgJaI6lOwrU8w
         Po4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736302095; x=1736906895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05wirhUQV9Km8dQngc0z5Y797cbCbqNKIhJCCOZ4z1g=;
        b=XOZeyfGbSQxkyTszZCVps5itz3yHEO3h7k0RgAqv7nPxPmE7aJff61+RBt/8diVORX
         91NmL6P3EgtmPEhmcxE+sMYydX5sB6DSAP6K1ySZsWy8AG1lN8zGVicSsG1lGxNeYOyh
         cu1DwddvQweg1Wjj7UT9EW4l1uMtHLc63z8J0ol1eLx3lnSejJrWyMcgbrmcF2VsTwyR
         h+NTQpxLvytSD3FDJB+X7vK0O/WYgBuSAS/UwkmdypRj3iQiAqeeArO4sr1Bm5XmGs7L
         1Ie3fNaDHOxMiG+TxErxE3SePNekaRAU0Gtyd7GMDmjnZepkcfjOtUEJTIskh0zKMS7O
         Jmlg==
X-Forwarded-Encrypted: i=1; AJvYcCUzqaD8NKDaRn1mp+BFPjEzakSwMGDct1dJ5ATnQ+5WewoYzlC9AKvfwvR6hW9WVyzcOBbPrOcYxqUkEDH0QJn6@lists.infradead.org
X-Gm-Message-State: AOJu0YzRscKWjnRmqwvsKY0xXZV3In/dE1fJolzhQ48Gd2v8A4JNdVwl
	Dsqp+9WCROhLB+mDnat+/kpf/oxbghyNt/f/347CkagfT7+2v4of1hWKHiT20U0=
X-Gm-Gg: ASbGnctPQFi1eVs3nArJISaiQZFRne8eCyTuv8dykqiHW0yRnujsluNf1dtWyDRKFjB
	oENBxTRm8wgDuq1lgzF9agtXYrwZsuDwMEfbNOmTbGccgOr/a3OKVxUwJkg82TGhRjX+oFUAtYU
	pzs4prkWAg4rvMmQbB+KmY02xfsflxXBzNswuelpxCzlh9C+EdRc2pm2QOKzanpVLbo7EpcyN9+
	D4S4BpsN+NxdcfBA7srLDqxhO7gktmEUsOMuNod+PTMwNE4a3nT2QfeUcVDCkOvChKY7nhr
X-Google-Smtp-Source: AGHT+IFi2PqHlIH+52R3oy0dD5sKhEOY4OR/hJLyrqZkUQEHEQ6USqVAO5de5/oV21XIKeSPaGh+ig==
X-Received: by 2002:a17:902:e544:b0:216:414e:aa53 with SMTP id d9443c01a7336-21a83fffc58mr17459665ad.52.1736302095071;
        Tue, 07 Jan 2025 18:08:15 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0282fsm316662405ad.259.2025.01.07.18.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:08:14 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 07 Jan 2025 18:07:51 -0800
Subject: [PATCH v5 03/16] perf tools: csky: Support generic syscall headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-perf_syscalltbl-v5-3-935de46d3175@rivosinc.com>
References: <20250107-perf_syscalltbl-v5-0-935de46d3175@rivosinc.com>
In-Reply-To: <20250107-perf_syscalltbl-v5-0-935de46d3175@rivosinc.com>
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
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=ChjCi+WDWxIeAEQr9uB+RlwWvFzZ2k5NiZ20md8SwKA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rtPYaYTbPWX7C8HZuyJozv7X4R1uVCB48EzF6yUXjjl
 D1XvJ5qd5SyMIhxMMiKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjCRGGtGhvmPtZbqs372ft3t
 f3r+x3QFvTiZJQeTJ2WLT61ljLxlYMnI0LT179QtLo0678tvatco14VN2jjx7SvJk5ekOM6lrVi
 VyAEA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_180815_647449_085BAD14 
X-CRM114-Status: GOOD (  15.34  )
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
index 44b9e33b9568f638ba12ad688833fdb661c16c16..3fe47bd21c0ea39473c584c82383ca5d4daf580f 100644
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


