Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249DAC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 05:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdDEJTsHKwvjyl+F7qkE/MVBBT69xP0JtpsTNjb5e+Q=; b=e1M/63PLJtZ3xVOSkZ87WS3OsX
	+umhh+Swt5hRI7S3fAekNj/ExewK7alOMLnJJnFBz9qIK9t2YNN/mQNN7/XUDJNI9Y4a1w+wABTI9
	mnuN2aha/vDjfOpVQYZyHDFJjlTBO47XTR9ehnCn2wv2TFaLVXfw9an94Oi36hnuJ3NRzcV9DDHje
	18Z963SUJtX1GwZ6cZoSbZq1WCDElXHng6F4FOFXXf4DVNfvYl1ljxtkaPRSzsKg/pfDdJ4aIy/qW
	lxfBvZDHxQMbOR1CB+SOiJ43Bu7RJUKKRGtYLKujm38mlDuJNzeZ6JcjTUbPtB0TbMic48UTOKFBI
	FkXwcFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQJv-0000000DDVn-0ZYO;
	Fri, 07 Mar 2025 05:32:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQHx-0000000DD2r-3bum
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 05:30:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2240aad70f2so107165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 21:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741325425; x=1741930225; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdDEJTsHKwvjyl+F7qkE/MVBBT69xP0JtpsTNjb5e+Q=;
        b=NQ1uNkZ0UsC7XYj3pVS0zp1xXlZI/eQMh7czopYFErL8jbypTDRhm/iZUw4TK7hILS
         EpKhSZ7o7FG8VELQRRPtuOooZ8uotzKxom1YqfeaknoEqfEbPgopJf3p2ttoDKsWVrB9
         pnunqAYyftJ4NcFMwqDXwTJj7HZu8phD14o1hYRiMbMgfSZ+p66pFedzVVfanl4YH91r
         p/Vo2ofMlCyblvkh6x4hXssbYAL0AFZjvgWI9SZVNW84YBEJvIq0uF5MvtL2rN4OXWpM
         3RBgMNJLe1GYwGxctT+fzVmMADPffNp4BpIx6CSR7F7zAMkpfI0XOgQrxD9Kb6AhhEV0
         l0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741325425; x=1741930225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdDEJTsHKwvjyl+F7qkE/MVBBT69xP0JtpsTNjb5e+Q=;
        b=G+RQRcLPHWVZ7X0zvzhoe0wGSc6piKrpUzpR2U9UNCU9lyevc0pE2vngfGPtBQrEIy
         IibjlTY6/9MTf0cPdisyI5qCgEJD8HKtyiQO/Pzl1VvDmIH+gJT7+MjcG6+YwClJJQme
         +caThDutCCDvKxEgwJx17Q34NWauol9rO4k/ZvNCvuDpmMCFLty/wWcf9tcW/n29ve9N
         l14jx6iWwgIp8wZt95V2BHeUnX9sG8ypNKIo/jtBaMDo/Kmd9Qfd9B5+aW0iz1F6s0x0
         h+PNwRMyJaHUPz56bqALUdHl1KZLMmd1qkVnVyQE2Vf3jXePiHs2UZeuOll5spGwL5Rx
         PztA==
X-Forwarded-Encrypted: i=1; AJvYcCWwGl5YJNCPu//A3pWqv4VLhW1fgaHdxbEJe2IWnyJdB4+IGYVKz+BTKYxKjXkyGPmwpwe29gvcGs+TMMSMjNkj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6AmqhP/BAuKCnbI3OtMnu4paQpkdPY+TZbZnWXrBG6S1z+WEB
	Bgt5gxGcpByJtug6UanpH2Tnz2kCeT6SQ2HL4VwtR3GUYTYPu8qfNz/IBYmtnU3N5LvTnDoFatQ
	e8JmdXzLjDvaiN7CVdz2X8Ygrpv94vuOUwEOF
X-Gm-Gg: ASbGncuxeaj4ax/x+YpsNuKdigtWIvlh2cB9bGErnPjk0LdtYhh2YQGcI0ihWwC09dS
	1MxaNyVq18bFmFuH9+bAvzRcbwmGS1GPeb3KIShHKL9/+SJzItZU8EtXzF9NXDUNIGXDuwicMFN
	zb5l5R9v5zDZE0KlpNmXfGkqMuisg=
X-Google-Smtp-Source: AGHT+IEcodZzFnpZf8m9GKxcrOIuoYtTe9WlblycwKpr+zFPLDPbCwJqYAatYqYzvaFLYn5WJRIGjZXLMcuz4Nbng4s=
X-Received: by 2002:a17:902:d504:b0:220:ce33:6385 with SMTP id
 d9443c01a7336-2242a6004b6mr1115105ad.9.1741325424567; Thu, 06 Mar 2025
 21:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20250304050305.901167-1-irogers@google.com> <20250304050305.901167-7-irogers@google.com>
 <Z8pKTE7tOqdqNUdA@google.com>
In-Reply-To: <Z8pKTE7tOqdqNUdA@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 6 Mar 2025 21:30:13 -0800
X-Gm-Features: AQ5f1JqqAJ5MO97ObltKzRcURCg1d-Uko29NllBm3N5v0f7KDyGvXHVOjRAnU58
Message-ID: <CAP-5=fXdZZX=wa8EkN-dcpnDjA7J-cQ09BERufAQzoBeoNCT1g@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] perf dso: Add support for reading the e_machine
 type for a dso
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
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_213025_897088_3F31400C 
X-CRM114-Status: GOOD (  28.88  )
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

