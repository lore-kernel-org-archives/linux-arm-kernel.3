Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F6ED2E02E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 07:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLD+VL6KxaJNpLbOdAPh6PBCjAs3r0xZd7BY2IsaVLQ=; b=L/nAiyIkQGos1TVpCUyIeaRmgx
	lwSF8KBoZ4I5AXb1U5mQwDZ7ZT3BAaVZ0L29hIxRo1dMSo5CU90N5TEDpdz11eOJU+XtVyMW5i+T8
	OZfcOhoVCV1Zqg134zEK9ueI1A9c+vGUJVhSzadwYBrfuuIbQUEcl7eiK5vm9KM+K+Jp6Hnuwr3Iw
	XBUYWaPmiEr+YWJmD4Jo35BUnUQQatYmkOlje3zvdAbovYv9AtagH43Kk0cg0GRh+QRMUYoaedhy3
	Tus7jqMrsSQ6QPTb+csnXESeNzJ2VYfnQWGZX0djpuzLgK+N8WrntAHFSSERI8nhaVpptxsT5xa0e
	05/mqP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQgy-00000009BjU-3ZYM;
	Fri, 05 Dec 2025 07:57:28 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQgv-00000009Biu-2XPn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 07:57:26 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so2743804e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 23:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764921443; x=1765526243; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLD+VL6KxaJNpLbOdAPh6PBCjAs3r0xZd7BY2IsaVLQ=;
        b=ZWQ6gm4WwhxfkqOTM0bDSD0EmkG31xQOrwl5Ay62pJN6zI01Vk3xHCDDYxIQZdu96w
         aLmrlFs2dj+5U+bKDKA5HsurUIN2xErZ9zqqx3Ok8OKplXozNulqcAh+48+nqL7gZKlU
         0GzeEUritxCuvacdlvGO+pmE4gJiHiHJrR0iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764921443; x=1765526243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SLD+VL6KxaJNpLbOdAPh6PBCjAs3r0xZd7BY2IsaVLQ=;
        b=Ctil+5iMTWoDRDvXIsoz78h0M+KHVxfiaeTQhlqFsXaMpo/dC3DArqFDrDwYp5wwZ8
         Lh0BF8DLSSwhety7USoZ8A+5aE0sb+wVHhrySiCMovIfDZADtnMlloNuyfS9XRbuhPsg
         WYwfSHZPAaIx44bwlngPSD4bS2P4Xv9jattXkgb2cZoYMsl4IrIHSp5V3vzDrO3O1GTq
         3NzvlB0EV6QGvcCpeYl+Tlt71EoXvC/8CYuuVnIZHu9hJbr+HILXM3gKK3itrpxh8xNB
         2fDTsPZ0B3lJarid00W1O6NQoY3OrzHjU9LovXqft8o8uiCDhnB46pLUamFMxq06u7WI
         b7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcIDL0eqzFvHhSW9fXOFcLyD+H4gKCnpaKy3830rej3vrW51Z6guioD0udHv1UzON60ze630ybrW3D7JiYIxwT@lists.infradead.org
X-Gm-Message-State: AOJu0YyDnnUeclbcHDbaJkDShDWcmVif4jstpUR48Ih6Zix4YCLTSX7k
	cnXq2ro6K8qYVluR/aXcd4LroY2Ti079q4XW53L6nSwqIBh3EwvdaNWSOwtP2664oL9SPwtGMNc
	6W8va6mKHVk/AlWqsjfLZ3d283EnmBd37bpQ2oPT+
X-Gm-Gg: ASbGncsb37yn8s9SppHPipDH4m5KPL1StOkqvivhsjbTklGfoozNOFlpKjZ50UKpooD
	egTT8akTKwUgeBnnPglS+d18iWQP5/NP9ljzRZrdn8LS32sbu/3tJPd37eid/iqimeEOhewK8xc
	lrVf4BcBUq8+jITnbzOoGoULw1HCGub+xcnYJ6Cvcn7dHITt4A4nLBcUR+dFn54l65F6ejm6Z+n
	YWq1+tWvqUknxxIyTA4u8KHY1K1Q+OZTQPu7NEnPe+gBmrZoBU+ECwIYjIth/kA4G0tYAOqg6n9
	Pg2T/a/ViAyRX9FTvw9rAzdD
X-Google-Smtp-Source: AGHT+IEpuCs/7c2leWW5Fv2G0gCbsdyCo98UVmtlRB6eHIxhmqgN9otJElNisDv5KbMphc2+s2OcSCWG2ig6PuULtVM=
X-Received: by 2002:a05:6512:3f1b:b0:596:b1bd:cbe4 with SMTP id
 2adb3069b0e04-597d63eab9emr2191700e87.8.1764921442858; Thu, 04 Dec 2025
 23:57:22 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
 <CAD=FV=X5=AK4XMANv+fatn3d9Y5vo9AXsHWb_47HmNaMWUtMwA@mail.gmail.com>
 <CAGXv+5HyMYgKmLc+jmkj-gytm9SNVg9dS7Vn3dQ-dsH8Wo+4sg@mail.gmail.com>
 <CAD=FV=Uq9yfUkLUgg116G+2AvEKkEPmdRgUJ5f1bj229j=LxUg@mail.gmail.com>
 <CAGXv+5HU2y-8AZhXDjneaTdD1yr2h06OXbkozcQJj2mBcR1HmQ@mail.gmail.com> <CAD=FV=U54Uwny=kHY+VjG5DGCSHeRUCcWMG=hG88ov8hC6Ynew@mail.gmail.com>
