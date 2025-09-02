Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA26CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 22:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/F5S5aCKnKbWER3cwLRRgL9laoETfmCZ7U45E2983k=; b=3Lmekva/IQc1qbBwmP31L0jmIJ
	HBTYwPlfyWZTSVRPMQln8gW8bjS2oYnbcV74h5JBjBQLzfjwZp3ECmNlLPRODyW5avF2C+aTP5EQB
	mnRSTi8umrxLRDJsQvxVEDdbX2Zcg7Isl8/Dg9A06KiHpjtN/31dV7vZ4s0TovUr4bwgkuymKQR6S
	2BMAyUBooyY4a1Lb0MMszP6/MY1Q/QvJy69aMLGDlt7uDSJeVCUTjjP4j8Z0/6EpP/+5QMrJF/sUa
	cvInGuwngYP90olptdVBManEx5jJkXs1Dv8iMLnrHgB9gwg34QJA7Aqg7/IeFktcPuLs7OdBl1Kes
	/Row5uaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZwh-00000002UVH-0Vbj;
	Tue, 02 Sep 2025 22:57:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTEP-00000000lrW-1Zwb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 15:47:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so466289366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828056; x=1757432856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/F5S5aCKnKbWER3cwLRRgL9laoETfmCZ7U45E2983k=;
        b=IpyU/Ahs2bBTp8yzP2gOUoZB31CsLeyAMHNCFXNkOZPgY5VByTOM536nisGEi2M1al
         sO9ZMeTZMshjl16MI6mJ7OpD+s7zcvaYjE7/DedyaWSyDNO48Vk1QUVlj8Nr3OU4w4RY
         ZoggdworIkjupDd5Fuda6hRbdE5K54nWEhUvTBEOQ7Cn98WcrJZArcLKheNroKxoBl/w
         hfaTbPY5tzn1rMbqBZesQpPOQzor+cZhCvThIrT5AHt7f/iOonzYY1EbZPyfKr6wb0IX
         EJGCjzmIoCpJEu2G2BZMbXgdrSmcpt6GtHfUDA8XWQBGXtKd7yg8oulMJq995UoKSdk8
         Tr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828056; x=1757432856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/F5S5aCKnKbWER3cwLRRgL9laoETfmCZ7U45E2983k=;
        b=Jie2d9LenDhlVMO0ycWr689CsBLDR9A37mff5dvNlz+z0t5ddv7nyAiJQBkZswL10h
         FVMGgj/f92iVDm+9ArxQzoFLOSmGaVxU+gw6BnXLvo8kQr5Zy+Vm8s6DEnvhZcoLDnfD
         kx8244E7wO/vrJ+rOxoJl2ojYSUWeOZjajIv+GCvFle2S1lhkOWIRpyG3vu11dQfUKIS
         UfAha+iEq0C9LOOnnMaQ6q2jxOAOFAwsMQFVlj123JVJLfh4SAknabPq+VcuEb05tF9Z
         /9Je37qKOR4929wsObq1/Nwm0EWhjH01i84OsV8j131u38/0Na+M3IMFHfw4+NhP9jFm
         iPMw==
X-Forwarded-Encrypted: i=1; AJvYcCVOUSeE0qf5o1/XVontK+1jiRzYhRK0ZrW+wKYkkZ0+d62Gc2nA7v+GrYSm/deygLOYClyGTyMakSbFH6sUduVL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkj+/FDPGG3U0I4HcHkp7MVGuPhLCt9gjDcsr/auFeHyIBt26P
	RtTAEhFTArqUI42bI6rlVd40IJpYvoEGEuvkmr9gVKq2amE/aEgTW3/Ub/a8hPTPXGCYHFaJsws
	7rEiPkN6RDRAQ1YXCdKLcodkaR1gdD5A=
