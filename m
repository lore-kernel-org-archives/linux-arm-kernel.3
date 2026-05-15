Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B40CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egE2NTKgLKIitli4MrCbLK+ZNkKRWg13iBLZzoYlN3s=; b=36Zs+uDbmJtuRjNO5X3rDDOR+S
	9oCRNtoi7InTvGFIC7wotUwxPTDqAMKHCGY53fEWlaka1TspYu6i+U4VRfw2qiQR1gXOuxUqpsUt0
	OpFLUwBjCbQGuGVO17Jtn0i3A6fiQofCYU2can3isRhmniN+QevyVL8LpOg9AnkEu+VH7l+CqBcUm
	PHRjyuHA8yrFcwtl/DwJfsC0JdoUXxOPZBQLtOHMnOwm3E2ghHZKlu+vod6VG4PHe/yWi7CNoR5V9
	xp4jZ9Im953EpQgPNXscGTuzfGEIVaqy4V/XI5B2URT+bbc2RfHXtOhDIYeCiRgLOPHK6gwUJF/N5
	Bas4zDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzAQ-00000009NFz-0VmO;
	Fri, 15 May 2026 20:29:54 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzAN-00000009NEv-0G9J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:29:52 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-651b61116caso50944d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 13:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778876989; cv=none;
        d=google.com; s=arc-20240605;
        b=LeCKNogmlSTJnHBRcQ3qsoV8H+a0xBR2yIDUCr/bEfZBUzRvieQjVgSMz6va0aafFL
         Du0WxSRzvRgIJDQvoS+okEXB7OmwRKXuhAXQPPdPIR+vCOIlEaA5/fg2rFn2xEy/oYoj
         zN/84Y8OiZVxYZTJ8FxZ9gl3+pNatHN3ufFltlBEYsHFLGJN9U3WJTXZu2YgSxbinSAB
         Dj6oYaY69d+aAVJmOzY6oTtSdbFDJleRvw5JYE02XCvjRrRxU+JZ5Lwh8UdlnaM2HPXR
         Zi6SIAts+IDdIGAzCD/fJZYQEKY/W0lNeechANEfPq8Xwb3Iw3lZoEpZ2KvfBWe+D7dE
         pyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egE2NTKgLKIitli4MrCbLK+ZNkKRWg13iBLZzoYlN3s=;
        fh=LIJvCvZ6rcFiRvVk691dreO+JUydTZk58LXTwkJKFig=;
        b=LljeAfJ4wwHzigztbwT3qEPpXTxMopSx92dUuHsdL7ocK6iCkmht6pWZygNdjFVoKc
         bO+NeZb/mlaGmjloiCgzFd5VxxqtrNnCNJN69T54uTkx8dUbPWifbg1qRwjKAQYy+cTR
         2p7QZAqopIFC+kUECd/vax8o8jKv+EXNnE4ML1Py9TP8zl2txl3o6H3O281pewCFaARn
         QObXz0raFoSzivTqLPeOceoUDlIYWjpDDWWSVnC/2R2VSrx/OhQUfBhKPv7WyZ3l3bS6
         tYv/GLrvh8oh6jYbnlYKLhp4ouftc6iDudgC0SkGGHY4QW1aVWuSEBQI3VWFrSKaNLj6
         BztQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778876989; x=1779481789; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egE2NTKgLKIitli4MrCbLK+ZNkKRWg13iBLZzoYlN3s=;
        b=bdhpUKjSUqT8X1XmQPqdA7UXDqcat9pO0Gk6m+QD12oICwMQLZl+pNEmaR6MocxdN/
         DUIXBAMYl8fBB/GYfSLVp8lviUYK3qkvXau1TIc2Nwx/7C1FReLzbfiVZaD9sFYAL4NS
         tLjTk2J+WfV+cMy23VvazkodbsZjEupU8YCJf1RpN/RrUCwfFoFnTn25dsGPTDfa6cs0
         qroAw8wdikrUZJ/n+Jq5poDIJZiUUsZtmYdBlt9NFn6b/Ini+cXLpkbOD5tYob/Y+3DJ
         bho3wUcZVYP+dmy2+Vird50S2cAuuOV6crbBkrdf1hxi0ZqzBsVUgayA3+G0NQMSxB8y
         bHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876989; x=1779481789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egE2NTKgLKIitli4MrCbLK+ZNkKRWg13iBLZzoYlN3s=;
        b=MH9BOK9B1sC0P9zVQ7t/tR7GDL2bdi5Jyz2UmCm4UhjMmSfhZyBFiJ1tX+5yrOvp3+
         PevRprNkMEgVFODrXo5xW4wfcBMBcfRTi2IG8bvAHqAQnKi9364z5WuNJQcBHn+3rq29
         IYxHL9wqhUuiuUfMoXEj5OUPJ3U8u7anO0I016i9INgh9oDoSwOkpzqbgXYwTsQxrmnD
         wjsOkWxvD3lQPt4k1PXPZ4BIsfAkYdQ/YODWTeza62MLtHLrEkt4Gs+aQqyGVrccRrlb
         gi1MkM3jvSf5hZhjaWY/KvPQ09W6oRotxUk4Uw3Hto0d+DR9ETgYvtlOKiR3XdRstmp1
         kOGw==
