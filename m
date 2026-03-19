Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ADD1088E79
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 04:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=; b=TqA/hwo2zbvJ4l0GWYVdefn+Gf
	YB7YJzcIXB7Tsi51icm+OTGeiZXLbZNiVZBHz41JpoLHfoQ/8TqQcHZZN161T2c1vsEHVdtw1d0lK
	snMG4sxogKrFRhp+/N+IlIRHBHa7rzgNvL6DjQQVLlHKRO9oufjpmJ+qSSIxnKoR1aHqN7uxLMTYX
	urBDYxudkvnoZduw1oGObCy+G6HZuWp2LvNYJRuUw3lbdW4+2Y2iANHJgjmLY2p6arkqRAO9yPsSt
	sMbZ7CuEcAQp9nCXkZtxH4suCsy4vRBgUT62r7/6yVXwxwNhSAXY0GcTapRoTXcrX4GO8lsYlGiNH
	awWqPUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35OY-00000009v1i-0SIc;
	Thu, 19 Mar 2026 04:54:06 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35OT-00000009v0c-2WZ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 04:54:03 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so561845e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 21:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773896039; cv=none;
        d=google.com; s=arc-20240605;
        b=ckRQa2jQy00yxvv2Zouz4uILpvuqP0cMJLRAcglA57fdVhRKLj6z+luw441ytUnUC8
         10np5ww53co2Egl69Y1cxaprvNrsUcu0d8fPxklJbMhXIpAQIm0QISA5XJKPbEiJMsf/
         YnZ0EJhvajZ/4iPfX+5IrtQT2lnT8JwbyhyJHn4gHKYBKLDIQ2W9mC4BRB6RVfFrjn38
         lsV6r0/6RTC8RGj4EhTPuTRbxuJd147DldrT+Q7xdN4zkmEmwgos+YTMeRjA1XbaXj+x
         x8bbjM7GQesyOJS29soyxgGFg7ZXmL3TyJ04A2cBKyzg2AJW2I8ZjlX4NrKSYe7LN1ck
         eBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=;
        fh=sWXjBh0CPrReoGsRPmcdQmp3OCDqXsiWWdsl/bePQhc=;
        b=B3kY9w+174ibyNMbsIYMIsT2+PXPGT1MF9Yq4hzdzcMQTdNJA8aUpUC1caYKbHW+ax
         sroBuhjO8egLqBpwFOgtzqav/ZhMcHFw3U9QgOEPkFjWiwVF4MsNPwcNTYveuMi6FWqk
         Yard9vzDKRNx8PX2Us5/hNYr6FvywDFvAMlG6dJBcgGztRFA0Vq7FfY9JfJBqc6xxF/M
         WD/4nXMHXvBglhxY89xLOCfJ+pAEWyRtRwTlFgyKAgIC9c/2ezUmS/LOAp7ISP4C0V6K
         K1Va7/OTUreNcGNc0lrJRjS5WeVJQ+j2XjPKOa8B4xpNsKBuViLqX+iPrY8AapoY02//
         HBoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773896039; x=1774500839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=;
        b=JCLNYB8n9IIKjCbI5Ec3nfwUrA7qb8o9Dv43sMa1sU+RxcrxKzx9gpyfQvm1TvFH3+
         gHJZK7CCpoNY9Tx7FRoMJYGb99zMGvaFTWq9+xiNXFOn3hfs8duoBhRM1J6YT9Ea/F5n
         hKJYXOPYV5cQ5IFHwSQpgYOXy/XBeF7G+83L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896039; x=1774500839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=;
        b=Eg4RbzpKVs5srfOmK5RVrXCesqgdfSqR21FnGETMETBcAmx79E4PD4d0eUgCuG03Es
         lHsiNaW5G81zj4RCqcTRkzBvVzoEwPEdNvAzJJYdz+k5LgHGrY2A+4OA7R/joPVF+6Np
         VNueSRLeOENVVUwhcgo+BNmgbVngv5xnioRthAw8hF9D60R3zrWcmR9nCgU7//OmFzL8
         jEanS2ppE+eXc9qa1TpfbeNuDkPVq9Wby1WHBSVj5617Sg7LGOcuxG4LeZdxmXkQg/We
         K/mec8fk21fz5joh55468yVMeCBQNgV6XYKmb0J6l868owyXpboxwv72GBSruS6pIMAE
         L5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1VuKnue/yoQlGLx/sEPfo473ODlS0xCj5snvEF82siS/1N2Wn51tAViEfX/vNE1GuFRygSiD4ToMlR9vCY0ak@lists.infradead.org
