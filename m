Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BFBE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 05:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9x4X6VsXmnlXwHD6ZB1McxUa09s6mP82ERI0J8/h/c=; b=B/Z4n18zwKOs0NbgV7AJNGx4yR
	P0BHjDNczIR1jO4F4o3RZKXB0RXlltzP5fNq4BwKFNaA43Q6Grn6Dn1xPX1Kq1khAcAKQlKBlH+tO
	hckF3B8khToUn4ttJSupE3RI4Og7hMmEytRKjMeb05uTZKpiBl0QLQyN+RRDbazkxw50nWUMGv/G9
	L+DDbaoTG3Xbp1yYoh42ReDvI7JQQIQ0m+LJY8FMJifcY10zcui+5ltiQEG0H8MKhFAEVCDVAFana
	tbD08093254/NVxOseszkV7OxF8XCWbhIOptoTVJafYHPJGEnO42BiHrGqNEHh3uvoT9+1TKxJd27
	7a+MbenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPnF-0000000CCYW-2P7F;
	Tue, 17 Dec 2024 05:06:49 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPm8-0000000CCNW-2qy2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 05:05:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21636268e43so59420575ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 21:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734411939; x=1735016739; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+9x4X6VsXmnlXwHD6ZB1McxUa09s6mP82ERI0J8/h/c=;
        b=linwiaJRv7Mn4+JfqEdNsMF70NVnaX0mYk+lisw2BnuprDdQaGZrLMhvk3OzquT7b+
         Nh5THdzSPPe0NJY/Qc650nZ4DKDBwT8lp7eoIt0PMD2G/vcBkBMF8R39M0hhcqfkZsdM
         H2/s3dxM9l1ruhE21Q+EVugZZpElRi+VIFInvJHxM6a1ue7gUT42ZzQNd1ll8GJrDk9s
         vwrPT9xdgYBqtwSuBjJZ1MdnpKVr+JsQl7xahxNBc2G5iyfiVv+7BbJmFiYnya3Hut6T
         AlcduQpzMER78+FULmdA848VnAanprrvsq8vzY7O+wgDqBW/sf6tAC0bmBfrHwQAce+S
         7StA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734411939; x=1735016739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9x4X6VsXmnlXwHD6ZB1McxUa09s6mP82ERI0J8/h/c=;
        b=JxYZfzoGyKVFCr3+HC3ADku7/j3hVz0NIqL4iyks/i69t5HeXcgeeS+2GQ7fKJ36rC
         OTfEYbJVsWEO8Izg1VGUWB75WbZ+zuHhy+Du4ozPBIgiV6uUMRJL9zWwsfz1hrjz2Hch
         tLM8lQB8YvTSsjse6jLMiO1/KwqUddlkFeUVkXa/IVJeLFT8Rt+JTbf4G2k2jVKKpoz6
         ujYfpdt0wHEsv3wdvnifDnGLcbYLvA6VPibPzyUt6IQO1FcGnkHf6/uNAhN3OZodBOix
         F4CG9LnlEn69Z9Bkej/dgqYWGpNqVrShfduZVXdqqPmQ2/QONTEINhhwx1HyV5YG1rJW
         uKwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkhLP8P7YS2fcEqyuAVQ7PLcgSp4yV8Ic/ngKRmuGXjvqYjIHAaZxNkOiekwlyyEBQ0iA9Fc6+EjTJvJJcWtPW@lists.infradead.org
X-Gm-Message-State: AOJu0YwcINXgRL6oBRg/mai/lGiM2tHZwHCi4CDxb5RKo9lmRzxEOSlg
	xZX5WVJDKi7MtTTpYwtXOeVnxxQ46FEsmI8YnR7WGUekM4vpWs1ynEh/4K+RcIo=
X-Gm-Gg: ASbGncvKA54UVm94RSmJ03jXbws4y0R5upfn8v5NHP3rgWITLMwQ6qJ4accdfYhkTOk
	GrHIhciU3W0ZxgObdH3/oWEWUQbWJ8ahxR0N4JwqYXGm1pKpcTqf46/zkefKzh9sB4hMEJQ7Vej
	/pwcib8L3fdEu4PFv220RrR4rrEEoE3mDdnMJ5HHmNf5NnWSnGjs1bGpW1yk319HV7ykqBYm+zD
	kC0ftejV4GGwsOkB+zOJUiaUO5AqsRDFPN+DCUnIF//mli6ePE=
