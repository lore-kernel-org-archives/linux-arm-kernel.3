Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AD1E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 19:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7b+M8bLdxMMDXL0txEk2e29RoPCEkK7c4yJCv5CXWo=; b=lbD4go6tibsgb6nZbrITpIqxki
	aRauMcSFlw5tn9WFEXq63ddQWnL7L2pbG6PsQTHzz0v/ugqBixsKiQZJh8WRBxo/jxjbZwA5+RJ/X
	7/X7AmdOaXfzHbCt6K6cXokskkBMrILsKG/ksfi7kGH4ulUdathFKKZUWczWnSyrS/zwjP20X5ZX9
	eO3WQtnUzTKG1CWrADtk7oVIcgu7829JRJGKImbA51q9y43nYrXGImee3cO3HN4NNeG9Bmd30RRp0
	k30GdiKn6vc0RmFdu99p2YO1PLzkzs+BM8M+FmOwEAVAckyCRDCSll/ewGlDfeghFsd+bLPmZWfHr
	65PyHbXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyYb-0000000D9qe-1K1q;
	Thu, 09 Jan 2025 19:51:05 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyWH-0000000D9Bn-350r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 19:48:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21a1e6fd923so28316305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 11:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736452121; x=1737056921; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H7b+M8bLdxMMDXL0txEk2e29RoPCEkK7c4yJCv5CXWo=;
        b=zgrh/RSUU1bbqBA7CNes+jVV4gNLgqKA7Uy/F2UFZ9pBzrSkx4t9gAX6G3BOPiFB6y
         74jAxB6RvWbbXqa8Z9C6+D6KNW506mJrkPToy24e+sex7MkRJ33BHRsi95aX/cIovEMb
         BoYtvCFi6KJYvQPfv94XabFVA9Vv53HI4gBkUOMG5HLmRb1g/oPtBoQaY6a039y+5S2W
         Eu1tk20k+m2kyGXHWFZ+lCStF9CaWujTMm7T2v2np1GxF2h71yRCAH16pelQjHWy1BxG
         DBMPAwwgQyGFIgFDGYWW8S3Nl1JI7NkCwn+QHgqaxLXtGkJQ9H+qkQFrpa2IxmHfduvb
         ewrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736452121; x=1737056921;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7b+M8bLdxMMDXL0txEk2e29RoPCEkK7c4yJCv5CXWo=;
        b=nQkMq71KFoVfe+hh2pcf8lQp+ht1Hsml5Dm4ATuk38Adi/v/ZlBJ8GGFv5JnmjgUf8
         XF6fyRUXY0O+l2I23xIuXedB/iWcwKawgQmplTvxTEQpODh42jHnlghPi7PdlsFafDfo
         8WB3lIM7sSiw/hLKGVZA58NmPjIy8oO5k/UvVSDKQ6BkM/kMZybh/xiblD+CwACaMB3O
         hB8fg1wl86NyqMby6tsbmqpIApbIcDn1fKkcxNlAoRUMN/YDmf0hwdZ4eldufVZ2ysIA
         wbC0SmJz4gmw7feFrTmbhI3byhCKPSJKOzzwJcDAw8VPtAmnpja1Rp5NVg4KCv2/JUGE
         Pi+A==
X-Forwarded-Encrypted: i=1; AJvYcCV64gPAMaIy746LWGPDuLcLGqRQnhgxVk4vfLazfkb30P6VkL9aeKzOAVeqIwIOG85awRaCDVdTNCWTGFP+8Bym@lists.infradead.org
X-Gm-Message-State: AOJu0YwZoIt3qboPTz1rgNg2McTc/PPpel0C5QAcuOGZce6xjr1CpIW1
	/UjI1NICstC314fHJiYieBocbe/eWPulj4n7XXAFnn3jhkvYXxkDeWVoGjxt1MU=
X-Gm-Gg: ASbGncufsRtDNdzs/IL8J09Xi/0hVn1qirIDdAYa7ciWg72epd2rviJQdyKVuVCirlR
	PmAH/usoZu4ajd3msIbUY2lvlmzLKWHYTyFbtpRPOCVNgB2MReOdA1pgnVrmDf7q7uIiOVk9OhV
	SVC2G3psABI5NVvUoH81VkcGAG6eUt47sJHkYV+uhMlriKZEg2CYt00SUbdmNQm6+ORQFk/RhSd
	5kebQWk+2IGDBpt1k6vOwhH6DsMzFjNWo7iido1P34vStSwTWvx
