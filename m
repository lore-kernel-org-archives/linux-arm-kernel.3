Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F468C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 04:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmWF1cQtQKp2i246d+2gQ577pU5W7PI/0/07ey4RKtQ=; b=04FYb1+4o3os+KmPN3YQxj5Ee1
	vUEkh3OLlHhaQFJpWLtFfjE+yDTpbV3H1zsdyOmUee8gFwFKvm+mrL2TrCBLQpsm7rN640+VOKFKJ
	oufwCoR6jahwSb/I5DR/os5lPWxVM3q7w6FWyXR6stLrTuI2BpLb2RIvGAVyVfqbd/I0/1//8JTO7
	5PLx8v34i4urlyt5OQ2ausi1/0PFHOUb2WqHeW89Qc5jm/sYFD4CkMF82s0UXkXPoJvI/vDWS0l/b
	/ZoORnDOSNX8+V0I3zthMU0PCHqozJ9lC+3r3tXLPPQiWtcZgEXGV3qtDZS0uS/dhXtgLnTrNfQ5i
	MHJmCOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmmiY-0000000FxVf-0Sm6;
	Tue, 25 Feb 2025 04:38:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmmgz-0000000FxKp-3RqW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 04:37:16 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2212222d4cdso87885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 20:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740458233; x=1741063033; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmWF1cQtQKp2i246d+2gQ577pU5W7PI/0/07ey4RKtQ=;
        b=aQZFmKX7mLfsXeSRsu1J+uyC4syDouPHZohv3NSoegvXvqPy2g1Z9+9gmR8mRBtTFM
         2ptOhxcVfxrxSSvJ6+KZZQA/jhbwIui9pTm1C4Tk51xT4T3fGNhQoEWSdE1W3eJbvpo2
         G/JKul+CxOihA/7B3pZy8H48bxDpQ4oVN9aP0mKTA5BHvfPOb0QwBjvdyygeP0dvLzSu
         BCY93aWeD5QWGFMVX5g2l9tNowBYE7F03JT9oenNtB2hg4qx5XRizK6lrabrK2Lubaks
         V1+15WUjp8EkOJNqqtNmuDqV8H53oLr+JNWEUwHZC2LCCMzo3fNttqdRzyZ0AaLUlzBb
         sPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740458233; x=1741063033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmWF1cQtQKp2i246d+2gQ577pU5W7PI/0/07ey4RKtQ=;
        b=oSB62/GFFCovtXzOIExUs1QFiAe03otIyu4Yfc/WbhM+3pzHVMUd2H3WQmOnSPLdnu
         1DWvxYY9D/EEisppqZZ6l6lYWd0fyc208kkD5oezra7KHOHpZCcF8VRXPLR5Uih/geoI
         NQtDqrwREgB51m87RGHodDrq4MVRa2jF5X6+JJLGp8q3phHY2JwEHMi86Db2jB4xkliW
         IJSzWlReZnilfU/YCDCg2T59ShcWt57qG0T2hJfGb8IqwRcA3g+X8w/afPBILbDFH0jX
         lzlmeLGFC1Sr8F2GN/GiutLcP40yhkf/P2Z/YSnnQH9t28rKSboAETR3wcPy9sCnJBcs
         RLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmvc3xVNSKpXVSH6dH4vXGiSfaXDE4vO/3PE6TC3dyA+OmUQQ8avlGn8SKWxaGQFSSkaPAmRO0uJhRbNX/q23+@lists.infradead.org
X-Gm-Message-State: AOJu0YyeA2q1R5/BvnYXhGFr22aylliQBcD0AJrzr9PJfglWw3UZNhDS
	jAXxAnMny7SuV30nY+n0oHL+8ydk27uhKT0/Iitcn4ZWuvJRx0QNS235GqOhPcRuAOH929Apvlc
	byCU4jPcAyXvMJ4gGrDNAB0+lpLW/4mWMNM6F
X-Gm-Gg: ASbGnct43KYzm8JwPd/EAr+8mzDkOCRHRFDKBnpu4+cS3KtB5NMKa9prkqHgTsBL/3y
	kP9IwZTXm/QzdRGZR7jywmsHV6RyTgslfAT6/yjqEk9yTgrxg6pLLR/F0JOf3U41q5ZGz9gyPb/
	uWukW2GPZM
