Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE36C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5BmdsxYindROyEwYQx0IEqFZPb+xMDZtfISooSkYtE=; b=cJSqhV79yZdwwz/4+fiweVy96Q
	XafRDpCbfh9vlZiGgobtZpmxyva/hxTkxbTzZyp0vKrDnvV3ux/ycIqB3YN691Dw3WiLHzi5iOuVR
	N37Z28qIzE+5/dJJeRa3KeuH5mSlQR+VBACrXtW7oNvD/gYvaYZTTmhSMU5ss59KJqbExmQiyPNTQ
	69K0XUJh8VVHgCmIM810KC/wmHsD8rjoG0coBUt1XoMOGnfk6DY+BHvTxqmSrpiOn9oXwHloWOvp9
	x6FaQYDT2+HLfv8HZ0zCuV+bSmYDNJnNFM078YAHQu72Yy2QOZl56nhNSWHfGvbMinj2ZK75QRehD
	AQf0BWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesoE-0000000F08E-0I8J;
	Mon, 03 Feb 2025 09:32:02 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teslz-0000000Ezkk-33mf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:29:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385d7f19f20so1794724f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 01:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738574982; x=1739179782; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5BmdsxYindROyEwYQx0IEqFZPb+xMDZtfISooSkYtE=;
        b=nWiuK1d9F06X/Nxx7JMVbyJgEpb3kVwxGcY51YcfqAzVVlGHksq/Jyukpq/mPMXNLX
         60jm5o6sbnu/LNncyIacC82Wg9IBdG4p4I/CThrZSX4EoSYQ4GfEzazbiKPyCbd73kQD
         32oJoeHcJf9zEif8MtrqgtqTaz3mntEgl59l6nwwpmQb8DtpIiVuu9KCN4ikLu+JpaGY
         C3hZJSDid6HU3xHZqF6Q3m1/Z0mUtfg6I0ZevLoP5n0LQQVdgfwCUy+MDmGGgqaalg3d
         +epA/HOEu0kxTC7c9oOjBZzjzMRH4nvvI8OiGgzHUebhk6dXWmHNaMufCjsV+1gtrZl0
         T6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738574982; x=1739179782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5BmdsxYindROyEwYQx0IEqFZPb+xMDZtfISooSkYtE=;
        b=N6/TjfDVGQYIHlCEl+4cgg9km9F5v8U+RlzLravqH810kSRG6stxNqdU1dJkyIKlZP
         M3rURyfuUDbCoqY04REqskylG8FKqPW8bO1U+b0+D1vpXtlP+N+/m5veH//NgdTu6K3u
         RD+1NvtRE/dLzovfvqT7CcL6bXMnHLCAqhs3xy5pyTkW7/l96RZLppCcpP3dDuQLAn7V
         N30bMW9jFFSEsTZH6e5a+wHXFS8AwSOhed+rmnkko86CdZXRDVxdaPbhuou2IBZ0ePZr
         /vSGcFx17ZCNMd525HQpxJZmoy2pJuvP+vZP3EMGuOJkuQdGNSNqxihi2Ofk2hGk67/J
         YfEg==
X-Forwarded-Encrypted: i=1; AJvYcCX1BxQ7y3bZV82gmUpZjmMvmpN6Ls60ZXVdofOe+6yWywo1bCQdSTuP/l1p5b8Y5eMxzI6pYcHKTQGFNU5Zmtmi@lists.infradead.org
X-Gm-Message-State: AOJu0YwfRW+ZFxEN8dcOnRl0ipSzfmXEUDn83EkU8G5G33xtfdBZJzJ7
	mD310nZGVp7x3bziDEnPc+/ykrlEBbsYzSxTf8YVe2Uutm2GEkwZ
X-Gm-Gg: ASbGncvdEMJGi03rUe4Aqo7ih5sMcBCJsE6+0bn1VLFSKCv22b5cm+zvUITBTToXgFw
	e1kQctuJoLEZmUFVTQoNZlbKbyffMJycQ6LL6fJAfIBqtXkKN9JxdQlttByQjxrLF5e+kj8w6Tb
	QEQOnFaxYZQhhr96jyyYzSI/8u3EZ+OM+giq1VbM+fTu3QZagEBMuXC3nkgepK4pukKaq29nhOY
	l7GjZ9pDnuef/77O+7rTgfVrD3nObm9j0Y3yTdGKx3uT+Pwigp73s1jinOZ9xClwtiiOUx1kjF2
	WaGyDKJ0auz8ppymKCAU9Wgi++V7+UotN7y3i8Fuw1bRQYZ3
