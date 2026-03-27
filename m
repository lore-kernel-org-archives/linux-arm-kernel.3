Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2443710F2867
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 20:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKsbZqDOW86RsCflURAsrZ3I5A4IHa/xWNZwWLO0QRg=; b=IiMUUqSXP97TbYta5zdmUaLvDM
	evwT6TAvHON++Ky2JIN5uz6SXw1gcpzGw4XSw6UxNwD26zOjfZxTnYUwaKztrPZvbR9R5awz66sWN
	/BfMUb6g5GN/8twujxzZh58D59tVR4Ku2D8ajaUcADlnmaPYeFO3qyBB8AFLc1L0y0ENdx6eRoQiP
	QVmDhbTnS7yUib3lEGtPL8iSb4Kp34oFNSHKy0JrjLyj8SwLxULAxcJMlpWYdTKOkCABdIMTahIxS
	I5nbdq1sjQX64JVk54pVxsKCWvx8N23EyT8eXknPOlpEEwp8cgd+4Rb0J78rBa3XGLTkxiQsF8IW8
	yaDGqS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6E0L-00000008Bao-3dfp;
	Fri, 27 Mar 2026 20:42:05 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6E0J-00000008BaO-1L8v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 20:42:04 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b0c12be0ecso24475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 13:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774644122; cv=none;
        d=google.com; s=arc-20240605;
        b=KKjXDl9rEDErs1a+HWb42nc2+LJ5TjqWOZGiNKI9C5RuOLPIaZ/CQqMlNgHEgVdkVi
         RFhZC4PZViygmoPKnGetPB/Sw55uOtULa9UdIYW5qpsa6d0tJyMe8p1r84ocep31OeIX
         n+nsXLfLxpb1Xv/bFV1JaD+kgO93PnRwY8JEFGM9XWmsIhn4jNnnmg6tGXSzgds4IXNY
         mJUld14DGbWGPz2a5QjeX8h5Cn45K7qwfTnE45+7Oi9GJCyKHBgA0x4ahjGzbDs51NqM
         ogT7yE3qBmPAsKEv9g5HMFWGks7Y5HbaTnfWYkzLmQnOrdLmuYD3G+MnnaziCb0zEtFK
         FHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LKsbZqDOW86RsCflURAsrZ3I5A4IHa/xWNZwWLO0QRg=;
        fh=wSk0NbX8l6X9rDsSkpvmBuhv+Aur5A4Eg9DTJKXyfFE=;
        b=ROjHXPEAd6t2VgzkdpXMAeIq+TehtbrBL8XSE0b4IvQtFXAkrXUN2gxOpzcSy2LEyA
         XEruA36GQKZtSyJtIguoe1qJtUDNu9ClyVnPY3F+okDga+nSo+sR93DXNtMcDhlonpxR
         H32EqIro9z8S9jVWIAmqhWUS9S7i+Bfb1E9d14/p17HxOSWkqy/9JfP5CnH2Jh9cFwxy
         Thd60KeIZOkGUH6At4R3PNbw5TyNGkUktdlXA2VgKZFAe67hSU6eHHlpnOHlXxbLXk8J
         6atVlS3ifYXQxPHGQUtTsJSzbpm4+L4mFHbv/MN3encAC7xd74qq9MJ13F0yVLiagPoZ
         A7sA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774644122; x=1775248922; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKsbZqDOW86RsCflURAsrZ3I5A4IHa/xWNZwWLO0QRg=;
        b=YNuVLlISZfzKwRTO48P7R1EsO6xDLnka+uKuqcA2D/HnCHz5cqkvrXmGk4rnJoZold
         Cvk6RqfsnfAPaos+ZIo8Zn/bjSxKrCoS8Kv3T5MvnT6bGjDNe8tncYytsLyKi3qLkxn3
         RyoSd5ry0Ka7Sl5egGiiNNf4gKbfEAbw5UpnO0uDeMikayTRsAf3rv09+oATWnjASBjI
         Wo6LMJtYZ2XRgJzijzv20FkIFvEMRnF126ge/BPZWxzPvfAHwaOZ8l7S7+s2572B2bvz
         qUm0D6urb1CzxBt08MNV8ZwNTKFOkqYJiK+08I12+PSI+IDHb/40gsE6CZ6chIhjNfUG
         B6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774644122; x=1775248922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LKsbZqDOW86RsCflURAsrZ3I5A4IHa/xWNZwWLO0QRg=;
        b=pzXGuK9aL1/CUQ29oyWvb2qqyHl0ctGbFw2xfbQALgf/+NRuRF6q7fz4+2D89BIISJ
         wEjDe7gQkVSwldrcUhsykoGcfjpAbemaz7UczUbyUsynBx2atxNnLf/eGbYwSA0yK3Dq
         TeO+GX3pNcVrN6BMHaLXD2Xsed8Ix55wDGrbtwl09oO6/U6Cqomvw11XyJS/i7i0rpZu
         lSrRAmnpSh/cs40vpFHMQ64Qt8aPObooDZgekWfNCxOAtsw9Q7V+kgYsYVsRQZoPH+O4
         wGk/88V7WLWRG4MPcSoqvzAzdc8X5QTn5T52seA80xzyP9/ORVLb+LpYnSdV9/buq8aX
         YF/A==