X-Forwarded-Encrypted: i=1; AFNElJ9HWv6h8jS5V0QGIEPnyRMggxkEXs7Tw7UMZ5vu4yuOYqLnjM37QUhcMzaFZ/onLT/Iz9JB+44/BboT8/cQTHmw@lists.infradead.org
X-Gm-Message-State: AOJu0YyuPH7MOeUsP3J43nvXlvUmSe9UEQSpmNQ6kOjKpdRHxvLVorw6
	EwPaAdLRCqdx6QrQYnym2k39JZvyB3d+ypnDnSQnfrgdj6lulYWoqjOWe2fKnw3VBiJMNfdiMmT
	YTUbbbKqMQUiRQhUSKiZPT184OGpmRlK9IT+s
X-Gm-Gg: Acq92OEhtCw/RbzZenqTbukOCZxVsusBQ4cgrgyMS92RGip0CnUvfO/DCooNSWlgoO7
	3D2HnZCMS7fVeBs1b/WzUfobJ2UJXV3WU1vuOYj/8/gCxICODAnBDnNiooxBdjwl/ilB5Gpfx+P
	IR8Fc4b3dUH9Ifz6+vhYgBrbHCLkQFljBX5SiO91lhyE6ZvuDG0CJJ+bTawp5oYEfiCXKOYHgn9
	8z05Hroui8CPThV0uMecATTqVSvbfupTgNj4xF8NLWvwb/FMuaFzbbhQSc3cy2v5N5HeeBF000j
	rOpXdCdyX6C6YqU=
X-Received: by 2002:a05:690e:169e:b0:65d:6f14:9070 with SMTP id
 956f58d0204a3-65e227c1fb3mr3415800d50.4.1778876989346; Fri, 15 May 2026
 13:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260512224349.64621-1-l.rubusch@gmail.com> <agYnpsiG8bNeVw57@linux.dev>
In-Reply-To: <agYnpsiG8bNeVw57@linux.dev>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Fri, 15 May 2026 22:29:12 +0200
X-Gm-Features: AVHnY4JtJvfX0GC5g_thFwXYu4s0HXSv63d-POdX9Cb0Rjc-P8Q9xf2xc-Xql00
Message-ID: <CAFXKEHY+fZFphEyH=rux80GLHdZhq4fw5hVV2uNRjqTsafmrGA@mail.gmail.com>
Subject: Re: [PATCH 00/12] crypto: atmel - refactor common i2c support and add
 SHA256 ahash support
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_132951_111108_BCD044B7 
X-CRM114-Status: GOOD (  34.05  )
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

Hi Thorsten & ML,

