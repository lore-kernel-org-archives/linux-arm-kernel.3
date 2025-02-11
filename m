Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0397C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 05:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bHIxyguxTjZ0OBmEcJlBmy4lfINCqcKpdhZw7EcmMU=; b=FtFODdWtZ1a42/TATdGt5AOlZa
	SdtGAUkF3TRLAfAi+CUhV7VXQd+tlRKxf+BQNbn2VSmYd3lUgipU5617AuDr/7giDAjzxy3ebV0ay
	IO6O2yhD00T8la2moXTmONBDG+TRwE6rGPax9vauH/oT4+xrZqURZ9JNlRYAJgykv7x3p8raUQ629
	EqM6a/8pHzNtXlqECK4zzdUtpnTPwT919qSYqbfGcG/mdEjvqkjHqZHboRiRApl2Q/cOlEtPblQeH
	6Sx5sKNGTF5GFh/T1O4GBVc8QLDekNBxJcotjUcUF/bg6TeyMv187HhJ2K6hsPGwWixH3p8DBFG0W
	vbfC/IsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thiXS-00000002YW6-1Azf;
	Tue, 11 Feb 2025 05:10:26 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thiW2-00000002YN0-1N7i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 05:08:59 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d146357fb2so82555ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 21:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739250537; x=1739855337; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bHIxyguxTjZ0OBmEcJlBmy4lfINCqcKpdhZw7EcmMU=;
        b=IQmOsJdLOCwVsSobrdus503j+EnUVWvlSbF/Kne9EZMBVphEALH8Z8BBXk6cqu9CMP
         GftK0CEu6XaHWDsKoqI7CPtHH2hW7p1q62hZK4VDS4WQpPLaPGDqMsM3m8SAlLWeHN8H
         KIJ5rjmMHoXYBOPh9IODNfP2FdYTgXdYNczfLTJvVK/kXDyOOM5edkPMN4IcERY3Zyf5
         FuVGMQQsra76dwW9sl+nZgNHjjv7qMLYn9TpyHrPmf0be8vOpaeb1DVn5GdyQLEoe6Pz
         Kh5cQhTSN9Xh+Paw0W5KtlsRX+P9rDoPDFavSOqCpxXr9881/cmwwQkJmEHj5rES7n4z
         4btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739250537; x=1739855337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bHIxyguxTjZ0OBmEcJlBmy4lfINCqcKpdhZw7EcmMU=;
        b=pLIOe7hoI1A5b+mRi+tf6ryN+rrRUves+ENBWxirJU5x4RANfh+vde72yLSg0pOrmH
         d8Pxwb18tQPorb6fVp+ouDQzBa/tPHL///G9qlFAiL/4yFNKHrHGaCK77be/n/GQ+DXu
         Nl50C3Z1qB2liBuXqQ+X+uc299X8GN0TSLSgRmck8n9peIFk81sgj3o38Tctfj1WROKK
         yNJHuquxHUL3MYw6Q+aqUY9QTyyQDyaOkkC8AF7jNiGEZqyX2FTwNveeT3UoQb2wBPLi
         9qXeVQtW/zgu/MTPb8Y/BCMVNcSTW+VD5Uzox+pDnVfzb4OaPyky/V3r9AjkvfPRoriI
         B6Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWZkq8RO6BMPA8mjK+Aj91cke/9KDAAVQzqaXhkTtj8IVu7Vac+sRknmjnObN69y7ioPjTIQdCFpw43I/E5kRyz@lists.infradead.org
X-Gm-Message-State: AOJu0YyKwgpInlK4cuJJfVp6jdoeoqQ8U5bKL8J/w2lCuW2TTdvux5pZ
	4E99LKHDyxkU5BuHE6JIU2axMmygeGVkb9b0cn25GnFnSPq3IvQttBPwn8OGf7AC/Crf3ZCUE+7
	iPayRQSaeI93VB3EVByUPliUZXRWLpISgmDD4
X-Gm-Gg: ASbGncvHdStG2m6dWDQO68LFXfi5y0UnKIzKm6wFFFjMLAm2my1h8nGQoGmVwayT92a
	k0ey1sOZY6keirHYh9FBLrLG/5yf5zPjvkiQp0ZwYBlwzfeAUxKtOhn2BkMDRFl3326+TWbz5tg
	==
X-Google-Smtp-Source: AGHT+IFyaxcME8jKJS8TwGr550Sm6lyyiZH/pTFtRGczGBZijBDRqdrgMQrnR44cn+MWQ1wfBsdSIs3486rzPTce5tE=
X-Received: by 2002:a05:6e02:1a8a:b0:3d0:5855:85a3 with SMTP id
 e9e14a558f8ab-3d16fde405bmr2244515ab.8.1739250536964; Mon, 10 Feb 2025
 21:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20250210165108.95894-1-irogers@google.com> <20250210165108.95894-6-irogers@google.com>
 <Z6qYYC3LqXNZ6hMc@ghost>
