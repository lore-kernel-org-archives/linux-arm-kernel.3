Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345FEE88D86
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 05:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0bWS7IQWf/pTrd7yQAODT3hHm6x/5r6ulA0C6sdgYw=; b=j6Ffi3ihedAMJMzWlNkiqPwH+w
	7CB8YfS/8TcxGDswbTKrS3Fn6dpK5o23E1Y8Apv0MmQBVnQnqYFR+8HxuFGrNsIWSkl+xhdTdytbl
	xu343O0pRz47YWVemitLO5yLONcnQCwpvM2rCS6F6F50vecQvn/w9F+7V4OgEWqc2E/gqtHYVOMvM
	0oN32Ho0mdvMU+fcHiFKWIuLI4Q5neHR0QsKLfsTRUghp9AbZleQ0SvyjlzoayezjeZ2jzUlNO5eB
	P5TYcVm4qXrLHDXTyYKTREVIogBNYP7KscgzOQayNREsrSVUQqlodYvn63NPJBm2vOMlOI9cjtSjJ
	cm7wMmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tka-00000003ABf-0F51;
	Sat, 04 Apr 2026 05:40:52 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkW-00000003A9P-37li
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 05:40:49 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso3127838eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 22:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775281246; x=1775886046; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q0bWS7IQWf/pTrd7yQAODT3hHm6x/5r6ulA0C6sdgYw=;
        b=Y6BuDieLVaRLqQBdlvGJkSCjXsy2aHcmzo3jPnqaj4i8pmrt6niVR+YYIGSXCIOQZU
         ZD7MZTvzyo2eNSm5IoS7ioTtJPMEE8ytl3sddV1m3ZUFeq3Wzaea20dcYHLIX2Eq6mxj
         FF2xD5s8hUzkh8rp2pI/gSUDU5VfJHLn0gjxVwZyJvLAUlif6acX2cPwiNiehTkmB4L3
         jS4zT5yvcwkfgCrnjZGsQUhVvkWaKz99pkvnmPf5bxTimagf45QL+qgRR5DUt6VrMcDS
         5LWQnTtgybeW07W4SLNNNGSfV9pyDO8Hwn9Vz9eNS/QV7DOma2E+wFP2iVMSCDGdzHJh
         Ncgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775281246; x=1775886046;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0bWS7IQWf/pTrd7yQAODT3hHm6x/5r6ulA0C6sdgYw=;
        b=jURs8bVo4Fa5xs/ziC/cBpWg4aJSZbCELkU7TbIl1MmVFFoMxZrSZ6UJQ8CJnyGqpP
         jOrr/JWQDqQxT5ErDhkRKHKYPGm3iupCrOLAttNjqQ4OLe6eO6WxwdENAZCtO3zj/5YY
         a4jLFWwZosZQJ1k/50NNDps680IoJGNb3yoU2uu+I00OPJT7TNs1jUkcs1bGN7BvrOD5
         c7Hn2Em3HMQJdz7+IukiJww/YpKtwU/HOrm2LQeNBo0K66QIN05kIxPnf2pU3eEL6h2d
         uJg3Fzc+p7lrOkPEXqCRHy4jwIGOJIs6zI+WmKYJIUrEPH//yWi09l//iAcLXnKYXnnN
         bDAA==
X-Forwarded-Encrypted: i=1; AJvYcCXu8oyyQEd8ZV7wG8DULwzThWs7YlNS5QxqAi2/IR+HM4rUIeWzFU/fW808PDV6KM2op9I4KHwR1SwzxB0x17YX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7qzJX+cQrKXzK4BWJfwWNcFV9P5lrdTB+but5VKNSIthfMFyK
	0gRtsjjkL6lmUAazhrn7AZbSR+NxKdqS3Yf4HQ1/wDQ2y+x/WdnuuK7U60Ib5VokQYAyOO+hy/1
	byBJwQ+oXqg==
