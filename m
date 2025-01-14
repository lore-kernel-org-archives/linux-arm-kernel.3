Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4119E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 22:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAi/vDeugCHa71Ma0EXTvLeZpuJSJHZJbQffJrAlCfU=; b=Y0OKeQBwrYcIy5ytEM/6FxxW1v
	3aw4Lsehbx0D/Xi31lHZjfqIvvlhy0Dy91u4ikcUCB/1VT3R/U6ojgYmcKHLM/Cp+8fVzpj3T8c5T
	0K+6eiO+fEW0S3K5lW9owLuY0xMAug6JK6FQ1sWpSkE32nXqFxBvHFjFwZ+CS6oAU55eRgxdVbrRN
	sIAyQ58qchTgQHLfV8Nd7A2wknWVhw8MuQJKQ0SOZvYdNV3f/qxbRdK+kshyS37utgJA7TdQH5jqU
	IPBRj3pYQ5ropSurl7L6GrlcApQ6kOsHUItooTFtqD4ofKNzI3iPyRchJlbuqmeF0gTbfAIGEOvaO
	egl0wtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoz3-00000009sWE-2QBh;
	Tue, 14 Jan 2025 22:02:01 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoxj-00000009sHP-0HBx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:00:42 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso339345a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 14:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736892038; x=1737496838; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LAi/vDeugCHa71Ma0EXTvLeZpuJSJHZJbQffJrAlCfU=;
        b=08i8X17VrwWxw0vlPMeWol1UjVRUXmGIdQP4ljnCbyhWr6CRENFNcuDX9AccuktzMD
         r5yQhdPfWSa9iAGwOmlQzP9rHRZYAd1fk1tphNSGRmvnfkz86tl6FtHUSSMhL34/5Rdi
         wW8++qHlG7W3TRGi1jnu4aQQv8j+638qB78HTcnUQ6f9wHMnd8f2U6id3ygyBjy4W3DL
         KK1egm6qRHSG0thE+geVDCboqQRLL+mrYiglR3v1j9n7ea8DLCvzyzZO3iPTdX2TMlFz
         b9/PqTr6xkhT4VL2kpPjZEllKirb8rsga5q3psjzBgIIyNKDy2+YojI3KswYHqpGNEfw
         6q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736892038; x=1737496838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAi/vDeugCHa71Ma0EXTvLeZpuJSJHZJbQffJrAlCfU=;
        b=sUjiHXJjn52fytDR7XshDJUxAXzz0Y/O+2Xwnm5+PgfusvZhzZkB8zONLwqjAGdLal
         8lRsjzPB414hpFZslIp6/Hn6UCBdi83/xfLU5VDmxbO/FXDwWY+1XQ5kD03doB7b2P0E
         aeir/e7Hj+qmNm6Nc0KH7tYPq8yFmFzUPbqNUZlU+CP4YfsZMvVVs+Tjfpx+YsTujzwE
         kGDs3ci1a6SknVo19Z/6Oj65D5ZPHXQTcbMOQ0SdzlEuKFlo6oO4pKpsz1WYMzpjSzFZ
         AY76JkWwwb4t/W7SjA2cjHRRbh9mNXTkI8FgKdgmtLCTRvP066VtmeR6oTw+6p8aVAPu
         cAew==
X-Forwarded-Encrypted: i=1; AJvYcCVG29n8HunhelrGamcRflSCxfaJAqTgO+pISdacolSRfB8CplL2qoaGYf6Dv/4OEcgNR5i9Lz7QoWykbmn+fSzw@lists.infradead.org
X-Gm-Message-State: AOJu0YyzlPKf8fqzVMVSUvw9LGSX3OSoAFvfq/GkySfo0Xkb314BRIam
	Xg4k84I012FPIQ0y+CSn1kGF6sH2xOviIas462lGaq4AeTJ/Pauut7yTO1z9sto=
X-Gm-Gg: ASbGncs93YXMHv5ZpJjMFHn3g/b5c7aK7nvmymNfWXz8w7uh3Y8zhCvvp4IR0D0vwrE
	s4HTVxypKCIPu7CoQIc3U0tD4T/dBt6rYbUcqxD1OvhVIgKrIcHrn1CeMjEgZS9hSun3d1mwgNK
	BNkHHL1lfJLpVjXoZiYIO4IYVRzim00BLkisBdH98NQG2IsOTkxRslKhw+B1UarVnbnUcaTGcJx
	Xfd4Gi4mkozcjAeCPYKCSqUHQyUulfNWm+xC6KrK9i7Cyk=
X-Google-Smtp-Source: AGHT+IHUmOu5Z8yV9askuOExmMIbEPTgLHypbNQwlNxLYlNE9sF/DEJ2VQ1UKljmu+ix+BNJ1HS+qw==
X-Received: by 2002:a17:90b:3a08:b0:2ee:edae:775 with SMTP id 98e67ed59e1d1-2f728dd351amr804769a91.3.1736892037932;
        Tue, 14 Jan 2025 14:00:37 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c20abc4sm27371a91.34.2025.01.14.14.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:00:36 -0800 (PST)
