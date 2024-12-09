Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4900E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 18:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vt1eQkp9pAQVTjzNi7SG9xZxFIH63Nwe6vPPAcwIYGQ=; b=CnjbCjUr/YJfBx
	iKTZ5upmcC5h3y4BcUf6qNZlfe94psoUlui4PggGyIbH+hTePMoBvZjUT8JZlduHBvtcKXUUg65xS
	yF8kYZButyFeIvak+koGpjfEdfdJE5bBjQ+/xYe8uK/NmuFQK7P8Go+4EwbuOZpamT40mnl7AkwsR
	G9rcb5jZE6eG2KFdgqXrV7JYVkb7VcyJu4WOnkFi3kvPgiFL6ij/yzHNwRTonujHuX+Y36pU9563l
	l3QRlIPYWRHuyMDxMMu5SjhswoV1EipOjhLkUe2wBgU00ZsykLaVCOPaKE9jOhZWIQrYNifs6DL2q
	EFp9nA5ctaiqNvs1iSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKi8L-00000008qG2-3HTB;
	Mon, 09 Dec 2024 18:05:25 +0000
Received: from mail-lf1-f51.google.com ([209.85.167.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKi6R-00000008prb-2Vmo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 18:03:28 +0000
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-540215984f0so987355e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 10:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733767403; x=1734372203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vt1eQkp9pAQVTjzNi7SG9xZxFIH63Nwe6vPPAcwIYGQ=;
        b=PZ+QnweVEG/34YSzCD2ItYUDvBYnQ2O5HQpjWO5HpBOJy96zRZG/uGTEC+RXKaEoOv
         J08EyQzHFpFmaX5ZjoD1R6xEjD3L2k2fno5XOkkwjlRaB/0zwI2mj8MBQzixQWmY8sKY
         qx0JjJPpGBtqYEp//stokabzyDaOJGTJln2605I/8HESxVPkWY/xGvAUx4onpmUVuHGk
         mM9I5N7XExnv0TCn0tw1nbUFLHXFzfbQpsCIfHQnvCl442yQbyEaC8/yX1YKNWVYp+Tp
         FmmNlpdeOfnIVv2ku4ZF2mO8KNbOzveZi3R/OFBV286Kx9M8m3cM/9xfR/ERtmi0gh2s
         AE5A==
X-Forwarded-Encrypted: i=1; AJvYcCUlpXWtQvC+Qdk8ESTWPMsQ6nv7eH4z12e2lZd1tvXhl0PMpR+GHg4PjQ+ud3q24JJvEmpImvFH+RTPOBgqTv06@lists.infradead.org
X-Gm-Message-State: AOJu0YwfAW3I09LydGfVpBAvnqASg78QCU6jYl1P+SoR+TUhu+PIoKUq
	XPVfNrowjcYs6ir+bYgFN3Vbr0+pzocVmRblWstkF7V4eQJdkCumGRWEQg==
X-Gm-Gg: ASbGncsORJi/Pd7z1297Fe+VHx1rMUmzOrccF82NCJ5+h6eq4IgSPl90EF9ZmCsSaoy
	AQLE8OiJ/OYIWo+791Wvg1onYn6puz3N4rbC2wxGz/oc0sbplDj/VtFKNO9V9z9R+cN/VKwdF9C
	YB2jXtNnaSy0T9O05V2/Yd0UhaMEipUxDLiI204qMZS37/LiQ1Wri95maS6gaaLgmNl0NHel7wR
	bzY3dcGS2fQqU+ziwR+/CE0eidNJE8DolBkDS9gGyK0mOXAArId8QZA/NZZu7OFroMBmukeNm6y
	JlCYQlM=
X-Google-Smtp-Source: AGHT+IGXgy50Qi9cHsbk7SCWwonCn9+DdrYRiXMsKKPDFPhHBfPLF1ROONA2Qyo6hK9UHD6xt501vA==
X-Received: by 2002:a05:6512:1391:b0:53e:3a49:e6e8 with SMTP id 2adb3069b0e04-540240aacdemr624172e87.1.1733767402772;
        Mon, 09 Dec 2024 10:03:22 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e39579e47sm957329e87.30.2024.12.09.10.03.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 10:03:22 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so42586211fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 10:03:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqC6inyOxSaj56Mf1JvJubeBWVEpZpwDFhy38Do3sNwDL8ntv0kvGbnZ9jU1l1l1ZtbFIp5w1I0TWOIYaaQTEZ@lists.infradead.org
X-Received: by 2002:a05:651c:509:b0:302:2cb3:bb25 with SMTP id
 38308e7fff4ca-3022fd7da65mr6276521fa.29.1733767402058; Mon, 09 Dec 2024
 10:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
 <20241205000137.187450-2-csokas.bence@prolan.hu> <20241209175637.283312fa@donnerap.manchester.arm.com>
In-Reply-To: <20241209175637.283312fa@donnerap.manchester.arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 10 Dec 2024 02:03:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v644AgZvuOmvQCUXGWyJWYCgVnCkVohNdD-Z0FhgOrp1cQ@mail.gmail.com>
Message-ID: <CAGb2v644AgZvuOmvQCUXGWyJWYCgVnCkVohNdD-Z0FhgOrp1cQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: suniv: f1c100s: Add support for DMA
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mesih Kilinc <mesihkilinc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_100327_636974_07DEE76E 
X-CRM114-Status: GOOD (  16.83  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2024 at 1:56=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Thu, 5 Dec 2024 01:01:36 +0100
> "Cs=C3=B3k=C3=A1s, Bence" <csokas.bence@prolan.hu> wrote:
>
> > From: Mesih Kilinc <mesihkilinc@gmail.com>
> >
> > Allwinner suniv F1C100s now has DMA support. Enable it under device
> > tree.
> >
> > Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> > [ csokas.bence: Rebased on current master ]
> > Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
>
> Compared against the manual:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

These have already been merged. I picked them from their original
series.

ChenYu

> Cheers,
> Andre
>
> > ---
> >  arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/=
boot/dts/allwinner/suniv-f1c100s.dtsi
> > index 3c61d59ab5f8..290efe026ceb 100644
> > --- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> > +++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> > @@ -6,6 +6,7 @@
> >
> >  #include <dt-bindings/clock/suniv-ccu-f1c100s.h>
> >  #include <dt-bindings/reset/suniv-ccu-f1c100s.h>
> > +#include <dt-bindings/dma/sun4i-a10.h>
> >
> >  / {
> >       #address-cells =3D <1>;
> > @@ -159,6 +160,15 @@ usbphy: phy@1c13400 {
> >                       status =3D "disabled";
> >               };
> >
> > +             dma: dma-controller@1c02000 {
> > +                     compatible =3D "allwinner,suniv-f1c100s-dma";
> > +                     reg =3D <0x01c02000 0x1000>;
> > +                     interrupts =3D <18>;
> > +                     clocks =3D <&ccu CLK_BUS_DMA>;
> > +                     resets =3D <&ccu RST_BUS_DMA>;
> > +                     #dma-cells =3D <2>;
> > +             };
> > +
> >               ccu: clock@1c20000 {
> >                       compatible =3D "allwinner,suniv-f1c100s-ccu";
> >                       reg =3D <0x01c20000 0x400>;
>
>

