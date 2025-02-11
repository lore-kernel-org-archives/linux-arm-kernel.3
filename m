Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F630C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 05:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJbWFN9obvqmrGBaLDgirkSslltkhSez5QGjVbmhl6M=; b=1cPtMpuBS7aw8xAFo9AF4NYlhF
	7p2dKIZLVZQLGndzqgxXT9MqgM6PVOyD8QdkenncdtziZfFzf2D9XHfJvIXosNAKWmF9VTQUtvelY
	XvmWvhfTdsnU2QiXYP3Pi1u767pytsz3HJ5EZhxy4Ih3yQeSJZ0WVzr5XxLmmLpFPbzGZ4xfXDM+H
	nSHh9e7jAqr5q0Ad2+P3Eh5dx2h4qI5qlb2fFStXnLkCXzRzqzsfZlNZ8BMIKl5cvNJC+LcAjgt1d
	PirxBnub1IPMQh+aqVF7KADCR6TsrKrXZDkCMmY3zcHR1kH/wfUZuU1Q3bGCM0fhwo1RkMWsTp/Sj
	ISmZd8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thido-00000002ZBl-2hkG;
	Tue, 11 Feb 2025 05:17:00 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thicO-00000002YxV-1Gs8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 05:15:34 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d147331fb5so106775ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 21:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739250931; x=1739855731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJbWFN9obvqmrGBaLDgirkSslltkhSez5QGjVbmhl6M=;
        b=r9XTszGGCqBpV3AV7AWBbslvcspt+CwMaezsvxCzLnY3QPAyR4e8pZYbAEFhZd4RWg
         TvnQqOseC540L+B1TFNYyxHFxSv3IMGikvmLVx9rzC14luIXxR8eWGoIp+lyVG6r7NpW
         YyZGvdxWW7qvVcAQBbAMksW7u88nFKPRKJWkD/tRQecQx7qOyaKZoexdQaehSqHoSxmD
         mlQ1ZR5C1aZjFNfgP81ppoLS5RO6mnuvhQ+njRIrdligZebfwe/P7YfRUG18RDO6U8zC
         AzJ8BkSPTedfTdoV1k2gcAlbZccT6iyIQUkSMZNDg7JLM9k6/6U7TUe1GKjWxofCAIDj
         6YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739250931; x=1739855731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJbWFN9obvqmrGBaLDgirkSslltkhSez5QGjVbmhl6M=;
        b=GqQOf/7/6HloANCczZKjXOhn/PaNcAcv2lS/6GLbrAy4ynmJ4SOujX662C57Pj2H/N
         DMUW7yZr8CUIwYYNyR4Sg47O0GqI5Sji9ADAVm6E1drocnG4//NDRXMpB8Zf3y6XVON0
         UPDUdlHDismA4Ygm+GmR4pu4nOl0v82F8+OjagNOOxPWOIlSBfg0XnfjL5AGVJ8aW6AO
         YPn1EEcb/pYMBmeI7sMS6OfhTUhzA5Bp2Wkug5tvU9NmUKgHctKt+IOqObx0skr+XohA
         fIP2/6+6iNwWK09lpCbYNv9QJZLp7jY09hJV21S2StwOXQA8KDjCkMkk2kOU4XoUv7Bs
         5t+g==
X-Forwarded-Encrypted: i=1; AJvYcCUQG63BiacAc5DkD02tjY4396JUubcN20MznhrDXQdXb/IttDCvgF9ANYLLN6AQeVvNfwZi8ptcCV8dTxvdip/i@lists.infradead.org
X-Gm-Message-State: AOJu0YxUFODdhI55pf7+VkDQKhMkvpYJy61q+g5YnLyQB0OecyFdThwg
	huVr0cBjngliRYVi84Au6MURoYTKdhTKldCDABRko3Km4bQUlHiYDizlFwBh6Ir+knsJF9m+myG
	c/fduly5KccCLjyZTlqJxU0k3CES10Jv2QqQ0
X-Gm-Gg: ASbGncuhuu/YNN9gJzA0sKJCyptvtj4KbEkaUysQosezisoGD7AonzdVqgNeXdhlXkD
	TFHNSmpJdi574jXKJZwmjdVpn0Eq+NKIKQsAEiIUPrbJtneueYOUYCQ1BYfSgqGJYEXgMLNXzFg
	==
