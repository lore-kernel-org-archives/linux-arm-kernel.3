Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDA7C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmcYADO6Ts8LiEjQjRl2AEglFUJkqPE38Uht7fpIgwo=; b=wJ6PvPbUmtKzhCImpAQGTJtXjX
	3saIzmV52RmSUZ/upVCGXEEzQ8vvJmkz6cAjrFXOb1D1QdxfnhRHwF/Srx5NNC1obEqzXqqUc56VT
	bBzxHiIwMRorBU9RMmdk9uuVoh1XZysqqzNOl0ZLcjwpLXw0MKdhDwxplqE6OE/LJQqHGv8KpfNqC
	59qV9j5ysk2umtNFl4qKmoiojU4BFOwXZfljz2qnUq6+EAPSHNdy+MgJ6arvjKdyRPDyQlzVWZv3R
	M/NtgroWkEYrILkvqujK5DKp2ruNY4ABpOtF6FIqWREusjQdXqyae2s3sZ7y04sNec9aaUym1KjLG
	3HWw07jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IZT-0000000BsjS-0mnr;
	Thu, 17 Apr 2025 06:17:59 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IXc-0000000BsT2-3vX6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:16:06 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-476a304a8edso4369731cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744870564; x=1745475364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmcYADO6Ts8LiEjQjRl2AEglFUJkqPE38Uht7fpIgwo=;
        b=ZS9nYjbx+yRamM7DKoEl4QaeCOAjcX3fnDKbaAvWMDwXmCYSl1ojRtQqhT8ssnsNPh
         U9T7513CmXvFO51kVe17xr5JmBcgZWHadIkJg0jZUEBODgj82diRMrn3Jxs7f/7MyJ3A
         X82eMpD5N1wnsAsH/19ISb4kjaCVoyo2F8n7u1H0fn0SRYnwB+6sCoOxqR4e4fCmVaQc
         a5u1LzpxS9MlybnQ3VhGyfnA0L3TPIq4bzkzAKNQPIl1gcXmO/AV1OnB51xR0CagvF2f
         ycqHO8Dcqs1UlWIWKJVKNL07F7jtXwSrJWyiKDduF5MQWyF2pno7ksJX+VmOcfAP6il5
         QIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870564; x=1745475364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmcYADO6Ts8LiEjQjRl2AEglFUJkqPE38Uht7fpIgwo=;
        b=PWTHQ7r10Hqg9d1Dh9pdsvU5Aw2Qh27iluNtzKueftcHCjPhU/VEaqoJ83XEYax834
         3CcHOSWn3ly/ASvFHQvR+0R7M9QWoM62vGhMPjevuqxMEvZ7CgkcRoGbiPqmMWQ42EEZ
         VzA5f3FkqF7EElkQDUZE4MdFijxn1DBLvloVtVd1fIXC3GWUet7cmN1UdiBn0PJx43Tz
         gdd9r/605E5TrcubwweSdpQH/JrLBeVKLT/lpQ8CjbVaX9dQwovK5EbgjZuSaI3wJJKk
         I4CiRoQqJQvN3nGrVS+OPjXF29EDirZ+Co3ZAlUJ9a15PBeIdwt3aigHEgsxnS94a3zA
         MP3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlBce691dnkRkw6B0HXpYZJrTKn9lk0dZD+TDLKCML+T92HLW9BI5fLMtbzRVGD5eGnDcsa+9Fq385zaUPy0c2@lists.infradead.org
X-Gm-Message-State: AOJu0YyGqUONWUi/4xqzbUPDJDDfeySRPkkygpmja9OE21Vti0i7/TTI
	Fe1dsRVkqhFVCu+B9/VyfXY2tqXqaTs6xSMbQjacf9XDa/YndVAD7z6WyBzDyKbzypswbRgZOYK
	CqOZi+PCtq2O30Cx0tljK/ZMQDug=