In-Reply-To: <Z6qYYC3LqXNZ6hMc@ghost>
From: Ian Rogers <irogers@google.com>
Date: Mon, 10 Feb 2025 21:08:45 -0800
X-Gm-Features: AWEUYZmlPd4riJsmMkW7pemOAyZz5w-Rgxikg50ui8cUlusfvpZDiXXdUzP9x5g
Message-ID: <CAP-5=fUQKx27CwWwnXa3zJzt+MoPDdJRfOZqqpF0FJQDKKFvSw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] perf trace beauty: Add syscalltbl.sh generating
 all system call tables
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_210858_384996_96C91624 
X-CRM114-Status: GOOD (  38.24  )
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

On Mon, Feb 10, 2025 at 4:22=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> On Mon, Feb 10, 2025 at 08:51:06AM -0800, Ian Rogers wrote:
> > Rather than generating individual syscall header files generate a
> > single trace/beauty/generated/syscalltbl.c. In a syscalltbls array
> > have references to each architectures tables along with the
> > corresponding e_machine. When the 32-bit or 64-bit table is ambiguous,
> > match the perf binary's type. For ARM32 don't use the arm64 32-bit
> > table which is smaller. EM_NONE is present for is no machine matches.
> >
> > Conditionally compile the tables, only having the appropriate 32 and
> > 64-bit table. If ALL_SYSCALLTBL is defined all tables can be
> > compiled.
>
> Is there somewhere that the ALL_SYSCALLTBL could be documented? I talk
> about this more in patch 7, but if this also could help perf report
> display the correct syscall names, then ALL_SYSCALLTBL maybe should be
> the default?

So I think ALL_SYSCALLTBL should just go to being the default once we
have a use for it. Currently `perf trace record` doesn't capture the
e_machine of the executing processes, so recording on say a RISC-V
machine and then analyzing on an x86-64 isn't possible. I was worried
that just making ALL_SYSCALLTBL the default would lead to complaints
about increases in binary size or something. This patch series does
what's sensible for things that work right now. ALL_SYSCALLTBL is
useful for making sure the tables other than for your build machine at
least compile. If others feel strongly it should be the default I
don't have a problem changing the code.

Thanks,
Ian

> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > Reviewed-by: Howard Chu <howardchu95@gmail.com>
> > ---
> >  tools/perf/Makefile.perf              |   9 +
> >  tools/perf/trace/beauty/syscalltbl.sh | 274 ++++++++++++++++++++++++++
> >  2 files changed, 283 insertions(+)
> >  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> >
> > diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> > index 55d6ce9ea52f..793e702f9aaf 100644
> > --- a/tools/perf/Makefile.perf
> > +++ b/tools/perf/Makefile.perf
> > @@ -559,6 +559,14 @@ beauty_ioctl_outdir :=3D $(beauty_outdir)/ioctl
> >  # Create output directory if not already present
> >  $(shell [ -d '$(beauty_ioctl_outdir)' ] || mkdir -p '$(beauty_ioctl_ou=
tdir)')
> >
> > +syscall_array :=3D $(beauty_outdir)/syscalltbl.c
> > +syscall_tbl :=3D $(srctree)/tools/perf/trace/beauty/syscalltbl.sh
> > +syscall_tbl_data :=3D $(srctree)/tools/scripts/syscall.tbl \
> > +     $(wildcard $(srctree)/tools/perf/arch/*/entry/syscalls/syscall*.t=
bl)
> > +
> > +$(syscall_array): $(syscall_tbl) $(syscall_tbl_data)
> > +     $(Q)$(SHELL) '$(syscall_tbl)' $(srctree)/tools $@
> > +
> >  fs_at_flags_array :=3D $(beauty_outdir)/fs_at_flags_array.c
> >  fs_at_flags_tbl :=3D $(srctree)/tools/perf/trace/beauty/fs_at_flags.sh
> >
> > @@ -878,6 +886,7 @@ build-dir   =3D $(or $(__build-dir),.)
> >
> >  prepare: $(OUTPUT)PERF-VERSION-FILE $(OUTPUT)common-cmds.h archheaders=
 \
> >       arm64-sysreg-defs \
> > +     $(syscall_array) \
> >       $(fs_at_flags_array) \
> >       $(clone_flags_array) \
> >       $(drm_ioctl_array) \
> > diff --git a/tools/perf/trace/beauty/syscalltbl.sh b/tools/perf/trace/b=
eauty/syscalltbl.sh
> > new file mode 100755
> > index 000000000000..635924dc5f59
> > --- /dev/null
> > +++ b/tools/perf/trace/beauty/syscalltbl.sh
> > @@ -0,0 +1,274 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Generate all syscall tables.
> > +#
> > +# Each line of the syscall table should have the following format:
> > +#
> > +# NR ABI NAME [NATIVE] [COMPAT]
> > +#
> > +# NR       syscall number
> > +# ABI      ABI name
> > +# NAME     syscall name
> > +# NATIVE   native entry point (optional)
> > +# COMPAT   compat entry point (optional)
> > +
> > +set -e
> > +
> > +usage() {
> > +       cat >&2 <<EOF
> > +usage: $0 <TOOLS DIRECTORY> <OUTFILE>
> > +
> > +  <TOOLS DIRECTORY>    path to kernel tools directory
> > +  <OUTFILE>            output header file
> > +EOF
> > +       exit 1
> > +}
> > +
> > +if [ $# -ne 2 ]; then
> > +       usage
> > +fi
> > +tools_dir=3D$1
> > +outfile=3D$2
> > +
> > +build_tables() {
> > +     infile=3D"$1"
> > +     outfile=3D"$2"
> > +     abis=3D$(echo "($3)" | tr ',' '|')
> > +     e_machine=3D"$4"
> > +
> > +     if [ ! -f "$infile" ]
> > +     then
> > +             echo "Missing file $infile"
> > +             exit 1
> > +     fi
> > +     sorted_table=3D$(mktemp /tmp/syscalltbl.XXXXXX)
> > +     grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | sort -n > "$sorted=
_table"
> > +
> > +     echo "static const char *const syscall_num_to_name_${e_machine}[]=
 =3D {" >> "$outfile"
> > +     # the params are: nr abi name entry compat
> > +     # use _ for intentionally unused variables according to SC2034
> > +     while read -r nr _ name _ _; do
> > +             echo "  [$nr] =3D \"$name\"," >> "$outfile"
> > +     done < "$sorted_table"
> > +     echo "};" >> "$outfile"
> > +
> > +     echo "static const uint16_t syscall_sorted_names_${e_machine}[] =
=3D {" >> "$outfile"
> > +
> > +     # When sorting by name, add a suffix of 0s upto 20 characters so =
that
> > +     # system calls that differ with a numerical suffix don't sort bef=
ore
> > +     # those without. This default behavior of sort differs from that =
of
> > +     # strcmp used at runtime. Use sed to strip the trailing 0s suffix
> > +     # afterwards.
> > +     grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | awk '{printf $3; f=
or (i =3D length($3); i < 20; i++) { printf "0"; }; print " " $1}'| sort | =
sed 's/\([a-zA-Z1-9]\+\)0\+ \([0-9]\+\)/\1 \2/' > "$sorted_table"
> > +     while read -r name nr; do
> > +             echo "  $nr,    /* $name */" >> "$outfile"
> > +     done < "$sorted_table"
> > +     echo "};" >> "$outfile"
> > +
> > +     rm -f "$sorted_table"
> > +}
> > +
> > +rm -f "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#include <elf.h>
> > +#include <stdint.h>
> > +#include <asm/bitsperlong.h>
> > +#include <linux/kernel.h>
> > +
> > +struct syscalltbl {
> > +       const char *const *num_to_name;
> > +       const uint16_t *sorted_names;
> > +       uint16_t e_machine;
> > +       uint16_t num_to_name_len;
> > +       uint16_t sorted_names_len;
> > +};
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__alpha__)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/alpha/entry/syscalls/syscall.tbl" "=
$outfile" common,64 EM_ALPHA
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__alpha__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__=
)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/arm/entry/syscalls/syscall.tbl" "$o=
utfile" common,32,oabi EM_ARM
> > +build_tables "$tools_dir/perf/arch/arm64/entry/syscalls/syscall_64.tbl=
" "$outfile" common,64,renameat,rlimit,memfd_secret EM_AARCH64
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aar=
ch64__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__csky__)
> > +EOF
> > +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,32,csk=
y,time32,stat64,rlimit EM_CSKY
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__csky__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/mips/entry/syscalls/syscall_n64.tbl=
" "$outfile" common,64,n64 EM_MIPS
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__hppa__)
> > +#if __BITS_PER_LONG !=3D 64
> > +EOF
> > +build_tables "$tools_dir/perf/arch/parisc/entry/syscalls/syscall.tbl" =
"$outfile" common,32 EM_PARISC
> > +echo "#else" >> "$outfile"
> > +build_tables "$tools_dir/perf/arch/parisc/entry/syscalls/syscall.tbl" =
"$outfile" common,64 EM_PARISC
> > +cat >> "$outfile" <<EOF
> > +#endif //__BITS_PER_LONG !=3D 64
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__hppa__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(__power=
pc64__)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/powerpc/entry/syscalls/syscall.tbl"=
 "$outfile" common,32,nospu EM_PPC
