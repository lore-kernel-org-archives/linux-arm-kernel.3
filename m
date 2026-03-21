Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AB51094481
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 23:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTqCrTpO7xpe1pD5iEi4pz4O5z12UvBG8QJ70CExaM8=; b=tOQrmgQ/jad3yfBO+kvx8YDyFV
	Uu5wFno9jD8qKw0Ee6c3e8BtDSy7PTWiP+RdtCYGd9262/0kpZEEw0ldeCscMkms7St6IfIoLzLis
	uKJOWKhjxXXRKm3FsHPmMXbw0owZO+HPU5B8LGsXZIJ4/IbUyz0UPZNEdPFhgWZIvFJ3TCyxxiC4K
	KLh4xhxboZyM2FvhCgL+T22u/0bVtsmAXoF25kJkkHojk7I97him92vAETR+7ML1AT1/GUytfucJi
	Q/He8pu8f+sbSaUTbkSRPo0F8GUibsYU966YIhstG5E/1ZobeaLcqir8rKjphF3091mk9UdxpbmEg
	q6lg8qRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w45xb-0000000Esof-3060;
	Sat, 21 Mar 2026 23:42:27 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w45xZ-0000000Esn4-0VvI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 23:42:26 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2c0bddb9196so1822022eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 16:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774136543; x=1774741343; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oTqCrTpO7xpe1pD5iEi4pz4O5z12UvBG8QJ70CExaM8=;
        b=mWFiwhqgz0OQ6gfLuM85UBrzD8tLs070adv13+1RuZLKOScxI01VjVhRojcjTOTD/g
         aBhr9HAJz6LTq6jDRg7pXaGGcK1IL7iD+H21Ur6xDbg253u8CQPoFGhBkzvBqbi/ym8G
         INj0CbfsDpK/hOjhnXihKKNhnU7hsDU0lYtFf3agjvVTA3f6//wrTDL8K5wChSiohook
         lF7lP4T5/DPnTZy5a5YzCedcOzM2Il7dYBx40mLI6BTTs311ZKonX7uiYvcJXFdX3Q65
         IfcJvPNsBC8FyCiBSGmjRnWyJxFKyj6q9ouODaf0ZGyXA8U0GidsbYN8Dr//8OSEG/5X
         Mp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774136543; x=1774741343;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTqCrTpO7xpe1pD5iEi4pz4O5z12UvBG8QJ70CExaM8=;
        b=s1L2Z9SS3Bo6AzJkMq/uyqo1f/t3u11r9Qw8xTGPEoXF6llarI4AZi2Dj+L8OarSYz
         ODlDwi2kM3IgqS3xPcmn6kM3tPB9w04+NihG/DG27DlIooZSyUyc/BpLdMDfcFV1RitN
         mWtBNYhWBcFQqZZIereNvtY1ElnazQmhhdlt5xn7cv/hnPByXW6gP8GP6+XEmg97oK5X
         YfjEKA9k7NSzdAwLH2E16OzIp6BVDGMhKmSXuiW/SvfPgSUFGzymAtzfeS9RQZs0iT6Z
         I2KPCt3mXXtFbw7G9BQKC6B18INU5B4Wi4Ammv4ZqShnYJQ9JvCLZ5I9+HCViSGnz4OB
         j2Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWlERbbOPTy/nq5rZuSy+yVne9KtRbgAQFzkKE8JDD5mQ4zn7uHmfRZWJqzhYwjK+vwysl85NogzTXoxBtpcayN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3s5jbejaknDm1H3Mm83mTLyzqqqcweWah9gdkbBlzIMA9pNIY
	yPcTk1pvw6lP+bkQASlofwoltVIA04ytEi/8QPpsYlLqvknMeYRzOHNAT1ICc9VLM+NaMFysFS/
	i79crATdoZA==
X-Received: from dykh34.prod.google.com ([2002:a05:7300:5722:b0:2be:70ac:88ad])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:5721:b0:2b7:a27f:3a6a
 with SMTP id 5a478bee46e88-2c109566b73mr3437476eec.4.1774136543007; Sat, 21
 Mar 2026 16:42:23 -0700 (PDT)
Date: Sat, 21 Mar 2026 16:42:18 -0700
In-Reply-To: <abxs-2rozL1tBEO1@google.com>
Mime-Version: 1.0
References: <abxs-2rozL1tBEO1@google.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260321234220.848859-1-irogers@google.com>
Subject: [PATCH v1 0/2] perf build: Remove libunwind support
From: Ian Rogers <irogers@google.com>
To: namhyung@kernel.org
Cc: 9erthalion6@gmail.com, acme@kernel.org, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, irogers@google.com, james.clark@linaro.org, 
	john.g.garry@oracle.com, jolsa@kernel.org, leo.yan@linux.dev, 
	libunwind-devel@nongnu.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, mingo@redhat.com, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, amadio@gentoo.org, 
	yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_164225_155337_238DA18C 
