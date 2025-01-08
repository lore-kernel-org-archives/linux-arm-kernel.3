Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9858BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Giu1Vp3unZU017+peCxn7w/tElsW+tmljAnNirxv8ls=; b=fn9egCSUIWqYGstiGy4ZL48sor
	Mns3KCGyieyqq1hOTAN99xDWsqqWQVFpWcMYoyXfTIq51+m1dXKNAttSD+qEMBDUmwbw8L1XIS4KP
	hXjRXTW6qeT9hUQX2+paaUhm3oK28hmh6TDcsnasevNizQdiBn+amL+GRwVxlJUHyVVi4ND9o5wYZ
	XrTLcQKI9gdBCC/5eM1xyBNt+9k5Q+ZeSa6DHn70ljkL9/fgdBS8wh+7UQwOw+CFmjGZGRhynhoLL
	ACv9h+Ch5eDhFeVaCoOaJfSaag/dSIMdnSxPBblPXue/k5pH5eREw4B03CWTWvLBitgZbhlVdim0+
	VX8IPm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVejf-0000000A3N1-3idW;
	Wed, 08 Jan 2025 22:41:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVeiR-0000000A3Dc-3xXw;
	Wed, 08 Jan 2025 22:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20DE35C04F7;
	Wed,  8 Jan 2025 22:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518F2C4CEE1;
	Wed,  8 Jan 2025 22:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736375994;
	bh=aBBMJt3YnEOGFN+NC1GBIijIU/2oGQEkFVJlezEYi8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/mZSHn5KPJvphh3IbFUFXaOK+YsJHIj11RQFS6EltlqcN2L4/AU8P8QQBxtmvEHw
	 xyWJ2Et4X/wp9bDq9bOc9SM5v3m/vjqOleZWnfW7VYyfAMZxWd7Ud4XolcB5RWX/8n
	 vTY5kVet5gsG0aLzqTDd0NvEDVhCGRwL9Ci1gUNZPeNUiRfcPPS6YvsOtYfKAqXP9v
	 fnRyN1RuNrcyOulTxuMWG5FdOk7ZdbI17eiY2KSnw/i5unp57PblOwd/+7uNlD3suD
	 nNvDeZsB6ZuQVr5PiYVjks8VpN2vIC07ztEHFvwvcRYqlUA9kHsBFWSHJRYSv3BCE6
	 Ufbqh7CgKXE+A==
Date: Wed, 8 Jan 2025 19:39:51 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
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
Message-ID: <Z37-t9fhnmSghIPe@x1>
References: <20250107-perf_syscalltbl-v5-0-935de46d3175@rivosinc.com>
 <Z368mNynBTDWPM6R@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z368mNynBTDWPM6R@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_143956_650574_E00FB021 
X-CRM114-Status: GOOD (  27.78  )
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

On Wed, Jan 08, 2025 at 09:57:44AM -0800, Namhyung Kim wrote:
> Hello,
> 
> On Tue, Jan 07, 2025 at 06:07:48PM -0800, Charlie Jenkins wrote:
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
> 
> Acked-by: Namhyung Kim <namhyung@kernel.org>

So, somehow the first patch of this series didn't reach my inbox, b4
found it, and in it perf now does;

tools/perf/scripts/Makefile.syscalls

  include $(srctree)/scripts/Kbuild.include

I.e. it uses a file that is outside tools/ so normal devel in the kernel
community may end up breaking tools/ living code, something we decided
not to have.

I noticed this while doing a: "make -C tools/perf build-test", the first
test creates a perf tarball and then tries to build it after
uncompressing it somewhere out of the checked out kernel source tree:

⬢ [acme@toolbox perf-tools-next]$ make help | grep perf
  perf-tar-src-pkg    - Build the perf source tarball with no compression
  perf-targz-src-pkg  - Build the perf source tarball with gzip compression
  perf-tarbz2-src-pkg - Build the perf source tarball with bz2 compression
  perf-tarxz-src-pkg  - Build the perf source tarball with xz compression
  perf-tarzst-src-pkg - Build the perf source tarball with zst compression
⬢ [acme@toolbox perf-tools-next]$ make perf-tarxz-src-pkg
  UPD     .tmp_HEAD
  COPY    .tmp_perf/HEAD
  GEN     .tmp_perf/PERF-VERSION-FILE
  PERF_VERSION = 6.13.rc2.g48d3eefaa683
  ARCHIVE perf-6.13.0-rc2.tar.xz
⬢ [acme@toolbox perf-tools-next]$ mv perf-6.13.0-rc2.tar.xz ~
⬢ [acme@toolbox perf-tools-next]$ cd ~
⬢ [acme@toolbox ~]$ tar xvf perf-6.13.0-rc2.tar.xz | tail -5
perf-6.13.0-rc2/tools/scripts/Makefile.include
perf-6.13.0-rc2/tools/scripts/syscall.tbl
perf-6.13.0-rc2/tools/scripts/utilities.mak
perf-6.13.0-rc2/HEAD
perf-6.13.0-rc2/PERF-VERSION-FILE
⬢ [acme@toolbox ~]$ cd perf-6.13.0-rc2/
⬢ [acme@toolbox perf-6.13.0-rc2]$ make -C tools/perf
make: Entering directory '/home/acme/perf-6.13.0-rc2/tools/perf'
  BUILD:   Doing 'make -j28' parallel build
