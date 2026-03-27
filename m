Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE3510F286A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 20:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2vqbRr8SqPZfYjWbgRRazMb+0cCewbQ3ECrXWlmf3M=; b=3DqGSJw+4aShDKxmw498gQbp9z
	2Mv5HFFT69wOrPZxVUh815ubcv9ueCST7DZqT0fryQIvXgz0E1IXEHTVl6TTxIrk0/7QE7GMEEvIe
	B3K3sFX+vv+hktH7Au6pmXpRHxlqfI5fetazPdGw/CIil4bL2CMTeyQ89MTXq1X8lBRkn+O7tr8Lp
	ws/MsrC7z2PV+ulwS1dxr45++IuRZrl/Iauq4OJ6NUkQ8KlkrYqn8fhNSUPFYohfixHvfqca2Csp0
	bNp+FiluzS059UAUOzicoIpwe5NVkcKDFIGaGPQKbhUzeKxW4yTmdNY5QG/7gaTP4cUlN/qWYcFnj
	hfJnLfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6DTC-000000088T9-2fqA;
	Fri, 27 Mar 2026 20:07:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6DTB-000000088Sz-0P4q;
	Fri, 27 Mar 2026 20:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9D5960054;
	Fri, 27 Mar 2026 20:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF0DC19423;
	Fri, 27 Mar 2026 20:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774642067;
	bh=xHRwHRWX7sDO8EBJS6B5aXfJHu0i4XN8dvpcSTbfIRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dHjUd3ZF79LzrbAsi+TKEK/Ox3bmzPuIrfMVXalW4YK/WE4eklng4Df+wSLXUgWxX
	 lKaRwK1I0DNDfmr/scNd5pCVoZDofC3GXlVmUgZ8/OqIBX5MzrcGLP7BzUeqgecyy/
	 fYrvqyq4LOy3tCyTMc2aXe5GP79hIW8ZJguFwPB4isv94O+qxI8j1TPWne/0DvX8iw
	 J2gbjMSc8XXnUnLOffcSDKNThi9RN2DzhBovrz5EChYLDv8pHc16S+dq8eDka59cc+
	 DrvbMPLlVDZ8ohXwe+J/hmsHr7V9SMRi38wiuqWCwQddWgeu/TJpnsT/lDGoguLhd0
	 aGa3mpY8dB5iw==
Date: Fri, 27 Mar 2026 17:07:43 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, 9erthalion6@gmail.com,
	adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com,
	blakejones@google.com, ctshao@google.com,
	dapeng1.mi@linux.intel.com, howardchu95@gmail.com,
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org,
	leo.yan@linux.dev, libunwind-devel@nongnu.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org,
	pjw@kernel.org, shimin.guo@skydio.com, tglozar@redhat.com,
	tmricht@linux.ibm.com, will@kernel.org, amadio@gentoo.org,
	yuzhuo@google.com
Subject: Re: [PATCH v1 0/2] perf build: Remove libunwind support
Message-ID: <acbjjwc-WCk1CwtF@x1>
References: <abxs-2rozL1tBEO1@google.com>
 <20260321234220.848859-1-irogers@google.com>
 <acW4Z2KJbyPZM1SG@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acW4Z2KJbyPZM1SG@google.com>
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

On Thu, Mar 26, 2026 at 03:51:19PM -0700, Namhyung Kim wrote:
> On Sat, Mar 21, 2026 at 04:42:18PM -0700, Ian Rogers wrote:
> > libunwind support exists for "--call-graph dwarf", however, libunwind
> > support has been opt-in rather than opt-out since Linux v6.13 as libdw
> > is preferred - commit 13e17c9ff49119aa ("perf build: Make libunwind
> > opt-in rather than opt-out"). A problem with the libdw support was
> > that it was slow, an issue fixed in Linux v7.0 in commit 6b2658b3f36a
> > ("perf unwind-libdw: Don't discard loaded ELF/DWARF after every
> > unwind"). As such libunwind support is now unnecessary.
> > 
> > The patch series:
> > https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/
> > looked to make the libunwind support in perf similar to the libdw
> > support, allow cross-architecture unwinding, etc. This was motivated
> > by the perf regs conventions being altered by the addition of x86 APX
> > support:
> > https://lore.kernel.org/lkml/20260209072047.2180332-1-dapeng1.mi@linux.intel.com/
> > It is necessary to translate the library's notion of registers to the
> > perf register convention so that the stack unwinding state can be
> > initialized. On this series it was stated that removing libunwind
> > support from perf should be an option, rather than updating support:
> > https://lore.kernel.org/lkml/abxs-2rozL1tBEO1@google.com/
> > This was also what motivated making libunwind opt-in rather than
> > opt-out.

> > Given that 7 minor releases have happened with libunwind "deprecated"
> > by making it opt-in, let's remove the libunwind support. There doesn't
> > appear to be any disagreement to this on the mailing list.
 
> I'm not sure if we want to remove it now.  I think we need more time to
> verify libdw unwinding is stable and fast enough.  Also maybe we can
> add build- or run-time warning when people try to use libunwind.

We have:

acme@x1:~/git/perf-tools$ perf -vv | grep LIBU
             libunwind: [ OFF ]  # HAVE_LIBUNWIND_SUPPORT ( tip: Deprecated, use LIBUNWIND=1 and install libunwind-dev[el] to build with it )
acme@x1:~/git/perf-tools$

acme@x1:~/git/perf-tools$ perf check feature libunwind && echo perf built with libunwind
             libunwind: [ OFF ]  # HAVE_LIBUNWIND_SUPPORT ( tip: Deprecated, use LIBUNWIND=1 and install libunwind-dev[el] to build with it )
acme@x1:~/git/perf-tools$

Building with both, as Ian mentioned ends up with:

  LD      /tmp/build/perf-tools/util/perf-util-in.o
ld: /tmp/build/perf-tools/util/unwind-libunwind.o: in function `unwind__get_entries':
unwind-libunwind.c:(.text+0x2a0): multiple definition of `unwind__get_entries'; /tmp/build/perf-tools/util/unwind-libdw.o:unwind-libdw.c:(.text+0x940): first defined here
make[4]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:164: /tmp/build/perf-tools/util/perf-util-in.o] Error 123
make[3]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:158: util] Error 2
make[2]: *** [Makefile.perf:797: /tmp/build/perf-tools/perf-util-in.o] Error 2
make[1]: *** [Makefile.perf:289: sub-make] Error 2
make: *** [Makefile:119: install-bin] Error 2
make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
⬢ [acme@toolbx perf-tools]$

