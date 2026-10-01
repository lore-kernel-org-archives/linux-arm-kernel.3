Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2ACCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cv/AHEsBbnYG0BEg3b4FxMz/rNctK75WTcep6/1Bhe4=; b=B+xsPlI8nDD/0vy74S/ziO9tKv
	CxpwcHRhyZNnzhCt7ZI2qQ8RzayuCEuH6pofxRJ2njBNfC5/0+I3R/CEKc44EIuD9f/e1KI8UtDdf
	3ycpF/LVuVwlaGvFnTBLIKy9C35+4CxhNfCk65Y3MXeTJ4VU89fWH+V8kP3tJ34Gk42xJO/2OmoEj
	2ZZBs1RJb/WBAGK4W/9LR0eJXai+X9DpOkil4DXQt4meZnj7266dQ/1afqrWJeipa4BWa2EgSCDMT
	7kOD3MrziMEYsyu133dP2FtrdFIKsi0AM7ETl/vyYalW9nWLhQ0nATzgdJN9UESO4bhTPKzMyuxBG
	98H14gNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO3L-0000000AEfR-1ea8;
	Thu, 01 Oct 2026 21:10:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO3H-0000000AEdk-3FSX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:10:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45E3C440A5
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 21:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1451F00899
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 21:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889051;
	bh=Cv/AHEsBbnYG0BEg3b4FxMz/rNctK75WTcep6/1Bhe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ddwwBZ84yvtt1R2029E/eH4Z+7yntVZy5kecE9fWb7IL/X16zEkvTHQm2s0UHtQcX
	 Ns3orOrmaydJVkrCWEDl6C806roFrNuPim6F6ENsrWrS7t56jLiQE9VU/lUKpmXFl7
	 khh93F5bLaJv8wQY13t6bODnKGs5sXQPlUYw6Xo9X/ffULFOENIxyxCtAi3upzuMeb
	 Ve57/0L90zvXbqCoRR/SvxUZhkXP3Laankhc3W7eAMoQ3YOXShX/MYw8oblcX6CtGr
	 1NFg6hxgZx/asuCWf+DC13XBQjof4Bvh5Y6nOceYYZYVnHHiuKcIGbDd8sug65MmCx
	 rpEiVfol3riDw==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a652b710a5so70139621fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 14:10:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzl+yrVYevoiJDgARdwedn7LyhSuqBMkAOE7xlDKlvPF+F486g5vYoM6XCmxST7XEf8KLPpFkpjez63fatI713S@lists.infradead.org
X-Gm-Message-State: AFq9FYIfg2TYYbsS5q0QJmwKjhRVpriCt5iLMF1s0+4naa9hQ/tMoy58
	YYRRuGnF5dVt/o50VZBp5ByUGtnfLheZw78n7vWobdTqk8WR8/N1PqJz2LWcYXZlpneI6VvpSI2
	og1hhAAiSMrs5ytfhXoYWIkpIEMGOYrY=
X-Received: by 2002:a05:651c:1987:b0:3a5:b187:c7a3 with SMTP id
 38308e7fff4ca-3a87f7d8b35mr1130761fa.2.1790889049900; Thu, 01 Oct 2026
 14:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com> <20260930092020.1047221-2-y-abhilashchandra@ti.com>
In-Reply-To: <20260930092020.1047221-2-y-abhilashchandra@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 23:10:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLnok0bz9kXiW=O8+4fPBYvm9nG-AA-8CopDpc-DBvBiJA@mail.gmail.com>
X-Gm-Features: AclHuK_xn_-CKnIZzt8Aiza52a34qEVHcG5dNEDn3VR0fTXp_jLDfo12LQfvZZ0
Message-ID: <CAD++jLnok0bz9kXiW=O8+4fPBYvm9nG-AA-8CopDpc-DBvBiJA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add TI TDA54 pin controller
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, 
	vigneshr@ti.com, kristo@kernel.org, brgl@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, afd@ti.com, 
	u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Yemike,

thanks for your patch!

On Wed, Sep 30, 2026 at 11:21=E2=80=AFAM Yemike Abhilash Chandra
<y-abhilashchandra@ti.com> wrote:

> +      ti,debounce-select:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3, 4, 5, 6]
> +        description:
> +          Selects which DBOUNCE_CFGn period register in the control modu=
le
> +          drives the debounce filter for this pad. 0 disables debouncing=
,
> +          1 to 6 select DBOUNCE_CFG1 to DBOUNCE_CFG6.

What's wrong with the existing input-debounce property?

  input-debounce:
    $ref: /schemas/types.yaml#/definitions/uint32-array
    description: Takes the debounce time in usec as argument or 0 to disabl=
e
      debouncing

Just translate usec:s into your custom format in the code, problem solved.

> +      ti,virt-gpio-instance:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +        description:
> +          Selects which virtual GPIO instance controls this pad, allowin=
g
> +          protection between multiple virtual views of the GPIO control
> +          registers. Has no effect unless the pad is muxed to GPIO mode
> +          (muxmode 7).

Wow crazy stuff. OK keep it :D

> +      ti,wakeup:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +        description: |
> +          Wakeup event configuration for this pad.
> +          0 - wakeup disabled
> +          1 - wakeup triggered by any change of the pin input value
> +          2 - wakeup triggered by a low value on the pin
> +          3 - wakeup triggered by a high value on the pin

I just have the feeling this should be a generic property. It seems so usef=
ul.

Can you just add this as wakeup-mode =3D <custom value> in
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml

> +      ti,retention-bias:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2]
> +        description: |
> +          Enables the internal I/O pullup/pulldown resistor when pin ent=
ers
> +          TDA54 I/O retention mode, and configures the I/O pull resistor
> +          direction.
> +          0 - OFF mode pad pull resistor disable
> +          1 - Select OFF mode pulldown resistor
> +          2 - Select OFF mode pullup resistor

Use names inspired by the generic config types and flags instead
of enums.

ti,retention-bias-disable;
ti,retention-bias-pull-down;
ti,retention-bias-pull-up;

> +      ti,retention-offmode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description: |
> +          I/O behaviour when retention mode is active.
> +          0 - I/O maintains its previous state
> +          1 - I/O state is forced to the OFF mode value

Behaviour of *what*?

The driver stage?

I suspect you should make two bool flags
ti,retention-output-hold;
ti,retention-output-disable;

> +      ti,retention-output:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2]
> +        description: |
> +          Output driver behaviour while the pad is in retention mode.
> +          0 - output driver disabled
> +          1 - output driver enabled, pad driven low
> +          2 - output driver enabled, pad driven high

Make three flags:
ti,retention-output-disable;
ti,retention-output-low;
ti,retention-output-high;

> +      ti,retention-force:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description: |
> +          I/O retention controls.
> +          0 - gated by the Device Manager logic
> +          1 - forced active, overriding the Device Manager gating logic

This is clearly a bool flag. It should contain device-manager as that
magic entity is involved.

ti,retention-device-manager-enable;
ti,retention-device-manager-forced-active;

Both seems to be related to the device manager whatever that is.

> +      ti,isolation-bypass:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description: |
> +          I/O isolation for this pad.
> +          0 - isolation preserved
> +          1 - isolation bypassed

What does this even mean electronically speaking? Explain in a description:
statement.

ti,isolation-preserve;
ti.isolation-bypass-enable;

perhaps?

Some of the retention settings seem *very* generic, c.f. this
from include/dt-bindings/pinctrl/nomadik.h that has been
around forever:

#define SLPM_DISABLED           0
#define SLPM_ENABLED            1
#define SLPM_INPUT_NOPULL       0
#define SLPM_INPUT_PULLUP       1
#define SLPM_INPUT_PULLDOWN     2
#define SLPM_DIR_INPUT          3
#define SLPM_OUTPUT_LOW         0
#define SLPM_OUTPUT_HIGH        1
#define SLPM_DIR_OUTPUT         2
#define SLPM_WAKEUP_DISABLE     0
#define SLPM_WAKEUP_ENABLE      1

SLPM means "sleep mode", yeah pretty much retention...

I think the corresponding retention settings for things that are really
quite generic should just be added to the generic pin config bindings.

Yours,
Linus Walleij

