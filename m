Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34870C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAZ5WY/+AZg82voxgpoZA7Yb7kIn6Uh4GFZ7o1KdBUg=; b=EyhkRFE33VbwPlgKbim2sJOWY1
	7a9ipr4e68GOcIteCeZ2mcVIZSktuwyDyc+2TXhzfM7K/MWzgEHTnRISJLFYi71RNpOWiDqkkeX3P
	uys/pUAWtQ3vSgSjDwaxkL0lRk2/+ijaUr0bb90lEahicRoPQA1/WCvj17PAZF4whH1VOO0BsDf3h
	vjBYCGnerk/uPjlYQyZZ3UCvSeqWjF6sEPMo73rjkzv5qfc1ojwzYBBZLqpSpy0d2tqaqgD5VL+86
	Bk0wqdLt0Yr6wpxPVLjZpJwCAuBsrB8uNCOU2qRV3MULCRjQdsA5vWTiuC/KOOVaHZ7WvS1jKT1hL
	uZU5SqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1SQ-000000068I9-0yCc;
	Tue, 11 Mar 2025 15:23:50 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1Ph-000000067Fs-1VJ8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:21:02 +0000
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0155af484so768409985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 08:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706458; x=1742311258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAZ5WY/+AZg82voxgpoZA7Yb7kIn6Uh4GFZ7o1KdBUg=;
        b=ipFO4DXTimHEyJJVjlcrkY+mxxdZIXFYWNynQV7IDB5JNLExaIb1G7Y6bX6HUca7/E
         er7vBEncOPJXUiuHH1zJDMKjJqyEqwJWgQIqbDDfO7iNorbK37e1qHQoEKvJhwICt9qk
         nWNJnPB1pDDh1I/VEvtluXHEClMSWyAk12p6jbXsS0NDaPTW4T6Z8Fjudyuo4E+HV3e/
         T2kT3bEvLVN6hApfnGpRbgT3S7S2ZhNS2KpnlSN53urr3OV+J4D6jzt3RVY9FmH+ocBz
         tYfX5h0zVgkBh/5nE6Va/B80xrrmry3S7WRqiyp4wOChnOmU3V6FudjsJIQ2GlymNoAQ
         VsUw==
X-Forwarded-Encrypted: i=1; AJvYcCXESwyHiNGmKeC5v3inhFSP2jpqs39QOVCidVmyPRgsm2Wd01fMp/vTCZABZAaRETsQmtNwKjtlGkL8MTIPLZPv@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqwq3llKMWoSSBYlAd5TQfC/yhV1O5nRkyJdRc1OTs0xcvgEWy
	KoCQ50EVqFD5qWBUAEseUvPLfC1FpM9wPYUyEHjRniCzyKpIGw3b5W9YbU76
X-Gm-Gg: ASbGnctWIuHKyTgvrPKCPf9g1tYmcPtOftPeaEGWwb0hqhaj8D7ZxFBczl0E4qgNG9Y
	os7pdOdSjMmftndzS0uc05oltBrIXnaakG5YqNebGIib6l1ASeutF4AtUGisD7yYeOmcHtxkC7z
	2xMeQ7dE8zgQKz5hTioOAqc74fLRiWyoQo2tv04RUA8miXyn6xCns+V0ZTz1T5tejYNpz7T6fHF
	HKLReXllQAJLErvZY01NSkVsPFX2qrooEq+ikpOiE0MOrlL9o/4GMFTm3m4x22BNuvpiwY3XwO9
	bc9uZU1eHK/ZG3CEUTbe+93lKxSzj6glDirB+PQ2crjYvBqN6gy4ADhwuQ5HJ9Nx8CvelmQ3UGl
	74otiMFJ0xQ0=