In-Reply-To: <CAD=FV=U54Uwny=kHY+VjG5DGCSHeRUCcWMG=hG88ov8hC6Ynew@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Dec 2025 15:57:09 +0800
X-Gm-Features: AWmQ_bnyMAQiZOYBBfvhrL-p7NWwcYHWTn73VcRsGKhm3OKMH_INaVMR_dcDzI4
Message-ID: <CAGXv+5EXBimfLyK7bmyyHmNcPBNQ=wN+i1_siaMUcibiB7BCPQ@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linusw@kernel.org>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, Yu-Ping Wu <yupingso@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_235725_784152_B042E2B0 
X-CRM114-Status: GOOD (  43.04  )
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

On Thu, Dec 4, 2025 at 12:32=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Dec 2, 2025 at 11:34=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Wed, Dec 3, 2025 at 6:11=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
> > >
> > > > In the simplest example we could have one base dts and two overlays
> > > > for two different DSI panel models:
> > > >
> > > >   - base.dtb
> > > >     - panel-model-a.dtbo
> > > >     - panel-model-b.dtbo
> > > >
> > > > The problem we then run into is that the base.dtb will only have th=
e
> > > > generic model compatible "google,foo", not the sku and revision
> > > > specific ones like "google,foo-sku1-rev2".
> > > >
> > > > And we'd really like to avoid having _more_ overlays just to add th=
e
> > > > final specific compatible string, as that kind of defeats the purpo=
se
> > > > of using overlays to reduce the number of dts files.
> > >
> > > I think you may have simplified the above a little too much to the
> > > point where it's confusing. At least I'm a bit confused. I _think_ th=
e
> > > problems you're talking about are the kinds of things we run into whe=
n
> > > we take overlays above just two levels. I'm imagining:
> > >
> > > - base.dtb
> > > - board1-rev1.dtbo
> > > - board2-rev1.dtbo
> > > - board1-rev2.dtbo
> > > - board2-rev2.dtbo
> > > - panel-a.dtbo
> > > - panel-b.dtbo
> > >
> > > So I think you're saying that you'd start with the "base.dtb" and the=
n
> > > extend it with exactly one of the "board" overlays and then exactly
> > > one of the "panel" overlays. Is that right?
> >
> > For now I think we just experiment with having one end "model" or
> > "product" as the base.dtb. The panel-*.dtbo selected describe the
> > optional components, while the board-rev??.dtbo just provides the
> > top level compatible and model.
> >
> > In an example that I plan to send out this week, I would rework:
> >
> >   - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
> >
> > into:
> >
> >   - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-es=
8326.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-rt=
5682s.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-es8=
326.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-rt5=
682s.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-boe.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-ivo.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
> >
> > The "mt8188-geralt-ciri-sku?.dtso" files only contain the following
> > boilerplate:
> >
> >     /dts-v1/;
> >     /plugin/;
> >
> >     &{/} {
> >         model =3D "Google Ciri sku? board (rev4)";
> >         compatible =3D "google,ciri-sku?", "google,ciri", "mediatek,mt8=
188";
> >     };
> >
> > The base "mt8188-geralt-ciri.dts" would already have a generic board-
> > specific compatible:
> >
> >     model =3D "Google Ciri board";
> >     compatible =3D "google,ciri", "mediatek,mt8188";
> >
> > > So I'd imagine that each of the "board" overlays could have "full"
> > > compatible strings. For instance, I'd imagine "board2-rev2" could
> > > have:
> > >
> > > compatible =3D "google,booard2-rev2", "socVendor,soc"
> > >
> > >
> > > The problem you're struggling with (I think) is that the panel
> > > overlays won't be represented in the compatible string (and "model")
> > > even though (historically) we always did in ChromeOS (they were
> > > included in the "sku" part of the compatible string).
> > >
> > > Did I get that right?
> >
> > In a sense you've generalized the problem I was describing.
> >
> > In my example, the top level compatible gets fixed up by the final
> > SKU-specific overlay. But that's 8 extra files to do one bit of
> > fixup that supposedly the bootloader could be taught to do, and
> > could do even better. The bootloader knows exactly which SKU and
> > revision it's running on and can insert the information appropriately.
> > We could get rid of those awkwardly long compatible string sequences:
> >
> >   compatible =3D "google,tentacruel-sku262147", "google,tentacruel-sku2=
62146",
> >                "google,tentacruel-sku262145", "google,tentacruel-sku262=
144",
> >                "google,tentacruel", "mediatek,mt8186";
> >
> > Going back to what I think you're describing, is that instead of one
> > base board DTB for each product, we could have one base DTB for the
> > reference design (in place of the .dtsi file we currently have), and
> > make products and component selection all use overlays.
> >
> > If we do that, then inserting the correct top level compatible and mode=
l
> > becomes more important, since we do have things such as the ChromeOS OF
> > component prober working based on top level compatible. Also, the model
> > is present in logs, and would be very misleading to say one device name
> > while in reality it is a different one.
>
> I wasn't saying that you'd just have the same "compatible" for every
> derivative of a reference board. That seems over the top. I was
> thinking that you'd even have a unique "compatible" for each revision
> of each board instance. I'm simply suggesting that you don't need a
> per-SKU "compatible". Those don't add any real benefit, do they?
>
> In your Ciri example above, you could get rid of all of the "sku"
> overlay files since you've said that all they're doing is updating the
> "compatible". Since (I think) you're only trying to support "rev4"
> based on your model string, that would leave you just one file for
> Ciri. If you had more than one revision then you'd have more than one,
> but it doesn't need to be multiplied by the SKUs, right?

That's right. What I was saying was that the final device tree only has
a simplified compatible, but maybe someone would want a proper one inserted=
.

ChenYu

