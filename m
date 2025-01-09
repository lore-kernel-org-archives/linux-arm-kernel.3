Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBE9E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 02:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuHlyCZ2v8Z/UOiT+zevmWuAaJTETQXAMxBjxTo/5Xo=; b=uqhyFdFkwChwFDwplvAOgZ/MeT
	3cWHhPtSnpc1MPHzuLDr4ffVqvAV2ygqDrbzCxUDGUD2+9GGetY7qjX5ftKOZRFwG+MfM7hMwbVla
	iF2T6vklTUzbSlJoFR+w4/3dy3VS2PYzrKL748QWUtN2602+og3ADDtxpBI4GcExD6Rsr/Ysy5i72
	oKYMdsyxJrLcBe5/SvRn9qYu+cycvwMQHoaiJi5trUOu6R/h3TgKWrQwCjT/rHRVuj30XK1s2oAj4
	APZRER+CcMpT2UM0tynU9h1uKUx5mKWyz1JD35F0k2uwLGRySbabWUsojqlI2dDW0OG15GDPBuumM
	o5sS0WAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tViKD-0000000AQlK-0fps;
	Thu, 09 Jan 2025 02:31:09 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tViIX-0000000AQ5l-2MH2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 02:29:27 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so576107a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 18:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736389764; x=1736994564; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tuHlyCZ2v8Z/UOiT+zevmWuAaJTETQXAMxBjxTo/5Xo=;
        b=nmJWO0g8fby0rQDvj0aLAptKX8wvvvbVB0JC9iC8JPZ8r7uZYVtUus6g+9jljIPHvP
         Pznr36IX2rUmS7vixZGboETE5njGI//aGB8C+dKXpkpbY4ZLfcMb86GJFOcUjowvEqIJ
         sIabE4nBK2oP0MBlMd5vuQYKVo3K912pN8M0c7M6XF7VLcb4V7FSEqsCvV8hXkELn5NV
         P+pf7/epezkxO0SgmtxQwmmO68eAJSPiAPJ3uJTwqiMw2sj1RBBO8302SguhrE57kOWz
         c/hAbbelEXGw+tUen2lLI9pjk+YAVX07yGLzPIasVx8kA+E6O7zlMtlsnzDZFfILUHoY
         kaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389764; x=1736994564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuHlyCZ2v8Z/UOiT+zevmWuAaJTETQXAMxBjxTo/5Xo=;
        b=T8bX+qXIdoNVmbu9rBuMvoONJB5TCueALBM8hgG5Ccoh/0xl1U/ohdwNtYd4cWTCXp
         fqzcu2SIySsPBCEGIc+pzfgZgU0QqFLTyL/q9TogajTccq1dTTCKfDUFO6gP3nYT1/AJ
         2DT+hoYi5kRA4NeWQfiZwPSkKBbEslJ8sCjuK2bz+hIFHiFh6lMYoGEsy7+I8hswr1Bx
         5kcIA2vGJA35ecaTdbjbcoGn65udBIbOqH8K/Vgj6VzmLTXKXUZ1dvYIC/Rn2lBtHSzT
         aVdNFHPpN18lt78MiNdEp7k2KHkGVIXCor5TxyK52+et2PJn4ktSEUkQQBfrmC+vj1Vl
         LIGw==
X-Forwarded-Encrypted: i=1; AJvYcCUa+x3cgRrcVBvH1Afps7ekE3hhSAwhIzGFraZo0CRzPtSibCg2urYv2nfMQRiTl/2wXZ80IZc+8jCZ72qw9FlP@lists.infradead.org
X-Gm-Message-State: AOJu0YxB4UERLkuz860YyWIXUPpiDhESKX+e5IfKoNxZbH4kvGr1Rk1u
	MiGbaYy+EoZtYBsmiR9cUpgKTGfcmov5xQfhgJgEPzcHBvkf8Det8mVbvuLiBuY=
X-Gm-Gg: ASbGncvp8U5DX2CxLOEG/WmXt5JH/xufLn3l8M4YEWnu0BKk8glTwcnRGabOh9mSvwV
	xX7fdH9zX7IaiKgqxhdpYqKV5k5B3eB4Qf6br3sz3STsyMcHXakzVFkFGzNVPBYDMg/orOE53iq
	Gc/PS8Ej/Bk+xaXHKC841GG19LcrgmPdBVQUIjwAxjxprQB18DovN3NhZSGOcT3QU2snnAkbesy
	bGw43pnrfOilIMnxZVWkc+jKWJDomJ4UgF3l2gPe0CZV9c=
X-Google-Smtp-Source: AGHT+IEiW0hQMlynZLTeSqEG8t5Hx4KJYijsRSL5BopHzTcxKBDRtDH+iOQvqvSzplZg51yWB1kRWw==
X-Received: by 2002:a05:6a00:e8e:b0:72a:bc6a:3a87 with SMTP id d2e1a72fcca58-72d21df17bfmr7052394b3a.0.1736389764464;
        Wed, 08 Jan 2025 18:29:24 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d4d6b477sm161833a12.61.2025.01.08.18.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 18:29:23 -0800 (PST)
