Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FFBC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 02:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxHiP6wE+44HTiVLcySgvTPCMzauYzsKV7k/Cx73M/Y=; b=Pj1yOyxSRYEzROQkEFT5YJwWDm
	otefAeET9v1efHlfZaLSlL9BMTBWOmNZcINzqQfyvC7mQakuyphgO22Qjd3U+Ure3M8Vx03/j5v9z
	OaaSHzDnKWDZYnWWvtznt8udHjp+0p/PH9aArfaItaBGZhZ2zrgIS9qHSvIRUdAf9cEClD8ykRBsE
	iCZIgFau3Wr97PrYT5QI2/6tq7RNUKqnjRyO9wSvBajPjQIOIko4nSkXIdfJau79tieVzbuhKdOHH
	24c9C/rnG9BE7/3oc3FE/8paagwsO4r96j3sTXhoablC5yQ6tXju5FZfuMFWZn/DZVj09xHrKq2AR
	jXlfJ5Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEDZ-000000093BC-2MxF;
	Thu, 17 Jul 2025 02:19:29 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEB9-0000000932j-1xIR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 02:17:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55622414cf4so403509e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 19:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752718616; x=1753323416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxHiP6wE+44HTiVLcySgvTPCMzauYzsKV7k/Cx73M/Y=;
        b=Ie9F11usKpQTdQ7AOC8tMcdpimdiVFyCkRgaL4E3v6Ht6IlZsnl1gPykhWw4zE2qPV
         zppUTPE44/Gz60SrNhBx7Oi4tKlc5/VbBjJCU95HtFxRaSHgXW8DLpKv4DxPRIFj2Vyd
         vERMRoXH2TzBKVnv09TYvdycUk5XNTzX454aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752718616; x=1753323416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxHiP6wE+44HTiVLcySgvTPCMzauYzsKV7k/Cx73M/Y=;
        b=FnmqE4AGF1+HsKQZQzmgmJ54h68rg/6bBGjjzDszHciP3AOX4CFiQNFh/pfp5d1nCg
         apTK/tPOwz+OyIAVgyGlyyAbBh6Sf3e0tVXaUu72wDpI57bcxjj0wtKiCSwDFtBnWCAF
         0pQQ7cVDJ9el7s2A1CGmp/SBD0P3r2MH8xE9tVi1uQpQj+/yAZ08heEwW6DIQlaIrvzW
         pv5DytlduGk00OlW4yif8VemrVst+zg/KgtEEJnMsCsYLq2tlJWeQHxwz8idkimHceYL
         pgGhrDfDkzfGXsUWnFTUTB3NGMUA3oHFbOtoLtayj1xba0s0pv+KbJ1t0Fyz7W7CVVQ9
         m5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb5sZzk8gFYBJWlYGnUP4ayQneFdTJNpcg51q6Fda1OY2VA4PgumF+UlK3QBh7GBR8Bz1bGeo4Q+rL/188sWi1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/l8DYE+a8kfSGbxLrtHamPcvMgdJUO5jyrj6ENucyBCpAO9c1
	MW4raK0+LITKjC/mQtgaJHVjNlV1NkH/o83kDOHlCb06qyKqG8caLNS84Ff1PVP1i6i0YEfBmOP
	G4Ghsn3F3j/u1uE3g09BMsnZcT5JJCEKInLxdPFBb
X-Gm-Gg: ASbGncvnFOTiiChIg7YFezq6Q5WWtmaewMJZFjiQ4ZWAQU59xhA/kUYgIvbzUyBtxkK
	nSby46MaAu7a4JMzJIkwQlamGdTT0DVVQFW2JrycBiLF/TVzNtdnvTNotkgW1lD5jDRgfdW2DLA
	jpyD/C3Ez6M3WmP9ouTiRPPseRTaZk//DF7jvgstG/0MZRIzsotGIv7ig7UJIVCWVq7wFw1tXeK
	8Jae2FpOBelpLxtEX7wvDkJjA/UORg4gQ8UIg==
