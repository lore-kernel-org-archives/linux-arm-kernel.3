Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83CECA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=; b=QoYfpig9XuKUm87aFZa+GGxAqA
	rsrs1Jh2PLuzyYA/PYtSIq6f5jDAmMs1XXLhIoUoE2e6bXA4sfD5Q3/gc0HszxPEu/jrpjghMJG89
	TnP0PhBlwYXWED7fIzF3x+Xo1LoMe9KNvqXggyTtIyxMFFqUzqsmlOKnuSo2bsNyxqtLb6CDrgFc6
	w2fd4j1DU5FT8xCWevGRERHMFbKAys4getyyFVfRwlmM0wb6EPG4We3wD/XytJOnlPopl+i2JeoaQ
	APCftwsEmpffr7OMt0GndWyF9j9oiBn4grnUXPBqIyOC+1gUwL3zYOVvA9PVguCl8jkqt2IOOwKss
	9RjPWwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEi2D-00000003gNf-0xRj;
	Thu, 08 Oct 2026 06:55:21 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEi2A-00000003gMp-2Ckl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:55:19 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-881269371acso163520b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791442517; cv=none;
        d=google.com; s=arc-20260327;
        b=qTgEkW4MHRXVAf85WrAev0m9Oy2QOhT3W5RtcR3CpxoofONQrRuAlR78/TeMNkDA3H
         eqhM05UM2DUuUIeO6lo9aNa4Vp0XBbbIXNyoBRSlNI8VY/zaTBeM3ZVGwAHPaVR32fnF
         q1dpEatNh214md6l1V9GGMqnaG5sPiFLKxyvIGL5p12lALDCeMHE18WRm8ydCTkyOvR7
         qzjz8a6s7UPRduifCF4fDz6cpr2GRQ7OYV1QGMKkSGN1Bpk5tnXJMI2XgD1MoOILtsMR
         h2csWma96YK4+CJQovD+dj/aiLRkYPCKRS8AYmBMPru/9O+SPfbEw53Fn3ZBlXats5tZ
         +ACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        fh=Gjqlrb4ifIhP97MuLqA5e0fqq/fTS+dXwWhtMf35gGg=;
        b=gS6HHL5tFP4W71uYkbAYYF36MRrTIsvzs9KntBorGSRHGnTtHWJ7+tAe6c0jOyOzJ1
         4GDrAuYWypygHBUv/2TG12p0zYf6xrgAtJUbCb08M5LXDulKEcwIBGI6kuOS8DqVrubh
         5LmBHdliEFPCtnKY/Qd9XDzb5jHqH6fW4TzEHjJaNPiM5aA+FVOF/GtJ06t0tked4F08
         nb9nsjiDL+e3vnL4w+cA0cc3F49Pb+pPpU/kMIzxB52wS3aWtByIiWUacugFmV4z+FwT
         CZqEdj9f5m23hOurHzBJrpd+H04pxdg8dIPwKCU9VXB1yY6q3+p928qY5Gdf07kAD9kR
         8eXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791442517; x=1792047317; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        b=GDItlzwguWSg9HNVEtTJPInQKX/M3JVSBb5nwmKF/Qukz7Yr50DLHuLdNTLjOg90Na
         8VdwGU1sK0XGNoqd806ZaxcnF0JcP5l+gn5EsCvoufxdJBNcao7V83ar3EWqNcHPSBOk
         KNyrWKE1R9K1EyVf3+ir/BUSym191IZv1grRVpMHizf8xQh4nHsDyMerdoNmt0JfUI1x
         LIVp+wi5J5UIEU4+7/WW6w3wkZqFUVLYFIzPz+QayeoLA75PMjjpQfHdo9ceB3pR8Tqh
         xItMzvhkkhnQrhbI9mcqo8/q6c8p3+6Oeku7QXXoas16zqd8GPXNnPVpPcjMvFavRHXQ
         idlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442517; x=1792047317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        b=OMpbHuv3eosV/u7paMDu8NpkYMXhKtEGKj22eb05t+n72qsKjhs1/vXz4437lyqDlI
         TzbQPJ7val27XqtlIhUUIv0fVRBSmoFBqGEUx/4XN4rcsEfGNRI0gV48elzn9wJc7gDw
         hdp+0uU/8PY81w5l3U6zRnLgF+bfQ3Rkxlj632IEMNzOpjbOHN362WJ2lAwfjjT1QGAH
         i6KTAVqRHvqPfVl85Oel9t895WT5ByFryvZt+y/RrI+GlAirUJnCozY07oand1snfsqs
         tmE9ltfzG1Tk0/IugePufMofQO2JOQ1UVTMY42Mly7dEQGNJRIzqLMoXxQsz6hPaoIWd
         69ew==
