Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79880CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh7TW/Ve4npOGl0ZyWerfFSPimsdKplSnqZUaXacERE=; b=v2OIskr4VV7dC4VqLm/VDbB6h0
	wsGKUMGf0IdQLO8bXTMQpQcIX9uuoQ1zzLN8uniIPEVj0/JhTFNUURRo2rgaZCOjin7KaxSXaZxCU
	GIQCi4ZaF0J5rVkXgp98R3TJciZt0D2N9rn8Cnee8wQpRBrnxPiF8Y+vPM0yawP8FPCSfp3cqULnR
	E7nplknIk9j2WOQwtTkE5ur+2k+CmIcvAzb+BsrZIbcpGr/9LoxoJwu5joRRxmIH1rqLxHOHuXpG+
	tMz1OwUmuWa8cr0d+TTQ48hc3DIirVtkvKjXFqyGpzVCjWUoQ97C0w4RIWevfgZrSNK9TJO47Qm8B
	IL20rBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4gk-00000003F0r-3GJk;
	Mon, 15 Sep 2025 08:35:54 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4gi-00000003F0E-0i5s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:35:53 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f720ffe34so4427350e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757925349; x=1758530149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sh7TW/Ve4npOGl0ZyWerfFSPimsdKplSnqZUaXacERE=;
        b=T5Q1gul6HI1DztRb7nN/dxPOoUiwIB87MccES4trbbi74BDswTlsy43a253NzOhtqr
         odPjYBKR6fWdXhBjLFx8gx8s4y8tJDZr2YH31MaViSkZ6+R8spLa42OAhUObvhZ/lIg0
         5P+vjkPMVybBFlg1EoMaPZxuYHPTng6hIB5U9htuxou0vPDFtXGAq9tCiIiW/idhRSTW
         xez3gLSBynNXls4Bu0UI1AHiz0ksbHkYzQi+VXsxCb0lW3wfry3vgZGJjK5c/VoB5vsu
         hSHMw8tcuhLLA2VZs+0Qr/Me5UvRDFlDzCBrYGgE75xNQe1zVmI5MJW8h6KUtU5+avkG
         suJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925349; x=1758530149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sh7TW/Ve4npOGl0ZyWerfFSPimsdKplSnqZUaXacERE=;
        b=HD/UaTde/rgE8ndhRerDpFZTyyVhvqTy7m1KwGX0GazdEYieg7CsGcfRq2Xz0QleBG
         KSFjTnfuyS99vZzxN8tIsb6zoyI/6HKn+Ic9qHoFdpX/Y5dAG3HqtjWs/f2Wuo/sc2SX
         uRrq+6DP23gwdiqix2gm934iivhcN6Y/pd8ghZG4FECSwW2TpQsAVkf1/vGmr/XO/AgP
         G4zV1kaGg9Ri4Onw2RVeaJTgFCkET7puG0H32Tdc0ZyN72zH4U8CH7Rm6fcCZlVjSlLJ
         h1vfYEeAC6nu+K/ls3K1zg9+JMee8fMmbilel+yPUVqW6TJ0r9F3N491/7ReawTHIgCL
         OjJg==
X-Forwarded-Encrypted: i=1; AJvYcCWeNjrEN8tzUJAhvqgVNP4+KLhLmVM/ytM3xS11VWlqFiqGaoHKt6yEPzrfThMl+faCdwv660h4dCN/krkq9pwu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmu1aJnOxiqYq9FdU1VWFYUF/elVRrNoLnAxqJS9dJqwiZx+hs
	VbfUcGFwXGW1hKZ+eyKVc24x/TKxm5Ut4++8BRhW0D2YNYhNBqvhXuVcAJtG1GBC771XGMfnbys
	WJEB3Ef72t3I+9CTcMVhRcwRQLAOislCfmyt3YRF0tg3wwpnCzQbMSsA=