Date: Tue, 14 Jan 2025 14:00:33 -0800
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
Message-ID: <Z4bega1SChsGKqe6@ghost>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
 <Z4BEygdXmofWBr0-@x1>
 <Z4BVK3D7sN-XYg2o@ghost>
 <Z4F1dXQLPGZ3JFI5@ghost>
 <Z4UpRqywqYPZSUM_@x1>
 <Z4alwvqYithaVLSL@x1>
 <Z4a6oivg7f74N12Q@ghost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4a6oivg7f74N12Q@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_140039_389734_0F80C61E 
X-CRM114-Status: GOOD (  45.46  )
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

On Tue, Jan 14, 2025 at 11:27:30AM -0800, Charlie Jenkins wrote:
> On Tue, Jan 14, 2025 at 02:58:26PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Mon, Jan 13, 2025 at 11:55:05AM -0300, Arnaldo Carvalho de Melo wrote:
> > > On Fri, Jan 10, 2025 at 11:31:01AM -0800, Charlie Jenkins wrote:
> > > > On Thu, Jan 09, 2025 at 03:00:59PM -0800, Charlie Jenkins wrote:
> > > > > Ooh okay I see, the quiet commands were being ignored as-is. We could
> > > > > add the lines to handle this to Makefile.syscalls, but I think the
> > > > > better solution is to move the lines from Makefile.build to
> > > > > Makefile.perf to be more generically available. Here is a patch for
> > > > > that. I also added the comment from the kernel Makefile describing what
> > > > > this does.
> > > 
> > > > > From 8dcec7f5d937ede3d33c687573dc2f1654ddc59e Mon Sep 17 00:00:00 2001
> > > > > From: Charlie Jenkins <charlie@rivosinc.com>
> > > > > Date: Thu, 9 Jan 2025 14:36:40 -0800
> > > > > Subject: [PATCH] perf tools: Expose quiet/verbose variables in Makefile.perf
> > > > > 
> > > > > The variables to make builds silent/verbose live inside
> > > > > tools/build/Makefile.build. Move those variables to the top-level
> > > > > Makefile.perf to be generally available.
> > > 
> > > <SNIP applied patch>
> > >  
> > > > Let me know how you want to handle this, I can send this out as a
> > > > separate patch if that's better.
> > > 
> > > I used the patch you provided above after hand editing the message
> > > before feeding it to 'git am', added these comments:
> > 
> > Somehow this is causing some trouble:
> > 
> > ⬢ [acme@toolbox perf-tools-next]$ make -C tools/perf build-test
> > make: Entering directory '/home/acme/git/perf-tools-next/tools/perf'
> > - tarpkg: ./tests/perf-targz-src-pkg .
> > /bin/sh: line 1: @make: command not found
> > make[4]: *** [Makefile:27: clean-asm_pure_loop] Error 127
> > make[3]: *** [Makefile.perf:764: tests-coresight-targets-clean] Error 2
> > make[2]: *** [Makefile:96: clean] Error 2
> > make[1]: *** [tests/make:330: make_static] Error 2
> > make: *** [Makefile:109: build-test] Error 2
> > make: Leaving directory '/home/acme/git/perf-tools-next/tools/perf'
> > ⬢ [acme@toolbox perf-tools-next]$
> > 
> > Can you please try fixing it as I'm busy now (I'll be on vacation from
> > tomorrow till early February)? This is what I extracted:
> 
> There was an erroneous $(Q) in
> tools/perf/tests/shell/coresight/Makefile. Previously it would expand to
> the empty string so wouldn't cause any problems, but now it's in the
> middle of an expression so hence the error. I'll send an updated patch.

Let me know if this works as expected! I sent it as [1].

[1] https://lore.kernel.org/all/20250114-perf_make_test-v1-1-decc1c517b11@rivosinc.com/