X-Google-Smtp-Source: AGHT+IFrWogvTWFCRBGPBQvWobJO6nok1Gvhe0cFkItgiDmMmQEa1xAxJrYzWTGcsUxyFvv4nAo2h244R7G71CjWkjU=
X-Received: by 2002:a17:903:1d1:b0:21d:dd8f:6e01 with SMTP id
 d9443c01a7336-22307a2f8admr2063525ad.5.1740458232782; Mon, 24 Feb 2025
 20:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20250219185657.280286-1-irogers@google.com> <Z70zejQJvppH8Sfh@google.com>
In-Reply-To: <Z70zejQJvppH8Sfh@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 24 Feb 2025 20:37:01 -0800
X-Gm-Features: AWEUYZmKfCqNoq-RKdyyf9OFHWu4ilc6KGoveyUuhyX17-QnGIojINk7mSBMx9g
Message-ID: <CAP-5=fU8Xw-aeCGUOFo8Zph=xagHv43jo+BkXY5vUai5tUsmDA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] perf: Support multiple system call tables in the build
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_203713_873980_B3466B39 
X-CRM114-Status: GOOD (  34.47  )
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

On Mon, Feb 24, 2025 at 7:05=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, Feb 19, 2025 at 10:56:49AM -0800, Ian Rogers wrote:
> > This work builds on the clean up of system call tables and removal of
> > libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> >
> > The system call table in perf trace is used to map system call numbers
> > to names and vice versa. Prior to these changes, a single table
> > matching the perf binary's build was present. The table would be
> > incorrect if tracing say a 32-bit binary from a 64-bit version of
> > perf, the names and numbers wouldn't match.
> >
> > Change the build so that a single system call file is built and the
> > potentially multiple tables are identifiable from the ELF machine type
> > of the process being examined. To determine the ELF machine type, the
> > executable's header is read from /proc/pid/exe with fallbacks to using
> > the perf's binary type when unknown.
> >
> > Remove some runtime types used by the system call tables and make
> > equivalents generated at build time.
>
> So I tested this with a test program.
>
>   $ cat a.c
>   #include <stdio.h>
>   int main(void)
>   {
>         char buf[4096];
>         FILE *fp =3D fopen("a.c", "r");
>         size_t len;
>
>         len =3D fread(buf, sizeof(buf), 1, fp);
>         fwrite(buf, 1, len, stdout);
>         fflush(stdout);
>         fclose(fp);
>         return 0;
>   }
>
>   $ gcc -o a64.out a.c
>   $ gcc -o a32.out -m32 a.c
>
>   $ ./perf version
>   perf version 6.14.rc1.ge002a64f6188
>
>   $ git show
>   commit e002a64f61882626992dd6513c0db3711c06fea7 (HEAD -> perf-check)
>   Author: Ian Rogers <irogers@google.com>
>   Date:   Wed Feb 19 10:56:57 2025 -0800
>
>       perf syscalltbl: Mask off ABI type for MIPS system calls
>
>       Arnd Bergmann described that MIPS system calls don't necessarily st=
art
>       from 0 as an ABI prefix is applied:
>       https://lore.kernel.org/lkml/8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@a=
pp.fastmail.com/
>       When decoding the "id" (aka system call number) for MIPS ignore val=
ues
>       greater-than 1000.
>
>       Signed-off-by: Ian Rogers <irogers@google.com>
>
> It works well with 64bit.
>
>   $ sudo ./perf trace ./a64.out |& tail
>        0.266 ( 0.007 ms): a64.out/858681 munmap(addr: 0x7f392723a000, len=
: 109058)                             =3D 0
>        0.286 ( 0.002 ms): a64.out/858681 getrandom(ubuf: 0x7f3927232178, =
len: 8, flags: NONBLOCK)              =3D 8
>        0.289 ( 0.001 ms): a64.out/858681 brk()                           =
                                      =3D 0x56419ecf7000
>        0.291 ( 0.002 ms): a64.out/858681 brk(brk: 0x56419ed18000)        =
                                      =3D 0x56419ed18000
>        0.299 ( 0.009 ms): a64.out/858681 openat(dfd: CWD, filename: "a.c"=
)                                     =3D 3
>        0.312 ( 0.001 ms): a64.out/858681 fstat(fd: 3, statbuf: 0x7ffdfadf=
1eb0)                                 =3D 0
>        0.315 ( 0.002 ms): a64.out/858681 read(fd: 3, buf: 0x7ffdfadf2030,=
 count: 4096)                         =3D 211
>        0.318 ( 0.009 ms): a64.out/858681 read(fd: 3, buf: 0x56419ecf7480,=
 count: 4096)                         =3D 0
