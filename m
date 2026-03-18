Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9F7107761C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 21:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=; b=rol4ur269kprsX6ppn/YsXiI2h
	K79wINQGykmL7/9iFOHq3kPYl0R8niE+Ws+j0Qwa6nxpptD+ft3m/dvwxGaz3C5qyjCJbx0TMjrQ9
	xFH3lwh3qXuua3Z6u3gaLoChS155ZRViHG96PaNcop3Rbt7q+r/S6bEbiXvpCxWl0ZqaZw0AuDTOh
	H76fmPOAScJ8rei3gMpDVH6B7QXvuOfCzmTtXIaOm+OHOhZvnMKvoF5OLiFLF+AtIkF34NwcPHWeg
	W9zxfO9cSsgZdyRaV1QgR/Q52njzwXV3PRXdfUKXV5gH8/fyW25TorGhq+/+cDUsvLTQ0G0dVUEzc
	qy3Sc48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yOe-00000009NVX-1IPJ;
	Wed, 18 Mar 2026 21:25:44 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yOb-00000009NUr-242Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 21:25:42 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so39469266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 14:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773869139; cv=none;
        d=google.com; s=arc-20240605;
        b=ejjF7jLiGQhej4u7WASUMG9Z//6uSf8vlEWv/M45RXOLbBMDbhyXbMIqD7cSG5aPF+
         k0ENXTUHD5+TImfMAEDmRLY7kt9JyZ/Kt4yLlzzcSOIOZDugAglj6W90wiImAhiPMTBu
         HJuCSiR/1xMkcfNWCAmjreMaxoxRKJfbQ45oQIT2zIsYzDUkVxurrGyImM5eK82vnved
         xp8sTqL7K6ckhnnZTy8XmiSJuMWGXy3ApGJhCodBDqSDDEkVARWFywZ8/6AYzn89Wdue
         Jbr5OfbZJ1JqQlFfr2Oc8jvspgFkLIj7y9pGT4RMyI1ufHGPfb5+9m4lOYUI4slrhwEs
         VbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=;
        fh=N/TQSH+aCVbM8UmCvFLzJ7Rtk9JcyxhqHGWv9BTJ6U8=;
        b=Vp6CjYAHgAiy/mC8Db2kDypezolteQr5c6lBfmQ4tIcBSJ7V/Yv1y9xFGp1+0dmewP
         wmRhuySQpPoqB2DcB53d3ZxBG4PneJxWF9dIf+IjarmQgrmqXOc7rnTbFObREPA4/5U3
         eHkKNI+4NdWAlTZjKJlZP9ZunvPTHnowdzHn3b+Bqrma1ST5TBwQCNLQbZQRfDwp2D53
         QyljMs/Ma0zzmD6KwRz5bWQa3kNRnzYi40ztTKgu1/9F3D4zZZghu50c+Xf4lNMMoikD
         Hj13GFpDYEZfZ433i9yeH4NHBuSOrFg4dVDB6MPmHBqviTVnJ51hQgocQq37yRQvxt53
         oz5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773869139; x=1774473939; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=;
        b=DIGbegu3A9HzWPmO97IN7D9SrXS+bIFAnI9WntNUvChub4wASUMgGpCVE/dyFZuOEU
         XLD9fl8kAo+Su9p12k2LBoNO0aHcD47wl77hdpqMZS6uwb2NLcE1/Um2t+/ywuwh8nTK
         FCAs0jPVmf0RbF6wR9gm1b/wI0UEh18lflR6Jbl0Aak0mkgRnFvB+Wcg7Dg0SXjdc7ON
         awBkVpKWrS6W02wo40F4Vntyt+PLqxI5EdShyJou0yUEzM677Dzp70CmH17M7WMr3dgm
         JYoxc6zq5UWQUlV59d3eX9K96MGrVzggGw35efAVIWvT4UeySbHb23cIGi0ohhvvYAnJ
         mA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773869139; x=1774473939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=;
        b=oeKpdw2j9fvvJE4JLmfNpX2fA3zZMx4l/w+3WvZIO20GEtLoI4UBGgMpdV8KyrBJBw
         F+dzl5aDmckYFc//RFZoM8m4QpIcBl2Jkc+NthwuPgGEQy5yd4RJRAxifsZJU2Lw8YGm
         Q2ct+HFMTyzL7FBnLizYvitt1NlHs7BA24ijKFnFGwWEevo8ENcHulMlhl0zS7IQzrUj
         cug89i5vJyGnr/w9ZX2e4enJK/THFHmY180kRj9yT1xhOr+jQSaIEcM4AL7uLGbV1wPv
         bvSF2YXognLZmYlatpECflibebgrdtR3gQfyC1AzgUD1PVmmnkl3qx0BTNi25dpoB/WX
         q9LA==