X-Google-Smtp-Source: AGHT+IGqjTKjlwbC+P7rH4jnmptwQdrncdhIeRy9Z8irsAs8dzgv7ivzqLDAR+d7hQV4K4lcyKluyg==
X-Received: by 2002:a17:902:f70f:b0:216:32ea:c84b with SMTP id d9443c01a7336-21a83fc3652mr126858965ad.37.1736452120766;
        Thu, 09 Jan 2025 11:48:40 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f13c92dsm1606215ad.97.2025.01.09.11.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 11:48:39 -0800 (PST)
Date: Thu, 9 Jan 2025 11:48:36 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z4AoFA974kauIJ9T@ghost>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3_ybwWW3QZvJ4V6@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_114842_050302_B529208F 
X-CRM114-Status: GOOD (  28.68  )
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

On Thu, Jan 09, 2025 at 12:59:43PM -0300, Arnaldo Carvalho de Melo wrote:
> On Wed, Jan 08, 2025 at 06:36:15PM -0800, Charlie Jenkins wrote:
> > Standardize the generation of syscall headers around syscall tables.
> > Previously each architecture independently selected how syscall headers
> > would be generated, or would not define a way and fallback onto
> > libaudit. Convert all architectures to use a standard syscall header
> > generation script and allow each architecture to override the syscall
> > table to use if they do not use the generic table.
> > 
> > As a result of these changes, no architecture will require libaudit, and
> > so the fallback case of using libaudit is removed by this series.
> > 
> > Testing:
> > 
> > I have tested that the syscall mappings of id to name generation works
> > as expected for every architecture, but I have only validated that perf
> > trace compiles and runs as expected on riscv, arm64, and x86_64.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Ian Rogers <irogers@google.com>
> > Tested-by: Ian Rogers <irogers@google.com>
> > Acked-by: Namhyung Kim <namhyung@kernel.org>
> > 
> > ---
> > Changes in v6:
> > - Use tools/build/Build.include instead of scripts/Kbuild.include
> > - Link to v5: https://lore.kernel.org/r/20250107-perf_syscalltbl-v5-0-935de46d3175@rivosinc.com
> 
> Passed these, so far, more tests underway:
> 
> ⬢ [acme@toolbox perf-tools-next]$ git log --oneline -1 ; time make -C tools/perf build-test
> d06826160a982494 (HEAD -> perf-tools-next) perf tools: Remove dependency on libaudit
> make: Entering directory '/home/acme/git/perf-tools-next/tools/perf'
> - tarpkg: ./tests/perf-targz-src-pkg .
>                  make_static: cd . && make LDFLAGS=-static NO_PERF_READ_VDSO32=1 NO_PERF_READ_VDSOX32=1 NO_JVMTI=1 NO_LIBTRACEEVENT=1 NO_LIBELF=1 -j28  DESTDIR=/tmp/tmp.JJT3tvN7bV
>               make_with_gtk2: cd . && make GTK2=1 -j28  DESTDIR=/tmp/tmp.BF53V2qpl3
> - /home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP: cd . && make FEATURE_DUMP_COPY=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP  feature-dump
> cd . && make FEATURE_DUMP_COPY=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP feature-dump
>          make_no_libbionic_O: cd . && make NO_LIBBIONIC=1 FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.KZuQ0q2Vs6 DESTDIR=/tmp/tmp.0sxMyH91gS
>            make_util_map_o_O: cd . && make util/map.o FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.Y0Mx3KLREI DESTDIR=/tmp/tmp.wg9HCVVLHE
>               make_install_O: cd . && make install FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.P0LEBAkW1X DESTDIR=/tmp/tmp.agTavZndFN
>   failed to find: etc/bash_completion.d/perf

Is this something introduced by this patch?

- Charlie