X-Gm-Gg: ASbGncsYx//NxeAYeFkv3mBQ2SVm1d9VtOdp8TVoI3i9Ll/5+Am9o3vePLXGlPxyAla
	tichZ9x7dligIyB1hoYZpaQSl4eLmQntMWyOAPhwaOAhQooh/QQJBVJM0uik4mjlHrKE/zs/9a1
	o36gxpxhDuerNppdB8pWs83hY9DX2HkhOdQVgxmaULesGj+/K3oq2RxDROuP8n7r23TZu1DjjWD
	iHiPT26HkYQSuFW+e69743mv6/65CTh05MrsMZoR3ThRuUENGM=
X-Google-Smtp-Source: AGHT+IHO+sVlMfx8QSa3E+jJFs1XKq77eH6sT+Oi/0M3FytKmT7dw3Vd7isDjyUaRs4YzytFZXWn/W7miK4fa9ZB2ws=
X-Received: by 2002:a17:907:968c:b0:b04:36e3:c077 with SMTP id
 a640c23a62f3a-b0436e3c5c7mr610057766b.22.1756828055502; Tue, 02 Sep 2025
 08:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250902-gainful-meerkat-of-prestige-dd4952@kuoka>
In-Reply-To: <20250902-gainful-meerkat-of-prestige-dd4952@kuoka>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 16:47:09 +0100
X-Gm-Features: Ac12FXyetOJaltGA4R1b5ReNmp3InDleaQQESJFgb0N2JVhr0jmjLXveZ2CLraE
Message-ID: <CA+V-a8up6WfMzRCig=HCaU_QbC63FPCXyk1ZgJrNkGj+FsRbKA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/T2H and RZ/N2H SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_084737_419336_9A103A0C 
X-CRM114-Status: GOOD (  25.93  )
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

Thank you for the review.

