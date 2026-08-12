Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB28C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4OHjlr/xc0r4k48X0MOpzF2/uMIRWtYmbD232seXJo=; b=08C1hWVrA5Fpr06fkhjlacVlF2
	wzBuKoponq3XnuLezfbsOGdjtb35+vy2matGL93oGGcu01/usmNVv49AwPxeNWB5fbry30EhK4oS/
	63mPd3KlquVLh4M7UpcBCtkVLD04aJpUpXLqteil5t1GQ4vu+wJeK84dByY1Bz6Rrby5GZzEl93bx
	+AQhu5xF3xmd7ALYbC9FKrxkXF1HbfWypi5hZU17pKxxR2V63CdueHizM58DcOV4PVgn8Sy3LUMb8
	S4O3RGcfkEmWxv49zVt5v3XHnTjJSvirErS4JVezp+9ivB5zQlfMAyTnVdfsBYpUiwUu2yBRmjPpw
	LZLUmkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3sQ-0000000FbyO-0gg0;
	Wed, 12 Aug 2026 07:59:54 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3sN-0000000Fbxf-084r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 07:59:52 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6aaf2f9ce3dso444060eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786521590; cv=none;
        d=google.com; s=arc-20260327;
        b=clR+GUcY5BLTrWGDjf/vyzuAAXHyhw4Iy9gRxZVatORlWJKdKsnIDvDyXoxefIrRPw
         ICCD42AJWg5wy/RnjSWy8Qd5MhAtDQJA3gSPrQi31IaYiBZyTZCsLywQlOcFqsg6li0L
         LrK+UlaLp/AqH0d/amL9imFjPdTuCrGlpZ+aeey3572cfQukmDJZ/K6aVGo4XEb02Ljq
         WfRmQm90KtWgsWHMJHvwassCBEf1bIb7fIq3cRQw1LfDj0bwKi/16fMHlRh42J/FP3Lc
         uk3nH3OG/sApRzmimXaSF9cfHC+YQQNUecKUV5iTW8D2x4XI4l3e8lkLH9fq9l0GHgVs
         nUpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M4OHjlr/xc0r4k48X0MOpzF2/uMIRWtYmbD232seXJo=;
        fh=TLoaPkCCW9kcEU4dt3HbPaMCzQAEq/8wZPI0URCcRIs=;
        b=TX1t9ltmcUSd25gGi1ynaMrugngQRX2kbB99Ws7KheD8TfltBy9O0E7a6DEat+sQDd
         A+rjh+rjvC8HKW3RS1lAqd704HbSqEO6JUgOxpv3SRLKvV8BBqQfHXIuJigsUZkEseBt
         JvFkCn7swmacAKlg8GuFl1qE7PFLnhhst1UNMVp2/u3hLJqOE3Jt1gtahMauhgLy6Weh
         NzutERKflRNCM0csFyhC9ThrG43mfAqJ4fGSSDHQQPOdw2pnjrBh1vy2Cm/HU7v5q5xK
         U+8hXe1zGcE/THVGt4hsXwhXq6fuStA1RAmcYfrWDesg8Xc4o3JmC6kRfkZuJ5XrNy6f
         YS7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786521590; x=1787126390; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M4OHjlr/xc0r4k48X0MOpzF2/uMIRWtYmbD232seXJo=;
        b=gAzOKxXfiWqb5MYyy+3l0p7vjBKMhmFLmEk42D7pz+STVDgQQno14t1AtyJVnJ8kVB
         0DLAv6UmpO+twbyrXQzEC8WOhgFr0Ew/g+NwB48/FB4MOAHbf1VxhTnkHphcSK+BP5Er
         yk5ScjUe3y3aoS3J1ajHThTz6Vb/pe0I+v0aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786521590; x=1787126390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4OHjlr/xc0r4k48X0MOpzF2/uMIRWtYmbD232seXJo=;
        b=dwSiIAgRBscBwP6CwM8z/jnODAJ2AzDfHWVhnwKjRg81LV/FVKEMbRpsh9th7/FkAd
         PZkSj96btJ5zwiZUXZ7AmeUCJHCrbwyb8KbiQT/uiyBrm7fBsARv0ILB6t7g4d/u/qVe
         AxbVkjZe8vIGS36LnsaiVK2Z8BrD4lxLRLlFKwl761+z2MPbPuRD5545V1EP1CrKf4tp
         Z4kb265ZNDAVjm6IHwMMSNTRrZK3oObHdRltssBYoGva0DYaGFbGLgsxZFtdDnfVsZmH
         TbB3X4+31FFJW/5YY443wr5D7sq7z7GDvv5+SDgFPRM+5bQSR/DUuuWPazosFYA9m8Fp
         qmIg==