> > +build_tables "$tools_dir/perf/arch/powerpc/entry/syscalls/syscall.tbl"=
 "$outfile" common,64,nospu EM_PPC64
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(_=
_powerpc64__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__riscv)
> > +#if __BITS_PER_LONG !=3D 64
> > +EOF
> > +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,32,ris=
cv,memfd_secret EM_RISCV
> > +echo "#else" >> "$outfile"
> > +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,64,ris=
cv,rlimit,memfd_secret EM_RISCV
> > +cat >> "$outfile" <<EOF
> > +#endif //__BITS_PER_LONG !=3D 64
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__riscv)
> > +#if defined(ALL_SYSCALLTBL) || defined(__s390x__)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/s390/entry/syscalls/syscall.tbl" "$=
outfile" common,64,renameat,rlimit,memfd_secret EM_S390
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__sh__)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/sh/entry/syscalls/syscall.tbl" "$ou=
tfile" common,32 EM_SH
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__sh__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(__sparc=
__)
> > +#if __BITS_PER_LONG !=3D 64
> > +EOF
> > +build_tables "$tools_dir/perf/arch/sparc/entry/syscalls/syscall.tbl" "=
$outfile" common,32 EM_SPARC
> > +echo "#else" >> "$outfile"
> > +build_tables "$tools_dir/perf/arch/sparc/entry/syscalls/syscall.tbl" "=
$outfile" common,64 EM_SPARC
> > +cat >> "$outfile" <<EOF
> > +#endif //__BITS_PER_LONG !=3D 64
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(_=
_sparc__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__=
)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_32.tbl" =
"$outfile" common,32,i386 EM_386
> > +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_64.tbl" =
"$outfile" common,64 EM_X86_64
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x8=
6_64__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> > +EOF
> > +build_tables "$tools_dir/perf/arch/xtensa/entry/syscalls/syscall.tbl" =
"$outfile" common,32 EM_XTENSA
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> > +
> > +#if __BITS_PER_LONG !=3D 64
> > +EOF
> > +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,32 EM_=
NONE
> > +echo "#else" >> "$outfile"
> > +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,64 EM_=
NONE
> > +echo "#endif //__BITS_PER_LONG !=3D 64" >> "$outfile"
> > +
> > +build_outer_table() {
> > +       e_machine=3D$1
> > +       outfile=3D"$2"
> > +       cat >> "$outfile" <<EOF
> > +       {
> > +           .num_to_name =3D syscall_num_to_name_$e_machine,
> > +           .sorted_names =3D syscall_sorted_names_$e_machine,
> > +           .e_machine =3D $e_machine,
> > +           .num_to_name_len =3D ARRAY_SIZE(syscall_num_to_name_$e_mach=
ine),
> > +           .sorted_names_len =3D ARRAY_SIZE(syscall_sorted_names_$e_ma=
chine),
> > +       },
> > +EOF
> > +}
> > +
> > +cat >> "$outfile" <<EOF
> > +static const struct syscalltbl syscalltbls[] =3D {
> > +#if defined(ALL_SYSCALLTBL) || defined(__alpha__)
> > +EOF
> > +build_outer_table EM_ALPHA "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__alpha__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__=
)
> > +EOF
> > +build_outer_table EM_ARM "$outfile"
> > +build_outer_table EM_AARCH64 "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aar=
ch64__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__csky__)
> > +EOF
> > +build_outer_table EM_CSKY "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__csky__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
> > +EOF
> > +build_outer_table EM_MIPS "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__hppa__)
> > +EOF
> > +build_outer_table EM_PARISC "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__hppa__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(__power=
pc64__)
> > +EOF
> > +build_outer_table EM_PPC "$outfile"
> > +build_outer_table EM_PPC64 "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(_=
_powerpc64__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__riscv)
> > +EOF
> > +build_outer_table EM_RISCV "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__riscv)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__s390x__)
> > +EOF
> > +build_outer_table EM_S390 "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__sh__)
> > +EOF
> > +build_outer_table EM_SH "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__sh__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(__sparc=
__)
> > +EOF
> > +build_outer_table EM_SPARC "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(_=
_sparc__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__=
)
> > +EOF
> > +build_outer_table EM_386 "$outfile"
> > +build_outer_table EM_X86_64 "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x8=
6_64__)
> > +
> > +#if defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> > +EOF
> > +build_outer_table EM_XTENSA "$outfile"
> > +cat >> "$outfile" <<EOF
> > +#endif // defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> > +EOF
> > +build_outer_table EM_NONE "$outfile"
> > +cat >> "$outfile" <<EOF
> > +};
> > +EOF
> > --
> > 2.48.1.502.g6dc24dfdaf-goog
> >