>        0.330 ( 0.001 ms): a64.out/858681 close(fd: 3)                    =
                                      =3D 0
>        0.338 (         ): a64.out/858681 exit_group()                    =
                                      =3D ?
>
> But 32bit is still broken and use 64bit syscall table wrongly.
>
>   $ file a32.out
>   a32.out: ELF 32-bit LSB pie executable, Intel 80386, version 1 (SYSV), =
dynamically linked, interpreter /lib/ld-linux.so.2,
>   BuildID[sha1]=3D6eea873c939012e6c715e8f030261642bf61cb4e, for GNU/Linux=
 3.2.0, not stripped
>
>   $ sudo ./perf trace ./a32.out |& tail
>        0.296 ( 0.001 ms): a32.out/858699 getxattr(pathname: "", name: "=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD", value: 0xf7f6ce14,=
 size: 1)  =3D 0
>        0.305 ( 0.007 ms): a32.out/858699 fchmod(fd: -134774784, mode: IFL=
NK|ISUID|ISVTX|IWOTH|0x10000)         =3D 0
>        0.333 ( 0.001 ms): a32.out/858699 recvfrom(size: 4160146964, flags=
: RST|0x20000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) =3D 1481879552
>        0.335 ( 0.004 ms): a32.out/858699 recvfrom(fd: 1482014720, ubuf: 0=
xf7f71278, size: 4160146964, flags: NOSIGNAL|MORE|WAITFORONE|BATCH|SPLICE_P=
AGES|CMSG_CLOEXEC|0x10500000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) =3D 1=
482014720
>        0.355 ( 0.002 ms): a32.out/858699 recvfrom(fd: 1482018816, ubuf: 0=
x5855d000, size: 4160146964, flags: RST|NOSIGNAL|MORE|WAITFORONE|BATCH|SPLI=
CE_PAGES|CMSG_CLOEXEC|0x10500000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) =
=3D 1482018816
>        0.362 ( 0.010 ms): a32.out/858699 preadv(fd: 4294967196, vec: (str=
uct iovec){.iov_base =3D (void *)0x1b01000000632e62,.iov_len =3D (__kernel_=
size_t)1125899909479171,}, pos_h: 4160146964) =3D 3
>        0.385 ( 0.002 ms): a32.out/858699 close(fd: 3)                    =
                                      =3D 211
>        0.388 ( 0.001 ms): a32.out/858699 close(fd: 3)                    =
                                      =3D 0
>        0.393 ( 0.002 ms): a32.out/858699 lstat(filename: "")             =
                                      =3D 0
>        0.396 ( 0.004 ms): a32.out/858699 recvfrom(fd: 1482014720, size: 4=
160146964, flags: NOSIGNAL|MORE|WAITFORONE|BATCH|SPLICE_PAGES|CMSG_CLOEXEC|=
0x10500000, addr: 0xf7f6ce14, addr_len: 0xf7f71278) =3D 1482014720
>
> The last 5 should be openat, read, read, close and brk(?).

