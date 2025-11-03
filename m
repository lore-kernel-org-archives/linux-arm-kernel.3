Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E553CCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaaUEDVSi1zym8/RCHGJWc+jChnQELjhyUR46GKHyw4=; b=lZYYwryP+B888bzM4C6IFDPU7Y
	XAbz5rb02/2hxokvJcV/KkUyS/Qkkl4sevWu8H31vVsUZV9isfR6eCVDq5wR5Fy0XvaGqri5LNJ9e
	Axkwd4DUmRORXjAwUBsxJbho2Ees5H+hK1MAX3257iH2Mf/fsUGQTRIyTA2kmseWohENmWfZv5Fjl
	4cmXMB/IbjrGYRekZvZxFJUGJzhAW54h9dFFvdI7PZHsTg6sAIS8I9GOuXda+u++cocdwsRh3KvhN
	WlvVWsLAwB79joGglDHgbKU1WYfYjnJUKMBSq1KHsXK15Rf4s5XGKr+Hl/CU2TDiXcFGdlI4z9qTd
	Sp5QIg9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFp3F-00000009Mbq-0dnV;
	Mon, 03 Nov 2025 07:32:29 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFp3C-00000009Mal-1pSR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 07:32:27 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-37a38e56dd5so3419291fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 23:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762155144; x=1762759944; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaaUEDVSi1zym8/RCHGJWc+jChnQELjhyUR46GKHyw4=;
        b=BrV8K/AOGtHhEuoUsxxuoCq73Jr/9nMjIKRc6PYBtdko9dxys7uYBxy1u0Eqns8MRP
         D/hRCjA4Nbo5n/zWpbylRsQqtVJD5CP3p+pAAD6ajHMHWmNWz4TO7/llNopXrDw2K9/Q
         wGKSVd8kD7KvjKmP/byqbN7KPaH8Xhq2uWWeSCJvtsPH9cFkKl6TCuj1VEmJFQGpvbME
         TkXtBaXBEoH39i9zt4z+Oyl7CGWQEdSf0ULjmRG+XOymlZ4beCMzvGMC1fut1jZtCt+4
         9H8t8UcfMyBYgUoBYyEjB639sAjVJBIc7MaTg91nNK7cRqbJHlUWlwpYFl5ajetzlQ9z
         iCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762155144; x=1762759944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaaUEDVSi1zym8/RCHGJWc+jChnQELjhyUR46GKHyw4=;
        b=qErjPHuIYR929auTyhzbe4jHCYiULJA7yMCxGESoogshBiXlivYX4256AteB3JrHxR
         1b+lX3vyPVBkHS1KBVq87L7xSdUwkRS7mebNDwN/RqV1yfsoq1KqmWZryrmWM7tYQ5DL
         Zw+kLfJQGxInEAi6xvJ3+xfdgHzqDvxtkEAra6c+yoNkcq5Z1VPaxK6yAkca08hId7MW
         4NYvhcNmYt8FCHJrRPSNZorHbm7SkG5iQ5fYqqtpvx/nK6pWsmr09j4NAlhLPDITI2g+
         bdBo2AKtUKc7QnKNPhI4esrU9LVBpHVL6HNlFiwsZpNk2I3YhhXoEkK/wyQCiWXtSYkq
         DcgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8XtOopA2radaiLbUlv8y55gzXYS6b2RNdhofHvL0pdBJrAmnStW72Ziqi9CQH4CAlnCNBqCTnQCmaY7+woxL9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5soekPL+s3+Q+LM4TsjBWxanY0dffOpLDcjjSz1MLPdhgpKPU
	FYWQfxp3jnm54WIHbN41srGRCdhZyO2e/no6WqQZQ2Yw7FNqyz0z/7Oi9lJzAH18rHPP5Issg4H
	oLSTsc53FylSWcfa6ugc60IzeXArbysU=