X-Forwarded-Encrypted: i=1; AJvYcCU3geblcsQyfXrpyIgcpnufP+G6EUJXf4pj2eFZtRO7dt74eX+ZQXNpgUK7y03oWtSlltPTOBLK51hYqZH54+mC@lists.infradead.org
X-Gm-Message-State: AOJu0YwfD0q0zqKdqwPxaNW5kUB9TXFg72/TZCca2unLdphU0CYtxTos
	NzKCx7eWhqD7ywsMEUhVdS+hD/Nbbl0Wb3pAaLlyvZo5BX9Sr8wNeP6WDQqhZV1x+l7M+U0vJJl
	M52jmJv4YTl4rgh9EBo9cAF1gYxhpudYFEzRxS1jm
X-Gm-Gg: ATEYQzx+l0IlsrAhH81k1QZNhVwHqXhIDzPvQ6L4JTlQX+SLJfJxO0lzdgiegeFkKbA
	evWp6Zeid7H0UoAPw3pCdxL8NrJggeVWX1/at0cXPscuqgIGFLI0n4+GHsr/LYdq4uqJbAzx0bs
	mfe1rFoUvNZb/9tvMUXzKjtjiIuIB/Ir00yGMXzT/Ec3jeQunJdN05Wp849W4/dqtqydRVWwUO6
	aarMPDXu+Kch3MrrJit04kuqvN5buFCObxoA4CXs3gxKM1iw9SMRw8KFTjytGib/4TwCruFUa1K
	9Y2WJGcw
X-Received: by 2002:a17:902:d4cc:b0:2b0:5683:1cf with SMTP id
 d9443c01a7336-2b242ccce8cmr135195ad.13.1774644121683; Fri, 27 Mar 2026
 13:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <abxs-2rozL1tBEO1@google.com> <20260321234220.848859-1-irogers@google.com>
 <acW4Z2KJbyPZM1SG@google.com> <acbjjwc-WCk1CwtF@x1> <CAP-5=fXmBpqP86FT85sA_BZYRnzwbZ5joYLogCqON6fjXCkRHQ@mail.gmail.com>
In-Reply-To: <CAP-5=fXmBpqP86FT85sA_BZYRnzwbZ5joYLogCqON6fjXCkRHQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 27 Mar 2026 13:41:50 -0700
X-Gm-Features: AQROBzB293WK_qIpuDSMa7sKWXMjW4ObLUph7AAbCdTdiYjV0_7RiXziOkhHK1g
Message-ID: <CAP-5=fVVYobbD62SvM=MyTjhKFzBB09-mRykJGB9QVYOMth6mA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260327_134203_368372_EE4C69A5 
X-CRM114-Status: GOOD (  45.73  )
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