X-Forwarded-Encrypted: i=1; AKwUvBzrkvGN2vBwJfvP8ceYngmP1v728wv0XsJVf2jwr0w+4tOsXgv7RhCYbeSlI502toQ4Oq/tNCJHBlr7hN23c0Pn@lists.infradead.org
X-Gm-Message-State: AFuF++lw3ncXJ4zzDOL82NZ4O/bExwksCzIqb3RBopT4dxXfh0XG+xYx
	0LxCKMtP2l2Eu+jq1N4fNYfg+FaZt9LiUH/m02XCeyOOl7ccj1RzyFMgcDbGqGbukYtOWO/re2N
	BkfT91O0ol25UBU9IysacwRz6ddcGLm0=
X-Gm-Gg: AYBFou27+PCZ56HKb7LA0Gfd2IX8qFUArp938DS1zCTrkkRs5m/6mgwNhzbWY6Wol+Y
	vmzzhQvDSUoyGncWVCnN4ZqrGvjuG0EDo2+/A/94Zy8jAvhvR1VFmCTVjz8vjnWDD0pMoqpyfP0
	cOIFrE84Uuzy/2AobLOnHXDNXbH6lzs3jdokSlyIFhDihTvdoBqCtTQlJkLTG+v7wW5NLUZh36j
	mCn/49wJq0g5LnXdiUWYL0p6/QH3/NpMugO7ZjMmp/kWRc6BrlfFIhqD9Ua3bWGp8b2l0Edn4lV
	0owmLkLzw9+I+aYGMNFDvLYe8kGXAX+uIXLgUq+fPBpoLp2sCKqoQuPZY8KhXqBcKUp6N6Q=
X-Received: by 2002:a05:6a21:3e09:b0:3de:3bfb:dc65 with SMTP id
 adf61e73a8af0-3e14c5a1255mr1132038637.34.1791442517344; Wed, 07 Oct 2026
 23:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261005202731.153971-1-pmazzini@gmail.com> <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org>
In-Reply-To: <20261007211626.GA338242-robh@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 8 Oct 2026 07:54:59 +0100
X-Gm-Features: AclHuK9HNWmbYmgrwOCN8Dj1r6Aaf0O489JwabVju8_e_8zgAdvV8DQG3O2TPc8
Message-ID: <CAAxh=jsoFDfNGEtcWvxe5VNH-knf8LZg9aVh800LF9t-7m1qbA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
To: Rob Herring <robh@kernel.org>, andre.przywara@arm.com
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_235518_570172_1AA608A3 
X-CRM114-Status: GOOD (  19.06  )
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

Hi Rob,

The B288 uses the same scheme as the A523, and the A733 queued for
7.4, which the shared pinctrl-sunxi-dt helper parses, so I'd rather
stay consistent with them.
Andre, what do you think?

Thanks,
Pablo

On Wed, Oct 7, 2026 at 10:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Oct 05, 2026 at 09:27:23PM +0100, Pablo Mazzini wrote:
> > The B288 driver takes its mux values from the DT, so allwinner,pinmux
> > becomes an allowed property here, required for this compatible only.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4=
i-a10-pinctrl.yaml
> > index 45b7a0b6c626..b1f093d218f5 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > @@ -39,6 +39,7 @@ properties:
> >        - allwinner,sun8i-a33-pinctrl
> >        - allwinner,sun8i-a83t-pinctrl
> >        - allwinner,sun8i-a83t-r-pinctrl
> > +      - allwinner,sun8i-b288-pinctrl
> >        - allwinner,sun8i-h3-pinctrl
> >        - allwinner,sun8i-h3-r-pinctrl
> >        - allwinner,sun8i-r40-pinctrl
> > @@ -120,6 +121,15 @@ patternProperties:
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >          enum: [10, 20, 30, 40]
> >
> > +      allwinner,pinmux:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Pinmux selector value, for each pin. Only used by SoCs whose
> > +          driver takes the mux values from the DT instead of an in-dri=
ver
> > +          table. Almost every time this value is the same for all pins=
, so
> > +          any array shorter than the number of pins will repeat the la=
st
> > +          value, to allow just specifying a single cell, for all cells=
.
>
> Perhaps new platforms should move to the common 'pinmux' property?
>
> Rob

