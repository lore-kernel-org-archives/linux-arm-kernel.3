Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85F8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=; b=DjEB2OKGcmosfhXULel+rFCzLG
	ckHaWVWcoUqo25mcW8il+gCpCqvdNhmNCursg/SpW/q4p498LXqDH/tXdwFmxHtkP/+rpTwd+XR7S
	8SWUhge/iD7rohInlqQRDKGMj6lYVzMc7fEbDQV3i/RYQWm7bPymejd2TKzFT1KWkiU+dBoKSazZj
	TQ7jLCdmHftETs8v96tniTvhihV2myn9pW5XDJsvQW3+/vvc42YrbNE0oRv2T3Y5tht9PGTk/n8Uk
	PzMGCIeiuPXSEyHsJn+GPUHU5bX3/Mg4EPRNTSxlZ9G2ifDFvwgDpemkv+9fB9azDRve8kx0XjWtW
	9f9cH9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj8V-0000000GDd0-1qmO;
	Tue, 12 May 2026 09:10:43 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj8T-0000000GDbc-14HO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:10:42 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so5288945e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 02:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778577039; cv=none;
        d=google.com; s=arc-20240605;
        b=ZS3XcFuCRuz4vnKfNrm72QgXBxJ45cdR3CODhXjlgqUhKv4Qr5tR3jHVqZAlo2uXS5
         aYUhpWcx1x/j3lgoZV4ckSH1+3CDo4WtUmy/WVy4Dey6N/alG0QGiaTDuxUP/DCBXusR
         8vs6M2KBdNRx4zpMp/RpKIP7zzc4dEHQ1ncIbmeHwXtz3BP3dgJx45y+sKZUkY8XDNMf
         mOQ5gacN7CHpSMVwbGz4HuRfr1QoaWJT2Wvzv2QeM25SBVDNa7xhVWcV2QnwlLECwhmU
         gJ3oEVN6o5c7qPjYET+iWFL7aScSACOES2aTTnGBWGZQQ+FPp0V0h5QGpdLLp4QUc3Xb
         DLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        fh=MPGcOLpVe+So3AhiyINzTNFJXAV1I1l9SLfWrjTTZF0=;
        b=hbUgmK6hEIcLFNw4ahwlQOypgylw4GfZB3O3K9qhuQ3Gr2NTazOIjQXBUp9f8khxlw
         qQZs+jYbjAPOcENXVkmn5QCmlwveGuj/Jlk9pYxpWCJMGRnKa7OmHy6auELMQSCo0oVa
         x/M8aZ16PsO/f1T0XX1Cj7LakmyBzuYlUgEMSvanvBVVzKUmQvr6qMff/Y7DCX7R4x6k
         WTmiswnLhdE4WCMPukBCmiD9nkUmWlO2x0fX9QougYdFycHdhEVo7dD5w5H/hKVb/R3o
         gHrSghFGTpiEwlsmOKsoZcRBNrKz/NP79ayWNgApO+V/L7AXakXAqlZKZLWsf515Sunj
         GdCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778577039; x=1779181839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        b=aPKDLQgx9wOlRuBxL9vlKUK55eljcqEDbP2mQyJrpR9TmRXls1KQhE9NbFsry8MH3b
         WReSjcwiJbcCm1PJ2CrcnIxBMMpGHUCq2b8ie+1Uuvnp82EGLfUVFYWHZEQz0FmjDJ4K
         xg6YlGSKdqcZ5oHe4SnBswr7qo7uSuQFBtCng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577039; x=1779181839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        b=mIShqZPghoKEnOjDziWIYWHGuDD7bOyS7Ggb7lebGUzZeyoqMm3dL9F0xaE+djmRxD
         3d7aAOqleHhp+N2qmt7nH9fU8zl5gAXWbJsaZcfhrLAAJrvRf5r1KZy2aqNCpkWjpkPY
         6FvOH82t/j+6RzJe/dMJ6uf5D6hEgwBoeRJqofzlufK44qC8ccP31AQ5TJt92xegzilo
         NJTNGVjTrQHouuBVfgXHIYOkdqQ12IT9KYTc4xTi3i5fauJl/oyfHz+9I/D7rLFBtNvR
         UNmLJUOxTrm1/ipH+lA4OwB4QBuYi0/0Ma6IqgefCAksgFFybNxqjVQc0gwDl9MCo9mR
         Nv7g==