X-Google-Smtp-Source: AGHT+IGfSl4kWhCCgj3XPGHNCoxGxNbbsLFo1bp5YL3grWE6XvcLpoEkx4NmLGXATzlWTGCv+Emwhbcj1yN10fQqLnU=
X-Received: by 2002:a05:6e02:152c:b0:3d0:51e0:14af with SMTP id
 e9e14a558f8ab-3d16fde3e3dmr1966765ab.10.1739250930870; Mon, 10 Feb 2025
 21:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20250210165108.95894-1-irogers@google.com> <20250210165108.95894-7-irogers@google.com>
 <Z6qOHi0D89o1pdQl@ghost>
In-Reply-To: <Z6qOHi0D89o1pdQl@ghost>
From: Ian Rogers <irogers@google.com>
Date: Mon, 10 Feb 2025 21:15:19 -0800
X-Gm-Features: AWEUYZkbCdQvay1KVLiyu-3jGD0mNnHZ9ZWTU7CH6hQ_dxYDj52b6QlzEYbBh7I
Message-ID: <CAP-5=fXO6S8p8y11uwg46zM46MboZ3+QuoK+JuNTdbo3WBfqtg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] perf syscalltbl: Use lookup table containing
 multiple architectures
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
X-CRM114-CacheID: sfid-20250210_211532_345497_9BE8E113 
X-CRM114-Status: GOOD (  34.81  )
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