On Fri, Mar 27, 2026 at 1:37=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Fri, Mar 27, 2026 at 1:07=E2=80=AFPM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
> >
> > On Thu, Mar 26, 2026 at 03:51:19PM -0700, Namhyung Kim wrote:
> > > On Sat, Mar 21, 2026 at 04:42:18PM -0700, Ian Rogers wrote:
> > > > libunwind support exists for "--call-graph dwarf", however, libunwi=
nd
> > > > support has been opt-in rather than opt-out since Linux v6.13 as li=
bdw
> > > > is preferred - commit 13e17c9ff49119aa ("perf build: Make libunwind
> > > > opt-in rather than opt-out"). A problem with the libdw support was
> > > > that it was slow, an issue fixed in Linux v7.0 in commit 6b2658b3f3=
6a
> > > > ("perf unwind-libdw: Don't discard loaded ELF/DWARF after every
> > > > unwind"). As such libunwind support is now unnecessary.
> > > >
> > > > The patch series:
> > > > https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@googl=
e.com/
> > > > looked to make the libunwind support in perf similar to the libdw
> > > > support, allow cross-architecture unwinding, etc. This was motivate=
d
> > > > by the perf regs conventions being altered by the addition of x86 A=
PX
> > > > support:
> > > > https://lore.kernel.org/lkml/20260209072047.2180332-1-dapeng1.mi@li=
nux.intel.com/
> > > > It is necessary to translate the library's notion of registers to t=
he
> > > > perf register convention so that the stack unwinding state can be
> > > > initialized. On this series it was stated that removing libunwind
> > > > support from perf should be an option, rather than updating support=
:
> > > > https://lore.kernel.org/lkml/abxs-2rozL1tBEO1@google.com/
> > > > This was also what motivated making libunwind opt-in rather than
> > > > opt-out.
> >
> > > > Given that 7 minor releases have happened with libunwind "deprecate=
d"
> > > > by making it opt-in, let's remove the libunwind support. There does=
n't
> > > > appear to be any disagreement to this on the mailing list.
> >
> > > I'm not sure if we want to remove it now.  I think we need more time =
to
> > > verify libdw unwinding is stable and fast enough.  Also maybe we can
> > > add build- or run-time warning when people try to use libunwind.
> >
> > We have:
> >
> > acme@x1:~/git/perf-tools$ perf -vv | grep LIBU
> >              libunwind: [ OFF ]  # HAVE_LIBUNWIND_SUPPORT ( tip: Deprec=
ated, use LIBUNWIND=3D1 and install libunwind-dev[el] to build with it )
> > acme@x1:~/git/perf-tools$
> >
> > acme@x1:~/git/perf-tools$ perf check feature libunwind && echo perf bui=
lt with libunwind
> >              libunwind: [ OFF ]  # HAVE_LIBUNWIND_SUPPORT ( tip: Deprec=
ated, use LIBUNWIND=3D1 and install libunwind-dev[el] to build with it )
> > acme@x1:~/git/perf-tools$
> >
> > Building with both, as Ian mentioned ends up with:
> >
> >   LD      /tmp/build/perf-tools/util/perf-util-in.o
> > ld: /tmp/build/perf-tools/util/unwind-libunwind.o: in function `unwind_=
_get_entries':
> > unwind-libunwind.c:(.text+0x2a0): multiple definition of `unwind__get_e=
ntries'; /tmp/build/perf-tools/util/unwind-libdw.o:unwind-libdw.c:(.text+0x=
940): first defined here
> > make[4]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:164:=
 /tmp/build/perf-tools/util/perf-util-in.o] Error 123
> > make[3]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:158:=
 util] Error 2
> > make[2]: *** [Makefile.perf:797: /tmp/build/perf-tools/perf-util-in.o] =
Error 2
> > make[1]: *** [Makefile.perf:289: sub-make] Error 2
> > make: *** [Makefile:119: install-bin] Error 2
> > make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
> > =E2=AC=A2 [acme@toolbx perf-tools]$
> >
> > So what Namhyung is suggesting is to disable libdw when libunwind is
> > asked for?
> >
> > I.e.
> >
> > alias m=3D'rm -rf ~/libexec/perf-core/ ; make LIBUNWIND=3D1 NO_LIBDW=3D=
1 -k O=3D/tmp/build/$(basename $PWD)/ -C tools/perf install-bin && perf tes=
t "import python" && cat /tmp/build/$(basename $PWD)/feature/test-all.make.=
output' ; export PYTHONPATH=3D/tmp/build/$(basename $PWD)/python
> >
> > Which builds and ends up linking with both:
> >
> > =E2=AC=A2 [acme@toolbx perf-tools]$ ldd ~/bin/perf | egrep unwind\|dw
> >         libunwind-x86_64.so.8 =3D> /lib64/libunwind-x86_64.so.8 (0x0000=
7fbf430b6000)
> >         libunwind.so.8 =3D> /lib64/libunwind.so.8 (0x00007fbf4309b000)
> >         libdw.so.1 =3D> /lib64/libdw.so.1 (0x00007fbf38570000)
> > =E2=AC=A2 [acme@toolbx perf-tools]$
> >
> > I.e. that NO_LIBDW isn't really disabling linking with it, just some
> > features based on it, likely.
> >
> > Hum, we also have NO_LIBDW_DWARF_UNWIND, which probably is what we want
> > here... nope:
> >
> > =E2=AC=A2 [acme@toolbx perf-tools]$ alias m=3D'rm -rf ~/libexec/perf-co=
re/ ; make LIBUNWIND=3D1 NO_LIBDW_DWARF_UNWIND=3D1 -k O=3D/tmp/build/$(base=
name $PWD)/ -C tools/perf install-bin && perf test "import python" && cat /=
tmp/build/$(basename $PWD)/feature/test-all.make.output' ; export PYTHONPAT=
H=3D/tmp/build/$(basename $PWD)/python
> > =E2=AC=A2 [acme@toolbx perf-tools]$ m
> > rm: cannot remove '/home/acme/libexec/perf-core/scripts/python/Perf-Tra=
ce-Util/lib/Perf/Trace/__pycache__/Core.cpython-314.pyc': Permission denied
> > make: Entering directory '/home/acme/git/perf-tools/tools/perf'
> >   BUILD:   Doing 'make -j12' parallel build
> > Warning: Kernel ABI header differences:
> >   diff -u tools/arch/x86/include/uapi/asm/svm.h arch/x86/include/uapi/a=
sm/svm.h
> >
> > Auto-detecting system features:
> > ...                                   libdw: [ on  ]
> > ...                                   glibc: [ on  ]
> > ...                                  libelf: [ on  ]
> > ...                                 libnuma: [ on  ]
> > ...                  numa_num_possible_cpus: [ on  ]
> > ...                               libpython: [ on  ]
> > ...                             libcapstone: [ on  ]
> > ...                               llvm-perf: [ on  ]
> > ...                                    zlib: [ on  ]
> > ...                                    lzma: [ on  ]
> > ...                                     bpf: [ on  ]
> > ...                                  libaio: [ on  ]
> > ...                                 libzstd: [ on  ]
> > ...                              libopenssl: [ on  ]
> > ...                                    rust: [ on  ]
> >
> >   INSTALL libsubcmd_headers
> >   INSTALL libperf_headers
> >   INSTALL libapi_headers
> >   INSTALL libsymbol_headers
> >   INSTALL libbpf_headers
> >   LD      /tmp/build/perf-tools/util/perf-util-in.o
> > ld: /tmp/build/perf-tools/util/unwind-libunwind.o: in function `unwind_=
_get_entries':
> > unwind-libunwind.c:(.text+0x2a0): multiple definition of `unwind__get_e=
ntries'; /tmp/build/perf-tools/util/unwind-libdw.o:unwind-libdw.c:(.text+0x=
940): first defined here
> > make[4]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:164:=
 /tmp/build/perf-tools/util/perf-util-in.o] Error 123
