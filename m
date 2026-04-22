Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37B4F94CDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xnVaF+973Zb7xN4UvEz+8ZuM5TVrO0nSR9bASc5gWw=; b=DJNYTTppcl6ZwFWqXnXmFVWGVy
	3Kcpbki0tjIPq8kPaPBrD//TlOCDfXhn2ZwOOVX1oAr19cNai5wJ0Ua2ftx8dWT2e27vhJojlejHT
	uCvgJ0wznKB+Dq/vA/qKHIoNppYQDQv988NNhRrjd6rCHREGrCqc20aMjyCFq4LOL64pIpoZfpWWI
	L2gTuVUOsCjQw/1xYHupczdKxBcTTWZBZxM1liEkTJGCYXiTeN6GGMnRo67GBdc0tYJiyiYeHVi9R
	Ny4nzqlcZTnyE/u8tKEL8obrqoncD4pxTSg4RKmgEzEp9QA9M0IHRdHLp9zXIrsf+0l5iChzO/o8h
	n4e+Uo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFSbz-00000009kwi-0WJQ;
	Wed, 22 Apr 2026 08:07:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFSbw-00000009kw4-0toN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 08:07:05 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b9d9971d059so758807666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 01:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776845221; x=1777450021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xnVaF+973Zb7xN4UvEz+8ZuM5TVrO0nSR9bASc5gWw=;
        b=MKdRvEdfshgF+9y7Ug/XXH2l0podCeVyOaj7ly0L3f1rmqLlOkXBCotKQcq4AChuZj
         FzEnB6Clz0UtARTRfGLM3UlxzaDlq+rQXW+LnEwz5H/PVYYcRxhS+sUf9M/9GiYHLA+i
         L1XFKSD+2I1b4FOQSqBrYqkTw+e+ADO/zWId8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845221; x=1777450021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+xnVaF+973Zb7xN4UvEz+8ZuM5TVrO0nSR9bASc5gWw=;
        b=q4VqEdTqXCQFFQ/J9zR8CXZlbeCnwvXwLwDaJBDx1xkWDqyjggZOPHUr9AWq8BIwin
         JEJ0mvbGbbwn6zWhMvuC30Gz873GvB3O/rNZFmoxfSZ6sBUe0GDK8lgq7DbqXeyz7A+l
         uZVwcPmVdc5GstJIhc2UnmTPov3ikTe37rsBObbVl+xxRpKEZiA3nzOIPedLErEDQr78
         ryt72TaV8lZFrDMWB9vWCkzEtEPoCUeRF0+dBNM8S3W+U/9T/BAKAo7UmjOoBW2KUYnJ
         5XU2NZlFMko72hZOaota5sTxg8axqwszK1JeQaB3kC2li+aWWblCsRVTHLYVsKBVh2O5
         KKQw==
X-Gm-Message-State: AOJu0YzRKtCnMu2QriaSdfZV1eMpK0F/iChiN/Hd+0ubQtXod8qB0FwF
	azRrscsME3HEmevCYe2yxMtj6k2V+rb/dISdZU9YIx7Ei1YoOIbTrBpxUg8+SwgF/vJCsjbgPBN
	1dOccMw==
X-Gm-Gg: AeBDievepII4Bx2LMk+9CGHKb0xWgwnNIEZnpc4Gssl3AHnnXiAQzJKkT2tplhUAQX2
	BKj1bTOa1Pf+sy5n82pvpnRKMev8mEwLfrPUM+OKZjgMO9YdCQOX+XsYf0frknmRJ/MtJ60Lo/b
	2UzJA5veaoQF5mDidaXye7IT3qguawkVWlFBzi4utDeFYlmFX6QL55DO3APG13RdU5LaAHzF/bX
	QLa9BvHzPD2ldXRAaAw+CR6fLyiLdR5JCgxSXs476lyphQo1b3fADO7UEOeERgErjx7mmr5Xetr
	BxT2QsgnVvtMsQED58/Q4aKu5lb5VeyGbgZ+Dh2fhEDWRqjx37Tq1F0bNDtmC8PWRdTXHRzqiNG
	CxJCFQjSXrddpoxrL6scHwHjhANGI0RMRigRFyZHlnGgbmD9vibc+bwoYM/S9X3UgBcHbCFx5Eb
	sre+jb8E/kAzoH+3086mOX2H4J0D6NUxCfbK4CrPAPhRNYS7wGRFjrrFruGCyolu/mdYoI1jk=
X-Received: by 2002:a17:906:fe4d:b0:b9b:5164:905c with SMTP id a640c23a62f3a-ba4188857d3mr1076776266b.14.1776845221344;
        Wed, 22 Apr 2026 01:07:01 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bbb1sm510203566b.38.2026.04.22.01.07.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 01:07:01 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba36357195bso604807666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 01:07:00 -0700 (PDT)
X-Received: by 2002:a17:906:4fc5:b0:b9b:ddb2:b1c1 with SMTP id
 a640c23a62f3a-ba418f7f625mr936456766b.21.1776845219289; Wed, 22 Apr 2026
 01:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <CANiDSCsOy0P1if-gJZqOM5pTJ0RDcwVfru1B7KFbTOEMqjPKJw@mail.gmail.com>
 <20260422071541-9a295128-d913-418f-a21c-1386fca30290@linutronix.de>
 <CANiDSCviww1L1p2+MvF59Biqb6hc7WdL1J37kBjFd1NXz-Yt8A@mail.gmail.com> <20260422092713-4021a1a5-3a54-4260-878a-aec1bef3f8c7@linutronix.de>