On Mon, Feb 10, 2025 at 3:39=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> On Mon, Feb 10, 2025 at 08:51:07AM -0800, Ian Rogers wrote:
> > Switch to use the lookup table containing all architectures rather
> > than tables matching the perf binary.
> >
> > This fixes perf trace when executed on a 32-bit i386 binary on an
> > x86-64 machine. Note in the following the system call names of the
> > 32-bit i386 binary as seen by an x86-64 perf.
> >
> > Before:
> > ```
> >          ? (         ): a.out/447296  ... [continued]: munmap())       =
                                    =3D 0
> >      0.024 ( 0.001 ms): a.out/447296 recvfrom(ubuf: 0x2, size: 41605857=
08, flags: DONTROUTE|CTRUNC|TRUNC|DONTWAIT|EOR|WAITALL|FIN|SYN|CONFIRM|RST|=
ERRQUEUE|NOSIGNAL|WAITFORONE|BATCH|SOCK_DEVMEM|ZEROCOPY|FASTOPEN|CMSG_CLOEX=
EC|0x91f80000, addr: 0xe30, addr_len: 0xffce438c) =3D 1475198976
> >      0.042 ( 0.003 ms): a.out/447296 lgetxattr(name: "", value: 0x3, si=
ze: 34)                             =3D 4160344064
> >      0.054 ( 0.003 ms): a.out/447296 dup2(oldfd: -134422744, newfd: 4) =
                                    =3D -1 ENOENT (No such file or director=
y)
> >      0.060 ( 0.009 ms): a.out/447296 preadv(fd: 4294967196, vec: (struc=
t iovec){.iov_base =3D (void *)0x2e646c2f6374652f,.iov_len =3D (__kernel_si=
ze_t)7307199665335594867,}, vlen: 557056, pos_h: 4160585708) =3D 3
> >      0.074 ( 0.004 ms): a.out/447296 lgetxattr(name: "", value: 0x1, si=
ze: 2)                              =3D 4160237568
> >      0.080 ( 0.001 ms): a.out/447296 lstat(filename: "", statbuf: 0x193=
f6)                                 =3D 0
> >      0.089 ( 0.007 ms): a.out/447296 preadv(fd: 4294967196, vec: (struc=
t iovec){.iov_base =3D (void *)0x3833692f62696c2f,.iov_len =3D (__kernel_si=
ze_t)3276497845987585334,}, vlen: 557056, pos_h: 4160585708) =3D 3
> >      0.097 ( 0.002 ms): a.out/447296 close(fd: 3</proc/447296/status>) =
                                    =3D 512
> >      0.103 ( 0.002 ms): a.out/447296 lgetxattr(name: "", value: 0x1, si=
ze: 2050)                           =3D 4157935616
> >      0.107 ( 0.007 ms): a.out/447296 lgetxattr(pathname: "", name: "", =
value: 0x5, size: 2066)             =3D 4158078976
> >      0.116 ( 0.003 ms): a.out/447296 lgetxattr(pathname: "", name: "", =
value: 0x1, size: 2066)             =3D 4159639552
> >      0.121 ( 0.003 ms): a.out/447296 lgetxattr(pathname: "", name: "", =
value: 0x3, size: 2066)             =3D 4160184320
> >      0.129 ( 0.002 ms): a.out/447296 lgetxattr(pathname: "", name: "", =
value: 0x3, size: 50)               =3D 4160196608
> >      0.138 ( 0.001 ms): a.out/447296 lstat(filename: "")               =
                                    =3D 0
> >      0.145 ( 0.002 ms): a.out/447296 mq_timedreceive(mqdes: 4291706800,=
 u_msg_ptr: 0xf7f9ea48, msg_len: 134616640, u_msg_prio: 0xf7fd7fec, u_abs_t=
imeout: (struct __kernel_timespec){.tv_sec =3D (__kernel_time64_t)-57817402=
7777317696,.tv_nsec =3D (long long int)4160349376,}) =3D 0
> >      0.148 ( 0.001 ms): a.out/447296 mkdirat(dfd: -134617816, pathname:=
 " =EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD=E2=96=92=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=E2=96=92=EF=BF=BD=EF=BF=BD=EF=BF=BD", mode: IFREG|ISU=
ID|IRUSR|IWGRP|0xf7fd0000) =3D 447296
> >      0.150 ( 0.001 ms): a.out/447296 process_vm_writev(pid: -134617812,=
 lvec: (struct iovec){.iov_base =3D (void *)0xf7f9e9c8f7f9e4c0,.iov_len =3D=
 (__kernel_size_t)4160349376,}, liovcnt: 4160588048, rvec: (struct iovec){}=
, riovcnt: 4160585708, flags: 4291707352) =3D 0
> >      0.197 ( 0.004 ms): a.out/447296 capget(header: 4160184320, dataptr=
: 8192)                             =3D 0
> >      0.202 ( 0.002 ms): a.out/447296 capget(header: 1448669184, dataptr=
: 4096)                             =3D 0
> >      0.208 ( 0.002 ms): a.out/447296 capget(header: 4160577536, dataptr=
: 8192)                             =3D 0
> >      0.220 ( 0.001 ms): a.out/447296 getxattr(pathname: "", name: "c=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD", value: 0xf7f77e34, si=
ze: 1)  =3D 0
> >      0.228 ( 0.005 ms): a.out/447296 fchmod(fd: -134729728, mode: IRUGO=
|IWUGO|IFREG|IFIFO|ISVTX|IXUSR|0x10000) =3D 0
> >      0.240 ( 0.009 ms): a.out/447296 preadv(fd: 4294967196, vec: 0x5658=
e008, pos_h: 4160192052)            =3D 3
> >      0.250 ( 0.008 ms): a.out/447296 close(fd: 3</proc/447296/status>) =
                                    =3D 1436
> >      0.260 ( 0.018 ms): a.out/447296 stat(filename: "", statbuf: 0xffce=
32ac)                               =3D 1436
> >      0.288 (1000.213 ms): a.out/447296 readlinkat(buf: 0xffce31d4, bufs=
iz: 4291703244)                       =3D 0
> > ```
> >
> > After:
> > ```
> >          ? (         ): a.out/442930  ... [continued]: execve())       =
                                    =3D 0
> >      0.023 ( 0.002 ms): a.out/442930 brk()                             =
                                    =3D 0x57760000
> >      0.052 ( 0.003 ms): a.out/442930 access(filename: 0xf7f5af28, mode:=
 R)                                 =3D -1 ENOENT (No such file or director=
y)
> >      0.059 ( 0.009 ms): a.out/442930 openat(dfd: CWD, filename: "/etc/l=
d.so.cache", flags: RDONLY|CLOEXEC|LARGEFILE) =3D 3
> >      0.078 ( 0.001 ms): a.out/442930 close(fd: 3</proc/442930/status>) =
                                    =3D 0
> >      0.087 ( 0.007 ms): a.out/442930 openat(dfd: CWD, filename: "/lib/i=
386-linux-", flags: RDONLY|CLOEXEC|LARGEFILE) =3D 3
> >      0.095 ( 0.002 ms): a.out/442930 read(fd: 3</proc/442930/status>, b=
uf: 0xffbdbb70, count: 512)         =3D 512
> >      0.135 ( 0.001 ms): a.out/442930 close(fd: 3</proc/442930/status>) =
                                    =3D 0
> >      0.148 ( 0.001 ms): a.out/442930 set_tid_address(tidptr: 0xf7f2b528=
)                                   =3D 442930 (a.out)
> >      0.150 ( 0.001 ms): a.out/442930 set_robust_list(head: 0xf7f2b52c, =
len: 12)                            =3D
> >      0.196 ( 0.004 ms): a.out/442930 mprotect(start: 0xf7f03000, len: 8=
192, prot: READ)                    =3D 0
> >      0.202 ( 0.002 ms): a.out/442930 mprotect(start: 0x5658e000, len: 4=
096, prot: READ)                    =3D 0
> >      0.207 ( 0.002 ms): a.out/442930 mprotect(start: 0xf7f63000, len: 8=
192, prot: READ)                    =3D 0
> >      0.230 ( 0.005 ms): a.out/442930 munmap(addr: 0xf7f10000, len: 1034=
14)                                 =3D 0
> >      0.244 ( 0.010 ms): a.out/442930 openat(dfd: CWD, filename: 0x5658d=
008)                                =3D 3
> >      0.255 ( 0.007 ms): a.out/442930 read(fd: 3</proc/442930/status>, b=
uf: 0xffbdb67c, count: 4096)        =3D 1436
> >      0.264 ( 0.018 ms): a.out/442930 write(fd: 1</dev/pts/4>, buf: , co=
unt: 1436)                          =3D 1436
> >      0.292 (1000.173 ms): a.out/442930 clock_nanosleep(rqtp: { .tv_sec:=
 17866546940376776704, .tv_nsec: 4159878336 }, rmtp: 0xffbdb59c) =3D 0
> >   1000.478 (         ): a.out/442930 exit_group()                      =
                                    =3D ?
> > ```
> >
>
> I think I am conflating some things in my mind here. This change doesn't
> impact perf report does it? perf report reports syscall numbers only,
> but it could be hooked up into this change to correctly report the
> correct syscall name from a perf.data generated on any architecture?
>
> I believe that question is tangential to this patch but let me know!