That's strange as nearly the same test works for me:
```
$ git show
commit 7920020237af8138f7be1a21be9a2918a71ddc5e (HEAD -> ptn-syscalltbl)
Author: Ian Rogers <irogers@google.com>
Date:   Fri Jan 31 21:34:07 2025 -0800

   perf syscalltbl: Mask off ABI type for MIPS system calls

   Arnd Bergmann described that MIPS system calls don't necessarily start
   from 0 as an ABI prefix is applied:
   https://lore.kernel.org/lkml/8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fa=
stmail.com/
   When decoding the "id" (aka system call number) for MIPS ignore values
   greater-than 1000.

   Signed-off-by: Ian Rogers <irogers@google.com>
..
$ file a.out
a.out: ELF 32-bit LSB pie executable, Intel 80386, version 1 (SYSV),
dynamically linked, interpreter /lib/ld-linux.so.2,
BuildID[sha1]=3D3fcd28f85a27a3108941661a91dbc675c06868f9, for GNU/Linux
3.2.0, not stripped
$ sudo /tmp/perf/perf trace ./a.out
...
         ? (         ): a.out/218604  ... [continued]: execve())
                                    =3D 0
     0.067 ( 0.003 ms): a.out/218604 brk()
                                    =3D 0x5749e000
     0.154 ( 0.007 ms): a.out/218604 access(filename: 0xf7fc7f28,
mode: R)                                 =3D -1 ENOENT (No such file or
directory)
     0.168 ( 0.023 ms): a.out/218604 openat(dfd: CWD, filename:
0xf7fc44c3, flags: RDONLY|CLOEXEC|LARGEFILE) =3D 3
     0.193 ( 0.006 ms): a.out/218604 statx(dfd:
3</proc/218604/status>, filename: 0xf7fc510a, flags:
NO_AUTOMOUNT|EMPTY_PATH, mask:
TYPE|MODE|NLINK|UID|GID|ATIME|MTIME|CTIME|INO|SIZE|BLOCKS, buffer:
0xffaa6b88) =3D 0
     0.212 ( 0.002 ms): a.out/218604 close(fd: 3</proc/218604/status>)
                                    =3D 0
     0.233 ( 0.019 ms): a.out/218604 openat(dfd: CWD, filename:
0xf7f973e0, flags: RDONLY|CLOEXEC|LARGEFILE) =3D 3
     0.255 ( 0.004 ms): a.out/218604 read(fd: 3</proc/218604/status>,
buf: 0xffaa6df0, count: 512)         =3D 512
     0.262 ( 0.003 ms): a.out/218604 statx(dfd:
3</proc/218604/status>, filename: 0xf7fc510a, flags:
NO_AUTOMOUNT|EMPTY_PATH, mask:
TYPE|MODE|NLINK|UID|GID|ATIME|MTIME|CTIME|INO|SIZE|BLOCKS, buffer:
0xffaa6b38) =3D 0
     0.347 ( 0.002 ms): a.out/218604 close(fd: 3</proc/218604/status>)
                                    =3D 0
     0.372 ( 0.002 ms): a.out/218604 set_tid_address(tidptr:
0xf7f98528)                                   =3D 218604 (a.out)
     0.376 ( 0.002 ms): a.out/218604 set_robust_list(head: 0xf7f9852c,
len: 12)                            =3D
     0.381 ( 0.002 ms): a.out/218604 rseq(rseq: 0xf7f98960, rseq_len:
32, sig: 1392848979)                 =3D
     0.469 ( 0.010 ms): a.out/218604 mprotect(start: 0xf7f6e000, len:
8192, prot: READ)                    =3D 0
     0.489 ( 0.007 ms): a.out/218604 mprotect(start: 0x5661a000, len:
4096, prot: READ)                    =3D 0
     0.503 ( 0.007 ms): a.out/218604 mprotect(start: 0xf7fd0000, len:
8192, prot: READ)                    =3D 0
     0.550 ( 0.015 ms): a.out/218604 munmap(addr: 0xf7f7b000, len:
111198)                                 =3D 0
     0.589 ( 0.035 ms): a.out/218604 openat(dfd: CWD, filename:
0x56619008)                                =3D 3
     0.627 ( 0.024 ms): a.out/218604 read(fd: 3</proc/218604/status>,
buf: 0xffaa68fc, count: 4096)        =3D 1437
     0.654 ( 0.090 ms): a.out/218604 write(fd: 1</dev/pts/3>, buf: ,
count: 1437)                          =3D 1437
     0.766 (1000.164 ms): a.out/218604 clock_nanosleep(rqtp:
0xffaa6824, rmtp: 0xffaa681c)                   =3D 0
  1000.942 (         ): a.out/218604 exit_group()
$ file /tmp/perf/perf
/tmp/perf/perf: ELF 64-bit LSB pie executable, x86-64, version 1
(SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2,
BuildID[sha1]=3D60b07f65d2559a7193b2d1d36cfa00054dfbd076, for GNU/Linux
3.2.0, with debug_info, not stripped
```
Perhaps your a.out binary was built as an x32 one?
Looking under the covers with gdb:
```
$ sudo gdb --args /tmp/perf/perf trace ./a.out
GNU gdb (Debian 15.1-1) 15.1
...
Reading symbols from /tmp/perf/perf...
(gdb) b syscalltbl__name
Breakpoint 1 at 0x23a51b: file util/syscalltbl.c, line 47.
(gdb) r
...
[Detaching after vfork from child process 218826]

Breakpoint 1, syscalltbl__name (e_machine=3D3, id=3D11) at util/syscalltbl.=
c:47
47              const struct syscalltbl *table =3D find_table(e_machine);
```
So the e_machine is 3 which corresponds to EM_386.

I've not fixed every use of syscalltbl but I believe this one is working.

Thanks,
Ian