X-Google-Smtp-Source: AGHT+IFuHW3hM3BOGY6M8cP0ZLEbBCcmhBayM4i5XZ+NC6RZgJD3BLrQOTvbi7YGzPw1vjzIo5sGpA==
X-Received: by 2002:a5d:648b:0:b0:385:fc97:9c63 with SMTP id ffacd0b85a97d-38c51930c8dmr15385208f8f.9.1738574981803;
        Mon, 03 Feb 2025 01:29:41 -0800 (PST)
Received: from krava (213.11-246-81.adsl-static.isp.belgacom.be. [81.246.11.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ece21sm12028822f8f.20.2025.02.03.01.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:29:41 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 3 Feb 2025 10:29:39 +0100
To: Charlie Jenkins <charlie@rivosinc.com>
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
Message-ID: <Z6CMg7uNReyGTq4y@krava>
References: <20250114-perf_make_test-v1-1-decc1c517b11@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114-perf_make_test-v1-1-decc1c517b11@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_012943_761776_3DE1D239 
X-CRM114-Status: GOOD (  24.62  )
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

On Tue, Jan 14, 2025 at 11:35:44AM -0800, Charlie Jenkins wrote:
> The variables to make builds silent/verbose live inside
> tools/build/Makefile.build. Move those variables to the top-level
> Makefile.perf to be generally available.
> 
> Committer testing:
> 
> See the SYSCALL lines, now they are consistent with the other
> operations in other lines:
>   SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_32.h
>   SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_64.h
>   GEN     /tmp/build/perf-tools-next/common-cmds.h
>   GEN     /tmp/build/perf-tools-next/arch/arm64/include/generated/asm/sysreg-defs.h
>   PERF_VERSION = 6.13.rc2.g3d94bb6ed1d0
>   GEN     perf-archive
>   MKDIR   /tmp/build/perf-tools-next/jvmti/
>   MKDIR   /tmp/build/perf-tools-next/jvmti/
>   MKDIR   /tmp/build/perf-tools-next/jvmti/
>   MKDIR   /tmp/build/perf-tools-next/jvmti/
>   GEN     perf-iostat
>   CC      /tmp/build/perf-tools-next/jvmti/libjvmti.o
> 
> Reported-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> ---
>  tools/build/Makefile.build                | 20 -----------------
>  tools/perf/Makefile.perf                  | 37 ++++++++++++++++++++++++++++++-
>  tools/perf/tests/shell/coresight/Makefile |  2 +-
>  3 files changed, 37 insertions(+), 22 deletions(-)
> 
> diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
> index 5fb3fb3d97e0fd114e245805809e4fc926b4343e..e710ed67a1b49d9fda11db02821bbd8d36066b44 100644
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

hi,
if we move this out of here, we need to fix other tools that rely on that,
bpftool and resolve_btfids do not build quietly now

but not sure what was the reason of moving it out, the code in Makefile.perf
seems same as the one above

thanks,
jirka


>  
>  # Define $(fixdep) for dep-cmd function
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index a449d0015536442273a9268b37be34e4757f577a..55d6ce9ea52fb2a57b8632cc6d0ddc501e29cbfc 100644
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
> diff --git a/tools/perf/tests/shell/coresight/Makefile b/tools/perf/tests/shell/coresight/Makefile
> index b070e779703e9fbd70f88c826172b2150ee3d302..fa08fd9a5991dd889583edc1afe8304e72278f64 100644
> --- a/tools/perf/tests/shell/coresight/Makefile
> +++ b/tools/perf/tests/shell/coresight/Makefile
> @@ -24,6 +24,6 @@ CLEANDIRS = $(SUBDIRS:%=clean-%)
>  
>  clean: $(CLEANDIRS)
>  $(CLEANDIRS):
> -	$(call QUIET_CLEAN, test-$(@:clean-%=%)) $(Q)$(MAKE) -C $(@:clean-%=%) clean >/dev/null
> +	$(call QUIET_CLEAN, test-$(@:clean-%=%)) $(MAKE) -C $(@:clean-%=%) clean >/dev/null
>  
>  .PHONY: all clean $(SUBDIRS) $(CLEANDIRS) $(INSTALLDIRS)
> 
> ---
> base-commit: e9cbc854d8b148e3491291fb615e94261970fb54
> change-id: 20250114-perf_make_test-1141d4ad8877
> -- 
> - Charlie
> 