You are right it is tangential. There are tracepoints for most system
calls that could be used to break down individual counts. You may be
thinking of `perf trace record` that I mentioned. Many of the perf
commands have a record and report option, so that things can be done
off-line. The support isn't what it should be. For example, `perf stat
record` will record event information and counts but it doesn't do
things like store metrics, so you'd need to manually compute a metric
from `perf stat report` if you wanted to use `perf stat` in this
record/report mode. I think often times think C is a very slow and
verbose way of doing the plumbing for these things, so I keep pushing
my python patches along.

Thanks for all your changes and the reviews! This patch series is just
moving things you've enabled around and was little work as a
consequence.

Thanks,
Ian

> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > Reviewed-by: Howard Chu <howardchu95@gmail.com>
> > ---
> >  tools/perf/util/syscalltbl.c | 89 ++++++++++++++++++++++++++----------
> >  1 file changed, 64 insertions(+), 25 deletions(-)
> >
> > diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.=
c
> > index 760ac4d0869f..db0d2b81aed1 100644
> > --- a/tools/perf/util/syscalltbl.c
> > +++ b/tools/perf/util/syscalltbl.c
> > @@ -15,16 +15,39 @@
> >  #include <string.h>
> >  #include "string2.h"
> >
> > -#if __BITS_PER_LONG =3D=3D 64
> > -  #include <asm/syscalls_64.h>
> > -#else
> > -  #include <asm/syscalls_32.h>
> > -#endif
> > +#include "trace/beauty/generated/syscalltbl.c"
> >
> > -const char *syscalltbl__name(int e_machine __maybe_unused, int id)
> > +static const struct syscalltbl *find_table(int e_machine)
> >  {
> > -     if (id >=3D 0 && id <=3D (int)ARRAY_SIZE(syscall_num_to_name))
> > -             return syscall_num_to_name[id];
> > +     static const struct syscalltbl *last_table;
> > +     static int last_table_machine =3D EM_NONE;
> > +
> > +     /* Tables only exist for EM_SPARC. */
> > +     if (e_machine =3D=3D EM_SPARCV9)
> > +             e_machine =3D EM_SPARC;
> > +
> > +     if (last_table_machine =3D=3D e_machine && last_table !=3D NULL)
> > +             return last_table;
> > +
> > +     for (size_t i =3D 0; i < ARRAY_SIZE(syscalltbls); i++) {
> > +             const struct syscalltbl *entry =3D &syscalltbls[i];
> > +
> > +             if (entry->e_machine !=3D e_machine && entry->e_machine !=
=3D EM_NONE)
> > +                     continue;
> > +
> > +             last_table =3D entry;
> > +             last_table_machine =3D e_machine;
> > +             return entry;
> > +     }
> > +     return NULL;
> > +}
> > +
> > +const char *syscalltbl__name(int e_machine, int id)
> > +{
> > +     const struct syscalltbl *table =3D find_table(e_machine);
> > +
> > +     if (table && id >=3D 0 && id < table->num_to_name_len)
> > +             return table->num_to_name[id];
> >       return NULL;
> >  }
> >
> > @@ -41,38 +64,54 @@ static int syscallcmpname(const void *vkey, const v=
oid *ventry)
> >       return strcmp(key->name, key->tbl[*entry]);
> >  }
> >
> > -int syscalltbl__id(int e_machine __maybe_unused, const char *name)
> > +int syscalltbl__id(int e_machine, const char *name)
> >  {
> > -     struct syscall_cmp_key key =3D {
> > -             .name =3D name,
> > -             .tbl =3D syscall_num_to_name,
> > -     };
> > -     const int *id =3D bsearch(&key, syscall_sorted_names,
> > -                             ARRAY_SIZE(syscall_sorted_names),
> > -                             sizeof(syscall_sorted_names[0]),
> > -                             syscallcmpname);
> > +     const struct syscalltbl *table =3D find_table(e_machine);
> > +     struct syscall_cmp_key key;
> > +     const int *id;
> > +
> > +     if (!table)
> > +             return -1;
> > +
> > +     key.name =3D name;
> > +     key.tbl =3D table->num_to_name;
> > +     id =3D bsearch(&key, table->sorted_names, table->sorted_names_len=
,
> > +                  sizeof(table->sorted_names[0]), syscallcmpname);
> >
> >       return id ? *id : -1;
> >  }
> >
> > -int syscalltbl__num_idx(int e_machine __maybe_unused)
> > +int syscalltbl__num_idx(int e_machine)
> >  {
> > -     return ARRAY_SIZE(syscall_sorted_names);
> > +     const struct syscalltbl *table =3D find_table(e_machine);
> > +
> > +     if (!table)
> > +             return 0;
> > +
> > +     return table->sorted_names_len;
> >  }
> >
> > -int syscalltbl__id_at_idx(int e_machine __maybe_unused, int idx)
> > +int syscalltbl__id_at_idx(int e_machine, int idx)
> >  {
> > -     return syscall_sorted_names[idx];
> > +     const struct syscalltbl *table =3D find_table(e_machine);
> > +
> > +     if (!table)
> > +             return -1;
> > +
> > +     assert(idx >=3D 0 && idx < table->sorted_names_len);
> > +     return table->sorted_names[idx];
> >  }
> >
> > -int syscalltbl__strglobmatch_next(int e_machine __maybe_unused, const =
char *syscall_glob, int *idx)
> > +int syscalltbl__strglobmatch_next(int e_machine, const char *syscall_g=
lob, int *idx)
> >  {
> > -     for (int i =3D *idx + 1; i < (int)ARRAY_SIZE(syscall_sorted_names=
); ++i) {
> > -             const char *name =3D syscall_num_to_name[syscall_sorted_n=
ames[i]];
> > +     const struct syscalltbl *table =3D find_table(e_machine);
> > +
> > +     for (int i =3D *idx + 1; table && i < table->sorted_names_len; ++=
i) {
> > +             const char *name =3D table->num_to_name[table->sorted_nam=
es[i]];
> >
> >               if (strglobmatch(name, syscall_glob)) {
> >                       *idx =3D i;
> > -                     return syscall_sorted_names[i];
> > +                     return table->sorted_names[i];
> >               }
> >       }
> >
> > --
> > 2.48.1.502.g6dc24dfdaf-goog
> >

