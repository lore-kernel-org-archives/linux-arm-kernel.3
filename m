Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC46CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 02:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I51d2M6Nb8gDRIel/ILjTKh0DzQqG02tg1ivGr+O7F0=; b=ghSnxaDsa33jaD
	Z+TqzF9J+ZCNuTB6PAiwR1TR3wolVu6WgNILv7f1CpnhaaHVC6ZtJQrJs+1ePZcf04VKMbt9x68cW
	GtTP8twXhbwP2yn5ZMdjK/aZuvXdJhPxr0iwJY1rc4T/RtcHUAEsk/2FauE6rzdoG4N6eLqgijoqL
	lURtNqsbJJmGwtx7QzoBQbKT+MWGVuyNpHVbFciTsDnY/kormbn/jknp8GwSz4kI1tit5r7DhbfYs
	GK6Lyhy1+77zJn3wUKhI80Xa51A5lvlL5+HsDUVmrVTC1r58wrFxoAH4Ssp/rR41m9MIYQuy8857y
	l1RZ5gv3Y811td7yMQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tViQp-0000000ASp1-2FGp;
	Thu, 09 Jan 2025 02:37:59 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tViPT-0000000AS9x-2qf2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 02:36:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21628b3fe7dso5552695ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 18:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736390194; x=1736994994; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I51d2M6Nb8gDRIel/ILjTKh0DzQqG02tg1ivGr+O7F0=;
        b=vdB4Y5WSCBsoP/sLAS1Egt9DmPtgCBmGZNno5YeHnyF/gzdaRIA681p+kdpyeMSuOM
         yRlT4IocT+kpzxVXXt0jAocr3kqYJYSdb6FS/q+5VuOZictPvdaPyyYrNLzIdzymP9lq
         M/SXGV41MOW12PRX42q+M7OZf9zhUeMoto2pqHRjHh5VWzBwen+RLyshryIYyS8Jhqjz
         BceKB2EcSyKuo4GFPWfklSgdaORwePyP8tABZpSRkYIUP8lOM3TxvOm+csTUQ0/5W4w3
         a0Qwpv8AZ0JQtv04gDzppwhYS/Xap5Y63BOlL9OD1cPqV7hXVi+X4hQGNiXwiAYWMPz+
         /0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736390194; x=1736994994;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I51d2M6Nb8gDRIel/ILjTKh0DzQqG02tg1ivGr+O7F0=;
        b=qNh0nVrjX+MUBhARkwVkOHmLwrCBgtmG6VXw4DJB8+wwNTgXtSyibw6aVuku0Z82cA
         FuoDk3sY19MEJFEjU9kuRFGNx2mM3mnZDio66qeKicG5kiA3Gz9cBua2Jvjqz3PJdukG
         1Z3eRk174aIZ5jzD4et0GrdbrA7TYHDDGofaNuTiSMBeGyZ4sr7RywEzAGwLiYOPFs32
         EzabvjrS9QKKxo4G2ts+ucvXb8unQBH1F+nJXZfXMW4BlAhPeQ/hI5HkusAV82TU/Tsu
         OvePlkhEm2gXxdmWwXtEZztMIT9obOU5ASdoMuKXYwKeDEFyjfOYoaVY58tsn2Vx6G/V
         tNqA==
X-Forwarded-Encrypted: i=1; AJvYcCUkhZQOtP5TwccZyANnzScg3GtrOykgFkgx3XWPbl5rWI75Y86moQXWq8G9MOGwFGHg/G9ghzHCOe8EbKrXvBfS@lists.infradead.org
X-Gm-Message-State: AOJu0YzzEdSCa50DPVRf6HFWlXqMfPeHI00TRKZMk3T3Pnu3VRh85+ax
	ChCj+nlhHSD/KOo0KrgYnusM9VuGxs0k9j7DL1Zk4TAVjLijwt0t/Z9RNp2bt80=
