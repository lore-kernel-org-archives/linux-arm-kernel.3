Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED00FC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 05:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBrAJ33Lv27IH622MIOkF0t5tIX46ic8QrDeWtn4wec=; b=3jSIDnOaOzdp0JgIhB6yZ+DbMF
	I84A1jj1AMDmWk11JrZD4Q0sMhdLRzLfMnCDWzOt/GxlpSO5D7Fg2rQs0eEJv9zo2cP5NVOLuP27v
	X23df8H3snmQ2euaEIoVu/v1To9/DAL64095f6xPQheIYXHvgkzRKTJP3CCqh6THOEwX3uW7bwes7
	1U7YGNq0DoTiy9Vo0upo0HAr18j5V7JA6yH97aLxyF0XqUI2+vfNUch3M6/lWyqfJ3axAC9bQFsXL
	N0Z9CHtV/5XTzckbPMbEjaMkSsspKLZ/+JWodhzSnocOhW2an+5/cvubUJGfnbCzXpb6Zg8Hwyrvc
	PIRI7cWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfXXr-00000002JhE-1u97;
	Wed, 05 Feb 2025 05:01:51 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfXWU-00000002JRk-1qPx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 05:00:27 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a814c54742so271595ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 21:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738731625; x=1739336425; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBrAJ33Lv27IH622MIOkF0t5tIX46ic8QrDeWtn4wec=;
        b=tCc8VVcfuwIS707N5aS+3EiwoXDzEsXiOY7xuv6Wrn3/exl9D0dpCkQXbK7yLylZ+s
         Xnh3rvaFq9asOZH5F8hrmNOOfNvH/z4PQHFL8uhkatoNcBuSc9W1Kv4UWpr2YcZ4j7i2
         A+os1XoN/0rrgLsRwsfZTHqYAJvPsFJ9HB6JkxMrbRDMEX9K8x19/k5XWU2TKGVvihmD
         kQ4XNFumDIhe1z/f6qsa0fb+AWIX6ECA6qJjIPp+BnPhLyb2U+RWzNqkjokmG8d70O0x
         tgR5ywjCAznN2c1w62UXopJVsT14seBQUtw59m9dhKWMB1I0zhfqDTdcrKgnumkpoLeU
         mfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738731625; x=1739336425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBrAJ33Lv27IH622MIOkF0t5tIX46ic8QrDeWtn4wec=;
        b=ZIt4xNpqH17Z8fBLBhuk7LytHR7lBDM3+eBgOGZm1hhfKsZCQ24kMDJOOQ7QSMK250
         9dYwkcsjpAu60lAxgK1AA7cYTe49kxVNMc4x+nB48YkEgv8+bgloMwHkl2iECJvJipXS
         tCeQzy/LiOxiY9tnUq6b1mhqvjYrYREGPUulRI+1PEiIWkoZtBTtkjgAOBYyGx8CYH63
         hGSvO//CrnemFuulzsoboFBOiTO9ZW68L/By7Zf91YAZOmxyYR1WpeTtD++o+Ua29c/U
         lUOM7aSDD7vxt47rKt8xA0HWY7oLbSis8j5jB00p16+/WlFyYtf028IQ7m+4ZwnaaeT3
         EhWA==
X-Forwarded-Encrypted: i=1; AJvYcCXDlDYdgWDCgA18F0gAz5lIAFRZEhafYQlUTy2RRkqNWSdi+qtO0XTjUCkvOlT7CqvWNH7HibL+2BgqjEg6/vM4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5I3GIeg/YXTZtCJw8TwtcdJSXjEjcW7akQZjTyZxSrpaNP9B9
	FQu+Gp8aE+ndvXuT3kTEgxNaBB92WA5i1AU4mMiZviupi3O7qGXg4dzZhAQbt5T80TzA4/BipLM
	kc/XOh2N8jT/6rKrQLPEWBm+KCl8DwqeHjF/L
X-Gm-Gg: ASbGncsKJqEHoEkg5sXr//ktDm1GNoUj3BNMFUk5MgeSd4ve/3wfiPmD3xQK1G69Lpe
	h7G0PvqlKVGAc/Ov+gyd7WABU/Y1fnxsx9hDQlRm3bDbFArW02WGYIiFXSzws80M8R7qBRzDFng
	==
X-Google-Smtp-Source: AGHT+IE5v6UIxUtbhZWXvQ6xeQiRfsd1Lh1y3K7nKT+DdV2MV+Ch6CX6fJX9kXWxtmkarMn0roBxr/1rIM2Ik8IIu/M=
X-Received: by 2002:a05:6e02:1f0f:b0:3cf:c98a:ceba with SMTP id
 e9e14a558f8ab-3d03fc6611dmr7494995ab.22.1738731625326; Tue, 04 Feb 2025
 21:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <20250201071455.718247-3-irogers@google.com>
 <CAH0uvogeG9rUw+1huquE=8fEq8AdJaSygS94G8a05=cHckjndg@mail.gmail.com>
In-Reply-To: <CAH0uvogeG9rUw+1huquE=8fEq8AdJaSygS94G8a05=cHckjndg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 21:00:14 -0800
X-Gm-Features: AWEUYZlxJYAftveNvjFByQ6RA0wq7gWZe-nwQuI2bmCaSivCz6TrVnDN2aRhlBs
Message-ID: <CAP-5=fX1bePwr5QGZQAMxWv1zvBY3dxOhbMd0H5UYQDXMrSKMQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] perf trace: Reorganize syscalls
To: Howard Chu <howardchu95@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_210026_471021_DDC8FE82 
X-CRM114-Status: GOOD (  16.98  )
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

On Tue, Feb 4, 2025 at 4:12=E2=80=AFPM Howard Chu <howardchu95@gmail.com> w=
rote:
>
> Hello Ian,
>
> Thanks for doing this.
>
> On Fri, Jan 31, 2025 at 11:15=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
[snip]
> > @@ -2104,11 +2123,12 @@ static int trace__read_syscall_info(struct trac=
e *trace, int id)
> >          */
> >         if (IS_ERR(sc->tp_format)) {
> >                 sc->nonexistent =3D true;
> > -               return PTR_ERR(sc->tp_format);
> > +               err =3D PTR_ERR(sc->tp_format);
> > +               sc->tp_format =3D NULL;
> > +               return err;
> >         }
> >
> > -       if (syscall__alloc_arg_fmts(sc, IS_ERR(sc->tp_format) ?
> > -                                       RAW_SYSCALL_ARGS_NUM : sc->tp_f=
ormat->format.nr_fields))
> > +       if (syscall__alloc_arg_fmts(sc, sc->tp_format->format.nr_fields=
))
>
> Makes sense because IS_ERR(sc->tp_format) is checked a few lines
> above. However, nr_fields can be 7 with the __syscall_nr prefix. I
> sent a patch to fix this, but it's not included here... Never mind,
> it's off-topic. This patch looks good.

:-) So is this a reviewed-by? What about the other patches?

Thanks,
Ian