On Tue, Sep 2, 2025 at 10:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Sep 02, 2025 at 01:13:00AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
> > (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
> > identical to that found on the RZ/T2H SoC.
> >
> > While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
> > DesignWare MAC (version 5.20), the hardware is synthesized with differe=
nt
> > options compared to the RZ/V2H(P):
> >   - RZ/T2H requires only 3 clocks instead of 7
> >   - RZ/T2H supports 8 RX/TX queue pairs instead of 4
> >   - RZ/T2H needs 2 reset controls with reset-names property, vs. a sing=
le
> >     unnamed reset
> >   - RZ/T2H has the split header feature enabled, while it is disabled o=
n
> >     RZ/V2H(P)
> >
> > To accommodate these differences, introduce a new generic compatible
> > string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
> > RZ/N2H SoCs.
> >
> > The DT schema is updated to validate the clocks, resets, reset-names,
> > interrupts, and interrupt-names properties accordingly. Also extend
> > `snps,dwmac.yaml` with the new `renesas,rzt2h-gbeth` compatible.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../bindings/net/renesas,rzv2h-gbeth.yaml     | 177 ++++++++++++++----
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> >  2 files changed, 138 insertions(+), 40 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.=
yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> > index 23e39bcea96b..e01763389164 100644
> > --- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> > +++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> > @@ -17,63 +17,112 @@ select:
> >            - renesas,r9a09g047-gbeth
> >            - renesas,r9a09g056-gbeth
> >            - renesas,r9a09g057-gbeth
> > +          - renesas,r9a09g077-gbeth
> > +          - renesas,r9a09g087-gbeth
> >            - renesas,rzv2h-gbeth
> >    required:
> >      - compatible
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - renesas,r9a09g047-gbeth # RZ/G3E
> > -          - renesas,r9a09g056-gbeth # RZ/V2N
> > -          - renesas,r9a09g057-gbeth # RZ/V2H(P)
> > -      - const: renesas,rzv2h-gbeth
> > -      - const: snps,dwmac-5.20
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a09g047-gbeth # RZ/G3E
> > +              - renesas,r9a09g056-gbeth # RZ/V2N
> > +              - renesas,r9a09g057-gbeth # RZ/V2H(P)
> > +          - const: renesas,rzv2h-gbeth
> > +          - const: snps,dwmac-5.20
> > +
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a09g077-gbeth # RZ/T2H
> > +              - renesas,r9a09g087-gbeth # RZ/N2H
> > +          - const: renesas,rzt2h-gbeth
> > +          - const: snps,dwmac-5.20
> >
> >    reg:
> >      maxItems: 1
> >
> >    clocks:
> > -    items:
> > -      - description: CSR clock
> > -      - description: AXI system clock
> > -      - description: PTP clock
> > -      - description: TX clock
> > -      - description: RX clock
> > -      - description: TX clock phase-shifted by 180 degrees
> > -      - description: RX clock phase-shifted by 180 degrees
> > +    oneOf:
> > +      - items:
> > +          - description: CSR clock
> > +          - description: AXI system clock
> > +          - description: PTP clock
> > +          - description: TX clock
> > +          - description: RX clock
> > +          - description: TX clock phase-shifted by 180 degrees
> > +          - description: RX clock phase-shifted by 180 degrees
> > +
>
> Drop blank line
>
OK.

> > +      - items:
> > +          - description: CSR clock
> > +          - description: AXI system clock
> > +          - description: TX clock
> >
> >    clock-names:
> > -    items:
> > -      - const: stmmaceth
> > -      - const: pclk
> > -      - const: ptp_ref
> > -      - const: tx
> > -      - const: rx
> > -      - const: tx-180
> > -      - const: rx-180
> > -
> > -  interrupts:
> > -    minItems: 11
> > +    oneOf:
> > +      - items:
> > +          - const: stmmaceth
> > +          - const: pclk
> > +          - const: ptp_ref
> > +          - const: tx
> > +          - const: rx
> > +          - const: tx-180
> > +          - const: rx-180
> > +
>
> Drop blank line
>
OK.

> > +      - items:
> > +          - const: stmmaceth
> > +          - const: pclk
> > +          - const: tx
> > +
> >
>
> Just one blank line
>
OK.

> >    interrupt-names:
> > -    items:
> > -      - const: macirq
> > -      - const: eth_wake_irq
> > -      - const: eth_lpi
> > -      - const: rx-queue-0
> > -      - const: rx-queue-1
> > -      - const: rx-queue-2
> > -      - const: rx-queue-3
> > -      - const: tx-queue-0
> > -      - const: tx-queue-1
> > -      - const: tx-queue-2
> > -      - const: tx-queue-3
> > +    oneOf:
> > +      - items:
> > +          - const: macirq
> > +          - const: eth_wake_irq
> > +          - const: eth_lpi
> > +          - const: rx-queue-0
> > +          - const: rx-queue-1
> > +          - const: rx-queue-2
> > +          - const: rx-queue-3
> > +          - const: tx-queue-0
> > +          - const: tx-queue-1
> > +          - const: tx-queue-2
> > +          - const: tx-queue-3
> > +
> > +      - items:
> > +          - const: macirq
> > +          - const: eth_wake_irq
> > +          - const: eth_lpi
> > +          - const: rx-queue-0
> > +          - const: rx-queue-1
> > +          - const: rx-queue-2
> > +          - const: rx-queue-3
> > +          - const: rx-queue-4
> > +          - const: rx-queue-5
> > +          - const: rx-queue-6
> > +          - const: rx-queue-7
> > +          - const: tx-queue-0
> > +          - const: tx-queue-1
> > +          - const: tx-queue-2
> > +          - const: tx-queue-3
> > +          - const: tx-queue-4
> > +          - const: tx-queue-5
> > +          - const: tx-queue-6
> > +          - const: tx-queue-7
> >
> >    resets:
> > -    items:
> > -      - description: AXI power-on system reset
> > +    oneOf:
> > +      - items:
> > +          - description: AXI power-on system reset
> > +
> > +      - items:
> > +          - description: GMAC stmmaceth reset
>
> That's the same as before, no?
>
Yes, I will update it.

> > +          - description: AHB reset
> > +
> > +  reset-names: true
>
> Does not look needed.
>
Agreed, I will drop it.

Cheers,
Prabhakar

