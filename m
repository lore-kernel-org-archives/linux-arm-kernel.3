Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED60E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 02:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10LmYqKv19aje8sntIFV/R2i9EqxMFmjtiwpp8rrMlU=; b=YHKXtfODIsa+biAVmItI/7XbtM
	SLKmhNkn3n3dXSDj/PCANNTCRjg9WVJU+XDDqB+iYeU0IKLq8N3R0U+CFG6CV5tXoox9Iagrnb1nC
	d4rnvRZhbVz0J1A5hhnyNZylXex+JFzPBuzeWJdl7BnfZ24Emj7azjMrDygeRt9spaWu1gbIIcS0u
	DA+Iz947V37qzK8jmAJaPgQg4P403ggomgyIi4k+L2DS8X2Wkxoxwrw+Sq5azUQAy8RGkfpZv/gpG
	Bri1Ll0sQJ+CPxv14XqtWArol1/oTaxB2dwOlGpLljX2PVGT22ClvrzILGUajYWo4kuEQFWBuvwdG
	ZYL93ITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tViVd-0000000AUXn-2sOo;
	Thu, 09 Jan 2025 02:42:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tViPg-0000000ASHS-302Z
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jan 2025 02:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=10LmYqKv19aje8sntIFV/R2i9EqxMFmjtiwpp8rrMlU=; b=NsQ1La0wCB7gRTuEExe53Onz2q
	Nz+mw63mqmAvr5+a0L2i3oGyN10Js7vXV16KfEhCQ/gEXHXDMDP/pG58xtN2Dyq+NMjNgShEoW7Gn
	bTP3SLV17fBNiG0tb/MhNOxtm1Ia7SMcVB7IMbWbRHmHLBOQI5sZuD6i29fq6tlDzk+NIzWJsCjV7
	sYDk+yPRKTkvg7HuiTJokz/V9i0Isf9JpA15iUMQ0i0V3OJQHC+IZ3MkTENS7ILtN7bioznymp1F+
	w2cLnLcnEKpzF0ltn4OUZUy1yG8uQLvqlDEumpZURqiAVrOIYyTdcx3LLAt9r1FsuZFHzAuqkArWf
	vt1bWqmA==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tViPb-00000009T6a-3eWv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 02:36:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2166360285dso6252585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 18:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736390200; x=1736995000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10LmYqKv19aje8sntIFV/R2i9EqxMFmjtiwpp8rrMlU=;
        b=Suqq/hc9zDVwC9xEe1dkk7S/2zdgWHv6cR8/j/+sfjNgzPek7l/cd51L+MXPEzC1P9
         zRaM1d28xs1VZQWGJLA23FC/8ZSsFUSO7u+ojlWmB3Xz6KhN/+Vp3xU7YurEkIEjsUJt
         Sk1O3zwazz+c890fWQUva1kcwDPbiwxr9Yt9CWd9eOx/qbRLZraBTOKwKpXbwNraIzqW
         //vNRFkmjpmBO0VuuIqbiaYc3QvZfxu65wj2NH4dOyhnfV//lgxWB0+BvQgMTb8VUetn
         F8wqiBUlxdUgdlhOwTcFfEv+xitO7UbBfksedWt1QYOzmTEpF03y3ZfA1M68y09ej0ni
         5sKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736390200; x=1736995000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10LmYqKv19aje8sntIFV/R2i9EqxMFmjtiwpp8rrMlU=;
        b=E1YqqeQG005Wc686CqkzAu9DdUPc4tHXWiGWbMPs4DRw+yd13CtvqVsXVxh1bpP4Kh
         pNFYXoeGkHNbqFHSq4dGqKzXm6jJNwtvN92/ZWccJwzxtIblhlsN6Gl9QZN+Lnq5cBu9
         sAcmsPtjDXsem4CPZFAaBiL7WHWABit/qIeu5PGMiboy8KpymXVyPUraqTcRc8D5xBwB
         mkAMwEXMDtveyqEOkamrvLPRwKk0vWgj9rL2A25FkVbVvJRo1/Gp0YBQIgFDUJv9nWLi
         KPGpYyd1JkkCyGSV1kaGEDMtso+N00KhKvZ4WZSuZZe1RYDJ+OjsNgwTKzGx0qov0wEH
         5E+g==
