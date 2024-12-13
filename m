Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92443E77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 00:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/t4tAnrXs8dbqT90IARLfldAs+rJPVA/lhEFBD44es=; b=x32giebMf7UdtFa0iHEwcxw+b2
	+8Bwq4ouTprNy7oRkbUZYPjbUTa3jPsKWc7ecnkHKNCMZmlWgfFI9UVpYnL5Q2a23NqvZXL3meGsJ
	sbF3GLtAX3FElwvDSxWaKVzGBjTOQ/Lwda4LK4FHOHC6ECVjm/oA3DIv5vZSE/vqHz/X3NdG/w0r2
	pDSHU7MRNZ9R2pKTn0J7fbE/ydlGsrbDe7PP/XX1VDznAOYROJcEW+Re+jQIrk2YI5E8kxnv44/2f
	+Rq71ht9i+aTqFf3NFKYpeWPBGTEN72iT0wUVh5qTxJqxYgy9vjNgwIfBCbCZAbjpiL2JFoHQ5cJC
	Sf9PGP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtfS-00000002JCn-0xV0;
	Fri, 13 Dec 2024 00:36:30 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtcI-00000002HxX-1YOv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 00:33:15 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7fd17f231a7so743558a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 16:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734049993; x=1734654793; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/t4tAnrXs8dbqT90IARLfldAs+rJPVA/lhEFBD44es=;
        b=blkcj+00jML6H7cEyPHzQDF4cbrMr5yIY4xruTPBewvUnhCLK/01g8sC9+GuBt8kuD
         GD6RvhSjwLT5NT1RXda7ZspcqWsnys9Sjng3z8zXYc76wqcMyzqrHTt2FuHSsp7bu4Pz
         t6g5hkpe4W0UlZzop2RaQZaRaVaAgDq4Qr4rLI70Tef3ySRLbNShFkbufO+uB68iKEp0
         vshsIlK3mcpirZGNvXTi+VBn1i4+QqmKkQcBS4E14g980GL521XJnnPC8skOTcDQPCSg
         AuAHZKpfQEoTAOajbopN2ws1fy/p5F3TUuZLNTE1hULwwY3AuwuKt3kYW0Ulji0Kcay8
         051w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734049993; x=1734654793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/t4tAnrXs8dbqT90IARLfldAs+rJPVA/lhEFBD44es=;
        b=fQMMBWgDZNnLmzCxJoy5XZJ7GBf1+ugQZG7FClmTsaOtlL8X0RfB/sQCUdI90cq7z9
         e2Y2HOcpDQ6gLTQAK5y2yaW/86/vJT9GKTtg1qUsqcpr6pB+X13BLEYTlE+EWqUlzcl0
         H8K9cXkyNEB3I9y58pbw0eYH/QJ28nbJEp05R6gsQeukRa6X7YN078y7tWg3fgLIqm7h
         nIU+tUm+zKOx2H1s7iLYGPJExnjLQwIEdCGOsSss07fMbE7y1FWxs/af38cLhllc0NB3
         bi79Xywcrp7S5hd5LGHWrMz+bYoYMGYGXKONybJgQrqN1crBj2x8kDUWJmCfrwRHwk4f
         a6NA==
X-Forwarded-Encrypted: i=1; AJvYcCWWKkauJuQTjxfJB+Oj7HRSpOUuEoMBUPYHv9YDzqj1vibjVNAVIR1kRXcSqdoGqlGVRfTVhPb50jZApZhHjZuj@lists.infradead.org
X-Gm-Message-State: AOJu0YwpJumYABTsjTssSpF6Z8ZCeFR+YmJTheHlIFtUSlZ9I0jZ4K3f
	NrQdyCN9+U1xrQluYqJis9J2NEhSRZbacrq/vouvakUVgZCtI/ulnXfLu1NMVOs=
X-Gm-Gg: ASbGncsnbBSRgPMWSH/sJAKowzCa4H8O7hbW2Cdb8pGwUg502gZfgI3/e5FGjtmqNBm
	ZQMVixjriyqaPv1rmCr8K5MsaR/K0exnD5db11NAQAzwGcBN+9CambmImGSm/hmBflzt39tVLv/
	9SNppGU24v/LOZagGZK/eSJojHdZn0oAZ2d4rfDlro5iwoz+HBNgloQ4ToXgyFcq7i3dVaZ2PD1
	wGvhjK8pLGusxnyPqlRxPO25u1s9zFu/qQuoEnRzAvAHsitsiH4NxVc2xdsxMc0jwd2nphV
X-Google-Smtp-Source: AGHT+IEd23eNeza65b/mFf2Ef1epXFx4Y/eggrgjqxpS7nxWsumxa7/TVE+fCJ8K+wC5TazJMd2/IA==
X-Received: by 2002:a17:90b:54c7:b0:2ee:c9b6:c26a with SMTP id 98e67ed59e1d1-2f28fb68ef6mr1014242a91.11.1734049993490;
        Thu, 12 Dec 2024 16:33:13 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ce50sm1934462a91.39.2024.12.12.16.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:33:12 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 12 Dec 2024 16:32:52 -0800
Subject: [PATCH v2 02/16] perf tools: arc: Support generic syscall headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-perf_syscalltbl-v2-2-f8ca984ffe40@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2767; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=IQtfuUT0+eGZ51OwwywtWIPS5QSw2EsnD9K86OE9bhw=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3p0w97f96cdWBjf3P5j8qf/XPecPv058Sizvjb1nfH/N
 DZe06qojlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACby9R8jw6mSmU2bFY+3Lfy/
 XOjNdrf3s3MDnGu57qrvuLzXbt28jB+MDKsnS+vzMHHtjLyR+cPn56XF7vwGb3eaLjRf//zjQ7t
 NKlwA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_163314_416074_B8266AEF 
X-CRM114-Status: GOOD (  15.16  )
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
 tools/perf/Makefile.perf                             | 2 +-
 tools/perf/arch/arc/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/arc/include/syscall_table.h          | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index a72f25162714f0117a88d94474da336814d4f030..3959a9c9972999f6d1bb85e8c1d7dc5dce92fd09 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),riscv)
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f5278ed9f778f928436693a14e016c5c3c5171c1..3b463b42b0e3982e74056e672b2ee6adad5a3f0e 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),riscv)
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
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