X-Gm-Gg: ASbGncvkCiMHJ/xgfryzPC5bw4IxvF70Epew7WTI+ifiQdgZC6yDe2iNOQEoAhecXz5
	ehOQSme9ykP0aUz5AHZWI3TGpw2iNl3W6ceuL5pIDIVXmI3+uH8oLg6QgCgVW0bMH9yrqSdOW0h
	T8zOXeJGaHtYpzGNMcmSa3MGsFSE8+JwYkX0iRlfXO7p18mM0l6kPgrx8=
X-Google-Smtp-Source: AGHT+IFKuzFZMBDi/GpEynCqLVtlNq8r4VkyTy96KVOsHsHaj4cpcrwJwQ/3ExydfNXFnduwqBQ1lh8ibHmlutTFGnI=
X-Received: by 2002:a05:622a:149:b0:477:4224:9607 with SMTP id
 d75a77b69052e-47ad80b4308mr56619511cf.12.1744870563720; Wed, 16 Apr 2025
 23:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com> <20250416201057.GB3811555-robh@kernel.org>
In-Reply-To: <20250416201057.GB3811555-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 10:15:59 +0400
X-Gm-Features: ATxdqUH_PzZ6LbO2fyRH_TSqVCYYVFFi8jocQlkWEwLVvGPaJEDpipkomz_BGGY
Message-ID: <CABjd4YyQVGZROse9kJtV1pEk0uk+=2h86cAyB1aCujg7+9SZEg@mail.gmail.com>
Subject: Re: [PATCH 02/13] dt-bindings: interrupt-controller: via,vt8500-intc:
 Convert to YAML
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_231604_973958_7A82AAD8 
X-CRM114-Status: GOOD (  21.38  )
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

On Thu, Apr 17, 2025 at 12:10=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Apr 16, 2025 at 12:21:27PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the VIA/WonderMedia interrupt
> > controller as YAML schema.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../interrupt-controller/via,vt8500-intc.txt       | 16 --------
> >  .../interrupt-controller/via,vt8500-intc.yaml      | 47 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  1 +
> >  3 files changed, 48 insertions(+), 16 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/via=
,vt8500-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/v=
ia,vt8500-intc.txt
> > deleted file mode 100644
> > index 0a4ce1051b0252bbbdeef3288b90e9913d3f16f0..00000000000000000000000=
00000000000000000
> > --- a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500=
-intc.txt
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -VIA/Wondermedia VT8500 Interrupt Controller
> > ------------------------------------------------------
> > -
> > -Required properties:
> > -- compatible : "via,vt8500-intc"
> > -- reg : Should contain 1 register ranges(address and length)
> > -- #interrupt-cells : should be <1>
> > -
> > -Example:
> > -
> > -     intc: interrupt-controller@d8140000 {
> > -             compatible =3D "via,vt8500-intc";
> > -             interrupt-controller;
> > -             reg =3D <0xd8140000 0x10000>;
> > -             #interrupt-cells =3D <1>;
> > -     };
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/via=
,vt8500-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
via,vt8500-intc.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a3fbe985db276e6a3b65cc6=
6c7de097ed0719c0c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500=
-intc.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/via,vt8500-int=
c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: VIA and WonderMedia SoCs Interrupt Controller
> > +
> > +maintainers:
> > +  - Alexey Charkov <alchark@gmail.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +
> > +properties:
> > +  compatible:
> > +    const: via,vt8500-intc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 8
>
> This wasn't in the original binding. Find to add, but note that in
> the commit msg. Here, what each of the 8 entries are must be defined.

Will do, thank you.

The primary interrupt controller only has a single line routed to the
CPU (out of the 8 outputs it technically has), while the (identical)
chained interrupt controller has all its 8 output lines routed to the
primary controller. There's not much difference between those outputs
other than the names IC1_IRQ0~7.

The original textual description only listed one interrupt, because it
worked ok with one interrupt (the chained controller can be configured
wrt. which output to trigger for each of the inputs, and those can all
be IC1_IRQ0), even though it is not a complete description of the
actual hardware.

Will reflect that in the commit message and descriptions.

Best regards,
Alexey