>          make_no_libpython_O: cd . && make NO_LIBPYTHON=1 FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.AQ4uSxhHzq DESTDIR=/tmp/tmp.SyRIMEwTpJ
>          make_refcnt_check_O: cd . && make EXTRA_CFLAGS=-DREFCNT_CHECKING=1 FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.boLQpo3gGR DESTDIR=/tmp/tmp.pvNzMWlMJP
>  
> > Changes in v5:
> > - Remove references to HAVE_SYSCALL_TABLE_SUPPORT that were
> >   missed/recently introduced
> > - Rebase on perf-tools-next
> > - Install headers to $(OUTPUT)arch instead of $(OUTPUT)tools/perf/arch
> > - Link to v4: https://lore.kernel.org/r/20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com
> > 
> > Changes in v4:
> > - Remove audit_machine member of syscalltbl struct (Ian)
> > - Rebase on perf-tools-next
> > - Link to v3: https://lore.kernel.org/r/20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com
> > 
> > Changes in v3:
> > - Fix compiliation when OUTPUT is empty
> > - Correct unused headers to be .h instead of .c  (Namhyung)
> > - Make variable definition of supported archs (Namhyung)
> > - Convert += into := for syscalls headers (Namhyung)
> > - Link to v2: https://lore.kernel.org/r/20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com
> > 
> > Changes in v2:
> > - Rebase onto 6.13-rc2
> > - Fix output path so it generates to /tools/perf/arch properly
> > - Link to v1: https://lore.kernel.org/r/20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com
> > 
> > ---
> > Charlie Jenkins (16):
> >       perf tools: Create generic syscall table support
> >       perf tools: arc: Support generic syscall headers
> >       perf tools: csky: Support generic syscall headers
> >       perf tools: arm: Support syscall headers
> >       perf tools: sh: Support syscall headers
> >       perf tools: sparc: Support syscall headers
> >       perf tools: xtensa: Support syscall header
> >       perf tools: x86: Use generic syscall scripts
> >       perf tools: alpha: Support syscall header
> >       perf tools: parisc: Support syscall header
> >       perf tools: arm64: Use syscall table
> >       perf tools: loongarch: Use syscall table
> >       perf tools: mips: Use generic syscall scripts
> >       perf tools: powerpc: Use generic syscall table scripts
> >       perf tools: s390: Use generic syscall table scripts
> >       perf tools: Remove dependency on libaudit
> > 
> >  Documentation/admin-guide/workload-tracing.rst     |   2 +-
> >  tools/build/Build.include                          |   2 +
> >  tools/build/feature/Makefile                       |   4 -
> >  tools/build/feature/test-libaudit.c                |  11 -
> >  tools/perf/Documentation/perf-check.txt            |   2 -
> >  tools/perf/Makefile.config                         |  39 +-
> >  tools/perf/Makefile.perf                           |  12 +-
> >  tools/perf/arch/alpha/entry/syscalls/Kbuild        |   2 +
> >  .../arch/alpha/entry/syscalls/Makefile.syscalls    |   5 +
> >  tools/perf/arch/alpha/entry/syscalls/syscall.tbl   | 504 ++++++++++++++++++++
> >  tools/perf/arch/alpha/include/syscall_table.h      |   2 +
> >  tools/perf/arch/arc/entry/syscalls/Kbuild          |   2 +
> >  .../perf/arch/arc/entry/syscalls/Makefile.syscalls |   3 +
> >  tools/perf/arch/arc/include/syscall_table.h        |   2 +
> >  tools/perf/arch/arm/entry/syscalls/Kbuild          |   4 +
> >  .../perf/arch/arm/entry/syscalls/Makefile.syscalls |   2 +
> >  tools/perf/arch/arm/entry/syscalls/syscall.tbl     | 483 +++++++++++++++++++
> >  tools/perf/arch/arm/include/syscall_table.h        |   2 +
> >  tools/perf/arch/arm64/Makefile                     |  22 -
> >  tools/perf/arch/arm64/entry/syscalls/Kbuild        |   3 +
> >  .../arch/arm64/entry/syscalls/Makefile.syscalls    |   6 +
> >  tools/perf/arch/arm64/entry/syscalls/mksyscalltbl  |  46 --
> >  .../perf/arch/arm64/entry/syscalls/syscall_32.tbl  | 476 +++++++++++++++++++
> >  .../perf/arch/arm64/entry/syscalls/syscall_64.tbl  |   1 +
> >  tools/perf/arch/arm64/include/syscall_table.h      |   8 +
> >  tools/perf/arch/csky/entry/syscalls/Kbuild         |   2 +
> >  .../arch/csky/entry/syscalls/Makefile.syscalls     |   3 +
> >  tools/perf/arch/csky/include/syscall_table.h       |   2 +
> >  tools/perf/arch/loongarch/Makefile                 |  22 -
/scratch/ewlu/ppa/new-glibc-dumps$ file core._home_ubuntu_glibc_glibc-2_39_build-tree_riscv64-libc_elf_ld_so.1000.a95f9a60-edce-47cf-a6fb-14d3a1705685.58093.1340004> >  tools/perf/arch/loongarch/entry/syscalls/Kbuild    |   2 +
> >  .../loongarch/entry/syscalls/Makefile.syscalls     |   3 +
> >  .../arch/loongarch/entry/syscalls/mksyscalltbl     |  45 --
> >  tools/perf/arch/loongarch/include/syscall_table.h  |   2 +
> >  tools/perf/arch/mips/entry/syscalls/Kbuild         |   2 +
> >  .../arch/mips/entry/syscalls/Makefile.syscalls     |   5 +
> >  tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  32 --
> >  tools/perf/arch/mips/include/syscall_table.h       |   2 +
> >  tools/perf/arch/parisc/entry/syscalls/Kbuild       |   3 +
> >  .../arch/parisc/entry/syscalls/Makefile.syscalls   |   6 +
> >  tools/perf/arch/parisc/entry/syscalls/syscall.tbl  | 463 +++++++++++++++++++
> >  tools/perf/arch/parisc/include/syscall_table.h     |   8 +
> >  tools/perf/arch/powerpc/Makefile                   |  25 -
> >  tools/perf/arch/powerpc/entry/syscalls/Kbuild      |   3 +
> >  .../arch/powerpc/entry/syscalls/Makefile.syscalls  |   6 +
> >  .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  |  39 --
> >  tools/perf/arch/powerpc/include/syscall_table.h    |   8 +
> >  tools/perf/arch/riscv/Makefile                     |  22 -
> >  tools/perf/arch/riscv/entry/syscalls/Kbuild        |   2 +
> >  .../arch/riscv/entry/syscalls/Makefile.syscalls    |   4 +
> >  tools/perf/arch/riscv/entry/syscalls/mksyscalltbl  |  47 --
> >  tools/perf/arch/riscv/include/syscall_table.h      |   8 +
> >  tools/perf/arch/s390/Makefile                      |  21 -
> >  tools/perf/arch/s390/entry/syscalls/Kbuild         |   2 +
> >  .../arch/s390/entry/syscalls/Makefile.syscalls     |   5 +
> >  tools/perf/arch/s390/entry/syscalls/mksyscalltbl   |  32 --
> >  tools/perf/arch/s390/include/syscall_table.h       |   2 +
> >  tools/perf/arch/sh/entry/syscalls/Kbuild           |   2 +
> >  .../perf/arch/sh/entry/syscalls/Makefile.syscalls  |   4 +
> >  tools/perf/arch/sh/entry/syscalls/syscall.tbl      | 472 +++++++++++++++++++
> >  tools/perf/arch/sh/include/syscall_table.h         |   2 +
> >  tools/perf/arch/sparc/entry/syscalls/Kbuild        |   3 +
> >  .../arch/sparc/entry/syscalls/Makefile.syscalls    |   5 +
> >  tools/perf/arch/sparc/entry/syscalls/syscall.tbl   | 514 +++++++++++++++++++++
> >  tools/perf/arch/sparc/include/syscall_table.h      |   8 +
> >  tools/perf/arch/x86/Build                          |   1 -
> >  tools/perf/arch/x86/Makefile                       |  25 -
> >  tools/perf/arch/x86/entry/syscalls/Kbuild          |   3 +
> >  .../perf/arch/x86/entry/syscalls/Makefile.syscalls |   6 +
> >  tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   |  42 --
> >  tools/perf/arch/x86/include/syscall_table.h        |   8 +
> >  tools/perf/arch/xtensa/entry/syscalls/Kbuild       |   2 +
> >  .../arch/xtensa/entry/syscalls/Makefile.syscalls   |   4 +
> >  tools/perf/arch/xtensa/entry/syscalls/syscall.tbl  | 439 ++++++++++++++++++
> >  tools/perf/arch/xtensa/include/syscall_table.h     |   2 +
> >  tools/perf/builtin-check.c                         |   2 -
> >  tools/perf/builtin-help.c                          |   2 -
> >  tools/perf/builtin-trace.c                         |  30 --
> >  tools/perf/check-headers.sh                        |   9 +
> >  tools/perf/perf.c                                  |   6 +-
> >  tools/perf/scripts/Makefile.syscalls               |  61 +++
> >  tools/perf/scripts/syscalltbl.sh                   |  86 ++++
> >  tools/perf/tests/make                              |   7 +-
> >  tools/perf/util/env.c                              |   6 +-
> >  tools/perf/util/generate-cmdlist.sh                |   4 +-
> >  tools/perf/util/syscalltbl.c                       |  90 +---
> >  tools/perf/util/syscalltbl.h                       |   1 -
> >  tools/scripts/syscall.tbl                          | 409 ++++++++++++++++
> >  87 files changed, 4105 insertions(+), 623 deletions(-)
> > ---
> > base-commit: 034b5b147bf7f44a45e39334725f8633b7ca8c3b
> > change-id: 20240913-perf_syscalltbl-6f98defcc6f5
> > -- 
> > - Charlie