X-CRM114-Status: GOOD (  14.11  )
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

libunwind support exists for "--call-graph dwarf", however, libunwind
support has been opt-in rather than opt-out since Linux v6.13 as libdw
is preferred - commit 13e17c9ff49119aa ("perf build: Make libunwind
opt-in rather than opt-out"). A problem with the libdw support was
that it was slow, an issue fixed in Linux v7.0 in commit 6b2658b3f36a
("perf unwind-libdw: Don't discard loaded ELF/DWARF after every
unwind"). As such libunwind support is now unnecessary.

The patch series:
https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/
looked to make the libunwind support in perf similar to the libdw
support, allow cross-architecture unwinding, etc. This was motivated
by the perf regs conventions being altered by the addition of x86 APX
support:
https://lore.kernel.org/lkml/20260209072047.2180332-1-dapeng1.mi@linux.intel.com/
It is necessary to translate the library's notion of registers to the
perf register convention so that the stack unwinding state can be
initialized. On this series it was stated that removing libunwind
support from perf should be an option, rather than updating support:
https://lore.kernel.org/lkml/abxs-2rozL1tBEO1@google.com/
This was also what motivated making libunwind opt-in rather than
opt-out.

Given that 7 minor releases have happened with libunwind "deprecated"
by making it opt-in, let's remove the libunwind support. There doesn't
appear to be any disagreement to this on the mailing list.

Ian Rogers (2):
  perf build: Remove libunwind support
  tools build: Remove libunwind feature tests

 tools/build/feature/Makefile                  |  31 -
 tools/build/feature/test-libunwind-aarch64.c  |  27 -
 tools/build/feature/test-libunwind-arm.c      |  28 -
 .../test-libunwind-debug-frame-aarch64.c      |  17 -
 .../feature/test-libunwind-debug-frame-arm.c  |  17 -
 .../feature/test-libunwind-debug-frame.c      |  17 -
 tools/build/feature/test-libunwind-x86.c      |  28 -
 tools/build/feature/test-libunwind-x86_64.c   |  28 -
 tools/build/feature/test-libunwind.c          |  28 -
 tools/perf/Documentation/perf-check.txt       |   1 -
 tools/perf/Documentation/perf-config.txt      |   4 +-
 tools/perf/Documentation/perf-record.txt      |   2 +-
 tools/perf/Makefile.config                    | 163 +---
 tools/perf/Makefile.perf                      |   3 -
 tools/perf/arch/arm/util/Build                |   1 -
 tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
 tools/perf/arch/loongarch/util/Build          |   1 -
 .../arch/loongarch/util/unwind-libunwind.c    |  82 --
 tools/perf/arch/mips/util/Build               |   1 -
 tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
 tools/perf/arch/powerpc/util/Build            |   1 -
 .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
 tools/perf/arch/x86/util/Build                |   1 -
 tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
 tools/perf/builtin-check.c                    |   1 -
 tools/perf/builtin-report.c                   |   4 +-
 tools/perf/tests/make                         |   2 -
 tools/perf/util/Build                         |   5 -
 tools/perf/util/callchain.c                   |   2 +-
 tools/perf/util/dso.h                         |   6 -
 tools/perf/util/libunwind/arm64.c             |  40 -
 tools/perf/util/libunwind/x86_32.c            |  41 -
 tools/perf/util/maps.c                        |  47 +-
 tools/perf/util/maps.h                        |   6 -
 tools/perf/util/thread.c                      |  40 +-
 tools/perf/util/thread.h                      |   1 -
 tools/perf/util/unwind-libunwind-local.c      | 832 ------------------
 tools/perf/util/unwind-libunwind.c            |  92 --
 tools/perf/util/unwind.h                      |  41 +-
 41 files changed, 19 insertions(+), 1919 deletions(-)
 delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame.c
 delete mode 100644 tools/build/feature/test-libunwind-x86.c
 delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
 delete mode 100644 tools/build/feature/test-libunwind.c
 delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
 delete mode 100644 tools/perf/util/libunwind/arm64.c
 delete mode 100644 tools/perf/util/libunwind/x86_32.c
 delete mode 100644 tools/perf/util/unwind-libunwind-local.c
 delete mode 100644 tools/perf/util/unwind-libunwind.c

-- 
2.53.0.959.g497ff81fa9-goog


