Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE95F531CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 21:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WC42rxO3vze6geTOuCaNxW1QdNNevD/rxpiV7DhI8F0=; b=ZGzBa5b0/62QXjjHzu0hzvIDUo
	j5VdxFGmrZF+FDSv/kljKpF0Ju1LZZv/EH3jDOpfNxeOg59t/wpD7yYjXMpr0nPaZrOk//8uPfSSW
	fDM4jMBo2pCkQ3TazfsxOPqY1N/NjFOhy4vVbLkFJ3wgQJnx91PgQO61xaOdSAd9B3WJWPk8PzMPk
	xUSr4jHnnvrmS36izZxexBaQnfV/au7dVcyOm4es5B+7+4LJIT04xiXdoomtgdkX2prJQoM47GBEp
	nzfm5LSqUHVB1OWcjJsXL/cxnbyXiuTTqNWeN3qL9HCkP6dk10r8+SMLHnIc3msUVHEcaDFX/D6zR
	rbpbb41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCOPs-0000000GNZd-07Td;
	Mon, 13 Apr 2026 21:01:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCOPo-0000000GNYx-2Vz1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 21:01:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b243198058so415175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 14:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776114111; cv=none;
        d=google.com; s=arc-20240605;
        b=WCFkFhaL9PORALHcSy+qW90n3LRU3zK+d//nzLgUGLTqyBgvpJzPhLWZt7jlXXQUL5
         F8vzpkv55SyFefX5te0M/1ecDWdwjwmAPqvbb+KG3VJ07cLodqZuqRYudYdaBmQia08i
         UO9nN/W7PGuFdf8GCA6EsANldLTOq3M2YoBd8spM49oVnH+HUlFuVbwNCIDxonWCq3Ym
         oCF4en9qnk7gx49B5p6VTY0CEKxSVLQyfYTHIcjLz182uWx5kM+SA2kMckovdvsXBIqg
         z3s9lMMxqhFX3Bol9wUPW2eryivz7uEVb7+JyQCeqGHbvmXNWkTuFNGhRJ9JR6DcYFg6
         R/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WC42rxO3vze6geTOuCaNxW1QdNNevD/rxpiV7DhI8F0=;
        fh=dyhNjC7xiT38bwz+UJwC1JICU8YzPWybOesp0XLuCBQ=;
        b=OaBK0B4x/fxmvyCNVthzYEN9Pq5gO+fjgyjZhfcdnzpKNlwLKtj3x8TJL+9jbwCAKe
         x4ITMc5X0fsh8z//9clda/El5/UMnFPomWzvM1BCfWtJpvbfjRr6d2LvPCQq+NPqr25g
         Hih6nNB27iP5krLfcQHlSrTUgNFFlhC3dnS+5blWPeGH8FyaqgLTiW/fk6UGQsd1dmNZ
         Q3SbtDXeg/TO6eCkX+pRpr1kXhQHnQU0K2MIWP7JEVPRe3MtPtlE6qvMiilNBUUKjcTR
         uX2ZqnPiGu1y0RQ+apQMLX/x/Dun91K+WSOTmTVc55gB8oj2lOncFOMGG/zTSVkDxFSl
         wN0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776114111; x=1776718911; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WC42rxO3vze6geTOuCaNxW1QdNNevD/rxpiV7DhI8F0=;
        b=bx3XIOmJnUW1O3qMQwtPnhbkR182QUb0OXNljEXdKlcZkNiuU0sMPzSLtK25jiJbU6
         vug5JDmbDEB8jCjnn6pBvVEOTW3IK3OVk4WM61OYLwYIzi5LZyOXfhVDR5QZee8nMak1
         DLTc7Ma8QKezkF9gEjgDy+OgHQXZaYMG9FCDpJTwxsvbHVqfNGi9/4uBU+qUtiDqJWA7
         ZNQ5lE0v9XHbnEZb2/h7InffpRF1lk4lH5V/u9cmq9dfTVwbWgEGZNUWYy1SXlzt2GpC
         K6b6oYoAdDVUacc0haJUgZhCep5Xa7w10AHAPhpaqAxxVO+72wmLmc/RMzxJXK5PMomm
         /qaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776114111; x=1776718911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WC42rxO3vze6geTOuCaNxW1QdNNevD/rxpiV7DhI8F0=;
        b=QIdQxft2UvFdfJyIRnsEeUP7QUjYg/0Qfy463T141gUJ5raxM7HiO1mOZ+rEF2dCio
         7o/wdKQLJ8aFuoMEwgt0FrFX61h88ssBBjL/438iUgVbqLHTrMGh0R6PFFV5rPqnQDUI
         e+UHAyfdojzpS+S+czfGH9MZSbJHvUaamFvw1w3EthBR6Q0e0OHOvWpfiPBSRmGh3vpB
         y2six074mpzYwWxOrLUuazGkN68P3zU9NU2gC6s+5JFUSPdIlykbhLWItoFyqfCmD1vQ
         A8iqkdK6cjH5xxHzQlNTf+gVTWtL83VAJZbB0CaUSJxLzunOBt4LcgQV3y1IGG8mDqy+
         fh1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Mn27s8uaC0U7k5kdZVp69CoWJ+Guc0oj/hsLleS1k2Z/ODf5TNl3i+5UGinW37i7GDe34oNVnQPkEX3Tgzv4K@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5A+tfWZroFLMnWdDvJ+wfR6tKkkaqLBrsWck2FaVGdoPlw6Ht
	GxhHIpX5K4Dfy0x9aR3YRRqvuST+N0VBMVj/usqxVpbC3URyxYFhv65DblSi6UUZ9SH82JmYChH
	CDJ6z4Azc7+V2HhJxBATPYjrxPeyGRTROYlbK0E3p