X-Gm-Gg: ASbGncuwVDY8Sx6f4HT56mCenq1YDhri5DjpsxXIrOIDfB+Fg0TK31DXcnENsTZ0MPA
	PVROq9n55C6J7S8upZQEKJGPE/ZC7YResN2KY9urzs0QIdp0tfJPovz5raHGy/8873ivH5IHcPM
	vyQJukVPCd947RxXcpbv6hizpvp5ZZrAZ0u3eYEnTEYicHus2T69eRGIEKoZhZJy689BDUDihSB
	zffPz4MYLSOV1/Ogg==
X-Google-Smtp-Source: AGHT+IELPJH0yiYJRtqNxqiBlJNj2HXfxCwVKTaGQUndbi2n7nTd+Q0uzLmLln2Ahd6RCFrGxTAftvlwA6pCqv4NdTU=
X-Received: by 2002:a05:6512:3409:b0:55b:73e4:1581 with SMTP id
 2adb3069b0e04-5705be2353amr3236909e87.3.1757925349439; Mon, 15 Sep 2025
 01:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-2-gary.yang@cixtech.com> <CACRpkdYgTjerG5mks_+3sjhKKYtCsFY=1NWhgw_YEuib7gZm3g@mail.gmail.com>
 <TYUPR06MB5876BB28E3C30EEB9BB05997EF15A@TYUPR06MB5876.apcprd06.prod.outlook.com>
In-Reply-To: <TYUPR06MB5876BB28E3C30EEB9BB05997EF15A@TYUPR06MB5876.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Sep 2025 10:35:37 +0200
X-Gm-Features: Ac12FXzmf8LIusbRII3-Fz1NuUc_y68ko5C640f0pew8cVktZo0LvMElNxPe0Sw
Message-ID: <CACRpkdYKnFAyq8C5h2=5NQ8AU92RmzShNHd6+=21rWednjv-fA@mail.gmail.com>
Subject: Re: [v2 1/3] pinctrl: cix: Add pin-controller support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_013552_260023_12CCAC8E 
X-CRM114-Status: GOOD (  43.22  )
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

On Mon, Sep 15, 2025 at 9:09=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> > Using a NULL func->name to terminate the array looks a bit dangerous.
>
> Checking whether this pointer is a null pointer is generally acceptable. =
A name maps to a mux value.
> I think that it is safe. Of course, your suggestion is also a good idea. =
If you think this is not safe, we will
> change codes as your suggestions.

It's OK just a suggestion. There are many ways to do this, first fix
other problems.

There are things in the language and the kernel that can help
you to check boundaries of arrays such as these functions so
you can't write code that index out of range, e.g.

+struct sky1_pin_desc {
+       const struct pinctrl_pin_desc pin;
+       const struct sky1_function_desc functions[4];
+};
+
+struct sky1_pinctrl_soc_info {
+       const struct sky1_pin_desc *pins;
+       unsigned int npins;
+};

It is possible to use a flexible array with the intrinsic
__counted by() here, e.g. instead of:

struct sky1_pin_desc {
     const struct pinctrl_pin_desc pin;
     const struct sky1_function_desc functions[4];

You can use:

+ size_t nfunctions;
+ const struct sky1_function_desc functions[] __counted_by(nfunctions);

If you grep counted_by in the kernel you find many other
examples of how we use this.

But flexible arrays is a bit complicated and dangerous so maybe you
want to avoid it altogether. Also I'm not sure it works when you put
things containing a flexible array into another array... I never tried it.

> > Then you can use nfuncs to iterate over the array of function names, an=
d
> > define a macro like this:
> >
> > #define SKY_PINFUNCTION(_muxval, _functions, _nfunctions)   \
> > (struct sky1_function_desc) {                                  \
> >                 .muxval =3D (muxval),                        \
> >                 .functions =3D (_functions),                    \
> >                 .nfuncs =3D (_nfunctions),                  \
> >         }
> >
> > And then this:
> >
> > +static const struct sky1_pin_desc sky1_pinctrl_s5_pads[] =3D {
> > > +       {
> > > +               .pin =3D PINCTRL_PIN(0, "GPIO1"),
> > > +               .functions =3D {
> > > +                       [0] =3D {0, "GPIO1"},
> > > +               },
> > > +       },
> > > +       {
> > > +               .pin =3D PINCTRL_PIN(1, "GPIO2"),
> > > +               .functions =3D {
> > > +                       [0] =3D {0, "GPIO2"},
> > > +               },
> >
> > > +       },
> >
> > becomes
> >
> > static const struct sky1_pin_desc sky1_pinctrl_s5_pads[] =3D {
> >     SKY_PINFUNCTION(PINCTRL_PIN(0, "GPIO1"),  "GPIO1", 1),
> >     SKY_PINFUNCTION(PINCTRL_PIN(1, "GPIO2"),  "GPIO2", 1),
> >
> > I don't know about using the PINCTRL_PIN() macro here though, can't you=
 just
> > put in 0, 1...?
> >
> > Anyway I think you get the idea.
> >
>
> First, let us review the struct sky1_pin_desc, it contains two members, o=
ne is the struct pinctrl_pin_desc.
>
> struct pinctrl_pin_desc {
>         unsigned int number;
>         const char *name;
>         void *drv_data;
> };
>
> PINCTRL_PIN is used to initialize this struct in kernel. It locates in in=
clude/linux/pinctrl/pinctrl.h
>
> #define PINCTRL_PIN(a, b) { .number =3D a, .name =3D b }
>
> PINCTRL_PIN(0, "GPIO1") defines a pin, its number is 0, its name is "GPIO=
1".

Ah I saw it wrong, sorry :(

You're right about this of course.

But I think you can still use a macro to define the long pin tables?
Albeit macros with flexible arguments is a bit hard to write.
Save it until everything else is working.

> > If this is the implied pattern for this driver, write as a comment to t=
he above
> > function that this pin controller place all pins into a single group wi=
th one pin
> > and that this is why this works.
> >
> > The normal (as can be seen from the pin control documentation
> > https://docs.kernel.org/driver-api/pin-control.html ) is to group pins,=
 so e.g.
> >
> > uart0_rx_tx_grp =3D { pin1, pin2 };
> > i2c0_sda_scl_grp =3D { pin1, pin2 };
> >
> > Then this is combined with functions such as uart0 and i2c0:
> >
> > function, group
> > ("uart0", uart0_rx_tx_grp)
> > ("i2c0", i2c0_sda_scl_grp)
> >
> > Here you see the two pins are used for uart in the first case and for i=
2c in the
> > second case, it's the same pins, but members of two different groups, a=
nd
> > these groups are then used with a function.
> >
> > The possible functions for a group are then defined somewhere so these
> > settings can be applied.
> >
> > Maybe this pattern is something you have in your driver because the cod=
e was
> > copied from some other driver which use one group per pin, it's not cer=
tain
> > that this is the best layout for the cix SoC so look it over!
>
> First maybe you ignore that fact the struct sky1_pinctrl_group is differe=
nt from
> the struct group_desc. It only saves the config of a pin from dts. it doe=
sn't include
> pin function part. As we know, a pin only has a config at the same time. =
One group map to a pin.
> The pin function part is included in the struct sky1_function_desc. One p=
in can map
> serval functions. There are four functions on sky1. We define the sky1_gp=
io_functions array.
> It is used to select the pin functions.
>
> Second, you are right. the pinctrl driver support new scheme is seldom in=
 kernel. You take mt723 as
> an example before. Some codes come from the pinctrl driver on MTK. We mod=
ify them to adopt our platform.
> If I misunderstand or miss anything, please let me know.

Yes I can see that the driver is based on the MTK driver, my point is that
make sure you are not following it too closely, because what is good for
the mtk chips is not necessarily good for the cix chips.

But if you feel convenient with one group per pin and you are convinced
this is the best for your driver, go ahead with this scheme!

Yours,
Linus Walleij