X-Google-Smtp-Source: AGHT+IGVrWrXaPQFFobqmyGa1VQFE8sVuxv4oAOdc9G/v3DOHotCQVtFV+VjZ0E8Lez8hAQY+NAQgw==
X-Received: by 2002:a17:902:dac6:b0:215:72aa:693f with SMTP id d9443c01a7336-21892980fecmr213696615ad.9.1734411939584;
        Mon, 16 Dec 2024 21:05:39 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:9708:a71e:40e6:860])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e50aadsm50867095ad.156.2024.12.16.21.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 21:05:38 -0800 (PST)
Date: Mon, 16 Dec 2024 21:05:35 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
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
	Jonathan Corbet <corbet@lwn.net>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 01/16] perf tools: Create generic syscall table support
Message-ID: <Z2EGn2V1OPqqKxKZ@ghost>
References: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
 <20241212-perf_syscalltbl-v2-1-f8ca984ffe40@rivosinc.com>
 <Z1zBzTgEYXw1DbEL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1zBzTgEYXw1DbEL@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_210540_935725_CD01A6D0 
X-CRM114-Status: GOOD (  37.40  )
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

On Fri, Dec 13, 2024 at 03:22:53PM -0800, Namhyung Kim wrote:
> Hello,
> 
> On Thu, Dec 12, 2024 at 04:32:51PM -0800, Charlie Jenkins wrote:
> > Currently each architecture in perf independently generates syscall
> > headers. Adapt the work that has gone into unifying syscall header
> > implementations in the kernel to work with perf tools. Introduce this
> > framework with riscv at first. riscv previously relied on libaudit, but
> > with this change, perf tools for riscv no longer needs this external
> > dependency.
> 
> Nice work!
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  tools/perf/Makefile.config                         |  11 +-
> >  tools/perf/Makefile.perf                           |   4 +
> >  tools/perf/arch/riscv/Makefile                     |  22 --
> >  tools/perf/arch/riscv/entry/syscalls/Kbuild        |   2 +
> >  .../arch/riscv/entry/syscalls/Makefile.syscalls    |   4 +
> >  tools/perf/arch/riscv/entry/syscalls/mksyscalltbl  |  47 ---
> >  tools/perf/arch/riscv/include/syscall_table.h      |   8 +
> >  tools/perf/check-headers.sh                        |   1 +
> >  tools/perf/scripts/Makefile.syscalls               |  60 +++
> >  tools/perf/scripts/syscalltbl.sh                   |  86 +++++
> >  tools/perf/util/syscalltbl.c                       |   8 +-
> >  tools/scripts/syscall.tbl                          | 409 +++++++++++++++++++++
> >  12 files changed, 585 insertions(+), 77 deletions(-)
> > 
> > diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> > index 2916d59c88cd08b299202a48ddb42fa32aac04a6..a72f25162714f0117a88d94474da336814d4f030 100644
> > --- a/tools/perf/Makefile.config
> > +++ b/tools/perf/Makefile.config
> > @@ -35,6 +35,13 @@ ifneq ($(NO_SYSCALL_TABLE),1)
> >      NO_SYSCALL_TABLE := 0
> >    endif
> >  
> > +  # architectures that use the generic syscall table scripts
> > +  ifeq ($(SRCARCH),riscv)
> > +    NO_SYSCALL_TABLE := 0
> > +    CFLAGS += -DGENERIC_SYSCALL_TABLE
> > +    CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
> > +  endif
> > +
> >    ifneq ($(NO_SYSCALL_TABLE),1)
> >      CFLAGS += -DHAVE_SYSCALL_TABLE_SUPPORT
> >    endif
> > @@ -83,10 +90,6 @@ ifeq ($(ARCH),mips)
> >    LIBUNWIND_LIBS = -lunwind -lunwind-mips
> >  endif
> >  
> > -ifeq ($(ARCH),riscv)
> > -  CFLAGS += -I$(OUTPUT)arch/riscv/include/generated
> > -endif
> > -
> >  # So far there's only x86 and arm libdw unwind support merged in perf.
> >  # Disable it on all other architectures in case libdw unwind
> >  # support is detected in system. Add supported architectures
> > diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> > index d74241a151313bd09101aabb5d765a5a0a6efc84..f5278ed9f778f928436693a14e016c5c3c5171c1 100644
> > --- a/tools/perf/Makefile.perf
> > +++ b/tools/perf/Makefile.perf
> > @@ -310,6 +310,10 @@ ifeq ($(filter feature-dump,$(MAKECMDGOALS)),feature-dump)
> >  FEATURE_TESTS := all
> >  endif
> >  endif
> > +# architectures that use the generic syscall table
> > +ifeq ($(SRCARCH),riscv)
> > +include $(srctree)/tools/perf/scripts/Makefile.syscalls
> > +endif
> >  include Makefile.config
> >  endif
> >  
> > diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
> > index 18ad078000e2bba595f92efc5d97a63fdb83ef45..087e099fb453a9236db34878077a51f711881ce0 100644
> > --- a/tools/perf/arch/riscv/Makefile
> > +++ b/tools/perf/arch/riscv/Makefile
> > @@ -1,25 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  PERF_HAVE_JITDUMP := 1
> >  HAVE_KVM_STAT_SUPPORT := 1
> > -
> > -#
> > -# Syscall table generation for perf
> > -#
> > -
> > -out    := $(OUTPUT)arch/riscv/include/generated/asm
> > -header := $(out)/syscalls.c
> > -incpath := $(srctree)/tools
> > -sysdef := $(srctree)/tools/arch/riscv/include/uapi/asm/unistd.h
> > -sysprf := $(srctree)/tools/perf/arch/riscv/entry/syscalls/
> > -systbl := $(sysprf)/mksyscalltbl
> > -
> > -# Create output directory if not already present
> > -$(shell [ -d '$(out)' ] || mkdir -p '$(out)')
> > -
> > -$(header): $(sysdef) $(systbl)
> > -	$(Q)$(SHELL) '$(systbl)' '$(CC)' '$(HOSTCC)' $(incpath) $(sysdef) > $@
> > -
> > -clean::
> > -	$(call QUIET_CLEAN, riscv) $(RM) $(header)
> > -
> > -archheaders: $(header)
> > diff --git a/tools/perf/arch/riscv/entry/syscalls/Kbuild b/tools/perf/arch/riscv/entry/syscalls/Kbuild
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9a41e3572c3afd4f202321fd9e492714540e8fd3
> > --- /dev/null
> > +++ b/tools/perf/arch/riscv/entry/syscalls/Kbuild
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +syscall-y += syscalls_64.h
> > diff --git a/tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls b/tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9668fd1faf60e828ed2786c2ee84739ac1f153fc
> > --- /dev/null
> > +++ b/tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +syscall_abis_32 += riscv memfd_secret
> > +syscall_abis_64 += riscv rlimit memfd_secret
> > diff --git a/tools/perf/arch/riscv/entry/syscalls/mksyscalltbl b/tools/perf/arch/riscv/entry/syscalls/mksyscalltbl
> > deleted file mode 100755
> > index c59f5e852b97712a9a879b89e6ef6999ed4b6cd7..0000000000000000000000000000000000000000
> > --- a/tools/perf/arch/riscv/entry/syscalls/mksyscalltbl
> > +++ /dev/null
> > @@ -1,47 +0,0 @@
> > -#!/bin/sh
> > -# SPDX-License-Identifier: GPL-2.0
> > -#
> > -# Generate system call table for perf. Derived from
> > -# powerpc script.
> > -#
> > -# Copyright IBM Corp. 2017
> > -# Author(s):  Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
> > -# Changed by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
> > -# Changed by: Kim Phillips <kim.phillips@arm.com>
> > -# Changed by: Björn Töpel <bjorn@rivosinc.com>
> > -
> > -gcc=$1
> > -hostcc=$2
> > -incpath=$3
> > -input=$4
> > -
> > -if ! test -r $input; then
> > -	echo "Could not read input file" >&2
> > -	exit 1
> > -fi
> > -
> > -create_sc_table()
> > -{
> > -	local sc nr max_nr
> > -
> > -	while read sc nr; do
> > -		printf "%s\n" "	[$nr] = \"$sc\","
> > -		max_nr=$nr
> > -	done
> > -
> > -	echo "#define SYSCALLTBL_RISCV_MAX_ID $max_nr"
> > -}
> > -
> > -create_table()
> > -{
> > -	echo "#include \"$input\""
> > -	echo "static const char *const syscalltbl_riscv[] = {"
> > -	create_sc_table
> > -	echo "};"
> > -}
> > -
> > -$gcc -E -dM -x c -I $incpath/include/uapi $input \
> > -	|awk '$2 ~ "__NR" && $3 !~ "__NR3264_" {
> > -		sub("^#define __NR(3264)?_", "");
> > -		print | "sort -k2 -n"}' \
> > -	|create_table
> > diff --git a/tools/perf/arch/riscv/include/syscall_table.h b/tools/perf/arch/riscv/include/syscall_table.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7ff51b783000d727ec48be960730b81ecdb05575
> > --- /dev/null
> > +++ b/tools/perf/arch/riscv/include/syscall_table.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#include <asm/bitsperlong.h>
> > +
> > +#if __BITS_PER_LONG == 64
> > +#include <asm/syscalls_64.h>
> > +#else
> > +#include <asm/syscalls_32.h>
> > +#endif
> > diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
> > index a05c1c105c51bf1bd18a59195220894598eb7461..692f48db810ccbef229e240db29261f0c60db632 100755
> > --- a/tools/perf/check-headers.sh
> > +++ b/tools/perf/check-headers.sh
> > @@ -71,6 +71,7 @@ FILES=(
> >    "include/uapi/asm-generic/ioctls.h"
> >    "include/uapi/asm-generic/mman-common.h"
> >    "include/uapi/asm-generic/unistd.h"
> > +  "scripts/syscall.tbl"
> >  )
> >  
> >  declare -a SYNC_CHECK_FILES
> > diff --git a/tools/perf/scripts/Makefile.syscalls b/tools/perf/scripts/Makefile.syscalls
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e2b0c4b513d5c42c8e9ac51a9ea774c34a1311b7
> > --- /dev/null
> > +++ b/tools/perf/scripts/Makefile.syscalls
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# This Makefile generates tools/perf/arch/$(SRCARCH)/include/generated/asm from
> > +# the generic syscall table if that is supported by the architecture, otherwise
> > +# from the architecture's defined syscall table.
> > +
> > +PHONY := all
> > +all:
> > +
> > +obj := $(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated/asm
> > +
> > +syscall_abis_32  += common,32
> > +syscall_abis_64  += common,64
> 
> Couldn't it be := instead of += ?

Yes good point.

> 
> 
> > +syscalltbl := $(srctree)/tools/scripts/syscall.tbl
> > +
> > +# let architectures override $(syscall_abis_%) and $(syscalltbl)
> > +-include $(srctree)/tools/perf/arch/$(SRCARCH)/entry/syscalls/Makefile.syscalls
> > +include $(srctree)/scripts/Kbuild.include
> > +-include $(srctree)/tools/perf/arch/$(SRCARCH)/entry/syscalls/Kbuild
> > +
> > +systbl := $(srctree)/tools/perf/scripts/syscalltbl.sh
> > +
> > +syscall-y   := $(addprefix $(obj)/, $(syscall-y))
> > +
> > +# Remove stale wrappers when the corresponding files are removed from generic-y
> > +old-headers := $(wildcard $(obj)/*.c)
> > +unwanted    := $(filter-out $(syscall-y),$(old-headers))
> 
> Can you elaborate?  What's the stable wrappers?
> 
> I think syscall-y and old-headers have .h files but the wildcard above
> is called for .c files?

Oh yes! I meant to change that to .h, thank you for mentioning that, I
had .c at some point during development but changed it to .h files.

- Charlie

> 
> Thanks,
> Namhyung
> 
> > +
> > +quiet_cmd_remove = REMOVE  $(unwanted)
> > +      cmd_remove = rm -f $(unwanted)
> > +
> > +quiet_cmd_systbl = SYSTBL  $@
> > +      cmd_systbl = $(CONFIG_SHELL) $(systbl) \
> > +		   $(if $(systbl-args-$*),$(systbl-args-$*),$(systbl-args)) \
> > +		   --abis $(subst $(space),$(comma),$(strip $(syscall_abis_$*))) \
> > +		   $< $@
> > +
> > +all: $(syscall-y)
> > +	$(if $(unwanted),$(call cmd,remove))
> > +	@:
> > +
> > +$(obj)/syscalls_%.h: $(syscalltbl) $(systbl) FORCE
> > +	$(call if_changed,systbl)
> > +
> > +targets := $(syscall-y)
> > +
> > +# Create output directory. Skip it if at least one old header exists
> > +# since we know the output directory already exists.
> > +ifeq ($(old-headers),)
> > +$(shell mkdir -p $(obj))
> > +endif
> > +
> > +PHONY += FORCE
> > +
> > +FORCE:
> > +
> > +existing-targets := $(wildcard $(sort $(targets)))
> > +
> > +-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
> > +
> > +.PHONY: $(PHONY)