On Thu, Mar 6, 2025 at 5:22=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> On Mon, Mar 03, 2025 at 09:03:00PM -0800, Ian Rogers wrote:
> > For ELF file dsos read the e_machine from the ELF header. For kernel
> > types assume the e_machine matches the perf tool. In other cases
> > return EM_NONE.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/dso.c | 54 +++++++++++++++++++++++++++++++++++++++++++
> >  tools/perf/util/dso.h |  1 +
> >  2 files changed, 55 insertions(+)
> >
> > diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
> > index 5c6e85fdae0d..7f2f1af4f73b 100644
> > --- a/tools/perf/util/dso.c
> > +++ b/tools/perf/util/dso.c
> > @@ -1170,6 +1170,60 @@ ssize_t dso__data_read_offset(struct dso *dso, s=
truct machine *machine,
> >       return data_read_write_offset(dso, machine, offset, data, size, t=
rue);
> >  }
> >
> > +uint16_t dso__e_machine(struct dso *dso, struct machine *machine)
> > +{
> > +     uint16_t e_machine =3D EM_NONE;
> > +     int fd;
> > +
> > +     switch (dso__binary_type(dso)) {
> > +     case DSO_BINARY_TYPE__KALLSYMS:
> > +     case DSO_BINARY_TYPE__GUEST_KALLSYMS:
> > +     case DSO_BINARY_TYPE__VMLINUX:
> > +     case DSO_BINARY_TYPE__GUEST_VMLINUX:
> > +     case DSO_BINARY_TYPE__GUEST_KMODULE:
> > +     case DSO_BINARY_TYPE__GUEST_KMODULE_COMP:
> > +     case DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE:
> > +     case DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE_COMP:
> > +     case DSO_BINARY_TYPE__KCORE:
> > +     case DSO_BINARY_TYPE__GUEST_KCORE:
> > +     case DSO_BINARY_TYPE__BPF_PROG_INFO:
> > +     case DSO_BINARY_TYPE__BPF_IMAGE:
> > +     case DSO_BINARY_TYPE__OOL:
> > +     case DSO_BINARY_TYPE__JAVA_JIT:
>
> I think some of them can be possible in recorded data.  But let's go
> simple with EM_HOST as we haven't supported cross-arch trace.

I think you are agreeing with the code, which I think is right :-) I
don't know a way to go from say /proc/kallsyms text file to an
e_machine number and inventing a way is getting beyond the scope of
this series.

> > +             return EM_HOST;
> > +     case DSO_BINARY_TYPE__DEBUGLINK:
> > +     case DSO_BINARY_TYPE__BUILD_ID_CACHE:
> > +     case DSO_BINARY_TYPE__BUILD_ID_CACHE_DEBUGINFO:
> > +     case DSO_BINARY_TYPE__SYSTEM_PATH_DSO:
> > +     case DSO_BINARY_TYPE__OPENEMBEDDED_DEBUGINFO:
> > +     case DSO_BINARY_TYPE__FEDORA_DEBUGINFO:
> > +     case DSO_BINARY_TYPE__UBUNTU_DEBUGINFO:
> > +     case DSO_BINARY_TYPE__MIXEDUP_UBUNTU_DEBUGINFO:
> > +     case DSO_BINARY_TYPE__BUILDID_DEBUGINFO:
> > +             break;
> > +     case DSO_BINARY_TYPE__NOT_FOUND:
> > +     default:
> > +             return EM_NONE;
> > +     }
> > +
> > +     pthread_mutex_lock(&dso__data_open_lock);
>
> Hmm.. I'm afraid it'd slow down perf trace a bit more.  It sees
> occasional LOST events.  But it may be ok as it's cached in thread later.

Agreed, I think the caching will handle this. The lock is pre-existing
and is used to guard use of the dso_data->fd. The lock could be made
reader-writer, it could be placed within the dso_data it could also be
sharded. I've not done any of that here as I believe the processing is
all handled on a single thread anyway.

> > +
> > +     /*
> > +      * dso__data(dso)->fd might be closed if other thread opened anot=
her
> > +      * file (dso) due to open file limit (RLIMIT_NOFILE).
> > +      */
> > +     try_to_open_dso(dso, machine);
> > +     fd =3D dso__data(dso)->fd;
> > +     if (fd >=3D 0) {
> > +             _Static_assert(offsetof(Elf32_Ehdr, e_machine) =3D=3D 18,=
 "Unexpected offset");
> > +             _Static_assert(offsetof(Elf64_Ehdr, e_machine) =3D=3D 18,=
 "Unexpected offset");
> > +             if (pread(fd, &e_machine, sizeof(e_machine), 18) !=3D siz=
eof(e_machine))
>
> I think it needs to check the endianess and swap the data.

Agreed. Will send a fix in v5.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > +                     e_machine =3D EM_NONE;
> > +     }
> > +     pthread_mutex_unlock(&dso__data_open_lock);
> > +     return e_machine;
> > +}
> > +
> >  /**
> >   * dso__data_read_addr - Read data from dso address
> >   * @dso: dso object
> > diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> > index f3ca2a5e7670..ba9b83db061a 100644
> > --- a/tools/perf/util/dso.h
> > +++ b/tools/perf/util/dso.h
> > @@ -818,6 +818,7 @@ int dso__data_file_size(struct dso *dso, struct mac=
hine *machine);
> >  off_t dso__data_size(struct dso *dso, struct machine *machine);
> >  ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine=
,
> >                             u64 offset, u8 *data, ssize_t size);
> > +uint16_t dso__e_machine(struct dso *dso, struct machine *machine);
> >  ssize_t dso__data_read_addr(struct dso *dso, struct map *map,
> >                           struct machine *machine, u64 addr,
> >                           u8 *data, ssize_t size);
> > --
> > 2.48.1.711.g2feabab25a-goog
> >

