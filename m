Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6641CD5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6yWe4/NLA7+pMhnzpuf35J4OYCHyR3KA6ogeYDKvqs=; b=eObYg8LUSfEA2SAhwuMQRDw9FW
	FyStiSzM4im4sUPNsHs2r8gtDhmrPcvXhcWxZZhX7sj8VzVQ1gFX49Fz7njLjRt1o5qsxTS9Potoy
	BvNzIXAC9wH5hesC11C71jzrTkyQ0qEJWe9o4kFpl97JZktY5gAgjVaCxt5piLiESHAVY3I2zBCr0
	NIBzeyMVUxbFr3MgO7izcZdkPa+4iXjaW8FDw+gBjgB+kgC0dv1U5whxfshGkHryVBBGKoJAqSf04
	3+FsSBPN9bbhu4bKTnW4mjWCykI05seZMMlytUD1+fiPGXNXw9wJNBL+XY/cjMJNweMWtpVLzVPeb
	3Ehk547Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iDF-0000000DpC6-0Aba;
	Tue, 29 Oct 2024 09:08:29 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hyY-0000000Dlna-1wAP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:54:46 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-84fd764f6ddso2854117241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 01:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730191997; x=1730796797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6yWe4/NLA7+pMhnzpuf35J4OYCHyR3KA6ogeYDKvqs=;
        b=jAloryPO2UzwzXVJgVjQR+FvF8YUxToUcH/Mo6QtgHOxK8+eHAy8kCx0PUu+AHFKO6
         fSRMcSXXfiuYdRf8pd2BO1ZPrXh2z1tZuKZtj5Ufr08Z6bcHJEpKDlPRSPTm0vdpMxZG
         jz8AWH4sO0o6rb+0VdiyxSHsHXXkE0pSVu7ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730191997; x=1730796797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6yWe4/NLA7+pMhnzpuf35J4OYCHyR3KA6ogeYDKvqs=;
        b=jUU1tGfUC3I0738gvXwXE/fvieCR8mmyvkcyuPlZfjV6to3eiXcbZ2b/2sjd+swS5J
         GMSR8q4YGBfy1btmc1KtVwHDd4Dr/QTPWZF0dlHg6h3diz5lItSUyYSkOspJTdC/03B1
         E88iu3A61ZoYcBxLrq8YrSE63XnMFNe1vHj/7KHD/1Agd8ZgHanAxTQp+a1qo5Efm3oB
         mbxn2VNOMJzTS1trYXarUhExVNTJolyiZmO9XGYCGYwWiw5zsDPdX5S83LmV+rGBqlBW
         7zDqfG1e2a+hsnLRzePlKizLhCzxTY/kPPep045PFkTa3ZOtcexIlK1qjHbOQ80kOKMM
         QuYg==
X-Forwarded-Encrypted: i=1; AJvYcCVmgQqusxvwVpl2EbDNiN2pudNVUSv0GP2ICFZ6dw03JFZBaFckk8BFrW4qXOwE9bP0/sEqtUhNstbWdKvbS713@lists.infradead.org
X-Gm-Message-State: AOJu0YyjYzJP1TytOZJSGjBI/kq8zJtLaMbYP3wjTfGGHlPJ9ardHawp
	u6scepU//C4OQL6VWuXLwACzh8WJKbqKvrmN9N7KrEiqZi8qUtQClcZOe2BlBQno8SfCplm+3sc
	=
X-Google-Smtp-Source: AGHT+IGwyx9+bsr1pzaSozcuSB1xvdyuKu+x9uqg9ls0aFSL27GQpdYsp4p1ddzbtiyRp1x9FECw2A==
X-Received: by 2002:a05:6102:3b14:b0:4a4:8651:3c3f with SMTP id ada2fe7eead31-4a8f695d2f3mr407897137.0.1730191996843;
        Tue, 29 Oct 2024 01:53:16 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a8c5346fe6sm1298811137.26.2024.10.29.01.53.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 01:53:16 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-50d431b0ae2so3243810e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 01:53:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULv3NJq4/vdu8GFcogUwxmoT/VrjKqoQE1djjGprpmQWNrGLvThXj4ac2unOUR5Av38h7oTCl1+XAkTHazo7Fl@lists.infradead.org
