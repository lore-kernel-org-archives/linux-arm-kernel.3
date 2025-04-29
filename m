Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA339C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31hHt99eQ7ecxAQBYo10uCFCGHQn8F86JxoMvBp/XTs=; b=i1WTtfdYd+HnpE4Ge8/9CL3DHY
	uNQ46QSbDj5Vnfy/XXtUM/Y7sXNVPPDllS36CjjfF84OmfucV0npfAG7Us4mCJmhJDfMS+UYsPgSj
	CQh2JnSsWx3wtZZldEy9HRQyGeWB81kKrgQ08VVuYw1lkNIAswb1hOTliBY8GYfCeOsVn1c4285kJ
	DJ+7FBCOUT05l+pevVOv1SfHXEGOaJYjMH+jk5zzd0U+zyhBU3ykAOUmJAuyP4ORjxF1LwjGKH4GS
	yhSrXv/ITNZ8YccaMQ0knHFA+XEjPwyqZLz37dLwjA8iQiyZU4M32UsOhVcY2QYu9D9HG1uE940F3
	ID8LLK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qzq-0000000Agl0-149f;
	Tue, 29 Apr 2025 19:52:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qvx-0000000Ag6r-0Fc3;
	Tue, 29 Apr 2025 19:48:02 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac7bd86f637so36609466b.1;
        Tue, 29 Apr 2025 12:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745956079; x=1746560879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31hHt99eQ7ecxAQBYo10uCFCGHQn8F86JxoMvBp/XTs=;
        b=TJu1IiMnuSgg8ZkdNJvmi6rQtgt1CLpWF0tvi6VeOF/LoIHlf9lwT2uqSTzB7hw5Tw
         JumTf0YF18nLgtieYOwu8VNb6jh0hIH9p85tfeZIXlDU0r9gr2e5Qu4a3l6KuK/JAu0y
         hFjYwz3Y80v96pJ7Gnh3+4TRKHwGBHAnPaiTKa0+8wy5avJc3ZHe7nJbYmFZGMvyIHGX
         p3QBqWhgLZgiuvWI9jKnTR1HwtQZyz9lhNM6VinOA458pOTOBSybKwezmV+ZOGhEMHtG
         iAmni8fmkHLsK5ehOLMRli5um7Bdx7U4snr+9oJ87oRna/ZIi+EkeLiQMJ6BoKSmBQ7P
         u8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745956079; x=1746560879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31hHt99eQ7ecxAQBYo10uCFCGHQn8F86JxoMvBp/XTs=;
        b=SQW48uR9HCWElakBKAAlcGT1/4V4VeaaX6DwTji/EgPj2Y8QOHK21UXmCPF8VoJ6E9
         iVGMi3Htb7lRW54PdVaU58hOZHW7maHN0c31rvcHCd1bGrPh36/4bJ9obIG3OZT/Sc/C
         pQ4HBGdjmBtNf8WrVwvKPj9FjMsUhYM5V3UIghuK+nKY9p94kf6pfvUUvnWzLEqf/jwt
         oHNDqFxXb6i31V8oISqBoqc8Xc3olkyIMtBQNGM8Aul+QQuGfey7ZA3buDkFaylzW6FK
         74kvyZVPA/Dm9rHHfLD7tWNq0BEyPh5FAC492uAn29lychuiMhunAl1sosxj5Wxdohz4
         x2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYQdOtk0kUsUvCt/meoJVDeBy/w1f3d/g78aACfqrXPakX58ZGumcTSNJ3yTtk0LEmR5H5cJeQrx7DYuPofED5@lists.infradead.org, AJvYcCW04JKRmBukButaV/p1G+CVoRoYqtqTDM8U/42gNUlcj0TSBbCeVz66S3Y0j5xrAujhfNj3c+zmDZdh1oEyuDXc5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAKNyY/FDssuYR2YJ1rux6XkoXHB8Gu3x3SH68PdgPnjVTkro1
	Z/PoiGix5JOXZXsw2AIbbII9fkm+IQacA/tjqb6+w3H/OLD/PMHqtLwoiXsqX1Yzou8O+x6t7En
	OcM3rzcKeUV1YPDk70b7wZgDFSyQ=