Date: Wed, 8 Jan 2025 18:29:20 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
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
Subject: Re: [PATCH v5 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z380gLRYAKVPVEet@ghost>
References: <20250107-perf_syscalltbl-v5-0-935de46d3175@rivosinc.com>
 <Z368mNynBTDWPM6R@google.com>
 <Z37-t9fhnmSghIPe@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z37-t9fhnmSghIPe@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_182925_874236_CC6453DD 
X-CRM114-Status: GOOD (  41.93  )
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

On Wed, Jan 08, 2025 at 07:39:51PM -0300, Arnaldo Carvalho de Melo wrote:
> On Wed, Jan 08, 2025 at 09:57:44AM -0800, Namhyung Kim wrote:
> > Hello,
> > 
> > On Tue, Jan 07, 2025 at 06:07:48PM -0800, Charlie Jenkins wrote:
> > > Standardize the generation of syscall headers around syscall tables.
> > > Previously each architecture independently selected how syscall headers
> > > would be generated, or would not define a way and fallback onto
> > > libaudit. Convert all architectures to use a standard syscall header
> > > generation script and allow each architecture to override the syscall
> > > table to use if they do not use the generic table.
> > > 
> > > As a result of these changes, no architecture will require libaudit, and
> > > so the fallback case of using libaudit is removed by this series.
> > > 
> > > Testing:
> > > 
> > > I have tested that the syscall mappings of id to name generation works
> > > as expected for every architecture, but I have only validated that perf
> > > trace compiles and runs as expected on riscv, arm64, and x86_64.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > Reviewed-by: Ian Rogers <irogers@google.com>
> > > Tested-by: Ian Rogers <irogers@google.com>
> > 
> > Acked-by: Namhyung Kim <namhyung@kernel.org>
> 
> So, somehow the first patch of this series didn't reach my inbox, b4
> found it, and in it perf now does;
> 
> tools/perf/scripts/Makefile.syscalls
> 
>   include $(srctree)/scripts/Kbuild.include
> 
> I.e. it uses a file that is outside tools/ so normal devel in the kernel
> community may end up breaking tools/ living code, something we decided
> not to have.
> 
> I noticed this while doing a: "make -C tools/perf build-test", the first
> test creates a perf tarball and then tries to build it after
> uncompressing it somewhere out of the checked out kernel source tree:
> 
> ⬢ [acme@toolbox perf-tools-next]$ make help | grep perf
>   perf-tar-src-pkg    - Build the perf source tarball with no compression
>   perf-targz-src-pkg  - Build the perf source tarball with gzip compression
>   perf-tarbz2-src-pkg - Build the perf source tarball with bz2 compression
>   perf-tarxz-src-pkg  - Build the perf source tarball with xz compression
>   perf-tarzst-src-pkg - Build the perf source tarball with zst compression
> ⬢ [acme@toolbox perf-tools-next]$ make perf-tarxz-src-pkg
>   UPD     .tmp_HEAD
>   COPY    .tmp_perf/HEAD
>   GEN     .tmp_perf/PERF-VERSION-FILE
>   PERF_VERSION = 6.13.rc2.g48d3eefaa683
>   ARCHIVE perf-6.13.0-rc2.tar.xz
> ⬢ [acme@toolbox perf-tools-next]$ mv perf-6.13.0-rc2.tar.xz ~
> ⬢ [acme@toolbox perf-tools-next]$ cd ~
> ⬢ [acme@toolbox ~]$ tar xvf perf-6.13.0-rc2.tar.xz | tail -5
> perf-6.13.0-rc2/tools/scripts/Makefile.include
> perf-6.13.0-rc2/tools/scripts/syscall.tbl
> perf-6.13.0-rc2/tools/scripts/utilities.mak
> perf-6.13.0-rc2/HEAD
> perf-6.13.0-rc2/PERF-VERSION-FILE
> ⬢ [acme@toolbox ~]$ cd perf-6.13.0-rc2/
> ⬢ [acme@toolbox perf-6.13.0-rc2]$ make -C tools/perf
> make: Entering directory '/home/acme/perf-6.13.0-rc2/tools/perf'
>   BUILD:   Doing 'make -j28' parallel build
> Warning: Skipped check-headers due to missing ../../include
> 
> Auto-detecting system features:
> ...                                   libdw: [ on  ]
> ...                                   glibc: [ on  ]
> ...                                  libbfd: [ on  ]
> ...                          libbfd-buildid: [ on  ]
> ...                                  libelf: [ on  ]
> ...                                 libnuma: [ on  ]
> ...                  numa_num_possible_cpus: [ on  ]
> ...                                 libperl: [ on  ]
> ...                               libpython: [ on  ]
> ...                               libcrypto: [ on  ]
> ...                               libunwind: [ on  ]
> ...                             libcapstone: [ on  ]
> ...                               llvm-perf: [ on  ]
> ...                                    zlib: [ on  ]
> ...                                    lzma: [ on  ]
> ...                               get_cpuid: [ on  ]
> ...                                     bpf: [ on  ]
> ...                                  libaio: [ on  ]
> ...                                 libzstd: [ on  ]
> 
> /home/acme/perf-6.13.0-rc2/tools/perf/scripts/Makefile.syscalls:18: /home/acme/perf-6.13.0-rc2/scripts/Kbuild.include: No such file or directory
> make[2]: *** No rule to make target '/home/acme/perf-6.13.0-rc2/scripts/Kbuild.include'.  Stop.
> make[1]: *** [Makefile.perf:286: sub-make] Error 2
> make: *** [Makefile:76: all] Error 2
> make: Leaving directory '/home/acme/perf-6.13.0-rc2/tools/perf'
> ⬢ [acme@toolbox perf-6.13.0-rc2]$ 
> 
> This would probably (it does, just tested, but read on) make it work:
> 
> ⬢ [acme@toolbox perf-tools-next]$ git diff
> diff --git a/tools/perf/MANIFEST b/tools/perf/MANIFEST
> index dc42de1785cee715..83ef5d1365880929 100644
> --- a/tools/perf/MANIFEST
> +++ b/tools/perf/MANIFEST
> @@ -22,6 +22,7 @@ tools/lib/str_error_r.c
>  tools/lib/vsprintf.c
>  tools/lib/zalloc.c
>  scripts/bpf_doc.py
> +scripts/Kbuild.include
>  tools/bpf/bpftool
>  kernel/bpf/disasm.c
>  kernel/bpf/disasm.h
> ⬢ [acme@toolbox perf-tools-next]$
> 
> As now we would find it, but then it references some other part of the
> kernel's Kbuild system:
> 
> ⬢ [acme@toolbox perf-tools-next]$ grep -w srctree scripts/Kbuild.include
> build := -f $(srctree)/scripts/Makefile.build obj
> clean := -f $(srctree)/scripts/Makefile.clean obj
> ⬢ [acme@toolbox perf-tools-next]$
> 
> And perf has:
> 
> ⬢ [acme@toolbox perf-tools-next]$ find tools/ -name Makefile.build
> tools/build/Makefile.build
> ⬢ [acme@toolbox perf-tools-next]$
> 
> And we also have:
> 
> ⬢ [acme@toolbox perf-tools-next]$ ls -la tools/scripts/
> total 40
> drwxr-xr-x. 1 acme acme   106 Jan  8 19:13 .
> drwxr-xr-x. 1 acme acme   514 Jan  8 11:39 ..
> -rw-r--r--. 1 acme acme  1224 Jan  8 11:41 Makefile.arch
> -rw-r--r--. 1 acme acme  6205 Dec 20 21:48 Makefile.include
> -rw-r--r--. 1 acme acme 17401 Jan  8 19:13 syscall.tbl
> -rw-r--r--. 1 acme acme  6186 Dec 20 21:48 utilities.mak
> ⬢ [acme@toolbox perf-tools-next]$
> 
> And:
> 
> ⬢ [acme@toolbox perf-tools-next]$ grep -w build tools/build/Makefile.include 
> build := -f $(srctree)/tools/build/Makefile.build dir=. obj
> 	$(SILENT_MAKE) -C $(srctree)/tools/build CFLAGS= LDFLAGS= $(OUTPUT)fixdep
> 	$(Q)$(MAKE) -C $(srctree)/tools/build clean
> ⬢ [acme@toolbox perf-tools-next]$
> 
> That is also in:
> 
> ⬢ [acme@toolbox perf-tools-next]$ grep -w build scripts/Kbuild.include 
> # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
> # $(Q)$(MAKE) $(build)=dir
> build := -f $(srctree)/scripts/Makefile.build obj
> # the interrupted recipe. So, you can safely stop the build by Ctrl-C (Make
> # (1) PHONY targets are always build
> # (2) No target, so we better build it
> ⬢ [acme@toolbox perf-tools-next]$
> 
> So it seems we need to look at what we're using from the kernel's
> scripts/Makefile.build to have it in a tools/build/ file.
> 
> Its late here and I'll have to stop at this point, please take a look to
> see if this can be easily resolved so that we can merge your series, I
> very much like to say goodbye to one more tools/perf library dependency
> :-)

Thank you for pointing this out. We can use tools/build/Build.include
which seems to have everything that is required.  A "space" convenience
variable needs to be added, but that is all. I'll send an updated
version with that change.

- Charlie

> 
> Best regards,
> 
> - Arnaldo

