Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA37C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOjXPe8NVJxqY9cA3/rXFnzAlTaT0lIlpmhgjVsyJZM=; b=iwxEA/sz00I5lD41BdkO28u/4l
	xOfQvEp3SFwOHOngLQQtWHqtadqwZkbOvWwponkm3kJSfvwRNIJ7jSRjVWFgLLs+kcBlvHBRFMC/H
	/2PhOPA2nFv9sNFgCD9IXssFQxVeanQ9selOz1Y8wKh6CcXgURNIRO01ahw+jAhPxB0zCNsXy1/0s
	ZKI6hxLXdtBktjsRz3mjPWyZb3VEWp+Ay0+1OEcFwwWEutlAjCHLZxFHS/Tsib9m8UHf0BUvjk+g8
	Ky5j2TjY8jBZw/qbUQlbP3AgkCJwiSBfO/DNHtkXSTv0thxtYl0PgyEusAaelcV6fHGn3+NL/xfEC
	Uy+RYATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0al-00000007Efk-1FgV;
	Tue, 10 Jun 2025 15:08:47 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyP0-00000006pcQ-1aU3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:48:31 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2ea35edc691so730658fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749559709; x=1750164509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOjXPe8NVJxqY9cA3/rXFnzAlTaT0lIlpmhgjVsyJZM=;
        b=TGIlquxG5nr2IgpOmFeyimB8TfVEvIUK2VwjIiJDimj4qu4a814YdD6mYaGOtssv8r
         jd6heTM2MFpoLVFVudFf9WKZ+X3R8Bj2ELaOc/pkSujd9fhBrIlowhjkWxe3Q/iwmKCj
         oOk/IXllPhp0+BzcbgTy5qQDCjONsgTwM0wcSYFyJP2hQBhVj7q4qwNgURLgyAs99o8A
         Af1hsYzGsutMaqnPa8B26aQ37ZJZK/QVW2jhGOjZH3PLXh3M0x8zt/B5LM6LGpmbics4
         pnjs6Ewm+BdmqTSY39G8pYCbdomaOvF+AoSJDPDMAoLEkBLU/iaauiHQWN6gSUP2rCds
         ldcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559709; x=1750164509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOjXPe8NVJxqY9cA3/rXFnzAlTaT0lIlpmhgjVsyJZM=;
        b=mI3UqChaMA2/iKJGdO8qSQFxqeaEKa1AYcqztCq3FjHXBiJF6ZrQGXA+xpbHoB0SWW
         SU8cWWwTXsskc+CMA9U/Xi0dDj5Od8NlXenA11VUA1nB7nQV3hifhaxtOPK6f0SFtRKO
         9hrbL+KisIpct3np7GfoXJF6D0uKb80K/M0zNeVBtPp3PKveHBQMcXRc5JdzOZL70JOF
         +CJrj2lezCsfzvTUxGj/H3EEgtIs2TDEZ/XdHgbIeqFttCw7IrFwJgVQIMbw144JIIwR
         gdsD2+EBsV+0aApqubXR/6xcb9XjsUIU4Mt7TxvHBMmHyB8SMOvtdo1nBM0Ah4plCSYQ
         +9nw==
X-Forwarded-Encrypted: i=1; AJvYcCUh5Pmp2wiJu8/e8kuSOOIEjdmro79Hbn0kt/49WsZuZKqbh2CiyYzxmRQYszUxQcX4cHv0yypGWXUPmStXb+so@lists.infradead.org
X-Gm-Message-State: AOJu0YxQRnG2kvdYhpReL4gJOH5JO2W/W8tsMgaUgrJK5H9KcY9OHm45
	s0QcEC7PXw1MyhMpNcjyfDV3s0devfl86cYS6LLYVgcJBKtWCPHgbCETEr7J63MpZ0k/nG2q6d3
	syncqxhf3PRv/sN94VqXio/WY/bQ1vxc=
X-Gm-Gg: ASbGncsrs5BxHBMCulsG29aJHKUlqARWltqTOMUhO/ZEZXOBG8ES3I2enjiYTK6/p3x
	xUYqrv934mZss400Mwn2JUn9rv0pBAbVf7Grj29Ne8vnUTekk51pRZW1RH9KBkziEEtEc+5f0xg
	0U6d8w1jxE1ZLduTG78NMSDTUdpQ/mnnpca07JDPHTdMlH7L4aaW7jBPaQHg==
X-Google-Smtp-Source: AGHT+IEJkSHuAGQdalloHnhm/KPuTWMMm47KacsCwCjSaDxe3Ht+ktdr1ZxnlrLVEu4bU9Ld02X4PkCAm/YKMs7Fce0=
X-Received: by 2002:a05:6870:164e:b0:2e9:b6:2edd with SMTP id
 586e51a60fabf-2ea011dacb5mr10416784fac.32.1749559708578; Tue, 10 Jun 2025
 05:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com> <20250609-bbg-v2-2-5278026b7498@bootlin.com>
 <20250609-hacking-corporate-d53531577680@spud>
