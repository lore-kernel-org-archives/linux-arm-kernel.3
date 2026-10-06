Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B301FCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 09:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVTxTfkNs+IvzxUmHzgjnWzXGShomJ5y8a1XbauhqO0=; b=qtDxoGLYGVuQ9s
	JFtNUZwQnxklFGBRLrHQnCqBHFTdB33IoaqyCOF8S14QEcbDEJkKyoNhi1q2B/mfXEKZjEC7KsuNo
	npWJxJmUR4x6DvTA7RBA2wc74xrhhaJtCz6GWyXb+zCCSMznzPDs4g9jXVfm62lHLLKu7P7kItDXm
	IL52kmOpV2KmLi2Cu7egR23PaWW9EAKJqCKSgAJwCmeSz+7w69C64kEn6UCROFP8dHvBrpp7Fx6D9
	x3vp9SjSE5DQ7wrdFalX64OxVjj0Pio1W4QPlrcBYHm86vtcslUCChMtp21BFeqk9zChBCRZR6MjD
	qMRWFEfwHb17/E2y7MdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1XC-00000000OPE-1HR4;
	Tue, 06 Oct 2026 09:32:30 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1X9-00000000OOn-23XG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 09:32:28 +0000
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53391786e55so6606841cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 02:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279146; x=1791883946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVTxTfkNs+IvzxUmHzgjnWzXGShomJ5y8a1XbauhqO0=;
        b=CzHB4ARIJ7QnG6mtcj68geWU2RoS/CVqJJ0Ra1TeMAES1dI9q9UyxE+gZclfo5tn/Z
         ClkuBbNN5Ubd/ND1a5FVub8pBYPW9f7O7G4Temp3ATiX0Fllr8mBAJ0SuNOU4oWCdKgq
         sdAXmd3RI1LqjijZh4c9dmX20R4zd8RVP3jGz2oyqDXGKWS+6UI5IzVyPK9ZafJnrto+
         Hh6ZJtjGcEgqkBZQHHg67l3V/BQKr93/ojiSmRfOe7qUseFReJmzX+G3S6N7qytOZsiW
         W3w7VVpQmk1h0/FpIvP3VsQB4MsTnUCtZkDeg+Wb6qjrAAhpyy6jwmVHLWLNnnQviYuB
         03cA==
X-Forwarded-Encrypted: i=1; AKwUvBymfmP8zS1CQgTik4JrLhgzluindhhpcUX1uIWLqkAFnLTSjm+ASJeckMHIIfa+MERG0kYTmBkICDSyhknIQLYp@lists.infradead.org
X-Gm-Message-State: AFuF++lTxSQf+GEqIXpISquVzNmx2JjjFQIV7EjHBe2fx68hNlIvbbOw
	hpscNrwdChl0fEF2ROuy+5HAVuxncMRLYS0vONO/3WJo9GA+ei/NYoPRD0fEb4YSSwuIIQ==
X-Gm-Gg: AYBFou0B65/FzeKN3wdFUTN1pDMnN+ZOf+gzvwItHW4dAIwMhtDJBj/uxvgTi0PJ86g
	QWUwvli48tHq1CWgdCFfjmsbIXk3cEgWzOioWTSKmRigCkbh4ObkEMAIdpYyaH5OJ9WABu8WwVC
	mJu4MXjpC9BdcVrOmiV0VwII8Mktsl4Y8fJ/FySB2cpoKE7PoULHHm2W8a1uKpvskeTL6fb62t8
	P7mU1DKuO9+sk9sOpK9qgLBQjCrfh4Blm7XrmlYPdzjfhERDa323vN1MQgs/S+uRWxWoS4cTJf6
	gBmfJf6m0YpqHpkc8gVlTsaaLtShW3/1MO2+raMG3reMiYlmRutiCc9YWB/zjmdpj6QOAnS877w
	QlcDyl6SfjX17ZrNjSGAufaUBuKuqUd8axW2dgj0oCcJXAkPIw59rbeC/qinxKWg/QUvTGuVaXM
	wkK1sRhcGOx6CUIyESsYZQBn8DBoS+OMbus2kY2ampu44iwoFmp9b/T0O8JSkEwAwF2Uuv7tXtU
	qUzy3qp9Jylmqf/upA8FkyxkCsJ+k0i0UKGcj8+PaI4+mg2Vm2BTg29l+lB9jm/M4A=
X-Received: by 2002:a05:622a:987:b0:535:20ea:cefe with SMTP id d75a77b69052e-53566910d1amr10681351cf.18.1791279146150;
        Tue, 06 Oct 2026 02:32:26 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398a9c92csm119411501cf.11.2026.10.06.02.32.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 02:32:25 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5356b6a7fe5so993971cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 02:32:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwN+4463K0nkeKKK69pqiv9o5GgLGVAPoYfPFpRq+1Oj91aTeu7rLBolpxuqAxv/c7y8lnHEjvY4rRysuOAdfO5@lists.infradead.org
