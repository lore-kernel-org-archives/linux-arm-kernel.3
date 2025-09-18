Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE082CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymLWBfJeHa+AAF5LWXk/aJtIpCAEk7N1D5WL9NzAOZw=; b=VnKJXFxDrMAI1LVZwGECDWngcT
	QmBMx8UaupgXGaTAuwmV/I8pqmbYgyMUpvWrl7gtVy/HdIJ19HVt9U1Qt0KMJLy3rK8lfcyd2EwLJ
	Og7O49EUqahbSOjQjZfF9Gg4N0ahiW27YDQKJUBe/8ZURLkvrfe5PUrYz47Cg83UJ2kwjq1sz/2aC
	14wnVICqoXPAhxc8rFOqXi054b9aUj6W707BMp0vTwjnsRVnLs+UCc5TaPw+rblCXBlpjJq5qn29H
	OU1J6soN/ne9sZl/FZnENYMWqxKMkZrHDeVjlQ8Hue9J455VEmLab4fgGRAoJz1/QGrZhtXuktDE/
	b2ZxC+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD59-0000000HFqA-22Zx;
	Thu, 18 Sep 2025 11:45:47 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD57-0000000HFpW-33Pt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:45:46 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so1646803a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1758195943; x=1758800743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymLWBfJeHa+AAF5LWXk/aJtIpCAEk7N1D5WL9NzAOZw=;
        b=YYEZ6vicSZtxRq0QicSgXp7E46OGu1MlJwXZh5jS5nIXm3WdUu6fERhdT1QE0gDeZY
         VRkL1HF0m3M66U7PAUfhnkUKoJLy03YL9OVSdAz8xuZKFkjnN03Gyf1cLbJC5IA7Roq1
         LGBEmwLpNIvsSEXj99wuE8O7vImcB/RHDDsj+sylJA1fqgp4MvNgZQo6XQXcQUXH2oRq
         obzu1Xo1uaTdQzqDXNjz0aq89Mm+MLmiQoJ2xLJ/WshqX0KFl2dA3+7QKPik1J/ZCSQK
         g4B5BvRbg0rfSskAHxGHfHZjH6B2b6q/pHqBqmUsdZZlUyfo+HanJCB4PmZxR7L6TmR4
         u4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758195943; x=1758800743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymLWBfJeHa+AAF5LWXk/aJtIpCAEk7N1D5WL9NzAOZw=;
        b=DBahMGC+aJTrqgVlQCbJIYohuKyAGzIfVf50XvmCULikDjLNTjP3nQr/LQ4Yk9SBKv
         WN45jzuImdtcTVeylrqoxf613ivbEoOqcxlRP7fXTXKnySVoJn4NPy1Yl6AzuHe9oU/u
         KzcgnGpm1GzemlkxYE0G+3AL/Qhd6sSXJ4ZINBzL8ta1QGtj9WrZuzImizpecTXrm71e
         WoZahdo1VY6PMVEVPSlLexFKA2CpUzktpNCvXSaUsVduvGG4XYWgv77UVILnF6En99hM
         nnIQ0wcH+Xc9N5X6tCDaRj0nhXs6Ck272hmeAQJm1an5IxwyNOgGJ6Qnxj6GxC/08F4i
         hV0A==
X-Forwarded-Encrypted: i=1; AJvYcCWcqnD/cdoJT2UctTxUFwHBbYudEtTgl2ApekEOcc1MHks7Ggw7rQdfpIINyZ/9AHoEHJHVGkxYvblVdK5MMpX/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4r/r8gJvGcwsxIkkZW092b9Pd8klDAkDUZGBSwlcEjlDOUHoE
	bW0rupULJFkrs9+R9HLxYNYvH4P8/n6ReiiL5DjWJe4euEeZBTUrf/jCmvf1wwlj7Q5YFOPiPZd
	MhaSZGgYQB33ivMA1hwqBROvg8JVzyw6Dj4q0KsDk5g==
X-Gm-Gg: ASbGncuJXXsYx7vf2C8J9tw5jXE0urFCwfHjWbX86FrSDwYs2QTUMo1XRD7ANZslKEC
	xLREuWcuiUWcju/PnJZGQy+onlNtchJivdMBiB/kJsPcbUKmhiIAdTf02QH5NFOYxUn2MOq1kAe
	VXD9Sc3jUxXxmLrQ2g4n75YRSeJ9T1F4U4rlDqhddv1gIXIp4P1X+aqn52KtnW89GtpXsjyKGNc
	SUTF+BvZj7hrsrG7oohhDflMNA=
X-Google-Smtp-Source: AGHT+IHFids55hjFx9tAzd9HjZcFGiHI2LRl4FHiE0hZ24A9EqDyegxHm6xC2ZWRH8V+3GqUEFGFc0HVJ77f2C+o9Nk=
X-Received: by 2002:a05:6402:5341:20b0:62f:a3ae:fedf with SMTP id
 4fb4d7f45d1cf-62fa3af0280mr2223555a12.34.1758195943526; Thu, 18 Sep 2025
 04:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250917111323.60781-1-robert.marko@sartura.hr> <20250917-paparazzi-hermit-3a4aa686add3@spud>
In-Reply-To: <20250917-paparazzi-hermit-3a4aa686add3@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 18 Sep 2025 13:45:32 +0200
X-Gm-Features: AS18NWA_6zldq5uxIKmy94PXw-Gq_9sPBdCM2sajgaSERKRbYRyea3BZcHITxFQ
Message-ID: <CA+HBbNHS9TMd5u_Mysv21=nsqjeEb44oHFj06kS_hxkXZWutnw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: microchip: Add LAN969x support
To: Conor Dooley <conor@kernel.org>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	luka.perkov@sartura.hr, benjamin.ryzman@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_044545_787757_EF5D0EA9 
X-CRM114-Status: GOOD (  19.22  )
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

On Wed, Sep 17, 2025 at 7:38=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Sep 17, 2025 at 01:12:35PM +0200, Robert Marko wrote:
> > LAN969x also uses the Microchip reset driver, so document its compatibl=
e.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  Documentation/devicetree/bindings/reset/microchip,rst.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/reset/microchip,rst.yaml=
 b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> > index f2da0693b05a..4d4dd47f830e 100644
> > --- a/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> > +++ b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> > @@ -23,6 +23,7 @@ properties:
> >      enum:
> >        - microchip,sparx5-switch-reset
> >        - microchip,lan966x-switch-reset
> > +      - microchip,lan969x-switch-reset
>
> Driver patch makes a fallback compatible seem usable.

Hi Conor,
Will respin to simply use the fallback compatible, that will avoid
adding more compatibles to the driver
for no reason.

But, can I ask what do you think about the
microchip,lan969x-switch-reset compatible?
Is lan969x fine or should I just make it lan9691 or like cause the
whole series uses the same
reset setup?

Regards,
Robert
>
> >
> >    reg:
> >      items:
> > --
> > 2.51.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

