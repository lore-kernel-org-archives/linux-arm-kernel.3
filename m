Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB68CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XA/rGkqw3N7PVH4gFdLuRaD7H9TojqRrEXcECrcqYbg=; b=qJTU72oKoRDz+r+TnY2LMERYmJ
	escbFclj09qp2ic86Hu5Q65nVUP/385ECkEB8UaFhoc5alMU1gZ7QfkUacpDj2nu1/AWIh2hApIJY
	t+xnAMC2IghLc2eo+ljFAomcKYRkSsTtYAfZZgEcyeMnxj7U21YEr8EjVYUhkEkDOoFKgVX1iqDjC
	EsepvXnQIzlP5nEx6gFXoZWy+/17lA6e5Lc5vc0vIN2ezEBYakXa2pc6drTPF2sArh2iuVL/NWvnZ
	rq0Gc/5gudXb3t6WS0cXndYyygyeC+Bj5gFfoEwo4g9wS4zhjjleTAX4b550AJY1NusRfqw/8qMmZ
	yN0ucmmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vz1-00000000kmQ-1pDG;
	Wed, 15 Oct 2025 07:31:39 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vyy-00000000kkt-1plE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:31:38 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-36a6a39752bso58341841fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 00:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760513494; x=1761118294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA/rGkqw3N7PVH4gFdLuRaD7H9TojqRrEXcECrcqYbg=;
        b=KFlEr25yzFmPEPH3hrk1XXJSKKxOSl2JIeysNaO+ubrf7706Pv7W8Qw0KBEeVCrmBf
         D5fnDbqYSL0SMHgW34gmbLn9ZVfgwsz6to+E8vGa8ht8OyIZ/x0f98U+kneN66J/X8m5
         s4IEaYxmz0AFeuXTnwB9oS4wOj3Ht2/FQHw3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760513494; x=1761118294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XA/rGkqw3N7PVH4gFdLuRaD7H9TojqRrEXcECrcqYbg=;
        b=cihKVVrTFcdAKofhgW5E5d93MxYoo+LSPIxLrM7Xtvt7jytO1OZ2XOVRtsWuPVQ035
         uStlQidWZWHOqdNBB9JamHbfAVAxndxJUCFJB0oBEp5OJLiERqCES6iNSbWe4w5Oz+/i
         pUSoXXOYtbldIsEgmrmrYkIOnsndOlzGVVGgKJCfIm1O7X4mmI38V7RGFglUSpAHw/RA
         kn9Cszb7t0EXbzXQ6UVs/aO7TDsFXBZn3X+JZnloPArR1BA35BQXLwunaog+mXippEEv
         S5TQ2drBm5qOWtxtu4e2uPRVR1FDFBmilIe09zb6CHHyODK07mH5IKY+06Ve7ymarPnh
         dNpw==
X-Forwarded-Encrypted: i=1; AJvYcCUcVZ84gmWuX5fsP1A9uEcrpSXmcTS5i8nqN3Jigith7YQH2e/fYbPZ/CWpRDJEx5oL3rqYoLQ2mbKbNCUse/ap@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqq94Oqt3kE+UcsfAo/fFps4OuKQKvYzT/MrBmFDL1lwgDkMdd
	plBVYesfYOe7wZ81rzolk57HZ7RTGTI/gg0yA0SDwSJyxeWpWJTtOGYZdFeWpzVj7It73Gn/iY9
	pcRsfy2WUN8W2bfcBmkCHIVKHrELEQSfLl90/hpxZ
X-Gm-Gg: ASbGncseo8uTjaQbLJ+Qk1Wxu9eMYrGf9X8/udwnPqkFjHZHa0obIGeRsN1pGLhBu40
	Tw3bTuxPETXQ4N/nQI7pCGVQF9FIrJTuPgyDWfiU8N/f45mFVYSWFv1Y3zlJ4LX7exG26Njvhjr
	C3mFeF/Dw8e/0MTGdokxJ4c0ELeCLpM7bgPqkH4Z7ihYmYpR0JrjQbWP3UKTzCp+MnNgsIB7Wx9
	IYYySyyWXUHBhBdjGU3FKXyA4SpA1p/9y4zzIP9HZjowIqeD/4PVbK4L0r5Ga32HdEMuyDyw/L1
	4g==