X-Forwarded-Encrypted: i=1; AJvYcCVibCaLgYPL7Kbwvg7TX49ldTLdf6RxJfoeTNv3ogOfRGkYZlFZArE67Fo0TdrZyy8FDiuR+ajiDjavyYH797Tw@lists.infradead.org
X-Gm-Message-State: AOJu0YyFxEXczaifqfb7ZviZhjzCggCQtXBXCfan1MU9dMe5HBhn68qD
	sSYz8an/S5sQMFf5sf+ei5ebC1uUMYq/YqUuZBeg9Zz/OohwAKtG2IVZt6M1E6pb7chkVaSX5X2
	uOZ4AwEp0/TAYIqHCeOMirGyKzG+tYNg=
X-Gm-Gg: ATEYQzzzx13AgUbjoklB/Q2CMFE9IDhxLHhqL+vgbJn7pF4o9TysAA1F2QwBV6W/dm8
	DTyTeyhh5ddR5KSfB08R5eps3KOdTf812uJI+4WPZqdGE5J9xq8vwAl7gkipIY0Kd1O+dEfSgUG
	6PIMG1PH5WvrgRh+ggh07z5UKyElLcrEyDIJse0h8TI2EdCwVkyfhTSX3HvAPSuoquAj2uzFiIS
	iHwF7Y/tjocoJIviTgp0Uw/ZHbNC6apYIliV8Id1s6MJD+V2YMND8HR/u+ueAuL/fLfBid46SSV
	w4VKiw==
X-Received: by 2002:a17:906:99c5:b0:b93:9407:ea5c with SMTP id
 a640c23a62f3a-b97f4b70e51mr342818966b.57.1773869138582; Wed, 18 Mar 2026
 14:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-4-l.scorcia@gmail.com>
 <20260318-nickel-serval-of-tolerance-621bad@quoll>
In-Reply-To: <20260318-nickel-serval-of-tolerance-621bad@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 18 Mar 2026 22:25:26 +0100
X-Gm-Features: AaiRm51yI9RGCvrRh7GVNMdJwfVjHSZ_bJ1ljw9KDUXHaZfxU7GvIWfUsRzyb80
Message-ID: <CAORyz2Laoo4EiLcHZ-ygLiFGW_h8qV7QxqNsMbueM=nov5zH0A@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_142541_591821_C196FE27 
X-CRM114-Status: GOOD (  20.55  )
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

Il giorno mer 18 mar 2026 alle ore 08:43 Krzysztof Kozlowski
<krzk@kernel.org> ha scritto:

> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
> You already received this feedback from Mark.

I am sorry I missed these. I will revise all of them in the next version.

> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
[...]
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt6392-regulator
>
> Drop compatible. Regulator nodes do not have compatibles.

Thanks for this comment. It took me a while to understand what you
meant as most of the MediaTek PMIC regulator drivers still require the
compatible node to probe, including MT6397 that was the template for
this patch. I compared the driver to MT6359 that does not use it and I
am now working on the driver to not rely on it.

> With this, you can also drop example as it won't be used.

Just to be sure - do you mean remove the compatible attribute from the
example, or the whole example section?

> > +
> > +patternProperties:
> > +  "^(buck_)?v(core|proc|sys)$":
>
> Nope, underscores are not allowed. Use only hyphens.

Got it. I will actually completely remove the (buck_|ldo_) prefix
altogether as suggested in another comment.

> > +  "^(ldo_)?v(adc18|camio|cn18|io18)$":
> > +    description: LDOs with fixed 1.8V output
>
> If fixed, then encode it in the schema - min/max microvolt.

If possible I'd like some clarification here. According to Chen-Yu
Tsai comment [1], dtsi shouldn't contain voltage constraints. The way
I understood this is that electrical constraints are a matter of the
actual board layout, so if adjustments are needed they have to be in
the board dts. But you also specify "If fixed", so maybe there's an
exception to this rule when the constraint is "absolute" and boards
can't actually set a different value?

[1] https://lore.kernel.org/linux-mediatek/28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com/T/#mb1473bb5515f3e5a1bb3ff20c717b387c42373ef

Thank you for your help!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