> 
> > 
> > commit c199fd785d18121ffd0ba5758e23a42ba2984e11
> > Author: Charlie Jenkins <charlie@rivosinc.com>
> > Date:   Mon Jan 13 11:50:55 2025 -0300
> > 
> >     perf tools: Expose quiet/verbose variables in Makefile.perf
> >     
> >     The variables to make builds silent/verbose live inside
> >     tools/build/Makefile.build. Move those variables to the top-level
> >     Makefile.perf to be generally available.
> >     
> >     Committer testing:
> >     
> >     See the SYSCALL lines, now they are consistent with the other
> >     operations in other lines:
> >     
> >       SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_32.h
> >       SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_64.h
> >       GEN     /tmp/build/perf-tools-next/common-cmds.h
> >       GEN     /tmp/build/perf-tools-next/arch/arm64/include/generated/asm/sysreg-defs.h
> >       PERF_VERSION = 6.13.rc2.g3d94bb6ed1d0
> >       GEN     perf-archive
> >       MKDIR   /tmp/build/perf-tools-next/jvmti/
> >       MKDIR   /tmp/build/perf-tools-next/jvmti/
> >       MKDIR   /tmp/build/perf-tools-next/jvmti/
> >       MKDIR   /tmp/build/perf-tools-next/jvmti/
> >       GEN     perf-iostat
> >       CC      /tmp/build/perf-tools-next/jvmti/libjvmti.o
> >       CC      /tmp/build/perf-tools-next/jvmti/jvmti_agent.o
> >     
> >     Reported-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> >     Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >     Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> >     Cc: Adrian Hunter <adrian.hunter@intel.com>
> >     Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> >     Cc: Arnd Bergmann <arnd@arndb.de>
> >     Cc: Christian Brauner <brauner@kernel.org>
> >     Cc: Guo Ren <guoren@kernel.org>
> >     Cc: Günther Noack <gnoack@google.com>
> >     Cc: Ian Rogers <irogers@google.com>
> >     Cc: Ingo Molnar <mingo@redhat.com>
> >     Cc: James Clark <james.clark@linaro.org>
> >     Cc: Jiri Olsa <jolsa@kernel.org>
> >     Cc: John Garry <john.g.garry@oracle.com>
> >     Cc: Jonathan Corbet <corbet@lwn.net>
> >     Cc: Leo Yan <leo.yan@linux.dev>
> >     Cc: Mark Rutland <mark.rutland@arm.com>
> >     Cc: Mickaël Salaün <mic@digikod.net>
> >     Cc: Mike Leach <mike.leach@linaro.org>
> >     Cc: Namhyung Kim <namhyung@kernel.org>
> >     Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >     Cc: Paul Walmsley <paul.walmsley@sifive.com>
> >     Cc: Peter Zijlstra <peterz@infradead.org>
> >     Cc: Will Deacon <will@kernel.org>
> >     Link: http://lore.kernel.org/lkml/None
> >     Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> > 
> > diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
> > index 5fb3fb3d97e0fd11..e710ed67a1b49d9f 100644
> > --- a/tools/build/Makefile.build
> > +++ b/tools/build/Makefile.build
> > @@ -12,26 +12,6 @@
> >  PHONY := __build
> >  __build:
> >  
> > -ifeq ($(V),1)
> > -  quiet =
> > -  Q =
> > -else
> > -  quiet=quiet_
> > -  Q=@
> > -endif
> > -
> > -# If the user is running make -s (silent mode), suppress echoing of commands
> > -# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
> > -ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> > -short-opts := $(firstword -$(MAKEFLAGS))
> > -else
> > -short-opts := $(filter-out --%,$(MAKEFLAGS))
> > -endif
> > -
> > -ifneq ($(findstring s,$(short-opts)),)
> > -  quiet=silent_
> > -endif
> > -
> >  build-dir := $(srctree)/tools/build
> >  
> >  # Define $(fixdep) for dep-cmd function
> > diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> > index a449d00155364422..55d6ce9ea52fb2a5 100644
> > --- a/tools/perf/Makefile.perf
> > +++ b/tools/perf/Makefile.perf
> > @@ -161,12 +161,47 @@ export VPATH
> >  SOURCE := $(shell ln -sf $(srctree)/tools/perf $(OUTPUT)/source)
> >  endif
> >  
> > +# Beautify output
> > +# ---------------------------------------------------------------------------
> > +#
> > +# Most of build commands in Kbuild start with "cmd_". You can optionally define
> > +# "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
> > +# that command is printed by default.
> > +#
> > +# e.g.)
> > +#    quiet_cmd_depmod = DEPMOD  $(MODLIB)
> > +#          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
> > +#
> > +# A simple variant is to prefix commands with $(Q) - that's useful
> > +# for commands that shall be hidden in non-verbose mode.
> > +#
> > +#    $(Q)$(MAKE) $(build)=scripts/basic
> > +#
> > +# To put more focus on warnings, be less verbose as default
> > +# Use 'make V=1' to see the full commands
> > +
> >  ifeq ($(V),1)
> > +  quiet =
> >    Q =
> >  else
> > -  Q = @
> > +  quiet=quiet_
> > +  Q=@
> >  endif
> >  
> > +# If the user is running make -s (silent mode), suppress echoing of commands
> > +# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
> > +ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> > +short-opts := $(firstword -$(MAKEFLAGS))
> > +else
> > +short-opts := $(filter-out --%,$(MAKEFLAGS))
> > +endif
> > +
> > +ifneq ($(findstring s,$(short-opts)),)
> > +  quiet=silent_
> > +endif
> > +
> > +export quiet Q
> > +
> >  # Do not use make's built-in rules
> >  # (this improves performance and avoids hard-to-debug behaviour);
> >  MAKEFLAGS += -r