X-Forwarded-Encrypted: i=1; AFNElJ/5Z1rESmFkHNebj7Lr+rkbJpsrImEIv30Vem9jl6aAF9qRonPFCGd+rrfXxHvRIf0pZ5NbX2zfV+gO6GTIs9cQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyttZUzoMdk+R4VpFpliU7SMFbm7PCg6RzInsHI7egPkuRq/xPr
	26orbKuDEGZy1fcDms+/vETPI0kxoWP/sLJhW/WsKtMuwN6HGOVcZlWP6FNX4eNylzdVDW7llPg
	1t6w6XfeaXKNcIf0kNbpKTPb9OIzaptp28wF9SVwW
X-Gm-Gg: Acq92OG2d2sBNctMQ7wkMS/c0Akcs7zAqFF3qhGI7QK5LrK1Pi5x30sGh97gWnWr+8Y
	i8hz2EQed4DxUzbKjJkgmNKa5LrXM72jXSsovjJ9lIfgluD8mHyDxV2A3T+OaB6X7VhdyZMBf2P
	VFya5LCJvmr1ZBZ+D3m9LMkiyoNEIxuFSy86dWU/4bjRLA+Gx/6MZif8d7RX+O4+kQyGP0fFG/I
	ggwtxz4q7jw27yKXsObfcKSLYfjMoeDnRIGGlOsZRNuilt3lmMMTdd1xQCY1fva7zxMHIsu6DbF
	2vTP/E3l0/Ne1bLkYZ7EPJuKPkLRITDcpezNSQ==
X-Received: by 2002:ac2:4f03:0:b0:5a3:cc81:eff3 with SMTP id
 2adb3069b0e04-5a8e31e792cmr741475e87.26.1778577038810; Tue, 12 May 2026
 02:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
 <20260504072748.2580172-2-zhengxingda@iscas.ac.cn> <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
 <4a43edb8c7ae3f96f77272db89ec6450ffa28876.camel@iscas.ac.cn>
In-Reply-To: <4a43edb8c7ae3f96f77272db89ec6450ffa28876.camel@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 May 2026 17:10:25 +0800
X-Gm-Features: AVHnY4JpFJ80xfcJKb4R3fVCclO5uQOrLLkEvtBAuF9RxcpiffXxdfYLmlfODZk
Message-ID: <CAGXv+5HFD_8e7odEwXk3vXZThBAor0PvVCbb+=wjR8gxwqwnqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8188-geralt: enable Wi-Fi card
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Liu <hui.liu@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_021041_355247_FCD6852A 
X-CRM114-Status: GOOD (  32.97  )
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

On Wed, May 6, 2026 at 10:14=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> =E5=9C=A8 2026-05-04=E4=B8=80=E7=9A=84 15:34 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng
> > <zhengxingda@iscas.ac.cn> wrote:
> > >
> > > The mainline pcie-mediatek-gen3 driver does not have code managing
> > > downstream device power / reset.
> > >
> > > As the Wi-Fi card on ciri is a fixed device, set the related
> > > regulator
> > > to always-on and use GPIO hog to set the status of its reset pin.
> >
> > The plan now is to model it as an M.2 E-key slot (even though the
> > chip
> > is actually soldered on the main board).
>
> Interestingly I saw a "PCI_PWRCTRL_GENERIC" driver in 7.1, although it
> does not support toggling #PERST now -- maybe this should be done and
> used instead? (Well it looks like the driver had existed for some time,
> but it was for "slots" previously)

#PERST currently is still left to the PCI controller drivers, since some
of them have dedicated functions for it, while others use the GPIO API.

If you check the history of the "PCI pwrctrl framework" [1], you will
see the design choice.

[1] https://lore.kernel.org/all/20260115-pci-pwrctrl-rework-v5-0-9d26da3ce9=
03@oss.qualcomm.com/

> Thanks,
> Icenowy
>
> >
> > I have some of the patches ready, but I'm still working out the USB
> > side of it.
> >
> >
> > ChenYu
> >
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > index 8e423504ec052..c25780098103b 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > @@ -544,6 +544,11 @@ &mt6359codec {
> > >         mediatek,mic-type-2 =3D <2>; /* DMIC */
> > >  };
> > >
> > > +&mt6359_vcn18_ldo_reg {
> > > +       /* Used by WLAN */
> > > +       regulator-always-on;
> > > +};
> > > +
> > >  &mt6359_vcore_buck_reg {
> > >         regulator-always-on;
> > >  };
> > > @@ -1145,6 +1150,12 @@ pins-en-pp3300-wlan {
> > >                         output-low;
> > >                 };
> > >         };
> > > +
> > > +       wlan-reset-hog {
> > > +               gpio-hog;
> > > +               gpios =3D <145 GPIO_ACTIVE_HIGH>;
> > > +               output-high;
> > > +       };
> > >  };
> > >
> > >  &pmic {
> > > --
> > > 2.52.0
> > >
> > >
>

