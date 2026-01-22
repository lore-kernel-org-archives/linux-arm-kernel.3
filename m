Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D540CD3EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+AIbIK3eQTohbEi9mUjrpLQdvDbJl+5v84GWpefTnM=; b=pfKOWTqr5ERRjf4zfrjAlWqYz5
	v3TDHJHmHeZtcAJZ5kGofuh7NSojnibO6KcQ74djDESqgm9Jxvxv1ydragfAZQ5mST1sGWAQjxUlq
	c6qlTI2PbUTmjVrxuZd/aC+Q+BnkMAoKufsYYJUjNtKtDZ/vAriehZsZbxJObJXppHVlX6ax40Hzk
	aWUQjUqa8pJ81YB1YJVgfPy7l7n0uAFpECYV3GZfJKs3U6IHoOKh/rrcdZjA9O966zoXEXDD+L3U0
	S5TEBO7irCkqHQTjkErpbptfW8HlMowgSAJVgavG1+vvvUyyN69747CM1Htc8gdmi2Tv6nn1xOnS8
	90dSgrDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixCJ-00000007Nws-0rzI;
	Thu, 22 Jan 2026 16:06:15 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixCG-00000007NwA-1AXB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:06:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a35ae38bdfso77625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 08:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769097971; cv=none;
        d=google.com; s=arc-20240605;
        b=LDFiVrNZ1lfHsKa44fZtEUHmBBIbhd8qGh1ttxPg2HqW8+PkKg1dvHbKMmlVTX2feH
         6DPkQSIShcN3a/2kYpsuBmc9aL4XtxErdwGM40uISaq2XDJYNzF00TLzw1aPePmFgIxi
         WIfTnY2vKp59PX2DapVgZDGMle29RvpLpEXrtKd5xGeGtKX068UbMem8FPQB8yPsTIN4
         kZrTdmQY/7cEkTheZE0M8rbztWHbq8RSv39dTF/YPJfzhEmJ/bSYUzd9ozU+i4cjWmxw
         Q3vS+pfu4q+zpFo4KAkJ2CcWIzdpJ7qKNNQR3sVzJFHwvY3VJRcFheqYjNE4Iga9jGc5
         7EtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z+AIbIK3eQTohbEi9mUjrpLQdvDbJl+5v84GWpefTnM=;
        fh=qmzqEAQx+lzPBQQcYKzr0dqYshJV6/mofkGIVhGcn8I=;
        b=TCDEO/7mSK2lCQDGBI6+wBIu87gSX3AzZlX8NVKVqg4UBCfQKvCOKqm5AQCGPkrst7
         ZBmxTdDPBpuAFbobbST5UUbbnBoXaR/O2biWNQ+y4sPrSMPJhPr1ZfHXYfL5nDXV8MFz
         XElYk0+QEVWi3EGXyloPvV/8+8sC38nwUMwcaZZRiC2Ps9Q1cJf+QwQUFfu0p0XNZ4iN
         54yTEgw60MA1olWncUsg9Tt67lQrNet4Lr3gXswUR8HRTKdM3S9L/3DkjeEtYzNregav
         5HLKe0ZtvTPLIudUNHytXC90pyVNV2sIHGpIwVAKpu0uIqXRN+QiUOPByDZSPUGls11+
         JurA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769097971; x=1769702771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+AIbIK3eQTohbEi9mUjrpLQdvDbJl+5v84GWpefTnM=;
        b=Bi7OMwADVfZA17I+/9oJyeMpKwNiAR0bPopJjm0pjY69UpyM89eEtvPA8BJGQkJJa0
         DJkpwjznYZuaARLz7BdgSlW4nnGzTL6xs+7SrD6QKzBI0Hx8sVYpgb7oue07ETRN/iYW
         tWKmCLsd/9If07X5ouPCrGBE0mbmefddfvBwRgNbPzjeYILFOBHiwhQNN5V3VWS2Pv/Y
         jAAJodRVTtEUuvKxeeoUEwHcDpw4bJSRimZ2lMD7g185DPZDEsoaAYIai67Vti9bUtUs
         nYIik7DN7xmpImotJUXwZRzMYrXqK4HYq0pniWlgevwzDnyL5pj3Iv9Dad0p990oCrRM
         9C+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097971; x=1769702771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+AIbIK3eQTohbEi9mUjrpLQdvDbJl+5v84GWpefTnM=;
        b=eO/BLqfSNZEOef00c6i1bQ70P13t7eo5iUjaDBkCfLB7w3+jjg7K3ppT7E5p9OyMpI
         J70yDKWP+qjj2ttxQl+5n1HFaLHMZolC/+Ay4jEFNCCBJ7WKsjftq1JicLykstxiQtnN
         dnuY1kCTsagnRZfPJEJ6RZW2QQwFQf2cE3lI/lKILIbGN8Z+O6xOfsxZJsi8aJ4cwz/Q
         Lm+rhZF1WyC+aXQ04cbnmkoYX7jOd9KiPRG/FWodZwFlzEusC1ytSIrxTmsEEAlb5Ypt
         i93O2Q0HaD8lzNGBzaoJxOykIr27OcVkaQPJgcqOscUEmyDqbUGyzYjoscCMR5ObjsE4
         DogQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq1OZw4Hfyti1Ci2y/Q3S1KnZMh54AmaqIsUydBTwnTPZ1NJmIp9HhRaiVBfVje3I0av80CUklJel5bSzUJOoT@lists.infradead.org