X-Forwarded-Encrypted: i=1; AJvYcCWjq8QWzwUtOCmfPeza28Bs2xUB6e6U8HVh3DLbxKrx293cHObjC5Oxim0zsJM1RZpwUxbGNWck5LwHPkECBFiR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc6LsqS7tAFLdydj7t4fAgNH15eH3V8vvgI71R7VxkYAfcbcEg
	hJdP092xDgx7qcOmuO8vu26rAxZs+ciR6+qPkfIxGJ3h8mEj7qDVotw2IBxNJ/Q=
X-Gm-Gg: ASbGncsUHc9PVdFJ8SL4t4PAE7AUz3t1iYTk9mpKsAgtCGAYk+IAGGK006uUJ1GBLKI
	gyqUlDlP7XUIDVIQ0C9MLqRw8Gv4WerXBndxVVHn1Gc8RotwQqBxDd999R964cctAKt6aBtW5ET
	fh8t/3kDZAx0d09xf68XkSLphTck9IFx30VbNvAE4Wo4Z5xomMtkWxPiLhntTEf60V6jCeD0xle
	H1FUe4UH/v9bNQG7jpTncPpVXDHdp5uOXiBAPziADVN0qxee18MBb1wDzLBSWx56L+J9Ovo
X-Google-Smtp-Source: AGHT+IEZTcNWbZZzy3+uRZAgWCe1ByNgJiDdl7GdfQUoOUVQV9Ol8zkdwVR6pXRVpk94+KTROujofg==
X-Received: by 2002:a17:903:2b08:b0:216:70b6:8723 with SMTP id d9443c01a7336-21a83fb5af8mr82871475ad.44.1736390199846;
        Wed, 08 Jan 2025 18:36:39 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9176bed6sm1434365ad.12.2025.01.08.18.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 18:36:38 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 08 Jan 2025 18:36:17 -0800
Subject: [PATCH v6 02/16] perf tools: arc: Support generic syscall headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-perf_syscalltbl-v6-2-7543b5293098@rivosinc.com>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
In-Reply-To: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2826; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=In4WKSPDuGrXSsW1qi6BwC8Z5UQ8yZH/Gn59zCTgjRk=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3q9mba3RPKtbbI+Yud8xVZbf71lJHdfU+yx3qxpC0M52
 Msuf1nUUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQ8exn+e9Y/6xCYxCgj3fDD
 WmNq7ZV1zEunqs9+VZto5SRQOv3sDIbf7Pvnq0X3h1ivcK47xCHyaosby845F21/MjDsChCd79v
 JAgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_023644_229109_8CC3D116 
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

Arc uses the generic syscall table, use that in perf instead of
requiring libaudit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                           | 2 +-
 tools/perf/Makefile.perf                             | 3 ++-
 tools/perf/arch/arc/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/arc/include/syscall_table.h          | 2 ++
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 6d66a7bad30d184d871ef85b09091e2720d09787..4e05dd2e9596e87cdd0dc91f4c5b071b4545c574 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),riscv)
+  ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index bf0516e328aa4f8a251b4f3eb172fd191772b00a..44b9e33b9568f638ba12ad688833fdb661c16c16 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,8 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),riscv)
+generic_syscall_table_archs := riscv arc
+ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/arc/entry/syscalls/Kbuild b/tools/perf/arch/arc/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
--- /dev/null
+++ b/tools/perf/arch/arc/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..391d30ab7a831b72d2ed3f2e7966fdbf558a9ed7
--- /dev/null
+++ b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += arc time32 renameat stat64 rlimit
diff --git a/tools/perf/arch/arc/include/syscall_table.h b/tools/perf/arch/arc/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
--- /dev/null
+++ b/tools/perf/arch/arc/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_32.h>

-- 
2.34.1