X-Gm-Gg: AeBDiesGh9xRf/M3aKVIAJjG4wnLGaY7gBUOaCZ1XnRFbchOljhvbuwSX1cPvP94EmU
	HpXx+chVMq1w57AwAEapRyOpCSbV75dKXBst/NECAJj62Fx0OoL464G0lRcU0HL8RelMnxShhIu
	wQQF9AjjYHcFSaz+ysM3pKjHb2+z0awiT49L3FLEUWPVBcxzuReI/uLLg5DqUZzAxTjiSPCf5oD
	ztbwjGPmbsNXVGZXcur1HPnsBAoUEslnSMF+QBTG5BVamhicehN36f396l9cOSRAG3axf9DsePp
	ffLh1fj7sVLiApmH8UQaoVoHI+PayrCC9r43YnO7YuLBIq1eOR3N47XCG2Y=
X-Received: by 2002:a17:902:da8a:b0:2b4:5978:4caf with SMTP id
 d9443c01a7336-2b459785063mr4238255ad.4.1776114110197; Mon, 13 Apr 2026
 14:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <advv6twWCEVBo_Hc@x1> <20260413024805.1316480-1-irogers@google.com>
In-Reply-To: <20260413024805.1316480-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 13 Apr 2026 14:01:38 -0700
X-Gm-Features: AQROBzAuRGrI4uKYnZMOk3esVVqBEb2hWHXENTOlfcuxd81eG75b2IwGOrneAqc
Message-ID: <CAP-5=fW6pJWTW0zCHStuTNqvN8Q1FaVvRf_eqgB9RSK8xDDwbQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] perf libunwind multiple remote support
To: acme@kernel.org
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr, 
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com, 
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, blakejones@google.com, 
	ctshao@google.com, dapeng1.mi@linux.intel.com, howardchu95@gmail.com, 
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_140152_650542_3413CD1F 
X-CRM114-Status: GOOD (  26.90  )
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

On Sun, Apr 12, 2026 at 7:48=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Fix the libunwind build for when libdw and libunwind are feature
> detected, currently failing with a duplicate symbol.
>
> Refactor the libunwind support so that whenever a remote target is
> available, perf functions using the ELF machine can use that remote
> target regardless of what the host/local machine is. Migrate existing
> libunwind supported architectures like powerpc, arm64 and loongarch so
> that they can work in a cross-architecture way. Add support for
> RISC-V. Make the code more regular in function names, etc. and avoid
> including a C-file. This increases the lines of code. It is similar in
> style to the unwind-libdw implementation. It is hoped that the more
> uniform nature of the code with help with refactoring the perf
> registers for SIMD/APX support.
>
> Aside from local host testing these patches are under tested, in part
> as I'm failing to see how to build libunwind with support for multiple
> remote targets. Please could I get help in testing.

Hmm.. these were reposted in part for Sashiko reviews but that has failed:
https://sashiko.dev/#/log/baseline/9180/2
```
Trying baseline: perf-tools-next/perf-tools-next
(4e03d6494f9504f8af46ba68a2a8b6877c196789)
Patch 9180/4 (ID: 24748) failed to apply.
Application failed.
```
While my local tree shows that I have perf-tools-next plus these 8
patches. I'll wait a while, rebase and repost.

Thanks,
Ian

