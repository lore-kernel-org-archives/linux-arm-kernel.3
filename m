Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A96C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 20:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icr7Gw3fR9KNLxGY4aIwjr+Jv1PB+GLfqSAalXNnBcA=; b=POlvEB6KHljBx6nxSmcDQocSSo
	aKfF+vVQBaAQGd2aXIq75/YsBTRxlx8xeQhRYff7feAoCQW2kCo7CFDUDTg+8udIjsT+WmexaI+Ii
	DRvyowyytAyg5uKlaPmH8oCtZ4TLhzaYdmLmvk03l07ZWOBSNhgbhbkQbj07OTUu1MvxRz1M0cvUG
	h5riNvh794s0+pvplqVzhog8CbcsUPmnN4byP70vs5vCz3h/OihhZe47ssSaRcARARbqom95ZuSqY
	u9Js9lSDyb7tG1x4GfXtjZAnAJfFUOjfA4ESqUY1tnXrbnzsFsnR3k9B12eofk1U0PIVMTEPUXCfI
	h63vCvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhwJY-00000006ksw-11Ii;
	Fri, 01 Aug 2025 20:25:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhwGw-00000006kcV-42pY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 20:22:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BB3D5C6415
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 Aug 2025 20:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4C8C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 Aug 2025 20:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754079754;
	bh=MBKqTrl7De+//6Sthfsz709YwDUNOv8L2Db7Ke4xXWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X2dRz8KsPcFAIvrgyvpuXjzwWt7NUAzIVzoAFgZPOHXMcBnQB/ns+D3rmUEPewuwj
	 4l0tJlZ0W2flmq9RAT/KKBAXwNaGcd/itess8hy9/F8PUCXEJdOOCAn/jQddu8idej
	 b6a+FnQYPX3ji1FfmyqfibpTTJnXLz1YkmWz94e25WY3JzwevDII56V0c3XOHNm0eo
	 C6bBTcyydZ3BTitYkdBlGCbngd8nM1UaevSOLIpz5bcKlW86JpiybJlW8PJ1IrZsCb
	 BNLidNqFe+THMNJfr3GrJhVF9gNssxjPmQR3r6hhMATSx++nwcXZUl13544816Seur
	 NSW1f+2WKOmpA==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af939afe5efso101382266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 13:22:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4wBzH+hk3HWKUUKs9Zcb0apxqhR8TCYqA2d1WiBKG8WXEZayN+N7quElN6v2XgCVYSCXidXHALr+lBvapBNqL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/lMQvZomWNL7R+4nyjjaQkGWAfIBjHMWAeVyUlVPqEMDA9hmA
	5/YLEav1ipY6vAE9deoahOb71Cc3tJ5gCc+AVCwX0SIyBQ6PSn4AijJr1v3Qnz62chKn9mNr3xf
	FU5LlzYxdbE6whDRqfigFWUad6d3b7A==
X-Google-Smtp-Source: AGHT+IF2FQeKqn3oxGhmUb/arfH4bLPa8tvubqqolJ6Gmcd5eN4grlIXOWVZzTj5MlHwqbzfRxzIVzfSZDCYorxRVRE=
X-Received: by 2002:a17:906:730d:b0:af2:7ccd:3429 with SMTP id
 a640c23a62f3a-af93ffb9343mr121622166b.9.1754079752556; Fri, 01 Aug 2025
 13:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250702230030.2892116-1-robh@kernel.org> <87qzxv5d7z.fsf@bootlin.com>
In-Reply-To: <87qzxv5d7z.fsf@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 1 Aug 2025 15:22:20 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+fV-W+PqZpvns5oFNyGXxKYYrHe1ipG7gj6dN-c2JJ6g@mail.gmail.com>
X-Gm-Features: Ac12FXzhED1_iNtqGkETiImlxD5HzfkBaY0XhZLrcDQxDOWi_frU1iKEaFUuOE4
Message-ID: <CAL_Jsq+fV-W+PqZpvns5oFNyGXxKYYrHe1ipG7gj6dN-c2JJ6g@mail.gmail.com>
Subject: Re: [PATCH] dt-binding: thermal: Convert marvell,armada-ap806-thermal
 to DT schema
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_132235_084258_2D8A92BA 
X-CRM114-Status: GOOD (  21.88  )
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

On Fri, Aug 1, 2025 at 9:27=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hi Rob,
>
> Sorry for the delay, I don't know why I forgot these.
>
> ...
>
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - marvell,armada-ap806-thermal
> > +      - marvell,armada-ap807-thermal
> > +      - marvell,armada-cp110-thermal
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description: overheat interrupt
> > +    maxItems: 1
> > +
> > +  '#thermal-sensor-cells':
> > +    description: Cell represents the channel ID. There is one sensor p=
er
> > +      channel. O refers to the thermal IP internal channel.
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
>
> IIRC on these Marvell designs, there was one (or more, I don't remember)
> Application Processor (AP) and several Co-Processors (CP).
>
> [On the AP]
> The AP8XX overheat interrupt was not directly wired to the GIC but was
> going through another intermediate IRQ controller named SEI (System
> Error Interrupt).
>
>       Thermal overheat IRQ -> SEI -> GIC
>
> [On the CP]
> There was one interrupt controller per CP11X named ICU, which would be
> connected to the top level GIC through MSIs. The ICU was however split
> into several sub-controllers reaching different areas on the GIC.
>
>                                       MSI
>       Thermal overheat IRQ -> ICU SEI -> GIC
>
> As the OS could not guess the internal connexions, I believe we had to
> include in the bindings the parent IRQ chip we were connected to. In the
> case of the thermal over heat interrupts, they were all going through an
> SEI controller (System Error Interrupt) which, if I still remember
> correctly, was not the default parent, hence the use of
> interrupts-parent/interrupts-extended in the examples.
>
> This is all a bit cloudy in my mind, but I believe these properties
> matter and with 'additionalProperties: false' and without
> interrupts-parent/interrupts-extended allowed, a real world DT
> snippet would not pass the binding checks.

'interrupt-parent' is implicitly allowed anywhere. Who is the parent
is outside the scope of the binding given it can vary.

> > +examples:
> > +  - |
> > +    thermal-sensor@80 {
> > +        compatible =3D "marvell,armada-ap806-thermal";
> > +        reg =3D <0x80 0x10>;
> > +        interrupts =3D <18>;
>
> I do not know how accurate the example must be, but maybe the example
> shall reflect the SEI connection as well.

No one has cared about converting the Marvell bindings, so *shrug*.

Really, the whole example should be deleted when/if the parent is
properly documented.

Rob

