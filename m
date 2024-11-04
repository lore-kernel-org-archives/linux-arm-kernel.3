Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEF6D132B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SMwMlud9VpFJug/GEuyhyAfU63OEE3p7Bt9+6mizC0=; b=woWz0WCDREK/lsokoIvWmYr2yJ
	VlG6CgunoGtLLGVaqb60dN+sSl0U8KXELOQ3EjoBONhiYsSAJ+QlAJ3hfB0dmpv4FhPazZg9MaV5g
	X/eEp3EcBCZlqxs1J3WYsjbOWVVtTBSAdU7DeryamQEMyBnJgEzpzr1HioQN2J5T4iAi4WMbpf/Bu
	52Hbp7Aa/W8bH+p/C/E5akWoLW2Vs1d/sQ6WtbnqvFo7DJaX0XgXkpzLKkTaA+n0+gh4cvZPsMFaF
	D6IaoooOD7YapbH2DEINtJMgGNpRzGVaYAmbigz/n7TaRlKOO8tiT6LhMm26ltiQwQfqkYn0f/Imt
	Z/XWDm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vDo-0000000DVet-3NxS;
	Mon, 04 Nov 2024 11:26:12 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7v45-0000000DT5L-3INg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:16:11 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb5111747cso37492711fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 03:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730718967; x=1731323767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SMwMlud9VpFJug/GEuyhyAfU63OEE3p7Bt9+6mizC0=;
        b=mUK27AS3mJMvXAYblgxOlPn4CAE2zPhHXtBhruH3KLVxI2gMK4vyUFyIHlfVtDeiDy
         ZXNyRDRLG6tWk2nV8aE2PUutz3r1EL8hJ2F48Ihor1citCzQecSG6McG0aI9ZkUBYoit
         xTsYsHkWBDorkIwmdGbi4cDpS4XHdymbMd+eU799tMMYz1Uhw+urGJutDuUGOgYWRdD4
         cXLZIn7emWxKaKIP1z6+4s5BEZ0V0Oy+XRU6DrFMBMmuOF+1peNkd6Fa2f/EaVVcpSyU
         XM/qK+DuUb051dXhqAE/+FtuA9XHWAl7WevU/qb4n1lTSfxtrKMg5w6/fmS5G72+Ttmr
         +h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718967; x=1731323767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SMwMlud9VpFJug/GEuyhyAfU63OEE3p7Bt9+6mizC0=;
        b=om6+7wCe0LUTTDte4QJbBtseGSZnHF7KP7g+CldAYlkW19VtcAGe6yr5CU//RYCiom
         aTURPH4rruwkhPy0IoZJKdmK6t64mqc1HRdIZrSXeQV3ZT3VWugLAvnQ+4isjIezzwBr
         UQMvl+L+hznwf90n9ymckRrmt8wJDhtL+6Z/bpY/DvppbMhUzoNE61cKQNz3Y+haeF0V
         ykFS9e9OybrL4O8i20/pRBeKaeG6HZVCWKBsnPYHCqDoXihexishSBCEioxj2Hk6uUtA
         1VcP7PzkHNRx8XConmqkdEmqK0EItGj2cEef2piUKJp2kbX6wv+++/H/qGTeDcrAt0Qb
         jq8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2nfxu0RITVhFrrs9aJ6c327YljvLLIXb6SHjUmBxcRfkZ8b3GWBQkBWE24cHSClOvQ+rFMxdSe+2+62erFqaA@lists.infradead.org
X-Gm-Message-State: AOJu0YxKz2gmLGWyvWxTE2Q2qNzWukfX5Rn+JAZmF2AgP10Bmz8v7pEJ
	WYv/JeiTiW7g1IPJopXOHKNdwEqEGAhjfW+zeK44lvHVCvrH39pFr52SSi0IwH/dmh8qzQ4wjpd
	uSQuccMDTmv86kTV61Fh9a2qSL54=
X-Google-Smtp-Source: AGHT+IEzN70NkrF6BWT0VQctKNPsc9mfubq6riSTtLOV3QRjwhMFt9r3TqokctCja3a9zuoI92aSnDqOznprk9dMpPU=
X-Received: by 2002:a2e:bc18:0:b0:2ef:2490:46fb with SMTP id
 38308e7fff4ca-2fdecc2f714mr74133011fa.37.1730718967005; Mon, 04 Nov 2024
 03:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20241031151238.67753-1-hs@denx.de> <20241031151238.67753-4-hs@denx.de>
In-Reply-To: <20241031151238.67753-4-hs@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 4 Nov 2024 08:15:55 -0300
Message-ID: <CAOMZO5ACMGbhySUbR8r1UUimc53YDaRbfEObyUrf0GLYZcQfjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp: add aristainetos3 board support
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_031609_860309_FF7A01EA 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

Hi Heiko,

On Thu, Oct 31, 2024 at 12:12=E2=80=AFPM Heiko Schocher <hs@denx.de> wrote:

> +               brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
> +                                    10 11 12 13 14 15 16 17 18 19
> +                                    20 21 22 23 24 25 26 27 28 29
> +                                    30 31 32 33 34 35 36 37 38 39
> +                                    40 41 42 43 44 45 46 47 48 49
> +                                    50 51 52 53 54 55 56 57 58 59
> +                                    60 61 62 63 64 65 66 67 68 69
> +                                    70 71 72 73 74 75 76 77 78 79
> +                                    80 81 82 83 84 85 86 87 88 89
> +                                    90 91 92 93 94 95 96 97 98 99
> +                                   100>;
> +               default-brightness-level =3D <80>;

One suggestion: a more succinct way to represent this would be:

brightness-levels =3D <0 100>;
num-interpolated-steps =3D <100>;