> v4: Rebase, in particular the zalloc->calloc change conflicted.
>
> v3: Minor whitespace clean up and warn when a dynamic choice of libdw
>     or libunwind is selected for unwinding and support is missing (Arnald=
o).
> https://lore.kernel.org/lkml/20260404054032.1538095-1-irogers@google.com/
>
> v2: Move two fixes patches to position 1 and 2 in the series. Fix
>     struct naming inconsistency, Andrew Jones
>     <andrew.jones@oss.qualcomm.com>. Fix other inconsistencies and
>     potential non-x86 build issues.
> https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/
>
> v1: https://lore.kernel.org/lkml/20260224142938.26088-1-irogers@google.co=
m/
>
> Ian Rogers (8):
>   perf unwind: Refactor get_entries to allow dynamic libdw/libunwind
>     selection
>   perf build loongarch: Remove reference to missing file
>   tools build: Deduplicate test-libunwind for different architectures
>   perf build: Be more programmatic when setting up libunwind variables
>   perf unwind-libunwind: Make libunwind register reading cross platform
>   perf unwind-libunwind: Move flush/finish access out of local
>   perf unwind-libunwind: Remove libunwind-local
>   perf unwind-libunwind: Add RISC-V libunwind support
>
>  tools/build/feature/Makefile                  |  38 +-
>  tools/build/feature/test-libunwind-aarch64.c  |  27 -
>  tools/build/feature/test-libunwind-arm.c      |  28 -
>  .../test-libunwind-debug-frame-aarch64.c      |  17 -
>  .../feature/test-libunwind-debug-frame-arm.c  |  17 -
>  .../feature/test-libunwind-debug-frame.c      |   1 -
>  tools/build/feature/test-libunwind-x86.c      |  28 -
>  tools/build/feature/test-libunwind-x86_64.c   |  28 -
>  tools/build/feature/test-libunwind.c          |   1 -
>  tools/perf/Makefile.config                    | 215 ++---
>  tools/perf/arch/arm/util/Build                |   2 -
>  tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
>  tools/perf/arch/arm64/util/Build              |   1 -
>  tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
>  tools/perf/arch/loongarch/util/Build          |   3 -
>  .../arch/loongarch/util/unwind-libunwind.c    |  82 --
>  tools/perf/arch/mips/Build                    |   1 -
>  tools/perf/arch/mips/util/Build               |   1 -
>  tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
>  tools/perf/arch/powerpc/util/Build            |   1 -
>  .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
>  tools/perf/arch/x86/util/Build                |   3 -
>  tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
>  tools/perf/builtin-inject.c                   |   4 +
>  tools/perf/builtin-report.c                   |   4 +
>  tools/perf/builtin-script.c                   |   4 +
>  tools/perf/util/Build                         |   5 +-
>  tools/perf/util/libunwind-arch/Build          |  11 +
>  .../perf/util/libunwind-arch/libunwind-arch.c | 319 +++++++
>  .../perf/util/libunwind-arch/libunwind-arch.h | 296 +++++++
>  .../perf/util/libunwind-arch/libunwind-arm.c  | 290 ++++++
>  .../util/libunwind-arch/libunwind-arm64.c     | 289 ++++++
>  .../perf/util/libunwind-arch/libunwind-i386.c | 312 +++++++
>  .../util/libunwind-arch/libunwind-loongarch.c | 297 +++++++
>  .../perf/util/libunwind-arch/libunwind-mips.c | 299 +++++++
>  .../util/libunwind-arch/libunwind-ppc32.c     | 301 +++++++
>  .../util/libunwind-arch/libunwind-ppc64.c     | 303 +++++++
>  .../util/libunwind-arch/libunwind-riscv.c     | 297 +++++++
>  .../perf/util/libunwind-arch/libunwind-s390.c | 299 +++++++
>  .../util/libunwind-arch/libunwind-x86_64.c    | 320 +++++++
>  tools/perf/util/libunwind/arm64.c             |  40 -
>  tools/perf/util/libunwind/x86_32.c            |  41 -
>  tools/perf/util/maps.c                        |  29 +-
>  tools/perf/util/maps.h                        |   4 +-
>  tools/perf/util/symbol_conf.h                 |  10 +
>  tools/perf/util/thread.c                      |  29 +-
>  tools/perf/util/unwind-libdw.c                |   2 +-
>  tools/perf/util/unwind-libunwind-local.c      | 831 ------------------
>  tools/perf/util/unwind-libunwind.c            | 679 ++++++++++++--
>  tools/perf/util/unwind.c                      |  98 +++
>  tools/perf/util/unwind.h                      |  77 +-
>  51 files changed, 4549 insertions(+), 1731 deletions(-)
>  delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
>  delete mode 100644 tools/build/feature/test-libunwind-arm.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch6=
4.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
>  delete mode 100644 tools/build/feature/test-libunwind-x86.c
>  delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
>  delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/mips/Build
>  delete mode 100644 tools/perf/arch/mips/util/Build
>  delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
>  create mode 100644 tools/perf/util/libunwind-arch/Build
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.h
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm64.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-i386.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-loongarch.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-mips.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc32.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc64.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-riscv.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-s390.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-x86_64.c
>  delete mode 100644 tools/perf/util/libunwind/arm64.c
>  delete mode 100644 tools/perf/util/libunwind/x86_32.c
>  delete mode 100644 tools/perf/util/unwind-libunwind-local.c
>  create mode 100644 tools/perf/util/unwind.c
>
> --
> 2.53.0.1213.gd9a14994de-goog
>

