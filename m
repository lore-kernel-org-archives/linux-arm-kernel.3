Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF724C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+RIS1anmyO42kqLe5kMSgXbeXH0p5fPwJzPiSotpnQ=; b=ne3ur3y1bAkGCUu0zK90xiJ9KE
	ZUFO3KEB7Qc31Mho0Wf5N59KJ7Uj5gPJP3pC67LxEE2IAcjlFTNoKrKO7V+9SkvAh9GF8cSyDf12v
	y+UdXPuf6+hyWExjthQm0NaKjZsTxkLYDSli0TbkJkyjxGoDL2gPkkl9WurX3om9xx6RkuTZL9C7c
	rrASITISa7CivPehfkAIu8C1LfGidj+PqDvMW53KbM2VoHJsdekuwtqyv8GcKXiX/MvL4jC6hek5k
	5MNcnVY1PpEx9pBQua1XV+WJhKbhjuijXIVI/+PxLSDS07M3QWmH8GyoCIn+kReUQV7PCa+aJkuYu
	YL6uQ0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1kB-0000000GOrC-2oZh;
	Mon, 03 Feb 2025 19:04:27 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1cs-0000000GLnW-0edn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:56:55 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso6246647a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 10:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738609013; x=1739213813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J+RIS1anmyO42kqLe5kMSgXbeXH0p5fPwJzPiSotpnQ=;
        b=nwrDOBceNNpXBY6pw4Fea/6H83R09mik9qCX7UruM9IiDuWaxukQMgc4KJSjYGcJXc
         +3Z15h9jWM6tNbZLoOOJ84oDybxG5EfgMUAutPVVrJ8k4RARlEFqPz3z7dQ7d8eTgo8r
         sGjIBng9PvyVSgejpS+u3x1440pKdNBpcHyOMlzd0yUruseg4NcKuNsZx1vuGiQNIFOW
         muXrANnkmINpF75BMRf0f1EaV1XsnYMnudyu6mPDbltFVGBsADDVH2wcLjRrJvkCptgP
         +cbnPMp8RjacJHiWwDrc/HboLZ2zbngW5p/BGOnjV/LC1Lc1CYkZxuG02/OXRSI8xhse
         AMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738609013; x=1739213813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+RIS1anmyO42kqLe5kMSgXbeXH0p5fPwJzPiSotpnQ=;
        b=KJ5tWrb0h49j5G1rdzazfepkqLFkgGIemxpDC3eia416iwg+Xv+GQ9xOgCzNqIknBw
         mwVA0C4TECsYCJitO2DbYPRNatGLlFhMOC9qqaXT1HI5q77WjJbHCvmOyJjAvIduM481
         /OR/BKzd2Sn497Mcbjqk3ZOU5GPkHV4jQKg7H8rylyyUcNAONDK6oUHHOg4Awxg0Q74v
         NNvIj4WVArad4/WBTXa2ko+5aSmUvE1w/nq1k2rDWZ9TVmROtqQOSkVmCLAglvlfAC1n
         CZUUJiH6sGnToVtNUWIl4hsGU3CS9JXfRF5Jh7UJx5H5pkODdLmA5LjX75WsIe/WyvmL
         AxyA==
X-Forwarded-Encrypted: i=1; AJvYcCVtc+pIcvz/T1vwhllEEz9nfI/HRd9kPYdGsJI2ewsCFbhtQ73K8W8a9gTYgIoX46S4As7u7znCuU0il1F70l22@lists.infradead.org
X-Gm-Message-State: AOJu0YxRgR4H4SxL0V8udVg9sKL2aewSKRtguUJ7AEAYswX4K5A/K4G+
	NVrJkBbjtQUVXeKrt7DKVbA0LuhwP/Uzzg1KRBY8oDFxZuPg+onTxkLomzJhQVQ=
X-Gm-Gg: ASbGncv0tisL6EdD8YYraZ7x0bO40dWc7isvJ6fpDrsv/ddSbGozsOrruBGXxEPPLgR
	qgytIuamp2xuoV6LdZJsBBP2aPp1JU2DzTkrI2g2Hn8qodmgfvWG+eljqZuOgbDoCrVmPM5sG2T
	MHdius4AIjTll3XfsziHlFag28YFXNvH2QbDh6fKYyeoJmg+lI4fh9Yp1+UdA/9jL4Kj9GVxdj8
	LlBvqS+x5o7eqo5aNjuHCzaNiapr74xPdDXHjbzP+g/ig1CZm/r6h1KETEYJuSjSMBt7NciYg6y
	hqqp+cZIDQM=
