Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7D510F286B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 20:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r13fetV/vaHgIfifc7hlGntVBBme+u6085WHF3DN3JA=; b=X7Vz5lF2jOcYA5E/9uG9Xratcw
	inMP8blPja4SBigmS0/KHxXlhVHjq/B5kz7pC+FIe+8KWsUaz+c29SS4upx6exBC8dYx0T2SLVzQw
	CJ3iDCaX12t8uBBTXwWTaLPC189suvWbrXiYSQ95iNod0CRRRi/mznuRylwk7bSapDBtoLL6xrtIC
	Ip0yFA++bPkkhrpZjGK8JSoO1bq1z2bRxYP7zDoesCoc6VswO6U5IoZ8fXmIVYQyz9nlQbTR1mwIQ
	vDhKHqC0XyqT8c1rEl1SSPlUTWXLfuetxY6TSTJeAomqBPMhUC8VnDbqJF5rRfIGa5coODBY/sUbg
	DtdgtClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Dw1-00000008B95-0iI8;
	Fri, 27 Mar 2026 20:37:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Dvy-00000008B8K-0Hwd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 20:37:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b0b260d309so5675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 13:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774643853; cv=none;
        d=google.com; s=arc-20240605;
        b=Apv8j9ESazSBccI5lOVYQrB7hst1b1W1euPvlwJ519Pb23U4/GHzrKIhznP+ghy3uZ
         yLRXCs3wgp3GUZeYduJNxcAZisBxHalW6V1GhKVSUKe5sDCm2WGcgT1h0inZr1X4SyCF
         6ea0eKAN3PcprbceoxgI0LjXhhwbY+lyQZLOkc2sWcKn4oeAMvD0YaPamcch1gKxOuBq
         2ClFeM7xD3CaVxuhGaiRCGkN0UJg1aa6NOPsegUATmVBmsK+3YyFo9eF3lIlHb/L5r18
         192sGuOIGt5OPjvX/pSANRlWz6wznR7He/bPQbZW2YG67AXHvH3m8PMTlJivzRcXCcA7
         FcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r13fetV/vaHgIfifc7hlGntVBBme+u6085WHF3DN3JA=;
        fh=vnoWNX/dUkvfecIf/4+LcCSqB0uAPIFKjUNAq+tjizQ=;
        b=XD1/UJI5FhhzmQ4hqmtq4oabIZMMJbIX/JUQiS2XcVtspg6tCuap5t38ypVX4y7uh3
         /ilZvQ2ng6JewVesesFac3yVH5yEfJfN66+Hf5Z0Ps+jtIBivK+PlwnjWdExrIrpyQg7
         PMqk5RlShytPNW5sVDOIkKDU78aofQ5COdVT7mrJuRriJalscokgDdNZFSd//IgycJ9c
         CohYN7z5eGjZAQfrrDh8Y30cjvdJ6L0DR7DHIClvwVpvNKd1F/C0AFUJhs7vwMDXgXTN
         zerTtT5m+Jf7Iat+EjT8R2ySO7ybSJJE0s9johDnvxrQuUAqlhJDUL5rslAxCVZSt56X
         mUTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774643853; x=1775248653; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r13fetV/vaHgIfifc7hlGntVBBme+u6085WHF3DN3JA=;
        b=X0I+79SZBzAoThCCAk/YMRoKiYhvDXqPAc+3r+0lnBvzOfxwTUhL+EXbUXCL34e7AI
         NU9YRajNKCqmA8q5fyxbK+/LMX077BQFZJOEbWJd4Zzv++sGYHCU2D9rFsn4b/udnHTl
         eNUAfuOkSrL34JoTOXRGmUltZpdMBPLOpkSOp/Ql25zInReRF5+4Ua96fN+gcRt/QbPp
         4WRxBD//wBSV8vs5A1U0ncWkRAtx5dyDJH4GNup5ZdPeQheg60XqqPWfEvpLwMFFHnbB
         XDFH+GiuP3l/kh2bIHUrVACih2hagzSZ7WS7mIqG7YPvD/Qg3SB9L5X/Bj1Nk20/bVnH
         nYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643853; x=1775248653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r13fetV/vaHgIfifc7hlGntVBBme+u6085WHF3DN3JA=;
        b=UNoNZ7jZbKCFcGU7u80on+WPRHFUhqauCTvUBcVBsdGQgheqDG18u62Kg6iOrL0004
         CZ3WgLEX+1iAx/qUattxTc8zjALgzSnd7jDB93kL9v3GYazPKXsKWeAp0nSlo3zlA+v2
         WbX4uD55MBYJy44AnB3c3iwQ+Y4HWdlMMFun+LCD+xtSPorq+6NBfwM6jrMMSiGWxIbd
         0/VejUEoGJHw98wF7QjLf2Rp7BMjzdNGcH08dVsz67bcMiqUvYzgNyL3kNXvRrbPp78f
         pTHQwcnZnifRgenicMMfVM/QyyDQvI6BBRuTyZklZAZ9qoqOwI4C7TR8ez3VMoMt9btR
         RBDg==
