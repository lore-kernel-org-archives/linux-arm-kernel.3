Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105C8C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y2nJxgpLq/4ajBXNTSM9IN0ALNLXkV13ENJ/HewBaA=; b=3AARPGVGQ0YOyhneAZ7Ch+kxG2
	s4uySj9zyhaZ7/YP3opwvm0JwvesZhDcP/zWORHBsb2noy6PxGqoGT6vzHcggSyABabW9MM5lQOR7
	kU11nehEred+ou38tPBNTQ/q2FaPpTYFXQlMsGjt4L+E1Qo3ZZSE3YGnbW828eCdVeNrhFIzyzo6H
	8MhJQi2E3ln6SXmCdAOvy6bFpcEwBbP0hZHzs94pmGgDs3ElK93gKYMkzlL5NbYYbRjNrxn6P8xcI
	XOZHpyf7tyKai5BP1NKv9vjFaWVPkRL15OsZncLPoyhsG3skdUF74QNurmFyszpHCazRN8CHWW4gK
	2FDCOcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG3a-0000000D8gD-45Np;
	Wed, 28 May 2025 12:38:54 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG0p-0000000D857-1K6r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:36:04 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e7b4ba530feso3348036276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748435762; x=1749040562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y2nJxgpLq/4ajBXNTSM9IN0ALNLXkV13ENJ/HewBaA=;
        b=ZYVH9YPhDRUr57rOuCfY/TFv1oDYjMTk3fn/SGCsieFWV0qcK58tOv4ef02Gs7QwRQ
         5zbBtiMeqKVvKCkuEmXWIJ8/YU506i9pCJXPje3FvA9HuXhiuxAygS//bdwqbPOVHkGS
         P9zqdARETLmS3SBi4yQJI1JyA4lLnQzuJTOGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435762; x=1749040562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y2nJxgpLq/4ajBXNTSM9IN0ALNLXkV13ENJ/HewBaA=;
        b=NUuD25n4Khh/cg6iIpwgtwMlcaX5mWVosnrLc07NxE+Gs5bTnzmHBV2AlGN6v5cFaf
         /V5K5mkjUQlIDLUb9owwuiR8wRI5PI95uSnUKak5j0cxe73nUMHdju/Y8KM7bzoa7pym
         A93gx/O/tJngkXtv+gsa5lY5NbgKGZr9W44wFVT3yP5uMlLctGyDVWQQXs61AAZvfwQJ
         VneOEp6f2CFIJfYxTYnOagUr69YpnzfRuiKqnTVjM3LTr2rgEKqWBLsokegR6VgS+r0x
         Z3ySDoNpwCCI2o2O8IBqUY8w7EOYH/L5CxCl+RqDbTiChYB6G22uEcuvT0WTwMBjon94
         Ipjg==
X-Forwarded-Encrypted: i=1; AJvYcCWFnw9GRbFdez6G4atrczukRMDYILAicBlszZsJQaRWPh5wqh87ZVfWLWV+3xlQyZSfu6X0ZfxuOz4uVU85SrTw@lists.infradead.org
X-Gm-Message-State: AOJu0YxwhAufVEBZWlnZCUyMoc+6K4D7a7a8IAUOv4GR5dbROJuOnPX2
	BFz39OjxK8LpQsuWlujBGT/aEOalIkt+8cKno6Ge92DAOvZDrE5csfla4zGsZzJqUjp7atg5gRp
	aag0EJCIXE875QgonufQep41BU/0FIF9x2q5Bdj8bag==
X-Gm-Gg: ASbGncujMnK83fnlzeJjp4BFvesAO5ulrAFSBiYE5Z1T/VlROWl8CexV0mp2YyOiNVW
	BiUZ5CfgCrhiqMLj16KSxtq1twRxdCO8jxN5g+68sialHgetfdvyEBywJpjcHy/P89Lk3MdgkyS
	Ln7yS+sQew6JmahFfWLy7APKSi5GjVZp0k0Lza2ZSZ1z2VWMSI3dykSUDkKrFqo7VyKQ==
X-Google-Smtp-Source: AGHT+IHBh35vbTwgJCVmI6qYBeU0Sp2Wx1M+Pq2Rp63W3aCe0f9Vwlcw2TxiYl89UFgJ0Ni/gNn9cRNUEGm7TvbhuTg=
X-Received: by 2002:a05:6902:20c8:b0:e7d:8a63:1a2a with SMTP id
 3f1490d57ef6-e7d919b04c6mr18500419276.25.1748435762006; Wed, 28 May 2025
 05:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-5-dario.binacchi@amarulasolutions.com> <20250528-toucanet-of-utter-conversion-2bb1c7-mkl@pengutronix.de>
In-Reply-To: <20250528-toucanet-of-utter-conversion-2bb1c7-mkl@pengutronix.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 28 May 2025 14:35:49 +0200
X-Gm-Features: AX0GCFsWpbnRJlmj0FdLliCaul8VD_OZHEgOqPPNi4PhesFCouLSLcxJegiNFSU
Message-ID: <CABGWkvqAy+-mjhXFKc9dkeJnZKLKuC23=Dmn3axJx_1+5fLWSw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-amarula@amarulasolutions.com, Sascha Hauer <s.hauer@pengutronix.de>, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_053603_364980_F4BC50A3 
X-CRM114-Status: GOOD (  15.55  )
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

On Wed, May 28, 2025 at 2:21=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 28.05.2025 14:11:41, Dario Binacchi wrote:
> > The board includes the following resources:
> >  - 256 Mbytes NAND Flash
> >  - 128 Mbytes DRAM DDR2
> >  - CAN
> >  - USB 2.0 high-speed/full-speed
> >  - Ethernet MAC
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> [...]
>
> > +     reg_3v3: regulator-3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
>
> [...]
>
> > +&can0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&can0_pins_a>;
> > +     xceiver-supply =3D <&reg_3v3>;
>
> The xceiver-supply "reg_3v3" is an always fixed regulator, that doesn't
> switch a GPIO, so IMHO, you can remove it. Saves a bit of runtime mem.

Yes, you're right.
Removed and verified.
It works.

Thanks and regards,
Dario

>
> > +     status =3D "okay";
> > +};
>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