X-Gm-Gg: ASbGncs/E2QOhq/Hn76hBXxHiY6pbanG368chvFAtTjoXFWXKfjebYygb0BfM6wflrf
	spmBvkE7YmTtU4R+17OyjCjQzSnQLL6IT8LEy4ksncgLlCNpWwdk0C6dw+qU05bcVpu2eVS/3tk
	rfHPX7XxKkO1UW8JKjs10vjFB0wNzp5QtOJA0prKNYiIgjLawuDMUM19WejqdopkORmgzPboqku
	W9IjzAeDF5QHmm/bAtHQ3If9ccbt3OxIESmlDP3af5JxpTKkONWbbYYpyLOEmkLjB4EPA==
X-Google-Smtp-Source: AGHT+IG4k1+p/ZVOhwkHMtbxP47toCZzPfmoTR7VNJnn8PaEuHNkJSbLEbbfSA/3JaBOQkl8L2AQgGcDYyL6IRs5bS4=
X-Received: by 2002:a2e:a90a:0:b0:373:a465:292c with SMTP id
 38308e7fff4ca-37a18dc179dmr33747461fa.21.1762155143653; Sun, 02 Nov 2025
 23:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20251024173830.49211-1-xakep.amatop@gmail.com> <1499f50e-aa4f-454a-b8b5-c9a21bef7f72@collabora.com>
In-Reply-To: <1499f50e-aa4f-454a-b8b5-c9a21bef7f72@collabora.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 3 Nov 2025 09:32:12 +0200
X-Gm-Features: AWmQ_bklMXYT4Ul_3Xqst3SNaatN_W8582juobBsGuz0hO38xKkJv60xkRmG9BY
Message-ID: <CAGeoDV-+HjpW9CMy5ypsMFDYgYKrV-5zMDGie0=_JyTCo7NF2Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V regulator voltage
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Cenk Uluisik <cenk.uluisik@googlemail.com>, Johan Jonker <jbx6244@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Muhammed Efe Cetin <efectn@6tel.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_233226_510727_17D9E5DC 
X-CRM114-Status: GOOD (  23.70  )
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

Hi Michael,

Thank you for the fast response and the review.

On Mon, Oct 27, 2025 at 2:39=E2=80=AFPM Michael Riesch
<michael.riesch@collabora.com> wrote:
>
> Hi Mykola,
>
> Thanks for your patch.
>
> Cc: Muhammed who is the author of commit b6bc755d806e
>
> On 10/24/25 19:38, Mykola Kvach wrote:
> > The vcc3v3_pcie20 fixed regulator powers the PCIe device-side 3.3V
> > rail for pcie2x1l2 via vpcie3v3-supply. The DTS mistakenly set its
> > regulator-min/max-microvolt to 1800000. Correct both to 3300000
> > to match the rail name, the PCIe/M.2 power requirement, and the
> > actual hardware wiring on Orange Pi 5.
> >
>
> I guess a "Fixes" tag is in order here:
>
> Fixes: b6bc755d806e ("arm64: dts: rockchip: Add Orange Pi 5")

Thank you for pointing that out. I will add the Fixes tag in v2.

>
> And make sure to Cc: <stable@vger.kernel.org>

Will do.

>
> > Signed-off-by: Mykola Kvach <xakep.amatop@gmail.com>
>
> The change itself makes sense to me.
>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks! I will carry your Reviewed-by in v2 (diff unchanged).


Best regards,
Mykola

>
> Best regards,
> Michael
>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch=
/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > index ad6d04793b0a..83b9b6645a1e 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > @@ -14,8 +14,8 @@ vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
> >               gpios =3D <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
> >               regulator-name =3D "vcc3v3_pcie20";
> >               regulator-boot-on;
> > -             regulator-min-microvolt =3D <1800000>;
> > -             regulator-max-microvolt =3D <1800000>;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> >               startup-delay-us =3D <50000>;
> >               vin-supply =3D <&vcc5v0_sys>;
> >       };
>