X-Gm-Gg: ASbGncuENMnpD0C7Y5lVEoOA93XmCiA+rUTINDoZhNe64n1GeKCN+GR/RbWdCZ7AFIi
	1lGoUYJlQJvM/yoGF5Rk7aLTiZQzwKOgWrxoKMzNCNmshaLs3LcvAmUtyEHqsbi5vvoZ//G/hn+
	D9MrItGJfg0lrkZU3AQFNbTGMj+Dunn9MEiq+82t/nus4x4Jk9E+5OFdY49exSpnHfZyDwX6bQY
	nrWLqohmkvmsiRYURw+SriVIdqPQK9E56IFAtyzJzWyk4ad+znuH53v7PxasnwiP+DX3x40
X-Google-Smtp-Source: AGHT+IGU+EnNkPh98/eCTOoUpYdnqQoIm/f07npTqwzUXHUHY5XONu6jNV9WUSNgnodrupj5bSX8pw==
X-Received: by 2002:a17:903:32ce:b0:215:b8c6:338a with SMTP id d9443c01a7336-21a83f338a5mr70718545ad.4.1736390194573;
        Wed, 08 Jan 2025 18:36:34 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9176bed6sm1434365ad.12.2025.01.08.18.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 18:36:33 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Date: Wed, 08 Jan 2025 18:36:15 -0800
Message-Id: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB82f2cC/23QTWrDMBAF4KsErauif0td9R4lBEWaaQSuHaQgG
 oLvXtlQGiov38B885gHKZATFPJ2eJAMNZU0Ty2YlwMJFz99Ak2xZSKYUMxxSa+Q8VTuJfhxvJ1
 HatDZCBiCQU3a1jUDpu9N/Di2fEnlNuf7dqDydbpZnDPVWZVTRp2PHnQYDAd8z6nOJU3hNcxfZ
 OWq+CMEFz0hGoE2eGcVIii2Q8hnwvSEbISQDpkUyvKodwj1TNieUI04h1YDUARvYYfQv4RmnA0
 9oddfSB1BmSj58L/Fsiw/njqytL0BAAA=
X-Change-ID: 20240913-perf_syscalltbl-6f98defcc6f5
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8708; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=CkN9zgjRYdK6ib1BGk/wy0hvCiY7z/m6EKqbAny7MMs=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3q9mbLN79t3tHVE2S69aJC4rfdJ4exTXaEdBy00BI+qZ
 J1apHSoo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIn80WT4H71eaMW0BTu5zj7c
 xsMRe/P90tk2ixizrvbVC83/qtB/U5uRYTbvHm/etoVPPnN8NrFjDf6lHLaNI31vWPoM6aM/mF/
 pMAEA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_183635_724175_7E584EF2 
X-CRM114-Status: GOOD (  16.00  )
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

Standardize the generation of syscall headers around syscall tables.
Previously each architecture independently selected how syscall headers
would be generated, or would not define a way and fallback onto
libaudit. Convert all architectures to use a standard syscall header
generation script and allow each architecture to override the syscall
table to use if they do not use the generic table.

As a result of these changes, no architecture will require libaudit, and
so the fallback case of using libaudit is removed by this series.

Testing:

I have tested that the syscall mappings of id to name generation works
as expected for every architecture, but I have only validated that perf
trace compiles and runs as expected on riscv, arm64, and x86_64.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Tested-by: Ian Rogers <irogers@google.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>

---
Changes in v6:
- Use tools/build/Build.include instead of scripts/Kbuild.include
- Link to v5: https://lore.kernel.org/r/20250107-perf_syscalltbl-v5-0-935de46d3175@rivosinc.com

Changes in v5:
- Remove references to HAVE_SYSCALL_TABLE_SUPPORT that were
  missed/recently introduced
- Rebase on perf-tools-next
- Install headers to $(OUTPUT)arch instead of $(OUTPUT)tools/perf/arch
- Link to v4: https://lore.kernel.org/r/20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com

Changes in v4:
- Remove audit_machine member of syscalltbl struct (Ian)
- Rebase on perf-tools-next
- Link to v3: https://lore.kernel.org/r/20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com