X-Forwarded-Encrypted: i=1; AHgh+Rrt6GxcTxBD0gSBMwXMTwQaoaviwZ5Sajken+yHyUwGkkihfX+btX60tsnK4MIDHAjqpDFFSup/QFSkLLWrAR2Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwWGiqJ1La/LWMutqyl9o0TI99sPd7SCh3BCUXz4Cer+BY6Bnu7
	kKqEuFE+xQzC+6bqGcL/QEo9zkXe0/sFh88r4pFQQuqXmOS+uE67btcKNLjkuEP3krsIhsa9+AH
	8L5rbMAgIXkx+lKOFfh9zjM1YxTFpj1X7qXTF7aXrxYsOyO6yZUtAUA==
X-Gm-Gg: AR+sD11zYrmEiIiRuIZhR4BWw8GLqbRJTv/XZN4r11no0R7oj7eTpFpgl2nyUpT/VgE
	r5i7JCr0n3IsssJJb+ms3Wae1KTTP5UTmlQu6JSjR163eua9rfl88GSxX/EFZUj2aslToTdYBDl
	q5Eiz+yhPLNClqPRpyqfHCmqtgoftJNo51+eBrXONb3Xk1FfngqOPARCyoTv9AKclfKbcJSaIWK
	vT4KzmI8Nq1cVVd0PZN3+gpkMmn5NKzAhLagyq4T+hghcMrZU848MX5lvHe9t60lAUjr8RFo6Da
	N+BIUKALyMQoiXPmziQvzMgl2jL2/V42SyH2rzYCyo904qFwMFV5wGg2/h1+Z3OoN+zEqJoq
X-Received: by 2002:a05:6820:60a:b0:6aa:f172:3094 with SMTP id
 006d021491bc7-6b0b2519ad4mr2258206eaf.10.1786521589902; Wed, 12 Aug 2026
 00:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas> <CAGXv+5GNvV0yfX2v7E9HxvFpm0xwhGMQLjec=_xV_6YipXFcbw@mail.gmail.com>
 <CA+_ehUxa6U+0FEFuptJXQZ0kwbthYjshZftx32CmwkisAyo=+A@mail.gmail.com>
In-Reply-To: <CA+_ehUxa6U+0FEFuptJXQZ0kwbthYjshZftx32CmwkisAyo=+A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 12 Aug 2026 15:59:38 +0800
X-Gm-Features: AUfX_mwExU67hb1lHMqkJS8Gq5qmKGn_UqJ4btHUkFbIphThQrjAQvPqvBvAUwk
Message-ID: <CAGXv+5G=XDXSeyQww_ihogpPLyv2K0ofK3Ym1W+Jdzs9h176=A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_005951_120670_A0BA10BD 
X-CRM114-Status: GOOD (  51.28  )
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

