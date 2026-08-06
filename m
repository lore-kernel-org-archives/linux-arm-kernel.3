Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637AAC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bm5BP89+hYEVtcyVkLS5Qjs1T3/LfUuhKO2G7nsDJlg=; b=HRIetNnrTBJCz5kXvNV1mBhxm4
	w5q9rzAN05XxmtIHS3+swMi+Vm/nPvxuEanTgPVOHrmvHpDrANCMHNNzL7EBoYl9IefFZTssb727t
	PSMBLz1xDTRhkJJf2nNMAZfOFqVPNMJRLuKNRlk1dPi/CHlTGDwpHkmqlFfHajgP+6lOzsNNj+Gms
	qcbZ35SWSV1VJPgphQQ01uCjjft6wMUOiLgqXXvXTsUbe9wMIkJWuojtyuDnKQ3HIwMIKwlsn+GSy
	PKIMpo2DZHGuwfSFP14I7bZNe0oR86hecet/H22fTtISe5cyeV8+er2JhEeAu6fo+0TFYGtnlYRvl
	IqmERVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzDm-00000005zHy-2Iys;
	Thu, 06 Aug 2026 14:37:22 +0000
Received: from mail-ed2-x0b.google.com ([2a00:1450:4864:33::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzDj-00000005zH0-3Rtn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 14:37:21 +0000
Received: by mail-ed2-x0b.google.com with SMTP id 4fb4d7f45d1cf-6a14f40cf1eso1413441a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 07:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786027038; cv=none;
        d=google.com; s=arc-20260327;
        b=WxtlTqutO/3/OdJg4WtLAdcwZwewPmeRQOIDbK91aZ41djIOIcrp4Ym7HN+0VIho+R
         D/fEC1Gi4lhFDRt2iML2sAoKV03ZMsbUrTirQLUkKYVKfxEEpvyU4Bh9CYYylHbSU/vU
         im6wynJEJ2kGwhk+G0w0bAGyog3tIWwcvL28Sw3ZZhsT/CM/5dzonN/yNrjGaYnR/MSC
         emyxhQZX6FdsRvAVJpVFioZ9Sk9vN+BnuvbDciOIhQAGyFrbXfGohjfeoIwVfZ1NGkoN
         vRl8kb23AUUXwa/zp9B56W3AX4hx7DFjCvDwXj/agqpE8792lXSAGkRFiCWeYthD0/C6
         uVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bm5BP89+hYEVtcyVkLS5Qjs1T3/LfUuhKO2G7nsDJlg=;
        fh=J+Sp5chq/R1zCjjrOtX9YnEafp24xZLBsBakN0WSWrI=;
        b=qlkbINk3WnASlJy4gNvEBjNEYfRvv3f7Wgfpb1VHwsrknXMHFLTFeGSri6JSIZw/0E
         b2xJcw01A2h0BmcZDKa+asfh4b2h5M2IiyVMrjCtDIxvJbBapYJu1QZXql9kd1P2zzwz
         4pfiN87tWry8JayKBAwNP0u7aT21XVxyGEvWVmUvZmfzVYY4oESK4ioGLUR0WwRkzlGw
         LLMRS66PZ0f1qTkVt0ICh3W3/yQIHwE61u2ODjc/abhCBFwB6EpJmhZ/dQuJexG8pDPa
         1tmqQZQ6KMaFbwhxKByLKOYYQ+6uPmzFFHbLqjtghIXTBlcTbhp+2ZJEsOBLRGYc2lTc
         Gj3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786027038; x=1786631838; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bm5BP89+hYEVtcyVkLS5Qjs1T3/LfUuhKO2G7nsDJlg=;
        b=eojSuUr2/09UeCOF/7dfGbDd3eoXOTclrco54OdyHo1ST1JbvR9wmoPuvzdSFz0t74
         FEsu+d1SEQAnTmBZmkfwnBINbSR3iocvovC4SbqCAFvl+0M/mIIOWy6OQBbvnqYFZn6m
         wEeHJ1H/3UzzF7bAmfKMgR9cbCXJBbAaW7YedcfxTeC8teXMC2FeJLm8+8yo23YBQ/Ok
         xpq7K7IbvQGYgZBg6ei9fD4jAB/4g+c7eKT/jjfx5ipF5vjFUR/9tQTg7XNML4JUgGlF
         I0PVhcUDGY+RWqUb4URTQZj4xs8RJiqZXOfEJuQ8VHZhmE/+HskF6+GBqO1oLv5a/z3m
         KVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027038; x=1786631838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bm5BP89+hYEVtcyVkLS5Qjs1T3/LfUuhKO2G7nsDJlg=;
        b=awIaGK3zOEzbuJPLv08R8KJsi7Nfh1Q+m0rGy8GkLNbB3WV24tavWNPOBMDfEfqVGG
         5fKTnXuHxhBkfENLmQyfVZZzXmLQxuPPMMqJihbsgwx2XmTJZFQtn0xy0//FiMLC87+C
         m4GPE1DIbJMWID5zNNCD2M3gmYDOUzXnJgobQ7taf8TL3Wdqt7eHBScRwJQ6/X95P85Q
         40ENzkOcnCpFmgZwIwJ/2F62d9g6IHYLmiMF6GSSLLDwFnSjMB9n3Amg/M1+802e1yDL
         XPRVRXJXTtlmSkeObIxthsaWOHqKETsCP0AfObBKxSRMs7B1MWAXklEXvybJQ6vlg6kv
         7Qzg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5hjYXOadIna1mBi8/1g+ycgzB86h5D3LkB4TiXZFdsPrlhwAs4dhUm/LeDCkpXxbpLNA+5/IikB/SdhupPBk9@lists.infradead.org
X-Gm-Message-State: AOJu0YxWnP/zTcgH5umYSlmgPDvaiUuM2WZN5dkoO+n25PoVIYHfNQoC
	51/fDU51++iFja44yOZnBQCdRrp24zP/DZltrLW56aYF/fyrXH9QSQhxZ4kGlwQadBFlDKO4dsZ
	it1w/rMOUqxjyN3U51MyH3xitHIAhkbY=
X-Gm-Gg: AR+sD138Aee440bNxdgVGZz7go6TIdbgj/BOE0CH/ozYnYwAEOMOD8EmNLWXujNK86y
	Wrts4DgDAV+R8CodBr4xGPBGxuzjl7rCeVFmAifXYif5x/1ixxTQGBqkFsTO4Whb8SIk0Jg69fd
	jWfzhE2+GOdWqlCMFrYtJTPu73EB0+d/4GfVuOX/IgTzpxKiBzdqYojKEpDzwio0zvOxJ8NPrrc
	Jo62Jfi3HmQx8j6xEo0u0d4sfZX2qaIZ2f5uCe8SaPGQwCiTlf3LnU1dehiVueyZDfWrjewcvFx
	xtSm1qFOmSTET8QiLOlTLJhVpfbF8DYnC6SGxj324kyY1PInlifNJ3TCn0V+ikpOgeowMA==
X-Received: by 2002:a05:6938:a08d:20b0:c20:5121:89c1 with SMTP id
 a640c23a62f3a-c205121911dmr431715766b.12.1786027037242; Thu, 06 Aug 2026
 07:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-6-coiaprant@gmail.com>
 <20260805-stirring-wondrous-mule-faf37d@quoll>
In-Reply-To: <20260805-stirring-wondrous-mule-faf37d@quoll>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 6 Aug 2026 22:37:12 +0800
X-Gm-Features: AUfX_mwaP0yLJ9HCO94OK0aTh4w5tIMmxMB_NLgFfaixnrT58_1pSbbkFIzX-Ko
Message-ID: <CALj3r0iFULLqkfqPA6RdGPc1PQ4CvOPw82_+QmRn8vBhWnBMHA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073719_906145_37B79D19 
X-CRM114-Status: GOOD (  29.55  )
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

Hi Krzysztof,

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B48=E6=9C=886=E6=
=97=A5=E5=91=A8=E5=9B=9B 14:49=E5=86=99=E9=81=93=EF=BC=9A
> I don't understand any of these. There are none of my quotes. I don't
> get what you are referring to.

Sorry for the confusing previous reply, I didn't quote your original
comments properly. Here's a clean response with your points quoted.

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B48=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=B8=89 15:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Aug 01, 2026 at 10:22:28PM +0800, Coia Prant wrote:
> > Add device tree binding documentation for the Synopsys DesignWare
> > XPCS integrated on the Rockchip RK3568 SoC.
> >
> > The XPCS is accessed over the APB3 bus and internally connected to
> > a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
> > QSGMII modes, with four MII ports.
> >
> > The binding describes:
> > - Required properties: compatible, reg, clocks, clock-names
> > - Optional properties: phys, phy-names, power-domains
> > - pcs-mii sub-nodes for each MII port (reg 0..3)
>
> Irrelevant paragraph. We can read the diff. Drop.
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree=
/bindings/submitting-patches.rst#L23

Okay. I will drop these in v3.

> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3568-xpcs
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
>
> reg is always the second property.
>
> Also, use consistent style of quotes.

Okay.

> > +
> > +  reg:
> > +    description: |
> > +      Base address and size of the XPCS register space mapped over the
> > +      APB3 bus.
>
> Drop description, redundant.

I'll drop the redundant description paragraph from the commit message
and keep only the essential information.

> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: |
> > +      Clock sources for the XPCS:
> > +      - csr: APB3 bus interface clock (clk_csr_i), required for regist=
er
> > +        access.
> > +      - eee: EEE clock (clk_eee_i), required for Energy Efficient
> > +        Ethernet (EEE) operation.
> > +    minItems: 2
> > +    maxItems: 2
>
> No, instead list items with description.

I'll change to items with descriptions.

> > +
> > +  clock-names:
> > +    items:
> > +      - const: csr
> > +      - const: eee
> > +
> > +  phys:
> > +    description: |
>
> Do not need '|' unless you need to preserve formatting.

I'll remove unnecessary '|' where not needed.

> > +      The phandle of SerDes PHY (Naneng Combo PHY) that provides
> > +      the serial lanes for 1000BASE-X / SGMII / QSGMII.
> > +      The SerDes must be powered on and initialised before any XPCS
> > +      register access.
> > +    maxItems: 1
> > +
> > +  phy-names:
> > +    const: serdes
> > +
> > +  power-domains:
> > +    description: |
> > +      Power domain for the XPCS.
>
> Drop sentence and |

I'll drop the redundant part.

> > +      On RK3568 this is typically the PD_PIPE power domain, which also
> > +      supplies the SerDes PHY.
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^pcs-mii@[0-3]$":
>
> Why `git grep pcs-mii@` gives me no results? Are you doing this
> similarly to existing devices or is this quite different device than
> every other hardware?

I used "pcs-mii" because the Rockchip TRM refers to these as "MII ports"
and they are functionally PCS instances. I see a similar pattern in the
Renesas RZN1 MIIC binding (renesas,rzn1-miic.yaml), which uses
"mii-conv@[0-5]$" for its ports.

If you prefer a different name (e.g., "port@0"-"port@3"), I'm happy to
change it. Please let me know.

> > +    type: object
> > +    description: |
>
> Same here
>
> > +      One of the four MII ports of the XPCS.
> > +      The port number is specified by the reg property (0..3).
>
> Drop sentence, redundant. Schema tells that.

I'll fix this to use items with min/max.

> > +      The port is linked to an Ethernet MAC controller via the
> > +      pcs-handle property in the MAC's device tree node.
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 3
> > +        description: |
>
> As well
>
> > +          MII port number of PCS.
> > +
> > +      status: true
>
> Nope, do you see anywhere code like this?

I'll remove this generic property.

Thanks,
Coia