> >
> > v3: Add Charlie's reviewed-by tags. Incorporate feedback from Arnd
> >     Bergmann <arnd@arndb.de> on additional optional column and MIPS
> >     system call numbering. Rebase past Namhyung's global system call
> >     statistics and add comments that they don't yet support an
> >     e_machine other than EM_HOST.
> >
> > v2: Change the 1 element cache for the last table as suggested by
> >     Howard Chu, add Howard's reviewed-by tags.
> >     Add a comment and apology to Charlie for not doing better in
> >     guiding:
> >     https://lore.kernel.org/all/20250114-perf_syscall_arch_runtime-v1-1=
-5b304e408e11@rivosinc.com/
> >     After discussion on v1 and he agreed this patch series would be
> >     the better direction.
> >
> > Ian Rogers (8):
> >   perf syscalltble: Remove syscall_table.h
> >   perf trace: Reorganize syscalls
> >   perf syscalltbl: Remove struct syscalltbl
> >   perf thread: Add support for reading the e_machine type for a thread
> >   perf trace beauty: Add syscalltbl.sh generating all system call table=
s
> >   perf syscalltbl: Use lookup table containing multiple architectures
> >   perf build: Remove Makefile.syscalls
> >   perf syscalltbl: Mask off ABI type for MIPS system calls
> >
> >  tools/perf/Makefile.perf                      |  10 +-
> >  tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
> >  .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
> >  tools/perf/arch/alpha/include/syscall_table.h |   2 -
> >  tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
> >  .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
> >  tools/perf/arch/arc/include/syscall_table.h   |   2 -
> >  tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
> >  .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
> >  tools/perf/arch/arm/include/syscall_table.h   |   2 -
> >  tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
> >  .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
> >  tools/perf/arch/arm64/include/syscall_table.h |   8 -
> >  tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
> >  .../csky/entry/syscalls/Makefile.syscalls     |   3 -
> >  tools/perf/arch/csky/include/syscall_table.h  |   2 -
> >  .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
> >  .../entry/syscalls/Makefile.syscalls          |   3 -
> >  .../arch/loongarch/include/syscall_table.h    |   2 -
> >  tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
> >  .../mips/entry/syscalls/Makefile.syscalls     |   5 -
> >  tools/perf/arch/mips/include/syscall_table.h  |   2 -
> >  tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
> >  .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
> >  .../perf/arch/parisc/include/syscall_table.h  |   8 -
> >  tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
> >  .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
> >  .../perf/arch/powerpc/include/syscall_table.h |   8 -
> >  tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
> >  .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
> >  tools/perf/arch/riscv/include/syscall_table.h |   8 -
> >  tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
> >  .../s390/entry/syscalls/Makefile.syscalls     |   5 -
> >  tools/perf/arch/s390/include/syscall_table.h  |   2 -
> >  tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
> >  .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
> >  tools/perf/arch/sh/include/syscall_table.h    |   2 -
> >  tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
> >  .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
> >  tools/perf/arch/sparc/include/syscall_table.h |   8 -
> >  tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
> >  .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
> >  tools/perf/arch/x86/include/syscall_table.h   |   8 -
> >  tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
> >  .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
> >  .../perf/arch/xtensa/include/syscall_table.h  |   2 -
> >  tools/perf/builtin-trace.c                    | 290 +++++++++++-------
> >  tools/perf/scripts/Makefile.syscalls          |  61 ----
> >  tools/perf/scripts/syscalltbl.sh              |  86 ------
> >  tools/perf/trace/beauty/syscalltbl.sh         | 274 +++++++++++++++++
> >  tools/perf/util/syscalltbl.c                  | 148 ++++-----
> >  tools/perf/util/syscalltbl.h                  |  22 +-
> >  tools/perf/util/thread.c                      |  50 +++
> >  tools/perf/util/thread.h                      |  14 +-
> >  54 files changed, 616 insertions(+), 509 deletions(-)
> >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscall=
s
> >  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscall=
s
> >  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscal=
ls
> >  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.s=
yscalls
> >  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscal=
ls
> >  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.sysc=
alls
> >  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.sys=
calls
> >  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscal=
ls
> >  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
> >  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscall=
s
> >  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.sysc=
alls
> >  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
> >  delete mode 100644 tools/perf/scripts/Makefile.syscalls
> >  delete mode 100755 tools/perf/scripts/syscalltbl.sh
> >  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> >
> > --
> > 2.48.1.601.g30ceb7b040-goog
> >