X-Gm-Gg: ASbGnctCwiQVCNj9w9IHp37rgT1pvrHb094I5E4qeqsxVSYJ+MI51WexKQgHm8rqOkX
	zcmDQ8UIbXV4ZVbqEez5Y1sOUGE1lkDn+KuxNu4+hACzZqpAnxLIYyHs9+2xfFMxooB0zIZQL2c
	TlX9w569v8pt8AtMrTOCG4HQ==
X-Google-Smtp-Source: AGHT+IG053NtJm0hR+FwHICAyS7gp+M4t3UZk6wbhjh4+xpcE871md/xia3GNq0/H3rfYdZZf6GCNx2EKnYMhYJ4isw=
X-Received: by 2002:a17:907:7ba8:b0:aca:d276:fa5 with SMTP id
 a640c23a62f3a-acedf349707mr18697166b.0.1745956078998; Tue, 29 Apr 2025
 12:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <aA/ineUBAM5IU79J@duo.ucw.cz> <20250429170220.8145-1-trannamatk@gmail.com>
In-Reply-To: <20250429170220.8145-1-trannamatk@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 22:47:22 +0300
X-Gm-Features: ATxdqUHg7vLAt0poth2caA_g2wxqIwhzv8QInVAHWSoWODRta2Iw45WeEjT2sDc
Message-ID: <CAHp75VcVmTwS-zw=o5=m1-x0XC67BKBVWae2mMKZQH=qLCxZwg@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@ucw.cz, andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, 
	corbet@lwn.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_124801_097334_44B54A35 
X-CRM114-Status: GOOD (  27.59  )
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

On Tue, Apr 29, 2025 at 8:02=E2=80=AFPM Nam Tran <trannamatk@gmail.com> wro=
te:
> On Mon, 28 Apr 2025 Pavel Machek wrote:
> > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> >
> > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/=
.
> > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > >   and update the title and $id to match new path.
> > > > > > > - No functional changes to the binding itself (keep Reviewed-=
by).
> > > > > > > - Update commit messages and patch titles to reflect the move=
.
> > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/202504221901=
21.46839-1-trannamatk@gmail.com/
> > > > > >
> > > > > > Out of sudden without discussing with auxdisplay maintainers/re=
viewers?
> > > > > > Thanks, no.
> > > > > > Please, put into the cover letter the meaningful summary of wha=
t's
> > > > > > going on and why this becomes an auxdisplay issue. Brief review=
 of the
> > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > >
> > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outpu=
ts,
> > > > > but...
> > > >
> > > > Is it intended to be used as a 4x3 matrix, or is this just an inter=
nal
> > > > wiring detail, and should it be exposed as 12 individual LEDs inste=
ad?
> > >
> > > The 4=C3=973 matrix is a real and fundamental aspect of the LP5812=E2=
=80=99s operation.
> > > It is not just an internal wiring detail.
> > > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 =
output
> > > pins control 12 LED dots individually through scanning. Each pin incl=
udes
> > > both high-side and low-side drive circuits, meaning matrix multiplexi=
ng is
> > > required for proper operation =E2=80=94 it cannot be treated as 12 co=
mpletely
> > > independent LEDs.
> >
> > Scanning is really a detail.
> >
> > If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> >
> > If this is used as a power LED, SD activity LED, capslock and numlock
> > ... placed randomly all around the device, then it goes LED subsystem.
>
> The LP5812 is used for LED status indication in devices like smart speake=
rs,
> wearables, and routers, not as a structured rectangular display.
>
> Given that, it seems to match the LED subsystem better than auxdisplay, d=
oesn't it?

I have mixed feelings about all this. As per hardware organisation it
sounds more like a matrix (for example. keyboard), where all entities
are accessed on a scanline, but at the same time each of the entities
may have orthogonal functions to each other. Have you checked with DRM
for the sake of completeness?
Personally I lean more to the something special, which doesn't fit
existing subsystems. Auxdisplay subsystem more or less about special
alphanumeric displays (with the exception of some FB kinda devices,
that were even discussed to have drivers be removed). Also maybe FB
might have something suitable, but in any case it looks quite
non-standard...


--=20
With Best Regards,
Andy Shevchenko

