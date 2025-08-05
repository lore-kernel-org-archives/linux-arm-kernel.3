Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139F7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 22:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFwxA7VPMgX8JFoPPlt7yWjXlEeDLZQuyMF8h0TO11M=; b=hv+gVqDew4eEymImXl2lw7B8Fu
	DpHKQjtO54hqEXIX3qLRHr/1xbOOjI+yN4SSI/cI8dg5ld6i+huwB8EXWp3bxr/65yOTsEX0ewtcq
	1AdHKHUtrYCGCblcpZ3WWMipzYzFQxsN5rZgzj42iiYghwsmt7V12qRdbEr0EcbTvewCy9s3LBM4T
	IT1hRhqwSDOwHZgVknUcDk/FekS61ut4WHHMcaGj25YhxYk2t3s2s7PA3mU8AUhxRr9Bl/T4J5kgt
	PQZwAyuLWrzr6RjhS2JLCSJ++HsFSuQc90O7pcyZiQfDrknslL+wYVc+BxQsCIrUqGyeOGb0GXfdb
	w0grTY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujQZh-0000000Dwe3-32RK;
	Tue, 05 Aug 2025 22:56:05 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujQX6-0000000DwSK-0n2k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 22:53:25 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-71b6703ba32so51862527b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 15:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754434403; x=1755039203; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFwxA7VPMgX8JFoPPlt7yWjXlEeDLZQuyMF8h0TO11M=;
        b=e+/iJdG+eWoS5pLsTxbF0mr3o+OM4ocTJqwL1I7VQov4RrC/Uvc1T7B//LlXWOyYf6
         jGx2qlMvnCTEp/z4UlaSW/Wdly8CHzP2u1R1fJbDVb3qCBxsvd2gxWcnvKYwtP/r+fHl
         M1nU9l+Lem6GjsIJBe5rrXdp0MZRsYV6x20a0opFiWYhfJ2TF3hwtijevTkgHCGoN79w
         CyCQSWmf2R/0m/3uYA9Ii5BlaryWx8/mJvjH7gmK7FplpoIqs+lpUBmdb4YWlpxL3nPZ
         nMpNE+gr1kSF0UoZmM50u4ic3vp+zvaioB3+1+k4sgC89m8p2x08VUrby/K6KvWwWEj0
         aecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754434403; x=1755039203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFwxA7VPMgX8JFoPPlt7yWjXlEeDLZQuyMF8h0TO11M=;
        b=Yg6JgpOLeaTzFXaFPHng4BTNk7VEB5S12auU+0mVaNFNXKY42jHECOfpe7br7gRL0m
         WMnYa45QFZ2CD8UL14hdTlLGRNGJ1qC933BTcuV3o9pVqjUrbDva2rUAR37OHVweIoft
         vEUBpiw2yYifR/yvlWNrXDR1CtqsneidDtj47TfoPhy/4Twx5XTWTc1s2eI7LLW0RbFa
         3ZWavRQ2qGbR6U65xWRhj95EUmi72BYVEgIdULREq+uMnJcU+bmfcRezvvtnikuY6Dk7
         f/nPZ8r73LQ5RM+LOzd3rROS0dHaVNgHX5mZWPN8clJMiBwc6JlLTFjK+PYDst0fedJY
         ijsw==
X-Forwarded-Encrypted: i=1; AJvYcCUshpcrQOfAShk5J1TCtxkuBs4NszBRfuNZP/KX4me41IUcAqEm3L8k9LgcU6srliSiqauHe1RUbNcmtxJMmBeK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8XTzXkd7V6grJzuB6SjBSrkGEBkDsC5fK0R2x6yZbm7BabbR0
	1b8tGmfL3wVmOIE0692ozi6163aFEQt/8amDPxAS/zucTJX91El/2oJTMUih9pOGje0sVf7Xwkw
	Rkb2M3cvov/4mwr2JXkHRuL0GZcwCc6LZCbQC7jRHeg==
X-Gm-Gg: ASbGncvLAgmA14idkMSdhp/aXi+mhqhWgW72AXBLoEnIEEHGwPq5PmskEJlKO6TI3QG
	vg/GT1FLpgCljGPavcasbyf0kecnCB0FdI6QA8uh/FH1JTCJZeVkHxfyfQcmyOViPMD9gxuRPUE
	Q28Kp5AeAf9bLbNVnDa9GHjQtVK0q8OsEHht4jmPFKXeS+wMI2WJAmPSV/cm1yEYiHa97JBNd1M
	YkfGA==
X-Google-Smtp-Source: AGHT+IFPQD46MAxnRPc4XD80G1FRckOzbsES2lh1jn0CLQnQJq0WjxlFx9sY5Jok9vm71L88exnNcyi2+UjLvaHGm4k=
X-Received: by 2002:a05:690c:3349:b0:71a:2961:e2c8 with SMTP id
 00721157ae682-71bc97b1c7amr12964657b3.10.1754434403162; Tue, 05 Aug 2025
 15:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-3-sw617.shin@samsung.com>
 <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
 <000a01dc05c0$9f0ab110$dd201330$@samsung.com> <18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
 <CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com> <008501dc05da$36362600$a2a27200$@samsung.com>
In-Reply-To: <008501dc05da$36362600$a2a27200$@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 5 Aug 2025 17:53:12 -0500
X-Gm-Features: Ac12FXygs7x0aZJlJlnwWjTdQedCFmhrYOQr3itTJ2SIN3Q4cTe-cGU5fCA1CyY
Message-ID: <CAPLW+4mNejXUMW0VqZW8hieNUFmDqS_-qqE=p+bV4TnwM_TWgw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: sw617.shin@samsung.com
Cc: Guenter Roeck <linux@roeck-us.net>, krzk@kernel.org, alim.akhtar@samsung.com, 
	wim@linux-watchdog.org, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_155324_241627_23DF6B1E 
X-CRM114-Status: GOOD (  19.63  )
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

On Tue, Aug 5, 2025 at 2:26=E2=80=AFAM <sw617.shin@samsung.com> wrote:
>
> On Tuesday, August 5, 2025 at 2:03 PM Sam Protsenko <semen.protsenko@lina=
ro.org> wrote:
>
> >
> > > > +       u64 t_max =3D n_max / freq;
> > > >
> > >
> > > Make sure this compiles on 32-bit builds.
> > >
> >
> > Can you please elaborate what might be the possible problem -- just
> > curious? I admit I never though about 32-bit case when writing that cod=
e,
> > but don't see any immediate issues with that too.
> >
>
> In my opinion, it seems that Gunter Reck's explanation is correct.
> I've found out that the error of "undefined reference to '__aeabi_uldivmo=
d'" may occur when compiling new code on a 32-bit architecture.

Indeed. I was able to reproduce that behavior when building for ARM32 too.

> If you don't mind, I would like to proceed with maintaining the previous =
revision below.
> From my perspective, this approach appears to be the most reasonable solu=
tion for supporting both 32-bit and 64-bit architectures.
>
> @@ -411,8 +411,8 @@ static inline unsigned int s3c2410wdt_max_timeout(str=
uct s3c2410_wdt *wdt)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>
> -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX=
 + 1)
> -                                      / S3C2410_WTCON_MAXDIV);
> +       return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
> +               (S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
>  }
>

I don't mind, although it's quite easy to fix the code I suggested by
replacing this line:

    u64 t_max =3D n_max / freq;

with this one:

    u64 t_max =3D div64_ul(n_max, freq);

from <math64.h>, as Guenter suggested. But I'm totally fine with your
implementation as well.