X-Received: by 2002:a05:690c:7108:b0:8ae:7fb9:8cb8 with SMTP id
 00721157ae682-8b04f3b6667mr2040067b3.17.1791278683947; Tue, 06 Oct 2026
 02:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20261004144046.391444-1-tanure@linux.com> <20261004144046.391444-3-tanure@linux.com>
 <asN_-5zalENhkdVA@squawk>
In-Reply-To: <asN_-5zalENhkdVA@squawk>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 6 Oct 2026 10:24:32 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2hD_LTcimHAVhyzgTnp9jYxKKFD2TK5cv9-wLjDh8+wQ@mail.gmail.com>
X-Gm-Features: AclHuK-bVUCezgDuqipnwl794qiJm9NtCr-yWp4gG5KzmPFjPQMebZJ1Y2LQr9E
Message-ID: <CAJX_Q+2hD_LTcimHAVhyzgTnp9jYxKKFD2TK5cv9-wLjDh8+wQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_023227_535010_84EDFD0C 
X-CRM114-Status: GOOD (  30.53  )
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
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 5, 2026 at 11:46=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sun, Oct 04, 2026 at 03:40:42PM +0100, Lucas Tanure wrote:
> > The T7 has the same ethernet glue as the G12A, but the controller
> > reaches DRAM through a pipeline stage that the hardware design inserts
> > in the bus path. That stage has a gate of its own, which no other membe=
r
> > of the family has. Nothing else in Linux claims the gate, so it is
> > switched off as unused and the port can then no longer complete a
> > transfer.
> >
> > Describing it means a fourth clock, and the fourth clock of the existin=
g
> > list is the one driving the timing adjustment logic. The T7 applies the
> > RGMII RX delay through PRG_ETH1 and never enables that logic, so it has
> > no use for that clock. Give the T7 a list of its own with the pipeline
> > gate as the fourth entry, under the same name the SD/eMMC controllers o=
f
> > this SoC already use for the equivalent stage on their own bus path. Al=
l
> > four entries are required, since the port cannot move data without any
> > of them.
> >
> > The RX delay range is the one the G12A has, since it is the same
> > register field.
> >
> > The compatible pairs the T7 name with the 5.10a Synopsys core the MAC
> > reports, and with the generic fallback.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index 90ef79161ab1..96118b4d1560 100644
> > --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > @@ -23,6 +23,7 @@ select:
> >            - amlogic,meson-gxbb-dwmac
> >            - amlogic,meson-axg-dwmac
> >            - amlogic,meson-g12a-dwmac
> > +          - amlogic,t7-dwmac
> >    required:
> >      - compatible
> >
> > @@ -57,6 +58,47 @@ allOf:
> >              - const: clkin1
> >              - const: timing-adjustment
> >
> > +  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enabl=
es the
> > +  # timing adjustment logic, so it has no timing-adjustment clock. Wha=
t it does
> > +  # need is the gate of the pipeline stage the controller reaches DRAM=
 through.
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: amlogic,t7-dwmac
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: GMAC main clock
> > +            - description: First parent clock of the internal mux
> > +            - description: Second parent clock of the internal mux
> > +            - description:
> > +                clock of the pipeline stage inserted in the bus path b=
etween
> > +                the controller and the DRAM. Without it, the controlle=
r cannot
> > +                complete DMA transfers.
>
> Have you checked that this actually works as a limiter to only 4 clocks?
I have now, and it does limit to four. Adding
a fifth clock to the board gets rejected:

  ethernet@fdc00000 (amlogic,t7-dwmac): clock-names:
    ['stmmaceth', 'clkin0', 'clkin1', 'pipeline', 'bogus'] is too long


> There's an additionalItems: true in the snps,dwmac.yaml that I don't
> know if will permit random additional items here.
There are two checks on clocks and both have to pass: snps,dwmac.yaml
allows 1 to 10 items, the t7 branch allows exactly 4. The
additionalItems: true only relaxes the first one, so the second still
rejects a fifth clock. The "exactly 4" is not something I wrote -
dt-schema's _fixup_items_size() sets minItems and maxItems from the
length of the items list.

>
> Cheers,
> Conor.
>
> > +
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: clkin0
> > +            - const: clkin1
> > +            - const: pipeline
> > +
> > +  # Delay definitions for Meson8b and newer (including T7)
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson8m2-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> > +    then:
> > +      properties:
> >          amlogic,tx-delay-ns:
> >            enum: [0, 2, 4, 6]
> >            default: 2
> > @@ -106,6 +148,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -143,6 +186,10 @@ properties:
> >                - amlogic,meson6-dwmac
> >                - amlogic,meson8m2-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
> >
> >    reg:
> >      items:
> > --
> > 2.56.0
> >