X-Gm-Message-State: AOJu0YwmKRtUZKQ9Hn1FoWprxEqWHjH5KYama892nCx9KWKvy7wZmUbO
	E4KwFCNgdS7gto8zgtdEpLMEUpgAPsdEJae9w7HLVoW+PyFv9nL3JuJFeNsQe1mQibnuCPwUYp0
	9gDIZOo4Vv6fH8fvwzek1ugAx9mhu9D40AcT1UkdG
X-Gm-Gg: ATEYQzwksvNrb531ZBxjVCbHPIhiUiKHfjVinlgCnrCCuF08f+Htts/LwbmfekiS9wB
	OLyJcmFNIk1pw/OcncAwrfld2NpVKRDoxM7fXtsr6q2ET+5EPmijNn5gdukCeWktKhD9Z8SwbRM
	z76O1COtf7H3SsWqVpIXXRP4Tz/o+im4tuq0J3OPh+XcaOGol6UFHYKlVmeb9n4tn2U73HSNNGV
	WHnGfxX2LVRDQFjvkk3y44KGuKLRC699B+kE9t19+Dhf9kZJbGUozF5UjosRlFD4qOhopHTNxsp
	BiDPDG214NEx+tLFHG6Hh0st9VfDbLhLT0jNNw==
X-Received: by 2002:a05:6512:601:20b0:5a1:76b7:ac06 with SMTP id
 2adb3069b0e04-5a279585449mr1694598e87.3.1773896039222; Wed, 18 Mar 2026
 21:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-4-l.scorcia@gmail.com>
 <20260318-nickel-serval-of-tolerance-621bad@quoll> <CAORyz2Laoo4EiLcHZ-ygLiFGW_h8qV7QxqNsMbueM=nov5zH0A@mail.gmail.com>
 <ad0d1ea1-4c5d-4cfc-af0d-8d843e7e0e9e@kernel.org>
In-Reply-To: <ad0d1ea1-4c5d-4cfc-af0d-8d843e7e0e9e@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Mar 2026 12:53:47 +0800
X-Gm-Features: AaiRm53rEbzUcysiLnjhOdOv1aJMbQDabqUfN6XBRWKQC_wiMRBidNmKXvI9wx8
Message-ID: <CAGXv+5EqUhJ62fjE0R9nLcu6tsfXan8ZEYe7hvkofKnFM7W8NQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_215401_738079_1E9902EA 
X-CRM114-Status: GOOD (  31.11  )
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

On Thu, Mar 19, 2026 at 6:14=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 18/03/2026 22:25, Luca Leonardo Scorcia wrote:
> >>
> >> Drop compatible. Regulator nodes do not have compatibles.
> >
> > Thanks for this comment. It took me a while to understand what you
> > meant as most of the MediaTek PMIC regulator drivers still require the
> > compatible node to probe, including MT6397 that was the template for
> > this patch. I compared the driver to MT6359 that does not use it and I
> > am now working on the driver to not rely on it.
> >
> >> With this, you can also drop example as it won't be used.
> >
> > Just to be sure - do you mean remove the compatible attribute from the
> > example, or the whole example section?
>
> The entire example because without the compatible it will be no-op.
>
> >
> >>> +
> >>> +patternProperties:
> >>> +  "^(buck_)?v(core|proc|sys)$":
> >>
> >> Nope, underscores are not allowed. Use only hyphens.
> >
> > Got it. I will actually completely remove the (buck_|ldo_) prefix
> > altogether as suggested in another comment.
> >
> >>> +  "^(ldo_)?v(adc18|camio|cn18|io18)$":
> >>> +    description: LDOs with fixed 1.8V output
> >>
> >> If fixed, then encode it in the schema - min/max microvolt.
> >
> > If possible I'd like some clarification here. According to Chen-Yu
> > Tsai comment [1], dtsi shouldn't contain voltage constraints. The way
>
> That's odd, because long time in the past I heard that DTS must
> absolutely set min/max constraints, because these are real hardware
> (board) constraints for each regulator, unlike the generic and broad
> ones from the driver.
>
> IOW, driver has what datasheet tells. DTS has what actually should be use=
d.
>
> Also, I did not actually require to make min/max required, just they
> have to be specific/constrained.
>
> > I understood this is that electrical constraints are a matter of the
> > actual board layout, so if adjustments are needed they have to be in
> > the board dts. But you also specify "If fixed", so maybe there's an
> > exception to this rule when the constraint is "absolute" and boards
> > can't actually set a different value?
>
> Now I am confused. You wrote - LDOs with fixed 1.8V output - so board
> cannot set it to 2.0V for example. They are affixed. This regulator
> CANNOT physically produce anything else.

As you said, it cannot physically produce anything else. IMO it doesn't
even need voltage constraints as it is already implied by the model and
regulator output, in which case I would actually recommend rejecting
min/max voltage being added to this node.


ChenYu