X-Received: from dybmx6.prod.google.com ([2002:a05:7300:d406:b0:2c1:5b29:d58f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:3005:b0:2ca:2f21:64da
 with SMTP id 5a478bee46e88-2cbf6a8e179mr2811537eec.0.1775281246342; Fri, 03
 Apr 2026 22:40:46 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:40:24 -0700
In-Reply-To: <20260305221927.3237145-1-irogers@google.com>
Mime-Version: 1.0
References: <20260305221927.3237145-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260404054032.1538095-1-irogers@google.com>
Subject: [PATCH v3 0/8] perf libunwind multiple remote support
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: irogers@google.com, 9erthalion6@gmail.com, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_224048_782556_ED38934D 
X-CRM114-Status: GOOD (  19.54  )
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

Fix the libunwind build for when libdw and libunwind are feature
detected, currently failing with a duplicate symbol.

Refactor the libunwind support so that whenever a remote target is
available, perf functions using the ELF machine can use that remote
target regardless of what the host/local machine is. Migrate existing
libunwind supported architectures like powerpc, arm64 and loongarch so
that they can work in a cross-architecture way. Add support for
RISC-V. Make the code more regular in function names, etc. and avoid
including a C-file. This increases the lines of code. It is similar in
style to the unwind-libdw implementation. It is hoped that the more
uniform nature of the code with help with refactoring the perf
registers for SIMD/APX support.

Aside from local host testing these patches are under tested, in part
as I'm failing to see how to build libunwind with support for multiple
remote targets. Please could I get help in testing.

v3: Minor whitespace clean up and warn when a dynamic choice of libdw
    or libunwind is selected for unwinding and support is missing (Arnaldo).

v2: Move two fixes patches to position 1 and 2 in the series. Fix
    struct naming inconsistency, Andrew Jones
    <andrew.jones@oss.qualcomm.com>. Fix other inconsistencies and
    potential non-x86 build issues.
https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/

v1: https://lore.kernel.org/lkml/20260224142938.26088-1-irogers@google.com/

Ian Rogers (8):
  perf unwind: Refactor get_entries to allow dynamic libdw/libunwind
    selection
  perf build loongarch: Remove reference to missing file
  tools build: Deduplicate test-libunwind for different architectures
  perf build: Be more programmatic when setting up libunwind variables
  perf unwind-libunwind: Make libunwind register reading cross platform
  perf unwind-libunwind: Move flush/finish access out of local
  perf unwind-libunwind: Remove libunwind-local
  perf unwind-libunwind: Add RISC-V libunwind support

 tools/build/feature/Makefile                  |  38 +-
 tools/build/feature/test-libunwind-aarch64.c  |  27 -
 tools/build/feature/test-libunwind-arm.c      |  28 -
 .../test-libunwind-debug-frame-aarch64.c      |  17 -
 .../feature/test-libunwind-debug-frame-arm.c  |  17 -
 .../feature/test-libunwind-debug-frame.c      |   1 -
 tools/build/feature/test-libunwind-x86.c      |  28 -
 tools/build/feature/test-libunwind-x86_64.c   |  28 -
 tools/build/feature/test-libunwind.c          |   1 -
 tools/perf/Makefile.config                    | 215 ++---
 tools/perf/arch/arm/util/Build                |   2 -
 tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
 tools/perf/arch/loongarch/util/Build          |   3 -
 .../arch/loongarch/util/unwind-libunwind.c    |  82 --
 tools/perf/arch/mips/Build                    |   1 -
 tools/perf/arch/mips/util/Build               |   1 -
 tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
 tools/perf/arch/powerpc/util/Build            |   1 -
 .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
 tools/perf/arch/x86/util/Build                |   3 -
 tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
 tools/perf/builtin-inject.c                   |   4 +
 tools/perf/builtin-report.c                   |   4 +
 tools/perf/builtin-script.c                   |   4 +
 tools/perf/util/Build                         |   5 +-
 tools/perf/util/libunwind-arch/Build          |  11 +
 .../perf/util/libunwind-arch/libunwind-arch.c | 319 +++++++
 .../perf/util/libunwind-arch/libunwind-arch.h | 296 +++++++
 .../perf/util/libunwind-arch/libunwind-arm.c  | 290 ++++++
 .../util/libunwind-arch/libunwind-arm64.c     | 289 ++++++
 .../perf/util/libunwind-arch/libunwind-i386.c | 312 +++++++
 .../util/libunwind-arch/libunwind-loongarch.c | 297 +++++++
 .../perf/util/libunwind-arch/libunwind-mips.c | 299 +++++++
 .../util/libunwind-arch/libunwind-ppc32.c     | 301 +++++++
 .../util/libunwind-arch/libunwind-ppc64.c     | 303 +++++++
 .../util/libunwind-arch/libunwind-riscv.c     | 297 +++++++
 .../perf/util/libunwind-arch/libunwind-s390.c | 299 +++++++
 .../util/libunwind-arch/libunwind-x86_64.c    | 320 +++++++
 tools/perf/util/libunwind/arm64.c             |  40 -
 tools/perf/util/libunwind/x86_32.c            |  41 -
 tools/perf/util/maps.c                        |  29 +-
 tools/perf/util/maps.h                        |   4 +-
 tools/perf/util/symbol_conf.h                 |  10 +
 tools/perf/util/thread.c                      |  29 +-
 tools/perf/util/unwind-libdw.c                |   2 +-
 tools/perf/util/unwind-libunwind-local.c      | 832 ------------------
 tools/perf/util/unwind-libunwind.c            | 679 ++++++++++++--
 tools/perf/util/unwind.c                      |  98 +++
 tools/perf/util/unwind.h                      |  77 +-
 51 files changed, 4549 insertions(+), 1732 deletions(-)
 delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-x86.c
 delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
 delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/mips/Build
 delete mode 100644 tools/perf/arch/mips/util/Build
 delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
 create mode 100644 tools/perf/util/libunwind-arch/Build
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.h
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm64.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-i386.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-loongarch.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-mips.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc32.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc64.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-riscv.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-s390.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-x86_64.c
 delete mode 100644 tools/perf/util/libunwind/arm64.c
 delete mode 100644 tools/perf/util/libunwind/x86_32.c
 delete mode 100644 tools/perf/util/unwind-libunwind-local.c
 create mode 100644 tools/perf/util/unwind.c

-- 
2.53.0.1213.gd9a14994de-goog