X-Google-Smtp-Source: AGHT+IGix7SiLyiT/iVo280/TBO4WaVIjuGiYnKRmsDHJTLJH8R+MNxCQXl3EtGV1sD7rAb12vm7OwOdCHylb5Oip9A=
X-Received: by 2002:a05:651c:3608:b0:364:f7e2:3908 with SMTP id
 38308e7fff4ca-37609e0fbbcmr72211741fa.26.1760513493816; Wed, 15 Oct 2025
 00:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250814092510.211672-1-wenst@chromium.org> <b20a1c7d-0da5-433b-987c-f55a5a229bed@collabora.com>
In-Reply-To: <b20a1c7d-0da5-433b-987c-f55a5a229bed@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 15 Oct 2025 15:31:22 +0800
X-Gm-Features: AS18NWDz5vKCVYo2LSqzyJIsi9qNL-WB0jpDYaeMQh-Pcz5jywfjijzblwQFm7E
Message-ID: <CAGXv+5EPd5hLSNTFYkBWPCL1Bq4CJN4R7v5ZWtoRMYSi9+TeCA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_003136_529906_86C3BBF4 
X-CRM114-Status: GOOD (  18.59  )
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

On Tue, Oct 14, 2025 at 9:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 14/08/25 11:25, Chen-Yu Tsai ha scritto:
> > The first SCP core is used to drive the video decoder and encoders.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Added SCP vreq pin
> > ---
> >   .../boot/dts/mediatek/mt8188-geralt.dtsi      | 25 ++++++++++++++++++=
+
> >   1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index c5254ae0bb99..7fedbacdac44 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
> >               #size-cells =3D <2>;
> >               ranges;
> >
> > +             scp_mem_reserved: memory@50000000 {
> > +                     compatible =3D "shared-dma-pool";
> > +                     reg =3D <0 0x50000000 0 0x800000>;
> > +                     no-map;
> > +             };
> > +
> >               apu_mem: memory@55000000 {
> >                       compatible =3D "shared-dma-pool";
> >                       reg =3D <0 0x55000000 0 0x1400000>;
> > @@ -1077,6 +1083,13 @@ pins-bus {
> >               };
> >       };
> >
> > +     scp_pins: scp-pins {
> > +             pins-scp-vreq {
> > +                     pinmux =3D <PINMUX_GPIO98__FUNC_O_SCP_VREQ_VAO>;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> >       spi0_pins: spi0-pins {
> >               pins-bus {
> >                       pinmux =3D <PINMUX_GPIO69__FUNC_O_SPIM0_CSB>,
> > @@ -1146,6 +1159,18 @@ &postmask0_out {
> >       remote-endpoint =3D <&dither0_in>;
> >   };
> >
> > +&scp_cluster {
> > +     status =3D "okay";
> > +};
> > +
> > +&scp_c0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&scp_pins>;
> > +     firmware-name =3D "mediatek/mt8188/scp.img";
>
> After a (very brief) discussion with Arnd last time, turns out we decided=
 to avoid
> using the firmware-name property, including for mtk-scp.
>
> Please resend without firmware-name.
>
> P.S.: there's a patch to construct the firmware name from compatible...
> https://lore.kernel.org/r/20250911140043.190801-1-angelogioacchino.delreg=
no@collabora.com

I'm aware of the patch, but did that get merged? If not then this would
cause it to default to just /lib/firmware/scp.img?

ChenYu

> Cheers,
> Angelo
>
> > +     memory-region =3D <&scp_mem_reserved>;
> > +     status =3D "okay";
> > +};
> > +
> >   &sound {
> >       pinctrl-names =3D "aud_etdm_hp_on", "aud_etdm_hp_off",
> >                       "aud_etdm_spk_on", "aud_etdm_spk_off",
>
>