X-Google-Smtp-Source: AGHT+IGBmJ3n/5uuBCltpU7FGXXIJ95WtPO9k4G8JoNSK3omRq612AYeWOBWSdlpT4yrQ1aVkRoDkQ==
X-Received: by 2002:a17:90b:2dca:b0:2ee:b666:d14a with SMTP id 98e67ed59e1d1-2f83ac00cf5mr37307194a91.17.1738609012878;
        Mon, 03 Feb 2025 10:56:52 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4f63:f9d5:2cbd:2947])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848a99a91sm9433086a91.36.2025.02.03.10.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:56:52 -0800 (PST)
Date: Mon, 3 Feb 2025 10:56:48 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Daniel Xu <dxu@dxuuu.xyz>
Subject: Re: [PATCH FOR-NEXT] perf tools: Expose quiet/verbose variables in
 Makefile.perf
Message-ID: <Z6ERcG6ZAqL1cFAo@ghost>
References: <20250114-perf_make_test-v1-1-decc1c517b11@rivosinc.com>
 <Z6CMg7uNReyGTq4y@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6CMg7uNReyGTq4y@krava>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_105654_404954_57789072 
X-CRM114-Status: GOOD (  32.96  )
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

On Mon, Feb 03, 2025 at 10:29:39AM +0100, Jiri Olsa wrote:
> On Tue, Jan 14, 2025 at 11:35:44AM -0800, Charlie Jenkins wrote:
> > The variables to make builds silent/verbose live inside
> > tools/build/Makefile.build. Move those variables to the top-level
> > Makefile.perf to be generally available.
> > 
> > Committer testing:
> > 
> > See the SYSCALL lines, now they are consistent with the other
> > operations in other lines:
> >   SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_32.h
> >   SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_64.h
> >   GEN     /tmp/build/perf-tools-next/common-cmds.h
> >   GEN     /tmp/build/perf-tools-next/arch/arm64/include/generated/asm/sysreg-defs.h
> >   PERF_VERSION = 6.13.rc2.g3d94bb6ed1d0
> >   GEN     perf-archive
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> >   GEN     perf-iostat
> >   CC      /tmp/build/perf-tools-next/jvmti/libjvmti.o
> > 
> > Reported-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> > ---
> >  tools/build/Makefile.build                | 20 -----------------
> >  tools/perf/Makefile.perf                  | 37 ++++++++++++++++++++++++++++++-
> >  tools/perf/tests/shell/coresight/Makefile |  2 +-
> >  3 files changed, 37 insertions(+), 22 deletions(-)
> > 
> > diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
> > index 5fb3fb3d97e0fd114e245805809e4fc926b4343e..e710ed67a1b49d9fda11db02821bbd8d36066b44 100644
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
> 
> hi,
> if we move this out of here, we need to fix other tools that rely on that,
> bpftool and resolve_btfids do not build quietly now
> 
> but not sure what was the reason of moving it out, the code in Makefile.perf
> seems same as the one above

perf/Makefile.syscalls wanted to support quiet building. Makefile.perf
imports both Makefile.syscalls and Makefile.build, so I moved this quiet
infrastructure into Makefile.perf so that both of these files could use
it.

I was trying to move the quiet infrastructure higher up in the callchain
so that the code did not need to be duplicated. Perhaps it is better to
move this into a separate file that exports "quiet" and "Q" and then can
be imported from bpf/Makefile, perf/Makefile.perf, and any other tool
that wants to have quiet builds?

- Charlie

> 
> thanks,
> jirka
> 
> 
> >  
> >  # Define $(fixdep) for dep-cmd function
> > diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> > index a449d0015536442273a9268b37be34e4757f577a..55d6ce9ea52fb2a57b8632cc6d0ddc501e29cbfc 100644
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
> > diff --git a/tools/perf/tests/shell/coresight/Makefile b/tools/perf/tests/shell/coresight/Makefile
> > index b070e779703e9fbd70f88c826172b2150ee3d302..fa08fd9a5991dd889583edc1afe8304e72278f64 100644
> > --- a/tools/perf/tests/shell/coresight/Makefile
> > +++ b/tools/perf/tests/shell/coresight/Makefile
> > @@ -24,6 +24,6 @@ CLEANDIRS = $(SUBDIRS:%=clean-%)
> >  
> >  clean: $(CLEANDIRS)
> >  $(CLEANDIRS):
> > -	$(call QUIET_CLEAN, test-$(@:clean-%=%)) $(Q)$(MAKE) -C $(@:clean-%=%) clean >/dev/null
> > +	$(call QUIET_CLEAN, test-$(@:clean-%=%)) $(MAKE) -C $(@:clean-%=%) clean >/dev/null
> >  
> >  .PHONY: all clean $(SUBDIRS) $(CLEANDIRS) $(INSTALLDIRS)
> > 
> > ---
> > base-commit: e9cbc854d8b148e3491291fb615e94261970fb54
> > change-id: 20250114-perf_make_test-1141d4ad8877
> > -- 
> > - Charlie
> > 