> > make[3]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:158:=
 util] Error 2
> > make[2]: *** [Makefile.perf:797: /tmp/build/perf-tools/perf-util-in.o] =
Error 2
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [Makefile.perf:289: sub-make] Error 2
> > make: *** [Makefile:119: install-bin] Error 2
> > make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
> > =E2=AC=A2 [acme@toolbx perf-tools]$
> >
> > I expected NO_LIBDW_DWARF_UNWIND=3D1 would resolve this case, and maybe=
 it
> > should?
> >
> > Or maybe it did it in the past as by now it is just a comment:
> >
> > =E2=AC=A2 [acme@toolbx perf-tools]$ git grep NO_LIBDW_DWARF_UNWIND
> > tools/perf/Makefile.perf:# Define NO_LIBDW_DWARF_UNWIND if you do not w=
ant libdw support
> > =E2=AC=A2 [acme@toolbx perf-tools]$
> >
> > Its from:
> >
> > # Define NO_LIBDW_DWARF_UNWIND if you do not want libdw support
> > # for dwarf backtrace post unwind.
> >
> > As we need libdw for 'perf probe', etc, so being able to disable it jus=
t
> > for DWARF backtrace is what we need here to make them mutually
> > exclusive, i.e. the default is for building with libdw for backtraces,
> > but if the user asks for LIBUNWIND=3D1, then a warning that libdw won't=
 be
> > used for DWARF backtraces and select NO_LIBDW_DWARF_UNWIND?
> >
> > We could then have a regression test that builds perf with one, does
> > some backtraces, then with the other, then compare? This would be
> > followup work, if somebody has the cycles, but making them mutually
> > exclusive should be doable with not that much work?
> >
> > This is an area that is tricky and since we _already_ have two
> > implementations, the good thing for regression testing would be the
> > compare their results until libunwind becomes completely rotten and
> > unusable?
>
> My series:
> https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/
> makes libdw and libunwind supported together:
> https://lore.kernel.org/lkml/20260305221927.3237145-2-irogers@google.com/
> """
> This commit refactors the DWARF unwind post-processing to be
> configurable at runtime via the .perfconfig file option
> 'unwind.style', or using the argument '--unwind-style' in the commands
> 'perf report', 'perf script' and 'perf inject', in a similar manner to
> the addr2line or the disassembler style.
> """
> That series cleans up several other issues, which is why I think it is
> worth landing while we wait for libdw to become stable.

Fwiw, fixing cross-platform MIPS libunwind support (my series does
this) goes someway to address problems with perf raised here:
https://github.com/koute/not-perf

Thanks,
Ian

> Thanks,
> Ian
>
> > - Arnaldo