X-Received: by 2002:a05:6122:1d53:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-510506f0f83mr526608e0c.0.1730191995625; Tue, 29 Oct 2024
 01:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241025104548.1220076-1-fshao@chromium.org> <20241025104548.1220076-2-fshao@chromium.org>
 <5vmfh2nkxtpzt2vk4j6ghro7z5stoyvry3enzoqepg6hjxqrho@fofs5cwa2iqq>
 <CAC=S1njPjtvhsc+voNK447wbQmRiN0xVDi-jgOmba4NLRiNi0Q@mail.gmail.com>
 <20c793fb-cfdf-4c05-a421-3eb623ff6df0@collabora.com> <5b55f75f2fc8a783bf2fdaeac80fd5954e16a2c8.camel@mediatek.com>
In-Reply-To: <5b55f75f2fc8a783bf2fdaeac80fd5954e16a2c8.camel@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 29 Oct 2024 16:52:38 +0800
X-Gmail-Original-Message-ID: <CAC=S1nizJHcvxG2-HO7MhwWup-o6SO0XBp1_OBN35SCtUW73iA@mail.gmail.com>
Message-ID: <CAC=S1nizJHcvxG2-HO7MhwWup-o6SO0XBp1_OBN35SCtUW73iA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add adsp
 and dai-link properties
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "krzk@kernel.org" <krzk@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_015318_559372_1CD37B3D 
X-CRM114-Status: GOOD (  68.53  )
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