Changes in v3:
- Fix compiliation when OUTPUT is empty
- Correct unused headers to be .h instead of .c  (Namhyung)
- Make variable definition of supported archs (Namhyung)
- Convert += into := for syscalls headers (Namhyung)
- Link to v2: https://lore.kernel.org/r/20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com

Changes in v2:
- Rebase onto 6.13-rc2
- Fix output path so it generates to /tools/perf/arch properly
- Link to v1: https://lore.kernel.org/r/20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com

---
Charlie Jenkins (16):
      perf tools: Create generic syscall table support
      perf tools: arc: Support generic syscall headers
      perf tools: csky: Support generic syscall headers
      perf tools: arm: Support syscall headers
      perf tools: sh: Support syscall headers
      perf tools: sparc: Support syscall headers
      perf tools: xtensa: Support syscall header
      perf tools: x86: Use generic syscall scripts
      perf tools: alpha: Support syscall header
      perf tools: parisc: Support syscall header
      perf tools: arm64: Use syscall table
      perf tools: loongarch: Use syscall table
      perf tools: mips: Use generic syscall scripts
      perf tools: powerpc: Use generic syscall table scripts
      perf tools: s390: Use generic syscall table scripts
      perf tools: Remove dependency on libaudit

 Documentation/admin-guide/workload-tracing.rst     |   2 +-
 tools/build/Build.include                          |   2 +
 tools/build/feature/Makefile                       |   4 -
 tools/build/feature/test-libaudit.c                |  11 -
 tools/perf/Documentation/perf-check.txt            |   2 -
 tools/perf/Makefile.config                         |  39 +-
 tools/perf/Makefile.perf                           |  12 +-
 tools/perf/arch/alpha/entry/syscalls/Kbuild        |   2 +
 .../arch/alpha/entry/syscalls/Makefile.syscalls    |   5 +
 tools/perf/arch/alpha/entry/syscalls/syscall.tbl   | 504 ++++++++++++++++++++
 tools/perf/arch/alpha/include/syscall_table.h      |   2 +
 tools/perf/arch/arc/entry/syscalls/Kbuild          |   2 +
 .../perf/arch/arc/entry/syscalls/Makefile.syscalls |   3 +
 tools/perf/arch/arc/include/syscall_table.h        |   2 +
 tools/perf/arch/arm/entry/syscalls/Kbuild          |   4 +
 .../perf/arch/arm/entry/syscalls/Makefile.syscalls |   2 +
 tools/perf/arch/arm/entry/syscalls/syscall.tbl     | 483 +++++++++++++++++++
 tools/perf/arch/arm/include/syscall_table.h        |   2 +
 tools/perf/arch/arm64/Makefile                     |  22 -
 tools/perf/arch/arm64/entry/syscalls/Kbuild        |   3 +
 .../arch/arm64/entry/syscalls/Makefile.syscalls    |   6 +
 tools/perf/arch/arm64/entry/syscalls/mksyscalltbl  |  46 --
 .../perf/arch/arm64/entry/syscalls/syscall_32.tbl  | 476 +++++++++++++++++++
 .../perf/arch/arm64/entry/syscalls/syscall_64.tbl  |   1 +
 tools/perf/arch/arm64/include/syscall_table.h      |   8 +
 tools/perf/arch/csky/entry/syscalls/Kbuild         |   2 +
 .../arch/csky/entry/syscalls/Makefile.syscalls     |   3 +
 tools/perf/arch/csky/include/syscall_table.h       |   2 +
 tools/perf/arch/loongarch/Makefile                 |  22 -
 tools/perf/arch/loongarch/entry/syscalls/Kbuild    |   2 +
 .../loongarch/entry/syscalls/Makefile.syscalls     |   3 +
 .../arch/loongarch/entry/syscalls/mksyscalltbl     |  45 --
 tools/perf/arch/loongarch/include/syscall_table.h  |   2 +
 tools/perf/arch/mips/entry/syscalls/Kbuild         |   2 +
 .../arch/mips/entry/syscalls/Makefile.syscalls     |   5 +
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  32 --
 tools/perf/arch/mips/include/syscall_table.h       |   2 +
 tools/perf/arch/parisc/entry/syscalls/Kbuild       |   3 +
 .../arch/parisc/entry/syscalls/Makefile.syscalls   |   6 +
 tools/perf/arch/parisc/entry/syscalls/syscall.tbl  | 463 +++++++++++++++++++
 tools/perf/arch/parisc/include/syscall_table.h     |   8 +
 tools/perf/arch/powerpc/Makefile                   |  25 -
 tools/perf/arch/powerpc/entry/syscalls/Kbuild      |   3 +
 .../arch/powerpc/entry/syscalls/Makefile.syscalls  |   6 +
 .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  |  39 --
 tools/perf/arch/powerpc/include/syscall_table.h    |   8 +
 tools/perf/arch/riscv/Makefile                     |  22 -
 tools/perf/arch/riscv/entry/syscalls/Kbuild        |   2 +
 .../arch/riscv/entry/syscalls/Makefile.syscalls    |   4 +
 tools/perf/arch/riscv/entry/syscalls/mksyscalltbl  |  47 --
 tools/perf/arch/riscv/include/syscall_table.h      |   8 +
 tools/perf/arch/s390/Makefile                      |  21 -
 tools/perf/arch/s390/entry/syscalls/Kbuild         |   2 +
 .../arch/s390/entry/syscalls/Makefile.syscalls     |   5 +
 tools/perf/arch/s390/entry/syscalls/mksyscalltbl   |  32 --
 tools/perf/arch/s390/include/syscall_table.h       |   2 +
 tools/perf/arch/sh/entry/syscalls/Kbuild           |   2 +
 .../perf/arch/sh/entry/syscalls/Makefile.syscalls  |   4 +
 tools/perf/arch/sh/entry/syscalls/syscall.tbl      | 472 +++++++++++++++++++
 tools/perf/arch/sh/include/syscall_table.h         |   2 +
 tools/perf/arch/sparc/entry/syscalls/Kbuild        |   3 +
 .../arch/sparc/entry/syscalls/Makefile.syscalls    |   5 +
 tools/perf/arch/sparc/entry/syscalls/syscall.tbl   | 514 +++++++++++++++++++++
 tools/perf/arch/sparc/include/syscall_table.h      |   8 +
 tools/perf/arch/x86/Build                          |   1 -
 tools/perf/arch/x86/Makefile                       |  25 -
 tools/perf/arch/x86/entry/syscalls/Kbuild          |   3 +
 .../perf/arch/x86/entry/syscalls/Makefile.syscalls |   6 +
 tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   |  42 --
 tools/perf/arch/x86/include/syscall_table.h        |   8 +
 tools/perf/arch/xtensa/entry/syscalls/Kbuild       |   2 +
 .../arch/xtensa/entry/syscalls/Makefile.syscalls   |   4 +
 tools/perf/arch/xtensa/entry/syscalls/syscall.tbl  | 439 ++++++++++++++++++
 tools/perf/arch/xtensa/include/syscall_table.h     |   2 +
 tools/perf/builtin-check.c                         |   2 -
 tools/perf/builtin-help.c                          |   2 -
 tools/perf/builtin-trace.c                         |  30 --
 tools/perf/check-headers.sh                        |   9 +
 tools/perf/perf.c                                  |   6 +-
 tools/perf/scripts/Makefile.syscalls               |  61 +++
 tools/perf/scripts/syscalltbl.sh                   |  86 ++++
 tools/perf/tests/make                              |   7 +-
 tools/perf/util/env.c                              |   6 +-
 tools/perf/util/generate-cmdlist.sh                |   4 +-
 tools/perf/util/syscalltbl.c                       |  90 +---
 tools/perf/util/syscalltbl.h                       |   1 -
 tools/scripts/syscall.tbl                          | 409 ++++++++++++++++
 87 files changed, 4105 insertions(+), 623 deletions(-)
---
base-commit: 034b5b147bf7f44a45e39334725f8633b7ca8c3b
change-id: 20240913-perf_syscalltbl-6f98defcc6f5
-- 
- Charlie