X-Forwarded-Encrypted: i=1; AJvYcCUS+GNClsbPEWXPJgG/hR/GiKb93N2lY1DF6tULGvrS2L/bPPL1DZKme0pv43vV+kb9ucdOqN/pYASpEBvJHvt/@lists.infradead.org
X-Gm-Message-State: AOJu0YwTM0P6VYrHhyV3mcKJhiWXIypiWzbVDVgJp2nQRflv8+zu/zol
	ahdRHlC55z4REweyXhrREWkDbtkZqqmvUX8zrhVdstvd5eQ6ClQvbOjyoZQkVj7mLWOgQsmddoH
	zAcdGnKdWA/2FwHa0EKN7peNy8dEB32Sogtjm0Nw+
X-Gm-Gg: ATEYQzwt3ie8L9dK1erM53JEWADOHR56Z3TMCFXg7v7/NFwBKZi+A6cu+8r9gXPZx0G
	cb/cNjvtpKndRN8ezkrLQ3CIn0/0L9kOuxgehXN09zk8U/AOVewglP4k8RuWkMPUzuTpFCKnyJr
	6X72ud92+DbZyC46JglEvZIlGsVmqoupFBK4hSmrJ6YOL4B0dLo2KMIdh89cBoTqIcwqJCWycng
	wf2Ii+QDFu3GjIQFqpHo0+JWepmA7FIWWCMwhIJ2aR0n59lO24yBUckZ+RM/m6ekf1anJxgyQbi
	VsYyRUIX
X-Received: by 2002:a17:902:ccd0:b0:2ae:45cc:aeb6 with SMTP id
 d9443c01a7336-2b241c7f196mr850315ad.6.1774643852395; Fri, 27 Mar 2026
 13:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <abxs-2rozL1tBEO1@google.com> <20260321234220.848859-1-irogers@google.com>
 <acW4Z2KJbyPZM1SG@google.com> <acbjjwc-WCk1CwtF@x1>
In-Reply-To: <acbjjwc-WCk1CwtF@x1>
From: Ian Rogers <irogers@google.com>
Date: Fri, 27 Mar 2026 13:37:20 -0700
X-Gm-Features: AQROBzDJTFOWNO9COXQqi_3nMqcHYJ2jcRoNemZtTIaoZQj3JBfEfCB9aE6Pq8Y
Message-ID: <CAP-5=fXmBpqP86FT85sA_BZYRnzwbZ5joYLogCqON6fjXCkRHQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] perf build: Remove libunwind support
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, 9erthalion6@gmail.com, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org, amadio@gentoo.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_133734_111776_C6CD51F4 
X-CRM114-Status: GOOD (  43.64  )
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

