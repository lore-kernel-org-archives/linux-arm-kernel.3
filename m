Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D926EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T624wPcrhS1JgwTBcPosmdXx4gdcuulJGOQvqM6CtCw=; b=cCXdVtGMFzb/Z5jCVV/E56vtgS
	pETPIOhImsq3B3KvCZ3bH9PTpe//VWoE2hSPmfRhxSs5xMgYpgWEc9PlgjY/Jap9colPPlwNpeYkz
	+wGJMBjkFyl5J1XRbYKBUNXLwfACUFJ/M6NPyVQlOSfxsavzbWJZrlRjZcaHkxkZEUFPq9NerbHFX
	RdR2unRSvMJLNOntOPVxg4LNkQ9txUWbaYE4ryhm4M6p0pbwJfYEWr+UyM3TvHOsDfP/dH283nAMG
	S1wYjHjZ5sQus7P7UZfC0qhCXpwfmMIrcN+aRYp565LlWOfz18tdG3Gt5X5TKf7984CZ9UUnPIOL1
	KjrfN+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKp4-0000000GmsX-3jwM;
	Fri, 10 Jan 2025 19:37:34 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKin-0000000Gltd-3CcR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 19:31:08 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-215770613dbso30599475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 11:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736537465; x=1737142265; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T624wPcrhS1JgwTBcPosmdXx4gdcuulJGOQvqM6CtCw=;
        b=idtxv0qwXo/b/FNXTjyUMtg8iawi4pWGv+6gP7PobdLDqagh7tAW31K28ANFb2NA4x
         ujQteAQ1bNwqy3qs4uL6S5dxA+TJni3M7bHKZarHFY8u8Dl/QPiIrsFopRCzvQeay4oE
         bBw2xeXz3qwp5Pvjo2yrfMiiBwdyU0eYQ+IFQpCS8LUc11BP2RPBNccYw5Ws3b0BuwRY
         4N3mQ8TCU9971CKHsk6h/Z2kTTeIZHfYezAmNnSQeBWT0c8qAgVWkCU3jjHVxIw/3S/2
         muYMuXd0xtKvSH4N7VaL7+VNoorDn7mm4FWJf+ukFFpqBBr7xqkBvzOg6vCXpqSuzWyP
         Bndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736537465; x=1737142265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T624wPcrhS1JgwTBcPosmdXx4gdcuulJGOQvqM6CtCw=;
        b=OkQMKzejYcXz/K5sHnmEnRPqEq5vngt98SrrvmgSICcb8RpZ22mNFJPrbqJv56Gniz
         dTidwNIxtZNnZaXef09dKt8xIhaVQNU2kxMuHa6mobsqJpuJOynsvbsOKksn04OkdKfg
         m8mH9wQU8LnBTL86jXiWBrdyn/G4hm3NJCbj0F+b0P2XP/YlkZnZvWqw34NtxPLrGkR+
         AX3vTNZxIwupaGvnRAdx5S+Pn39bQYaVi3c5YLsMDRI94i794ZojkY43RN9h+OHVckej
         uegru0h9CDzKRtnpPLELTWGlOMevJZSX2bR4i9xuIyog3qH/nVRkSP7gwtBpZmA7ei2s
         TCyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5tlpDFocB/YqCtV95ODT3XTq0gJwpKRSH0NlgPRrchNbinNXaesHjz4y5FKYbhrkYFCEKn1mhqMlAgiQtuSbZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzv4l3js3ipRVdhUfUMOl1UXo0JBLOrrzh3oAvIkCcX1vaMyTM
	SdPiakFiNj47utzDwNkvqQmzIewHlGAG9opt1dlHsC0TXp/vv9ZPbMJlV//o/04=
X-Gm-Gg: ASbGncuUe2b+SRl1i8IaGI37ELeVKonW313zm10YLgyr9fApkoqxULRuJs4UtD76MfD
	c3WsgoxTH9Bh7HimTWSu/T+MFaBaesL3comjUIwDkfBowCkuK6v5Is79sQszJBwyEmfP2mwQlx4
	Vm4N2frC4zLeWIrYekD+ytd73rTWJAAkUQLgzOh+z7eyyk8LMwZfVWspwr5Ekrj/15LrPlUcX3H
	Sw6aCQSwV7y7joOKOprEgOKmFq/7x9fnGwVr8FXeaL+qowE5qFZ
X-Google-Smtp-Source: AGHT+IEre0AsdJDUsGl4k/O1aF6vQLIHA3Knu3Spyy4azSMvw1UNUQEJLtptbRCNfCZV9aZHSRvhEg==
X-Received: by 2002:a17:903:124f:b0:215:83e1:99ff with SMTP id d9443c01a7336-21a83f63f68mr150756545ad.27.1736537464834;
        Fri, 10 Jan 2025 11:31:04 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4bc7:d274:c14b:fde8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219a94sm16883985ad.129.2025.01.10.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 11:31:04 -0800 (PST)
Date: Fri, 10 Jan 2025 11:31:01 -0800
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
Message-ID: <Z4F1dXQLPGZ3JFI5@ghost>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
 <Z4BEygdXmofWBr0-@x1>
 <Z4BVK3D7sN-XYg2o@ghost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4BVK3D7sN-XYg2o@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_113105_810518_8D0AAFDA 
X-CRM114-Status: GOOD (  37.48  )
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

