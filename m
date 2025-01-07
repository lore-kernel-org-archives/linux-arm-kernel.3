Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC74E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 05:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l96aDxgtPyGtmhQmKxg5Ir9C+VzTtQ4ciP6aZGSnXTA=; b=gRZiNNpV+vWLm39L0qJYjv8Il2
	pbW8U7uXLbVX0OkhkUqcc4D0ykWjd+EREugU0INP7rtyxjziweWHegk3eZT+ZB6dwFSzdt3qvqOJi
	mAGAepLe+Ri6E57dxlAc8c9+ouA0Jjf+Ji/ZQTtlthRKptuqQHnAxir6L+M0mCkivNlg9mwSYa2S0
	ZE9Y5tiIG7rvD2w5GUGjsxMejI+F6qC/6wunClmOM5HExRneP/N3KJEkvCiVALvIalZWd2wm6+Tc8
	//9PN4vU0OTJkf+8Dz0JdGCvwSu6CEKyx6F1Ln6m6bIU6/6Psetb5bEzRGxM+bxkxwY+quXAxqu4c
	pjlwgJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1lj-00000003VzX-31DK;
	Tue, 07 Jan 2025 05:04:43 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1kQ-00000003VtR-2HEU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 05:03:26 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54026562221so16218217e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 21:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736226200; x=1736831000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l96aDxgtPyGtmhQmKxg5Ir9C+VzTtQ4ciP6aZGSnXTA=;
        b=fupKwAO8MBW+fSe6dK9BHLuiKkwK1RsB8rct+5KF//G4sdKlHhCG0QZdFmdNOOA5GA
         /WyDB3p1QzePPDES0Casxc2XhTPIeoEbT3P70MMbEjr3s0LcHgIzoPSoJfTJTaEUeIXH
         IgNUAPuaLXTR2ZxQLFrzitSoTg8skV8wL0YIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736226200; x=1736831000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l96aDxgtPyGtmhQmKxg5Ir9C+VzTtQ4ciP6aZGSnXTA=;
        b=dHO23rPVK8kYwBBWKVjtENTXiATSH8U2WvUII4de0BwDhJJ4x45r0MNDojjDZC6KAt
         8IJ3o1ZgWh60N+us6K+aNt93U+La7aN6gOOQkA7oaJdN7FElVjvu/CO+xYJYmlovG65C
         ISqahLxbYqwDMaTT8E/59oUpBYbuRWWxs7NNmTHQoc43ruvxaBuoHp5jOrkumf+wnxf8
         nLYnykW9AqKwtWK2D4Jfu3WACiWEpaAaU1tvtgEQxy4J9cXKfVlkUARb5hh5yqM0pOEV
         FNmQiJemPB9G2at1kiGtgk5swm7Hm2Ge3rgqYUe19733vsxVPbwx3ebYrqHgh2INHlUu
         gVUw==
X-Forwarded-Encrypted: i=1; AJvYcCXqcJNVrSeD++fW4egAc/hkY/Lg0K/SOsUujp06M2OA6YuWiukNt+Zx0dGvDJv5G1G7jsqAkle85i53E4oIuUCA@lists.infradead.org
X-Gm-Message-State: AOJu0YySoZQszV3BGwYSfzpOy2cDF0na4qXJUbzroA+1Q0TPfr8jy/XL
	J6xj6k97XCmEqAvzU24z3L1rUHEnOhtI/dNOV6/btfxmMl2h6skICW9k1a51uIRQTMnU6Tk74TI
	KkSyAdEbhWsdionwWUNanG7mMjkr1LF8yQnfa
X-Gm-Gg: ASbGncuV7umjoHB/SsmYzwQ9h856PlD6jIGt1OrohI1WMpJif6ggWxP4phj6EHLVoex
	f/2nWMSqkvwjn+FiFhaZElKZlim2MiY0QnazqCqO+qxf7iiHPr46OfvzXS58Ys389
X-Google-Smtp-Source: AGHT+IFuVqIzLmO0Yramox//ee4/O3h23KsvSyQuha2+kpZxvOtrGLzpdtD8WFdSLs2fPfAPih1M9PDh71qbUvNQtpc=
X-Received: by 2002:ac2:4c50:0:b0:542:28dc:a2b3 with SMTP id
 2adb3069b0e04-54229530148mr21627152e87.22.1736226199865; Mon, 06 Jan 2025
 21:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
 <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com> <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
In-Reply-To: <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jan 2025 13:03:08 +0800
X-Gm-Features: AbW1kva84os3VCZ6M58WLraDevj5vJ7ZZRyOV-JzVdUbyuXDzp4hplu0A48ga_8
Message-ID: <CAGXv+5E5L5nNCT54O+LW6DdaWifLuA46pXcRNpSw1okGUp+JFQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_210322_589714_A726B848 
X-CRM114-Status: GOOD (  30.71  )
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

On Tue, Jan 7, 2025 at 1:33=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Thu, Dec 26, 2024 at 04:30:17PM +0800, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Wed, Dec 4, 2024 at 3:22=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > >
> > > Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiri=
ng
> > > a dmic codec to be present for the driver to probe, as not every
> > > MT8188-based platform might need a dmic codec. The codec can be assig=
ned
> > > to the dai link through the dai-link property in Devicetree on the
> > > platforms where it is needed.
> >
> > A followup question about this. The DMICs on the Chromebooks are attach=
ed
> > to the PMIC codec's input side, which then converts the signals to stan=
dard
> > I2S and passes them out to the SoC through its AIF1. So the original co=
de
> > was somewhat incorrect, though it works.
> >
> > How should we describe such a connection, given that the MediaTek sound
> > bindings aren't a full graph?
>
> What you're describing is that the hardware topology looks like this:
>
> --------------------      --------------------
> |    SoC           |      |   MT6359 PMIC    |
> |        UL_SRC BE | <--- | AIF1   AIN0_DMIC | <-- DMic
> --------------------      --------------------

Correct.

> But that the dailink definition in the machine driver had the DMic codec
> connected directly to the UL_SRC BE instead, alongside the connection to =
the
> PMIC, unlike the topology above.
>
> My understanding is that the dmic codec was added simply to allow the usa=
ge of
> the wakeup-delays. From [1] it appears that DAI connections between two c=
odecs
> are possible, though rare. So the PMIC -> DMic connection description mig=
ht be
> possible in that way, although I'm not sure it brings any benefits beside=
s
> closer resembling the hardware topology.

I suspect we would want to keep the wakeup delays though. AFAICT they aren'=
t
the same number across the board (no pun intended), but actually differ
between devices, perhaps due to differences in the actual DMIC used.

If we don't want the full description, maybe we add the wakeup delay to
the PMIC codec then?

AFAICT [1] is basically hardcoding in the dmic-codec in a different way,
so basically reverting your original patch.

ChenYu

> [1] https://www.kernel.org/doc/html/latest/sound/soc/codec-to-codec.html
>
> >
> > > No Devicetree currently relies on it so it is safe to remove without
> > > worrying about backward compatibility.
> >
> > Removing it didn't seem to cause any issues for the Chromebooks that
> > do actually have DMICs. I suspect the only difference would be that
> > the wakeup-delays no longer apply correctly.
>
> That's my guess too.
>
> Thanks,
> N=C3=ADcolas

