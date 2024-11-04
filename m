Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB700D1CA01
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwdJ/tZnq5Q1ZNjaalXxz9pm9mHtJsnsrILgdEWNMTI=; b=hQyQE4O26Iyi29a5A209I68LG1
	Fl5UryVwRmcran8wBgS16QsB1TYC4iBgX/2yBS8bNQPNp3vZ6SwDNxkz8lcf6vtJonU2TfczsbkXI
	qSy2V/r29i+qpmgtvcK1XHMqQz7AmqPvXymhLkNilCgmcJuZWLGcNM/xGzTg1uBZrtcJUyiiEqtRd
	aIGCcIFOHCkTRoXxHBU3bVGJtV0EX4h/9jsbU4EDOuZuCnysKFgDCmepgyU4s27gFjVoHGHWp9YTS
	DL1qBdBl1XWWVrSfZZ37k5YjZFna9FLfSwBwZFKtFRJ9luEOeRqzBUA3g3+Hj6orRbsDnyuLqf3qc
	vZmeh9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t85CS-0000000FFtt-0npx;
	Mon, 04 Nov 2024 22:05:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t85Ai-0000000FFZc-4A0N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 22:03:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c87b0332cso27365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 14:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730757820; x=1731362620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwdJ/tZnq5Q1ZNjaalXxz9pm9mHtJsnsrILgdEWNMTI=;
        b=x64tpt009F04nas/6MK3THiBaAsJ/nv8fz9wd4/5xEPKHidnLOiaDxFxiAG6h0WDXJ
         7JMKIf3EbLRIQ+GPS9wH2r457YwAKQQuPXuhf4QDnnL+1m1AV8wK+tbydBJm3DzRkKCV
         UFuRNj6225A3nuoBI7kjlnz2ujqqRoD1lzpdIphdLBWRLXn6LowJ+Mkl+atiRzCuQhQ9
         I0zaiqSwNyMfa85TRqDSLdLzCeG0CwFP19c5gtCYereS0uUtjM5eHSq9sCnpEmlYUC0G
         k4prkYZ4Q+HpsvixsBG9zxUXrWYem771mk/+VR64xWfzovV/JmuCSHDQ7N4ZOyr38qv9
         mgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730757820; x=1731362620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwdJ/tZnq5Q1ZNjaalXxz9pm9mHtJsnsrILgdEWNMTI=;
        b=EMZcWcdxfd4nGvQ4fE8qjx1tL9Rf8C7PEXHFzLu+P0xhKJFZ++vtqNZHzIBv9AAlSs
         WcudymDckZEtx9gv+yNkefvaqhaW1H6/lOThgMVJui8EkK1sqmZ+8QIDLUzsDcXBzAwy
         +M1WeCi8Cdc7R814duREZ9FJjkT8VFJsoDkTDWeVT3qFrCvSMULBUEDkWIOB2Rflwd1B
         h7nzYSCFsHC/3eKBm5MvNsgH56yVCOjixajvZBCpI7mUuf0xBqG6NSnnSuv4JaBEO0Ym
         YtytPTlOsRJYzPLnOLzMwRgVfm3Y21gz0xl3cp7WcYTbIGSei3tu2NblO5Y4dOJkIslU
         Jb6g==
X-Forwarded-Encrypted: i=1; AJvYcCV4Vu7o56wmF0jCWgOFILD16JeZ8cxmjUktrL2jZqBCqldSfSLmB9Omi64vXmzMRU9PoiF04TTbjnBvukKQAEaT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw05UetOQs70wus+xt39llN37S3tXuFeVAJxcv51wOfrwxpLBVS
	qhDP3BgcFkZ59YEMww2ZsBdK5NOAsa1zCz5yXGCK51wXPUfOT0MTY0N72OuXC5HP/V/a7k4m4pH
	S0eJeyGklXLCUP7hKusKjoG2Tlaw1PjJQ+Rr2
X-Gm-Gg: ASbGnctAZ0Jnj129HOwiR5KFSPacBHdPyn5g4ZuYc0LFTIRpBt60Z3mf8JqraqXOCc3
	TewC7s/g5PO+xD57wI11wPyFfTAJPdLpKja3XRSW58QrxjGOCLdvxOmG7uLQ4hTI=
X-Google-Smtp-Source: AGHT+IEti60SDL7RHxI+cAhb1vGKCJSZIYIvkK03gIl3UEiSV24cOOJW04C/9MY0z0qdxUSpneeeMi3ERfOoxdjdYyo=
X-Received: by 2002:a17:902:c401:b0:206:b7b2:4876 with SMTP id
 d9443c01a7336-2115e2cb7c5mr1245345ad.20.1730757819913; Mon, 04 Nov 2024
 14:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com> <Zyk9hX8CB_2rbWsi@ghost>
In-Reply-To: <Zyk9hX8CB_2rbWsi@ghost>
From: Ian Rogers <irogers@google.com>
Date: Mon, 4 Nov 2024 14:03:28 -0800
Message-ID: <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
Subject: Re: [PATCH RFT 00/16] perf tools: Use generic syscall scripts for all archs
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, guoren <guoren@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_140341_060911_CA323EF6 
X-CRM114-Status: GOOD (  31.51  )
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

On Mon, Nov 4, 2024 at 1:32=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> On Mon, Nov 04, 2024 at 10:13:18PM +0100, Arnd Bergmann wrote:
> > On Mon, Nov 4, 2024, at 22:06, Charlie Jenkins wrote:
> > > Standardize the generation of syscall headers around syscall tables.
> > > Previously each architecture independently selected how syscall heade=
rs
> > > would be generated, or would not define a way and fallback onto
> > > libaudit. Convert all architectures to use a standard syscall header
> > > generation script and allow each architecture to override the syscall
> > > table to use if they do not use the generic table.
> > >
> > > As a result of these changes, no architecture will require libaudit, =
and
> > > so the fallback case of using libaudit is removed by this series.
> > >
> > > Testing:
> > >
> > > I have tested that the syscall mappings of id to name generation work=
s
> > > as expected for every architecture, but I have only validated that pe=
rf
> > > trace compiles and runs as expected on riscv, arm64, and x86_64.
> > >
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >
> > Thanks for doing this, I had plans to do this myself, but hadn't
> > completed that bit so far. I'm travelling at the moment, so I'm
> > not sure I have time to look at it in enough detail this week.
> >
> > One problem I ran into doing this previously was the incompatible
> > format of the tables for x86 and s390, which have conflicting
> > interpretations of what the '-' character means. It's possible
> > that this is only really relevant for the in-kernel table,
> > not the version in tools.
> >
>
> I don't think that is an issue for this usecase because the only
> information that is taken from the syscall table is the number and the
> name of the syscall. '-' doesn't appear in either of these columns!

This is cool stuff. An area that may not be immediately apparent for
improvement is that the x86-64 build only has access to the 64-bit
syscall table. Perhaps all the syscall tables should always be built
and then at runtime the architecture of the perf.data file, etc. used
to choose the appropriate one. The cleanup to add an ELF host #define
could help with this:
https://lore.kernel.org/linux-perf-users/20241017002520.59124-1-irogers@goo=
gle.com/

Ultimately I'd like to see less arch code as it inherently makes cross
platform worker harder. That doesn't impact this work which I'm happy
to review.

Thanks,
Ian