On Thu, Jan 09, 2025 at 03:00:59PM -0800, Charlie Jenkins wrote:
> On Thu, Jan 09, 2025 at 06:51:06PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Thu, Jan 09, 2025 at 05:49:42PM -0300, Arnaldo Carvalho de Melo wrote:
> > > BTW this series is already pushed out to perf-tools-next:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/?h=perf-tools-next
> > 
> > Hey, now I noticed that with this latest version we see:
> > 
> > ⬢ [acme@toolbox perf-tools-next]$ m
> > make: Entering directory '/home/acme/git/perf-tools-next/tools/perf'
> >   BUILD:   Doing 'make -j28' parallel build
> > Warning: Kernel ABI header differences:
> >   diff -u tools/arch/arm64/include/uapi/asm/unistd.h arch/arm64/include/uapi/asm/unistd.h
> > 
> > Auto-detecting system features:
> > ...                                   libdw: [ on  ]
> > ...                                   glibc: [ on  ]
> > ...                                  libbfd: [ on  ]
> > ...                          libbfd-buildid: [ on  ]
> > ...                                  libelf: [ on  ]
> > ...                                 libnuma: [ on  ]
> > ...                  numa_num_possible_cpus: [ on  ]
> > ...                                 libperl: [ on  ]
> > ...                               libpython: [ on  ]
> > ...                               libcrypto: [ on  ]
> > ...                               libunwind: [ on  ]
> > ...                             libcapstone: [ on  ]
> > ...                               llvm-perf: [ on  ]
> > ...                                    zlib: [ on  ]
> > ...                                    lzma: [ on  ]
> > ...                               get_cpuid: [ on  ]
> > ...                                     bpf: [ on  ]
> > ...                                  libaio: [ on  ]
> > ...                                 libzstd: [ on  ]
> > 
> >    /home/acme/git/perf-tools-next/tools/perf/scripts/syscalltbl.sh  --abis common,32,i386 /home/acme/git/perf-tools-next/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_32.h
> >    /home/acme/git/perf-tools-next/tools/perf/scripts/syscalltbl.sh  --abis common,64 /home/acme/git/perf-tools-next/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_64.h
> >   GEN     /tmp/build/perf-tools-next/common-cmds.h
> >   GEN     /tmp/build/perf-tools-next/arch/arm64/include/generated/asm/sysreg-defs.h
> >   PERF_VERSION = 6.13.rc2.gd73982c39183
> >   GEN     perf-archive
> >   GEN     perf-iostat
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> > 
> > 
> > While with the previous one we would see something like SYSCALLTBL as
> > the step name, like we have GEN, MKDIR, etc, can you take a look?
> 
> Ooh okay I see, the quiet commands were being ignored as-is. We could
> add the lines to handle this to Makefile.syscalls, but I think the
> better solution is to move the lines from Makefile.build to
> Makefile.perf to be more generically available. Here is a patch for
> that. I also added the comment from the kernel Makefile describing what
> this does.
> 
> From 8dcec7f5d937ede3d33c687573dc2f1654ddc59e Mon Sep 17 00:00:00 2001
> From: Charlie Jenkins <charlie@rivosinc.com>
> Date: Thu, 9 Jan 2025 14:36:40 -0800
> Subject: [PATCH] perf tools: Expose quiet/verbose variables in Makefile.perf
> 
> The variables to make builds silent/verbose live inside
> tools/build/Makefile.build. Move those variables to the top-level
> Makefile.perf to be generally available.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  tools/build/Makefile.build | 20 --------------------
>  tools/perf/Makefile.perf   | 37 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 36 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
> index 5fb3fb3d97e0..e710ed67a1b4 100644
> --- a/tools/build/Makefile.build
> +++ b/tools/build/Makefile.build
> @@ -12,26 +12,6 @@
>  PHONY := __build
>  __build:
>  
> -ifeq ($(V),1)
> -  quiet =
> -  Q =
> -else
> -  quiet=quiet_
> -  Q=@
> -endif
> -
> -# If the user is running make -s (silent mode), suppress echoing of commands
> -# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
> -ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> -short-opts := $(firstword -$(MAKEFLAGS))
> -else
> -short-opts := $(filter-out --%,$(MAKEFLAGS))
> -endif
> -
> -ifneq ($(findstring s,$(short-opts)),)
> -  quiet=silent_
> -endif
> -
>  build-dir := $(srctree)/tools/build
>  
>  # Define $(fixdep) for dep-cmd function
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index a449d0015536..55d6ce9ea52f 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -161,12 +161,47 @@ export VPATH
>  SOURCE := $(shell ln -sf $(srctree)/tools/perf $(OUTPUT)/source)
>  endif
>  
> +# Beautify output
> +# ---------------------------------------------------------------------------
> +#
> +# Most of build commands in Kbuild start with "cmd_". You can optionally define
> +# "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
> +# that command is printed by default.
> +#
> +# e.g.)
> +#    quiet_cmd_depmod = DEPMOD  $(MODLIB)
> +#          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
> +#
> +# A simple variant is to prefix commands with $(Q) - that's useful
> +# for commands that shall be hidden in non-verbose mode.
> +#
> +#    $(Q)$(MAKE) $(build)=scripts/basic
> +#
> +# To put more focus on warnings, be less verbose as default
> +# Use 'make V=1' to see the full commands
> +
>  ifeq ($(V),1)
> +  quiet =
>    Q =
>  else
> -  Q = @
> +  quiet=quiet_
> +  Q=@
>  endif
>  
> +# If the user is running make -s (silent mode), suppress echoing of commands
> +# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
> +ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> +short-opts := $(firstword -$(MAKEFLAGS))
> +else
> +short-opts := $(filter-out --%,$(MAKEFLAGS))
> +endif
> +
> +ifneq ($(findstring s,$(short-opts)),)
> +  quiet=silent_
> +endif
> +
> +export quiet Q
> +
>  # Do not use make's built-in rules
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS += -r
> -- 
> 2.34.1
> 
> 
> - Charlie

Let me know how you want to handle this, I can send this out as a
separate patch if that's better.

- Charlie

> 
> > 
> > All is out there in perf-tools-next.
> > 
> > - Arnaldo