On Tue, Oct 29, 2024 at 11:05=E2=80=AFAM Trevor Wu (=E5=90=B3=E6=96=87=E8=
=89=AF) <Trevor.Wu@mediatek.com> wrote:
>
> On Mon, 2024-10-28 at 15:25 +0100, AngeloGioacchino Del Regno wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > Il 28/10/24 12:10, Fei Shao ha scritto:
> > > On Mon, Oct 28, 2024 at 4:54=E2=80=AFAM Krzysztof Kozlowski <
> > > krzk@kernel.org> wrote:
> > > >
> > > > On Fri, Oct 25, 2024 at 06:44:41PM +0800, Fei Shao wrote:
> > > > > Add "mediatek,adsp" property for the ADSP handle if ADSP is
> > > > > enabled on
> > > > > the platform.
> > > >
> > > > We see this from the diff.
> > > >
> > > > > Add "mediatek,dai-link" property for the required DAI links to
> > > > > configure
> > > > > sound card.
> > > >
> > > > We see this from the diff.
> > > >
> > > > >
> > > > > Both properties are commonly used in the MediaTek sound card
> > > > > driver.
> > > >
> > > > If they are used, why suddenly they are needed? What changed?
> > >
> > > Nothing has changed. These should have been added altogether when
> > > the
> > > binding was first introduced. This patch is to fill the gaps and
> > > fix
> > > dtbs_check warnings, like I mentioned in the cover letter.
> > > I can add a line in the commit message saying it's to fix the
> > > warning
> > > in addition to the cover letter, if that's preferred.
> > >
> > > >
> > > > >
> > > > > Signed-off-by: Fei Shao <fshao@chromium.org>
> > > > > ---
> > > > >
> > > > >   .../bindings/sound/mediatek,mt8188-mt6359.yaml         | 10
> > > > > ++++++++++
> > > > >   1 file changed, 10 insertions(+)
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/sound/mediatek,mt8188-
> > > > > mt6359.yaml
> > > > > b/Documentation/devicetree/bindings/sound/mediatek,mt8188-
> > > > > mt6359.yaml
> > > > > index f94ad0715e32..701cedfa38d2 100644
> > > > > --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-
> > > > > mt6359.yaml
> > > > > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-
> > > > > mt6359.yaml
> > > > > @@ -29,6 +29,16 @@ properties:
> > > > >       $ref: /schemas/types.yaml#/definitions/phandle
> > > > >       description: The phandle of MT8188 ASoC platform.
> > > > >
> > > > > +  mediatek,adsp:
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > +    description: The phandle of MT8188 ADSP platform.
> > > >
> > > > And what is the difference between ASoC and ADSP platforms? What
> > > > are
> > > > they used for?
> > >
> > > I'm not a MediaTek or audio folks, and I'm afraid that I'm not the
> > > best person to explain the details accurately in front of experts
> > > on
> > > the list... I know it's an audio DSP but that explains nothing.
> > > MediaTek didn't provide a meaningful explanation in the tree or
> > > commits, and I want to avoid adding additional but likely
> > > misleading
> > > descriptions from someone who doesn't have enough knowledge,
> > > potentially causing even more confusing situations in the future.
> > > Plus, the same changes were accepted as-is in the past, so I
> > > assumed
> > > they might be self-explanatory to people who are familiar with the
> > > matter.
> > >
> >
> > The Audio DSP is a Tensilica HiFi-5 DSP, and it's a block that is -
> > hardware
> > speaking - separated from the rest of the Audio interfaces of the
> > SoC.
> >
> > The whole sound subsystem can work either with or without the DSP, in
> > the sense
> > that the DSP itself can remain unpowered and completely unconfigured
> > if its
> > functionality is not desired - hence, this is a board specific
> > configuration:
> > if the board wants to use the DSP, we use the DSP - otherwise, we
> > just don't.
> >
> > Regarding the two "platforms", in short:
> > "mediatek,platform" -> Audio Front End (AFE)
> > "mediatek,adsp" -> Audio DSP
> >
> > Now, you can either link the AFE DAIs to the I2S
> >
> > As for "mediatek,platform" - that's used to link the Analog Front End
> > (AFE) as
> > the DAI Link platform (so the path is direct to/from DL/UL DAIs to
> > AFE) or the
> > ADSP one as the DAI Link platform (so that the path is to/from DL/UL
> > DAIs to
> > DSP to AFE), but that - of course - still requires an AFE, otherwise
> > you cannot
> > get the audio out of the speakers or in from the mic anyway.
> >
> > > >
> > > > > +
> > > > > +  mediatek,dai-link:
> > > > > +    $ref: /schemas/types.yaml#/definitions/string-array
> > > > > +    description:
> > > > > +      A list of the desired dai-links in the sound card. Each
> > > > > entry is a
> > > > > +      name defined in the machine driver.
> > > >
> > > > The list is provided below. I don't understand why do you need
> > > > it. Your
> > > > msg is pretty useless - you describe what you do, instead of why.
> > >
> > > I think this is used to explicitly list the intermediate but hidden
> > > DAIs, but again, there's not much info about them unless MediaTek
> > > can
> > > explain more details and why they need a vendor property for this.
> > >
> >
> > Yes, this is used for exactly that... but I believe that we can
> > deprecate this
> > now that we have support for the "standard" `audio-routing` property
> > and for the
> > DAI Link nodes (examples that you can find in current device trees
> > are mm-dai-link,
> > hs-playback-dai-link, or any other subnode of the sound card).
> >
> > Specifically, those subnodes *do* require a "link-name" property,
> > which *does*
> > effectively contain the same DAI Link names as the ones that are
> > inside of the
> > "mediatek,dai-link" property.
> >
> > On MT8195, you can find both the subnodes and the mediatek,dai-link -
> > yes - but
> > that was done to retain compatibility of the device tree with old
> > drivers (so,
> > an unusual case of new device tree on old kernel).
> >
> > Finally, I believe that we can avoid adding that "mediatek,dai-link"
> > property
> > to the MT8188 binding, and rely on:
> >   1. Whatever is provided in struct snd_soc_card for that device; and
> >   2. Whatever is provided in device trees as dai link subnodes, which
> > would
> >      restrict N.1 as that's anyway describing card prelinks.
> >
>
> The "mediatek,dai-link" property is utilized to hide the unused dai-
> links in the sound card. By hiding the unused FE links, it can save the
> necessary memory and prevent conflicts where both the DSP and AP
> control the same AFE Memifs.
>
> This concept was first implemented in mt8195 as Mark aimed to avoid the
> need for a separate driver for different system configurations.
> With the introduction of DSP (SOF), if certain AFE Memifs are already
> in use in the DSP route, they should be excluded from the PCM nodes
> created for the AFE platform.
>
> At that time, we did not have a better way to handle these scenarios,
> so we made use of a vendor-defined property.
>
> It has been a while since I last kept up with the updates in mt8188, so
> I'm uncertain if the current mechanism for sound card description is
> sufficient for handling such scenarios. If it is, I agree that we can
> deprecate such a vendor property from mt8188.
>
> Thanks,
> Trevor
>
>
> > Cheers,
> > Angelo

Many thanks Angelo and Trevor for the information.
The audio-routing property is in place, so I'll check if removing the
vendor property makes any impact, and refresh the series accordingly.

Thanks,
Fei



> >
> > > Regards,
> > > Fei
> > >
> > > >
> > > > Best regards,
> > > > Krzysztof
> > > >
> >
> >

