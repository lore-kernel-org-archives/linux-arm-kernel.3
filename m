Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5279CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLPQBh7z7ZjgVyEFkGxLLskZOTy+0tpS2U/GhDwl5OM=; b=y9V29Cj07LrobToUlkeRTsUvbZ
	tUOFVtOCaUmTi0YoU96N2WyVOEFqaWkPehwZ4QJvn1qKVpp8tbfdQwHGtgV0lBqrgv5hD6nxIh0a+
	ovtqZWgAYgXRHeelMosiehviygyLGM4LR7QX1slWLHPOgbg+YkcSd1JBcQeQn/1eY3Z4pD8mpmQSw
	N+9CZvFXXmSWPyvaaGutpzYLy3lkUsnJRxzupdiJbh3f3w97dpD+S8xIn+YgfYJSv5TG802h9UI1C
	CFydNgpa0UCD4jXv4atHI55Bw0HvavL1aRomQ/fcfmYPKcorG+/yFteCrbTjyEsqgoRisg7oczi3q
	3tw4MPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueE-00000006pEW-2azx;
	Mon, 18 Aug 2025 07:51:18 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unthr-00000006iaJ-1MXh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 06:51:00 +0000
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-89018ea73d1so1074335241.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 23:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755499858; x=1756104658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLPQBh7z7ZjgVyEFkGxLLskZOTy+0tpS2U/GhDwl5OM=;
        b=BKg+wHVYS9G8TuzholEFdrmsDA/6SwRX39ksp5etVIcTztPgO6uJL8IN5KxwSnDVQ0
         1SW7aZCQQAMHHy16lf0fEqDe5zmiiukPHMWoymZ4iLCHc3hFloAnKm/oj7llWle74F4E
         iz5sl+rjlgV4D2dV6pTpFv2BdnIQQ3TIUJOdZdRsPNtsqWezYJEkTYrgzQmAf3Bv9agM
         IEVfh2r01bg8v+R+mUQj6skIP1dmvIwUMRD9DrqYN6CVinNUQFzd1ET7kDc4bD1mjg4p
         cYhPtwBeExwrLJELqY0LeuZfrC1suOSwCKgb5PA1Gfs1O0AlEzA74hxmlKSwBktgmCYS
         pL2Q==
X-Gm-Message-State: AOJu0Yw6SnrTPhgY0/ivvhzTzLSMUWEPAfMTFyn4Oeqn0a51zrDPSI6d
	cC31dkXC8rwHCDz7QV5XrkJuA5cEO/H9Wx+GsYb3q3Hh1SuZcm1ZecN044/DVl7q
X-Gm-Gg: ASbGnctNrkHRuGw1hzqHRY6rQv9h39LujsFy81B7Fkj8+79tChao4CzB8Og/z4B7uOD
	8frbB8EKQuqxJmd8tIfzoboMMV5IanURtkXmqcjl/gvPXDf2kcgVmK1Nt+UzVhg4ZEQ7kdYLB3l
	diCOKaoxIeTAYiZbK1hj7YSWI1lluF0+ZVT3tLh2LsJqAClyo7dVB7OFrYv2HHAY4SnLYfnq4RG
	rZnOhiOeQVihVbPk85OrVR2JUB5+7gnycqGS0B42898Iaw88ypttUKH38nVbycd7elYtArj8mCM
	Ba/JjUJI7fv1OWObfHE+fHYkTXXLDv8+Pt7s8Rh4ND3RZhOHt9kM+xQfqPunJ/nlhhX6tsj6TN/
	63O3lKDQP4IvjbxTa1ytFHGAyWgUjtNFBLW49QXdXEgjFeft2PqhhfQ3i+BFqNzT893A59YY=
X-Google-Smtp-Source: AGHT+IGI8sVsnEL2nFOFktvHneqNYL/V72uI8sMZgd9U1pLRR9TkIAH9u+17YkPoykVWOGtK7rXTgQ==
X-Received: by 2002:a05:6102:3f8c:b0:4e9:add0:2816 with SMTP id ada2fe7eead31-5126ab2ca94mr3766385137.5.1755499857748;
        Sun, 17 Aug 2025 23:50:57 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-890278edaa5sm1681693241.18.2025.08.17.23.50.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:50:57 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-50f8bd52e8bso1294775137.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 23:50:57 -0700 (PDT)
X-Received: by 2002:a05:6102:951:b0:4fb:372d:6d70 with SMTP id
 ada2fe7eead31-5126d8e0ba3mr3829721137.26.1755499857391; Sun, 17 Aug 2025
 23:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250814233529.191874-1-marek.vasut+renesas@mailbox.org> <CAMuHMdWObPb97mYrPDBikjHsy_egsPqmMvoTgq4p6y=e_HE75Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWObPb97mYrPDBikjHsy_egsPqmMvoTgq4p6y=e_HE75Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 08:50:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC8+X=WcOdHsgh7XsR7WhVEHW8FZxFKpbbKuyM9jav7w@mail.gmail.com>
X-Gm-Features: Ac12FXw5y3Zk8kHXrn0gTEdDmk3-f_blnVhZq2OxDNottOxmur1Iod84ZDlawwI
Message-ID: <CAMuHMdUC8+X=WcOdHsgh7XsR7WhVEHW8FZxFKpbbKuyM9jav7w@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Update thermal trip
 points on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_235059_362388_5A67B654 
X-CRM114-Status: GOOD (  23.25  )
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

On Mon, 18 Aug 2025 at 08:48, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Fri, 15 Aug 2025 at 01:35, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Since the Sparrow Hawk has a smaller PCB than the White Hawk, it tends
> > to generate more heat. To prevent potential damage to the board, adjust
> > the temperature trip points.
> >
> > Add four "passive" trip points which increasingly throttle the CPU to
> > prevent overheating. The first trip point at 68=C2=B0C disables the 1.8=
 GHz
> > and 1.7 GHz modes and limits the CPU to 1.5 GHz frequency. The second
> > trip point at 72=C2=B0C disables the 1.5 GHz mode and limits the CPU to=
 1.0
> > GHz frequency. The third trip point at 76=C2=B0C uses thermal-idle to s=
tart
> > inserting idle cycles into the CPU instruction stream to cool the CPU
> > cores down. The fourth and last trip point at 80=C2=B0C disables the 1.=
0 GHz
> > mode and limits the CPU to 500 MHz frequency.
> >
> > In case the SoC heats up further, in case either of the thermal sensors
> > readings passes the 100=C2=B0C, a thermal shutdown is triggered to prev=
ent
> > any damage to the hardware.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > ---
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Magnus Damm <magnus.damm@gmail.com>
> > Cc: "Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> > V2: Add RB from Niklas
> > V3: - Sort DT nodes
> >     - Update comment on idle states, note the 0..80%
> >     - Add RB from Geert
>
> Thanks, will queue in renesas-devel for v6.18.

With s/r8a779g3: Update thermal trip points on V4H Sparrow
Hawk/sparrow-hawk: Update thermal trip points/.

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