In-Reply-To: <20260422092713-4021a1a5-3a54-4260-878a-aec1bef3f8c7@linutronix.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Apr 2026 16:06:45 +0800
X-Gmail-Original-Message-ID: <CANiDSCtfiPDiqzhjZGoCJbLC0fRoH1HLKrvYUt7jLDYEBQHqgg@mail.gmail.com>
X-Gm-Features: AQROBzA7vfrwO2plpLpwVGaJQHR2MKiQUcm7cyVmWYAcKsQQIyoUjhDJYfCBMLg
Message-ID: <CANiDSCtfiPDiqzhjZGoCJbLC0fRoH1HLKrvYUt7jLDYEBQHqgg@mail.gmail.com>
Subject: Re: New warning in linus/master
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_010704_465881_4FF1661D 
X-CRM114-Status: GOOD (  33.85  )
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

Hi Thomas

On Wed, 22 Apr 2026 at 15:32, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Wed, Apr 22, 2026 at 03:00:11PM +0800, Ricardo Ribalda wrote:
> > On Wed, 22 Apr 2026 at 13:57, Thomas Wei=C3=9Fschuh
> > <thomas.weissschuh@linutronix.de> wrote:
> > > On Wed, Apr 22, 2026 at 11:51:45AM +0800, Ricardo Ribalda wrote:
> > > > Media-CI has found a couple of new warnings in the latest kernel
> > > > version for aarch64 and powerpc. They get fixed with this patch and
> > > > before moving I wanted to know if this was under your radar.
> > >
> > > Thanks for the report. I was not aware of these so far.
> > >
> > > > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vd=
so/Makefile
> > > > index 7dec05dd33b7..65914842fae0 100644
> > > > --- a/arch/arm64/kernel/vdso/Makefile
> > > > +++ b/arch/arm64/kernel/vdso/Makefile
> > > > @@ -50,7 +50,7 @@ CFLAGS_vgettimeofday.o =3D $(CC_FLAGS_ADD_VDSO)
> > > >  CFLAGS_vgetrandom.o =3D $(CC_FLAGS_ADD_VDSO)
> > > >
> > > >  ifneq ($(c-gettimeofday-y),)
> > > > -  CFLAGS_vgettimeofday.o +=3D -include $(c-gettimeofday-y)
> > > > +  CFLAGS_vgettimeofday.o +=3D -include $(c-gettimeofday-y)
> > > > -Wno-maybe-uninitialized
> > > >  endif
> > >
> > > (...)
> > >
> > > I'd like to know exactly what is going on before suppressing the warn=
ing.
> > > It is a non-standard warning, only enabled by *some* of the vDSO buil=
ds
> > > for some reason.
> > >
> > > > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/pipeline=
s/1649144/test_report?job_name=3Dcross-gcc
> > >
> > > While I was able to download a configuration from this job and also u=
se the
> > > same container image, I can not reproduce the issue. Is the configura=
tion the
> > > full one or only the template?
> > >
> > > Could you provide full reproduction steps?
> >
> > You can try repro with:
> >
> > work/linux $ podman run -v .:/workdir/ --rm -it
> > registry.freedesktop.org/linux-media/media-ci/build:latest
> > $ cd /workdir
> > $ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make allyesconfig
> > $ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make
> > arch/arm64/kernel/vdso/vgettimeofday.o
> >
> > The gcc version discrepancy is because I the error was due to old gcc
> > version and I was playing around with that... but it fails in both
> > gcc14 and gcc15
>
> Ack.
>
> > You can try with debian testing with
> > work/linux$ podman run -v .:/workdir/ --rm -it debian:testing
> > $ apt-get update
> > $ apt-get install gcc-aarch64-linux-gnu build-essential flex bison libs=
sl-dev bc
> > $ cd /workdir
> > $ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make allyesconfig
> > $ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make
> > arch/arm64/kernel/vdso/vgettimeofday.o
>
> Both reproducers do *not* reproduce the issue for me.
> (It is more or less exactly what I tried before)


Ok, I think I found what is going on. media-ci was forcing
KCFLAGS=3D-Wmaybe-uninitialized

https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/test-build.=
sh?ref_type=3Dheads#L29

And something has changed in the kernel in the last version that
triggers a (hopefully) false positive.

can you try with:

CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make
KCFLAGS=3D-Wmaybe-uninitialized  allyesconfig
CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make
KCFLAGS=3D-Wmaybe-uninitialized  prepare

?


>
> Please note that this line does not work in general:
> $ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make arch/arm64/kernel/=
vdso/vgettimeofday.o
>
> The vDSO object files can not be built in this way like regular kernel ob=
ject
> files and will produce a compiler error, but not the one under discussion=
.
> Instead the vDSO on arm64 is built during the 'make prepare' phase.
> (Other architectures work differently, of course...)
>
> (...)
>
>
> Thomas



--=20
Ricardo Ribalda