On Fri, Mar 27, 2026 at 1:07=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Thu, Mar 26, 2026 at 03:51:19PM -0700, Namhyung Kim wrote:
> > On Sat, Mar 21, 2026 at 04:42:18PM -0700, Ian Rogers wrote:
> > > libunwind support exists for "--call-graph dwarf", however, libunwind
> > > support has been opt-in rather than opt-out since Linux v6.13 as libd=
w
> > > is preferred - commit 13e17c9ff49119aa ("perf build: Make libunwind
> > > opt-in rather than opt-out"). A problem with the libdw support was
> > > that it was slow, an issue fixed in Linux v7.0 in commit 6b2658b3f36a
> > > ("perf unwind-libdw: Don't discard loaded ELF/DWARF after every
> > > unwind"). As such libunwind support is now unnecessary.
> > >
> > > The patch series:
> > > https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.=
com/
> > > looked to make the libunwind support in perf similar to the libdw
> > > support, allow cross-architecture unwinding, etc. This was motivated
> > > by the perf regs conventions being altered by the addition of x86 APX
> > > support:
> > > https://lore.kernel.org/lkml/20260209072047.2180332-1-dapeng1.mi@linu=
x.intel.com/
> > > It is necessary to translate the library's notion of registers to the
> > > perf register convention so that the stack unwinding state can be
> > > initialized. On this series it was stated that removing libunwind
> > > support from perf should be an option, rather than updating support:
> > > https://lore.kernel.org/lkml/abxs-2rozL1tBEO1@google.com/
> > > This was also what motivated making libunwind opt-in rather than
> > > opt-out.
>
> > > Given that 7 minor releases have happened with libunwind "deprecated"
> > > by making it opt-in, let's remove the libunwind support. There doesn'=
t
> > > appear to be any disagreement to this on the mailing list.
>
> > I'm not sure if we want to remove it now.  I think we need more time to
> > verify libdw unwinding is stable and fast enough.  Also maybe we can
> > add build- or run-time warning when people try to use libunwind.
>
> We have:
>
> acme@x1:~/git/perf-tools$ perf -vv | grep LIBU
>              libunwind: [ OFF ]  # HAVE_LIBUNWIND_SUPPORT ( tip: Deprecat=
ed, use LIBUNWIND=3D1 and install libunwind-dev[el] to build with it )
> acme@x1:~/git/perf-tools$
>
> acme@x1:~/git/perf-tools$ perf check feature libunwind && echo perf built=
 with libunwind
>              libunwind: [ OFF ]  # HAVE_LIBUNWIND_SUPPORT ( tip: Deprecat=
ed, use LIBUNWIND=3D1 and install libunwind-dev[el] to build with it )
> acme@x1:~/git/perf-tools$
>
> Building with both, as Ian mentioned ends up with:
>
>   LD      /tmp/build/perf-tools/util/perf-util-in.o
> ld: /tmp/build/perf-tools/util/unwind-libunwind.o: in function `unwind__g=
et_entries':
> unwind-libunwind.c:(.text+0x2a0): multiple definition of `unwind__get_ent=
ries'; /tmp/build/perf-tools/util/unwind-libdw.o:unwind-libdw.c:(.text+0x94=
0): first defined here
> make[4]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:164: /=
tmp/build/perf-tools/util/perf-util-in.o] Error 123
> make[3]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:158: u=
til] Error 2
> make[2]: *** [Makefile.perf:797: /tmp/build/perf-tools/perf-util-in.o] Er=
ror 2
> make[1]: *** [Makefile.perf:289: sub-make] Error 2
> make: *** [Makefile:119: install-bin] Error 2
> make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
> =E2=AC=A2 [acme@toolbx perf-tools]$
>
> So what Namhyung is suggesting is to disable libdw when libunwind is
> asked for?
>
> I.e.
>
> alias m=3D'rm -rf ~/libexec/perf-core/ ; make LIBUNWIND=3D1 NO_LIBDW=3D1 =
-k O=3D/tmp/build/$(basename $PWD)/ -C tools/perf install-bin && perf test =
"import python" && cat /tmp/build/$(basename $PWD)/feature/test-all.make.ou=
tput' ; export PYTHONPATH=3D/tmp/build/$(basename $PWD)/python
>
> Which builds and ends up linking with both:
>
> =E2=AC=A2 [acme@toolbx perf-tools]$ ldd ~/bin/perf | egrep unwind\|dw
>         libunwind-x86_64.so.8 =3D> /lib64/libunwind-x86_64.so.8 (0x00007f=
bf430b6000)
>         libunwind.so.8 =3D> /lib64/libunwind.so.8 (0x00007fbf4309b000)
>         libdw.so.1 =3D> /lib64/libdw.so.1 (0x00007fbf38570000)
> =E2=AC=A2 [acme@toolbx perf-tools]$
>
> I.e. that NO_LIBDW isn't really disabling linking with it, just some
> features based on it, likely.
>
> Hum, we also have NO_LIBDW_DWARF_UNWIND, which probably is what we want
> here... nope:
>
> =E2=AC=A2 [acme@toolbx perf-tools]$ alias m=3D'rm -rf ~/libexec/perf-core=
/ ; make LIBUNWIND=3D1 NO_LIBDW_DWARF_UNWIND=3D1 -k O=3D/tmp/build/$(basena=
me $PWD)/ -C tools/perf install-bin && perf test "import python" && cat /tm=
p/build/$(basename $PWD)/feature/test-all.make.output' ; export PYTHONPATH=
=3D/tmp/build/$(basename $PWD)/python
> =E2=AC=A2 [acme@toolbx perf-tools]$ m
> rm: cannot remove '/home/acme/libexec/perf-core/scripts/python/Perf-Trace=
-Util/lib/Perf/Trace/__pycache__/Core.cpython-314.pyc': Permission denied
> make: Entering directory '/home/acme/git/perf-tools/tools/perf'
>   BUILD:   Doing 'make -j12' parallel build
> Warning: Kernel ABI header differences:
>   diff -u tools/arch/x86/include/uapi/asm/svm.h arch/x86/include/uapi/asm=
/svm.h
>
> Auto-detecting system features:
> ...                                   libdw: [ on  ]
> ...                                   glibc: [ on  ]
> ...                                  libelf: [ on  ]
> ...                                 libnuma: [ on  ]
> ...                  numa_num_possible_cpus: [ on  ]
> ...                               libpython: [ on  ]
> ...                             libcapstone: [ on  ]
> ...                               llvm-perf: [ on  ]
> ...                                    zlib: [ on  ]
> ...                                    lzma: [ on  ]
> ...                                     bpf: [ on  ]
> ...                                  libaio: [ on  ]
> ...                                 libzstd: [ on  ]
> ...                              libopenssl: [ on  ]
> ...                                    rust: [ on  ]
>
>   INSTALL libsubcmd_headers
>   INSTALL libperf_headers
>   INSTALL libapi_headers
>   INSTALL libsymbol_headers
>   INSTALL libbpf_headers
>   LD      /tmp/build/perf-tools/util/perf-util-in.o
> ld: /tmp/build/perf-tools/util/unwind-libunwind.o: in function `unwind__g=
et_entries':
> unwind-libunwind.c:(.text+0x2a0): multiple definition of `unwind__get_ent=
ries'; /tmp/build/perf-tools/util/unwind-libdw.o:unwind-libdw.c:(.text+0x94=
0): first defined here
> make[4]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:164: /=
tmp/build/perf-tools/util/perf-util-in.o] Error 123
> make[3]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:158: u=
til] Error 2
> make[2]: *** [Makefile.perf:797: /tmp/build/perf-tools/perf-util-in.o] Er=
ror 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [Makefile.perf:289: sub-make] Error 2
> make: *** [Makefile:119: install-bin] Error 2
> make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
> =E2=AC=A2 [acme@toolbx perf-tools]$
>
> I expected NO_LIBDW_DWARF_UNWIND=3D1 would resolve this case, and maybe i=
t
> should?
>
> Or maybe it did it in the past as by now it is just a comment:
>
> =E2=AC=A2 [acme@toolbx perf-tools]$ git grep NO_LIBDW_DWARF_UNWIND
> tools/perf/Makefile.perf:# Define NO_LIBDW_DWARF_UNWIND if you do not wan=
t libdw support
> =E2=AC=A2 [acme@toolbx perf-tools]$
>
> Its from:
>
> # Define NO_LIBDW_DWARF_UNWIND if you do not want libdw support
> # for dwarf backtrace post unwind.
>
> As we need libdw for 'perf probe', etc, so being able to disable it just
> for DWARF backtrace is what we need here to make them mutually
> exclusive, i.e. the default is for building with libdw for backtraces,
> but if the user asks for LIBUNWIND=3D1, then a warning that libdw won't b=
e
> used for DWARF backtraces and select NO_LIBDW_DWARF_UNWIND?
>
> We could then have a regression test that builds perf with one, does
> some backtraces, then with the other, then compare? This would be
> followup work, if somebody has the cycles, but making them mutually
> exclusive should be doable with not that much work?
>
> This is an area that is tricky and since we _already_ have two
> implementations, the good thing for regression testing would be the
> compare their results until libunwind becomes completely rotten and
> unusable?

My series:
https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/
makes libdw and libunwind supported together:
https://lore.kernel.org/lkml/20260305221927.3237145-2-irogers@google.com/
"""
This commit refactors the DWARF unwind post-processing to be
configurable at runtime via the .perfconfig file option
'unwind.style', or using the argument '--unwind-style' in the commands
'perf report', 'perf script' and 'perf inject', in a similar manner to
the addr2line or the disassembler style.
"""
That series cleans up several other issues, which is why I think it is
worth landing while we wait for libdw to become stable.

Thanks,
Ian

> - Arnaldo