X-Google-Smtp-Source: AGHT+IHsQu38iH82r+HMHyrkzx4qIhzveP8EacYIWqIqt+MwFn3P+NQ8UWZirVBIv/85lWHEuZsLXw==
X-Received: by 2002:a05:620a:2625:b0:7c5:6291:904d with SMTP id af79cd13be357-7c562919180mr306986585a.38.1741706457596;
        Tue, 11 Mar 2025 08:20:57 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c551510132sm376486285a.0.2025.03.11.08.20.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 08:20:56 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c081915cf3so744962185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 08:20:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZmdqf0x674eAsJ0C23RQ2f5O7UqR5Xfv3HY8SgsKN2mJvnin3/OtAIQYaEyGjMnEH0E0cNcnWPnWe3MWMXbGM@lists.infradead.org
X-Received: by 2002:a05:620a:2581:b0:7c0:c046:7c6b with SMTP id
 af79cd13be357-7c4e61ed9cfmr2913292885a.53.1741706456479; Tue, 11 Mar 2025
 08:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <c499234d559a0d95ad9472883e46077311051cd8.1741612208.git.geert+renesas@glider.be>
 <CA+V-a8tGuxgan7Zx0YedSByfFSgrg5gmR6Fy3dMDXwU+TscZzg@mail.gmail.com>
In-Reply-To: <CA+V-a8tGuxgan7Zx0YedSByfFSgrg5gmR6Fy3dMDXwU+TscZzg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Mar 2025 16:20:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXcRoqKz6S0sAtBpSM+_ghTs82wsN1dHvbHD5vO8W+7A@mail.gmail.com>
X-Gm-Features: AQ5f1JpeSxFRSkFxS6bR3-g2Fuibv6APqy0-HXmtfiaxTjbbrF2D0dsaDVIBB70
Message-ID: <CAMuHMdWXcRoqKz6S0sAtBpSM+_ghTs82wsN1dHvbHD5vO8W+7A@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: smp: Enforce shmobile_smp_* alignment
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Pitre <nico@fluxnic.net>, Simon Horman <horms+renesas@verge.net.au>, 
	Kees Cook <kees@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_082101_396327_930AA601 
X-CRM114-Status: GOOD (  25.72  )
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

Hi Prabhakar,

On Tue, 11 Mar 2025 at 16:11, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Mar 10, 2025 at 1:14=E2=80=AFPM Geert Uytterhoeven
> > When the addresses of the shmobile_smp_mpidr, shmobile_smp_fn, and
> > shmobile_smp_arg variables are not multiples of 4 bytes, secondary CPU
> > bring-up fails:
> >
> >     smp: Bringing up secondary CPUs ...
> >     CPU1: failed to come online
> >     CPU2: failed to come online
> >     CPU3: failed to come online
> >     smp: Brought up 1 node, 1 CPU
> >
> > Fix this by adding the missing alignment directive.
> >
> > Fixes: 4e960f52fce16a3b ("ARM: shmobile: Move shmobile_smp_{mpidr, fn, =
arg}[] from .text to .bss")
>
> I wonder if this fixes tag should go back a bit far as I was able to
> reproduce this on 5.10-cip BSP kernel on RZ/G1E this was only seen
> when CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE was enabled,

4e960f52fce16a3b is in v4.5, so it covers 5.10-cip.

> RZ/G1E failure logs:
> --------------------------
> [    0.006719] smp: Bringing up secondary CPUs ...
> [    1.040749] CPU1: failed to come online

> c154d5fd B shmobile_smp_mpidr
> c154d61d B shmobile_smp_fn
> c154d63d B shmobile_smp_arg

Bang!

> > Closes: https://lore.kernel.org/r/CAMuHMdU=3DQR-JLgEHKWpsr6SbaZRc-Hz9r9=
1JfpP8c3n2G-OjqA@mail.gmail.com
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > To be queued in renesas-fixes-for-v6.14.
> > ---
> >  arch/arm/mach-shmobile/headsmp.S | 1 +
> >  1 file changed, 1 insertion(+)
> >
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