So what Namhyung is suggesting is to disable libdw when libunwind is
asked for?

I.e.

alias m='rm -rf ~/libexec/perf-core/ ; make LIBUNWIND=1 NO_LIBDW=1 -k O=/tmp/build/$(basename $PWD)/ -C tools/perf install-bin && perf test "import python" && cat /tmp/build/$(basename $PWD)/feature/test-all.make.output' ; export PYTHONPATH=/tmp/build/$(basename $PWD)/python

Which builds and ends up linking with both:

⬢ [acme@toolbx perf-tools]$ ldd ~/bin/perf | egrep unwind\|dw
	libunwind-x86_64.so.8 => /lib64/libunwind-x86_64.so.8 (0x00007fbf430b6000)
	libunwind.so.8 => /lib64/libunwind.so.8 (0x00007fbf4309b000)
	libdw.so.1 => /lib64/libdw.so.1 (0x00007fbf38570000)
⬢ [acme@toolbx perf-tools]$

I.e. that NO_LIBDW isn't really disabling linking with it, just some
features based on it, likely.

Hum, we also have NO_LIBDW_DWARF_UNWIND, which probably is what we want
here... nope:

⬢ [acme@toolbx perf-tools]$ alias m='rm -rf ~/libexec/perf-core/ ; make LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1 -k O=/tmp/build/$(basename $PWD)/ -C tools/perf install-bin && perf test "import python" && cat /tmp/build/$(basename $PWD)/feature/test-all.make.output' ; export PYTHONPATH=/tmp/build/$(basename $PWD)/python
⬢ [acme@toolbx perf-tools]$ m
rm: cannot remove '/home/acme/libexec/perf-core/scripts/python/Perf-Trace-Util/lib/Perf/Trace/__pycache__/Core.cpython-314.pyc': Permission denied
make: Entering directory '/home/acme/git/perf-tools/tools/perf'
  BUILD:   Doing 'make -j12' parallel build
Warning: Kernel ABI header differences:
  diff -u tools/arch/x86/include/uapi/asm/svm.h arch/x86/include/uapi/asm/svm.h

Auto-detecting system features:
...                                   libdw: [ on  ]
...                                   glibc: [ on  ]
...                                  libelf: [ on  ]
...                                 libnuma: [ on  ]
...                  numa_num_possible_cpus: [ on  ]
...                               libpython: [ on  ]
...                             libcapstone: [ on  ]
...                               llvm-perf: [ on  ]
...                                    zlib: [ on  ]
...                                    lzma: [ on  ]
...                                     bpf: [ on  ]
...                                  libaio: [ on  ]
...                                 libzstd: [ on  ]
...                              libopenssl: [ on  ]
...                                    rust: [ on  ]

  INSTALL libsubcmd_headers
  INSTALL libperf_headers
  INSTALL libapi_headers
  INSTALL libsymbol_headers
  INSTALL libbpf_headers
  LD      /tmp/build/perf-tools/util/perf-util-in.o
ld: /tmp/build/perf-tools/util/unwind-libunwind.o: in function `unwind__get_entries':
unwind-libunwind.c:(.text+0x2a0): multiple definition of `unwind__get_entries'; /tmp/build/perf-tools/util/unwind-libdw.o:unwind-libdw.c:(.text+0x940): first defined here
make[4]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:164: /tmp/build/perf-tools/util/perf-util-in.o] Error 123
make[3]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:158: util] Error 2
make[2]: *** [Makefile.perf:797: /tmp/build/perf-tools/perf-util-in.o] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile.perf:289: sub-make] Error 2
make: *** [Makefile:119: install-bin] Error 2
make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
⬢ [acme@toolbx perf-tools]$

I expected NO_LIBDW_DWARF_UNWIND=1 would resolve this case, and maybe it
should?

Or maybe it did it in the past as by now it is just a comment:

⬢ [acme@toolbx perf-tools]$ git grep NO_LIBDW_DWARF_UNWIND
tools/perf/Makefile.perf:# Define NO_LIBDW_DWARF_UNWIND if you do not want libdw support
⬢ [acme@toolbx perf-tools]$

Its from:

# Define NO_LIBDW_DWARF_UNWIND if you do not want libdw support
# for dwarf backtrace post unwind.

As we need libdw for 'perf probe', etc, so being able to disable it just
for DWARF backtrace is what we need here to make them mutually
exclusive, i.e. the default is for building with libdw for backtraces,
but if the user asks for LIBUNWIND=1, then a warning that libdw won't be
used for DWARF backtraces and select NO_LIBDW_DWARF_UNWIND?

We could then have a regression test that builds perf with one, does
some backtraces, then with the other, then compare? This would be
followup work, if somebody has the cycles, but making them mutually
exclusive should be doable with not that much work?

This is an area that is tricky and since we _already_ have two
implementations, the good thing for regression testing would be the
compare their results until libunwind becomes completely rotten and
unusable?

- Arnaldo