X-Gm-Message-State: AOJu0YyG+m3ZlHbeIjZYBN8cBFT+rpNMmJR+wzA6d7neXLYJqnqqP6DX
	AWeHuSVnFhPVfozFTttkH1oArra1Zotbk33xnpymDC5XyC03kidiIGyFfXGSS5WQHpjw67QVGKj
	8AL0+DgSejGIxwBM+uLKMjAkyQ2j/hJ9Og9egMurg
X-Gm-Gg: AZuq6aLECLTmkAWFBBXmkCeX2DL4LCOA8aaP8n1VVSR7j095nn01Z0Di7GeRvRa2YEt
	tOEXOVV/lYBbwhQs61FPoAFjYWRaN9bphk6hmNLQahTQHcl89Qbk2N/DoZgzd+Oj4MGoESyMgfu
	BTwKWvtcgpOnf+9MlhOJ4zAQ9/yRdrqt4dTc1BEjsv5Nbfvh7u/Azrejw7fz9x3QsfB68N1+5Fr
	LmWx1OtvCWEDyxZVFnmhOl+r+144GIUC2JHV7s2QZqUFW/e9bv0HBpCXNPvXwpisdhN+0wNJJm1
	V5Uo1oJBN9RMAIVCjW5zmGOObw==
X-Received: by 2002:a17:903:2b06:b0:29f:2563:7772 with SMTP id
 d9443c01a7336-2a7d417846bmr3095405ad.8.1769097970607; Thu, 22 Jan 2026
 08:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com> <20260122073127.375139-3-irogers@google.com>
 <CAO9wTFh01Qzn9tAiXf8_eGd7AAJiKzjmHNw-hBBCzcYR9Mb8xg@mail.gmail.com>
In-Reply-To: <CAO9wTFh01Qzn9tAiXf8_eGd7AAJiKzjmHNw-hBBCzcYR9Mb8xg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Jan 2026 08:05:58 -0800
X-Gm-Features: AZwV_QheLkTE1KRcO3TYQKQs82VaNUxHiDT9G3Jcm0FUvq93zpwYWIu1qRjGJAw
Message-ID: <CAP-5=fUg=Gna1=HyugczBijYE07SnFHOO9OPutYQa+s8QcXBmw@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] perf annotate: Fix args leak of map_symbol
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_080612_317759_52BA9138 
X-CRM114-Status: GOOD (  15.60  )
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

On Thu, Jan 22, 2026 at 3:47=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> > @@ -1119,7 +1121,7 @@ static int symbol__parse_objdump_line(struct symb=
ol *sym,
> >                                       struct annotate_args *args,
> >                                       char *parsed_line, int *line_nr, =
char **fileloc)
> >  {
> > -       struct map *map =3D args->ms.map;
> > +       struct map *map =3D args->ms->map;
> >         struct annotation *notes =3D symbol__annotation(sym);
> >         struct disasm_line *dl;
> >         char *tmp;
> > @@ -1151,7 +1153,7 @@ static int symbol__parse_objdump_line(struct symb=
ol *sym,
> >         args->line    =3D parsed_line;
> >         args->line_nr =3D *line_nr;
> >         args->fileloc =3D *fileloc;
> > -       args->ms.sym  =3D sym;
> > +       args->ms->sym  =3D sym;
> >
> >         dl =3D disasm_line__new(args);
> >         (*line_nr)++;
> > @@ -1172,7 +1174,7 @@ static int symbol__parse_objdump_line(struct symb=
ol *sym,
> >                         .ms =3D { .map =3D map, },
> >                 };
> >
> > -               if (!maps__find_ams(args->ms.maps, &target) &&
> > +               if (!maps__find_ams(args->ms->maps, &target) &&
> >                     target.ms.sym->start =3D=3D target.al_addr)
> >                         dl->ops.target.sym =3D target.ms.sym;
> >         }
>
> Hi, a noob here so please correct me if I'm wrong.
> Looking at symbol__parse_objdump_line(), shouldn't we be calling
> map__get() when initializing the target struct? Since maps__find_ams()
> now calls map__put() (after patch 1).
> struct addr_map_symbol target =3D {
>     .addr =3D dl->ops.target.addr,
>     .ms =3D { .map =3D map__get(map), },
> };
> This would match the pattern used in call__parse() and jump__parse()
> that were fixed in patch 2.

Agreed this is another problem. I'll add the missing put and
addr_map_symbol__exit missing here.

Thanks,
Ian