On Thu, May 14, 2026 at 9:51=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Hi Lothar,
>
> On Tue, May 12, 2026 at 10:43:37PM +0000, Lothar Rubusch wrote:
> > This series restructures the Atmel secure element drivers around a
> > shared atmel-i2c core and adds SHA256 ahash support for ATSHA204A and
> > ECC based devices.
> >
> > The existing drivers duplicated substantial parts of the transport,
> > RNG, EEPROM and device management logic. This series consolidates the
> > common functionality into the shared i2c core and converts the client
> > drivers to capability based allocation.
> >
> > The series also introduces per-device timing configuration through
> > match data, moves sanity checks and RNG handling into the core driver,
> > updates workqueue handling and cleans up internal constants and helper
> > definitions.
> >
> > The final patch adds SHA256 ahash support using the hardware SHA engine
> > provided by the devices.
> >
> > ATSHA204A devices require software-side SHA256 padding according to
> > FIPS 180-4, while newer ECC devices provide a dedicated SHA final
> > command and perform padding internally in hardware.
> >
> > Supporting the SHA engine also requires changes to the command
> > transport path. SHA operations must execute as a strict uninterrupted
> > sequence consisting of SHA INIT, one or more SHA COMPUTE commands and,
> > for ECC devices, a terminating SHA FINAL command. The device loses its
> > internal SHA state if it enters sleep mode or if unrelated commands
> > are interleaved during the transaction.
> >
> > To satisfy these hardware requirements, the send/receive path is split
> > into a low-level transfer helper and a higher-level wrapper managing
> > wakeup, sleep and locking. SHA operations keep the device awake and
> > hold the i2c lock for the full duration of the hashing transaction.
> >
> > The series has been tested on ATSHA204A and ATECC508A devices.
> > Tests are ongoing/pending on ATECC608A and ATECC608B.
> > ---
> > Lothar Rubusch (12):
> >   crypto: atmel - introduce shared I2C client management
> >   crypto: atmel - move capability-based client allocation into i2c core
> >   crypto: atmel - remove obsolete CONFIG_OF guard
> >   crypto: atmel - add per-device timing and match-data driven
> >     configuration
> >   crypto: atmel - move RNG support into common i2c core
> >   crypto: atmel - move EEPROM access support into common i2c core
> >   crypto: atmel - expose CONFIG zone through sysfs
> >   crypto: atmel - move device sanity check to core driver
> >   crypto: atmel - check client data in remove callbacks
> >   crypto: atmel - update workqueue flags and add flush on exit
> >   crypto: atmel - refactor and localize driver constants
> >   crypto: atmel - add SHA256 ahash support
> >
> >  drivers/crypto/atmel-ecc.c     | 252 +++++++-----
> >  drivers/crypto/atmel-i2c.c     | 679 +++++++++++++++++++++++++++++----
> >  drivers/crypto/atmel-i2c.h     | 180 +++++----
> >  drivers/crypto/atmel-sha204a.c | 284 +++++++-------
> >  4 files changed, 1010 insertions(+), 385 deletions(-)
> >
> > Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
>
> Thanks, but I'm not sure reviewing such a large series is sustainable.
> I've only skimmed it, but it also mixes several different things that
> should probably be submitted separately (e.g., refactorings and new
> features).
>

No problem at all. Pls, understand my series as a proposal.

Usually I'm testing the features and use checkers. So, the series is
supposed to be functional. Anyway, there are quite some changes, which
individually need to be analyzed and well understood to get this into
"maintainable" quality, which is definitely not the case yet. I agree.

Having said that, I'd propose to separate out the first, say, 3 patches.
(AFAIK patch #3 is +/- something, you already presented, too, so I assume
it disappears by rebasing soon). I'll split up these initial patches,
do smaller steps, and come up with this series the next days.

Pls, let me know what you think. Would this be better for a review?


> Sashiko [1] also reviewed the series and found potential regressions
> that might be helpful to consider.
>
> Thanks,
> Thorsten
>
> [1] https://sashiko.dev/#/patchset/20260512224349.64621-1-l.rubusch%40gma=
il.com

Fascinating! Thank you so much for pointing this out!
I'll try to take sashiko comments into account. Sashiko was new to me.
I'll definitely
have a look into it, either reviews or if there is a chance to set it
up locally.

Best,
L