Warning: Skipped check-headers due to missing ../../include

Auto-detecting system features:
...                                   libdw: [ on  ]
...                                   glibc: [ on  ]
...                                  libbfd: [ on  ]
...                          libbfd-buildid: [ on  ]
...                                  libelf: [ on  ]
...                                 libnuma: [ on  ]
...                  numa_num_possible_cpus: [ on  ]
...                                 libperl: [ on  ]
...                               libpython: [ on  ]
...                               libcrypto: [ on  ]
...                               libunwind: [ on  ]
...                             libcapstone: [ on  ]
...                               llvm-perf: [ on  ]
...                                    zlib: [ on  ]
...                                    lzma: [ on  ]
...                               get_cpuid: [ on  ]
...                                     bpf: [ on  ]
...                                  libaio: [ on  ]
...                                 libzstd: [ on  ]

/home/acme/perf-6.13.0-rc2/tools/perf/scripts/Makefile.syscalls:18: /home/acme/perf-6.13.0-rc2/scripts/Kbuild.include: No such file or directory
make[2]: *** No rule to make target '/home/acme/perf-6.13.0-rc2/scripts/Kbuild.include'.  Stop.
make[1]: *** [Makefile.perf:286: sub-make] Error 2
make: *** [Makefile:76: all] Error 2
make: Leaving directory '/home/acme/perf-6.13.0-rc2/tools/perf'
⬢ [acme@toolbox perf-6.13.0-rc2]$ 

This would probably (it does, just tested, but read on) make it work:

⬢ [acme@toolbox perf-tools-next]$ git diff
diff --git a/tools/perf/MANIFEST b/tools/perf/MANIFEST
index dc42de1785cee715..83ef5d1365880929 100644
--- a/tools/perf/MANIFEST
+++ b/tools/perf/MANIFEST
@@ -22,6 +22,7 @@ tools/lib/str_error_r.c
 tools/lib/vsprintf.c
 tools/lib/zalloc.c
 scripts/bpf_doc.py
+scripts/Kbuild.include
 tools/bpf/bpftool
 kernel/bpf/disasm.c
 kernel/bpf/disasm.h
⬢ [acme@toolbox perf-tools-next]$

As now we would find it, but then it references some other part of the
kernel's Kbuild system:

⬢ [acme@toolbox perf-tools-next]$ grep -w srctree scripts/Kbuild.include
build := -f $(srctree)/scripts/Makefile.build obj
clean := -f $(srctree)/scripts/Makefile.clean obj
⬢ [acme@toolbox perf-tools-next]$

And perf has:

⬢ [acme@toolbox perf-tools-next]$ find tools/ -name Makefile.build
tools/build/Makefile.build
⬢ [acme@toolbox perf-tools-next]$

And we also have:

⬢ [acme@toolbox perf-tools-next]$ ls -la tools/scripts/
total 40
drwxr-xr-x. 1 acme acme   106 Jan  8 19:13 .
drwxr-xr-x. 1 acme acme   514 Jan  8 11:39 ..
-rw-r--r--. 1 acme acme  1224 Jan  8 11:41 Makefile.arch
-rw-r--r--. 1 acme acme  6205 Dec 20 21:48 Makefile.include
-rw-r--r--. 1 acme acme 17401 Jan  8 19:13 syscall.tbl
-rw-r--r--. 1 acme acme  6186 Dec 20 21:48 utilities.mak
⬢ [acme@toolbox perf-tools-next]$

And:

⬢ [acme@toolbox perf-tools-next]$ grep -w build tools/build/Makefile.include 
build := -f $(srctree)/tools/build/Makefile.build dir=. obj
	$(SILENT_MAKE) -C $(srctree)/tools/build CFLAGS= LDFLAGS= $(OUTPUT)fixdep
	$(Q)$(MAKE) -C $(srctree)/tools/build clean
⬢ [acme@toolbox perf-tools-next]$

That is also in:

⬢ [acme@toolbox perf-tools-next]$ grep -w build scripts/Kbuild.include 
# Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
# $(Q)$(MAKE) $(build)=dir
build := -f $(srctree)/scripts/Makefile.build obj
# the interrupted recipe. So, you can safely stop the build by Ctrl-C (Make
# (1) PHONY targets are always build
# (2) No target, so we better build it
⬢ [acme@toolbox perf-tools-next]$

So it seems we need to look at what we're using from the kernel's
scripts/Makefile.build to have it in a tools/build/ file.

Its late here and I'll have to stop at this point, please take a look to
see if this can be easily resolved so that we can merge your series, I
very much like to say goodbye to one more tools/perf library dependency
:-)

Best regards,

- Arnaldo