X-Google-Smtp-Source: AGHT+IHX6+PqYe7ISNqeiqU5iv6yi86yo/gru6nPWgWG5xiS6bt/CCj0f39af9hJfhwpJxYP0qrdsmQwdRgw6Yt/kWQ=
X-Received: by 2002:a05:6512:3da1:b0:55a:2735:fe6a with SMTP id
 2adb3069b0e04-55a27360094mr841505e87.0.1752718616192; Wed, 16 Jul 2025
 19:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-9-darren.ye@mediatek.com>
 <CAGXv+5EufDuxLMnwMaCqtWFZpVMNMxi-5OwCyO4a+KD2T+2NYA@mail.gmail.com> <e4e4cf154e9ea1a4f96a50f374e9f88fc27ca670.camel@mediatek.com>
In-Reply-To: <e4e4cf154e9ea1a4f96a50f374e9f88fc27ca670.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Jul 2025 11:16:45 +0900
X-Gm-Features: Ac12FXxJARBruEPXsOMEpzqrHcSUpNdXL9sZPsqgXaiJYCISBkZ3KcHBr2s5MUo
Message-ID: <CAGXv+5HDupifLWN-okQmzbgTV53X9Wwu6r9usFgiJEWc20AK1A@mail.gmail.com>
Subject: Re: [PATCH v6 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE
To: =?UTF-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>, 
	"brgl@bgdev.pl" <brgl@bgdev.pl>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, 
	"robh@kernel.org" <robh@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"perex@perex.cz" <perex@perex.cz>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_191659_546241_0801028C 
X-CRM114-Status: GOOD (  44.64  )
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

On Wed, Jul 16, 2025 at 9:41=E2=80=AFPM Darren Ye (=E5=8F=B6=E9=A3=9E) <Dar=
ren.Ye@mediatek.com> wrote:
>
> On Tue, 2025-07-15 at 13:09 +0800, Chen-Yu Tsai wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > Hi,
> >
> > On Tue, Jul 8, 2025 at 7:35=E2=80=AFPM Darren.Ye <darren.ye@mediatek.co=
m>
> > wrote:
> > >
> > > From: Darren Ye <darren.ye@mediatek.com>
> > >
> > > Add mt8196 audio AFE.
> > >
> > > Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > >  .../bindings/sound/mediatek,mt8196-afe.yaml   | 157
> > > ++++++++++++++++++
> > >  1 file changed, 157 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> > > b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> > > new file mode 100644
> > > index 000000000000..fe147eddf5e7
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-
> > > afe.yaml
> > > @@ -0,0 +1,157 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/sound/media=
tek,mt8196-afe.yaml*__;Iw!!CTRNKA9wMg0ARbw!iSiBwCYEjWdWSv25XRbl3ky3Niiw3nDp=
VY-fW1dxyp3eU5YDs0bbZXEgPUQ1_NInbxUIgyz3HJvf-xTH$
> > > +$schema:
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.y=
aml*__;Iw!!CTRNKA9wMg0ARbw!iSiBwCYEjWdWSv25XRbl3ky3Niiw3nDpVY-fW1dxyp3eU5YD=
s0bbZXEgPUQ1_NInbxUIgyz3HHUjHsuW$
> > > +
> > > +title: MediaTek Audio Front End PCM controller for MT8196
> > > +
> > > +maintainers:
> > > +  - Darren Ye <darren.ye@mediatek.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mediatek,mt8196-afe
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  memory-region:
> > > +    maxItems: 1
> > > +
> > > +  mediatek,vlpcksys:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: To set up the apll12 tuner
> >
> > Looking at the implementation, the configuration is just a fixed
> > value.
> > Can this be moved to the VLP clock driver instead?
> >
> I thinks it's not good to put it in the VLP clock kernel driver,
> because this value needs to be adjusted. Usually, it is set in
> coreboot, but it is hard to change later. Audio needs to adjust
> this value, so it's better to put it in the audio driver. What do
> you think?

It looks like just one fixed value, instead of needing to tweak the value
during operation? If that's the case I think it could be moved to the
clock driver.

> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: mux for audio intbus
> > > +      - description: mux for audio engen1
> > > +      - description: mux for audio engen2
> > > +      - description: mux for audio h
> > > +      - description: vlp 26m clock
> > > +      - description: audio apll1 clock
> > > +      - description: audio apll2 clock
> > > +      - description: audio apll1 divide4
> > > +      - description: audio apll2 divide4
> > > +      - description: audio apll12 divide for i2sin0
> > > +      - description: audio apll12 divide for i2sin1
> > > +      - description: audio apll12 divide for fmi2s
> > > +      - description: audio apll12 divide for tdmout mck
> > > +      - description: audio apll12 divide for tdmout bck
> > > +      - description: mux for audio apll1
> > > +      - description: mux for audio apll2
> > > +      - description: mux for i2sin0 mck
> > > +      - description: mux for i2sin1 mck
> > > +      - description: mux for fmi2s mck
> > > +      - description: mux for tdmout mck
> > > +      - description: mux for adsp clock
> > > +      - description: 26m clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: top_aud_intbus
> > > +      - const: top_aud_eng1
> > > +      - const: top_aud_eng2
> > > +      - const: top_aud_h
> > > +      - const: vlp_clk26m
> > > +      - const: apll1
> > > +      - const: apll2
> > > +      - const: apll1_d4
> > > +      - const: apll2_d4
> >
> > These are parents of the top_apll[12]. They do not feed into the
> > hardware directly, so you should not be including them here.
> >
> > > +      - const: apll12_div_i2sin0
> > > +      - const: apll12_div_i2sin1
> > > +      - const: apll12_div_fmi2s
> > > +      - const: apll12_div_tdmout_m
> > > +      - const: apll12_div_tdmout_b
> >
> > In the clock bindings sent by Collabora, these dividers are no longer
> > separately modeled; they have been combined with their respective
> > top_* clocks.
> >
> > > +      - const: top_apll1
> > > +      - const: top_apll2
> >
> > These two are parents to apll12_div_*, do not feed into the hardware
> > directly, so you should not be including them here.
> >
> > The clock tree for each audio interface clock looks like the
> > following:
> >
> >     apll1 -> apll1_d4 -> top_apll1 --
> >                      /               \
> >               clk26m                  --> top_fmi2s ->
> > apll12_div_fmi2s
> >                      \               /
> >     apll2 -> apll2_d4 -> top_apll2 --
> >
> > Only the final "apll12_div_fmi2s" should be referenced.
> >
> > On the implementation side, it should simply be a matter of setting
> > the
> > required rate (24.576 MHz or 22.5792 MHz, or some multiple) on this
> > leaf
> > clock, and let the clock framework figure out the PLL and dividers to
> > use. Same thing for enabling the clock.
>
> I think we have some misunderstandings. I will first draw mtk audio
> clock topology diagram, and then we can disscuss which parts can be
> optimized together.
>
> top_aud_intbus: as read/write reg clock source;
> top_aud_eng1/top_aud_eng2: as i2s bck clock source;
> apll12_div_xxx: as mclk clock source;
> top_audio_h: as afe other ip clock source;

And what about top_i2sin0, top_i2sin1, top_fmi2s, top_tdmout?

>
> vlp_clk26m
>         \
> apll1   --> top_audio_h
> /
> apll2

This shows that vlp_clk26m, apll1, apll2 are parents to top_audio_h.

>                 vlp_clk26m
>                      \
> apll1  --> apll1_d4  --> top_aud_eng1
>        \
> clk26m --> top_apll1
> \
>  --> top_fmi2s --> apll12_div_fmi2s
> /
> clk26m  --> top_apll2
>        /
> apll2  --> apll2_d4  --> top_aud_eng2
>                      /
>        vlp_clk26m

This shows the parents of top_aud_eng1, top_aud_eng2, top_apll1, top_apll2,
and apll12_div_fmi2s.

My point is that all these parents should not be referenced unless they
also directly feed some input to the AFE block.

> vlp_clk26m -> top_aud_intbus
>
>
> >
> > > +      - const: top_i2sin0
> > > +      - const: top_i2sin1
> > > +      - const: top_fmi2s
> > > +      - const: top_tdmout
> > > +      - const: top_adsp
> > > +      - const: clk26m
> >
> > Is this one directly needed? It is similar to vlp_clk26m, and I
> > suspect
> > only that one is needed.
> >
> vlp_clk26m belongs to the VLP clock domain, and clk26 belongs to the
> system clock domain;
>
> top_apll1/top_apll2 can only select system apll1/apll2 or clk26m, they
> cannot use vlp_clk26m;

Yes. What I mean is that clk26m does not directly feed the AFE block.
If it does not directly feed the AFE block, it shouldn't be listed.

So please think about the modules in the AFE, and the clock gates in
the AFE block; think about what "external" clocks feed into them. Those
are the ones you should list.


ChenYu

> BR
> Darren Ye
>
> >
> > ChenYu
> >
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - memory-region
> > > +  - mediatek,vlpcksys
> > > +  - power-domains
> > > +  - clocks
> > > +  - clock-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    soc {
> > > +        #address-cells =3D <2>;
> > > +        #size-cells =3D <2>;
> > > +
> > > +        afe@1a110000 {
> > > +            compatible =3D "mediatek,mt8196-afe";
> > > +            reg =3D <0 0x1a110000 0 0x9000>;
> > > +            interrupts =3D <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +            memory-region =3D <&afe_dma_mem_reserved>;
> > > +            mediatek,vlpcksys =3D <&vlp_cksys_clk>;
> > > +            power-domains =3D <&scpsys 14>;
> > > //MT8196_POWER_DOMAIN_AUDIO
> > > +            clocks =3D <&vlp_cksys_clk 40>,
> > > //CLK_VLP_CK_AUD_INTBUS_SEL
> > > +                     <&vlp_cksys_clk 38>,
> > > //CLK_VLP_CK_AUD_ENGEN1_SEL
> > > +                     <&vlp_cksys_clk 39>,
> > > //CLK_VLP_CK_AUD_ENGEN2_SEL
> > > +                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
> > > +                     <&vlp_cksys_clk 45>, //CLK_VLP_CK_CLKSQ
> > > +                     <&cksys_clk 129>, //CLK_CK_APLL1
> > > +                     <&cksys_clk 132>, //CLK_CK_APLL2
> > > +                     <&cksys_clk 130>, //CLK_CK_APLL1_D4
> > > +                     <&cksys_clk 133>, //CLK_CK_APLL2_D4
> > > +                     <&cksys_clk 80>,
> > > //CLK_CK_APLL12_CK_DIV_I2SIN0
> > > +                     <&cksys_clk 81>,
> > > //CLK_CK_APLL12_CK_DIV_I2SIN1
> > > +                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
> > > +                     <&cksys_clk 93>,
> > > //CLK_CK_APLL12_CK_DIV_TDMOUT_M
> > > +                     <&cksys_clk 94>,
> > > //CLK_CK_APLL12_CK_DIV_TDMOUT_B
> > > +                     <&cksys_clk 43>, //CLK_CK_AUD_1_SEL
> > > +                     <&cksys_clk 44>, //CLK_CK_AUD_2_SEL
> > > +                     <&cksys_clk 66>, //CLK_CK_APLL_I2SIN0_MCK_SEL
> > > +                     <&cksys_clk 67>, //CLK_CK_APLL_I2SIN1_MCK_SEL
> > > +                     <&cksys_clk 78>, //CLK_CK_APLL_FMI2S_MCK_SEL
> > > +                     <&cksys_clk 79>, //CLK_CK_APLL_TDMOUT_MCK_SEL
> > > +                     <&cksys_clk 45>, //CLK_CK_ADSP_SEL
> > > +                     <&cksys_clk 140>; //CLK_CK_TCK_26M_MX9
> > > +            clock-names =3D "top_aud_intbus",
> > > +                          "top_aud_eng1",
> > > +                          "top_aud_eng2",
> > > +                          "top_aud_h",
> > > +                          "vlp_clk26m",
> > > +                          "apll1",
> > > +                          "apll2",
> > > +                          "apll1_d4",
> > > +                          "apll2_d4",
> > > +                          "apll12_div_i2sin0",
> > > +                          "apll12_div_i2sin1",
> > > +                          "apll12_div_fmi2s",
> > > +                          "apll12_div_tdmout_m",
> > > +                          "apll12_div_tdmout_b",
> > > +                          "top_apll1",
> > > +                          "top_apll2",
> > > +                          "top_i2sin0",
> > > +                          "top_i2sin1",
> > > +                          "top_fmi2s",
> > > +                          "top_tdmout",
> > > +                          "top_adsp",
> > > +                          "clk26m";
> > > +        };
> > > +    };
> > > +
> > > +...
> > > --
> > > 2.45.2
> > >
> > >
>
> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
>
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