In-Reply-To: <20250609-hacking-corporate-d53531577680@spud>
From: Jason Kridner <jkridner@gmail.com>
Date: Tue, 10 Jun 2025 08:48:16 -0400
X-Gm-Features: AX0GCFvR7zhEYzZzWjg_mjpYwaq3wTlIpZbFoKrzFhLnZGCZZpbjY0Ty6K2T5Io
Message-ID: <CA+T6QPma+4DquH8wfY0gSdn9yaQvsK051tJrYiF6fUGBiMvQrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33 compatibles
To: Conor Dooley <conor@kernel.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_054830_417343_A13F01FE 
X-CRM114-Status: GOOD (  30.92  )
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

On Mon, Jun 9, 2025 at 1:03=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Mon, Jun 09, 2025 at 05:43:52PM +0200, Kory Maincent wrote:
> > Add several compatible strings that were missing from the binding
> > documentation. Add description for Bone, BoneBlack and BoneGreen
> > variants.
> >
> > Add several compatible that were missing from the binding.
> >
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >
> > Change in v2:
> > - New patch
> > ---
> >  Documentation/devicetree/bindings/arm/ti/omap.yaml | 38 ++++++++++++++=
++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Docum=
entation/devicetree/bindings/arm/ti/omap.yaml
> > index 3603edd7361d..c43fa4f4af81 100644
> > --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > @@ -104,12 +104,50 @@ properties:
> >        - description: TI AM33 based platform
> >          items:
> >            - enum:
> > +              - bosch,am335x-guardian
> >                - compulab,cm-t335
> > +              - grinn,am335x-chilisom
> > +              - gumstix,am335x-pepper
> > +              - moxa,uc-2101
> >                - moxa,uc-8100-me-t
> > +              - myir,myc-am335x
> > +              - myir,myd-am335x
> >                - novatech,am335x-lxm
> > +              - oct,osd3358-sm-refdesign
> > +              - tcl,am335x-sl50
> >                - ti,am335x-bone

What is the convention here? "beagle" is a vendor, so not sure why
this continues to be "ti". The owner of the brand for this board is
"The BeagleBoard.org Foundation". Not sure if it is reasonable to fix
this.

> >                - ti,am335x-evm
> > +              - ti,am335x-evmsk
> > +              - ti,am335x-pocketbeagle

This one is also "beagle", not "ti".

> > +              - ti,am335x-shc
> >                - ti,am3359-icev2
> > +              - vscom,onrisc
> > +          - const: ti,am33xx
> > +
> > +      - description: TI bone variants based on TI AM335
>
> "bone variant" sounds like some shortand or nickname. Are the boards not
> called "beaglebone green" and "beaglebone black"? Whatever about the
> compatible, the description should use the full name I think.

I'm not sure this is really needed. There is some desire to fall-back
to a building block level of functionality around these derivatives of
"BeagleBoard.org BeagleBone", including compatibility with the
expansion headers, but I don't think that will happen at this level.
In u-boot, it is possible to make the determination to utilize a
less-complete devicetree, but it seems impractical here.

What are the objections to just listing these all as TI AM33 based platform=
s?

>
> > +        items:
> > +          - enum:
> > +              - ti,am335x-bone-black

"beagle"

> > +              - ti,am335x-bone-green

This is a Seeed Technology Co., Ltd. board that licenses the
BeagleBone brand from the BeagleBoard.org Foundation, so "seeed", not
"ti".

> > +              - ti,am335x-pocketbeagle

Not sure why this one is repeated. Also, it very much begs the
definition of being a BeagleBone derivative outside of usage of the
PMIC.

> > +          - const: ti,am335x-bone
> > +          - const: ti,am33xx
> > +
> > +      - description: TI bone black variants based on TI AM335

There are lots of derivatives of BeagleBoard.org BeagleBone Black and
falling back to a compatible makes some sense, but I don't think it is
of practical benefit here the way things have worked out. The smarts
have to be in the bootloader based off of the board IDs and the kernel
is just going to do what it is told.

Now, if we had some practical overlays performed by the kernel, this
would all make some sense as patches between these variants provide
useful fallback operation, but this is otherwise confusing. I
appreciate the credit given to BeagleBoard.org for them being
variants, but this really isn't the place.

> > +        items:
> > +          - enum:
> > +              - sancloud,am335x-boneenhanced

Note that this one is correct to be "sancloud", who licenses the
BeagleBone brand from the BeagleBoard.org Foundation.

> > +              - ti,am335x-bone-black-wireless

"beagle"

> > +          - const: ti,am335x-bone-black
> > +          - const: ti,am335x-bone
> > +          - const: ti,am33xx
> > +
> > +      - description: TI bone green variants based on TI AM335
> > +        items:
> > +          - enum:
> > +              - ti,am335x-bone-green-wireless

"seeed"

> > +          - const: ti,am335x-bone-green
> > +          - const: ti,am335x-bone
> >            - const: ti,am33xx
> >
> >        - description: Compulab board variants based on TI AM33
> >
> > --
> > 2.43.0
> >


--=20
Learn about me and setup a meeting at
https://beagleboard.org/about/jkridner - a 501c3 non-profit educating
around open hardware computing