On Mon, Aug 10, 2026 at 6:55=E2=80=AFPM Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> wrote:
>
> Il giorno lun 10 ago 2026 alle ore 12:33 Chen-Yu Tsai
> <wenst@chromium.org> ha scritto:
> >
> > On Fri, Aug 7, 2026 at 11:21=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > >
> > > On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsm=
th@gmail.com> wrote:
> > > > > This small series introduce support for 2-lanes mode for Airoha A=
N7581
> > > >
> > > > Just a nitpick, but I would probably name this something else, like
> > > > "cross-controller lane-bonding mode" or "lane stealing"? PCIe alrea=
dy
> > > > has 2x lanes as a standard feature, so this naming is a bit confusi=
ng.
> > > > It's not like dual-LVDS display in which LVDS is only a single lane=
.
> > >
> > > I suggested the "2-lane" and "x2" terminology because I assumed the
> > > result is what the PCIe spec would describe as a "x2 Link" consisting
> > > of two Lanes.
> > >
> > > If that's not the case, maybe "cross-controller lane-bonding mode" or
> > > "lane stealing" would be more accurate, but I don't know what those
> > > mean, so if we use them I would also like to know what the result
> > > looks like in standard PCIe terms.
> >
> > Benjamin pointed out later in the thread that it is just bifurcation.
> >
>
> Yes but as me, you, Benjamin and Bjorn people who weren't there with the =
HW
> team at times the SoC was created, and given how the internal documentati=
on
> these are just assumption and observation... Everyone can be correct and =
wrong.
>
> > I would assume "PCIe bifurcation" is a standard term, so maybe we could
> > call this "Support un-bifurcated 2-lane operation"?
> >
>
> And how coming from PCIe bifurcation to un-bifurcated 2-lane operation ke=
eps
> the standard meaning?
>
> This terms is equally custom as the previous "cross-controller
> lane-bonding mode"
> and "lane stealing"
>
> I want to be honest... I'm not following why we are trying in every
> way possible to find
> a standard meaning for an highly integrated PCIe controller for a vendor =
SoC.
> It's not like there are devices shipped with PCIe slot where you can
> insert whatever
> card you want. (there is only a single RFB board but that is really to
> debug stuff and
> develop)
>
> The SoC is designed to have WiFi cards attached and only a subset of them=
.
> And some of them require 2 lanes mode to work with this special configura=
tion.
>
> Even the DT bindings are not that specific to the details... at the
> end of the day
> everything is modelled as simple as "num-lanes =3D <2>;"
>
> And that is effectively what the HW gets configured to. If then a
> robbery is done
> internally to the HW to get the second lane with probably some criminal a=
ct and
> some murder then those are just details. But unless we have a correct pol=
ice
> report on that (Documentation) we can't assume someone got shot in the
> process.
> (sorry for the joke around the stealing thing)
>
> > On the implementation side, having to reach into the second PCIe contro=
ller
> > is a bit messy :(
> >
>
> I can assure you vendor hide all kind of bad stuff behind single register=
...
> It's just Airoha that loves to expose godzillion registers and configure
> everything clearly... Something that most of the time is better than hidi=
ng
> everything behind ATF with SCM commands (or even configure stuff
> in bootloader from HW strap)
>
> A bonding solution where 2 controllers are configured and then bonded mig=
ht
> also be problematic as for 2 lanes mode the configuration needs to be don=
e
> in the same time segment. (and that would introduce lots of complexity in
> both DT and driver for the sake of just having an additional reset and
> an additional reg)
>
> Aside from these 2 point... I'm open to any kind of naming and change
> but it seems sad to me to delay this feature for these details that would
> only affect the commit description and nothing else... This is currently =
needed
> for Eagle WiFi card to correctly works... With the current code it works =
but
> sometimes it doesn't as the reset and configuration phase is not well def=
ined.
> This series fix exactly that to have stable functionality (tested on Open=
Wrt
> from at least half a year)

It was not my intention to block this. Having worked on other MediaTek
SoCs on which the PCIe gen4 controller, supported by the same driver,
can do up to 2 lanes natively, the subject of the cover letter was a bit
confusing for me.

Now that you've explained it, everything is clear.

> > > > > SoC. This is needed for correctly functionality of Eagle WiFi Car=
d
> > > > > normally attached to this SoC that require a 2-line PCIe card to
> > > > > correctly work (and give the proper performance)
> > > > >
> > > > > The first 2 patch address a limitation of the PCIe implementation
> > > > > where the PERSTOUT reset were indirectly asserted and deasserted
> > > > > all at the same time (for all the 3 PCIe card) with PCIe
> > > > > enable and disable.
> > > > > The 2 patch address this and introduce correct reset to control
> > > > > reset line for the relevant PCIe line.
> > > > >
> > > > > The last 2 patch add additional logic and support to assert
> > > > > and deassert the PERSTOUT and also apply the required configurati=
on
> > > > > for 2-lanes mode.
> > > > >
> > > > > 2-lanes mode is implemented in DT by adding the required property
> > > > > and by defining the "num-lanes" to 2.

